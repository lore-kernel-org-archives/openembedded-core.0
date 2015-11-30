Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4220F605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 08:57:36 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so119564849wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 00:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YIXUC30Wo1oG4uF83BoZFNHQLjIF6CCUd/oiHZwbAKA=;
	b=UOJtMzlLEHNcM3PO87rV61GjUa9+kbOiqPHSY/GbozGvIB6MbmgZlwbCZOh8UMrc98
	1C3dGmAzRpc/GjVVItxbvB5niEA5RTaLr/r8NKlhTij1sukUhO723QGzru5mAo/eFSJB
	ZGxRBt1l3C8hRZodRc1EcPAi+Ph8enTqoX/BjGf6dOrl8jXmS9z/4Y2IGhvK/rb0HCea
	yIm5bhv87mTO6EtY5L2e6VGUs4k5+W3d5ObauwxOY5udiKSQynhl4lPj/rgtXq0G1ph/
	zr9wfcU52cavdqp6rOTfWt+TGljuKv7/bYDzrgP3XryNxDPUa8kYrF6FRD1ljDjB5OCH
	TL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YIXUC30Wo1oG4uF83BoZFNHQLjIF6CCUd/oiHZwbAKA=;
	b=BimHzxdtjJvkEYA7YjNkmW4Asu60ulZO79TB6yCAfrTnTzGsih1y3WoyMuQx2g4iaJ
	0wI+bahgOPjRavEf3PG8ev/xgI0dCCKvzs/yWQtWoSZWzYA/YRlhi9qF4Sv7z4G1WPJt
	hpdjzs/ABl3emGjRK3QdvucsPm1vVJYgnCvyCf69HRyRrZTsoWjmzHT4gHXKbM3mersU
	eZj2ORkHgHkwwKHfKf7VvIw0yLV+g9LphROqeh3R8w9lbVTXRRAWdR7PJ1aFadTXFVrm
	uLhtiUa8zEBpJ+8SLakWrokwNuRlr62PdqUAxT8zI++R13AANFQGdBDuKjNezEMpoZB+
	R6Rg==
X-Gm-Message-State: ALoCoQmzQ+wLQAFi9S0JDh2TRJpEnLhV9O1yiSrWK4Jw8Hy7WH5VR0qaEp93UHaBgZYsBN50l7Bq
X-Received: by 10.28.0.149 with SMTP id 143mr27083735wma.103.1448873857167;
	Mon, 30 Nov 2015 00:57:37 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	h4sm45801090wjx.41.2015.11.30.00.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Nov 2015 00:57:36 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Mon, 30 Nov 2015 08:56:57 +0000
Message-Id: <1448873817-27025-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.3.5
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [jethro][PATCH] opkg: add cache filename length fixes
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
X-List-Received-Date: Mon, 30 Nov 2015 08:57:37 -0000

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

This is backported from master: 8e53500a.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...ng_util-New-file-with-bin_to_hex-function.patch | 122 +++++++++++++++++++++
 .../opkg/0002-md5-Add-md5_to_string-function.patch | 110 +++++++++++++++++++
 ...0003-sha256-Add-sha256_to_string-function.patch | 110 +++++++++++++++++++
 ...4-opkg_download-Use-short-cache-file-name.patch |  85 ++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |   4 +
 5 files changed, 431 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch b/meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
new file mode 100644
index 0000000..fb3ac46
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
@@ -0,0 +1,122 @@
+From 646b80024567a6245c598be3374653fa1fa09a12 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sat, 7 Nov 2015 10:23:49 +0000
+Subject: [PATCH 1/4] string_util: New file with bin_to_hex function
+
+This function does very simple conversion from binary data to a hex string.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Accepted
+---
+ libopkg/Makefile.am   |  4 ++--
+ libopkg/string_util.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ libopkg/string_util.h | 24 ++++++++++++++++++++++++
+ 3 files changed, 68 insertions(+), 2 deletions(-)
+ create mode 100644 libopkg/string_util.c
+ create mode 100644 libopkg/string_util.h
+
+diff --git a/libopkg/Makefile.am b/libopkg/Makefile.am
+index ee3fbee..3e62c24 100644
+--- a/libopkg/Makefile.am
++++ b/libopkg/Makefile.am
+@@ -13,7 +13,7 @@ opkg_headers = active_list.h cksum_list.h conffile.h conffile_list.h \
+ 	pkg_depends.h pkg_dest.h pkg_dest_list.h pkg_extract.h pkg_hash.h \
+ 	pkg_parse.h pkg_src.h pkg_src_list.h pkg_vec.h release.h \
+ 	release_parse.h sha256.h sprintf_alloc.h str_list.h void_list.h \
+-	xregex.h xsystem.h xfuncs.h opkg_verify.h
++	xregex.h xsystem.h xfuncs.h opkg_verify.h string_util.h
+ 
+ opkg_sources = opkg_cmd.c opkg_configure.c opkg_download.c \
+ 	opkg_install.c opkg_remove.c opkg_conf.c release.c \
+@@ -23,7 +23,7 @@ opkg_sources = opkg_cmd.c opkg_configure.c opkg_download.c \
+ 	pkg_src.c pkg_src_list.c str_list.c void_list.c active_list.c \
+ 	file_util.c opkg_message.c md5.c parse_util.c cksum_list.c \
+ 	sprintf_alloc.c xregex.c xsystem.c xfuncs.c opkg_archive.c \
+-	opkg_verify.c
++	opkg_verify.c string_util.c
+ 
+ if HAVE_CURL
+ opkg_sources += opkg_download_curl.c
+diff --git a/libopkg/string_util.c b/libopkg/string_util.c
+new file mode 100644
+index 0000000..822cab6
+--- /dev/null
++++ b/libopkg/string_util.c
+@@ -0,0 +1,42 @@
++/* vi: set expandtab sw=4 sts=4: */
++/* string_util.c - convenience routines for common string operations
++
++   Copyright (C) 2015 Paul Barker
++
++   This program is free software; you can redistribute it and/or
++   modify it under the terms of the GNU General Public License as
++   published by the Free Software Foundation; either version 2, or (at
++   your option) any later version.
++
++   This program is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++*/
++
++#include "config.h"
++
++#include "string_util.h"
++#include "xfuncs.h"
++
++char *bin_to_hex(const void *bin_data, size_t len)
++{
++    const unsigned char *src = (const unsigned char *)bin_data;
++    char *buf = xmalloc(2 * len + 1);
++    int i;
++
++    static const unsigned char bin2hex[16] = {
++        '0', '1', '2', '3',
++        '4', '5', '6', '7',
++        '8', '9', 'a', 'b',
++        'c', 'd', 'e', 'f'
++    };
++
++    for (i = 0; i < len; i++) {
++        buf[i * 2] = bin2hex[src[i] >> 4];
++        buf[i * 2 + 1] = bin2hex[src[i] & 0xf];
++    }
++
++    buf[len * 2] = '\0';
++    return buf;
++}
+diff --git a/libopkg/string_util.h b/libopkg/string_util.h
+new file mode 100644
+index 0000000..a920e2a
+--- /dev/null
++++ b/libopkg/string_util.h
+@@ -0,0 +1,24 @@
++/* vi: set expandtab sw=4 sts=4: */
++/* string_util.h - convenience routines for common file operations
++
++   Copyright (C) 2015 Paul Barker
++
++   This program is free software; you can redistribute it and/or
++   modify it under the terms of the GNU General Public License as
++   published by the Free Software Foundation; either version 2, or (at
++   your option) any later version.
++
++   This program is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++*/
++
++#ifndef STRING_UTIL_H
++#define STRING_UTIL_H
++
++#include <stddef.h>
++
++char *bin_to_hex(const void *bin_data, size_t len);
++
++#endif /* STRING_UTIL_H */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch b/meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
new file mode 100644
index 0000000..3b823c6
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
@@ -0,0 +1,110 @@
+From ecad8afab377d8be95eeaafc08afa228c8e030c3 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sat, 7 Nov 2015 10:23:50 +0000
+Subject: [PATCH 2/4] md5: Add md5_to_string function
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Accepted
+---
+ libopkg/file_util.c | 28 +++-------------------------
+ libopkg/md5.c       |  7 +++++++
+ libopkg/md5.h       |  3 +++
+ 3 files changed, 13 insertions(+), 25 deletions(-)
+
+diff --git a/libopkg/file_util.c b/libopkg/file_util.c
+index 5eff469..cb3dbf0 100644
+--- a/libopkg/file_util.c
++++ b/libopkg/file_util.c
+@@ -349,27 +349,13 @@ int file_mkdir_hier(const char *path, long mode)
+ 
+ char *file_md5sum_alloc(const char *file_name)
+ {
+-    static const int md5sum_bin_len = 16;
+-    static const int md5sum_hex_len = 32;
+-
+-    static const unsigned char bin2hex[16] = {
+-        '0', '1', '2', '3',
+-        '4', '5', '6', '7',
+-        '8', '9', 'a', 'b',
+-        'c', 'd', 'e', 'f'
+-    };
+-
+-    int i, err;
++    int err;
+     FILE *file;
+-    char *md5sum_hex;
+-    unsigned char md5sum_bin[md5sum_bin_len];
+-
+-    md5sum_hex = xcalloc(1, md5sum_hex_len + 1);
++    unsigned char md5sum_bin[16];
+ 
+     file = fopen(file_name, "r");
+     if (file == NULL) {
+         opkg_perror(ERROR, "Failed to open file %s", file_name);
+-        free(md5sum_hex);
+         return NULL;
+     }
+ 
+@@ -377,20 +363,12 @@ char *file_md5sum_alloc(const char *file_name)
+     if (err) {
+         opkg_msg(ERROR, "Could't compute md5sum for %s.\n", file_name);
+         fclose(file);
+-        free(md5sum_hex);
+         return NULL;
+     }
+ 
+     fclose(file);
+ 
+-    for (i = 0; i < md5sum_bin_len; i++) {
+-        md5sum_hex[i * 2] = bin2hex[md5sum_bin[i] >> 4];
+-        md5sum_hex[i * 2 + 1] = bin2hex[md5sum_bin[i] & 0xf];
+-    }
+-
+-    md5sum_hex[md5sum_hex_len] = '\0';
+-
+-    return md5sum_hex;
++    return md5_to_string(md5sum_bin);
+ }
+ 
+ #ifdef HAVE_SHA256
+diff --git a/libopkg/md5.c b/libopkg/md5.c
+index d476b8b..bc2b229 100644
+--- a/libopkg/md5.c
++++ b/libopkg/md5.c
+@@ -30,6 +30,8 @@
+ #include <string.h>
+ #include <sys/types.h>
+ 
++#include "string_util.h"
++
+ #if USE_UNLOCKED_IO
+ #include "unlocked-io.h"
+ #endif
+@@ -431,3 +433,8 @@ void md5_process_block(const void *buffer, size_t len, struct md5_ctx *ctx)
+     ctx->C = C;
+     ctx->D = D;
+ }
++
++char *md5_to_string(const void *md5sum_bin)
++{
++    return bin_to_hex(md5sum_bin, 16);
++}
+diff --git a/libopkg/md5.h b/libopkg/md5.h
+index 01320f5..2a7274d 100644
+--- a/libopkg/md5.h
++++ b/libopkg/md5.h
+@@ -118,6 +118,9 @@ extern int __md5_stream(FILE * stream, void *resblock) __THROW;
+ extern void *__md5_buffer(const char *buffer, size_t len,
+                           void *resblock) __THROW;
+ 
++/* Convert a binary md5sum value to an ASCII string. */
++char *md5_to_string(const void *md5sum_bin);
++
+ #ifdef __cplusplus
+ }
+ #endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch b/meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
new file mode 100644
index 0000000..16e82d7
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
@@ -0,0 +1,110 @@
+From 92e8378103bba3b91f2dec4e6fda3e1755a7c0fd Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sat, 7 Nov 2015 10:23:51 +0000
+Subject: [PATCH 3/4] sha256: Add sha256_to_string function
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Accepted
+---
+ libopkg/file_util.c | 28 +++-------------------------
+ libopkg/sha256.c    |  7 +++++++
+ libopkg/sha256.h    |  3 +++
+ 3 files changed, 13 insertions(+), 25 deletions(-)
+
+diff --git a/libopkg/file_util.c b/libopkg/file_util.c
+index cb3dbf0..864aedb 100644
+--- a/libopkg/file_util.c
++++ b/libopkg/file_util.c
+@@ -374,27 +374,13 @@ char *file_md5sum_alloc(const char *file_name)
+ #ifdef HAVE_SHA256
+ char *file_sha256sum_alloc(const char *file_name)
+ {
+-    static const int sha256sum_bin_len = 32;
+-    static const int sha256sum_hex_len = 64;
+-
+-    static const unsigned char bin2hex[16] = {
+-        '0', '1', '2', '3',
+-        '4', '5', '6', '7',
+-        '8', '9', 'a', 'b',
+-        'c', 'd', 'e', 'f'
+-    };
+-
+-    int i, err;
++    int err;
+     FILE *file;
+-    char *sha256sum_hex;
+-    unsigned char sha256sum_bin[sha256sum_bin_len];
+-
+-    sha256sum_hex = xcalloc(1, sha256sum_hex_len + 1);
++    unsigned char sha256sum_bin[32];
+ 
+     file = fopen(file_name, "r");
+     if (file == NULL) {
+         opkg_perror(ERROR, "Failed to open file %s", file_name);
+-        free(sha256sum_hex);
+         return NULL;
+     }
+ 
+@@ -402,20 +388,12 @@ char *file_sha256sum_alloc(const char *file_name)
+     if (err) {
+         opkg_msg(ERROR, "Could't compute sha256sum for %s.\n", file_name);
+         fclose(file);
+-        free(sha256sum_hex);
+         return NULL;
+     }
+ 
+     fclose(file);
+ 
+-    for (i = 0; i < sha256sum_bin_len; i++) {
+-        sha256sum_hex[i * 2] = bin2hex[sha256sum_bin[i] >> 4];
+-        sha256sum_hex[i * 2 + 1] = bin2hex[sha256sum_bin[i] & 0xf];
+-    }
+-
+-    sha256sum_hex[sha256sum_hex_len] = '\0';
+-
+-    return sha256sum_hex;
++    return sha256_to_string(sha256sum_bin);
+ }
+ 
+ #endif
+diff --git a/libopkg/sha256.c b/libopkg/sha256.c
+index 0816858..bceed72 100644
+--- a/libopkg/sha256.c
++++ b/libopkg/sha256.c
+@@ -29,6 +29,8 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
++#include "string_util.h"
++
+ #if USE_UNLOCKED_IO
+ #include "unlocked-io.h"
+ #endif
+@@ -517,3 +519,8 @@ void sha256_process_block(const void *buffer, size_t len,
+         h = ctx->state[7] += h;
+     }
+ }
++
++char *sha256_to_string(const void *sha256sum_bin)
++{
++    return bin_to_hex(sha256sum_bin, 32);
++}
+diff --git a/libopkg/sha256.h b/libopkg/sha256.h
+index 734ab54..0d1e9e5 100644
+--- a/libopkg/sha256.h
++++ b/libopkg/sha256.h
+@@ -85,6 +85,9 @@ extern int sha224_stream(FILE * stream, void *resblock);
+ extern void *sha256_buffer(const char *buffer, size_t len, void *resblock);
+ extern void *sha224_buffer(const char *buffer, size_t len, void *resblock);
+ 
++/* Convert a binary sha256sum value to an ASCII string. */
++char *sha256_to_string(const void *sha256sum_bin);
++
+ #ifdef __cplusplus
+ }
+ #endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch b/meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
new file mode 100644
index 0000000..7ea661d
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
@@ -0,0 +1,85 @@
+From 61636f15718edc7ea17b91f22f1d97b905eaf951 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sat, 7 Nov 2015 10:23:52 +0000
+Subject: [PATCH 4/4] opkg_download: Use short cache file name
+
+Source URIs can be very long. The cache directory itself may already have a very
+long path, especially if we're installing packages into an offline rootfs.
+Therefore it's not a good idea to simply tag the source URI onto the cache
+directory path to create a cache file name.
+
+To create shorter cache file names which are deterministic and very likely to be
+unique, we use the md5sum of the source URI along with the basename of the
+source URI. The basename is length limited to ensure that it the resulting
+filename length is always reasonable.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Accepted
+---
+ libopkg/opkg_download.c | 35 ++++++++++++++++++++++++++++-------
+ 1 file changed, 28 insertions(+), 7 deletions(-)
+
+diff --git a/libopkg/opkg_download.c b/libopkg/opkg_download.c
+index e9b86a5..a37b10d 100644
+--- a/libopkg/opkg_download.c
++++ b/libopkg/opkg_download.c
+@@ -29,10 +29,18 @@
+ #include "opkg_verify.h"
+ #include "opkg_utils.h"
+ 
++#include "md5.h"
+ #include "sprintf_alloc.h"
+ #include "file_util.h"
+ #include "xfuncs.h"
+ 
++/* Limit the short file name used to generate cache file names to 90 characters
++ * so that when added to the md5sum (32 characters) and an underscore, the
++ * resulting length is below 128 characters. The maximum file name length
++ * differs between plaforms but 128 characters should be reasonable.
++ */
++#define MAX_SHORT_FILE_NAME_LENGTH 90
++
+ static int opkg_download_set_env()
+ {
+     int r;
+@@ -135,15 +143,28 @@ int opkg_download_internal(const char *src, const char *dest,
+  */
+ char *get_cache_location(const char *src)
+ {
+-    char *cache_name = xstrdup(src);
+-    char *cache_location, *p;
++    unsigned char md5sum_bin[16];
++    char *md5sum_hex;
++    char *cache_location;
++    char *short_file_name;
++    char *tmp = xstrdup(src);
+ 
+-    for (p = cache_name; *p; p++)
+-        if (*p == '/')
+-            *p = '_';
++    md5_buffer(src, strlen(src), md5sum_bin);
++    md5sum_hex = md5_to_string(md5sum_bin);
+ 
+-    sprintf_alloc(&cache_location, "%s/%s", opkg_config->cache_dir, cache_name);
+-    free(cache_name);
++    /* Generate a short file name which will be used along with an md5sum of the
++     * full src URI in the cache file name. This short file name is limited to
++     * MAX_SHORT_FILE_NAME_LENGTH to ensure that the total cache file name
++     * length is reasonable.
++     */
++    short_file_name = basename(tmp);
++    if (strlen(short_file_name) > MAX_SHORT_FILE_NAME_LENGTH)
++        short_file_name[MAX_SHORT_FILE_NAME_LENGTH] = '\0';
++
++    sprintf_alloc(&cache_location, "%s/%s_%s", opkg_config->cache_dir,
++                  md5sum_hex, short_file_name);
++    free(md5sum_hex);
++    free(tmp);
+     return cache_location;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
index 588250e..5ad3e92 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -17,6 +17,10 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
            file://0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-string_util-New-file-with-bin_to_hex-function.patch \
+           file://0002-md5-Add-md5_to_string-function.patch \
+           file://0003-sha256-Add-sha256_to_string-function.patch \
+           file://0004-opkg_download-Use-short-cache-file-name.patch \
 "
 
 SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-- 
2.3.5


