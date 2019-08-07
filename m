Return-Path: <chin.huat.ang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 975337F45A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:59:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 22:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="168519893"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 06 Aug 2019 22:52:34 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed,  7 Aug 2019 13:52:29 +0800
Message-Id: <1565157150-7729-3-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
References: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
Subject: [warrior][PATCH 3/4] efibootmgr: add
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
X-List-Received-Date: Wed, 07 Aug 2019 05:59:41 -0000

From: Ross Burton <ross.burton@intel.com>

This was in meta-oe but EFI is sufficiently widespread now that we need it in
core.

The recipe is based on the one in meta-oe but with several updates.

(From OE-Core rev: 275e5e7ecf4f79b7892ae35a47902188d9905bd0)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../efibootmgr/0001-remove-extra-decl.patch        | 31 ++++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb       | 34 ++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7d31e4f..af2c4c3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -162,6 +162,7 @@ RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-efibootmgr = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
new file mode 100644
index 0000000..42f3a81
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
@@ -0,0 +1,31 @@
+From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 13 Jun 2018 09:41:01 -0400
+Subject: [PATCH] remove extra decl
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+
+Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/efibootmgr.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index de38f01..4e1a680 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
+ 					       "invalid numeric value %s\n",
+ 					       optarg);
+ 			}
+-                        /* XXX efivar-36 accidentally doesn't have a public
+-                         * header for this */
+-			extern int efi_set_verbose(int verbosity, FILE *errlog);
+ 			efi_set_verbose(opts.verbose - 2, stderr);
+ 			break;
+ 		case 'V':
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
new file mode 100644
index 0000000..0e5a81e
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
+SUMMARY = "EFI Boot Manager"
+HOMEPAGE = "https://github.com/rhboot/efibootmgr"
+SECTION = "base"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS = "efivar popt"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+           file://0001-remove-extra-decl.patch \
+          "
+SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+# The directory under the ESP that the default bootloader is found in.  When
+# wic uses a subdirectory, this should use the same one too.
+EFIDIR ?= "/"
+
+EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}'"
+
+CFLAGS += " -Wno-error"
+
+do_install () {
+	oe_runmake install DESTDIR="${D}"
+}
+
+CLEANBROKEN = "1"
-- 
2.7.4


