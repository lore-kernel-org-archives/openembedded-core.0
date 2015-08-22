Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 49C2860657
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 17:00:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2015 10:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,728,1432623600"; d="scan'208";a="753503578"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2015 10:00:07 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Sat, 22 Aug 2015 09:55:15 -0700
Message-Id: <1440262519-13582-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
References: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 1/5] tclibc-baremetal.inc: baremetal specific distro policy file
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
X-List-Received-Date: Sat, 22 Aug 2015 17:00:11 -0000

Support for TCLIBC="baremetal".
Allows building "baremetal" toolchains.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/conf/distro/include/tclibc-baremetal.inc

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
new file mode 100644
index 0000000..a8ce6d3
--- /dev/null
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -0,0 +1,32 @@
+#
+# baremetal configuration
+#
+
+LIBCEXTENSION = ""
+
+# Add baremetal libc overrides to the overrides.
+LIBCOVERRIDE = ":libc-baremetal"
+OVERRIDES .= "${LIBCOVERRIDE}"
+
+ASSUME_PROVIDED += "virtual/libc virtual/libiconv"
+
+PREFERRED_PROVIDER_virtual/libc ?= "musl"
+PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
+PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
+
+USE_NLS ?= "no"
+IMAGE_LINGUAS = ""
+LIBC_DEPENDENCIES = ""
+
+EXTRA_OECONF_pn-gcc-cross-${TARGET_ARCH}_append = " --without-headers"
+DEPENDS_remove_pn-meta-toolchain = "virtual/libc virtual/${TARGET_PREFIX}compilerlibs"
+
+TARGET_OS = "elf"
+TARGET_OS_arm = "eabi"
+
+TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
+TOOLCHAIN_TARGET_TASK ?= "libgcc-dev"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "virtual/${MLPREFIX}libc zlib ncurses"
-- 
1.9.1


