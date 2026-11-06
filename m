Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7470.1793976113413926888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=wyHL+0Ub;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B44574E4145B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A0745FFBC;
	Fri,  6 Nov 2026 14:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62A24103288D3;
	Fri,  6 Nov 2026 15:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Fohwr1aFSrRWwOsAE8FIdV6lFmZ93y/AK29NdzWo4w=;
	b=wyHL+0Ub4iA6VtAfbrhqVLV7iiIcltEJubcQF7VMKvqFaFQBzyi5p/qolSsZRY7VVbJUyi
	//oI1Ts6QLkm5mp5zcpketq0MRdhAlc4pRPCaQpq7kGxz4K7m6xeyH4iEQB9w1vJqQwI/C
	LbuCNvfGE2TQbwG/ohftqcCxIS0it8y8Hkur/T3abLXeT9OWFcj6skhTEVJbXN27BHA3da
	/z538R+MMpKOugdN4fs4EJvKdHRPQIbLcv79HCnnogmMuzkqDvigq7bsIXQZxKkWRjESD1
	NjD1ZxpKB+51PalzJDBxehsTmJFHIaD/RhuHiNiqDm8yVyPtww++4Vfrwx3+Ew==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 6/7] curl: fix CVE-2026-92391
Date: Fri,  6 Nov 2026 15:41:33 +0100
Message-ID: <20261106144134.1370928-7-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249661

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-92391
[2] https://curl.se/docs/CVE-2026-92391.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-92391.patch            | 185 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 186 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92391.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92391.patch
new file mode 100644
index 0000000000..d7d9c3e18a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92391.patch
@@ -0,0 +1,185 @@
+From 7ba6d6df009e5dba8cced2607005825a142ff525 Mon Sep 17 00:00:00 2001
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
+ lib/mime.c              | 28 +++++++++++++----
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test3595     | 21 +++++++++++++
+ tests/libtest/lib3595.c | 70 +++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 114 insertions(+), 7 deletions(-)
+ create mode 100644 tests/data/test3595
+ create mode 100644 tests/libtest/lib3595.c
+
+diff --git a/lib/mime.c b/lib/mime.c
+index 5bc6d38931..254d6c93aa 100644
+--- a/lib/mime.c
++++ b/lib/mime.c
+@@ -1180,20 +1180,36 @@ void Curl_mime_cleanpart(curl_mimepart *part)
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
+-    mime_subparts_unbind(mime);  /* Be sure it's not referenced anymore=
. */
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
+       free(part);
+     }
+-    free(mime);
++    else {
++      curl_mime *parent =3D (curl_mime *)mime->parent;
++      free(mime);
++      mime =3D parent;
++    }
+   }
+ }
+=20
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 614b6baf4b..9efae9cefe 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -262,4 +262,4 @@ test3024 test3025 test3026 test3027 test3028 test302=
9 test3030 \
+ \
+ test3100 test3101 test3102 test3103 \
+ test3200 \
+-test3201 test3202 test3500
++test3201 test3202 test3500 test3595
+diff --git a/tests/data/test3595 b/tests/data/test3595
+new file mode 100644
+index 0000000000..b2b1dd26c2
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
+diff --git a/tests/libtest/lib3595.c b/tests/libtest/lib3595.c
+new file mode 100644
+index 0000000000..1f343f503e
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
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index 39e804a1c3..3bd1b92d44 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -48,6 +48,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87865.patch \
            file://CVE-2026-92386.patch \
            file://CVE-2026-92389.patch \
+           file://CVE-2026-92391.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

