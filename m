Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 40C5276BF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:43 +0000 (UTC)
Received: by iodt126 with SMTP id t126so162646743iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OflT+NlMxk+BVTv2Bdl41SYqbeVTycF8ff1AxHXMhp0=;
	b=ZjmJSfS9iof6VgEZRik92ZqsN+Gt0I199dtxi6dR/vJNp+W9jzA8n65822xbdrvNnB
	9pSGnVBe2s1HHJK9OT2Ha3DItxzVkaLC1oIcqcwHMb/jiLPVafpcoo2B9EzCfr9fOFcu
	byeEA5Z/EXPJoP1gULYUa7VFWQ+moeln+newxyabk3WU/4J6WyYtLvSH95bFhGFaSvWp
	La6dtrW73q80kZ/5tNPTJ9hBXj0DcsALFmIYcQ2JnfegKQ7zRZ63qDASpIXHcBeKbXCd
	4nHw1j9YdR7dehvOvr4H4YboFJwYOfqaOxDR1sFNxdsR1f/lOrronFc1eexKH7M2vZsc
	E4cA==
X-Received: by 10.107.137.154 with SMTP id t26mr16073664ioi.64.1440446624226; 
	Mon, 24 Aug 2015 13:03:44 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:25 -0700
Message-Id: <3ba3c437055ee9be4a1c3615417e07cd55709b60.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 07/17] json-c: Include math_compat.c for NAN/INF values
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:44 -0000

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


