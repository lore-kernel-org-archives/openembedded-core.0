Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id D73647404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:36:26 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8NEaQeC032108 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:36:26 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092309362644-246406 ;
	Wed, 23 Sep 2015 09:36:26 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 09:36:03 -0500
Message-Id: <1443018963-11715-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.5.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/23/2015 09:36:26 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/23/2015 09:36:26 AM,
	Serialize complete at 09/23/2015 09:36:26 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-23_06:, , signatures=0
Subject: [PATCH] gcc-5.2: disable isl
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
X-List-Received-Date: Wed, 23 Sep 2015 14:36:28 -0000

We presently don't package isl. Unfortunately, if the host is already
using gcc-5.2 (as is presently the case on Arch Linux), configure will
autodetect the host's libisl, and do_compile will break because the
system isl headers aren't pulled in. In lieu of packaging isl, disable
it for now.

[YOCTO #8376]

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-devtools/gcc/gcc-5.2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
index f691f58..f6673e6 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -98,6 +98,7 @@ EXTRA_OECONF_BASE = "\
     --with-cloog=no \
     --enable-checking=release \
     --enable-cheaders=c_global \
+    --without-isl \
 "
 
 EXTRA_OECONF_INITIAL = "\
@@ -109,6 +110,7 @@ EXTRA_OECONF_INITIAL = "\
     --disable-lto \
     --disable-plugin \
     --enable-decimal-float=no \
+    --without-isl \
 "
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
-- 
2.5.2


