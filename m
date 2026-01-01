Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56C1EEB597
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 12:15:21 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103376.1767269719729967346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 04:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HV6jZtRs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260101121517fa9bd9f98e00020762-3i0kvq@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260101121517fa9bd9f98e00020762
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 13:15:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZTxluO9kuxEt3DT+R1Bt+vY9KIR41yGJfzI1P0b3cLI=;
 b=HV6jZtRsXYH82cTgwmYOMsd6HO3idjpIAOV0N/ZgCFrhaRHFG3Bmx9M++Ht1BSqe6wtTtk
 WQ+AMoEpCRBF8F+eSRxaOqf0YNA3W8YbER6TO5y0bXVXx/Wgh8UtXtMiSmfHCq8LBsSCkAkD
 foFzH/cZ05W+/7Y583JDpO+sfO8oCLo/8i+kx8ZHfEYgrP05NivsS5AFQyA1n0AuFLar6qxJ
 I+kMH6QW4tP3GAgmRBp0YE4K8OLK+7C7kO2FHaGBcbJuVc/arViI2d2EF032ap1Gg5fQNk98
 4HFWtROOOpXDOEzmAwhVz39XbNVPfZoG2jwkwBXTJSKPdaWme/bQw6hw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] cups: allow unknown directives in conf files
Date: Thu,  1 Jan 2026 13:14:59 +0100
Message-Id: <20260101121459.7191-3-peter.marko@siemens.com>
In-Reply-To: <20260101121459.7191-1-peter.marko@siemens.com>
References: <20260101121459.7191-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 12:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228819

From: Peter Marko <peter.marko@siemens.com>

Patch for CVE-2025-61915 by mistake causes fatal error on unknown
directives in configuration files.
The default configuration already contains unknown directive in
non-systemd setups:
Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf

Backport fix for this from 2.4.x branch which reverts this behavior.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 ...pping-scheduler-on-unknown-directive.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ce55a8ef6fa..f70c4e7026a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
 	   file://CVE-2025-58364.patch \
            file://CVE-2025-58436.patch \
            file://CVE-2025-61915.patch \
+           file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
new file mode 100644
index 00000000000..572a8941f40
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
@@ -0,0 +1,43 @@
+From 277d3b1c49895f070bbf4b73cada011d71fbf9f3 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 4 Dec 2025 09:04:37 +0100
+Subject: [PATCH] conf.c: Fix stopping scheduler on unknown directive
+
+Change the return value to do not trigger stopping the scheduler in case
+of unknown directive, because stopping the scheduler on config errors
+should only happen in case of syntax errors.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/277d3b1c49895f070bbf4b73cada011d71fbf9f3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scheduler/conf.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/scheduler/conf.c b/scheduler/conf.c
+index 7d6da0252..0e7be0ef4 100644
+--- a/scheduler/conf.c
++++ b/scheduler/conf.c
+@@ -2695,16 +2695,16 @@ parse_variable(
+   {
+    /*
+     * Unknown directive!  Output an error message and continue...
++    *
++    * Return value 1 is on purpose - we ignore unknown directives to log
++    * error, but do not stop the scheduler in case error in configuration
++    * is set to be fatal.
+     */
+ 
+-    if (!value)
+-      cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d of %s.",
+-		      line, linenum, filename);
+-    else
+-      cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d of %s.",
+-		      line, linenum, filename);
++    cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d of %s.",
++		    line, linenum, filename);
+ 
+-    return (0);
++    return (1);
+   }
+ 
+   switch (var->type)

