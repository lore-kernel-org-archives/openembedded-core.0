Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8F971F23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 19:34:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBCJYKoh026734 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 13:34:20 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121213342042-1077391 ;
	Fri, 12 Dec 2014 13:34:20 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Dec 2014 13:34:00 -0600
Message-Id: <1418412840-12796-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/12/2014 01:34:20 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/12/2014 01:34:20 PM,
	Serialize complete at 12/12/2014 01:34:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-12_07:2014-12-12, 2014-12-12,
	1970-01-01 signatures=0
Subject: [PATCH] font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 12 Dec 2014 19:34:25 -0000

PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
/usr/lib/pkgconfig is always checked as a fallback; however,
PKG_CONFIG_PATH is currently (incorrectly) set to /usr/lib/pkg-config in
the sysroot, which doesn't exist. On host distros where the font
encoding maps are stored under a different path than OE, this will break
font builds, because ucs2any will attempt to read the sysroot's encoding
maps with the host paths.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index 8b42991..cc4258a 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
 PR = "${INC_PR}.0"
 
 do_configure_prepend() {
-        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" ${S}/fontutil.m4.in
+        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkgconfig\" pkg-config#g" ${S}/fontutil.m4.in
 }
 
 BBCLASSEXTEND = "native"
-- 
2.1.3


