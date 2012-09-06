Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1T9Xeo-0001at-20
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 10:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2005; q=dns/txt; s=iport;
	t=1346920168; x=1348129768;
	h=from:to:cc:subject:date:message-id;
	bh=l+oJdR2Ob2Ol399ifdAsoNSDTpB93uq6n7DIPyc07OM=;
	b=CsP+IYdW67Qkh045THP2y+AELd9nbFOWT+T3+1CvssGXl+F9bXCqXPK1
	gjSHBkOcsFGRpxRVh/75BoSoVK23/GQdKR80Ms9vFJEwaG+B3LAiGLoOT
	YNt4Q4Z30BD/HhzBfQ3qlfZJPAS49Bj7SIbzTbYxHDoEOqoQ/v/5xQptg I=;
X-IronPort-AV: E=Sophos;i="4.80,377,1344211200"; d="scan'208";a="143399244"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-1.cisco.com with ESMTP; 06 Sep 2012 08:29:25 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q868TP0d002188;
	Thu, 6 Sep 2012 08:29:25 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 10:29:24 +0200
Message-Id: <1346920164-29192-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] perl: Remove the changes of bin, lib etc. as the defaults will give sane values.
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
X-List-Received-Date: Thu, 06 Sep 2012 08:41:50 -0000

The old config put stuff in ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-unknownsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-unknownsdk-linux/usr
instead of in ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-nimbussdk-linux/usr as it should.
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |   19 ++++++++-----------
 1 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 3c1360f..04e2597 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r9"
+PR = "r10"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -145,16 +145,13 @@ do_configure() {
 
 	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
 
-        # Update some paths in the configuration
-        sed -i -e 's,@DESTDIR@,${prefix},g' \
-               -e 's,@ARCH@-thread-multi,,g' \
-               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
-               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
-               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
-	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
-	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
-	       -e "s%/perl5%/perl%g" \
-            config.sh-${TARGET_ARCH}-${TARGET_OS}
+    # Update some paths in the configuration
+    sed -i -e 's,@DESTDIR@,${prefix},g' \
+           -e 's,@ARCH@-thread-multi,,g' \
+           -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
+           -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
+           -e "s%/perl5%/perl%g" \
+          config.sh-${TARGET_ARCH}-${TARGET_OS}
 
 	case "${TARGET_ARCH}" in
 		x86_64 | powerpc | s390)
-- 
1.7.8.6



