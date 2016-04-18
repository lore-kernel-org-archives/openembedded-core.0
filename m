Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id B5E3660796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4743; q=dns/txt; s=iport;
	t=1460978050; x=1462187650;
	h=from:to:cc:subject:date:message-id;
	bh=3vN7Yubq8qkH17n73XC6V4cLcgGJzmxjJvR5NesF1Cg=;
	b=gvd6EN4PdHpdeNNxP0DvKBODUvA5FcukSRA5opqawuEWQQLXy+movJRf
	38oTQkcAtlcZGv5nrxI32khRn/h77TpBSgjXDsMG+Priw4uriDJwlkkV2
	VdokQO9JN67wHJqwVN/OeCkf+3le4EcH3dpizIHQ9f37vsUOW25PBRi8N g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CqBAAHwRRX/xbLJq1bhAt9uBWEDh6Fc?=
	=?us-ascii?q?IF3AQEBAQEBZieEQQECfSwDAQJ+IYgpuiwBAQEHIAuGFo5gBY5DiUuFeIgWAoF?=
	=?us-ascii?q?lTocphTECRY5mYoIEGoFNOTCJOgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.24,502,1454976000"; d="scan'208";a="637051441"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2016 11:14:08 +0000
Received: from localhost ([10.61.173.88])
	by aer-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id u3IBE7DB027090;
	Mon, 18 Apr 2016 11:14:07 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2016 14:14:07 +0300
Message-Id: <1460978047-3086-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [PATCH] libunwind: backport aarch64_be support
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
X-List-Received-Date: Mon, 18 Apr 2016 11:14:09 -0000

Backport 2 patches from v1.2-rc1 tag of libunwind git repo.
These patches add aarch64_be support to this package.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 ...roduce-build-support-for-aarch64_be-targe.patch | 33 +++++++++++++++++++++
 ...-wrong-big_endian-flag-in-aarch64_be-case.patch | 34 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  2 ++
 3 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
new file mode 100644
index 0000000..b8afb90
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
@@ -0,0 +1,33 @@
+From 743668f66916b6bb03c92b04be5216400951ace6 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <victor.kamensky@linaro.org>
+Date: Wed, 3 Dec 2014 17:35:43 -0800
+Subject: [PATCH 1/2] aarch64: introduce build support for aarch64_be target
+
+Upstream-Status: backport
+
+Introduce support for aarch64_be, aarch64 big endian, target.
+We would like to reuse all code that was done for aarch64
+(little endian) target. So we do similar thing that is done
+for ARM v7 (arm) target for any aarch64* arch we set it
+just to aarch64.
+
+Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 582e71f..c59f526 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -88,6 +88,7 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ 
+ AC_DEFUN([SET_ARCH],[
+     AS_CASE([$1],
++        [aarch64*],[$2=aarch64],
+         [arm*],[$2=arm],
+         [i?86],[$2=x86],
+         [hppa*],[$2=hppa],
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch b/meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch
new file mode 100644
index 0000000..2ae4477
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch
@@ -0,0 +1,34 @@
+From 16e98c8cf37b006c3879ee57acc23c9af13c40d5 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <victor.kamensky@linaro.org>
+Date: Wed, 3 Dec 2014 17:35:44 -0800
+Subject: [PATCH 2/2] aarch64: fix wrong big_endian flag in aarch64_be case
+
+Upstream-Status: backport
+
+Set local_addr_space.big_endian flag according to current target
+endianness. Before it was set by memset to 0, which corresponds
+to little endian and it worked perfectly fine for aarch64.
+But it breaks aarch64_be because dwarf_readu16, dwarf_readu32,
+etc functions do not read values correctly since they operate
+with wrong idea about current target endianness.
+
+Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
+---
+ src/aarch64/Ginit.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/aarch64/Ginit.c b/src/aarch64/Ginit.c
+index 0bc8997..b9181ef 100644
+--- a/src/aarch64/Ginit.c
++++ b/src/aarch64/Ginit.c
+@@ -181,6 +181,7 @@ aarch64_local_addr_space_init (void)
+   local_addr_space.acc.access_fpreg = access_fpreg;
+   local_addr_space.acc.resume = aarch64_local_resume;
+   local_addr_space.acc.get_proc_name = get_static_proc_name;
++  local_addr_space.big_endian = (__BYTE_ORDER == __BIG_ENDIAN);
+   unw_flush_cache (&local_addr_space, 0, 0);
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index aff8409..1e76c1a 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -8,6 +8,8 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
            file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
            file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
+           file://0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch \
+           file://0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch \
 "
 SRC_URI_append_libc-musl = "\
            file://0001-x86-Stub-out-x86_local_resume.patch \
-- 
1.9.1


