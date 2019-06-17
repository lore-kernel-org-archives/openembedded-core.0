Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 898287E871
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:12:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jun 2019 15:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,386,1557212400"; d="scan'208";a="185891265"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2019 15:12:05 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:11:42 -0700
Message-Id: <d3a3c81598882b289fc8d99ff2a18fb0281d1840.1560809373.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
References: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libmodule-build-perl: move from meta-perl
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
X-List-Received-Date: Mon, 17 Jun 2019 22:12:05 -0000
Content-Transfer-Encoding: 8bit

* cpan_build.bbclass DEPENDS on libmodule-build-perl
* add self as maintainer

Fixes [YOCTO #12873]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../perl/libmodule-build-perl_0.4224.bb       | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 38fc711f5c1..86a7eb449b8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -354,6 +354,7 @@ RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb
new file mode 100644
index 00000000000..d523a7a0c7b
--- /dev/null
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Module::Build - Build and install Perl modules"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/release/Module-Build"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=960;endline=965;md5=624c06db56a2af4d70cf9edc29fcae1b"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz"
+SRC_URI[md5sum] = "b74c2f6e84b60aad3a3defd30b6f0f4d"
+SRC_URI[sha256sum] = "a6ca15d78244a7b50fdbf27f85c85f4035aa799ce7dd018a0d98b358ef7bc782"
+
+S = "${WORKDIR}/Module-Build-${PV}"
+
+inherit cpan_build
+
+# From:
+# https://github.com/rehsack/meta-cpan/blob/master/recipes-devel/module-build-perl/module-build-perl_0.4216.bb
+#
+do_patch_module_build () {
+    cd ${S}
+    sed -i -e 's,my $interpreter = $self->{properties}{perl};,my $interpreter = "${bindir}/perl";,g' lib/Module/Build/Base.pm
+}
+
+do_patch[postfuncs] += "do_patch_module_build"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


