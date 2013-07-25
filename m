Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5886AB67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 21:35:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 14:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,745,1367996400"; d="scan'208";a="376211478"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.38])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 14:35:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 14:35:44 -0700
Message-Id: <1374788144-1380-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] external-sourcery: add missing providers
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
X-List-Received-Date: Thu, 25 Jul 2013 21:35:49 -0000

Addess the issue with multiple .bb providers

ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb /srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide virtual/arm-none-linux-gnueabi-libc-for-gcc (/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb /srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv (/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb /srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain.bb).
 This usually means one provides something the other doesn't and should.

Thanks to Kergoth (Chris Larson) and Lpapp (Lazslo)

[YOCTO #4908]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/tcmode-external-sourcery.inc | 3 +++
 meta/recipes-core/meta/external-sourcery-toolchain.bb | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
index 53e6653..d6cac74 100644
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -27,13 +27,16 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-sourcery
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_libgcc = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_eglibc = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/libc = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/libintl = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/libiconv = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/linux-libc-headers-dev = "external-sourcery-toolchain"
 PREFERRED_PROVIDER_gdbserver ??= "external-sourcery-toolchain"
 
 # No need to re-compile the locale files
diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index 5fed30a..41d86d6 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -16,12 +16,14 @@ PROVIDES += "\
 	virtual/${TARGET_PREFIX}gcc-intermediate \
 	virtual/${TARGET_PREFIX}binutils \
 	virtual/${TARGET_PREFIX}libc-for-gcc \
+	virtual/${TARGET_PREFIX}libc-initial \
 	virtual/${TARGET_PREFIX}compilerlibs \
 	virtual/libc \
 	virtual/libintl \
 	virtual/libiconv \
 	glibc-thread-db \
 	libgcc \
+	eglibc \
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-- 
1.8.1.4


