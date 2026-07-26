Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C92FC54F52
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7387.1785054622153149768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=07+xV6ER;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so8179895e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054620; x=1785659420; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0X7Ctif6/N8INzFSkYb8md8POmgq3B8Q2CsT5NVkYQ=;
        b=07+xV6ERPSmzNjJuFFbQKe8WkJrxDJEYPTi5pveQ4fZfWMbyOY6R18VGM/Q1i3c0DY
         aUR/oMpKvSsPg1S6AHCVR4TGKNp+E2EDrsQ+Hy3WxQmgZYMbQvqDaAE96H/pZp8263R4
         yvJYfio08qyzNDPJV7nXdmKRsbkCeV4MQwySE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054620; x=1785659420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0X7Ctif6/N8INzFSkYb8md8POmgq3B8Q2CsT5NVkYQ=;
        b=b1R0wkJfTEu5n9FgOwx10LK+VGsAuaGMtet+D2neUo7hGu+ob1iGKRlkrm/cBKEeto
         qBmsprSPfrty3kcDXireiKc8wldik5uoXTJzZn2XArTjmONQdv0i4QO/FQhd7KrOaTUd
         po+QMch5427ShS6Wp/7PmmWMBttAL11tVbjqMdVT75BROxnZPGKZemJgNKkhZlUVb3xd
         omxjOFZJiKP430c2F8JeS6uk8CWDEJSzFIB+hfVMnHLSyNLnSoyFynm7TeC3WwMMmy7N
         KkH/oieuEres4LkhMwNqvGPInazdpAvf0cK2Vn0ZiwJYBak6hU86US8G3nJsfbhNbFow
         uN3g==
X-Gm-Message-State: AOJu0YyCFugzRZAkmigzL/jEYi+28+MPE7U8OMnSj+QYC1FONKmMekuw
	XTffu+gBrWnSZa9o/UAg76xagES3L2HpHTR9y5f5BDRZ8Dtr/MtIKGZEir4iJpOIaGgdlfksVXH
	nAx3gbO4=
X-Gm-Gg: AR+sD13/ty03UyEGMIO0RBpag743+51gCJpriLjUcBCRCRfQAe8TZ40AcM7wPKAmDax
	VFU0EYTV7BA4bE7eTx+edQBElHJXEzIFfV+hYvV/lDRRjnaoApgQAe39BIaEccPQXUKNj3okhwF
	FFvKnOzSyvb9O1mMR5V6iz7ZVaFTwM2JrK6is7LlrsLger9sT1DXsUAUidyG1vY0CUOr6bSY/Nh
	hV/bCJyF73CuiONS2H2E3KGIjICkibpiaL7kmEUdCJMX+YV6a+c9DeoPMiKUtKwNyJOXcbmGMXD
	z1w4nc6wRcMGhRRLvoElm2GunMg34MMSeCCq8+sJ0rGwL3yyUSZ5hP02cUbAz9fxfKLtRActUYg
	AhWKJ7yfPh4xzBTPBjGXbKTFa0Vgwx7ztaXcZ+F0wGer4fx6+P4lqTDM7WrUVmkrAPBZyOfKK1j
	I9puOAryvcR+lFfikBPSDp4zkyoavdxhKMNQJu9BV+ugldWnzrNTq+ENKp/4RL0HOG3OW0738Lj
	Uqn9Q==
X-Received: by 2002:a05:600c:3b86:b0:495:665d:75df with SMTP id 5b1f17b1804b1-496b5719f90mr62668515e9.23.1785054620296;
        Sun, 26 Jul 2026 01:30:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/31] cups: fix CVE-2026-34990
Date: Sun, 26 Jul 2026 10:29:42 +0200
Message-ID: <5bf5d3da45fcc1494e5e6b3acf23880982518a7b.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242000

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/e052dc44da9d12adfbebc51de4975fbadb2ce356
[2] https://security-tracker.debian.org/tracker/CVE-2026-34990

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34990.patch            | 351 ++++++++++++++++++
 2 files changed, 352 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index a0ac1a26129..1cef1e71fe4 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980-regression_p1.patch \
            file://CVE-2026-34980-regression_p2.patch \
            file://CVE-2026-34979.patch \
+           file://CVE-2026-34990.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
new file mode 100644
index 00000000000..0a8c0930657
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
@@ -0,0 +1,351 @@
+From 48648896ca7faa8f105eee7b7a8d86c42e0fa796 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 15:55:50 -0400
+Subject: [PATCH] Don't allow local certificates over the loopback
+ interface, drop support for writing to plain files.
+
+CVE: CVE-2026-34990
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e052dc44da9d12adfbebc51de4975fbadb2ce356]
+
+Backport Changes:
+- Preserve the existing CVE-2025-61915 PeerCred disable guard while changing
+  localhost checks to AF_LOCAL.
+- Keep the CUPS 2.4.11 empty device-uri validation path separate and add a
+  dedicated rejection for non-IPP/IPPS schemes instead of folding both checks
+  into one upstream condition.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit e052dc44da9d12adfbebc51de4975fbadb2ce356)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ cups/auth.c                    |   30 ++++++--------------------
+ scheduler/auth.c               |    9 ++++----
+ scheduler/client.c             |    4 +--
+ scheduler/ipp.c                |    8 ++++++-
+ scheduler/job.c                |   46 ++++++++++++++++++++++-------------------
+ test/4.2-cups-printer-ops.test |    6 ++---
+ test/5.1-lpadmin.sh            |   14 ++++++------
+ 7 files changed, 56 insertions(+), 61 deletions(-)
+
+diff --git a/cups/auth.c b/cups/auth.c
+index 5cb4194..14661c7 100644
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
+index 1dd520d..56855fc 100644
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
+@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+ #endif /* HAVE_AUTHORIZATION_H */
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+-  else if (PeerCred != CUPSD_PEERCRED_OFF && !strncmp(authorization, "PeerCred ", 9) &&
+-           con->http->hostaddr->addr.sa_family == AF_LOCAL && con->best)
++  else if (PeerCred != CUPSD_PEERCRED_OFF &&
++           !strncmp(authorization, "PeerCred ", 9) &&
++           httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL && con->best)
+   {
+    /*
+     * Use peer credentials from domain socket connection...
+@@ -483,7 +483,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+   }
+ #endif /* SO_PEERCRED && AF_LOCAL */
+   else if (!strncmp(authorization, "Local", 5) &&
+-	   httpAddrLocalhost(httpGetAddress(con->http)))
++	   httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
+   {
+    /*
+     * Get Local certificate authentication data...
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 779404c..dea9da0 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -2173,7 +2173,7 @@ cupsdSendHeader(
+       strlcpy(auth_str, "Negotiate", sizeof(auth_str));
+     }
+ 
+-    if (con->best && !con->is_browser && !_cups_strcasecmp(httpGetHostname(con->http, NULL, 0), "localhost"))
++    if (con->best && !con->is_browser && httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
+     {
+      /*
+       * Add a "trc" (try root certification) parameter for local
+@@ -2193,7 +2193,7 @@ cupsdSendHeader(
+       auth_size = sizeof(auth_str) - (size_t)(auth_key - auth_str);
+ 
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+-      if (PeerCred != CUPSD_PEERCRED_OFF && httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
++      if (PeerCred != CUPSD_PEERCRED_OFF)
+       {
+         strlcpy(auth_key, ", PeerCred", auth_size);
+         auth_key += 10;
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index b0d1f5b..11dcd39 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5561,7 +5561,7 @@ create_local_printer(
+   * Require local access to create a local printer...
+   */
+ 
+-  if (!httpAddrLocalhost(httpGetAddress(con->http)))
++  if (httpAddrFamily(httpGetAddress(con->http)) != AF_LOCAL)
+   {
+     send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local users can create a local printer."));
+     return;
+@@ -5634,6 +5634,12 @@ create_local_printer(
+ 
+     return;
+   }
++  else if (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7))
++  {
++    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-uri \"%s\"."), ptr);
++
++    return;
++  }
+ 
+   printer_geo_location = ippFindAttribute(con->request, "printer-geo-location", IPP_TAG_URI);
+   printer_info         = ippFindAttribute(con->request, "printer-info", IPP_TAG_TEXT);
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 880c25f..6c033de 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -1164,35 +1164,39 @@ cupsdContinueJob(cupsd_job_t *job)	/* I - Job */
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
+index 1a011e0..945a9bb 100644
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
+index aa39800..36f2822 100644
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
+-- 
+2.43.7

