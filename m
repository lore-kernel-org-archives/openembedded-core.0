Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdjoY-0004dt-OJ
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:44:45 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 07:30:26 -0800
Received: by mail-ea0-f197.google.com with SMTP id d14so8087881eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=2HnRMHBBtcToBipVAYPJTE5BuRayqNggAOdO9ohMev8=;
	b=FjJqwQ6Fe9/I3/TJDdewvosMR8gZJCcy0FM+SfIQHWIwYeYuu7i2nX+Jg634X1dVGs
	HDKIBWFBJfE5lxHFgX+zv1bp5KNgyWq9sW9xsqjPra8aLaRN4YI4rjhShteGmQMeABH5
	xzuFom2QbVJsH0TEClSAsUeQB7pKrr17HWe/XJqgu06hVWenrQL87kGQBNKc/vJgY8Ll
	JgYG7cow6ZA4AIad+kHgkrBtnIa9S7Gg6N4j0McfZiVHf76PKIrL+ZsKL8p3xYfUHRs5
	dpbvnfM04f4OfANDMKpTFqeB8fT8q9dr5KXsLdKUsAQtSX5HOM1WHV5Jm2+5QSa8BBAN
	26RA==
Received: by 10.180.102.2 with SMTP id fk2mr30052423wib.10.1354116624467;
	Wed, 28 Nov 2012 07:30:24 -0800 (PST)
Received: by 10.180.102.2 with SMTP id fk2mr30052404wib.10.1354116624340;
	Wed, 28 Nov 2012 07:30:24 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id b1sm8398968wix.11.2012.11.28.07.30.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 07:30:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 15:28:48 +0000
Message-Id: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQky898ksG04CfALZGZNjFZYeiTciuj3epQxTfJ8eu2NRUp5DHAXzDruRz3di5hsGNLjl/DZ7ZVRfBfifa0h1FrwvUrr4AANaeSr3AEVqBRoAF3UcNkYLPR1SVl1WNkw8KZYdjE5fmvJQg/9tEjdN8FEgGrjw6egjneyfvUI7tmgWTwQ5SrIy4jFyJDGZNvz6w+pPLEj
Subject: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
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
X-List-Received-Date: Wed, 28 Nov 2012 15:44:46 -0000

Even though the current xserver in oe-core (1.13) doesn't ship these as
standalone extensions, older X servers required by binary drives
(e.g. meta-intel's 1.9) still install them separately.  As the packages didn't
exist in xserver-xorg.inc the extensions were not packaged, and X didn't work.

Revolve this by restoring the package definitions, and moving the upgrade path
dependencies to xserver-xorg_1.13.bb.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   30 +++++++-------------
 .../xorg-xserver/xserver-xorg_1.13.0.bb            |   22 ++++++++++++++
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index d410707..cea4c26 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r6"
+INC_PR = "r7"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
@@ -48,7 +48,12 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-utils \
              ${PN}-xephyr \
              ${PN}-multimedia-modules \
+             ${PN}-extension-dri \
+             ${PN}-extension-dri2 \
              ${PN}-extension-glx \
+             ${PN}-extension-record \
+             ${PN}-extension-extmod \
+             ${PN}-extension-dbe \
              ${PN}-module-libint10 \
              ${PN}-module-libafb \
              ${PN}-module-libwfb  \
@@ -62,24 +67,6 @@ PACKAGES =+ "${PN}-security-policy \
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
-RREPLACES_${PN} =  "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
-RPROVIDES_${PN} =  "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
-RCONFLICTS_${PN} = "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
@@ -95,7 +82,12 @@ FILES_${PN}-xvfb = "${bindir}/Xvfb"
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES_${PN}-xephyr = "${bindir}/Xephyr"
 FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
+FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
+FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
 FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
+FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
+FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
+FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
 FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
 FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
 FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
index 8ad87b8..3b102cb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
@@ -10,3 +10,25 @@ SRC_URI[md5sum] = "bde3d178b756597d2ec2a19ef60d2e1f"
 SRC_URI[sha256sum] = "548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a"
 
 PR = "${INC_PR}.0"
+
+# These extensions are now integrated into the server, so declare the migration
+# path for in-place upgrades.
+
+RREPLACES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RPROVIDES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RCONFLICTS_${PN} = "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
-- 
1.7.10



