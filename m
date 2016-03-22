Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2E6606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 07:56:24 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id u110so172013555qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ztMItCkVp8FXc0k/iwWSgfWsw3nm8DJSNhm0UZhLeaI=;
	b=QRUUWNMNVTstRXWTXsEJ/Ti8mZKrVs6rG6OR9S6gy47vFvBW8LvqtvweB78cK6whoR
	/b3EyUWwQ4ZNU55F1pKpibFaeTE1oXtSPW1LhgdLNUopJ4qpyOVJQFgMq877ew/pq9KP
	puFsEKJMnFAWnVI+ycNcHKZUFYzTdXUtpjKf2brm81kdrOa0jq9XnRCKDOx5mPAzwOvB
	FDhZ/nzIdwlimsc36jCU16g9vHab6tEwfjFWv29e/pvdLMyzDfVjo9Zx3jcEwGA8L6Ev
	uK02b0U5MTffJzthdhcmS46zPO2Cdx53ijoV8MLBTNbhNcmo2rqNoupkfl4DOzt4/sgG
	yXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ztMItCkVp8FXc0k/iwWSgfWsw3nm8DJSNhm0UZhLeaI=;
	b=ZKOXo2ILkxL5zkyppF3WY1TiWS6FYc/pyGWW4qkCiTLSPwkL2at9nvl3JPekwHJOJ6
	iGXkkLSAN3aaofCw6Wd9EWiWkHtPULkqzwF8sm3WCH3N9pd4GnYKQEfKaIt592x7JA6z
	vWFr3jFg5xcCJh8jOYEI1wjGyShj41HALRSQcZ3eBeRgVUi0tf4PonzajzIyWNaZCrte
	+qzxx8jqodXNc3dTFMHNMUoe9KE4Wl0EaD/9SGPPLXSW7B79+M9sft6fq0bxpRteLzTe
	ygdV7eXW/p/ohu3M4lUv2WME5lTsp0tca0kqj8XebBIREYoF3xbs69v1InrRfl73ZLU1
	lLFQ==
X-Gm-Message-State: AD7BkJKJqZo1FPWXjM1N02WOKJUO8ZFe6a0VhYUrjNTKutXH8KcsHEfmWvP9zuWTdVFcXA==
X-Received: by 10.141.0.65 with SMTP id b62mr45902410qhd.104.1458633385277;
	Tue, 22 Mar 2016 00:56:25 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	l188sm14071164qhc.10.2016.03.22.00.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 00:56:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 07:56:17 +0000
Message-Id: <1458633377-22265-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] pixz: Fix build on big-endian/musl systems
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
X-List-Received-Date: Tue, 22 Mar 2016 07:56:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-Detect-headers-before-using-them.patch | 51 ++++++++++++++++++++++
 ...-Use-macro-bswap_64-instead-of-__bswap_64.patch | 47 ++++++++++++++++++++
 meta/recipes-extended/pixz/pixz_1.0.6.bb           |  7 ++-
 3 files changed, 103 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch
 create mode 100644 meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch

diff --git a/meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch b/meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch
new file mode 100644
index 0000000..12bae28
--- /dev/null
+++ b/meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch
@@ -0,0 +1,51 @@
+From c84480be8df6966c538d1fb67ccae2f42cc46421 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Mar 2016 07:36:54 +0000
+Subject: [PATCH 1/2] configure: Detect headers before using them
+
+Current logic does not work when system does not have
+sys/endian.h, since it tried to reuse the cached results
+from first try of detecting htole64 in sys/endian.h which is
+'no' and hence the second try to look into endian.h also
+comes out negative.
+
+So we check for header and then run the test for symbols
+and these symbols are not standard and we need to define _GNU_SOURCE
+for it to work, this issue is exposed by systems using musl e.g.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ configure.ac | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4cb56bc..5e23c50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,12 +69,17 @@ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ AC_FUNC_STRTOD
+ AC_CHECK_FUNCS([memchr memmove memset strerror strtol])
+-AC_CHECK_DECLS([htole64, le64toh],
+-               [],
++AC_CHECK_HEADER([sys/endian.h],
+                [
+-                 AC_CHECK_DECLS([htole64, le64toh], [], [], [#include <endian.h>])
++                 AC_CHECK_DECLS([htole64, le64toh], [], [], [#define _GNU_SOURCE 1 #include <sys/endian.h>])
+                ],
+-               [#include <sys/endian.h>])
++               [], [])
++
++AC_CHECK_HEADER([endian.h],
++               [
++                 AC_CHECK_DECLS([htole64, le64toh], [], [], [#define _GNU_SOURCE 1 #include <endian.h>])
++               ],
++               [], [])
+ 
+ AC_CONFIG_FILES([Makefile
+                  src/Makefile
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch b/meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch
new file mode 100644
index 0000000..6b61598
--- /dev/null
+++ b/meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch
@@ -0,0 +1,47 @@
+From 5f3a535987bae4c3e3d9e9079c7526e399f7aecd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Mar 2016 07:42:39 +0000
+Subject: [PATCH 2/2] endian: Use macro bswap_64 instead of __bswap_64
+
+byteswap.h defines then as public APIs on all libc
+on linux including musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+ src/endian.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/endian.c b/src/endian.c
+index b7724f3..51aea58 100644
+--- a/src/endian.c
++++ b/src/endian.c
+@@ -15,6 +15,7 @@ void xle64enc(uint8_t *d, uint64_t n) {
+ #include <stdint.h>
+ #ifdef __linux__
+ 	#include <endian.h>
++	#include <byteswap.h>
+ #else
+ 	#include <sys/endian.h>
+ #endif
+@@ -23,7 +24,7 @@ void xle64enc(uint8_t *d, uint64_t n) {
+ # if __BYTE_ORDER == __LITTLE_ENDIAN
+ #  define htole64(x) (x)
+ # else
+-#  define htole64(x) __bswap_64 (x)
++#  define htole64(x) bswap_64 (x)
+ # endif
+ #endif
+ 
+@@ -31,7 +32,7 @@ void xle64enc(uint8_t *d, uint64_t n) {
+ # if __BYTE_ORDER == __LITTLE_ENDIAN
+ #  define le64toh(x) (x)
+ # else
+-#  define le64toh(x) __bswap_64 (x)
++#  define le64toh(x) bswap_64 (x)
+ # endif
+ #endif
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/pixz/pixz_1.0.6.bb b/meta/recipes-extended/pixz/pixz_1.0.6.bb
index 67681d4..0e51472 100644
--- a/meta/recipes-extended/pixz/pixz_1.0.6.bb
+++ b/meta/recipes-extended/pixz/pixz_1.0.6.bb
@@ -9,11 +9,14 @@ SRC_URI[sha256sum] = "02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f8
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cf6d164086105f1512ccb81bfff1926"
 
-SRC_URI += "file://936d8068ae19d95260d3058f41dd6cf718101cd6.patch"
+SRC_URI += "file://936d8068ae19d95260d3058f41dd6cf718101cd6.patch \
+            file://0001-configure-Detect-headers-before-using-them.patch \
+            file://0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch \
+"
 UPSTREAM_CHECK_URI = "https://github.com/vasi/pixz/releases"
 
 EXTRA_OECONF += "--without-manpage"
-
+CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 CACHED_CONFIGUREVARS += "ac_cv_file_src_pixz_1=no"
 
 inherit autotools pkgconfig
-- 
1.8.3.1


