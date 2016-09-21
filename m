Return-Path: <gratian.crisan@ni.com>
X-Greylist: delayed 3878 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Sep 2016 19:45:15 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EADE56E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:45:15 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u8LIecAZ008948; Wed, 21 Sep 2016 13:40:38 -0500
Received: from spline.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016092113403799-121634 ;
	Wed, 21 Sep 2016 13:40:37 -0500 
From: Gratian Crisan <gratian.crisan@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 13:40:25 -0500
Message-Id: <1474483225-29817-1-git-send-email-gratian.crisan@ni.com>
X-Mailer: git-send-email 2.7.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/21/2016 01:40:38 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/21/2016 01:40:38 PM,
	Serialize complete at 09/21/2016 01:40:38 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-21_10:, , signatures=0
Cc: gratian@gmail.com
Subject: [PATCH] encodings: Add dependency to mkfontdir-native
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
X-List-Received-Date: Wed, 21 Sep 2016 19:45:17 -0000

Currently adding a font recipe to an image doesn't have enough
dependencies to cause mkfontdir-native to be included in the native
sysroot. This creates problems with the postinstall scripts for fonts
which call mkfontdir to create font index files: font.dir. The end
result is missing font.dir files in the built image and a malfunctioning
font system.

Dependencies for the relevant recipes currently look like this:

  * <font.bb>   [D ] -> font-util-native
                [R ] -> encodings, font-util
                [RN] -> font-util-native

  * font-util   [D ] -> encodings
                [R ] -> mkfontdir, mkfontscale, encodings
                [RN] -> mkfontdir-native, mkfontscale-native

  * encodings   [D ] -> mkfontscale-native, font-util-native

  * mkfontdir   [R ] -> mkfontscale
                [RN] -> mkfontscale-native

  * mkfontscale [D ] -> libfontenc

  * libfontenc  [D ] -> font-util

Where:
  * D = DEPENDS
  * R = RDEPENDS
  * RN = RDEPENDS_class-native
  * <font.bb> e.g. font-adobe-100dpi*.bb
Some details where omitted for clarity e.g. dependencies on util-macros.

I believe the intent behind the RDEPENDS_class-native chain:
  * <font.bb> -> font-util-native -> mkfontdir-native
was to provide the necessary dependency on mkfontdir. However because
the native sysroot is not built from packages this RDEPENDS_class-native
chain doesn't have the desire effect (i.e. it doesn't pull in
mkfontdir-native).

Changing the RDEPENDS_class-native chain into a DEPENDS_class-native
chain is a non-starter because of the build time dependency loop it
creates:
  * font-util-native -> mkfontscale-native -> libfontenc-native -> font-util-native

Having upstream remove the build time dependency of libfontenc on
font-util is also a non-starter[1] even though it does create problems
in other distributions, for example on Debian see [2], [3].

Instead add a DEPENDS on mkfontdir-native in the encodings recipe in
addition to the mkfontscale-native dependency it already contains. This
solves the missing mkfontdir in the native sysroot problem without
introducing a build dependency loop.

[1] https://bugs.freedesktop.org/show_bug.cgi?id=97631
[2] https://wiki.debian.org/CircularBuildDependencies
[3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=717843

Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
index 90846d8..36766f2 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9da93f2daf2d5572faa2bfaf0dbd9e76"
 PE = "1"
 PR = "${INC_PR}.1"
 
-DEPENDS = "mkfontscale-native font-util-native"
+DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS_${PN} = ""
 
 SRC_URI += "file://nocompiler.patch"
-- 
2.7.1


