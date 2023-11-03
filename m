Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7F6C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:13:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.37027.1698995575007079311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138606479"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138606479"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:12:52 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E9E9D3EA9
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:12:50 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AC9DC8BFE
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:12:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A54988180;
	Fri,  3 Nov 2023 16:12:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libjpeg-turbo: upgrade 3.0.0 -> 3.0.1
Date: Fri,  3 Nov 2023 15:12:14 +0800
Message-Id: <1698995534-30247-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-7.053900-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrRpgtqnD1BD7Le/vEwLULpASn
	kJcXeVrXSUQWNWP9oCxX4LEX90HHXDuZPz8QQL7+nmYvjdGoUIx955Y1Xr69wy2O+P2kc1wHC1W
	a7T7qg1E64KuxjWhSqBp5MN7wBuL9xEEtnnH5KRc/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365brwwTP2r1yKGzCWA9GkRdEWZadYkfG0U4LnHu4BcYSmtsWTnXVTJRGeBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrbeZQpfnjyy1qKE49THOM/9d07FcVh6Gk3b7rbhFQUb7EWPQ
	uBPG1YgLbh5zlsY3VaCfhDK3Jt8mmk6ouaLgqlbh1Y6Mmri9Kn7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190113

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
1. The x86-64 SIMD functions now use a standard stack frame, prologue, and
epilogue so that debuggers and profilers can reliably capture backtraces from
within the functions.

2. Fixed two minor issues in the interblock smoothing algorithm that caused
mathematical (but not necessarily perceptible) edge block errors when
decompressing progressive JPEG images exactly two MCU blocks in width or that
use vertical chrominance subsampling.

3. Fixed a regression introduced by 3.0 beta2[6] that, in rare cases, caused
the C Huffman encoder (which is not used by default on x86 and Arm CPUs) to
generate incorrect results if the Neon SIMD extensions were explicitly disabled
at build time (by setting the 'WITH_SIMD' CMake variable to '0') in an AArch64
build of libjpeg-turbo.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 146d80008c..99ed82dac4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -10,7 +10,7 @@ DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c77c65fcce3d33417b2e90432e7a0eb05f59a7fff884022a9d931775d583bfaa"
+SRC_URI[sha256sum] = "22429507714ae147b3acacd299e82099fce5d9f456882fc28e252e4579ba2a75"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.34.1


