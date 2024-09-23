Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C3BCF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.36266.1727097248039959626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eZy+DOT9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-719b17b2da1so1086145b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097247; x=1727702047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khzv1veR7rGRbdKzDCf5s6R1/MLD1NsePs3aXIBIvqI=;
        b=eZy+DOT9mA5afE5n7DoP+S2QMTeO1F/zqtcceihiyy3kx1tWq2gZ7YsAU8bThOFYVi
         HWEE61NYDgWAT74k65UNT78UccFupuhqx6jkwYXkRweCaHcOD4WEYo1QAg/EAr2FwUbQ
         7eoE5tz+KW9y2KxlscYmMVc1sYS7kn8gpiE5jknn20iz58AD9GFsOoe6YJFb/5Hm6SwZ
         Wm9jF6q6x8sFBk2uGvjIqAG+7lgkZuw9YRCLr3fBfMPTS6wQhBgEvXXYO9+v2fPLcaYE
         JJD4AhpuFD4KlOB1z53nvNGdSUB25Pi3AyHNJB++ezGKIYrmGIm2tcveM6KsUcs5BH5Q
         Mvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097247; x=1727702047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khzv1veR7rGRbdKzDCf5s6R1/MLD1NsePs3aXIBIvqI=;
        b=A7mgZi7QuQGJWfWNS1+j+l3HC+2Ik5QUVEp7Kxi5A6hhpZguQrSdDXDjsZ2JrAHSGs
         TrvL3bSKqP+yLMvOxY5DEnrrjZpvE2soSVp3Q/MziJ7NThDbYEyAFQaVgrefi8lWijfz
         ESREZyCsn0iQqBlx82+oz+jKiGvmODIClKo1WvA5AGN0NDK/ECQfamDGdQTzO3AGXVeK
         fKFnK4tQHqkuvgzsKLeU5rW0XGLmVz8DUnXJb8lctI8oqte92ZHuhm1jQgfaX0b37/iK
         I1pFU/SCJfB+sf+EBHw7hv1tBo3AWhHFKi0+yh542n5CHdQOBpGEldkPgFZMQVjgRiHw
         p9Mg==
X-Gm-Message-State: AOJu0YzkAQQJrWVBT9yi/3+d0kBRHQNOhCgz2ZivN4yf0+bpDlnox5Nm
	UyjJEYv9y6Y/cIMprDqG3PHq/569j3n/K60mAK64HnTF8w7yuixwyKlx8BxQl9r9RF2xyNvWKUJ
	rM6I=
X-Google-Smtp-Source: AGHT+IFhiaH78rosVEVm+06qdEaPbxqwi4f7cAtNVMegjg+Ywh8AgAcpccb2E//GA0/e0kijIvGeJA==
X-Received: by 2002:a05:6a00:1823:b0:718:d5f4:6e95 with SMTP id d2e1a72fcca58-7199c97ce0dmr15867376b3a.3.1727097247075;
        Mon, 23 Sep 2024 06:14:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] cups: Security fix for CVE-2024-35235
Date: Mon, 23 Sep 2024 06:13:44 -0700
Message-Id: <7fadda8f9605f826744438cefc35658047bbdb01.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204809

From: Rohini Sangam <rsangam@mvista.com>

CVE fixed:
- CVE-2024-35235: cups: Cupsd Listen arbitrary chmod 0140777
Upstream-Status: Backport from https://github.com/OpenPrinting/cups/commit/a436956f374b0fd7f5da9df482e4f5840fa1c0d2, https://github.com/OpenPrinting/cups/commit/e3952d3ecd231588bb382529281a294124db9348#diff-6fc0a5ba57f83c8177d28f44729276fe35fcaaceae8b774481e6973fcbdf733d

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2024-35235.patch            | 121 ++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-35235.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 047ab33898..6d5cf3b588 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://CVE-2023-34241.patch \
 	   file://CVE-2023-32360.patch \
 	   file://CVE-2023-4504.patch \
+	   file://CVE-2024-35235.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-35235.patch b/meta/recipes-extended/cups/cups/CVE-2024-35235.patch
new file mode 100644
index 0000000000..d7a2d426af
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-35235.patch
@@ -0,0 +1,121 @@
+From a436956f374b0fd7f5da9df482e4f5840fa1c0d2 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Mon, 3 Jun 2024 18:53:58 +0200
+Subject: [PATCH] CVE-2024-35235: Fix domain socket handling
+
+- Check status of unlink and bind system calls.
+- Don't allow extra domain sockets when running from launchd/systemd.
+- Validate length of domain socket path (< sizeof(sun_path))
+
+Upstream-Status: Backport from https://github.com/OpenPrinting/cups/commit/a436956f374b0fd7f5da9df482e4f5840fa1c0d2, https://github.com/OpenPrinting/cups/commit/e3952d3ecd231588bb382529281a294124db9348#diff-6fc0a5ba57f83c8177d28f44729276fe35fcaaceae8b774481e6973fcbdf733d
+CVE: CVE-2024-35235
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ cups/debug-internal.h |  4 +--
+ cups/http-addr.c      | 36 ++++++++++---------
+ scheduler/conf.c      | 20 +++++++++++
+ 3 files changed, 41 insertions(+), 19 deletions(-)
+
+diff --git a/cups/debug-internal.h b/cups/debug-internal.h
+index 2b57854..2e1a56a 100644
+--- a/cups/debug-internal.h
++++ b/cups/debug-internal.h
+@@ -59,10 +59,10 @@ extern "C" {
+ 
+ #  ifdef DEBUG
+ #    define DEBUG_puts(x) _cups_debug_puts(x)
+-#    define DEBUG_printf(x) _cups_debug_printf x
++#    define DEBUG_printf(...) _cups_debug_printf(__VA_ARGS__)
+ #  else
+ #    define DEBUG_puts(x)
+-#    define DEBUG_printf(x)
++#    define DEBUG_printf(...)
+ #  endif /* DEBUG */
+ 
+ 
+diff --git a/cups/http-addr.c b/cups/http-addr.c
+index 114a644..610e9db 100644
+--- a/cups/http-addr.c
++++ b/cups/http-addr.c
+@@ -206,27 +206,29 @@ httpAddrListen(http_addr_t *addr,	/* I - Address to bind to */
+     * Remove any existing domain socket file...
+     */
+ 
+-    unlink(addr->un.sun_path);
+-
+-   /*
+-    * Save the current umask and set it to 0 so that all users can access
+-    * the domain socket...
+-    */
+-
+-    mask = umask(0);
++    if ((status = unlink(addr->un.sun_path)) < 0)
++    {
++      DEBUG_printf("1httpAddrListen: Unable to unlink \"%s\": %s", addr->un.sun_path, strerror(errno));
+ 
+-   /*
+-    * Bind the domain socket...
+-    */
++      if (errno == ENOENT)
++	status = 0;
++    }
+ 
+-    status = bind(fd, (struct sockaddr *)addr, (socklen_t)httpAddrLength(addr));
++    if (!status)
++    {
++      // Save the current umask and set it to 0 so that all users can access
++      // the domain socket...
++      mask = umask(0);
+ 
+-   /*
+-    * Restore the umask and fix permissions...
+-    */
++      // Bind the domain socket...
++      if ((status = bind(fd, (struct sockaddr *)addr, (socklen_t)httpAddrLength(addr))) < 0)
++      {
++	DEBUG_printf("1httpAddrListen: Unable to bind domain socket \"%s\": %s", addr->un.sun_path, strerror(errno));
++      }
+ 
+-    umask(mask);
+-    chmod(addr->un.sun_path, 0140777);
++      // Restore the umask...
++      umask(mask);
++    }
+   }
+   else
+ #endif /* AF_LOCAL */
+diff --git a/scheduler/conf.c b/scheduler/conf.c
+index 535d40f..3a2eec2 100644
+--- a/scheduler/conf.c
++++ b/scheduler/conf.c
+@@ -3074,6 +3074,26 @@ read_cupsd_conf(cups_file_t *fp)	/* I - File to read from */
+       cupsd_listener_t	*lis;		/* New listeners array */
+ 
+ 
++      /*
++      * If we are launched on-demand, do not use domain sockets from the config
++      * file.  Also check that the domain socket path is not too long...
++      */
++
++#ifdef HAVE_ONDEMAND
++      if (*value == '/' && OnDemand)
++      {
++        if (strcmp(value, CUPS_DEFAULT_DOMAINSOCKET))
++          cupsdLogMessage(CUPSD_LOG_INFO, "Ignoring %s address %s at line %d - only using domain socket from launchd/systemd.", line, value, linenum);
++        continue;
++      }
++#endif // HAVE_ONDEMAND
++
++      if (*value == '/' && strlen(value) > (sizeof(addr->addr.un.sun_path) - 1))
++      {
++        cupsdLogMessage(CUPSD_LOG_INFO, "Ignoring %s address %s at line %d - too long.", line, value, linenum);
++        continue;
++      }
++
+      /*
+       * Get the address list...
+       */
+-- 
+2.35.7
+
-- 
2.34.1


