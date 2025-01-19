Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C298C02188
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 16:38:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.18182.1737304708899787374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 08:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jQUTjFMx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025011916382667c84db81f8fb56988-c1u5og@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025011916382667c84db81f8fb56988
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Jan 2025 17:38:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0aa5nWbhIdTIZ7vFlUL8WCk2PS0vEohElAnjtnG+1lw=;
 b=jQUTjFMx5824IcAaXtgEgQroUtWuWlodO5I2O1X8xpeJPoOQJ1wWHaGVtEPwVTeW/bWmRk
 XOGsnLdtlEwZTlHIVqurjw07VwO7OoneFf9UGrfYLoXkO+MyvxvjkSvy1uKzDEQpwfiSURhZ
 m+rjL4Biub7pPjuWCBSOzaOy2bcvNfbByOA3t5Rmpbgr8fwWlPtKgnemiaCttJfZmEpqclWd
 xaysMGsiueAS90lXHufTHGF4Bod/M1X88f1pnMuX5+SQMnDB3c2AezYcV0usToTv+611hham
 g/MvldOlcQsx5HuYW1IxRAnnR2NO81imk1WppIa2GB8PWwUtTumBtuuQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/3] ofono: patch CVE-2023-4232
Date: Sun, 19 Jan 2025 17:37:31 +0100
Message-Id: <20250119163732.318935-2-peter.marko@siemens.com>
In-Reply-To: <20250119163732.318935-1-peter.marko@siemens.com>
References: <20250119163732.318935-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 16:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210015

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=2ff2da7ac374a790f8b2a0216bcb4e3126498225

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ofono/ofono/CVE-2023-4232.patch           | 31 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
new file mode 100644
index 0000000000..516cbf779c
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
@@ -0,0 +1,31 @@
+From 2ff2da7ac374a790f8b2a0216bcb4e3126498225 Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:52 +0200
+Subject: [PATCH] smsutil: check status report fits in buffer
+
+Fixes CVE-2023-4232
+
+CVE: CVE-2023-4232
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=2ff2da7ac374a790f8b2a0216bcb4e3126498225]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index ac89f16c..a706e26f 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1088,6 +1088,9 @@ static gboolean decode_status_report(const unsigned char *pdu, int len,
+ 		if ((len - offset) < expected)
+ 			return FALSE;
+ 
++		if (expected > (int)sizeof(out->status_report.ud))
++			return FALSE;
++
+ 		memcpy(out->status_report.ud, pdu + offset, expected);
+ 	}
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index 097a0e0566..a6a4852a63 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
     file://CVE-2024-7546.patch \
     file://CVE-2024-7547.patch \
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
+    file://CVE-2023-4232.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
-- 
2.30.2


