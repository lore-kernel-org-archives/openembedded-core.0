Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC887365B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 19:02:54 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1KJ2td0021686 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 13:02:55 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015022013025540-243342 ;
	Fri, 20 Feb 2015 13:02:55 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 13:02:33 -0600
Message-Id: <1424458955-30321-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.3.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/20/2015 01:02:55 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/20/2015 01:02:55 PM,
	Serialize complete at 02/20/2015 01:02:55 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-20_09:, , signatures=0
Subject: [PATCH v4 1/3] font-util: stage encoding maps into sysroot
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
X-List-Received-Date: Fri, 20 Feb 2015 19:03:00 -0000

font-util installs encoding maps into /usr/share/fonts/X11. This path
may not exist on the host (many distros install these into
/usr/share/fonts/util) so they must exist in the sysroot in order for
e.g. `pkg-config --variable=mapdir fontutil` to work correctly. However,
currently /usr/share/fonts is explicitly not installed into sysroots, so
the encoding maps were not getting found.

Fix this by explicitly staging ${datadir}/fonts/ into the sysroot.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index cc4258a..a067a75 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -24,3 +24,8 @@ BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "ddfc8a89d597651408369d940d03d06b"
 SRC_URI[sha256sum] = "dfa9e55625a4e0250f32fabab1fd5c8ffcd2d1ff2720d6fcf0f74bc8a5929195"
+
+SYSROOT_PREPROCESS_FUNCS += "fontutil_sysroot_preprocess"
+fontutil_sysroot_preprocess () {
+	sysroot_stage_dir ${D}${datadir}/fonts/ ${SYSROOT_DESTDIR}${datadir}/fonts/
+}
-- 
2.3.0


