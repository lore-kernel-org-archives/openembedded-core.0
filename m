Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4B76C724EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 18:15:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2014 10:09:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,523,1413270000"; d="scan'208";a="643123770"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2014 10:09:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 18:09:28 +0000
Message-Id: <b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1417802944.git.paul.eggleton@linux.intel.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1417802944.git.paul.eggleton@linux.intel.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Fri, 05 Dec 2014 18:15:35 -0000

Since the split out of git-perltools, some git tools (such as "git am",
"git send-email" and "git-submodule") have no longer been part of the
buildtools. We need these, so add them back in.

However, adding git-perltools to buildtools triggers perl itself being
brought into buildtools as well, and we don't want that; but we also
don't want to have to hack the git recipe or indeed anything else that
starts depending on perl. Thus, add a dummy package which gets installed
in its place, in a separate package architecture that is only enabled
for buildtools to ensure it doesn't start appearing in place of
nativesdk-perl anywhere else.

Fixes [YOCTO #7033].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb          |  4 ++++
 .../meta/nativesdk-buildtools-perl-dummy.bb           | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 58e0ffa..302510c 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -15,13 +15,17 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
+    nativesdk-buildtools-perl-dummy \
     nativesdk-git \
+    nativesdk-git-perltools \
     nativesdk-pigz \
     nativesdk-make \
     nativesdk-wget \
     nativesdk-ca-certificates \
     "
 
+SDK_PACKAGE_ARCHS =+ "buildtools-dummy-${SDKPKGSUFFIX}"
+
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
 RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
new file mode 100644
index 0000000..d971c3c
--- /dev/null
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Dummy package which ensures perl is excluded from buildtools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit nativesdk
+
+# Put it somewhere separate to ensure it's never used except when we want it
+PACKAGE_ARCH = "buildtools-dummy-${SDKPKGSUFFIX}"
+
+PERLPACKAGES = "nativesdk-perl \
+                nativesdk-perl-module-file-path"
+
+ALLOW_EMPTY_${PN} = "1"
+
+python populate_packages_prepend() {
+    d.appendVar('RPROVIDES_${PN}', '${PERLPACKAGES}')
+    d.appendVar('RCONFLICTS_${PN}', '${PERLPACKAGES}')
+}
+
-- 
1.9.3


