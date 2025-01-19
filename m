Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92251C02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 16:35:46 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.18289.1737304537119637681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 08:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RgoJn4N2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202501191635338e6ca509fb86fc5ef3-bprkxk@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202501191635338e6ca509fb86fc5ef3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Jan 2025 17:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iInC994T1RE/5o0el6aWpRZIbjR0IyZZOe93vgTHe9I=;
 b=RgoJn4N27bJQnfWe+1oHM/jbFdG8OU7ER5gem2fhMk9skdW23iTO67JlzajPNja0+CpWo1
 2678Rsnm8d6g9MC7E9uIWWN+2npMtb5aFY9KvBNn3Nksm3xn5FkWSYT9A7iQom5BR5AETEZh
 OfgWiETMs4xc7Nd0N9Si3l5fOyAt7j1pNls6HDnadj4nKDms6F3p6JZiWZSY5l0nNlGfnaod
 /WJRx1jA8OkXnZM3JO5SMoNLnnfj49x0dYMzoIL4oItpgYBNTrZ30Xw6CZFvoJBeTMPYGaUI
 gTvgDgcxXEk1/Ht1GESzSyFTjr0H0pZ7Z0hy8wWMavAQcsxcgrmkF7Nw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] ofono: patch CVE-2024-7540, CVE-2024-7541, CVE-2024-7542
Date: Sun, 19 Jan 2025 17:34:38 +0100
Message-Id: <20250119163438.318539-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 16:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210012

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch | 52 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.14.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
new file mode 100644
index 0000000000..fd97d4b51b
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
+@@ -399,7 +399,7 @@ static void at_cmt_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -466,7 +466,7 @@ static void at_cmgr_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -648,7 +648,7 @@ static void at_cmgl_notify(GAtResult *result, gpointer user_data)
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
diff --git a/meta/recipes-connectivity/ofono/ofono_2.14.bb b/meta/recipes-connectivity/ofono/ofono_2.14.bb
index 34e919ef5a..9a91afaa7b 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.14.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     file://rmnet.patch \
     file://ofono \
     file://CVE-2024-7539.patch \
+    file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
 "
 SRC_URI[sha256sum] = "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f"
 
-- 
2.30.2


