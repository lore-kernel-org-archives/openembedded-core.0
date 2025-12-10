Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0F7D3C920
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 15:10:44 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17807.1765379437901600621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 07:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Pz/lJh/k;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19995; q=dns/txt;
  s=iport01; t=1765379437; x=1766589037;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M8sjJZ3FBI9MG7MjU1YtEOuQCnppG86SGayBDO61MT0=;
  b=Pz/lJh/k2ju6uI3rcDrrWlEYTHHkfrmd7dJHHbrakK8e0yNVWIGGLevr
   EmvrFJQQQ3E9uV4j8d/XaztqU48B1PBk7fC4dwGBeHQXh9cU7YdYC7SXU
   U/PPiulIfSzfCGKlC34I9i002Cd4LI7S4ZaWXGCDgMIZybOMiWEFLoJy4
   dV73g5JGNZxJVbJWSoofwdwqDe5u0yCtwJRZO4FPf6P6331NoGZkYkscz
   QLegAhpD27SyGgFsKasJSxSc1vfPyUgIpWp+f0KP/z++2eYbzZdLWDCw7
   AOKQftfj4Y3aKqnSx9bsrEwUpnQmwwIPbX/eM4NMbuMU6ANgLw3CWogWZ
   g==;
X-CSE-ConnectionGUID: 24WGX/N7Saye8HJ+yRVvSA==
X-CSE-MsgGUID: XsEyhbLpSMiSbYitGnLFlA==
X-IPAS-Result: =?us-ascii?q?A0CsAwDAizlp/5P/Ja1agQmBUIJHf19CSYRUj1OCIZ4dF?=
 =?us-ascii?q?IFrDwEBAQ89FAQBAYITj10CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBKQQLAXIDAQIDAiYCLSMhgwIBgnMCAREGmmaXH?=
 =?us-ascii?q?Ro3en8zgQGDaAJDT9ssgR0uhTuDGAGEfVgYAYR4JxsbgXKBFYE7NoF3gQWBX?=
 =?us-ascii?q?AEBgSMVdoMNgmkEgiKBDoYfeIErAyseEJBASIECHANZLAFVEw0KCwcFgWMDN?=
 =?us-ascii?q?QwLKhVuMh2BIz4Xc4EUg0keaA8GgRGDT4Eyh2MPiXs7AwsYDUgRLDcUGwY9A?=
 =?us-ascii?q?W4HlBhOgWNIBwEwBiMhEwEoAQEBIl4QVUccAQEwklcTMY9qgiGhDgoog3SMH?=
 =?us-ascii?q?pU5GjOEBIFXkj6LIYcxC5h7jgiVNAIkGV2EaIFoPIFHCwdwFRqDCAlJGQ+OL?=
 =?us-ascii?q?QsLg16Bf1eDerkIIjUCATkCBwEKAQEDCZFrgXwBAQ?=
IronPort-Data: A9a23:IjL9UajHJQt83/tmf7dLoQxpX161MREKZh0ujC45NGQN5FlHY01je
 htvXGuObq2KamCjLdAjbd/io0kAupXVmIBhSAE+qHo1HiJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeHULOZ82QsaD9Nsfvb8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVCptlYMSZoq
 scROT1dTjLAltiI3omSH7wEasQLdKEHPasFsX1miDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgh/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JobVHZ8KwxnGz
 o7A11TiLwAaPviH8h+EyXidh/PgmwfVXKtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:A2kjNqFlFjwrpo6fpLqE48eALOsnbusQ8zAXPidKOHlom62j5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:IYAnTmPi99hcO+5DAnVY235TPJ8ee2zQnFfyYF6CN3hSYejA
X-Talos-MUID: 9a23:qfFHCATfJu+xsjNRRXTcnxxzNM1M+5+LCXsHoJQalM+gGyhZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,264,1758585600"; 
   d="scan'208";a="427027576"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Dec 2025 15:10:35 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id EAD2418000244
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 15:10:34 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 76DD9CC12B5; Wed, 10 Dec 2025 07:10:33 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [scarthgap] [PATCH 2/2] cups 2.4.11: Fix CVE-2025-61915
Date: Wed, 10 Dec 2025 07:10:21 -0800
Message-Id: <20251210151021.2784035-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 15:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227484

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/OpenPrinting/cups.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61915
Type: Security Fix
CVE: CVE-2025-61915
Score: 6.7
Patch: https://github.com/OpenPrinting/cups/commit/db8d560262c2

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index cf3df32306..12668ca023 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2025-58060.patch \
            file://CVE-2025-58364.patch \
            file://CVE-2025-58436.patch \
+           file://CVE-2025-61915.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-61915.patch b/meta/recipes-extended/cups/cups/CVE-2025-61915.patch
new file mode 100644
index 0000000000..ad91c66b73
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-61915.patch
@@ -0,0 +1,491 @@
+From 3ff24bbe1d0e11a2edb5cac0ae421b8e95220651 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Fri, 21 Nov 2025 07:36:36 +0100
+Subject: [PATCH] Fix various issues in cupsd
+
+Various issues were found by @SilverPlate3, recognized as CVE-2025-61915:
+
+- out of bound write when handling IPv6 addresses,
+- cupsd crash caused by null dereference when ErrorPolicy value is empty,
+
+On the top of that, Mike Sweet noticed vulnerability via domain socket,
+exploitable locally if attacker has access to domain socket and knows username
+of user within a group which is present in CUPS system groups:
+
+- rewrite of cupsd.conf via PeerCred authorization via domain socket
+
+The last vulnerability is fixed by introducing PeerCred directive for cups-files.conf,
+which controls whether PeerCred is enabled/disabled for user in CUPS system groups.
+
+Fixes CVE-2025-61915
+
+CVE: CVE-2025-61915
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/db8d560262c2]
+
+(cherry picked from commit db8d560262c22a21ee1e55dfd62fa98d9359bcb0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ conf/cups-files.conf.in              |  3 ++
+ config-scripts/cups-defaults.m4      |  9 +++++
+ config.h.in                          |  7 ++++
+ configure                            | 22 ++++++++++
+ doc/help/man-cups-files.conf.html    |  9 ++++-
+ man/cups-files.conf.5                | 17 ++++++--
+ scheduler/auth.c                     |  8 +++-
+ scheduler/auth.h                     |  7 ++++
+ scheduler/client.c                   |  2 +-
+ scheduler/conf.c                     | 60 ++++++++++++++++++++++++----
+ test/run-stp-tests.sh                |  2 +-
+ vcnet/config.h                       |  7 ++++
+ xcode/CUPS.xcodeproj/project.pbxproj |  2 -
+ xcode/config.h                       |  7 ++++
+ 14 files changed, 145 insertions(+), 17 deletions(-)
+
+diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
+index 27d8be96f..bc999e420 100644
+--- a/conf/cups-files.conf.in
++++ b/conf/cups-files.conf.in
+@@ -22,6 +22,9 @@
+ SystemGroup @CUPS_SYSTEM_GROUPS@
+ @CUPS_SYSTEM_AUTHKEY@
+
++# Are Unix domain socket peer credentials used for authorization?
++PeerCred @CUPS_PEER_CRED@
++
+ # User that is substituted for unauthenticated (remote) root accesses...
+ #RemoteRoot remroot
+
+diff --git a/config-scripts/cups-defaults.m4 b/config-scripts/cups-defaults.m4
+index 27e5bc472..b4f03d624 100644
+--- a/config-scripts/cups-defaults.m4
++++ b/config-scripts/cups-defaults.m4
+@@ -129,6 +129,15 @@ AC_ARG_WITH([log_level], AS_HELP_STRING([--with-log-level], [set default LogLeve
+ AC_SUBST([CUPS_LOG_LEVEL])
+ AC_DEFINE_UNQUOTED([CUPS_DEFAULT_LOG_LEVEL], ["$CUPS_LOG_LEVEL"], [Default LogLevel value.])
+
++dnl Default PeerCred
++AC_ARG_WITH([peer_cred], AS_HELP_STRING([--with-peer-cred], [set default PeerCred value (on/off/root-only), default=on]), [
++    CUPS_PEER_CRED="$withval"
++], [
++    CUPS_PEER_CRED="on"
++])
++AC_SUBST([CUPS_PEER_CRED])
++AC_DEFINE_UNQUOTED([CUPS_DEFAULT_PEER_CRED], ["$CUPS_PEER_CRED"], [Default PeerCred value.])
++
+ dnl Default AccessLogLevel
+ AC_ARG_WITH(access_log_level, [  --with-access-log-level set default AccessLogLevel value, default=none],
+	CUPS_ACCESS_LOG_LEVEL="$withval",
+diff --git a/config.h.in b/config.h.in
+index 6940b9604..222b3b5bf 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -86,6 +86,13 @@
+ #define CUPS_DEFAULT_ERROR_POLICY "stop-printer"
+
+
++/*
++ * Default PeerCred value...
++ */
++
++#define CUPS_DEFAULT_PEER_CRED "on"
++
++
+ /*
+  * Default MaxCopies value...
+  */
+diff --git a/configure b/configure
+index f8147c9d6..f456c8588 100755
+--- a/configure
++++ b/configure
+@@ -672,6 +672,7 @@ CUPS_BROWSING
+ CUPS_SYNC_ON_CLOSE
+ CUPS_PAGE_LOG_FORMAT
+ CUPS_ACCESS_LOG_LEVEL
++CUPS_PEER_CRED
+ CUPS_LOG_LEVEL
+ CUPS_FATAL_ERRORS
+ CUPS_ERROR_POLICY
+@@ -925,6 +926,7 @@ with_max_log_size
+ with_error_policy
+ with_fatal_errors
+ with_log_level
++with_peer_cred
+ with_access_log_level
+ enable_page_logging
+ enable_sync_on_close
+@@ -1661,6 +1663,8 @@ Optional Packages:
+   --with-error-policy     set default ErrorPolicy value, default=stop-printer
+   --with-fatal-errors     set default FatalErrors value, default=config
+   --with-log-level        set default LogLevel value, default=warn
++  --with-peer-cred        set default PeerCred value (on/off/root-only),
++                          default=on
+   --with-access-log-level set default AccessLogLevel value, default=none
+   --with-local-protocols  set default BrowseLocalProtocols, default=""
+   --with-cups-user        set default user for CUPS
+@@ -11718,6 +11722,24 @@ printf "%s\n" "#define CUPS_DEFAULT_LOG_LEVEL \"$CUPS_LOG_LEVEL\"" >>confdefs.h
+
+
+
++# Check whether --with-peer_cred was given.
++if test ${with_peer_cred+y}
++then :
++  withval=$with_peer_cred;
++    CUPS_PEER_CRED="$withval"
++
++else $as_nop
++
++    CUPS_PEER_CRED="on"
++
++fi
++
++
++
++printf "%s\n" "#define CUPS_DEFAULT_PEER_CRED \"$CUPS_PEER_CRED\"" >>confdefs.h
++
++
++
+ # Check whether --with-access_log_level was given.
+ if test ${with_access_log_level+y}
+ then :
+diff --git a/doc/help/man-cups-files.conf.html b/doc/help/man-cups-files.conf.html
+index c0c775dec..5a9ddefeb 100644
+--- a/doc/help/man-cups-files.conf.html
++++ b/doc/help/man-cups-files.conf.html
+@@ -119,6 +119,13 @@ The default is "/var/log/cups/page_log".
+ <dt><a name="PassEnv"></a><b>PassEnv </b><i>variable </i>[ ... <i>variable </i>]
+ <dd style="margin-left: 5.0em">Passes the specified environment variable(s) to child processes.
+ Note: the standard CUPS filter and backend environment variables cannot be overridden using this directive.
++<dt><a name="PeerCred"></a><b>PeerCred off</b>
++<dd style="margin-left: 5.0em"><dt><b>PeerCred on</b>
++<dd style="margin-left: 5.0em"><dt><b>PeerCred root-only</b>
++<dd style="margin-left: 5.0em">Specifies whether peer credentials are used for authorization when communicating over the UNIX domain socket.
++When <b>on</b>, the peer credentials of any user are accepted for authorization.
++The value <b>off</b> disables the use of peer credentials entirely, while the value <b>root-only</b> allows peer credentials only for the root user.
++Note: for security reasons, the <b>on</b> setting is reduced to <b>root-only</b> for authorization of PUT requests.
+ <dt><a name="RemoteRoot"></a><b>RemoteRoot </b><i>username</i>
+ <dd style="margin-left: 5.0em">Specifies the username that is associated with unauthenticated accesses by clients claiming to be the root user.
+ The default is "remroot".
+@@ -207,7 +214,7 @@ command is used instead.
+ <a href="man-subscriptions.conf.html?TOPIC=Man+Pages"><b>subscriptions.conf</b>(5),</a>
+ CUPS Online Help (<a href="http://localhost:631/help">http://localhost:631/help</a>)
+ <h2 class="title"><a name="COPYRIGHT">Copyright</a></h2>
+-Copyright &copy; 2020-2023 by OpenPrinting.
++Copyright &copy; 2020-2025 by OpenPrinting.
+
+ </body>
+ </html>
+diff --git a/man/cups-files.conf.5 b/man/cups-files.conf.5
+index 8358b62a1..107072c3c 100644
+--- a/man/cups-files.conf.5
++++ b/man/cups-files.conf.5
+@@ -1,14 +1,14 @@
+ .\"
+ .\" cups-files.conf man page for CUPS.
+ .\"
+-.\" Copyright © 2020-2024 by OpenPrinting.
++.\" Copyright © 2020-2025 by OpenPrinting.
+ .\" Copyright © 2007-2019 by Apple Inc.
+ .\" Copyright © 1997-2006 by Easy Software Products.
+ .\"
+ .\" Licensed under Apache License v2.0.  See the file "LICENSE" for more
+ .\" information.
+ .\"
+-.TH cups-files.conf 5 "CUPS" "2021-03-06" "OpenPrinting"
++.TH cups-files.conf 5 "CUPS" "2025-10-08" "OpenPrinting"
+ .SH NAME
+ cups\-files.conf \- file and directory configuration file for cups
+ .SH DESCRIPTION
+@@ -166,6 +166,17 @@ The default is "/var/log/cups/page_log".
+ \fBPassEnv \fIvariable \fR[ ... \fIvariable \fR]
+ Passes the specified environment variable(s) to child processes.
+ Note: the standard CUPS filter and backend environment variables cannot be overridden using this directive.
++.\"#PeerCred
++.TP 5
++\fBPeerCred off\fR
++.TP 5
++\fBPeerCred on\fR
++.TP 5
++\fBPeerCred root-only\fR
++Specifies whether peer credentials are used for authorization when communicating over the UNIX domain socket.
++When \fBon\fR, the peer credentials of any user are accepted for authorization.
++The value \fBoff\fR disables the use of peer credentials entirely, while the value \fBroot-only\fR allows peer credentials only for the root user.
++Note: for security reasons, the \fBon\fR setting is reduced to \fBroot-only\fR for authorization of PUT requests.
+ .\"#RemoteRoot
+ .TP 5
+ \fBRemoteRoot \fIusername\fR
+@@ -289,4 +300,4 @@ command is used instead.
+ .BR subscriptions.conf (5),
+ CUPS Online Help (http://localhost:631/help)
+ .SH COPYRIGHT
+-Copyright \[co] 2020-2024 by OpenPrinting.
++Copyright \[co] 2020-2025 by OpenPrinting.
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 3c9aa72aa..bd0d28a0e 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -398,7 +398,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+   }
+ #endif /* HAVE_AUTHORIZATION_H */
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+-  else if (!strncmp(authorization, "PeerCred ", 9) &&
++  else if (PeerCred != CUPSD_PEERCRED_OFF && !strncmp(authorization, "PeerCred ", 9) &&
+            con->http->hostaddr->addr.sa_family == AF_LOCAL && con->best)
+   {
+    /*
+@@ -441,6 +441,12 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     }
+ #endif /* HAVE_AUTHORIZATION_H */
+
++    if ((PeerCred == CUPSD_PEERCRED_ROOTONLY || httpGetState(con->http) == HTTP_STATE_PUT_RECV) && strcmp(authorization + 9, "root"))
++    {
++      cupsdLogClient(con, CUPSD_LOG_INFO, "User \"%s\" is not allowed to use peer credentials.", authorization + 9);
++      return;
++    }
++
+     if ((pwd = getpwnam(authorization + 9)) == NULL)
+     {
+       cupsdLogClient(con, CUPSD_LOG_ERROR, "User \"%s\" does not exist.", authorization + 9);
+diff --git a/scheduler/auth.h b/scheduler/auth.h
+index ee98e92c7..fdf71213f 100644
+--- a/scheduler/auth.h
++++ b/scheduler/auth.h
+@@ -50,6 +50,10 @@
+ #define CUPSD_AUTH_LIMIT_ALL	127	/* Limit all requests */
+ #define CUPSD_AUTH_LIMIT_IPP	128	/* Limit IPP requests */
+
++#define CUPSD_PEERCRED_OFF	0	/* Don't allow PeerCred authorization */
++#define CUPSD_PEERCRED_ON	1	/* Allow PeerCred authorization for all users */
++#define CUPSD_PEERCRED_ROOTONLY	2	/* Allow PeerCred authorization for root user */
++
+ #define IPP_ANY_OPERATION	(ipp_op_t)0
+					/* Any IPP operation */
+ #define IPP_BAD_OPERATION	(ipp_op_t)-1
+@@ -105,6 +109,9 @@ typedef struct
+
+ VAR cups_array_t	*Locations	VALUE(NULL);
+					/* Authorization locations */
++VAR int			PeerCred	VALUE(CUPSD_PEERCRED_ON);
++					/* Allow PeerCred authorization? */
++
+ #ifdef HAVE_TLS
+ VAR http_encryption_t	DefaultEncryption VALUE(HTTP_ENCRYPT_REQUIRED);
+					/* Default encryption for authentication */
+diff --git a/scheduler/client.c b/scheduler/client.c
+index d495d9a75..81db4aa52 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -2204,7 +2204,7 @@ cupsdSendHeader(
+       auth_size = sizeof(auth_str) - (size_t)(auth_key - auth_str);
+
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+-      if (httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
++      if (PeerCred != CUPSD_PEERCRED_OFF && httpAddrFamily(httpGetAddress(con->http)) == AF_LOCAL)
+       {
+         strlcpy(auth_key, ", PeerCred", auth_size);
+         auth_key += 10;
+diff --git a/scheduler/conf.c b/scheduler/conf.c
+index 3184d72f0..6accf0590 100644
+--- a/scheduler/conf.c
++++ b/scheduler/conf.c
+@@ -47,6 +47,7 @@ typedef enum
+ {
+   CUPSD_VARTYPE_INTEGER,		/* Integer option */
+   CUPSD_VARTYPE_TIME,			/* Time interval option */
++  CUPSD_VARTYPE_NULLSTRING,		/* String option or NULL/empty string */
+   CUPSD_VARTYPE_STRING,			/* String option */
+   CUPSD_VARTYPE_BOOLEAN,		/* Boolean option */
+   CUPSD_VARTYPE_PATHNAME,		/* File/directory name option */
+@@ -69,7 +70,7 @@ static const cupsd_var_t	cupsd_vars[] =
+ {
+   { "AutoPurgeJobs", 		&JobAutoPurge,		CUPSD_VARTYPE_BOOLEAN },
+ #ifdef HAVE_DNSSD
+-  { "BrowseDNSSDSubTypes",	&DNSSDSubTypes,		CUPSD_VARTYPE_STRING },
++  { "BrowseDNSSDSubTypes",	&DNSSDSubTypes,		CUPSD_VARTYPE_NULLSTRING },
+ #endif /* HAVE_DNSSD */
+   { "BrowseWebIF",		&BrowseWebIF,		CUPSD_VARTYPE_BOOLEAN },
+   { "Browsing",			&Browsing,		CUPSD_VARTYPE_BOOLEAN },
+@@ -120,7 +121,7 @@ static const cupsd_var_t	cupsd_vars[] =
+   { "MaxSubscriptionsPerPrinter",&MaxSubscriptionsPerPrinter,	CUPSD_VARTYPE_INTEGER },
+   { "MaxSubscriptionsPerUser",	&MaxSubscriptionsPerUser,	CUPSD_VARTYPE_INTEGER },
+   { "MultipleOperationTimeout",	&MultipleOperationTimeout,	CUPSD_VARTYPE_TIME },
+-  { "PageLogFormat",		&PageLogFormat,		CUPSD_VARTYPE_STRING },
++  { "PageLogFormat",		&PageLogFormat,		CUPSD_VARTYPE_NULLSTRING },
+   { "PreserveJobFiles",		&JobFiles,		CUPSD_VARTYPE_TIME },
+   { "PreserveJobHistory",	&JobHistory,		CUPSD_VARTYPE_TIME },
+   { "ReloadTimeout",		&ReloadTimeout,		CUPSD_VARTYPE_TIME },
+@@ -791,6 +792,13 @@ cupsdReadConfiguration(void)
+   IdleExitTimeout = 60;
+ #endif /* HAVE_ONDEMAND */
+
++  if (!strcmp(CUPS_DEFAULT_PEER_CRED, "off"))
++    PeerCred = CUPSD_PEERCRED_OFF;
++  else if (!strcmp(CUPS_DEFAULT_PEER_CRED, "root-only"))
++    PeerCred = CUPSD_PEERCRED_ROOTONLY;
++  else
++    PeerCred = CUPSD_PEERCRED_ON;
++
+  /*
+   * Setup environment variables...
+   */
+@@ -1831,7 +1839,7 @@ get_addr_and_mask(const char *value,	/* I - String from config file */
+
+     family  = AF_INET6;
+
+-    for (i = 0, ptr = value + 1; *ptr && i < 8; i ++)
++    for (i = 0, ptr = value + 1; *ptr && i >= 0 && i < 8; i ++)
+     {
+       if (*ptr == ']')
+         break;
+@@ -1977,7 +1985,7 @@ get_addr_and_mask(const char *value,	/* I - String from config file */
+ #ifdef AF_INET6
+       if (family == AF_INET6)
+       {
+-        if (i > 128)
++        if (i < 0 || i > 128)
+	  return (0);
+
+         i = 128 - i;
+@@ -2011,7 +2019,7 @@ get_addr_and_mask(const char *value,	/* I - String from config file */
+       else
+ #endif /* AF_INET6 */
+       {
+-        if (i > 32)
++        if (i < 0 || i > 32)
+	  return (0);
+
+         mask[0] = 0xffffffff;
+@@ -2921,7 +2929,17 @@ parse_variable(
+	cupsdSetString((char **)var->ptr, temp);
+	break;
+
++    case CUPSD_VARTYPE_NULLSTRING :
++	cupsdSetString((char **)var->ptr, value);
++	break;
++
+     case CUPSD_VARTYPE_STRING :
++        if (!value)
++        {
++	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d of %s.", line, linenum, filename);
++	  return (0);
++        }
++
+	cupsdSetString((char **)var->ptr, value);
+	break;
+   }
+@@ -3436,9 +3454,10 @@ read_cupsd_conf(cups_file_t *fp)	/* I - File to read from */
+		      line, value ? " " : "", value ? value : "", linenum,
+		      ConfigurationFile, CupsFilesFile);
+     }
+-    else
+-      parse_variable(ConfigurationFile, linenum, line, value,
+-                     sizeof(cupsd_vars) / sizeof(cupsd_vars[0]), cupsd_vars);
++    else if (!parse_variable(ConfigurationFile, linenum, line, value,
++			     sizeof(cupsd_vars) / sizeof(cupsd_vars[0]), cupsd_vars) &&
++	     (FatalErrors & CUPSD_FATAL_CONFIG))
++      return (0);
+   }
+
+   return (1);
+@@ -3597,6 +3616,31 @@ read_cups_files_conf(cups_file_t *fp)	/* I - File to read from */
+	    break;
+       }
+     }
++    else if (!_cups_strcasecmp(line, "PeerCred") && value)
++    {
++     /*
++      * PeerCred {off,on,root-only}
++      */
++
++      if (!_cups_strcasecmp(value, "off"))
++      {
++        PeerCred = CUPSD_PEERCRED_OFF;
++      }
++      else if (!_cups_strcasecmp(value, "on"))
++      {
++        PeerCred = CUPSD_PEERCRED_ON;
++      }
++      else if (!_cups_strcasecmp(value, "root-only"))
++      {
++        PeerCred = CUPSD_PEERCRED_ROOTONLY;
++      }
++      else
++      {
++	cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown PeerCred \"%s\" on line %d of %s.", value, linenum, CupsFilesFile);
++        if (FatalErrors & CUPSD_FATAL_CONFIG)
++          return (0);
++      }
++    }
+     else if (!_cups_strcasecmp(line, "PrintcapFormat") && value)
+     {
+      /*
+diff --git a/test/run-stp-tests.sh b/test/run-stp-tests.sh
+index 39b53c3e4..2089f7944 100755
+--- a/test/run-stp-tests.sh
++++ b/test/run-stp-tests.sh
+@@ -512,7 +512,7 @@ fi
+
+ cat >$BASE/cups-files.conf <<EOF
+ FileDevice yes
+-Printcap
++Printcap $BASE/printcap
+ User $user
+ ServerRoot $BASE
+ StateDir $BASE
+diff --git a/vcnet/config.h b/vcnet/config.h
+index 7fc459217..76f5adbb7 100644
+--- a/vcnet/config.h
++++ b/vcnet/config.h
+@@ -169,6 +169,13 @@ typedef unsigned long useconds_t;
+ #define CUPS_DEFAULT_ERROR_POLICY "stop-printer"
+
+
++/*
++ * Default PeerCred value...
++ */
++
++#define CUPS_DEFAULT_PEER_CRED "on"
++
++
+ /*
+  * Default MaxCopies value...
+  */
+diff --git a/xcode/CUPS.xcodeproj/project.pbxproj b/xcode/CUPS.xcodeproj/project.pbxproj
+index 597946440..54ac652a1 100644
+--- a/xcode/CUPS.xcodeproj/project.pbxproj
++++ b/xcode/CUPS.xcodeproj/project.pbxproj
+@@ -3433,7 +3433,6 @@
+		72220FB313330BCE00FCA411 /* mime.c */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.c; name = mime.c; path = ../scheduler/mime.c; sourceTree = "<group>"; };
+		72220FB413330BCE00FCA411 /* mime.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; name = mime.h; path = ../scheduler/mime.h; sourceTree = "<group>"; };
+		72220FB513330BCE00FCA411 /* type.c */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.c; name = type.c; path = ../scheduler/type.c; sourceTree = "<group>"; };
+-		7226369B18AE6D19004ED309 /* org.cups.cups-lpd.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; name = "org.cups.cups-lpd.plist"; path = "../scheduler/org.cups.cups-lpd.plist"; sourceTree = SOURCE_ROOT; };
+		7226369C18AE6D19004ED309 /* org.cups.cupsd.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; name = org.cups.cupsd.plist; path = ../scheduler/org.cups.cupsd.plist; sourceTree = SOURCE_ROOT; };
+		7226369D18AE73BB004ED309 /* config.h.in */ = {isa = PBXFileReference; lastKnownFileType = text; name = config.h.in; path = ../config.h.in; sourceTree = "<group>"; };
+		722A24EE2178D00C000CAB20 /* debug-internal.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; name = "debug-internal.h"; path = "../cups/debug-internal.h"; sourceTree = "<group>"; };
+@@ -5055,7 +5054,6 @@
+			isa = PBXGroup;
+			children = (
+				72E65BDC18DC852700097E89 /* Makefile */,
+-				7226369B18AE6D19004ED309 /* org.cups.cups-lpd.plist */,
+				72E65BD518DC818400097E89 /* org.cups.cups-lpd.plist.in */,
+				7226369C18AE6D19004ED309 /* org.cups.cupsd.plist */,
+				72220F6913330B0C00FCA411 /* auth.c */,
+diff --git a/xcode/config.h b/xcode/config.h
+index e4a63f69d..366da777e 100644
+--- a/xcode/config.h
++++ b/xcode/config.h
+@@ -88,6 +88,13 @@
+ #define CUPS_DEFAULT_ERROR_POLICY "stop-printer"
+
+
++/*
++ * Default PeerCred value...
++ */
++
++#define CUPS_DEFAULT_PEER_CRED "on"
++
++
+ /*
+  * Default MaxCopies value...
+  */
+--
+2.44.1
-- 
2.35.6


