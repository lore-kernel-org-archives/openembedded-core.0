Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZzhB-0001fn-Kv
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:25:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2013 01:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="310033939"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2013 01:07:48 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 11:11:22 +0300
Message-Id: <1368000682-24889-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] diffstat: upgraded to 1.57
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 08:26:00 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../diffstat/diffstat/aclocal.patch                |   34 ++++++++++++++++++++
 .../{diffstat_1.55.bb => diffstat_1.57.bb}         |    8 ++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/aclocal.patch
 rename meta/recipes-devtools/diffstat/{diffstat_1.55.bb => diffstat_1.57.bb} (76%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
new file mode 100644
index 0000000..e1addf6
--- /dev/null
+++ b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
@@ -0,0 +1,34 @@
+Use the correct macro name (AC_AUTOCONF_VERSION) in the CF_ACVERSION_CHECK macro.
+The original macro name (AC_ACVERSION) leads to this error:
+
+| autoreconf: running: aclocal --system-acdir=/poky/buildnew/tmp/work/i586-poky-linux/diffstat/1.57-r0/build/aclocal-copy/ --automake-acdir=/poky/buildnew/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 --force
+| aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
+| configure.in:9: error: m4_defn: undefined macro: AC_ACVERSION
+| acinclude.m4:989: CF_PROG_CC is expanded from...
+| configure.in:9: the top level
+| autom4te: m4 failed with exit status: 1
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 144a074..fce6eba 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -13,15 +13,15 @@ dnl ------------------
+ dnl Conditionally generate script according to whether we're using a given autoconf.
+ dnl
+ dnl $1 = version to compare against
+-dnl $2 = code to use if AC_ACVERSION is at least as high as $1.
+-dnl $3 = code to use if AC_ACVERSION is older than $1.
++dnl $2 = code to use if AC_AUTOCONF_VERSION is at least as high as $1.
++dnl $3 = code to use if AC_AUTOCONF_VERSION is older than $1.
+ define([CF_ACVERSION_CHECK],
+ [
+ ifdef([m4_version_compare],
+-[m4_if(m4_version_compare(m4_defn([AC_ACVERSION]), [$1]), -1, [$3], [$2])],
++[m4_if(m4_version_compare(m4_defn([AC_AUTOCONF_VERSION]), [$1]), -1, [$3], [$2])],
+ [CF_ACVERSION_COMPARE(
+ AC_PREREQ_CANON(AC_PREREQ_SPLIT([$1])),
+-AC_PREREQ_CANON(AC_PREREQ_SPLIT(AC_ACVERSION)), AC_ACVERSION, [$2], [$3])])])dnl
++AC_PREREQ_CANON(AC_PREREQ_SPLIT(AC_AUTOCONF_VERSION)), AC_AUTOCONF_VERSION, [$2], [$3])])])dnl
+ dnl ---------------------------------------------------------------------------
+ dnl CF_ACVERSION_COMPARE version: 3 updated: 2012/10/03 18:39:53
+ dnl --------------------
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.55.bb b/meta/recipes-devtools/diffstat/diffstat_1.57.bb
similarity index 76%
rename from meta/recipes-devtools/diffstat/diffstat_1.55.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.57.bb
index 9b347e8..c25005f 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.55.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.57.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
-PR = "r0"
 
 SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
-           file://dirfix.patch"
+           file://dirfix.patch \
+           file://aclocal.patch"
 
-SRC_URI[md5sum] = "630d5278f1cd874dc3cc68cff3fddecf"
-SRC_URI[sha256sum] = "59a46c75a99f2c373a81880051adc43a17b71c55478691e702c61c13c6d61b55"
+SRC_URI[md5sum] = "a70ae35e479ab91da7eb6023a4e9240a"
+SRC_URI[sha256sum] = "cb9845839d695f178d6b5458b08d3e04773e400f35c0c062c4c0102220fba1e6"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
1.7.10.4



