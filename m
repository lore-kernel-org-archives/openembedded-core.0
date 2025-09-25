Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80BBCAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:30 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.12681.1758809185221657696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WjTMrc4s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250925140622d06a669b4300020703-rd4fab@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250925140622d06a669b4300020703
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xwVpbddGwHGuIfTSNJNEqABeUlVqSGw7PAvjxucL4K0=;
 b=WjTMrc4sboGAyvwQ/VWQFzZdkmCnQm1JNj07uwvH/Fbx+g4jNGRplModdXszgSL73+9bgp
 gWcL9gr9F35tyWMgs8qkaCYvKHvGUkU4BvbSTQVAjcRpiI3/QD7bPFQZQVWT6yNKGZXUxivq
 ZyncfOkYr3P43nTZye+SUaqdHLirhHrQtIYoa2y7KPq5QlvfP7JYAs+lbo8tpnug1t87cZ1e
 pCbPSpsWU6shxwdAEShkUXgiLB14Fgy2bOajht8Q4CfR36hl1qM4XTaBtKNUSAGqEgW7GOI1
 w8s1PGeWXbsYmfbtzU0JmS+zWIpadhMKrQ4io3R/AEeEA2xGLmTa4lKQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 06/10] cups: patch CVE-2025-58060
Date: Thu, 25 Sep 2025 16:05:10 +0200
Message-Id: <20250925140514.1103300-6-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224035

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2025-58060.patch            | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58060.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b8761df0d57..aa55d41b843 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2025-58060.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58060.patch b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
new file mode 100644
index 00000000000..adb1f10a054
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
@@ -0,0 +1,60 @@
+From 595d691075b1d396d2edfaa0a8fd0873a0a1f221 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:44:59 +0200
+Subject: [PATCH] cupsd: Block authentication using alternate method
+
+Fixes: CVE-2025-58060
+
+CVE: CVE-2025-58060
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scheduler/auth.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 5fa53644d..3c9aa72aa 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -513,6 +513,16 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     int	userlen;			/* Username:password length */
+ 
+ 
++   /*
++    * Only allow Basic if enabled...
++    */
++
++    if (type != CUPSD_AUTH_BASIC)
++    {
++      cupsdLogClient(con, CUPSD_LOG_ERROR, "Basic authentication is not enabled.");
++      return;
++    }
++
+     authorization += 5;
+     while (isspace(*authorization & 255))
+       authorization ++;
+@@ -558,7 +568,6 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     * Validate the username and password...
+     */
+ 
+-    if (type == CUPSD_AUTH_BASIC)
+     {
+ #if HAVE_LIBPAM
+      /*
+@@ -727,6 +736,16 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+ 					/* Output token for username */
+     gss_name_t		client_name;	/* Client name */
+ 
++   /*
++    * Only allow Kerberos if enabled...
++    */
++
++    if (type != CUPSD_AUTH_NEGOTIATE)
++    {
++      cupsdLogClient(con, CUPSD_LOG_ERROR, "Kerberos authentication is not enabled.");
++      return;
++    }
++
+ #  ifdef __APPLE__
+    /*
+     * If the weak-linked GSSAPI/Kerberos library is not present, don't try

