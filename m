Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E289F71F4E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:56:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA78uPVb008732
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:56:26 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 7 Nov 2014 00:56:25 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 16:51:23 +0800
Message-ID: <699e0aed37c598ea0f6219114ea17c26f36d4626.1415350038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 18/24] Revert "gcc-4.9: redefine default library install directory"
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
X-List-Received-Date: Fri, 07 Nov 2014 08:56:27 -0000
Content-Type: text/plain

This reverts commit 208c5e37f98cd98629bad0562fbbc77d7b71e8ff.

GCC can choose the right value as defined by the system, it's the libc
that needs to know how to get to the ABI specific version of the dynamic
loader.  Which is in /lib even if aarch64 libraries are installed in
lib64 due to the specifications in the ABI.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 -
 ...0099-gcc-redefine-library-dir-for-aarch64.patch | 29 ----------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0099-gcc-redefine-library-dir-for-aarch64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index e3775cd..8f212b2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -73,7 +73,6 @@ SRC_URI = "\
     file://0056-top-level-reorder_gcc-bug-61144.patch \
     file://0058-gcc-r212171.patch \
     file://0059-gcc-PR-rtl-optimization-63348.patch \
-    file://0099-gcc-redefine-library-dir-for-aarch64.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0099-gcc-redefine-library-dir-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.9/0099-gcc-redefine-library-dir-for-aarch64.patch
deleted file mode 100644
index 23cdb95..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.9/0099-gcc-redefine-library-dir-for-aarch64.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Redefine default library directory for aarch64.
-
-Packages use 'aarch64-poky-linux-gcc -print-multi-os-directory' to get the
-value of install directory. The value is set by MULTILIB_OSDIRNAMES and default
-is '/lib64'. Add the dynamic linker ld-linux-aarch64.so.1 from package eglibc
-is installed to /lib64.
-
-But the default dynamic linker defined in gcc/config/aarch64/aarch64-linux.h
-is:
-
-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
-
-Then cause all the ELF files fail to launch because fail to find the linker.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
---- gcc-4.9.1/gcc/config/aarch64/t-aarch64-linux.orig	2014-09-19 14:38:47.550669143 +0800
-+++ gcc-4.9.1/gcc/config/aarch64/t-aarch64-linux	2014-09-19 14:39:01.234669516 +0800
-@@ -22,7 +22,7 @@
- LIB1ASMFUNCS = _aarch64_sync_cache_range
- 
- AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
--MULTILIB_OSDIRNAMES = .=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
-+MULTILIB_OSDIRNAMES = .=../lib$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
- MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
- 
- # Disable the multilib for linux-gnu targets for the time being; focus
-- 
1.9.1


