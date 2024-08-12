Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF37DC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 15:14:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.48907.1723475652888001365
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 08:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n/pBMK7b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40CA524000A;
	Mon, 12 Aug 2024 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723475651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoJr0vdvL/sZAsthQCtj/xLxJzzqQycUBq6etKXoatE=;
	b=n/pBMK7bplG8jq+NTq+ruRXWHAFzZsYSfDVAOVRftmNFeftQUoz7hMrjxKnU3Irzn0TZlX
	4MQ8ytaFBiCAejA9G1Jm1NV07iPJlWqTbbzhnW2QGilwO34NEP/nkbtxrjV66l/N6xRHYs
	wHt8jse/MV/t9Q91afqzIh7CncKrTgFsd4qA5jDn1MxF+GnDAGG5mn+nK0R7AT8buFDdbt
	bl61OzEVhi3XpiQhhk1Q7QFrxLkXvoliZu5JtfjZoapVLnwTxqT80EaRzM+GtHerqCNeqA
	XoImGmDji1UQtHbRY51fNkYKbm9w02p6Yk50nDncpVva+AIENzUGwIQNJrPcyg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] oeqa/postactions: do not uncompress retrieved archive on host
Date: Mon, 12 Aug 2024 17:14:04 +0200
Message-ID: <20240812151404.134030-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812151404.134030-1-alexis.lothore@bootlin.com>
References: <20240812151404.134030-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 15:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203229

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Current postaction module executes a remote tar command, pipe it in a SSH
connection, and uncompress the raw stream with another tar command. With
this command, the whole artifacts tree is directly available on the host
executing the test, but it is not very convenient if we want to download
the whole retrieved ptests directory.

Stop uncompressing the retrieved ptests archive onto host, just save the
archive as it is. The new output then looks like the following:

tmp/log/oeqa-artefacts
└── oeqa-target-artefacts-20240812-juzqdb80
    ├── host_disk_usage.txt
    ├── target_disk_usage.txt
    └── tests_artifacts.tar.gz

Suggested-By: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/utils/postactions.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 3b537146c50a..d5080523aa83 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -68,7 +68,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifacts_list, outputdir):
         (status, output) = tc.target.run(cmd, raw = True)
         if status != 0 or not output:
             raise Exception("Error while fetching compressed artifacts")
-        p = subprocess.run(["tar", "zxf", "-", "-C", outputdir], input=output)
+        with open(archive_name, "wb") as f:
+            f.write(output)
     except Exception as e:
         bb.warn(f"Can not retrieve artifacts from test target: {e}")
 
-- 
2.46.0


