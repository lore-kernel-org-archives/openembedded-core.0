Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7B3C02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 16:36:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.18313.1737304596086272905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 08:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XEiRGY/r;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250119163633f28ce2842304612c66-sryc2n@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250119163633f28ce2842304612c66
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Jan 2025 17:36:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Gywda1n5eV1MQpvYAQHxojTexyZ30ESZAMzFCYv5B6w=;
 b=XEiRGY/rtMcE5FWkGph6O0kAlYfk9hct3qW94KQnVqUelFg8aXCuOy7SS/exJfmk+iQSdK
 8LcvUZsKTYXrvlrq+57sBqr4USMtbPoOCtxBFPRF56wd6A2U6wy0MRXiHbA0lxAX57CThA9M
 de8GPpx/xwW8ZBsxGmUMxZd0U+acmxwm0W+j98wuFN4CF6mlNgiEBiOwWEZ021/pGg0H5SkF
 hNtO2CUtHUbqtGdL9NxESqaRghTmWgiKfRMidQXis2f4V94/tj4r9xE+4ThEiMlo5Yt04y9E
 2nwkG78EEvdEllziLxJVeU3JlFeYr7lsF87VwNuj+JkQPj9Miu2dUb2w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ofono: patch CVE-2024-7540, CVE-2024-7541, CVE-2024-7542
Date: Sun, 19 Jan 2025 17:35:46 +0100
Message-Id: <20250119163546.318747-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 16:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210013

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch | 52 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
new file mode 100644
index 0000000000..0b06e057e5
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
@@ -0,0 +1,52 @@
+From 29ff6334b492504ace101be748b256e6953d2c2f Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Tue, 17 Dec 2024 11:31:28 +0200
+Subject: [PATCH] atmodem: sms: ensure buffer is initialized before use
+
+Fixes: CVE-2024-7540
+Fixes: CVE-2024-7541
+Fixes: CVE-2024-7542
+
+CVE: CVE-2024-7540
+CVE: CVE-2024-7541
+CVE: CVE-2024-7542
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ drivers/atmodem/sms.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/atmodem/sms.c b/drivers/atmodem/sms.c
+index d994856b..0668c631 100644
+--- a/drivers/atmodem/sms.c
++++ b/drivers/atmodem/sms.c
+@@ -412,7 +412,7 @@ static void at_cmt_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -479,7 +479,7 @@ static void at_cmgr_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -661,7 +661,7 @@ static void at_cmgl_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 	int index;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 8205ea683d..1083b91d56 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://CVE-2024-7545.patch \
     file://CVE-2024-7546.patch \
     file://CVE-2024-7547.patch \
+    file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.30.2


