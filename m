Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B98C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:48 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29045.1784655765919296911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GERFCnHw;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14348; q=dns/txt;
  s=iport01; t=1784655765; x=1785865365;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4dFuVj4L/qGsQ5JdbLDeph/fGoPSsD69/HoLW+rii2o=;
  b=GERFCnHw8gsJW6/cpu74SYhF5Fzk3LxVLP+a0DDI/GpMwfiT3PIgohgb
   pzQtT366bY2ESBRRkvBbeGux6AqmajixUCXSSvxfuOqAyuodFRPu0l8bw
   oYiL6HOT6lLnltleFGWjcVzBLsrrhONMkhFQ9DIBfAef05zD677xBf8mr
   5Y803hwypDXaNrYRgGUnXbEN6uy6FCJ0h/lXWMqxJ4Em9wQOGVQEssmjp
   plBwgo1MZ0tqrbp4ojfyaFlDKKJ0JJTPZbSHXEuxknMpjfqZ+z94VmQ4J
   3brRNpmSYvoangt/JY38VSFQzEbBE5dj6loiBdd1F3jbcHUzkIzSh5dyp
   g==;
X-CSE-ConnectionGUID: T4JGvNv+Q6qqNAvXzF6n/w==
X-CSE-MsgGUID: z5ZemjI1RiyXf9hfFUc1Bw==
X-IPAS-Result: =?us-ascii?q?A0AnAAAVrl9q/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4RUiBuHN4IhA4ETkDeMURSBag8BAQEPRA0EAQGCEoJzAo1XAiY0C?=
 =?us-ascii?q?Q4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDIwQLA?=
 =?us-ascii?q?TQiHAIBAQIDAhQSAgIrIwgRCIMCAYJ0AxGoeZcXGjd6fzOBAYNoAkNQ2y4BC?=
 =?us-ascii?q?xQBgQouAYU+gx0BhQJcGAGEfCcbG4FygRWCc3aBBYFcAoEYCyVogwuCagSCI?=
 =?us-ascii?q?oEMgVoYBoRvggaJGkiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbB?=
 =?us-ascii?q?wWBHYEugQKEbiMfAzl/gS91SnctahIXgSaCFIE6AlUDCxgNSBEsNxQZBD0Bb?=
 =?us-ascii?q?geNVCOBcRc2Aj0cASETASoBgQUMPDYpEQwBHBGSWgkKByqSCoE4n1oKKIN1j?=
 =?us-ascii?q?CGVOhozhVulEQuYfY4KlTQCMhhQhGmBaDyBWXAVgyIJShkPji0LC4NghAeBD?=
 =?us-ascii?q?IE9xWk8NQcEAy8BAQcCBw4DC4FokAIPFQIHgU8BAQ?=
IronPort-Data: A9a23:Rk8hgatNNr/cv+G4lW8TBTf4vufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWuPM/bfMGX1eNkgPtyz8E5TsZeBmoU2SAVkqSAzFi4RgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z8Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwxrpVLn9o6
 78hdikUSDmdt/CYnrT8Vbw57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHTH5kEzxvJ/
 goq+UzrXyMXMd6+kACE40Ki1+/Bsx7wAagNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:duMewKh3WAxXWiLEToUoRlh1l3BQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:GBlFZmOeTdTgnO5DZHVF21AyBIMcLGTE6l7OE12WV2AuV+jA
X-Talos-MUID: 9a23:Pt2q9gYodIEGB+BTpWLeiTRgFZ5S4rWeBhENn7s7sJCuKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="512499590"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:44 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 52D2518000200
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:44 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 6FC94CBEFAA; Tue, 21 Jul 2026 23:12:42 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 6/8] cups: fix CVE-2026-34990
Date: Tue, 21 Jul 2026 23:12:15 +0530
Message-Id: <20260721174217.229620-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241564

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/e052dc44da9d12adfbebc51de4975fbadb2ce356
[2] https://security-tracker.debian.org/tracker/CVE-2026-34990

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the embedded source patch context; no CVE logic changes.

 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34990.patch            | 351 ++++++++++++++++++
 2 files changed, 352 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index a0ac1a2612..1cef1e71fe 100644
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
index 0000000000..0a8c093065
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
-- 
2.35.6


