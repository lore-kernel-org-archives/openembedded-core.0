Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEBFCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 17:38:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.25068.1759858702295109464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 10:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OFTLWZmQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0DDE4E40F65
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAA29606C8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB597102F217A;
	Tue,  7 Oct 2025 19:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759858700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xmtnF0W+Ks7IHSqgRS7Fd/MGzAuW1RN1fOKaHFvhZqs=;
	b=OFTLWZmQ42jqFSxhH2qReMp6GnsOEijhTy8FycIGPpyG4b0SPTYi4OIT2F+XLUylWdwt8r
	rs1fevaOlPoo5/mWh0oQkqrudExg/rRn8u+Z9zc3F+b9Ec/gvIw3jGXcg8AVNsJnY7gsv4
	Ttr3eLH6AdK5WVeCjsP4UcTf11DGQ0HvqvWQEzd2pESx4NsXDNA1h2c8J/pMJEAJbtull6
	gQXP8Pg0uWKRNwI2ROLAri/cqq2WsZE89zPjMsficEHwM+3PLOWSOKM8U7sn8YVhjP+F1l
	hDyanHnxJuj5jEjVrDYPW6vQoaJFVQ91twr3QmoKwL3q6F0BNKjOTkmnoAMPnA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 07 Oct 2025 19:38:08 +0200
Subject: [PATCH 3/4] oeqa: postactions: Ignore SSH errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-mathieu-ssh-fails-v1-3-a6affee3571b@bootlin.com>
References: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
In-Reply-To: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759858696; l=1530;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=w1NA7niLsdJFMcf75EMp2GCnCXhPsCYM5qplO9iDxlo=;
 b=Czj1ylsfsi86nOmM35Os1JNimAITobVsHFr4pYXsW6OFYTHOtyplG3uts8JiCP47gGkDZ2v3h
 jm5dL4pTz/kBovmFYTftYXuVUvRHz9/3FvjPwy19/CiyO8nzpEtJi9t
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 17:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224547

Postactions are not part of the tests but allow to retrieve useful data
from the target. They try to do this using SSH, but this can fail when
no SSH server is present on the target. Ignore these fails.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/utils/postactions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index c69481db6cbf29b5e3f267170151d85e73baa0d0..7b967edaad0f0a418347f18a7fa85073672ceeff 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -22,7 +22,7 @@ from oeqa.utils import get_artefact_dir
 def get_target_disk_usage(d, tc, artifacts_list, outputdir):
     output_file = os.path.join(outputdir, "target_disk_usage.txt")
     try:
-        (status, output) = tc.target.run('df -h')
+        (status, output) = tc.target.run('df -h', ignore_ssh_fails=True)
         with open(output_file, 'w') as f:
             f.write(output)
             f.write("\n")
@@ -49,7 +49,7 @@ def get_artifacts_list(target, raw_list):
     for raw_path in raw_list.split():
         cmd = f"for p in {raw_path}; do if [ -e $p ]; then echo $p; fi; done"
         try:
-            status, output = target.run(cmd)
+            status, output = target.run(cmd, ignore_ssh_fails=True)
             if status != 0 or not output:
                 raise Exception()
             result += output.split()

-- 
2.47.3


