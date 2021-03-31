Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.510.1617235209956217477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 17:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 585CF40C3A;
	Thu,  1 Apr 2021 00:00:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jG8RJGAmBDyj; Thu,  1 Apr 2021 00:00:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37E8640A46;
	Thu,  1 Apr 2021 00:00:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B660B174557;
	Wed, 31 Mar 2021 20:00:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Nishanth Menon <nm@ti.com>
Subject: [PATCH] make-mod-scripts: pass CROSS_COMPILE to configure and build
Date: Wed, 31 Mar 2021 19:59:51 -0400
Message-Id: <1617235191-37594-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

Fixes:
|   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
|   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
|   LDS     arch/arm64/kernel/vdso/vdso.lds
|   CC      arch/arm64/kernel/vdso/vgettimeofday.o
|   AS      arch/arm64/kernel/vdso/note.o
|   AS      arch/arm64/kernel/vdso/sigreturn.o
|   LD      arch/arm64/kernel/vdso/vdso.so.dbg
|   VDSOSYM include/generated/vdso-offsets.h
|   OBJCOPY arch/arm64/kernel/vdso/vdso.so
| objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
| /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed

Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Nishanth Menon <nm@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 92ffa47..b2b50b9 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
-- 
2.7.4

