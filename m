Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6C79A72739
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 00:52:46 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBI0qlOB028023 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 18:52:47 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121718524719-195174 ;
	Wed, 17 Dec 2014 18:52:47 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Dec 2014 18:52:16 -0600
Message-Id: <1418863936-8576-4-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418863936-8576-1-git-send-email-rich.tollerton@ni.com>
References: <1418863936-8576-1-git-send-email-rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/17/2014 06:52:47 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/17/2014 06:52:47 PM,
	Serialize complete at 12/17/2014 06:52:47 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-17_07:2014-12-17, 2014-12-17,
	1970-01-01 signatures=0
Subject: [PATCH 3/3] xorg-font-common: fix sysroot injection for encoding maps
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
X-List-Received-Date: Thu, 18 Dec 2014 00:52:56 -0000

The xorg font builds use `pkg-config --variable=mapdir fontutil` to
locate encoding maps. This variable ought to be sysroot-relative, but
neither pkg-config nor font-util nor the fonts themselves provide any
facility to add the sysroot back in.

We're presently adding the sysroot by by twiddling MAPFILES_PATH in
configure.ac. This is broken; it's actually defined in aclocal.m4,
because the definition is provided by fontutil.m4. Another (more
speculative) criticism is that it also hardcodes a build-specific
absolute path into builds which might (incorrectly) encode it into
target-installable packages.

A somewhat more robust, focused, and clear solution is to override
UTIL_DIR on the make command line. (UTIL_DIR, not MAPFILES_PATH, is what
is actually referenced in the build.)

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index 55adde3..d3b995a 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -15,13 +15,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OEMAKE += "FCCACHE=/bin/true"
-
-do_configure_prepend() {
-        if [ -f "${S}"/configure.ac ] ; then
-                sed -i "s#^MAPFILES_PATH=.*#MAPFILES_PATH=\"${STAGING_DIR_TARGET}/\$(pkg-config --variable=mapdir fontutil)\"#g" "${S}"/configure.ac
-        fi
-}
+EXTRA_OEMAKE += "FCCACHE=/bin/true UTIL_DIR=${STAGING_DIR_TARGET}\$\(MAPFILES_PATH\)"
 
 do_install_append() {
 	find ${D}${libdir}/X11/fonts -type f -name fonts.dir | xargs rm -f
-- 
2.1.3


