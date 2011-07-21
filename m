Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8Q-0001Eg-PX
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787046"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:52:49 -0700
Message-Id: <296c579909629dad29d411ec2978e07e8d434ae0.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/20] Add endianess macros used by previous endian-ness_handling.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 07:57:32 -0000

From: Matthew McClintock <msm@freescale.com>

Some distro's don't include these macros in /usr/include/endian.h
so we include them via this patch

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../ldconfig-native-2.12.1/endianess-header.patch  |  113 ++++++++++++++++++++
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    5 +-
 2 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch

diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
new file mode 100644
index 0000000..a18b2c2
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
@@ -0,0 +1,113 @@
+Upstream-Status: Inappropriate [fix poky patch]
+
+This patch fixes build issues with a previous endian-ness_handling.patch on
+distros that don't have macros referenced
+
+7/20/2011
+Matthew McClintock <msm@freescale.com>
+
+diff -purN ldconfig-native-2.12.1.orig/endian_extra.h ldconfig-native-2.12.1/endian_extra.h
+--- ldconfig-native-2.12.1.orig/endian_extra.h	1969-12-31 18:00:00.000000000 -0600
++++ ldconfig-native-2.12.1/endian_extra.h	2011-07-19 18:09:14.323048417 -0500
+@@ -0,0 +1,64 @@
++/* Copyright (C) 1992, 1996, 1997, 2000, 2008 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <endian.h>
++
++#ifndef	_ENDIAN_EXTRA_H
++#define	_ENDIAN_EXTRA_H	1
++
++/* Don't redefine these macros if they already exist */
++#ifndef htobe16
++#ifdef __USE_BSD
++/* Conversion interfaces.  */
++# include <byteswap.h>
++
++# if __BYTE_ORDER == __LITTLE_ENDIAN
++#  define htobe16(x) __bswap_16 (x)
++#  define htole16(x) (x)
++#  define be16toh(x) __bswap_16 (x)
++#  define le16toh(x) (x)
++
++#  define htobe32(x) __bswap_32 (x)
++#  define htole32(x) (x)
++#  define be32toh(x) __bswap_32 (x)
++#  define le32toh(x) (x)
++
++#  define htobe64(x) __bswap_64 (x)
++#  define htole64(x) (x)
++#  define be64toh(x) __bswap_64 (x)
++#  define le64toh(x) (x)
++# else
++#  define htobe16(x) (x)
++#  define htole16(x) __bswap_16 (x)
++#  define be16toh(x) (x)
++#  define le16toh(x) __bswap_16 (x)
++
++#  define htobe32(x) (x)
++#  define htole32(x) __bswap_32 (x)
++#  define be32toh(x) (x)
++#  define le32toh(x) __bswap_32 (x)
++
++#  define htobe64(x) (x)
++#  define htole64(x) __bswap_64 (x)
++#  define be64toh(x) (x)
++#  define le64toh(x) __bswap_64 (x)
++# endif
++#endif
++#endif
++
++#endif	/* endian_extra.h */
+diff -purN ldconfig-native-2.12.1.orig/cache.c ldconfig-native-2.12.1/cache.c
+--- ldconfig-native-2.12.1.orig/cache.c	2011-07-19 18:21:28.347041301 -0500
++++ ldconfig-native-2.12.1/cache.c	2011-07-19 18:22:54.118048064 -0500
+@@ -39,6 +39,8 @@
+ # define N_(msgid)  msgid
+ #define _(msg) msg
+ 
++#include "endian_extra.h"
++
+ extern int be;
+ 
+ static uint16_t write16(uint16_t x, int be)
+diff -purN ldconfig-native-2.12.1.orig/readelflib.c ldconfig-native-2.12.1/readelflib.c
+--- ldconfig-native-2.12.1.orig/readelflib.c	2011-07-19 18:21:28.346041593 -0500
++++ ldconfig-native-2.12.1/readelflib.c	2011-07-19 18:23:05.324059875 -0500
+@@ -25,6 +25,9 @@
+ 
+ /* check_ptr checks that a pointer is in the mmaped file and doesn't
+    point outside it.  */
++
++#include "endian_extra.h"
++
+ #undef check_ptr
+ #define check_ptr(ptr)						\
+ do								\
+diff -purN ldconfig-native-2.12.1.orig/readlib.c ldconfig-native-2.12.1/readlib.c
+--- ldconfig-native-2.12.1.orig/readlib.c	2011-07-19 18:21:28.346041593 -0500
++++ ldconfig-native-2.12.1/readlib.c	2011-07-19 18:23:23.877046210 -0500
+@@ -40,6 +40,8 @@
+ 
+ #include "ldconfig.h"
+ 
++#include "endian_extra.h"
++
+ #define _(msg) msg
+ 
+ #define Elf32_CLASS ELFCLASS32
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index bacf9f8..00edb6e 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -9,9 +9,10 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://ldconfig_aux-cache_path_fix.patch \
            file://32and64bit.patch \
            file://endian-ness_handling.patch \
-           file://flag_fix.patch "
+           file://flag_fix.patch \
+           file://endianess-header.patch"
 
-PR = "r0"
+PR = "r1"
 
 inherit native
 
-- 
1.7.3.4



