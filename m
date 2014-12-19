Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6B872AC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 20:46:30 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBJKkVPS019024 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 14:46:31 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121914463141-273026 ;
	Fri, 19 Dec 2014 14:46:31 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 14:46:24 -0600
Message-Id: <1419021985-10526-3-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1419021985-10526-1-git-send-email-rich.tollerton@ni.com>
References: <1419021985-10526-1-git-send-email-rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:46:31 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:46:31 PM,
	Serialize complete at 12/19/2014 02:46:31 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-19_05:2014-12-19, 2014-12-19,
	1970-01-01 signatures=0
Subject: [PATCH v2 2/3] font-util: remove MAPFILES_PATH override
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
X-List-Received-Date: Fri, 19 Dec 2014 20:46:34 -0000

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
index cc4258a..a1b4628 100644
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
2.2.1


