Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794E4C79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 15:27:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37754.1788794829378480702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 08:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zIu6m6l9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 447C61A1A3A
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Sep 2026 15:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 143CD60383
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Sep 2026 15:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D54711C7AF29;
	Mon,  7 Sep 2026 17:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788794822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=irONESxbq4czCJyijTHVXMxl2Tq94eoJoDXRDrJfJ7s=;
	b=zIu6m6l9DAPZOqTY6iz7Ny3eC8e7ENUCSSM2NjQcWBENDbXB7jerAj4+6ciSx1CgTH0UkJ
	Mgr4jEef7CZO4JZBmz54DmZ0XrjD3TZStfe8+b82JR+WpMBrsnT0icypQ8KKhd8LsC+hjM
	w0HA1g7S/c9VuWt9n3sn24QlTfMti8VYYjxfalf2Wm1dE3oMB0BuzC1IMn1Of14VhLjS+P
	a4oHIEEXTtgXZmsuGfaTf71yWkk6aYocdzZ5uaaLgLI5EPzuuEv9egZs/hg6cBwJvp7Zb+
	Zz5tTIOEDRWG15XkaITgMQiFQKus+jwSuty2b9YxIIZblyMFy08bAvD2mmTU5Q==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 07 Sep 2026 17:27:00 +0200
Subject: [PATCH] sstate-cache-management: check also SSTATE_DIR environment
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-sstate-cache-management-sstate-dir-v1-1-ed1a8ad1be0d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXNwQrCMBCE4VcpezaQphLRVxEPazJtV2iUbCpC6
 bsbLT1+c/hnIUUWKF2ahTLeovJMFe2hoTByGmAkVpOzztuzPRnVwgUmcBhhJk48YEIq+x4lmxb
 OHX3set8x1dAro5fP/+R626zz/YFQfmVa1y8lOhNUhgAAAA==
X-Change-ID: 20260907-sstate-cache-management-sstate-dir-1e2246d3f63a
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 15:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245300

Support KAS users by recognizing the SSTATE_DIR environment variable for
configuring the sstate cache directory, as documented in [1]. Yocto
respects this variable since KAS includes it in
BB_ENV_PASSTHROUGH_ADDITIONS.

This improves usability for the many users relying on KAS.

[1] https://kas.readthedocs.io/en/latest/userguide/env-vars.html#variables-glossary

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 scripts/sstate-cache-management.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
index 303b8f13a349..f5737004c544 100755
--- a/scripts/sstate-cache-management.py
+++ b/scripts/sstate-cache-management.py
@@ -202,9 +202,10 @@ def parse_arguments():
 
     parser.add_argument(
         "--cache-dir",
-        default=os.environ.get("SSTATE_CACHE_DIR"),
-        help="""Specify sstate cache directory, will use the environment
-            variable SSTATE_CACHE_DIR if it is not specified.""",
+        default=os.environ.get("SSTATE_CACHE_DIR") or os.environ.get("SSTATE_DIR"),
+        help="""Specify the sstate cache directory. Defaults to the value of the
+            SSTATE_CACHE_DIR environment variable, or SSTATE_DIR if SSTATE_CACHE_DIR
+            is not set.""",
     )
 
     # parser.add_argument(

---
base-commit: 47021aa89adb81c822e8ec37f17266197914f6b8
change-id: 20260907-sstate-cache-management-sstate-dir-1e2246d3f63a

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


