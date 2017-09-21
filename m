Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 81076781F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 21B122E4DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:56:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FY-Y7HmkpUhP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 7387B2E474
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EA271A06D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53B111A06B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 481FD1A81;
	Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 43E0B409A7; Thu, 21 Sep 2017 16:56:14 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 16:56:14 +0200
Message-Id: <20170921145614.8579-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: olani@axis.com
Subject: [PATCH] alsa-utils: Install and delete from the same udev-rules-dir
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
X-List-Received-Date: Thu, 21 Sep 2017 14:56:16 -0000

The --with-udev-rules-dir option used with udev is exactly what the
configure script uses, so there is no need for it.
On the other hand, if we do not have an udev.pc file we should tell
alsa-utils where to install the rules so we know where they should be
deleted from.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
index c8f4b861bd..7fc6c29a61 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
@@ -9,14 +9,17 @@ DEPENDS = "alsa-lib ncurses libsamplerate0"
 
 PACKAGECONFIG ??= "udev"
 
+udevdir = "${nonarch_base_libdir}/udev"
+
 # alsabat can be built also without fftw support (with reduced functionality).
 # It would be better to always enable alsabat, but provide an option for
 # enabling/disabling fftw. The configure script doesn't support that, however
 # (at least in any obvious way), so for now we only support alsabat with fftw
 # or no alsabat at all.
 PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
-
-PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
+# The udev-rules dir is taken from udev.pc.  Set the dir explicitly
+# when udev is not in our DEPENDS.
+PACKAGECONFIG[udev] = ",--with-udev-rules-dir=${udevdir}/rules.d,udev"
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
@@ -101,9 +104,13 @@ do_install() {
 	rm ${D}${sbindir}/alsa-info.sh
 	rm -f ${D}${sbindir}/alsabat-test.sh
 
-	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
-		# This is where alsa-utils will install its rules if we don't tell it anything else.
-		rm -rf ${D}${nonarch_base_libdir}/udev
-		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'udev', d)}" ]; then
+		# This is where alsa-utils installs if there is an udev.pc file
+		udevdir=$(pkg-config --variable=udevdir udev)
+	else
+		# This is where we told alsa-utils to install the rules
+		udevdir=${udevdir}
 	fi
+	rm -rf ${D}$udevdir
+	rmdir --ignore-fail-on-non-empty ${D}${udevdir%/*}
 }
-- 
2.11.0


