Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8119CAC5B3
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:30 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.12460.1758809189248281998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AWTtOjpx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250925140627a529f393af000207b8-ht9fsh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250925140627a529f393af000207b8
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HljXyLeMNvbPN+W5UWLCwLgLeC+64SPPPdLBGfRruGE=;
 b=AWTtOjpxDbWLUfXwqrfDVvv6KdPvagix/QsTfEpUvKg21T1XFCkjwCnGiHn5mZzeHXu7vr
 5CpF3X07/foSkpdWDqzlxkBzw9ffN98d4A9f1SS7ivdCInqASZ5ta4JCiKlkSZmoCAwzqgTG
 25MRfZ6YzvEi51xxSB06t6Qm0/l8qe5QUowVn5hT6vaWmAyM6FXROWG3L+qQmEE+mH8He7lo
 3I062gyLjj8iLhFvsXCgf2lNNdgvO87f5UXalZabts5Gvp4i5LMNie3m6iIbRUqe5gCYftpv
 r5AKhWoT3wQ8QZFX8H/C+koXUA76GXobCcaaHjvf3DjrbvqLUWxqAP0g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 07/10] cups: patch CVE-2025-58364
Date: Thu, 25 Sep 2025 16:05:11 +0200
Message-Id: <20250925140514.1103300-7-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224036

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NVD report

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2025-58364.patch            | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58364.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index aa55d41b843..dd035634c57 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            file://CVE-2025-58060.patch \
+           file://CVE-2025-58364.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58364.patch b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
new file mode 100644
index 00000000000..0f155ee7366
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
@@ -0,0 +1,58 @@
+From e58cba9d6fceed4242980e51dbd1302cf638ab1d Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:53:49 +0200
+Subject: [PATCH] libcups: Fix handling of extension tag in `ipp_read_io()`
+
+Fixes: CVE-2025-58364
+
+CVE: CVE-2025-58364
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cups/ipp.c | 26 +-------------------------
+ 1 file changed, 1 insertion(+), 25 deletions(-)
+
+diff --git a/cups/ipp.c b/cups/ipp.c
+index 283e386b6..e1e361b2c 100644
+--- a/cups/ipp.c
++++ b/cups/ipp.c
+@@ -2949,31 +2949,6 @@ ippReadIO(void       *src,		/* I - Data source */
+ 	  */
+ 
+           tag = (ipp_tag_t)buffer[0];
+-          if (tag == IPP_TAG_EXTENSION)
+-          {
+-           /*
+-            * Read 32-bit "extension" tag...
+-            */
+-
+-	    if ((*cb)(src, buffer, 4) < 4)
+-	    {
+-	      DEBUG_puts("1ippReadIO: Callback returned EOF/error");
+-	      goto rollback;
+-	    }
+-
+-	    tag = (ipp_tag_t)((buffer[0] << 24) | (buffer[1] << 16) | (buffer[2] << 8) | buffer[3]);
+-
+-            if (tag & IPP_TAG_CUPS_CONST)
+-            {
+-             /*
+-              * Fail if the high bit is set in the tag...
+-              */
+-
+-	      _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("IPP extension tag larger than 0x7FFFFFFF."), 1);
+-	      DEBUG_printf(("1ippReadIO: bad tag 0x%x.", tag));
+-	      goto rollback;
+-            }
+-          }
+ 
+ 	  if (tag == IPP_TAG_END)
+ 	  {
+@@ -3196,6 +3171,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 
+ 	    if ((*cb)(src, buffer, (size_t)n) < n)
+ 	    {
++             _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to read IPP attribute name."), 1);
+ 	      DEBUG_puts("1ippReadIO: unable to read name.");
+ 	      goto rollback;
+ 	    }

