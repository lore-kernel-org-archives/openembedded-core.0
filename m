Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id BB70276116
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:49 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so77093317pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=F3M8e08ZXBYiqWhLJak8tmwEaqbA8xBD5xRtv52oKbM=;
	b=q7avO3OxsRayhAXtFbtVaUkFJrl4VJ0Tv6Vst/3waLJsdI1kkZPsfSsWoV4Rq5nR3m
	TAIvCU8mDPZUSjeu7fWrmDW+8rJJ1nWSLUsdlskJRjmqdEGwtHffMfqp3oqYBVko77E/
	nhpSx5XZFmo9yUTfcj+CzNkUBR4k7qt0Styt2lSwoyt5CdxazlhAHZ9RVhZdl5Bz/5Iq
	WXTExN7HGm8GqCvE3SRRhCNeEprATuxmqhtKGOEU+IzbINpHLOEk7CkxuabFbAHhuztQ
	zcA3yBcieQ/ChBlb0R5xg7McNE+n9ykHRRQTGLPYwM7KJmeKJNYyhBSuyTs3RNFdZVVV
	tv0A==
X-Received: by 10.66.119.174 with SMTP id kv14mr39899481pab.5.1437232609739;
	Sat, 18 Jul 2015 08:16:49 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o7sm14663381pdi.16.2015.07.18.08.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 60A84FC12ED; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:12 -0700
Message-Id: <8f16017c6fac2802762538a94b3091c89dc9e123.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 05/25] curl: add a few missing security fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jul 2015 15:16:49 -0000

CVE-2014-3707
CVE-2014-8150
CVE-2015-3153

not affected by:  CVE-2014-8151

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2014-3707.patch | 416 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2014-8150.patch |  29 ++
 meta/recipes-support/curl/curl/CVE-2015-3153.patch |  90 +++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   6 +
 4 files changed, 541 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3707.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-8150.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3153.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2014-3707.patch b/meta/recipes-support/curl/curl/CVE-2014-3707.patch
new file mode 100644
index 0000000..7ff38a6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3707.patch
@@ -0,0 +1,416 @@
+From 3696fc1ba79d9b34660c44150be5e93ecf87dd9e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 17 Oct 2014 12:59:32 +0200
+Subject: [PATCH] curl_easy_duphandle: CURLOPT_COPYPOSTFIELDS read out of
+ bounds
+
+When duplicating a handle, the data to post was duplicated using
+strdup() when it could be binary and contain zeroes and it was not even
+zero terminated! This caused read out of bounds crashes/segfaults.
+
+Since the lib/strdup.c file no longer is easily shared with the curl
+tool with this change, it now uses its own version instead.
+
+Bug: http://curl.haxx.se/docs/adv_20141105.html
+CVE: CVE-2014-3707
+Reported-By: Symeon Paraschoudis
+---
+ lib/formdata.c    | 52 +++++++++-------------------------------------------
+ lib/strdup.c      | 32 +++++++++++++++++++++++++++-----
+ lib/strdup.h      |  3 ++-
+ lib/url.c         | 22 +++++++++++++++++-----
+ lib/urldata.h     | 11 +++++++++--
+ src/Makefile.inc  |  4 ++--
+ src/tool_setup.h  |  5 ++---
+ src/tool_strdup.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
+ src/tool_strdup.h | 30 ++++++++++++++++++++++++++++++
+ 9 files changed, 145 insertions(+), 61 deletions(-)
+ create mode 100644 src/tool_strdup.c
+ create mode 100644 src/tool_strdup.h
+
+Index: curl-7.37.1/lib/formdata.c
+===================================================================
+--- curl-7.37.1.orig/lib/formdata.c
++++ curl-7.37.1/lib/formdata.c
+@@ -36,6 +36,7 @@
+ #include "strequal.h"
+ #include "curl_memory.h"
+ #include "sendf.h"
++#include "strdup.h"
+ 
+ #define _MPRINTF_REPLACE /* use our functions only */
+ #include <curl/mprintf.h>
+@@ -214,46 +215,6 @@ static const char *ContentTypeForFilenam
+ 
+ /***************************************************************************
+  *
+- * memdup()
+- *
+- * Copies the 'source' data to a newly allocated buffer buffer (that is
+- * returned). Uses buffer_length if not null, else uses strlen to determine
+- * the length of the buffer to be copied
+- *
+- * Returns the new pointer or NULL on failure.
+- *
+- ***************************************************************************/
+-static char *memdup(const char *src, size_t buffer_length)
+-{
+-  size_t length;
+-  bool add = FALSE;
+-  char *buffer;
+-
+-  if(buffer_length)
+-    length = buffer_length;
+-  else if(src) {
+-    length = strlen(src);
+-    add = TRUE;
+-  }
+-  else
+-    /* no length and a NULL src pointer! */
+-    return strdup("");
+-
+-  buffer = malloc(length+add);
+-  if(!buffer)
+-    return NULL; /* fail */
+-
+-  memcpy(buffer, src, length);
+-
+-  /* if length unknown do null termination */
+-  if(add)
+-    buffer[length] = '\0';
+-
+-  return buffer;
+-}
+-
+-/***************************************************************************
+- *
+  * FormAdd()
+  *
+  * Stores a formpost parameter and builds the appropriate linked list.
+@@ -682,9 +643,12 @@ CURLFORMcode FormAdd(struct curl_httppos
+            (form == first_form) ) {
+           /* Note that there's small risk that form->name is NULL here if the
+              app passed in a bad combo, so we better check for that first. */
+-          if(form->name)
++          if(form->name) {
+             /* copy name (without strdup; possibly contains null characters) */
+-            form->name = memdup(form->name, form->namelength);
++            form->name = Curl_memdup(form->name, form->namelength?
++                                     form->namelength:
++                                     strlen(form->name)+1);
++          }
+           if(!form->name) {
+             return_value = CURL_FORMADD_MEMORY;
+             break;
+@@ -695,7 +659,7 @@ CURLFORMcode FormAdd(struct curl_httppos
+                             HTTPPOST_PTRCONTENTS | HTTPPOST_PTRBUFFER |
+                             HTTPPOST_CALLBACK)) ) {
+           /* copy value (without strdup; possibly contains null characters) */
+-          form->value = memdup(form->value, form->contentslength);
++          form->value = Curl_memdup(form->value, form->contentslength);
+           if(!form->value) {
+             return_value = CURL_FORMADD_MEMORY;
+             break;
+Index: curl-7.37.1/lib/strdup.c
+===================================================================
+--- curl-7.37.1.orig/lib/strdup.c
++++ curl-7.37.1/lib/strdup.c
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2012, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -19,12 +19,12 @@
+  * KIND, either express or implied.
+  *
+  ***************************************************************************/
+-/*
+- * This file is 'mem-include-scan' clean. See test 1132.
+- */
+ #include "curl_setup.h"
+-
+ #include "strdup.h"
++#include "curl_memory.h"
++
++/* The last #include file should be: */
++#include "memdebug.h"
+ 
+ #ifndef HAVE_STRDUP
+ char *curlx_strdup(const char *str)
+@@ -50,3 +50,25 @@ char *curlx_strdup(const char *str)
+ 
+ }
+ #endif
++
++/***************************************************************************
++ *
++ * Curl_memdup(source, length)
++ *
++ * Copies the 'source' data to a newly allocated buffer (that is
++ * returned). Copies 'length' bytes.
++ *
++ * Returns the new pointer or NULL on failure.
++ *
++ ***************************************************************************/
++char *Curl_memdup(const char *src, size_t length)
++{
++  char *buffer = malloc(length);
++  if(!buffer)
++    return NULL; /* fail */
++
++  memcpy(buffer, src, length);
++
++  /* if length unknown do null termination */
++  return buffer;
++}
+Index: curl-7.37.1/lib/strdup.h
+===================================================================
+--- curl-7.37.1.orig/lib/strdup.h
++++ curl-7.37.1/lib/strdup.h
+@@ -7,7 +7,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2010, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -26,5 +26,6 @@
+ #ifndef HAVE_STRDUP
+ extern char *curlx_strdup(const char *str);
+ #endif
++char *Curl_memdup(const char *src, size_t buffer_length);
+ 
+ #endif /* HEADER_CURL_STRDUP_H */
+Index: curl-7.37.1/lib/url.c
+===================================================================
+--- curl-7.37.1.orig/lib/url.c
++++ curl-7.37.1/lib/url.c
+@@ -125,6 +125,7 @@ int curl_win32_idn_to_ascii(const char *
+ #include "multihandle.h"
+ #include "pipeline.h"
+ #include "dotdot.h"
++#include "strdup.h"
+ 
+ #define _MPRINTF_REPLACE /* use our functions only */
+ #include <curl/mprintf.h>
+@@ -270,8 +271,9 @@ void Curl_freeset(struct SessionHandle *
+ {
+   /* Free all dynamic strings stored in the data->set substructure. */
+   enum dupstring i;
+-  for(i=(enum dupstring)0; i < STRING_LAST; i++)
++  for(i=(enum dupstring)0; i < STRING_LAST; i++) {
+     Curl_safefree(data->set.str[i]);
++  }
+ 
+   if(data->change.referer_alloc) {
+     Curl_safefree(data->change.referer);
+@@ -356,14 +358,24 @@ CURLcode Curl_dupset(struct SessionHandl
+   memset(dst->set.str, 0, STRING_LAST * sizeof(char *));
+ 
+   /* duplicate all strings */
+-  for(i=(enum dupstring)0; i< STRING_LAST; i++) {
++  for(i=(enum dupstring)0; i< STRING_LASTZEROTERMINATED; i++) {
+     r = setstropt(&dst->set.str[i], src->set.str[i]);
+     if(r != CURLE_OK)
+-      break;
++      return r;
+   }
+ 
+-  /* If a failure occurred, freeing has to be performed externally. */
+-  return r;
++  /* duplicate memory areas pointed to */
++  i = STRING_COPYPOSTFIELDS;
++  if(src->set.postfieldsize && src->set.str[i]) {
++    /* postfieldsize is curl_off_t, Curl_memdup() takes a size_t ... */
++    dst->set.str[i] = Curl_memdup(src->set.str[i], src->set.postfieldsize);
++    if(!dst->set.str[i])
++      return CURLE_OUT_OF_MEMORY;
++    /* point to the new copy */
++    dst->set.postfields = dst->set.str[i];
++  }
++
++  return CURLE_OK;
+ }
+ 
+ /*
+Index: curl-7.37.1/lib/urldata.h
+===================================================================
+--- curl-7.37.1.orig/lib/urldata.h
++++ curl-7.37.1/lib/urldata.h
+@@ -1359,7 +1359,6 @@ enum dupstring {
+   STRING_KRB_LEVEL,       /* krb security level */
+   STRING_NETRC_FILE,      /* if not NULL, use this instead of trying to find
+                              $HOME/.netrc */
+-  STRING_COPYPOSTFIELDS,  /* if POST, set the fields' values here */
+   STRING_PROXY,           /* proxy to use */
+   STRING_SET_RANGE,       /* range, if used */
+   STRING_SET_REFERER,     /* custom string for the HTTP referer field */
+@@ -1401,7 +1400,15 @@ enum dupstring {
+ 
+   STRING_BEARER,          /* <bearer>, if used */
+ 
+-  /* -- end of strings -- */
++  /* -- end of zero-terminated strings -- */
++
++  STRING_LASTZEROTERMINATED,
++
++  /* -- below this are pointers to binary data that cannot be strdup'ed.
++     Each such pointer must be added manually to Curl_dupset() --- */
++
++  STRING_COPYPOSTFIELDS,  /* if POST, set the fields' values here */
++
+   STRING_LAST /* not used, just an end-of-list marker */
+ };
+ 
+Index: curl-7.37.1/src/Makefile.inc
+===================================================================
+--- curl-7.37.1.orig/src/Makefile.inc
++++ curl-7.37.1/src/Makefile.inc
+@@ -11,7 +11,6 @@
+ # the official API, but we re-use the code here to avoid duplication.
+ CURLX_CFILES = \
+ 	../lib/strtoofft.c \
+-	../lib/strdup.c \
+ 	../lib/rawstr.c \
+ 	../lib/nonblock.c \
+ 	../lib/warnless.c
+@@ -19,7 +18,6 @@ CURLX_CFILES = \
+ CURLX_HFILES = \
+ 	../lib/curl_setup.h \
+ 	../lib/strtoofft.h \
+-	../lib/strdup.h \
+ 	../lib/rawstr.h \
+ 	../lib/nonblock.h \
+ 	../lib/warnless.h
+@@ -55,6 +53,7 @@ CURL_CFILES = \
+ 	tool_panykey.c \
+ 	tool_paramhlp.c \
+ 	tool_parsecfg.c \
++	tool_strdup.c \
+ 	tool_setopt.c \
+ 	tool_sleep.c \
+ 	tool_urlglob.c \
+@@ -99,6 +98,7 @@ CURL_HFILES = \
+ 	tool_setopt.h \
+ 	tool_setup.h \
+ 	tool_sleep.h \
++	tool_strdup.h \
+ 	tool_urlglob.h \
+ 	tool_util.h \
+ 	tool_version.h \
+Index: curl-7.37.1/src/tool_setup.h
+===================================================================
+--- curl-7.37.1.orig/src/tool_setup.h
++++ curl-7.37.1/src/tool_setup.h
+@@ -7,7 +7,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2012, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -67,8 +67,7 @@
+ #endif
+ 
+ #ifndef HAVE_STRDUP
+-#  include "strdup.h"
+-#  define strdup(ptr) curlx_strdup(ptr)
++#  include "tool_strdup.h"
+ #endif
+ 
+ #endif /* HEADER_CURL_TOOL_SETUP_H */
+Index: curl-7.37.1/src/tool_strdup.c
+===================================================================
+--- /dev/null
++++ curl-7.37.1/src/tool_strdup.c
+@@ -0,0 +1,47 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at http://curl.haxx.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ ***************************************************************************/
++#include "strdup.h"
++
++#ifndef HAVE_STRDUP
++char *strdup(const char *str)
++{
++  size_t len;
++  char *newstr;
++
++  if(!str)
++    return (char *)NULL;
++
++  len = strlen(str);
++
++  if(len >= ((size_t)-1) / sizeof(char))
++    return (char *)NULL;
++
++  newstr = malloc((len+1)*sizeof(char));
++  if(!newstr)
++    return (char *)NULL;
++
++  memcpy(newstr,str,(len+1)*sizeof(char));
++
++  return newstr;
++
++}
++#endif
+Index: curl-7.37.1/src/tool_strdup.h
+===================================================================
+--- /dev/null
++++ curl-7.37.1/src/tool_strdup.h
+@@ -0,0 +1,30 @@
++#ifndef HEADER_TOOL_STRDUP_H
++#define HEADER_TOOL_STRDUP_H
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at http://curl.haxx.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ ***************************************************************************/
++#include "tool_setup.h"
++
++#ifndef HAVE_STRDUP
++extern char *strdup(const char *str);
++#endif
++
++#endif /* HEADER_TOOL_STRDUP_H */
diff --git a/meta/recipes-support/curl/curl/CVE-2014-8150.patch b/meta/recipes-support/curl/curl/CVE-2014-8150.patch
new file mode 100644
index 0000000..9a08280
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-8150.patch
@@ -0,0 +1,29 @@
+From 4e2ac2afa94f014a2a015c48c678e2367a63ae82 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 25 Dec 2014 23:55:03 +0100
+Subject: [PATCH] url-parsing: reject CRLFs within URLs
+
+Bug: http://curl.haxx.se/docs/adv_20150108B.html
+Reported-by: Andrey Labunets
+---
+ lib/url.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+Index: curl-7.37.1/lib/url.c
+===================================================================
+--- curl-7.37.1.orig/lib/url.c
++++ curl-7.37.1/lib/url.c
+@@ -3756,6 +3756,13 @@ static CURLcode parseurlandfillconn(stru
+ 
+   *prot_missing = FALSE;
+ 
++  /* We might pass the entire URL into the request so we need to make sure
++   * there are no bad characters in there.*/
++  if(strpbrk(data->change.url, "\r\n")) {
++    failf(data, "Illegal characters found in URL");
++    return CURLE_URL_MALFORMAT;
++  }
++
+   /*************************************************************
+    * Parse the URL.
+    *
diff --git a/meta/recipes-support/curl/curl/CVE-2015-3153.patch b/meta/recipes-support/curl/curl/CVE-2015-3153.patch
new file mode 100644
index 0000000..089020a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3153.patch
@@ -0,0 +1,90 @@
+From 69a2e8d7ec581695a62527cb2252e7350f314ffa Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Apr 2015 15:58:21 +0200
+Subject: [PATCH] CURLOPT_HEADEROPT: default to separate
+
+Make the HTTP headers separated by default for improved security and
+reduced risk for information leakage.
+
+Bug: http://curl.haxx.se/docs/adv_20150429.html
+Reported-by: Yehezkel Horowitz, Oren Souroujon
+---
+ docs/libcurl/opts/CURLOPT_HEADEROPT.3 | 12 ++++++------
+ lib/url.c                             |  1 +
+ tests/data/test1527                   |  2 +-
+ tests/data/test287                    |  2 +-
+ tests/libtest/lib1527.c               |  1 +
+ 5 files changed, 10 insertions(+), 8 deletions(-)
+
+Index: curl-7.37.1/docs/libcurl/opts/CURLOPT_HEADEROPT.3
+===================================================================
+--- curl-7.37.1.orig/docs/libcurl/opts/CURLOPT_HEADEROPT.3
++++ curl-7.37.1/docs/libcurl/opts/CURLOPT_HEADEROPT.3
+@@ -5,7 +5,7 @@
+ .\" *                            | (__| |_| |  _ <| |___
+ .\" *                             \___|\___/|_| \_\_____|
+ .\" *
+-.\" * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
++.\" * Copyright (C) 1998 - 2015, Daniel Stenberg, <daniel@haxx.se>, et al.
+ .\" *
+ .\" * This software is licensed as described in the file COPYING, which
+ .\" * you should have received as part of this distribution. The terms
+@@ -44,7 +44,7 @@ headers. When doing CONNECT, libcurl wil
+ headers only do the proxy and then \fICURLOPT_HTTPHEADER(3)\fP headers only to
+ the server.
+ .SH DEFAULT
+-CURLHEADER_UNIFIED
++CURLHEADER_SEPARATE (changed in 7.42.1, ased CURLHEADER_UNIFIED before then)
+ .SH PROTOCOLS
+ HTTP
+ .SH EXAMPLE
+Index: curl-7.37.1/tests/data/test1527
+===================================================================
+--- curl-7.37.1.orig/tests/data/test1527
++++ curl-7.37.1/tests/data/test1527
+@@ -45,7 +45,7 @@ http-proxy
+ lib1527
+ </tool>
+  <name>
+-Check same headers are generated without CURLOPT_PROXYHEADER
++Check same headers are generated with CURLOPT_HEADEROPT == CURLHEADER_UNIFIED
+  </name>
+  <command>
+  http://the.old.moo.1527:%HTTPPORT/1527 %HOSTIP:%PROXYPORT
+Index: curl-7.37.1/tests/data/test287
+===================================================================
+--- curl-7.37.1.orig/tests/data/test287
++++ curl-7.37.1/tests/data/test287
+@@ -28,7 +28,7 @@ http
+ HTTP proxy CONNECT with custom User-Agent header
+  </name>
+  <command>
+-http://test.remote.example.com.287:%HTTPPORT/path/287 -H "User-Agent: looser/2007" --proxy http://%HOSTIP:%HTTPPORT --proxytunnel
++http://test.remote.example.com.287:%HTTPPORT/path/287 -H "User-Agent: looser/2015" --proxy http://%HOSTIP:%HTTPPORT --proxytunnel --proxy-header "User-Agent: looser/2007"
+ </command>
+ </client>
+ 
+Index: curl-7.37.1/tests/libtest/lib1527.c
+===================================================================
+--- curl-7.37.1.orig/tests/libtest/lib1527.c
++++ curl-7.37.1/tests/libtest/lib1527.c
+@@ -83,6 +83,7 @@ int test(char *URL)
+   test_setopt(curl, CURLOPT_READFUNCTION, read_callback);
+   test_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
+   test_setopt(curl, CURLOPT_INFILESIZE, strlen(data));
++  test_setopt(curl, CURLOPT_HEADEROPT, CURLHEADER_UNIFIED);
+ 
+   res = curl_easy_perform(curl);
+ 
+Index: curl-7.37.1/lib/url.c
+===================================================================
+--- curl-7.37.1.orig/lib/url.c
++++ curl-7.37.1/lib/url.c
+@@ -584,6 +584,7 @@ CURLcode Curl_init_userdefined(struct Us
+   set->ssl_enable_alpn = TRUE;
+ 
+   set->expect_100_timeout = 1000L; /* Wait for a second by default. */
++  set->sep_headers = TRUE; /* separated header lists by default */
+   return res;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index 8b854d7..2f4da97 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -9,6 +9,12 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
            file://CVE-2014-3613.patch \
            file://CVE-2014-3620.patch \
+           file://CVE-2015-3143.patch \
+           file://CVE-2015-3144.patch \
+           file://CVE-2015-3145.patch \
+           file://CVE-2014-3707.patch \
+           file://CVE-2014-8150.patch \
+           file://CVE-2015-3153.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.9.1


