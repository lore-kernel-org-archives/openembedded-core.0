Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8653C78830
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 12:04:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.16294.1726833857135828210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 05:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hXHA0ARr;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: rsangam@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2055f630934so16930725ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726833856; x=1727438656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mPMc8xOfcnRWOv9FcIeGMyQKlrHqryUzQc2s6Tp+jU=;
        b=hXHA0ARrZKAokAhqksMPwH5Eu+UC+sdGiUgviBZ4TNbEYJOGKuQBU8geix0fdRrQar
         lHVkDQ1V5VakYizEd2lOnT3zhlCJv7DhJGkk8sKVXvHhc8dGL8oBfqAntks/raRGOhau
         0tbL4fbtBrTcOM4vrMvRANwfCJ6/XDxUnoWxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726833856; x=1727438656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mPMc8xOfcnRWOv9FcIeGMyQKlrHqryUzQc2s6Tp+jU=;
        b=qrNz+pl4BZlm158W0PJ5NdIF41AVkpdn/MvbQFQzR7TPAM2Ozphr45ae2EKSuvHYTy
         qgHvPAAPqPmhOFYfd6DDVkRmCbt6/T2Abo16vRz0rKsQdkot3a/8MnKRDoZr10/F+ssl
         13QL1FZRHHNsme9T7VTZZFGr1dLMbSLYfTJhUO3iSKSKeN4auu/lj1MzfpVhXmO1dOke
         AVUmBTmMyga5C6wvArzl0zjSzE7Jpnq8uEFdGYf99Wxc/7UGxBYfsEHqJJ5Oo8+CCRdQ
         MxiuwMXYvywRUl9k1cRvK7KSjiz1xc3raX0UVib+69bSPOuJd4GiRoXCYe++JWdgc94a
         BYPA==
X-Gm-Message-State: AOJu0YwyMZ6yqHAszsjBsxg+OMTzdbKNxZ7huS32UHIM8mbh9Sw1i4AB
	zoqmoHPwFqFLWKoJss5mwrZlrBaRMBY8fhJQ5aljoAoITwYF9ib2zfsyS7/9jMKfRYw/HdUsAi2
	q
X-Google-Smtp-Source: AGHT+IEK/z+tN2fwWTEx5GXgj5WeQ7S1zjXhpuorZWfI/qcQ+qGihX2+U81RvoIV67bVr66ueKX5nA==
X-Received: by 2002:a17:902:c952:b0:205:3e68:7367 with SMTP id d9443c01a7336-208d8386738mr37809175ad.21.1726833855056;
        Fri, 20 Sep 2024 05:04:15 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.192.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945dcc2esm93493855ad.28.2024.09.20.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:04:14 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>,
	Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] cups: Security fix for CVE-2024-35235
Date: Fri, 20 Sep 2024 17:34:01 +0530
Message-Id: <20240920120401.95157-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 12:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204736

CVE fixed:
- CVE-2024-35235: cups: Cupsd Listen arbitrary chmod 0140777
Upstream-Status: Backport from https://github.com/OpenPrinting/cups/commit/a436956f374b0fd7f5da9df482e4f5840fa1c0d2, https://github.com/OpenPrinting/cups/commit/e3952d3ecd231588bb382529281a294124db9348#diff-6fc0a5ba57f83c8177d28f44729276fe35fcaaceae8b774481e6973fcbdf733d

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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
index 0000000000..31a9f7407e
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
+CVE:CVE-2024-35235
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


