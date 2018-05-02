Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 50938745D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 13:38:11 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/02/2018 9:38:08 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.2.1)
	with PIPE id 371432658; Wed, 02 May 2018 09:38:08 -0400
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.2.1)
	with ESMTPS id 371432613; Wed, 02 May 2018 09:38:05 -0400
Received: from [fd44:d8b8:cab5:cb01::58] (helo=scoop.brightsign)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fDrxR-000Fcc-IE; Wed, 02 May 2018 14:38:09 +0100
Received: from mac by scoop.brightsign with local (Exim 4.89)
	(envelope-from <mac@scoop.brightsign>)
	id 1fDrxR-000ALn-E6; Wed, 02 May 2018 14:38:09 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 14:38:03 +0100
Message-Id: <20180502133803.37862-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <fb6ef50149364c4db6f17687bb90645a@XBOX02.axis.com>
References: <fb6ef50149364c4db6f17687bb90645a@XBOX02.axis.com>
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/02/2018 9:38:05 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-63/SG:1 5/2/2018 9:37:15 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.483445 p=-1 Source Normal
X-Signature-Violations: 0-0-0-6654-c
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
Subject: [PATCHv2] alsa-utils: Fix error when removing unwanted udev rules
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
X-List-Received-Date: Wed, 02 May 2018 13:38:12 -0000

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
cleaned up in do_install without doing any harm if udev is enabled.

Tested both with and without usrmerge in DISTRO_FEATURES and with and
without udev in PACKAGECONFIG.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: Phil Blundell <pb@pbcl.net>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
index f2231f34f0..33215bf159 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG ??= "udev"
 # or no alsabat at all.
 PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
 
-PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
+PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,--with-udev-rules-dir=/unwanted/rules.d,udev"
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
@@ -101,9 +101,8 @@ do_install() {
 	rm ${D}${sbindir}/alsa-info.sh
 	rm -f ${D}${sbindir}/alsabat-test.sh
 
-	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
-		# This is where alsa-utils will install its rules if we don't tell it anything else.
-		rm -rf ${D}${nonarch_base_libdir}/udev
-		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
-	fi
+	# If udev is disabled, we told configure to install the rules
+	# in /unwanted, so we can remove them now. If udev is enabled,
+	# then /unwanted won't exist and this will have no effect.
+	rm -rf ${D}/unwanted
 }
-- 
2.11.0



