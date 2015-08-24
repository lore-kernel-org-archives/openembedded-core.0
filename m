Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id E06396AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:07:24 +0000 (UTC)
Received: by igfj19 with SMTP id j19so49955101igf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OflT+NlMxk+BVTv2Bdl41SYqbeVTycF8ff1AxHXMhp0=;
	b=0UcFMik6ZuJteo4jSpPs1BSeZP23UotZCCQhTvAzDEi8czn2g6JpXXTQcFrbXzgSGL
	sZR1wFcYlkp20wil1P4BbaaWZUeU2QGQWUOYHKbNwVdhTcCqi0Te6jpyHEQAFhd7JAR/
	P2zfg21leaOFcUIx/xT4muHUg0MukxyyNgJkjojhexbzFXHjPJmbd7gAceVIDFbHuEr5
	koHgR0/5p/6LB1IrrIWTm0knHxhLmccrgEoTKUNCt9dmVhGw7flTyrDKJcLJeVC+Nn8X
	Wma4iu0VUdlIphjTF2ilJzkTtTkCdeK+Cddb+462RY7cJrEt/iHtMOjYA266vUQIt9Hd
	0i1g==
X-Received: by 10.50.30.65 with SMTP id q1mr13463410igh.28.1440400044188;
	Mon, 24 Aug 2015 00:07:24 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	q10sm8312490ige.16.2015.08.24.00.07.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 00:07:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 00:07:16 -0700
Message-Id: <1440400036-19418-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] json-c: Include math_compat.c for NAN/INF values
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
X-List-Received-Date: Mon, 24 Aug 2015 07:07:25 -0000

The backport patch also fixes the warning which was being work arounded
by disabling unused-but-set-variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-json_tokener-requires-INF-and-NAN.patch   | 37 ++++++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.12.bb        |  6 ++--
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
new file mode 100644
index 0000000..d29d911
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
@@ -0,0 +1,37 @@
+From 9be71700eb580c815688584a64621a38867c3fdd Mon Sep 17 00:00:00 2001
+From: James Myatt <james.myatt@tessella.com>
+Date: Thu, 5 Feb 2015 15:57:14 +0000
+Subject: [PATCH] json_tokener requires INF and NAN
+
+---
+Upstream-Status: Backport
+
+ json_tokener.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: json-c-0.12/json_tokener.c
+===================================================================
+--- json-c-0.12.orig/json_tokener.c
++++ json-c-0.12/json_tokener.c
+@@ -16,6 +16,7 @@
+ #include "config.h"
+ 
+ #include <math.h>
++#include "math_compat.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+@@ -352,12 +353,10 @@ struct json_object* json_tokener_parse_e
+ 
+     case json_tokener_state_inf: /* aka starts with 'i' */
+       {
+-	int size;
+-	int size_inf;
++	size_t size_inf;
+ 	int is_negative = 0;
+ 
+ 	printbuf_memappend_fast(tok->pb, &c, 1);
+-	size = json_min(tok->st_pos+1, json_null_str_len);
+ 	size_inf = json_min(tok->st_pos+1, json_inf_str_len);
+ 	char *infbuf = tok->pb->buf;
+ 	if (*infbuf == '-')
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index e9c5b31..cfef03d 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://0001-json_tokener-requires-INF-and-NAN.patch \
+          "
 
 SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
 SRC_URI[sha256sum] = "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f"
@@ -17,5 +19,3 @@ do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
 }
-
-CFLAGS += "-Wno-error=unused-but-set-variable"
-- 
2.1.4


