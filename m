Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIv-000423-Tx
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360957"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:51 -0700
Message-Id: <e34b6835092ada1b4f1214ccb193833ebf608ba9.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/29] rpm: ensure that magic file is relocatable
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:50 -0000

rpm-native was reading from /usr/share/misc/magic which is wrong
it needs to be set to read from the sysroot.  This also adds wrappers
to the rpm-build tools to ensure they know were to find the macros that
point to the right directories.

Fixes [YOCTO #1532]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index a7b360d..356512a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -44,8 +44,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
-extrarpmdeps_virtclass-native = ""
-PR = "r21"
+extrarpmdeps_virtclass-native = "file-native"
+PR = "r22"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -119,7 +119,7 @@ EXTRA_OECONF = "--verbose \
 		${WITH_DB} \
 		${WITH_Z} \
 		--with-file \
-		--with-path-magic=/usr/share/misc/magic \
+		--with-path-magic=%{_usrlibrpm}/../../share/misc/magic \
 		--without-lua \
 		--without-tcl \
 		--with-syck=internal \
@@ -289,6 +289,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/vpkg-provides2.sh \
 		${libdir}/rpm/perfile_rpmdeps.sh \
 		"
+RDEPENDS_${PN}-build = "file"
 
 #%rpmattr       %{_rpmhome}/gem_helper.rb
 #%rpmattr       %{_rpmhome}/symclash.*
@@ -420,6 +421,13 @@ do_install_append_virtclass-native() {
 		RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
 		RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
 
+	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm*; do
+        	create_wrapper $rpm_binary
+			RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
+			RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
+			RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
+	done
+
 	# Adjust popt macros to match...
 	cat ${D}/${libdir}/rpm/rpmpopt | sed -e "s,^\(rpm[^ 	]*\)\([ 	]\),\1.real\2," > ${D}/${libdir}/rpm/rpmpopt.new
 	mv ${D}/${libdir}/rpm/rpmpopt.new ${D}/${libdir}/rpm/rpmpopt
-- 
1.7.6



