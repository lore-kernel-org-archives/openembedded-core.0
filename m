Return-Path: <chin.huat.ang@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Aug 2019 05:59:37 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7937F445
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:59:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 22:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="168519878"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 06 Aug 2019 22:52:31 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed,  7 Aug 2019 13:52:27 +0800
Message-Id: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior][PATCH 1/4] efivar: add
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
X-List-Received-Date: Wed, 07 Aug 2019 05:59:38 -0000

From: Ross Burton <ross.burton@intel.com>

This was in meta-oe but EFI is sufficiently wide spread now that we need it in
core.

The recipe is based on the one in meta-oe but with several updates.

(From OE-Core rev: 53fe0133432f62024850e87456292b044d1280ee)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 meta/recipes-bsp/efivar/efivar/no-werror.patch | 18 +++++++++++++
 meta/recipes-bsp/efivar/efivar_37.bb           | 37 ++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/no-werror.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar_37.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 950b8e8..7d31e4f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -161,6 +161,7 @@ RECIPE_MAINTAINER_pn-dtc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-bsp/efivar/efivar/no-werror.patch b/meta/recipes-bsp/efivar/efivar/no-werror.patch
new file mode 100644
index 0000000..50a0b10
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/no-werror.patch
@@ -0,0 +1,18 @@
+Don't use -Werror because newer compilers introduce newer warnings.
+
+Upstream-Status: Inappropriate [https://github.com/rhboot/efivar/issues/131]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gcc.specs b/gcc.specs
+index 45d43d1..1baf11a 100644
+--- a/gcc.specs
++++ b/gcc.specs
+@@ -2,7 +2,7 @@
+ + -D_GNU_SOURCE
+ 
+ *efivar_cpp_options:
+- -Werror -Wall -std=gnu11 -Wextra
++ -Wall -std=gnu11 -Wextra
+ 
+ *cpp_options:
+ + %(efivar_cpp_options)
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
new file mode 100644
index 0000000..c4254c7
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Tools to manipulate UEFI variables"
+DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
+HOMEPAGE = "https://github.com/rhboot/efivar"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://no-werror.patch"
+SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+export CCLD_FOR_BUILD = "${BUILD_CCLD}"
+
+# Upstream uses --add-needed in gcc.specs which gold doesn't support, so
+# enforce BFD.
+LDFLAGS += "-fuse-ld=bfd"
+
+do_compile_prepend() {
+    # Remove when https://github.com/rhboot/efivar/issues/130 is fixed
+    oe_runmake CFLAGS="${BUILD_CFLAGS}" -C src makeguids
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+BBCLASSEXTEND = "native"
+
+RRECOMMENDS_${PN}_class-target = "kernel-module-efivarfs"
+
+CLEANBROKEN = "1"
-- 
2.7.4


