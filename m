Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CEDC41513
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 14:47:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18862.1720190846026453559
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 07:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZT1GvDe+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95288240008;
	Fri,  5 Jul 2024 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720190844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0oMkU1sM+0WVZ3+ZrW8MOJy9gTT8/wCbYp8QCMdI6Ds=;
	b=ZT1GvDe+xL5Led+WVum8JLeRuIhPhqGY7KrqMw8ILgf2b5MchqPMA3YC1tE2zbd5bYa1ZX
	2cS4nTgpkUQZ6/g978sVdccZHa5agMKV7dR3kG8hCiUx9qfWb2EzBgriqSr9MKdIYTOtok
	vMbl5PwBTStislzHr6ODMTiV0/dK3acOrK4zrS/J5iIshlBEaVi/GRjjk+IBcEw/ATr2Ym
	4dRu9B87Gx0+LQasU4OTGwrFF+qGiDJpUJOBd7jRK6A0UeD+CDPz7XCcOFiP+BE7It4Hog
	VFctOUi40m7xoMq5rJsK7bheFCcRmRUzZOVjGMG7eHcdlaCPWPQVC/bf5MJkiA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] oeqa/utils/postactions: transfer whole archive over ssh instead of doing individual copies
Date: Fri,  5 Jul 2024 16:46:38 +0200
Message-ID: <20240705144638.441976-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705144638.441976-1-alexis.lothore@bootlin.com>
References: <20240705144638.441976-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 14:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201610

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Fixes [YOCTO 15536]

The postactions retrieval actions currently rely on scp executed
individually on any file or directory expanded from
TESTIMAGE_FAILED_QA_ARTIFACTS. Unfortunately, symlinks are not preserved
with this mechanism, which lead to big storage space consumption. Things
may go even worse if those symlinks create some circular chains. This
mechanism then needs to be updated to preserve symlinks instead of
following them during copy. There are multiple ways to do it:
- create a local archive on the target and execute scp on this file
- use rsync instead of scp for all files
- create an archive and pipe it to ssh instead of storing it onto the
  target

The first solution may create pressure on targets storage space, while the
second assumes that rsync is installed on the target, which may not be
true. So the third one is a compromise: tar is very likely present, at
least through busybox, and no disk space is used on the target.

Replace the current per-file scp call by a single call to tar run on the
target. Retrieve the generated compressed archive directly from SSH output,
and feed it to another tar process but on host, to uncompress and extract
it at the same place as before.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/utils/postactions.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index ecdddd2d40e3..f7ce25f2af8e 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -62,17 +62,16 @@ def get_artifacts_list(target, raw_list):
     return result
 
 def retrieve_test_artifacts(target, artifacts_list, target_dir):
+    import io, subprocess
     local_artifacts_dir = os.path.join(target_dir, "artifacts")
-    for artifact_path in artifacts_list:
-        if not os.path.isabs(artifact_path):
-            bb.warn(f"{artifact_path} is not an absolute path")
-            continue
-        try:
-            dest_dir = os.path.join(local_artifacts_dir, os.path.dirname(artifact_path[1:]))
-            os.makedirs(dest_dir, exist_ok=True)
-            target.copyFrom(artifact_path, dest_dir)
-        except Exception as e:
-            bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
+    try:
+        cmd = f"tar zcf - {" ".join(artifacts_list)}"
+        (status, output) = target.run(cmd, raw = True)
+        if status != 0 or not output:
+            raise Exception("Error while fetching compressed artifacts")
+        p = subprocess.run(["tar", "zxf", "-", "-C", local_artifacts_dir], input=output)
+    except Exception as e:
+        bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
 
 def list_and_fetch_failed_tests_artifacts(d, tc):
     artifacts_list = get_artifacts_list(tc.target, d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
-- 
2.45.2


