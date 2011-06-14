Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOcv-0001K6-8T
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283851"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:12 -0700
Message-Id: <f017f117cb57273417a0840cc6d91b0e227517ab.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/51] git: restore the dependency on perl-native
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:33 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
index c884f9c..5d77880 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -1,16 +1,16 @@
 DESCRIPTION = "The git revision control system used by the Linux kernel developers"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-DEPENDS = "perl-native openssl curl zlib expat"
+DEPENDS = "openssl curl zlib expat"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
-EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
+EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --without-tcltk"
 
-inherit autotools
+inherit autotools perlnative
 
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
diff --git a/meta/recipes-devtools/git/git_1.7.5.1.bb b/meta/recipes-devtools/git/git_1.7.5.1.bb
index bfdbf62..04d1d56 100644
--- a/meta/recipes-devtools/git/git_1.7.5.1.bb
+++ b/meta/recipes-devtools/git/git_1.7.5.1.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r0"
+PR = "r2"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.3.4



