Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A1C02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 16:38:46 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.18347.1737304716466875861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 08:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VLt9BD3S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025011916383463f450eb3b0eb66949-xbgrj_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025011916383463f450eb3b0eb66949
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Jan 2025 17:38:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wlT5VUnqNxwueznD7S/d/nF6RXaoH/XECIonwu0LRQ4=;
 b=VLt9BD3SIMf84udPk9/t2c4WOUl1GEdViRrek/N0WYvrmS3SA1qtjfM+D+BE/P5oakvSyG
 wkr2xiqSfBOEKQ5ieGNIKNQ10SjFUpqpM55yA+bwjcx83n51mzAvFt75qsPmOURZIYxJCCRy
 c/YWsFdgpj+OjrTfeJCKA3aA+ZDHdfynXDSmlvDPWoqwP7uCib6f3uh7HLLl2weD0mMhnbuy
 SypBF80HBz/6sVYcrBBqKr0x920JcNsg3Sf2kTZkcCucgOPw7YILSN8o9Y+1oy3E85AUOo+a
 cu3LjNcseu41y4P8+tiiM8iOPdXu2z9+VrtWAIzESgYEGnX1vfkb1PSg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/3] ofono: patch CVE-2023-4235
Date: Sun, 19 Jan 2025 17:37:32 +0100
Message-Id: <20250119163732.318935-3-peter.marko@siemens.com>
In-Reply-To: <20250119163732.318935-1-peter.marko@siemens.com>
References: <20250119163732.318935-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 16:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210016

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=02aa0f9bad3d9e47a152fc045d0f51874d901d7e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ofono/ofono/CVE-2023-4235.patch           | 38 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
new file mode 100644
index 0000000000..059f9bbfee
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
@@ -0,0 +1,38 @@
+From 02aa0f9bad3d9e47a152fc045d0f51874d901d7e Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:51 +0200
+Subject: [PATCH] smsutil: check deliver reports fit in buffer
+
+Fixes CVE-2023-4235
+
+CVE: CVE-2023-4235
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=02aa0f9bad3d9e47a152fc045d0f51874d901d7e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/smsutil.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 484bfd0b..ac89f16c 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1240,10 +1240,16 @@ static gboolean decode_deliver_report(const unsigned char *pdu, int len,
+ 			return FALSE;
+ 
+ 		if (out->type == SMS_TYPE_DELIVER_REPORT_ERROR) {
++			if (expected > (int) sizeof(out->deliver_err_report.ud))
++				return FALSE;
++
+ 			out->deliver_err_report.udl = udl;
+ 			memcpy(out->deliver_err_report.ud,
+ 					pdu + offset, expected);
+ 		} else {
++			if (expected > (int) sizeof(out->deliver_ack_report.ud))
++				return FALSE;
++
+ 			out->deliver_ack_report.udl = udl;
+ 			memcpy(out->deliver_ack_report.ud,
+ 					pdu + offset, expected);
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index a6a4852a63..5ae63e6ef6 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://CVE-2024-7547.patch \
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
     file://CVE-2023-4232.patch \
+    file://CVE-2023-4235.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
-- 
2.30.2


