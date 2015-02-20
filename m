Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9C57367B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 19:02:54 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1KJ2tBe021688 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 13:02:55 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015022013025540-243343 ;
	Fri, 20 Feb 2015 13:02:55 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 13:02:34 -0600
Message-Id: <1424458955-30321-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424458955-30321-1-git-send-email-ben.shelton@ni.com>
References: <1424458955-30321-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/20/2015 01:02:55 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/20/2015 01:02:55 PM,
	Serialize complete at 02/20/2015 01:02:55 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-20_09:, , signatures=0
Subject: [PATCH v4 2/3] font-util: remove MAPFILES_PATH override
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

From: Richard Tollerton <rich.tollerton@ni.com>

MAPFILES_PATH is a configuration variable that is used by packages using
font-util, which tells those packages how to compute it in fontutil.m4.
Presently, we're manually twiddling things so that MAPFILES_PATH will
consult the native sysroot, when building under *any* architecture.
This complicates building other packages immensely, and also generates
broken on-target packages, because the contents of font-util-dev will
reference the native sysroot on the build machine (!).

We don't even need to twiddle MAPFILES_PATH anymore so just delete it.

This code also had a path bug (referencing /usr/lib/pkg-config instead
of /usr/lib/pkgconfig) which is also fixed by deletion.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index a067a75..03f70bf 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -16,10 +16,6 @@ RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
 
 PR = "${INC_PR}.0"
 
-do_configure_prepend() {
-        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkgconfig\" pkg-config#g" ${S}/fontutil.m4.in
-}
-
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "ddfc8a89d597651408369d940d03d06b"
-- 
2.3.0


