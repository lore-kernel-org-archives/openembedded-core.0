Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 May 2018 11:52:22 UTC
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1F260939
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 11:52:22 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/01/2018 7:37:20 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.2.1)
	with PIPE id 370399469; Tue, 01 May 2018 07:37:20 -0400
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.2.1)
	with ESMTPS id 370399449; Tue, 01 May 2018 07:37:16 -0400
Received: from [fd44:d8b8:cab5:cb01::58] (helo=scoop.brightsign)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fDTav-0006M6-S4; Tue, 01 May 2018 12:37:17 +0100
Received: from mac by scoop.brightsign with local (Exim 4.89)
	(envelope-from <mac@scoop.brightsign>)
	id 1fDTav-00048X-QY; Tue, 01 May 2018 12:37:17 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2018 12:36:55 +0100
Message-Id: <20180501113655.11666-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/01/2018 7:37:17 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-24/SG:1 5/1/2018 7:37:06 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.551511 p=-1 Source White
X-Signature-Violations: 0-0-0-6148-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G335 G336 G337 G338 G342 G343 G475 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] alsa-utils: Fix error when removing unwanted udev rules
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
X-List-Received-Date: Tue, 01 May 2018 11:52:23 -0000

If alsa-utils configure is not passed a --with-udev-rules-dir option then
it defaults to using /lib/udev/rules.d. This meant that the hard-coded use
of ${D}/lib in do_install in 262e69c9c7acf0beb7bb6b96299e3c993c906434
worked correctly to remove the unwanted rules.

Subsequently, 0a4372705a030ca54ed420cdfec33d46ab93499c changed do_install
to use ${nonarch_base_libdir}, claiming to fix this in the usrmerge case.

This means that if udev is not present in PACKAGECONFIG and usrmerge is
present in DISTRO_FEATURES then the alsa-utils build system will install
the rules in ${D}/lib/udev/rules.d but do_install will attempt to remove
${D}/usr/lib, resulting in something like:

 rmdir: failed to remove '.../tmp-glibc/work/i586-oe-linux/alsa-utils/1.1.5-r0/image/usr/lib': No such file or directory

To fix this, let's just tell configure to install the rules in a specific
known location when udev is disabled. This location can then easily be
cleaned up in do_install.

Tested both with and without usrmerge in DISTRO_FEATURES.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: Phil Blundell <pb@pbcl.net>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
index f2231f34f0..5561b4de3f 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG ??= "udev"
 # or no alsabat at all.
 PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
 
-PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
+PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,--with-udev-rules-dir=/unwanted/rules.d,udev"
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
@@ -102,8 +102,8 @@ do_install() {
 	rm -f ${D}${sbindir}/alsabat-test.sh
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
-		# This is where alsa-utils will install its rules if we don't tell it anything else.
-		rm -rf ${D}${nonarch_base_libdir}/udev
-		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
+        	# If udev is disabled, we told configure to install the rules in /unwanted, so
+        	# we can get rid of them now.
+        	rm -rf ${D}/unwanted
 	fi
 }
-- 
2.11.0



