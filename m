Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QUwOX-0002q0-6f
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 09:44:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2011 00:41:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="11892181"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2011 00:41:18 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 10 Jun 2011 15:41:04 +0800
Message-Id: <79356a51507f1872199ba38262b749277633b4d4.1307691436.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1307691436.git.dexuan.cui@intel.com>
References: <cover.1307691436.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307691436.git.dexuan.cui@intel.com>
References: <cover.1307691436.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] git: restore the dependency on perl-native
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
X-List-Received-Date: Fri, 10 Jun 2011 07:44:41 -0000

[YOCTO #1155]

I thought git-native could depend on perl-native-runtime and tests on
Ubuntu 9.04/10.10 and Fedora 13 show it could buid fine (looks these distros
install perl-ExtUtils-MakeMaker by default).

However Joshua reported on Fedora 15 i686 host, git-native can't build unless
he manually installed perl-ExtUtils-MakeMaker to the host.

This makes me think we may as well make git-native depend on perl-native.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/git/git.inc        |    6 +++---
 meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 3cdd1fa..5d77880 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -1,16 +1,16 @@
 DESCRIPTION = "The git revision control system used by the Linux kernel developers"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-DEPENDS = "perl-native-runtime openssl curl zlib expat"
+DEPENDS = "openssl curl zlib expat"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
-EXTRA_OECONF = "--without-tcltk"
+EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --without-tcltk"
 
-inherit autotools
+inherit autotools perlnative
 
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
diff --git a/meta/recipes-devtools/git/git_1.7.5.1.bb b/meta/recipes-devtools/git/git_1.7.5.1.bb
index 9aa2bdf..04d1d56 100644
--- a/meta/recipes-devtools/git/git_1.7.5.1.bb
+++ b/meta/recipes-devtools/git/git_1.7.5.1.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.2



