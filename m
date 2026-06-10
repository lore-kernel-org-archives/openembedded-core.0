Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E152CD98DB
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:31 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33648.1781132121758372614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AIL0hKOG;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so5075737f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132120; x=1781736920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYWpywNLKtj/LZcPSEuXQ4RbH6z5qROuLQB7nQ36yQI=;
        b=AIL0hKOG3XPoklJ5SWcnqj+FdrUMZ2508f9/Ojced5p9pcOtFbWA/086Poheocev7A
         jKCNo7IV7oJOoVZOpCblxbig197Gbn+k7TbpUQmwIf31aJOMgcxxR1FHF5dgR4i8grzv
         DezaC8UedfCqiVgjI45SxWljVlFcC7wNSjwW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132120; x=1781736920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYWpywNLKtj/LZcPSEuXQ4RbH6z5qROuLQB7nQ36yQI=;
        b=F2N4+QsemvxUMrx3bdma3OLIolGNOTqsRcJD7I+Q/gLGTtYym6evadyfZcF9zg1Dq3
         7vpUEvdPMsFTdW1TRKXfsWShfNvUwqoBdRzvjIaVu1JYirDqgnd8nfQzRw8sM/rsEFAX
         JaJDJuAndI6n1yZzliCVWOkWcZZDLUK2uchuBL3hZjJGS9h1svZAqYEKTLpsxd4dcVAf
         S/zl9dTYHi8kQ15gp7dneDox2Y2hJuijnKoWNPqUyANLcheS47xRTdAGkhmPMkEjf8t8
         XHBPa7S5gPZqpAcO9Am5Ry3YJvPVKhZLECLl7fKC/uSIQUnLiocEEmM+H4yryjgV+R9L
         wumA==
X-Gm-Message-State: AOJu0Yz4idp1IJ8ZO0IOit0NLOFD+hPknKhcOFySz5pN4H7zrDsxKclJ
	6aNTG/mGryKhBSiGg47rqyy6WP0CcC9isFU9MmjbGicPOl5hLUjN7zGo9fGPhhCGgTD++Gfngy5
	pA3fL
X-Gm-Gg: Acq92OFIueqVURM5SfjmaUDmfQcCuODShfaUy6OmHOlEK9SVJ+OIuXy598FskFeZV/h
	uG4vQo+AxtS1WYqZA9+GK7/rBEEH9yWkKa7ghEFUa+qZIZc9HjU0Jir8Th025XPtyB8tqTTfW54
	3t8wBMV0DDG3q5qugkvytbS2pPHY9NH9TXKDFudBK/DVRvIc1MXUSK5t9v6o6WNXvis8jCGOlkK
	bTpKSj7m//px8lC8EX8GfKV4d7jGUA3trPGZvOD2U2y9vAgkVK6fTYEY/OKcdFNVUiG+jLZAIlE
	XzfaWBTg5bPQv4scjQYxKa7xlBPmByJcJCLLsIFLgwEyI+Lrtatob2fue6/FxzOIIxFmigSQfg/
	65fBjx+eOUASIIetkeywQfHh/hUdPbljNbz5NxcKevQkB7UNu6S6HpsN38ai/mSGdAXDI8Db73G
	6ClXcbtCHeKvZT0QuVBqI8Prm0g2EEyCqKaYzCOIh3MKkVW3xHfr0YXrou/HAyKqPOqqB+qQusc
	yzj5Eode17WSd1BHxuM2/J4pqyqv3eR7qg+NRs=
X-Received: by 2002:a05:6000:4213:b0:45e:ea46:ce14 with SMTP id ffacd0b85a97d-4606758d2f1mr276075f8f.8.1781132119765;
        Wed, 10 Jun 2026 15:55:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/21] cups: fix CVE-2026-34990
Date: Thu, 11 Jun 2026 00:54:58 +0200
Message-ID: <53357424ebf57dbb1699bce28e19f5f4ae0eff3c.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238403

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

In CUPS versions 2.4.16 and prior, a local unprivileged
user can coerce cupsd into authenticating to an attacker-
controlled localhost IPP service with a reusable
Authorization: Local token. That token is sufficient to
drive /admin/ requests on localhost. By combining
CUPS-Create-Local-Printer with printer-is-shared=true,
an attacker can persist a file:///... queue even though
the normal FileDevice policy rejects such URIs. Printing
to that queue allows arbitrary root file overwrite. A
proof-of-concept demonstrates dropping a sudoers fragment
to achieve root command execution.

Apply upstream fix to prevent misuse of Local authorization
tokens and block unauthorized file:/// queues.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34990.patch            | 348 ++++++++++++++++++
 2 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index f23411f44b5..42107774e4e 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34978.patch \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34980.patch \
+           file://CVE-2026-34990.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
new file mode 100644
index 00000000000..3f7781c19ec
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
@@ -0,0 +1,348 @@
+From e052dc44da9d12adfbebc51de4975fbadb2ce356 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 15:55:50 -0400
+Subject: [PATCH] Don't allow local certificates over the loopback interface,
+ drop support for writing to plain files.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, a local
+unprivileged user can coerce cupsd into authenticating to an
+attacker-controlled localhost IPP service with a reusable Authorization:
+Local ... token. That token is enough to drive /admin/ requests on
+localhost, and the attacker can combine CUPS-Create-Local-Printer with
+printer-is-shared=true to persist a file: ///... queue even though the
+normal FileDevice policy rejects such URIs. Printing to that queue gives
+an arbitrary root file overwrite; the PoC below uses that primitive to
+drop a sudoers fragment and demonstrate root command execution.
+
+CVE: CVE-2026-34990
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/e052dc44da9d12adfbebc51de4975fbadb2ce356 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ cups/auth.c                    | 30 ++++++----------------
+ scheduler/auth.c               |  6 ++---
+ scheduler/client.c             |  4 +--
+ scheduler/ipp.c                |  6 ++---
+ scheduler/job.c                | 46 ++++++++++++++++++----------------
+ test/4.2-cups-printer-ops.test |  6 ++---
+ test/5.1-lpadmin.sh            | 14 +++++------
+ 7 files changed, 52 insertions(+), 62 deletions(-)
+
+diff --git a/cups/auth.c b/cups/auth.c
+index 5cb419458f..14661c7bef 100644
+--- a/cups/auth.c
++++ b/cups/auth.c
+@@ -1,7 +1,7 @@
+ /*
+  * Authentication functions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products.
+  *
+@@ -92,7 +92,6 @@ static void	cups_gss_printf(OM_uint32 major_status, OM_uint32 minor_status,
+ #    define	cups_gss_printf(major, minor, message)
+ #  endif /* DEBUG */
+ #endif /* HAVE_GSSAPI */
+-static int	cups_is_local_connection(http_t *http);
+ static int	cups_local_auth(http_t *http);
+ 
+ 
+@@ -948,14 +947,6 @@ cups_gss_printf(OM_uint32  major_status,/* I - Major status code */
+ #  endif /* DEBUG */
+ #endif /* HAVE_GSSAPI */
+ 
+-static int				/* O - 0 if not a local connection */
+-					/*     1  if local connection */
+-cups_is_local_connection(http_t *http)	/* I - HTTP connection to server */
+-{
+-  if (!httpAddrLocalhost(http->hostaddr) && _cups_strcasecmp(http->hostname, "localhost") != 0)
+-    return 0;
+-  return 1;
+-}
+ 
+ /*
+  * 'cups_local_auth()' - Get the local authorization certificate if
+@@ -967,13 +958,7 @@ static int				/* O - 0 if available */
+ 					/*    -1 error */
+ cups_local_auth(http_t *http)		/* I - HTTP connection to server */
+ {
+-#if defined(_WIN32) || defined(__EMX__)
+- /*
+-  * Currently _WIN32 and OS-2 do not support the CUPS server...
+-  */
+-
+-  return (1);
+-#else
++#if !_WIN32 && !__EMX__ && defined(AF_LOCAL)
+   int			pid;		/* Current process ID */
+   FILE			*fp;		/* Certificate file */
+   char			trc[16],	/* Try Root Certificate parameter */
+@@ -998,7 +983,7 @@ cups_local_auth(http_t *http)		/* I - HTTP connection to server */
+   * See if we are accessing localhost...
+   */
+ 
+-  if (!cups_is_local_connection(http))
++  if (httpAddrFamily(httpGetAddress(http)) != AF_LOCAL)
+   {
+     DEBUG_puts("8cups_local_auth: Not a local connection!");
+     return (1);
+@@ -1072,15 +1057,14 @@ cups_local_auth(http_t *http)		/* I - HTTP connection to server */
+   }
+ #  endif /* HAVE_AUTHORIZATION_H */
+ 
+-#  if defined(SO_PEERCRED) && defined(AF_LOCAL)
++#  ifdef SO_PEERCRED
+  /*
+   * See if we can authenticate using the peer credentials provided over a
+   * domain socket; if so, specify "PeerCred username" as the authentication
+   * information...
+   */
+ 
+-  if (http->hostaddr->addr.sa_family == AF_LOCAL &&
+-      !getenv("GATEWAY_INTERFACE") &&	/* Not via CGI programs... */
++  if (!getenv("GATEWAY_INTERFACE") &&	/* Not via CGI programs... */
+       cups_auth_find(www_auth, "PeerCred"))
+   {
+    /*
+@@ -1104,7 +1088,7 @@ cups_local_auth(http_t *http)		/* I - HTTP connection to server */
+       return (0);
+     }
+   }
+-#  endif /* SO_PEERCRED && AF_LOCAL */
++#  endif /* SO_PEERCRED */
+ 
+   if ((schemedata = cups_auth_find(www_auth, "Local")) == NULL)
+     return (1);
+@@ -1164,7 +1148,7 @@ cups_local_auth(http_t *http)		/* I - HTTP connection to server */
+       return (0);
+     }
+   }
++#endif /* !_WIN32 && !__EMX__ && AF_LOCAL */
+ 
+   return (1);
+-#endif /* _WIN32 || __EMX__ */
+ }
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 471de0492f..3e7041e220 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -318,7 +318,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+   }
+ #ifdef HAVE_AUTHORIZATION_H
+   else if (!strncmp(authorization, "AuthRef ", 8) &&
+-           httpAddrLocalhost(httpGetAddress(con->http)))
++           httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
+   {
+     OSStatus		status;		/* Status */
+     char		authdata[HTTP_MAX_VALUE];
+@@ -399,7 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+ #endif /* HAVE_AUTHORIZATION_H */
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+   else if (PeerCred != CUPSD_PEERCRED_OFF && !strncmp(authorization, "PeerCred ", 9) &&
+-           con->http->hostaddr->addr.sa_family == AF_LOCAL && con->best)
++           httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL && con->best)
+   {
+    /*
+     * Use peer credentials from domain socket connection...
+@@ -489,7 +489,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+   }
+ #endif /* SO_PEERCRED && AF_LOCAL */
+   else if (!strncmp(authorization, "Local", 5) &&
+-	   httpAddrLocalhost(httpGetAddress(con->http)))
++	   httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
+   {
+    /*
+     * Get Local certificate authentication data...
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 51be34f448..ab35bb7566 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -2188,7 +2188,7 @@ cupsdSendHeader(
+       strlcpy(auth_str, "Negotiate", sizeof(auth_str));
+     }
+ 
+-    if (con->best && !con->is_browser && !_cups_strcasecmp(httpGetHostname(con->http, NULL, 0), "localhost"))
++    if (con->best && !con->is_browser && httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
+     {
+      /*
+       * Add a "trc" (try root certification) parameter for local
+@@ -2208,7 +2208,7 @@ cupsdSendHeader(
+       auth_size = sizeof(auth_str) - (size_t)(auth_key - auth_str);
+ 
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+-      if (PeerCred != CUPSD_PEERCRED_OFF && httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
++      if (PeerCred != CUPSD_PEERCRED_OFF)
+       {
+         strlcpy(auth_key, ", PeerCred", auth_size);
+         auth_key += 10;
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index cb228b87c8..9a280e7525 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5625,7 +5625,7 @@ create_local_printer(
+   * Require local access to create a local printer...
+   */
+ 
+-  if (!httpAddrLocalhost(httpGetAddress(con->http)))
++  if (httpAddrFamily(httpGetAddress(con->http)) != AF_LOCAL)
+   {
+     send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local users can create a local printer."));
+     return;
+@@ -5685,9 +5685,9 @@ create_local_printer(
+ 
+   ptr = ippGetString(device_uri, 0, NULL);
+ 
+-  if (!ptr || !ptr[0])
++  if (!ptr || !ptr[0] || (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7)))
+   {
+-    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%s\" has empty value."), "device-uri");
++    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-uri \"%s\"."), ptr);
+ 
+     return;
+   }
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 0494d7196d..6599bfcf48 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -1163,35 +1163,39 @@ cupsdContinueJob(cupsd_job_t *job)	/* I - Job */
+ 	}
+ 	else
+ 	{
++	  char	scheme[32],		/* URI scheme */
++		userpass[32],		/* URI username:password */
++		host[256],		/* URI hostname */
++		resource[1024];		/* URI resource path (filename) */
++	  int	port;			/* URI port number */
++
++          httpSeparateURI(HTTP_URI_CODING_ALL, job->printer->device_uri, scheme, sizeof(scheme), userpass, sizeof(userpass), host, sizeof(host), &port, resource, sizeof(resource));
++
+ 	  job->print_pipes[0] = -1;
+-	  if (!strcmp(job->printer->device_uri, "file:/dev/null") ||
+-	      !strcmp(job->printer->device_uri, "file:///dev/null"))
+-	    job->print_pipes[1] = -1;
+-	  else
++	  job->print_pipes[1] = -1;
++
++	  if (strcmp(resource, "/dev/null"))
+ 	  {
+-	    if (!strncmp(job->printer->device_uri, "file:/dev/", 10))
+-	      job->print_pipes[1] = open(job->printer->device_uri + 5,
+-	                        	 O_WRONLY | O_EXCL);
+-	    else if (!strncmp(job->printer->device_uri, "file:///dev/", 12))
+-	      job->print_pipes[1] = open(job->printer->device_uri + 7,
+-	                        	 O_WRONLY | O_EXCL);
+-	    else if (!strncmp(job->printer->device_uri, "file:///", 8))
+-	      job->print_pipes[1] = open(job->printer->device_uri + 7,
+-	                        	 O_WRONLY | O_CREAT | O_TRUNC, 0600);
+-	    else
+-	      job->print_pipes[1] = open(job->printer->device_uri + 5,
+-	                        	 O_WRONLY | O_CREAT | O_TRUNC, 0600);
++	    if (!FileDevice)
++	    {
++	      abort_message = "Stopping job because file: output is disabled.";
+ 
+-	    if (job->print_pipes[1] < 0)
++              goto abort_job;
++	    }
++	    else if ((job->print_pipes[1] = open(resource, O_WRONLY | O_EXCL)) < 0)
+ 	    {
+-	      abort_message = "Stopping job because the scheduler could not "
+-	                      "open the output file.";
++	      abort_message = "Stopping job because the scheduler could not open the output file.";
+ 
+               goto abort_job;
+ 	    }
++	    else
++	    {
++	     /*
++	      * Close this file on execute...
++	      */
+ 
+-	    fcntl(job->print_pipes[1], F_SETFD,
+-        	  fcntl(job->print_pipes[1], F_GETFD) | FD_CLOEXEC);
++	      fcntl(job->print_pipes[1], F_SETFD, fcntl(job->print_pipes[1], F_GETFD) | FD_CLOEXEC);
++	    }
+           }
+ 	}
+       }
+diff --git a/test/4.2-cups-printer-ops.test b/test/4.2-cups-printer-ops.test
+index 1a011e011a..945a9bbd71 100644
+--- a/test/4.2-cups-printer-ops.test
++++ b/test/4.2-cups-printer-ops.test
+@@ -1,7 +1,7 @@
+ #
+ # Verify that the CUPS printer operations work.
+ #
+-# Copyright © 2020-2024 by OpenPrinting.
++# Copyright © 2020-2026 by OpenPrinting.
+ # Copyright © 2007-2019 by Apple Inc.
+ # Copyright © 2001-2006 by Easy Software Products. All rights reserved.
+ #
+@@ -180,7 +180,7 @@
+ 	ATTR uri printer-uri $method://$hostname:$port/printers/Test2
+ 
+ 	GROUP printer
+-	ATTR uri device-uri file:/tmp/Test2
++	ATTR uri device-uri file:///dev/null
+ 	ATTR enum printer-state 3
+ 	ATTR boolean printer-is-accepting-jobs true
+ 
+@@ -206,7 +206,7 @@
+ 	ATTR uri printer-uri $method://$hostname:$port/printers/Test1
+ 
+ 	GROUP printer
+-	ATTR uri device-uri file:/tmp/Test1
++	ATTR uri device-uri file:///dev/null
+ 	ATTR enum printer-state 3
+ 	ATTR boolean printer-is-accepting-jobs true
+ 	ATTR text printer-info "Test Printer 1"
+diff --git a/test/5.1-lpadmin.sh b/test/5.1-lpadmin.sh
+index aa398000a1..36f2822275 100644
+--- a/test/5.1-lpadmin.sh
++++ b/test/5.1-lpadmin.sh
+@@ -2,7 +2,7 @@
+ #
+ # Test the lpadmin command.
+ #
+-# Copyright © 2020-2024 by OpenPrinting.
++# Copyright © 2020-2026 by OpenPrinting.
+ # Copyright © 2007-2018 by Apple Inc.
+ # Copyright © 1997-2005 by Easy Software Products, all rights reserved.
+ #
+@@ -12,8 +12,8 @@
+ 
+ echo "Add Printer Test"
+ echo ""
+-echo "    lpadmin -p Test3 -v file:/dev/null -E -m drv:///sample.drv/deskjet.ppd"
+-$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:/dev/null -E -m drv:///sample.drv/deskjet.ppd 2>&1
++echo "    lpadmin -p Test3 -v file:///dev/null -E -m drv:///sample.drv/deskjet.ppd"
++$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:///dev/null -E -m drv:///sample.drv/deskjet.ppd 2>&1
+ if test $? != 0; then
+ 	echo "    FAILED"
+ 	exit 1
+@@ -29,8 +29,8 @@ echo ""
+ 
+ echo "Modify Printer Test"
+ echo ""
+-echo "    lpadmin -p Test3 -v file:/tmp/Test3 -o PageSize=A4"
+-$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:/tmp/Test3 -o PageSize=A4 2>&1
++echo "    lpadmin -p Test3 -v file:///dev/null -o PageSize=A4"
++$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:///dev/null -o PageSize=A4 2>&1
+ if test $? != 0; then
+ 	echo "    FAILED"
+ 	exit 1
+@@ -65,8 +65,8 @@ echo ""
+ 
+ echo "Add a printer for cupSNMP/IPPSupplies test"
+ echo ""
+-echo "    lpadmin -p Test4 -E -v file:/dev/null -m drv:///sample.drv/zebra.ppd"
+-$runcups $VALGRIND ../systemv/lpadmin -p Test4 -E -v file:/dev/null -m drv:///sample.drv/zebra.ppd 2>&1
++echo "    lpadmin -p Test4 -E -v file:///dev/null -m drv:///sample.drv/zebra.ppd"
++$runcups $VALGRIND ../systemv/lpadmin -p Test4 -E -v file:///dev/null -m drv:///sample.drv/zebra.ppd 2>&1
+ if test $? != 0; then
+ 	echo "    FAILED"
+ 	exit 1

