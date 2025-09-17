Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3829ECAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:25 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.33518.1758139517703506939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FNx7gK6+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77ca260a887so189412b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139517; x=1758744317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH1JF5DFGgBS5/FkUUBhe0Ct8uwIV5WOcS4guufUYBY=;
        b=FNx7gK6+q2TvJ+qjvX+DCSIKi6PdXGqvcBOIRUOxyJIi9ezhBoiGSBfi3imTy3/Axn
         y0yTRqihhlpItoFykFyeuNvdB4qvOoSOo2JHjjKx3blkhKhNNSGsv5LZWkewzoHs0h1c
         0Q+1QKAP0RECpAhq4W1fU8g/g1ZOAUGV9JV3Xucyrxm3owdYcE7yeuYEbFCCQCEp0lSn
         3A0lydxlz8lCQDUioRab6x+f/kIMk9a0uTKWTsI1VG9D7f8XeYObiM58YIMKvwvi+Z0A
         7dqRNWmqP0OA8r0VlO5SRoENo8TooGg9WxOuBqZ1dcMPSjr1r+svewAWMgGt9I+wlHDt
         JbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139517; x=1758744317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HH1JF5DFGgBS5/FkUUBhe0Ct8uwIV5WOcS4guufUYBY=;
        b=aZr0XyC2K+QxI4rzD5WLAhXN81I83Uh3v98OLmg3NaQ8a4rAGBuLGOHZW/VYgL1kUN
         adaI49XgNNQxloA7VmWxUfiZV1KgoCpT1Xy7GxKotJh1kqZqH9cI84kPHZvbLMvmtbLP
         L203W2GsK43hrKMaZsiTRJSqTYmvL9Lp2+TaEjisKZArQBv/lG1y5cgCadLWxOyeBRZf
         EjKPky16yXNwp0N16Ql7tIdmOBGISdXmMfM5k+dSFRI/8E19QSdnVMeD/YEjdSdp8xwt
         Jbb/nUQNKmyN+uEN2A47LYT7RXCUZ+VavtXi4cSO6C+58BHq9bAdUexp5iFn0A+ATMoU
         cFuQ==
X-Gm-Message-State: AOJu0YydbWRbi9CVo0hoBR99QnIRl6Zw3u6Rnz8hRXJPasuwGXFyGpRI
	+EHK2LRbkYL7Mrrab9rI++3aEktm0kNpnXxuhXyxw9YRloXbeUT9bDxNxRytX3KphUKvT/OrK3u
	4Fepd
X-Gm-Gg: ASbGncsGtwuwmtgqhRDCMBhBjnmsb13g//+RazRrKCTa0kAvNKJOCtUBhwSH9do0A+Y
	FJ1wZKyvFEoQexMyaSzAw4F7PzjRyA/g8p5JS8m+5PiwHksAU31ip31DYyX9Q8ozIXOtAyUtetM
	7pVIpKGt9yXl5koem8F2nVDlGUC2b3DemLt401gvQQ7rEwbm9Wo8r7wmw+TMtDl2mx8+bR7jORc
	sYbjaXtCE5LrcUEcAE406iAl+GQXbjgoBh8MJ4ODHzNdJGR/CZv2q4zymeF+9XOBpQYDRmx1RPA
	SVkgyk+08VtwCIy/WN8GXkGhTfAf7UzLd4FkIT+2wI7D5brjzsZI3qOOI9Dc8ixieBhSCysWSH6
	ZNe/702P5qJy7DA==
X-Google-Smtp-Source: AGHT+IGeA1nNUMhuVuEj3Td5HB2zNWZHMqYmdjVs/1Ib47/be2U/swSwxbiZFeJXKflh+LEROyabvg==
X-Received: by 2002:a05:6a21:6d9f:b0:24d:9042:c856 with SMTP id adf61e73a8af0-27a97701057mr5168588637.17.1758139516891;
        Wed, 17 Sep 2025 13:05:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] cups: Fix for CVE-2025-58060 and CVE-2025-58364
Date: Wed, 17 Sep 2025 13:04:41 -0700
Message-ID: <6f3b7e6efdf14d080b74a48d8cdc445255e9025f.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223619

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221
& https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  2 +
 .../cups/cups/CVE-2025-58060.patch            | 60 ++++++++++++++++++
 .../cups/cups/CVE-2025-58364.patch            | 61 +++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58060.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58364.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 50db18d42a..0a26a9b6de 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2025-58060.patch \
+           file://CVE-2025-58364.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58060.patch b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
new file mode 100644
index 0000000000..4162fa2c27
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
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221]
+CVE: CVE-2025-58060
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58364.patch b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
new file mode 100644
index 0000000000..2be36e3b7a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
@@ -0,0 +1,61 @@
+From e58cba9d6fceed4242980e51dbd1302cf638ab1d Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:53:49 +0200
+Subject: [PATCH] libcups: Fix handling of extension tag in `ipp_read_io()`
+
+Fixes: CVE-2025-58364
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d]
+CVE: CVE-2025-58364
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ipp.c | 26 +-------------------------
+ 1 file changed, 1 insertion(+), 25 deletions(-)
+
+diff --git a/cups/ipp.c b/cups/ipp.c
+index 47ba9fa..9b7bf3f 100644
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
++		 _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to read IPP attribute name."), 1);
+ 	      DEBUG_puts("1ippReadIO: unable to read name.");
+ 	      goto rollback;
+ 	    }
+-- 
+2.25.1
+
-- 
2.43.0


