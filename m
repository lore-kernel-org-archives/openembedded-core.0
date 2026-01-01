Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4724EEB588
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 12:15:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103370.1767269694910034143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 04:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=H5grDDT7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026010112145160869ab932000207d8-qyydnr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026010112145160869ab932000207d8
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 13:14:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=GO6DocDO9qhF23t50iTUzsBbDq1oB1/8wJ8xKu7y6FY=;
 b=H5grDDT75thqgoA6yEiPrRMpAjsHr2Ma1r0fydZxpBgQCgfvwAdtKK620lT4alafSSsrVu
 qSI6iesgNggCnCLQt3OmV8CIlcIto+2zfAekE1OSm8FZbglZ7eqQdiJAnUDiW11lUvuB/iWK
 oMKaRDTXzkxg5QL3uJgcQDnEY4ZyGjdVvoueZ2ir6hMe6dYhTJjD+c4kC0L+v4KZd3WgdSjC
 nDqGeZpaf1f2IiNLALX+Zt0H5mpKIhj5FRzva0GItxtHRniGYC0ethsHFwSa2yjSZ8duR8zG
 A36x/NcBSkbETdTQzs3HfAfExKN1xKufFa82l41SDwk9se7LnJ/AAJ8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] cups: allow unknown directives in conf files
Date: Thu,  1 Jan 2026 13:14:43 +0100
Message-Id: <20260101121443.7165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 12:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228816

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
index 12668ca023c..c7475d2b813 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2025-58364.patch \
            file://CVE-2025-58436.patch \
            file://CVE-2025-61915.patch \
+           file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
new file mode 100644
index 00000000000..cf01c82cd63
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
+@@ -2697,16 +2697,16 @@ parse_variable(
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

