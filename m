Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E986CC433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 18:16:36 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.18376.1658081795147702216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 11:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.231, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 1FB6010000A;
	Sun, 17 Jul 2022 18:16:31 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [dunfell][PATCH] curl: Fix CVE-2022-32206, CVE-2022-32207,
 and CVE-2022-32208
Date: Sun, 17 Jul 2022 11:16:18 -0700
Message-Id: <20220717181618.2308925-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 18:16:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168161

Backport fixes for:
 * CVE-2022-32206 - https://curl.se/docs/CVE-2022-32206.html
 * CVE-2022-32207 - https://curl.se/docs/CVE-2022-32207.html
 * CVE-2022-32208 - https://curl.se/docs/CVE-2022-32208.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/curl/CVE-2022-32206.patch            |  52 ++++
 .../curl/curl/CVE-2022-32207.patch            | 284 ++++++++++++++++++
 .../curl/curl/CVE-2022-32208.patch            |  72 +++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 4 files changed, 411 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32206.patch b/meta/recipes-support/curl/curl/CVE-2022-32206.patch
new file mode 100644
index 0000000000..3d76aeb43d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32206.patch
@@ -0,0 +1,52 @@
+From 25e7be39be5f8ed696b6085ced9cf6c17e6128f4 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 16 May 2022 16:28:13 +0200
+Subject: [PATCH] content_encoding: return error on too many compression steps
+
+The max allowed steps is arbitrarily set to 5.
+
+Bug: https://curl.se/docs/CVE-2022-32206.html
+CVE-2022-32206
+Reported-by: Harry Sintonen
+Closes #9049
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3a09fbb7f264c67c43]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/content_encoding.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/content_encoding.c b/lib/content_encoding.c
+index 6d47537..91e621f 100644
+--- a/lib/content_encoding.c
++++ b/lib/content_encoding.c
+@@ -934,6 +934,9 @@ static const content_encoding *find_encoding(const char *name, size_t len)
+   return NULL;
+ }
+ 
++/* allow no more than 5 "chained" compression steps */
++#define MAX_ENCODE_STACK 5
++
+ /* Set-up the unencoding stack from the Content-Encoding header value.
+  * See RFC 7231 section 3.1.2.2. */
+ CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
+@@ -941,6 +944,7 @@ CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
+ {
+   struct Curl_easy *data = conn->data;
+   struct SingleRequest *k = &data->req;
++  int counter = 0;
+ 
+   do {
+     const char *name;
+@@ -975,6 +979,11 @@ CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
+       if(!encoding)
+         encoding = &error_encoding;  /* Defer error at stack use. */
+ 
++      if(++counter >= MAX_ENCODE_STACK) {
++        failf(data, "Reject response due to %u content encodings",
++              counter);
++        return CURLE_BAD_CONTENT_ENCODING;
++      }    
+       /* Stack the unencoding stage. */
+       writer = new_unencoding_writer(conn, encoding, k->writer_stack);
+       if(!writer)
diff --git a/meta/recipes-support/curl/curl/CVE-2022-32207.patch b/meta/recipes-support/curl/curl/CVE-2022-32207.patch
new file mode 100644
index 0000000000..f75aaecd64
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32207.patch
@@ -0,0 +1,284 @@
+From af92181055d7d64dfc0bc9d5a13c8b98af3196be Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 25 May 2022 10:09:53 +0200
+Subject: [PATCH] fopen: add Curl_fopen() for better overwriting of files
+
+Bug: https://curl.se/docs/CVE-2022-32207.html
+CVE-2022-32207
+Reported-by: Harry Sintonen
+Closes #9050
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/20f9dd6bae50b]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ CMakeLists.txt          |   1 +
+ configure.ac            |   1 +
+ lib/Makefile.inc        |   4 +-
+ lib/cookie.c            |  19 ++-----
+ lib/curl_config.h.cmake |   3 ++
+ lib/fopen.c             | 113 ++++++++++++++++++++++++++++++++++++++++
+ lib/fopen.h             |  30 +++++++++++
+ 7 files changed, 155 insertions(+), 16 deletions(-)
+ create mode 100644 lib/fopen.c
+ create mode 100644 lib/fopen.h
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 73b053b..cc587b0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -869,6 +869,7 @@ elseif(HAVE_LIBSOCKET)
+   set(CMAKE_REQUIRED_LIBRARIES socket)
+ endif()
+ 
++check_symbol_exists(fchmod        "${CURL_INCLUDES}" HAVE_FCHMOD)
+ check_symbol_exists(basename      "${CURL_INCLUDES}" HAVE_BASENAME)
+ check_symbol_exists(socket        "${CURL_INCLUDES}" HAVE_SOCKET)
+ check_symbol_exists(select        "${CURL_INCLUDES}" HAVE_SELECT)
+diff --git a/configure.ac b/configure.ac
+index d090622..7071077 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -4059,6 +4059,7 @@ AC_CHECK_DECLS([getpwuid_r], [], [AC_DEFINE(HAVE_DECL_GETPWUID_R_MISSING, 1, "Se
+ 
+ 
+ AC_CHECK_FUNCS([fnmatch \
++  fchmod \
+   geteuid \
+   getpass_r \
+   getppid \
+diff --git a/lib/Makefile.inc b/lib/Makefile.inc
+index 46ded90..79307d8 100644
+--- a/lib/Makefile.inc
++++ b/lib/Makefile.inc
+@@ -63,7 +63,7 @@ LIB_CFILES = file.c timeval.c base64.c hostip.c progress.c formdata.c   \
+   curl_multibyte.c hostcheck.c conncache.c dotdot.c                     \
+   x509asn1.c http2.c smb.c curl_endian.c curl_des.c system_win32.c      \
+   mime.c sha256.c setopt.c curl_path.c curl_ctype.c curl_range.c psl.c  \
+-  doh.c urlapi.c curl_get_line.c altsvc.c socketpair.c rename.c
++  doh.c urlapi.c curl_get_line.c altsvc.c socketpair.c rename.c fopen.c
+ 
+ LIB_HFILES = arpa_telnet.h netrc.h file.h timeval.h hostip.h progress.h \
+   formdata.h cookie.h http.h sendf.h ftp.h url.h dict.h if2ip.h         \
+@@ -84,7 +84,7 @@ LIB_HFILES = arpa_telnet.h netrc.h file.h timeval.h hostip.h progress.h \
+   x509asn1.h http2.h sigpipe.h smb.h curl_endian.h curl_des.h           \
+   curl_printf.h system_win32.h rand.h mime.h curl_sha256.h setopt.h     \
+   curl_path.h curl_ctype.h curl_range.h psl.h doh.h urlapi-int.h        \
+-  curl_get_line.h altsvc.h quic.h socketpair.h rename.h
++  curl_get_line.h altsvc.h quic.h socketpair.h rename.h fopen.h
+ 
+ LIB_RCFILES = libcurl.rc
+ 
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 68054e1..a9ad20a 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -97,8 +97,8 @@ Example set of cookies:
+ #include "curl_memrchr.h"
+ #include "inet_pton.h"
+ #include "parsedate.h"
+-#include "rand.h"
+ #include "rename.h"
++#include "fopen.h"
+ 
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -1524,18 +1524,9 @@ static int cookie_output(struct Curl_easy *data,
+     use_stdout = TRUE;
+   }
+   else {
+-    unsigned char randsuffix[9];
+-
+-    if(Curl_rand_hex(data, randsuffix, sizeof(randsuffix)))
+-      return 2;
+-
+-    tempstore = aprintf("%s.%s.tmp", filename, randsuffix);
+-    if(!tempstore)
+-      return 1;
+-
+-    out = fopen(tempstore, FOPEN_WRITETEXT);
+-    if(!out)
+-      goto error;
++      error = Curl_fopen(data, filename, &out, &tempstore);
++      if(error)
++        goto error;
+   }
+ 
+   fputs("# Netscape HTTP Cookie File\n"
+@@ -1581,7 +1572,7 @@ static int cookie_output(struct Curl_easy *data,
+   if(!use_stdout) {
+     fclose(out);
+     out = NULL;
+-    if(Curl_rename(tempstore, filename)) {
++    if(tempstore && Curl_rename(tempstore, filename)) {
+       unlink(tempstore);
+       goto error;
+     }
+diff --git a/lib/curl_config.h.cmake b/lib/curl_config.h.cmake
+index 98cdf51..fe43751 100644
+--- a/lib/curl_config.h.cmake
++++ b/lib/curl_config.h.cmake
+@@ -124,6 +124,9 @@
+ /* Define to 1 if you have the <assert.h> header file. */
+ #cmakedefine HAVE_ASSERT_H 1
+ 
++/* Define to 1 if you have the `fchmod' function. */
++#cmakedefine HAVE_FCHMOD 1
++
+ /* Define to 1 if you have the `basename' function. */
+ #cmakedefine HAVE_BASENAME 1
+ 
+diff --git a/lib/fopen.c b/lib/fopen.c
+new file mode 100644
+index 0000000..ad3691b
+--- /dev/null
++++ b/lib/fopen.c
+@@ -0,0 +1,113 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++
++#include "curl_setup.h"
++
++#if !defined(CURL_DISABLE_COOKIES) || !defined(CURL_DISABLE_ALTSVC) ||  \
++  !defined(CURL_DISABLE_HSTS)
++
++#ifdef HAVE_FCNTL_H
++#include <fcntl.h>
++#endif
++
++#include "urldata.h"
++#include "rand.h"
++#include "fopen.h"
++/* The last 3 #include files should be in this order */
++#include "curl_printf.h"
++#include "curl_memory.h"
++#include "memdebug.h"
++
++/*
++ * Curl_fopen() opens a file for writing with a temp name, to be renamed
++ * to the final name when completed. If there is an existing file using this
++ * name at the time of the open, this function will clone the mode from that
++ * file.  if 'tempname' is non-NULL, it needs a rename after the file is
++ * written.
++ */
++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
++                    FILE **fh, char **tempname)
++{
++  CURLcode result = CURLE_WRITE_ERROR;
++  unsigned char randsuffix[9];
++  char *tempstore = NULL;
++  struct_stat sb;
++  int fd = -1;
++  *tempname = NULL;
++
++  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
++    /* a non-regular file, fallback to direct fopen() */
++    *fh = fopen(filename, FOPEN_WRITETEXT);
++    if(*fh)
++      return CURLE_OK;
++    goto fail;
++  }
++
++  result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
++  if(result)
++    goto fail;
++
++  tempstore = aprintf("%s.%s.tmp", filename, randsuffix);
++  if(!tempstore) {
++    result = CURLE_OUT_OF_MEMORY;
++    goto fail;
++  }
++
++  result = CURLE_WRITE_ERROR;
++  fd = open(tempstore, O_WRONLY | O_CREAT | O_EXCL, 0600);
++  if(fd == -1)
++    goto fail;
++
++#ifdef HAVE_FCHMOD
++  {
++    struct_stat nsb;
++    if((fstat(fd, &nsb) != -1) &&
++       (nsb.st_uid == sb.st_uid) && (nsb.st_gid == sb.st_gid)) {
++      /* if the user and group are the same, clone the original mode */
++      if(fchmod(fd, sb.st_mode) == -1)
++        goto fail;
++    }
++  }
++#endif
++
++  *fh = fdopen(fd, FOPEN_WRITETEXT);
++  if(!*fh)
++    goto fail;
++
++  *tempname = tempstore;
++  return CURLE_OK;
++
++fail:
++  if(fd != -1) {
++    close(fd);
++    unlink(tempstore);
++  }
++
++  free(tempstore);
++
++  *tempname = NULL;
++  return result;
++}
++
++#endif /* ! disabled */
+diff --git a/lib/fopen.h b/lib/fopen.h
+new file mode 100644
+index 0000000..289e55f
+--- /dev/null
++++ b/lib/fopen.h
+@@ -0,0 +1,30 @@
++#ifndef HEADER_CURL_FOPEN_H
++#define HEADER_CURL_FOPEN_H
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++
++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
++                    FILE **fh, char **tempname);
++
++#endif
diff --git a/meta/recipes-support/curl/curl/CVE-2022-32208.patch b/meta/recipes-support/curl/curl/CVE-2022-32208.patch
new file mode 100644
index 0000000000..2939314d09
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32208.patch
@@ -0,0 +1,72 @@
+From 3b90f0b2a7a84645acce151c86b40d25b5de6615 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 9 Jun 2022 09:27:24 +0200
+Subject: [PATCH] krb5: return error properly on decode errors
+
+Bug: https://curl.se/docs/CVE-2022-32208.html
+CVE-2022-32208
+Reported-by: Harry Sintonen
+Closes #9051
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/6ecdf5136b52af7]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/krb5.c     |  5 +----
+ lib/security.c | 13 ++++++++++---
+ 2 files changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/lib/krb5.c b/lib/krb5.c
+index f50287a..5b77e35 100644
+--- a/lib/krb5.c
++++ b/lib/krb5.c
+@@ -86,11 +86,8 @@ krb5_decode(void *app_data, void *buf, int len,
+   enc.value = buf;
+   enc.length = len;
+   maj = gss_unwrap(&min, *context, &enc, &dec, NULL, NULL);
+-  if(maj != GSS_S_COMPLETE) {
+-    if(len >= 4)
+-      strcpy(buf, "599 ");
++  if(maj != GSS_S_COMPLETE)
+     return -1;
+-  }
+ 
+   memcpy(buf, dec.value, dec.length);
+   len = curlx_uztosi(dec.length);
+diff --git a/lib/security.c b/lib/security.c
+index fbfa707..3542210 100644
+--- a/lib/security.c
++++ b/lib/security.c
+@@ -192,6 +192,7 @@ static CURLcode read_data(struct connectdata *conn,
+ {
+   int len;
+   CURLcode result;
++  int nread;
+ 
+   result = socket_read(fd, &len, sizeof(len));
+   if(result)
+@@ -200,7 +201,10 @@ static CURLcode read_data(struct connectdata *conn,
+   if(len) {
+     /* only realloc if there was a length */
+     len = ntohl(len);
+-    buf->data = Curl_saferealloc(buf->data, len);
++    if(len > CURL_MAX_INPUT_LENGTH)
++      len = 0;
++    else
++      buf->data = Curl_saferealloc(buf->data, len);
+   }
+   if(!len || !buf->data)
+     return CURLE_OUT_OF_MEMORY;
+@@ -208,8 +212,11 @@ static CURLcode read_data(struct connectdata *conn,
+   result = socket_read(fd, buf->data, len);
+   if(result)
+     return result;
+-  buf->size = conn->mech->decode(conn->app_data, buf->data, len,
+-                                 conn->data_prot, conn);
++  nread = buf->size = conn->mech->decode(conn->app_data, buf->data, len,
++                                         conn->data_prot, conn);
++  if(nread < 0)
++    return CURLE_RECV_ERROR;
++  buf->size = (size_t)nread;
+   buf->index = 0;
+   return CURLE_OK;
+ }
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 5a597a7dd9..7b67b68f1d 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -35,6 +35,9 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-27781.patch \
            file://CVE-2022-27782-1.patch \
            file://CVE-2022-27782-2.patch \
+           file://CVE-2022-32206.patch \
+           file://CVE-2022-32207.patch \
+           file://CVE-2022-32208.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.35.1


