Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCv-0000ex-Pm
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181458"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:35 +0300
Message-Id: <68c171f718eea26b06953163462bc29a9a671c4a.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 48/64] cracklib, zlib, perl: install libz, libcrack to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 14 Aug 2012 12:30:13 -0000

From: Yao Zhao <yao.zhao@windriver.com>

In order to fix the QA Issue for libpam which installed to /lib but
reference /usr/libxx/libz and libcrack, install libz and libcrack
to /lib.

Modify perl recipe to add STAGING_BASELIBDIR to library search path, original
recipe only has STAGING_LIBDIR, /lib, /usr/lib, which can't find the libz.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/zlib/zlib_1.2.7.bb              |   11 +++++++++--
 meta/recipes-devtools/perl/perl_5.14.2.bb         |    4 ++--
 meta/recipes-extended/cracklib/cracklib_2.8.19.bb |    4 +++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
index 803fec3..0d8b6bd 100644
--- a/meta/recipes-core/zlib/zlib_1.2.7.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -12,8 +12,11 @@ SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2ab442d169156f34c379c968f3f482dd"
 SRC_URI[sha256sum] = "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378c79d52e9334934"
 
+PR = "r1"
+
 do_configure (){
-	./configure --prefix=${prefix} --shared --libdir=${libdir}
+	#sharedlibdir sets to {libdir} if not set
+	./configure --prefix=${prefix} --shared --libdir="${base_libdir}"
 }
 
 do_compile (){
@@ -21,7 +24,11 @@ do_compile (){
 }
 
 do_install() {
-	oe_runmake DESTDIR=${D} install
+	#install libz.so.1.2.7 libz.a to /lib
+	#libz.a installs to libdir, overwrite the env libdir
+	#install pkgconfig to env libdir/pkgconfig
+	oe_runmake DESTDIR=${D} pkgconfigdir="${libdir}/pkgconfig" \
+		   libdir="${base_libdir}" install
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 561b30e..40dbc80 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r8"
+PR = "r9"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -180,7 +180,7 @@ do_compile() {
         sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" ext/Errno/Errno_pm.PL
         sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" cpan/Compress-Raw-Zlib/config.in
         sed -i -e 's|/usr/lib|""|g' cpan/Compress-Raw-Zlib/config.in
-        sed -i -e 's|SYSROOTLIB|${STAGING_LIBDIR}|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+        sed -i -e 's|"SYSROOTLIB"|("${STAGING_BASELIBDIR}", "${STAGING_LIBDIR}")|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 
         cd Cross
         oe_runmake perl LD="${CCLD}"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
index 2951396..e36703e 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = "zlib"
-PR ="r0"
+PR ="r1"
 
 EXTRA_OECONF = "--without-python"
 
@@ -15,3 +15,5 @@ SRC_URI[md5sum] = "ca0ec168d9c6466612204e8dfb2df8a9"
 SRC_URI[sha256sum] = "7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
 
 inherit autotools gettext
+
+libdir = "${base_libdir}"
-- 
1.7.7.6



