Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41720.1795613249179739249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 05:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=a0P0PSo9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 85A601A17EE
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C17960480;
	Wed, 25 Nov 2026 13:27:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E86F11E69654;
	Wed, 25 Nov 2026 14:27:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795613246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s6LAzLp9AleZn3mZ8qaPsWSJUcbhSM3me8+9aSM7GZA=;
	b=a0P0PSo92fQvTAV62aGBgMPHUc4P5hIWhlTkSxZAZpSp75sKEcDP4Hk5mXp8WEsL05Dtez
	P5+0c09YAhwy/eyQTSQtXcYS/1MMCBE2zJRbm2QfApvIG0dox13thubQzPt0biVZSSQ5lx
	X/ljgAcWnGMOm+mu6BB7Rxluf6ywG/swDWnmy3xHZXriHwjqmlYqEixZh86Yt2s59ae3aW
	qqEzcX87MV4yMRHL4I4wWEj4uB7UDUj7OtS3AW96khyL+1QR6ykIHhUexu/wmsMFwjSBb/
	tZF+A0i1vkGkZehztPm8jsbD1e5YhA0y1ZqlEm3cz/qZD27Uc31pn81hB7mIRg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH v2 3/4] curl: fix CVE-2026-92391
Date: Wed, 25 Nov 2026 14:26:18 +0100
Message-ID: <20261125132619.3518022-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
References: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251186

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.22.0.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-92391
[2] https://curl.se/docs/CVE-2026-92391.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-92391.patch            | 200 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92391.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92391.patch
new file mode 100644
index 0000000000..80ab126ee7
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92391.patch
@@ -0,0 +1,200 @@
+From e1926bb54733cc768d31c4153720f6fb7d927706 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 13 Sep 2026 00:06:44 +0200
+Subject: [PATCH] mime: do curl_mime_free() non-recursively
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Verify with test 3595: deeply nested curl_mime_free()
+
+Closes #22927
+
+CVE: CVE-2026-92391
+Upstream-Status: Backport [https://github.com/curl/curl/commit/d7546809d=
5bd548b69ec49fca26565c8f6f0d344]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/mime.c                 | 28 +++++++++++----
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test3595        | 21 ++++++++++++
+ tests/libtest/Makefile.inc |  1 +
+ tests/libtest/lib3595.c    | 70 ++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 115 insertions(+), 7 deletions(-)
+ create mode 100644 tests/data/test3595
+ create mode 100644 tests/libtest/lib3595.c
+
+diff --git a/lib/mime.c b/lib/mime.c
+index 6004375..41150dc 100644
+--- a/lib/mime.c
++++ b/lib/mime.c
+@@ -1109,20 +1109,36 @@ void Curl_mime_cleanpart(curl_mimepart *part)
+   }
+ }
+=20
+-/* Recursively delete a mime handle and its parts. */
++/* Non-recursively delete a mime handle and its parts. */
+ void curl_mime_free(curl_mime *mime)
+ {
+   curl_mimepart *part;
+=20
+-  if(mime) {
+-    mime_subparts_unbind(mime);  /* Be sure it is not referenced anymor=
e. */
+-    while(mime->firstpart) {
+-      part =3D mime->firstpart;
++  if(!mime)
++    return;
++
++  mime_subparts_unbind(mime);  /* Be sure it is not referenced anymore.=
 */
++
++  while(mime) {
++    part =3D mime->firstpart;
++    if(part) {
+       mime->firstpart =3D part->nextpart;
++      if(part->kind =3D=3D MIMEKIND_MULTIPART && part->arg &&
++         part->freefunc =3D=3D mime_subparts_free) {
++        curl_mime *subparts =3D (curl_mime *)part->arg;
++        part->freefunc =3D NULL;
++        cleanup_part_content(part);
++        subparts->parent =3D mime->parent;
++        mime->parent =3D (curl_mimepart *)subparts;
++      }
+       Curl_mime_cleanpart(part);
+       curlx_free(part);
+     }
+-    curlx_free(mime);
++    else {
++      curl_mime *parent =3D (curl_mime *)mime->parent;
++      curlx_free(mime);
++      mime =3D parent;
++    }
+   }
+ }
+=20
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 4a27927..e0ce23a 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -2091,7 +2091,7 @@ TESTCASES =3D \
+   test3401 \
+   \
+   test3500 \
+-  \
++  test3595 \
+   test4000 \
+   test4001 \
+   \
+diff --git a/tests/data/test3595 b/tests/data/test3595
+new file mode 100644
+index 0000000..b2b1dd2
+--- /dev/null
++++ b/tests/data/test3595
+@@ -0,0 +1,21 @@
++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++mime
++</keywords>
++</info>
++
++# Client-side
++<client>
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++curl_mime_free
++</name>
++</client>
++
++<verify>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 26c72e5..3d25a83 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -325,5 +325,6 @@ TESTS_C =3D \
+   lib3105.c \
+   lib3207.c \
+   lib3208.c \
++  lib3595.c \
+   lib5000.c \
+   lib5004.c
+diff --git a/tests/libtest/lib3595.c b/tests/libtest/lib3595.c
+new file mode 100644
+index 0000000..1f343f5
+--- /dev/null
++++ b/tests/libtest/lib3595.c
+@@ -0,0 +1,70 @@
++/**********************************************************************=
*****
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ **********************************************************************=
*****/
++#include "unitcheck.h"
++
++static CURLcode test_lib3595(const char *arg)
++{
++  UNITTEST_BEGIN_SIMPLE
++
++#if !defined(CURL_DISABLE_MIME) &&                                     =
 \
++  (!defined(CURL_DISABLE_HTTP) ||                                      =
 \
++   !defined(CURL_DISABLE_SMTP) ||                                      =
 \
++   !defined(CURL_DISABLE_IMAP))
++
++  curl_mime *root =3D NULL;
++  curl_mime *current =3D NULL;
++  curl_mime *sub =3D NULL;
++  curl_mimepart *part =3D NULL;
++  int i;
++
++  if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {
++    curl_mfprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  /* Create a deeply nested mime structure to verify that non-recursive
++     curl_mime_free works properly. */
++  (void)arg;
++  root =3D curl_mime_init(NULL);
++  fail_unless(root !=3D NULL, "curl_mime_init root failed");
++  current =3D root;
++
++  for(i =3D 0; i < 50; i++) {
++    part =3D curl_mime_addpart(current);
++    fail_unless(part !=3D NULL, "curl_mime_addpart failed");
++    sub =3D curl_mime_init(NULL);
++    fail_unless(sub !=3D NULL, "curl_mime_init sub failed");
++    curl_mime_subparts(part, sub);
++    current =3D sub;
++  }
++
++  /* Free deep structure */
++  curl_mime_free(root);
++  curl_global_cleanup();
++#else
++  (void)arg;
++#endif
++
++  UNITTEST_END_SIMPLE
++}
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-supp=
ort/curl/curl_8.22.0.bb
index 4c6a088e62..6445aae426 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -19,6 +19,7 @@ SRC_URI =3D " \
     file://CVE-2026-92389.patch \
     file://CVE-2026-87865.patch \
     file://CVE-2026-92386.patch \
+    file://CVE-2026-92391.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

