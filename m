Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4339C78839
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 12:52:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.17200.1726836723940517761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 05:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AiBbPdSj;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: rsangam@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2daaa9706a9so1771281a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726836723; x=1727441523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTwVwWUskQpVjT6QuLbxS8SovztpNySCFLv/T6dK8fg=;
        b=AiBbPdSjkAAQb8hPOqnynuxEEwaKI4oi+v/96ObrAw/6gH03GFvLoO9lMbNu/szMG3
         gw07bgTHHI3RqKFq1tMvqvPoNMvCUGiQuXKz1khkiTJYj0/8Q3pjdlLtQ8cdIjZoNIRO
         1wsrMaq2wcA+70FmJvht50q+CBueVkbgYPIZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726836723; x=1727441523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTwVwWUskQpVjT6QuLbxS8SovztpNySCFLv/T6dK8fg=;
        b=qzh0o8QVvrsI6buzMWQ1YWNN2MtthXn2HT0s28yBo2ULXZPgjcj8pm7Hx4KXjIsKY2
         YSCT3XZ27BzFt0P1eV5blnEe6CHGUMN0V1OjMJQadRPxxotHNKsPstNDkC6Fo4BNffRA
         OPFkxw304uWwfmKfxtK83HGFgTtnhMpkXqiHXV/7U+x/NcWfy79UUfH9hW/7eiAg3vjK
         2njQKVH1Bauj57gVTsc1z2sDQ80bcNkxJG9I95KI+7nUA1rpxBczP2G63xNu4MREWa+b
         1W1n2v3hcOXVHXny/xIAmJF+pcJcnnYKzkszKARlxRxVU6D1U7GZio36GzUKyM3Edbet
         M9MA==
X-Gm-Message-State: AOJu0YwPoiQmeiS06ak4CthT6+iCu8Y6H2J4+MMNG1e1zdQIHoryhflS
	Uo6o3MbwxiI8MxjUp/61QUxPdp9nxNyfo+ZNriYcGIgL9C2GxE3axKxU+KJ+aj12Ag1xZsbrGOV
	6
X-Google-Smtp-Source: AGHT+IFw2grwCHlG+gly57fDw1u7368nPlT4PNHnXQ4SMQlOHl+CT/iwui1sM3uT0z5t3CAJnzy/7g==
X-Received: by 2002:a17:90b:8ce:b0:2d8:8818:4d53 with SMTP id 98e67ed59e1d1-2dd7f743529mr3042657a91.41.1726836722870;
        Fri, 20 Sep 2024 05:52:02 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.192.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f871ab3sm1824724a91.27.2024.09.20.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:52:02 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>,
	Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] cups: Security fix for CVE-2024-35235
Date: Fri, 20 Sep 2024 18:21:55 +0530
Message-Id: <20240920125155.97743-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 12:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204738

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


