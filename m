Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B05C660232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 17:02:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 30 Dec 2014 09:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="435018745"
Received: from kolmos-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.251])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2014 08:50:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 17:02:07 +0000
Message-Id: <1e18b38ecced2903eecbe9e85d7995bbd93552f2.1419958884.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419958884.git.paul.eggleton@linux.intel.com>
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419958884.git.paul.eggleton@linux.intel.com>
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
Subject: [dizzy][PATCH 2/2] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Tue, 30 Dec 2014 17:02:17 -0000

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

(From OE-Core master rev: 5b051d65e797624cca3a81fc6f5c924925f3493e)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


