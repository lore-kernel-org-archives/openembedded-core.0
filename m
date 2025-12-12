Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AA3D49236
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:09:55 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14688.1765552187954641522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MJ+e3gd3;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22173; q=dns/txt;
  s=iport01; t=1765552188; x=1766761788;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3XEWxy9AEHNU1CySQiHSwR/C00E/ysTic7nQh7S4Kt8=;
  b=MJ+e3gd39Yw3vLQWch5TqxTdJKkQRy7hnU9RdR+bTHECbs2TnBj7quo6
   YwUn46gkx/ZOpecGl02eVkfCSqo809ZEAOOx4OGtTJ7DOLINAluhy9aLh
   KRqBEUOv8pkL39l2ZKyxSFFEBbl5iZihZ5TC6frmcb1x/Jn53OfiONUPe
   LNpN6lZbCmONWWZePjgXLDVPiDdbU7hYhQP2ixeXLqAMNOE3VGm6B7KGw
   NxbJ2p1sePFuiPt2fWSZE78TAniuD0lS8J0SgsdwYluVyVLrp2DhHIMTX
   iBz35FNdEL/u7jPt1S1eldnDcoMsF3/r/9tJwAP86AVEEjSzVFvwAU08G
   Q==;
X-CSE-ConnectionGUID: AnzkGLHaRciVeFxRScGxiQ==
X-CSE-MsgGUID: chdhCTC/TMW38uihbOrI6A==
X-IPAS-Result: =?us-ascii?q?A0AyAADeLjxp/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBghcvf19CSYxwhzeCIQOeGhSBaw8BAQEPPRQEAQGFBwKMZwImNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGFQEHMg2GWgECA?=
 =?us-ascii?q?QMaDQsBVhwDAQIvKyMIGYIqWAGCcwIBEQaxaxo3gXkzgQGDaAJDT9smBoFLA?=
 =?us-ascii?q?YU6gn2BD4QKWBgBhHgHAR8bG4FygRWBO4ItgQWBXAEBgSIkAoZcBIIigQ6GH?=
 =?us-ascii?q?XiBLAMsHhCGdwaJTUiBHgNZLAFVEw0KCwcFgWYDNQwLKhVuMh2BIz4Xc4RdH?=
 =?us-ascii?q?mgOBoERg1GBNIdkD4l2SAMLGA1IESw3FBsGPm4HlBpOgT8BcAIBFRcEDD4TA?=
 =?us-ascii?q?QcUDwEgPSgTKwofHAEeBQ4DPZJXCQgBAQc7j1mCIYE1n1kKKIN0jB6VORozh?=
 =?us-ascii?q?ASUFZJSC5h7jgiVNiogUIRogWg8gUcLB3AVgyJSGQ+HKoQ9gkMDAQoLg16Bf?=
 =?us-ascii?q?79YIjU8AgcLAQEDCZMHYAEB?=
IronPort-Data: A9a23:MDr9QaPlrnUtVxLvrR30lsFynXyQoLVcMsEvi/4bfWQNrUomhTIPz
 2NOXG/TM6uLNjD9e4tzbt+09kIG7ZGEyIRjSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZQb/gmQsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69xoHkIZGa0RwO12P2xg5
 cYjIx8dbynW0opawJrjIgVtrt4oIM+uOMYUvWttiGmDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQtieK9a4CKJYziqcN9lUaUp
 kn61CPFJy5BZMGeyTCi6FPyr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:bNymJaPv75zT38BcTsCjsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3DHio379
 YHT0C4Y+eAamRHsQ==
X-Talos-CUID: 9a23:8/GJlm6T180KlqBw89ss3UgGGe8BUnTnx3buLmGoM11iZ62UcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AJC4e3Q8fDbaBipGkQtx3B1GQf8xo76SFNGtKrbA?=
 =?us-ascii?q?54JmZNCx6HC280h3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,144,1763424000"; 
   d="scan'208";a="412832778"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Dec 2025 15:09:46 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 89CAF18000375
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:09:46 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 2F9BCCC12B5; Fri, 12 Dec 2025 07:09:44 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [scarthgap] [PATCH v2 1/2] cups 2.4.11: Fix CVE-2025-58436
Date: Fri, 12 Dec 2025 07:09:25 -0800
Message-Id: <20251212150925.1013202-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20251210150857.2780243-1-deeratho@cisco.com>
References: <20251210150857.2780243-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227596

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/OpenPrinting/cups.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-58436
Type: Security Fix
CVE: CVE-2025-58436
Score: 5.5
Patch: https://github.com/OpenPrinting/cups/commit/5d414f1f91bd

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes from v1->v2: Fixed patch fuzz issue and Applied patch generated
from devtool with correct context for cups 2.4.11.
- Preserves upstream CUPS coding style (space-before-tab)
to maintain consistency with source.

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 0a26a9b6de..cf3df32306 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://cups-volatiles.conf \
            file://CVE-2025-58060.patch \
            file://CVE-2025-58364.patch \
+           file://CVE-2025-58436.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58436.patch b/meta/recipes-extended/cups/cups/CVE-2025-58436.patch
new file mode 100644
index 0000000000..5083d082dc
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58436.patch
@@ -0,0 +1,635 @@
+From 7587d27139227397ab68cce554a112bb1190e6b6 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Mon, 13 Oct 2025 10:16:48 +0200
+Subject: [PATCH] Fix unresponsive cupsd process caused by a slow client
+
+If client is very slow, it will slow cupsd process for other clients.
+The fix is the best effort without turning scheduler cupsd into
+multithreaded process which would be too complex and error-prone when
+backporting to 2.4.x series.
+
+The fix for unencrypted communication is to follow up on communication
+only if there is the whole line on input, and the waiting time is
+guarded by timeout.
+
+Encrypted communication now starts after we have the whole client hello
+packet, which conflicts with optional upgrade support to HTTPS via
+methods other than method OPTIONS, so this optional support defined in
+RFC 2817, section 3.1 is removed. Too slow or incomplete requests are
+handled by connection timeout.
+
+Fixes CVE-2025-58436
+
+CVE: CVE-2025-58436
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/5d414f1f91bd]
+
+(cherry picked from commit 5d414f1f91bdca118413301b148f0b188eb1cdc6)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ cups/http-private.h |   7 +-
+ cups/http.c         |  80 +++++++++++++-------
+ cups/tls-openssl.c  |  15 +++-
+ scheduler/client.c  | 178 ++++++++++++++++++++++++++++----------------
+ scheduler/client.h  |   3 +
+ scheduler/select.c  |  12 +++
+ 6 files changed, 198 insertions(+), 97 deletions(-)
+
+diff --git a/cups/http-private.h b/cups/http-private.h
+index 5f77b8ef0..b8e200bf6 100644
+--- a/cups/http-private.h
++++ b/cups/http-private.h
+@@ -121,6 +121,7 @@ extern "C" {
+  * Constants...
+  */
+
++#  define _HTTP_MAX_BUFFER	32768	/* Size of read buffer */
+ #  define _HTTP_MAX_SBUFFER	65536	/* Size of (de)compression buffer */
+ #  define _HTTP_RESOLVE_DEFAULT	0	/* Just resolve with default options */
+ #  define _HTTP_RESOLVE_STDERR	1	/* Log resolve progress to stderr */
+@@ -232,8 +233,8 @@ struct _http_s				/**** HTTP connection structure ****/
+   http_encoding_t	data_encoding;	/* Chunked or not */
+   int			_data_remaining;/* Number of bytes left (deprecated) */
+   int			used;		/* Number of bytes used in buffer */
+-  char			buffer[HTTP_MAX_BUFFER];
+-					/* Buffer for incoming data */
++  char			_buffer[HTTP_MAX_BUFFER];
++					/* Old read buffer (deprecated) */
+   int			_auth_type;	/* Authentication in use (deprecated) */
+   unsigned char		_md5_state[88];	/* MD5 state (deprecated) */
+   char			nonce[HTTP_MAX_VALUE];
+@@ -307,6 +308,8 @@ struct _http_s				/**** HTTP connection structure ****/
+ 					/* Allocated field values */
+   			*default_fields[HTTP_FIELD_MAX];
+ 					/* Default field values, if any */
++  char			buffer[_HTTP_MAX_BUFFER];
++					/* Read buffer */
+ };
+ #  endif /* !_HTTP_NO_PRIVATE */
+
+diff --git a/cups/http.c b/cups/http.c
+index 31a8be361..599703c7b 100644
+--- a/cups/http.c
++++ b/cups/http.c
+@@ -53,7 +53,7 @@ static http_t		*http_create(const char *host, int port,
+ static void		http_debug_hex(const char *prefix, const char *buffer,
+ 			               int bytes);
+ #endif /* DEBUG */
+-static ssize_t		http_read(http_t *http, char *buffer, size_t length);
++static ssize_t		http_read(http_t *http, char *buffer, size_t length, int timeout);
+ static ssize_t		http_read_buffered(http_t *http, char *buffer, size_t length);
+ static ssize_t		http_read_chunk(http_t *http, char *buffer, size_t length);
+ static int		http_send(http_t *http, http_state_t request,
+@@ -1200,7 +1200,7 @@ httpGets(char   *line,			/* I - Line to read into */
+         return (NULL);
+       }
+
+-      bytes = http_read(http, http->buffer + http->used, (size_t)(HTTP_MAX_BUFFER - http->used));
++      bytes = http_read(http, http->buffer + http->used, (size_t)(_HTTP_MAX_BUFFER - http->used), http->wait_value);
+
+       DEBUG_printf(("4httpGets: read " CUPS_LLFMT " bytes.", CUPS_LLCAST bytes));
+
+@@ -1720,24 +1720,13 @@ httpPeek(http_t *http,			/* I - HTTP connection */
+
+     ssize_t	buflen;			/* Length of read for buffer */
+
+-    if (!http->blocking)
+-    {
+-      while (!httpWait(http, http->wait_value))
+-      {
+-	if (http->timeout_cb && (*http->timeout_cb)(http, http->timeout_data))
+-	  continue;
+-
+-	return (0);
+-      }
+-    }
+-
+     if ((size_t)http->data_remaining > sizeof(http->buffer))
+       buflen = sizeof(http->buffer);
+     else
+       buflen = (ssize_t)http->data_remaining;
+
+     DEBUG_printf(("2httpPeek: Reading %d bytes into buffer.", (int)buflen));
+-    bytes = http_read(http, http->buffer, (size_t)buflen);
++    bytes = http_read(http, http->buffer, (size_t)buflen, http->wait_value);
+
+     DEBUG_printf(("2httpPeek: Read " CUPS_LLFMT " bytes into buffer.",
+                   CUPS_LLCAST bytes));
+@@ -1758,9 +1747,9 @@ httpPeek(http_t *http,			/* I - HTTP connection */
+     int		zerr;			/* Decompressor error */
+     z_stream	stream;			/* Copy of decompressor stream */
+
+-    if (http->used > 0 && ((z_stream *)http->stream)->avail_in < HTTP_MAX_BUFFER)
++    if (http->used > 0 && ((z_stream *)http->stream)->avail_in < _HTTP_MAX_BUFFER)
+     {
+-      size_t buflen = HTTP_MAX_BUFFER - ((z_stream *)http->stream)->avail_in;
++      size_t buflen = _HTTP_MAX_BUFFER - ((z_stream *)http->stream)->avail_in;
+ 					/* Number of bytes to copy */
+
+       if (((z_stream *)http->stream)->avail_in > 0 &&
+@@ -2018,7 +2007,7 @@ httpRead2(http_t *http,			/* I - HTTP connection */
+
+       if (bytes == 0)
+       {
+-        ssize_t buflen = HTTP_MAX_BUFFER - (ssize_t)((z_stream *)http->stream)->avail_in;
++        ssize_t buflen = _HTTP_MAX_BUFFER - (ssize_t)((z_stream *)http->stream)->avail_in;
+ 					/* Additional bytes for buffer */
+
+         if (buflen > 0)
+@@ -2768,7 +2757,7 @@ int					/* O - 1 to continue, 0 to stop */
+ _httpUpdate(http_t        *http,	/* I - HTTP connection */
+             http_status_t *status)	/* O - Current HTTP status */
+ {
+-  char		line[32768],		/* Line from connection... */
++  char		line[_HTTP_MAX_BUFFER],	/* Line from connection... */
+ 		*value;			/* Pointer to value on line */
+   http_field_t	field;			/* Field index */
+   int		major, minor;		/* HTTP version numbers */
+@@ -2776,12 +2765,46 @@ _httpUpdate(http_t        *http,	/* I - HTTP connection */
+
+   DEBUG_printf(("_httpUpdate(http=%p, status=%p), state=%s", (void *)http, (void *)status, httpStateString(http->state)));
+
++  /* When doing non-blocking I/O, make sure we have a whole line... */
++  if (!http->blocking)
++  {
++    ssize_t	bytes;			/* Bytes "peeked" from connection */
++
++    /* See whether our read buffer is full... */
++    DEBUG_printf(("2_httpUpdate: used=%d", http->used));
++
++    if (http->used > 0 && !memchr(http->buffer, '\n', (size_t)http->used) && (size_t)http->used < sizeof(http->buffer))
++    {
++      /* No, try filling in more data... */
++      if ((bytes = http_read(http, http->buffer + http->used, sizeof(http->buffer) - (size_t)http->used, /*timeout*/0)) > 0)
++      {
++	DEBUG_printf(("2_httpUpdate: Read %d bytes.", (int)bytes));
++	http->used += (int)bytes;
++      }
++    }
++
++    /* Peek at the incoming data... */
++    if (!http->used || !memchr(http->buffer, '\n', (size_t)http->used))
++    {
++      /* Don't have a full line, tell the reader to try again when there is more data... */
++      DEBUG_puts("1_htttpUpdate: No newline in buffer yet.");
++      if ((size_t)http->used == sizeof(http->buffer))
++	*status = HTTP_STATUS_ERROR;
++      else
++	*status = HTTP_STATUS_CONTINUE;
++      return (0);
++    }
++
++    DEBUG_puts("2_httpUpdate: Found newline in buffer.");
++  }
++
+  /*
+   * Grab a single line from the connection...
+   */
+
+   if (!httpGets(line, sizeof(line), http))
+   {
++    DEBUG_puts("1_httpUpdate: Error reading request line.");
+     *status = HTTP_STATUS_ERROR;
+     return (0);
+   }
+@@ -4134,7 +4157,8 @@ http_debug_hex(const char *prefix,	/* I - Prefix for line */
+ static ssize_t				/* O - Number of bytes read or -1 on error */
+ http_read(http_t *http,			/* I - HTTP connection */
+           char   *buffer,		/* I - Buffer */
+-          size_t length)		/* I - Maximum bytes to read */
++          size_t length,		/* I - Maximum bytes to read */
++          int    timeout)		/* I - Wait timeout */
+ {
+   ssize_t	bytes;			/* Bytes read */
+
+@@ -4143,7 +4167,7 @@ http_read(http_t *http,			/* I - HTTP connection */
+
+   if (!http->blocking || http->timeout_value > 0.0)
+   {
+-    while (!httpWait(http, http->wait_value))
++    while (!_httpWait(http, timeout, 1))
+     {
+       if (http->timeout_cb && (*http->timeout_cb)(http, http->timeout_data))
+ 	continue;
+@@ -4246,7 +4270,7 @@ http_read_buffered(http_t *http,	/* I - HTTP connection */
+     else
+       bytes = (ssize_t)length;
+
+-    DEBUG_printf(("8http_read: Grabbing %d bytes from input buffer.",
++    DEBUG_printf(("8http_read_buffered: Grabbing %d bytes from input buffer.",
+                   (int)bytes));
+
+     memcpy(buffer, http->buffer, (size_t)bytes);
+@@ -4256,7 +4280,7 @@ http_read_buffered(http_t *http,	/* I - HTTP connection */
+       memmove(http->buffer, http->buffer + bytes, (size_t)http->used);
+   }
+   else
+-    bytes = http_read(http, buffer, length);
++    bytes = http_read(http, buffer, length, http->wait_value);
+
+   return (bytes);
+ }
+@@ -4597,15 +4621,15 @@ http_set_timeout(int    fd,		/* I - File descriptor */
+ static void
+ http_set_wait(http_t *http)		/* I - HTTP connection */
+ {
+-  if (http->blocking)
+-  {
+-    http->wait_value = (int)(http->timeout_value * 1000);
++  http->wait_value = (int)(http->timeout_value * 1000);
+
+-    if (http->wait_value <= 0)
++  if (http->wait_value <= 0)
++  {
++    if (http->blocking)
+       http->wait_value = 60000;
++    else
++      http->wait_value = 1000;
+   }
+-  else
+-    http->wait_value = 10000;
+ }
+
+
+diff --git a/cups/tls-openssl.c b/cups/tls-openssl.c
+index 9fcbe0af3..f746f4cba 100644
+--- a/cups/tls-openssl.c
++++ b/cups/tls-openssl.c
+@@ -215,12 +215,14 @@ cupsMakeServerCredentials(
+   // Save them...
+   if ((bio = BIO_new_file(keyfile, "wb")) == NULL)
+   {
++    DEBUG_printf(("1cupsMakeServerCredentials: Unable to create private key file '%s': %s", keyfile, strerror(errno)));
+     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, strerror(errno), 0);
+     goto done;
+   }
+
+   if (!PEM_write_bio_PrivateKey(bio, pkey, NULL, NULL, 0, NULL, NULL))
+   {
++    DEBUG_puts("1cupsMakeServerCredentials: PEM_write_bio_PrivateKey failed.");
+     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to write private key."), 1);
+     BIO_free(bio);
+     goto done;
+@@ -230,12 +232,14 @@ cupsMakeServerCredentials(
+
+   if ((bio = BIO_new_file(crtfile, "wb")) == NULL)
+   {
++    DEBUG_printf(("1cupsMakeServerCredentials: Unable to create certificate file '%s': %s", crtfile, strerror(errno)));
+     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, strerror(errno), 0);
+     goto done;
+   }
+
+   if (!PEM_write_bio_X509(bio, cert))
+   {
++    DEBUG_puts("1cupsMakeServerCredentials: PEM_write_bio_X509 failed.");
+     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to write X.509 certificate."), 1);
+     BIO_free(bio);
+     goto done;
+@@ -1082,10 +1086,10 @@ _httpTLSStart(http_t *http)		// I - Connection to server
+
+       if (!cupsMakeServerCredentials(tls_keypath, cn, 0, NULL, time(NULL) + 3650 * 86400))
+       {
+-	DEBUG_puts("4_httpTLSStart: cupsMakeServerCredentials failed.");
++	DEBUG_printf(("4_httpTLSStart: cupsMakeServerCredentials failed: %s", cupsLastErrorString()));
+ 	http->error  = errno = EINVAL;
+ 	http->status = HTTP_STATUS_ERROR;
+-	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to create server credentials."), 1);
++//	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to create server credentials."), 1);
+ 	SSL_CTX_free(context);
+         _cupsMutexUnlock(&tls_mutex);
+
+@@ -1346,14 +1350,17 @@ http_bio_read(BIO  *h,			// I - BIO data
+
+   http = (http_t *)BIO_get_data(h);
+
+-  if (!http->blocking)
++  if (!http->blocking || http->timeout_value > 0.0)
+   {
+    /*
+     * Make sure we have data before we read...
+     */
+
+-    if (!_httpWait(http, 10000, 0))
++    while (!_httpWait(http, http->wait_value, 0))
+     {
++      if (http->timeout_cb && (*http->timeout_cb)(http, http->timeout_data))
++	continue;
++
+ #ifdef WIN32
+       http->error = WSAETIMEDOUT;
+ #else
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 233f9017d..d495d9a75 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -34,11 +34,11 @@
+
+ static int		check_if_modified(cupsd_client_t *con,
+ 			                  struct stat *filestats);
+-static int		compare_clients(cupsd_client_t *a, cupsd_client_t *b,
+-			                void *data);
+ #ifdef HAVE_TLS
+-static int		cupsd_start_tls(cupsd_client_t *con, http_encryption_t e);
++static int		check_start_tls(cupsd_client_t *con);
+ #endif /* HAVE_TLS */
++static int		compare_clients(cupsd_client_t *a, cupsd_client_t *b,
++			                void *data);
+ static char		*get_file(cupsd_client_t *con, struct stat *filestats,
+ 			          char *filename, size_t len);
+ static http_status_t	install_cupsd_conf(cupsd_client_t *con);
+@@ -360,14 +360,20 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+   if (lis->encryption == HTTP_ENCRYPTION_ALWAYS)
+   {
+    /*
+-    * https connection; go secure...
++    * HTTPS connection, force TLS negotiation...
+     */
+
+-    if (cupsd_start_tls(con, HTTP_ENCRYPTION_ALWAYS))
+-      cupsdCloseClient(con);
++    con->tls_start = time(NULL);
++    con->encryption = HTTP_ENCRYPTION_ALWAYS;
+   }
+   else
++  {
++   /*
++    * HTTP connection, but check for HTTPS negotiation on first data...
++    */
++
+     con->auto_ssl = 1;
++  }
+ #endif /* HAVE_TLS */
+ }
+
+@@ -606,17 +612,46 @@ cupsdReadClient(cupsd_client_t *con)	/* I - Client to read from */
+
+     con->auto_ssl = 0;
+
+-    if (recv(httpGetFd(con->http), buf, 1, MSG_PEEK) == 1 &&
+-        (!buf[0] || !strchr("DGHOPT", buf[0])))
++    if (recv(httpGetFd(con->http), buf, 5, MSG_PEEK) == 5 && buf[0] == 0x16 && buf[1] == 3 && buf[2])
+     {
+      /*
+-      * Encrypt this connection...
++      * Client hello record, encrypt this connection...
+       */
+
+-      cupsdLogClient(con, CUPSD_LOG_DEBUG2, "Saw first byte %02X, auto-negotiating SSL/TLS session.", buf[0] & 255);
++      cupsdLogClient(con, CUPSD_LOG_DEBUG2, "Saw client hello record, auto-negotiating TLS session.");
++      con->tls_start = time(NULL);
++      con->encryption = HTTP_ENCRYPTION_ALWAYS;
++    }
++  }
+
+-      if (cupsd_start_tls(con, HTTP_ENCRYPTION_ALWAYS))
+-        cupsdCloseClient(con);
++  if (con->tls_start)
++  {
++   /*
++    * Try negotiating TLS...
++    */
++
++    int tls_status = check_start_tls(con);
++
++    if (tls_status < 0)
++    {
++     /*
++      * TLS negotiation failed, close the connection.
++      */
++
++      cupsdCloseClient(con);
++      return;
++    }
++    else if (tls_status == 0)
++    {
++     /*
++      * Nothing to do yet...
++      */
++
++      if ((time(NULL) - con->tls_start) > 5)
++      {
++	// Timeout, close the connection...
++	cupsdCloseClient(con);
++      }
+
+       return;
+     }
+@@ -780,9 +815,7 @@ cupsdReadClient(cupsd_client_t *con)	/* I - Client to read from */
+         * Parse incoming parameters until the status changes...
+ 	*/
+
+-        while ((status = httpUpdate(con->http)) == HTTP_STATUS_CONTINUE)
+-	  if (!httpGetReady(con->http))
+-	    break;
++	status = httpUpdate(con->http);
+
+ 	if (status != HTTP_STATUS_OK && status != HTTP_STATUS_CONTINUE)
+ 	{
+@@ -944,11 +977,10 @@ cupsdReadClient(cupsd_client_t *con)	/* I - Client to read from */
+ 	  return;
+ 	}
+
+-        if (cupsd_start_tls(con, HTTP_ENCRYPTION_REQUIRED))
+-        {
+-	  cupsdCloseClient(con);
+-	  return;
+-	}
++	con->tls_start = time(NULL);
++	con->tls_upgrade = 1;
++	con->encryption = HTTP_ENCRYPTION_REQUIRED;
++	return;
+ #else
+ 	if (!cupsdSendError(con, HTTP_STATUS_NOT_IMPLEMENTED, CUPSD_AUTH_NONE))
+ 	{
+@@ -987,32 +1019,11 @@ cupsdReadClient(cupsd_client_t *con)	/* I - Client to read from */
+       if (!_cups_strcasecmp(httpGetField(con->http, HTTP_FIELD_CONNECTION),
+                             "Upgrade") && !httpIsEncrypted(con->http))
+       {
+-#ifdef HAVE_TLS
+-       /*
+-        * Do encryption stuff...
+-	*/
+-
+-        httpClearFields(con->http);
+-
+-	if (!cupsdSendHeader(con, HTTP_STATUS_SWITCHING_PROTOCOLS, NULL,
+-	                     CUPSD_AUTH_NONE))
+-	{
+-	  cupsdCloseClient(con);
+-	  return;
+-	}
+-
+-        if (cupsd_start_tls(con, HTTP_ENCRYPTION_REQUIRED))
+-        {
+-	  cupsdCloseClient(con);
+-	  return;
+-	}
+-#else
+ 	if (!cupsdSendError(con, HTTP_STATUS_NOT_IMPLEMENTED, CUPSD_AUTH_NONE))
+ 	{
+ 	  cupsdCloseClient(con);
+ 	  return;
+ 	}
+-#endif /* HAVE_TLS */
+       }
+
+       if ((status = cupsdIsAuthorized(con, NULL)) != HTTP_STATUS_OK)
+@@ -2685,6 +2696,69 @@ check_if_modified(
+ }
+
+
++#ifdef HAVE_TLS
++/*
++ * 'check_start_tls()' - Start encryption on a connection.
++ */
++
++static int				/* O - 0 to continue, 1 on success, -1 on error */
++check_start_tls(cupsd_client_t *con)	/* I - Client connection */
++{
++  unsigned char	chello[4096];		/* Client hello record */
++  ssize_t	chello_bytes;		/* Bytes read/peeked */
++  int		chello_len;		/* Length of record */
++
++
++ /*
++  * See if we have a good and complete client hello record...
++  */
++
++  if ((chello_bytes = recv(httpGetFd(con->http), (char *)chello, sizeof(chello), MSG_PEEK)) < 5)
++    return (0);				/* Not enough bytes (yet) */
++
++  if (chello[0] != 0x016 || chello[1] != 3 || chello[2] == 0)
++    return (-1);			/* Not a TLS Client Hello record */
++
++  chello_len = (chello[3] << 8) | chello[4];
++
++  if ((chello_len + 5) > chello_bytes)
++    return (0);				/* Not enough bytes yet */
++
++ /*
++  * OK, we do, try negotiating...
++  */
++
++  con->tls_start = 0;
++
++  if (httpEncryption(con->http, con->encryption))
++  {
++    cupsdLogClient(con, CUPSD_LOG_ERROR, "Unable to encrypt connection: %s", cupsLastErrorString());
++    return (-1);
++  }
++
++  cupsdLogClient(con, CUPSD_LOG_DEBUG, "Connection now encrypted.");
++
++  if (con->tls_upgrade)
++  {
++    // Respond to the original OPTIONS command...
++    con->tls_upgrade = 0;
++
++    httpClearFields(con->http);
++    httpClearCookie(con->http);
++    httpSetField(con->http, HTTP_FIELD_CONTENT_LENGTH, "0");
++
++    if (!cupsdSendHeader(con, HTTP_STATUS_OK, NULL, CUPSD_AUTH_NONE))
++    {
++      cupsdCloseClient(con);
++      return (-1);
++    }
++  }
++
++  return (1);
++}
++#endif /* HAVE_TLS */
++
++
+ /*
+  * 'compare_clients()' - Compare two client connections.
+  */
+@@ -2705,28 +2779,6 @@ compare_clients(cupsd_client_t *a,	/* I - First client */
+ }
+
+
+-#ifdef HAVE_TLS
+-/*
+- * 'cupsd_start_tls()' - Start encryption on a connection.
+- */
+-
+-static int				/* O - 0 on success, -1 on error */
+-cupsd_start_tls(cupsd_client_t    *con,	/* I - Client connection */
+-                http_encryption_t e)	/* I - Encryption mode */
+-{
+-  if (httpEncryption(con->http, e))
+-  {
+-    cupsdLogClient(con, CUPSD_LOG_ERROR, "Unable to encrypt connection: %s",
+-                   cupsLastErrorString());
+-    return (-1);
+-  }
+-
+-  cupsdLogClient(con, CUPSD_LOG_DEBUG, "Connection now encrypted.");
+-  return (0);
+-}
+-#endif /* HAVE_TLS */
+-
+-
+ /*
+  * 'get_file()' - Get a filename and state info.
+  */
+diff --git a/scheduler/client.h b/scheduler/client.h
+index 9fe4e2ea6..2939ce997 100644
+--- a/scheduler/client.h
++++ b/scheduler/client.h
+@@ -53,6 +53,9 @@ struct cupsd_client_s
+   cups_lang_t		*language;	/* Language to use */
+ #ifdef HAVE_TLS
+   int			auto_ssl;	/* Automatic test for SSL/TLS */
++  time_t		tls_start;	/* Do TLS negotiation? */
++  int			tls_upgrade;	/* Doing TLS upgrade via OPTIONS? */
++  http_encryption_t	encryption;	/* Type of TLS negotiation */
+ #endif /* HAVE_TLS */
+   http_addr_t		clientaddr;	/* Client's server address */
+   char			clientname[256];/* Client's server name for connection */
+diff --git a/scheduler/select.c b/scheduler/select.c
+index 2e64f2a7e..ac6205c51 100644
+--- a/scheduler/select.c
++++ b/scheduler/select.c
+@@ -408,6 +408,9 @@ cupsdDoSelect(long timeout)		/* I - Timeout in seconds */
+
+   cupsd_in_select = 1;
+
++  // Prevent 100% CPU by releasing control before the kevent call...
++  usleep(1);
++
+   if (timeout >= 0 && timeout < 86400)
+   {
+     ktimeout.tv_sec  = timeout;
+@@ -452,6 +455,9 @@ cupsdDoSelect(long timeout)		/* I - Timeout in seconds */
+     struct epoll_event	*event;		/* Current event */
+
+
++    // Prevent 100% CPU by releasing control before the epoll_wait call...
++    usleep(1);
++
+     if (timeout >= 0 && timeout < 86400)
+       nfds = epoll_wait(cupsd_epoll_fd, cupsd_epoll_events, MaxFDs,
+                 	timeout * 1000);
+@@ -544,6 +550,9 @@ cupsdDoSelect(long timeout)		/* I - Timeout in seconds */
+     }
+   }
+
++  // Prevent 100% CPU by releasing control before the poll call...
++  usleep(1);
++
+   if (timeout >= 0 && timeout < 86400)
+     nfds = poll(cupsd_pollfds, (nfds_t)count, timeout * 1000);
+   else
+@@ -597,6 +606,9 @@ cupsdDoSelect(long timeout)		/* I - Timeout in seconds */
+   cupsd_current_input  = cupsd_global_input;
+   cupsd_current_output = cupsd_global_output;
+
++  // Prevent 100% CPU by releasing control before the select call...
++  usleep(1);
++
+   if (timeout >= 0 && timeout < 86400)
+   {
+     stimeout.tv_sec  = timeout;
+--
+2.44.1
+
-- 
2.35.6


