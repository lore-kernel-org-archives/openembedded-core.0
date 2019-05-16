Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6057DF1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 07:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 454NpC5KGcz8m
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 09:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557992915;
	bh=ApTw/Gxc6Y4uN9Iyxj9vzig7Vneyisd4PN+40YLqWio=;
	h=From:To:Subject:Date:From;
	b=L5ej2oFq6ZGhTIbH+PFcm3KpYKYuy7nyZ+MwKhjvCymUFvCaRRfey5691zMEUxwD9
	I8zVNBbKQTmDQe17liVLLbZtOIrvWKzd5wt2LfMuuUO5HxmYZluIhViFZN+M1SxeOf
	WtJ0eTl0DVIbooxTHhryF3f1VT9wTio0VgtCMt18qpuw0caaWkUG62ts/hgAjP+o0v
	Zb00ygCJCriWH4QYElVgRFD9fX2TQCY2m4TTgxZ/lJ1Ew3sIWrQ57K3hYedFDEXqpY
	cRt0a7bs9GF28zg2UFzw5WCVzUUQ8H8r1PzIr6r0SO9UNL3cceqnNvRDG639SKTg2y
	6xne6cqSzfELnNR5kFjShPkZBTI6tZDpJ8mmzAIJxcuwvjGaN5bEp9HcHWdsPJ0bxK
	23YWe6Asa/6z8UIUrk22qaRGHBBQ/cYH3AFJWU/MJvzg9frwA9w8PeKT7+Svyano6z
	5iEaTr9YH2SwmuHPFj2LIrWt34CQ+tlMe7gaUwJ1+tcUK0vkVwoCu12QMoNuM+4hrw
	IMFZKx7mIq1o8s2W6A8WHzWCHhifImlJ4zWYP3TEs4ayYOQklyS6hoA95C18+wpUwl
	8tF/OHMir6y0fP1I1ZW4gn3BboSfqVQGcMpiEn+KXCrsI/P3BOxhbNiXk51FPRoWDM
	VK4R4nJh37SHntLPjgKalI3U=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 10:48:34 +0300
Message-Id: <20190516074834.3014-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] musl: Add TEMP_FAILURE_RETRY from glibc
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
X-List-Received-Date: Thu, 16 May 2019 07:48:35 -0000

Patch it into musl instead of patching all users
(currently elfutils and next ofono).

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch | 36 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 ...ternatives-for-glibc-assumptions-hel.patch | 30 +---------------
 3 files changed, 38 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch

diff --git a/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch b/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
new file mode 100644
index 0000000000..4d48d61651
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
@@ -0,0 +1,36 @@
+From 19cbebc3fa33c6a1a71a6036da4d67c98f859f06 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Wed, 15 May 2019 16:08:33 +0300
+Subject: unistd.h: Add TEMP_FAILURE_RETRY
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Inappropriate [oe-specific]
+---
+ include/unistd.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 9485da7a..8a75af57 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -460,6 +460,17 @@ int eaccess(const char *, int);
+ #define _CS_V6_ENV	1148
+ #define _CS_V7_ENV	1149
+ 
++#ifdef _GNU_SOURCE
++#ifndef TEMP_FAILURE_RETRY
++# define TEMP_FAILURE_RETRY(expression) \
++  (__extension__                                                              \
++    ({ long int __result;                                                     \
++       do __result = (long int) (expression);                                 \
++       while (__result == -1L && errno == EINTR);                             \
++       __result; }))
++#endif
++#endif
++
+ #ifdef __cplusplus
+ }
+ #endif
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1e324804e1..2b433aed8c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index a4f301d9da..10cdac646c 100644
--- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -64,18 +64,10 @@ index 292082b..308a762 100644
  #include <stddef.h>
  #include <stdint.h>
  #include <sys/param.h>
-@@ -51,6 +51,16 @@
+@@ -51,6 +51,8 @@
  #else
  # error "Unknown byte order"
  #endif
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__							      \
-+    ({ long int __result;						      \
-+       do __result = (long int) (expression);				      \
-+       while (__result == -1L && errno == EINTR);			      \
-+       __result; }))
-+#endif
 +
 +#define error(status, errno, ...) err(status, __VA_ARGS__)
  
@@ -141,26 +133,6 @@ index 56e6105..f4a0649 100644
  #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
  #include "../libelf/libelfP.h"
  #include "system.h"
-diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
-index f849128..6f0aca1 100644
---- a/libdwfl/libdwfl_crc32_file.c
-+++ b/libdwfl/libdwfl_crc32_file.c
-@@ -29,6 +29,15 @@
- # include <config.h>
- #endif
- 
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__                                                             \
-+    ({ long int __result;                                                    \
-+       do __result = (long int) (expression);                                \
-+       while (__result == -1L && errno == EINTR);                            \
-+       __result; }))
-+#endif
-+
- #define crc32_file attribute_hidden __libdwfl_crc32_file
- #define crc32 __libdwfl_crc32
- #include <libdwflP.h>
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
 index 360e4ee..b5aa397 100644
 --- a/libdwfl/linux-kernel-modules.c
-- 
2.17.1


