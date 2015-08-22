Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1882075794
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 15:58:38 +0000 (UTC)
Received: by iodv127 with SMTP id v127so110062159iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DM0nVDdRZ/iXoZ27E629CSIMJpP00HXWE2VT4Gw/rMA=;
	b=MXrOymPlJpSR0kPbVht8nalxjysqWTcxlF+JYDu5VAZj9aaGKZq7fVET510fpcwu9C
	rbppJ2Vzy0gCNb7jyZ0IuwPNgzMan1aFlwUAI0BgcR3DFklRQ7LzpyvV+Wldsy+6W6XI
	Sd3/H4hQCs6l7fgDN5nsi3hxY7QvSLkIDaVSjJPIjB6RjY/NFS7i1F3sCjxMztUCAhs8
	d3f52fRyYHvPC5qMC7y7njCNnmOi5hx0h/vU06CreI/Fz4IhWjJAhIOcdiBG1Hwpw77G
	XSLzLVx9onjNFcFCMu3Gsx8kJb8jZEG7mACp19gSCkXwJhPGpGdNsoD1oCy0yGR/U9yq
	CDnQ==
X-Received: by 10.107.132.160 with SMTP id o32mr12395551ioi.25.1440259118927; 
	Sat, 22 Aug 2015 08:58:38 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id r8sm8726088ioi.10.2015.08.22.08.58.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 08:58:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 08:58:12 -0700
Message-Id: <1440259095-24566-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/6] json-c: Include math_compat.c for NAN/INF values
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
X-List-Received-Date: Sat, 22 Aug 2015 15:58:39 -0000

The backport patch also fixes the warning which was being work arounded
by disabling unused-but-set-variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-json_tokener-requires-INF-and-NAN.patch   | 32 ++++++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.12.bb        |  6 ++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
new file mode 100644
index 0000000..58ccf7b
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
@@ -0,0 +1,32 @@
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
+@@ -353,7 +354,7 @@ struct json_object* json_tokener_parse_e
+     case json_tokener_state_inf: /* aka starts with 'i' */
+       {
+ 	int size;
+-	int size_inf;
++	size_t size_inf;
+ 	int is_negative = 0;
+ 
+ 	printbuf_memappend_fast(tok->pb, &c, 1);
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


