Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF50615BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:14:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2013 17:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="398408127"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2013 17:14:27 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Wed,  4 Sep 2013 17:18:38 -0700
Message-Id: <7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
References: <b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 00:14:28 -0000

As part of pulling in the more generic components of the meta-intel
xserver infrastructure, include the configure and install appends from
the meta-intel version of xorg-driver-common.

Modify the configure prepend to use ${S} in the paths explicitly as
without this the script appears to be running in a build/ directory
instead of the source directory, and cannot find the configure.ac.
This prepend is required for at least the -intel and -mga drivers.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-driver/xorg-driver-common.inc             |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 5f5d282..2d4f2ce 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "2"
-INC_PR = "r21"
+INC_PR = "r22"
 
 DEPENDS = "virtual/xserver xproto randrproto util-macros"
 
@@ -39,3 +39,18 @@ def add_abi_depends(d, name):
 
     pn = d.getVar("PN", True)
     d.appendVar('RDEPENDS_' + pn, ' ' + abi)
+
+# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
+# macro that simply assumes the test succeeds. This is required for at least
+# the -intel and -mga drivers.
+do_configure_prepend () {
+	echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > ${S}/configure.ac.new
+	sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' ${S}/configure.ac >> ${S}/configure.ac.new
+	mv ${S}/configure.ac.new ${S}/configure.ac
+}
+
+# FIXME: We don't want to include the libtool archives (*.la) from modules
+# directory, as they serve no useful purpose. Upstream should fix Makefile.am
+do_install_append() {
+	find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
+}
-- 
1.7.9.5


