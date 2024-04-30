Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A89C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:27:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10485.1714465634970185184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 01:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kVIX78hQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714465634; x=1746001634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l0wyWIH8bNoiIQqc4wwYxz2v7MA+mwrO5Msos6C92dg=;
  b=kVIX78hQljD1/V5ydzpD8xox7Rn3Or6/bNYZGPXpDhfnnud74cJV/xzP
   Ko+pOqSaJB7Vxj/03/sU1GtBONzgJEYimDOGMrOixfrUg8aNRvLEOGfcG
   y3b09vH06eDbGDKRUBrMc6D9uv+X4eK95JT1i+LcedeFE7z95DMSJ1Btf
   fD8zE3SsYXfJXA2EBquYwycTB6XXOTC/ZBnYsPEQjMk618DLF/xDrjSxI
   ArWskICpAYS3p630W1BIJkYwKSqzPXszaMcubjQ66aL4GzgMT8twqVoEF
   h+QMXrOw6GS9ZCM1JyfUPWwE4voaRG0LBxAdbaqBEE1bsoKMf1oOxjwF4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="136377450"
X-IronPort-AV: E=Sophos;i="6.07,241,1708354800"; 
   d="scan'208";a="136377450"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 17:27:11 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 03580D9DBC
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 17:27:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38535BF3D7
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 17:27:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B33782009326E
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 17:27:08 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 329CA1A0002;
	Tue, 30 Apr 2024 16:27:08 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable multilib.
Date: Tue, 30 Apr 2024 16:27:06 +0800
Message-Id: <20240430082706.51856-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28352.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28352.006
X-TMASE-Result: 10--12.834400-10.000000
X-TMASE-MatchedRID: R0dsVbq5fRkIGXYTUlAoH6qHmm/V4M/Pfb+ZO7kHlEjpklbZ73CAbS0n
	XeuwLq8hkr/FYOe3HfoLAm2pIsyKt10ieHN50/kH/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQfiq
	1gj2xET/3fvqqd34PPpXlkEmVqyPsKpA7TMhSnKcJslazArifUlXgGeVUh3WdmyiLZetSf8lBgw
	5G4NYCZDgGsBPCbyGiIAcCikR3vq8IP61ZoVsJ9EAlQe3Xc/H6ppbVL5ZAzmjqtVcbT5cf1S3La
	i6qoCMP
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 08:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198755

From: Lei Maohui <leimaohui@fujitsu.com>

- Fix the conflict error by oe_multilib_header. The conflict error is as the following:
Error: Transaction test error:
  file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs of libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_32

The difference of bsd/sys/cdefs.h between libbsd-dev and lib32-libbsd-dev is as following:

 /* Define the ABI for the current system. */
 -#define LIBBSD_SYS_TIME_BITS 64
 +#define LIBBSD_SYS_TIME_BITS 32
 #define LIBBSD_SYS_HAS_TIME64 1

- After oe_multilib_header on cdefs.h, the path of cdefs-64.h and cdefs-32.h in cdefs.h need to be corrected for overlay-mode. Please reference to https://man.archlinux.org/man/libbsd.7 for details.
  @@ -12,19 +12,19 @@
 #ifdef _MIPS_SIM

 #if _MIPS_SIM == _ABIO32
-#include <bsd/sys/cdefs-32.h>
+#include <sys/cdefs-32.h>
 #elif _MIPS_SIM == _ABIN32
-#include <bsd/sys/cdefs-n32.h>
+#include <sys/cdefs-n32.h>
 #else
 #error "Unknown _MIPS_SIM"
 #endif

 #else /* _MIPS_SIM is not defined */
-#include <bsd/sys/cdefs-32.h>
+#include <sys/cdefs-32.h>
 #endif

 #elif __WORDSIZE == 64
-#include <bsd/sys/cdefs-64.h>
+#include <sys/cdefs-64.h>
 #else
 #error "Unknown __WORDSIZE detected"
 #endif /* matches #if __WORDSIZE == 32 */

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-support/libbsd/libbsd_0.12.2.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
index 7d5e88f293..1791d97dfd 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -40,8 +40,16 @@ SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig multilib_header
 
 DEPENDS += "libmd"
 
+do_install:append () {
+   oe_multilib_header bsd/sys/cdefs.h
+   # It hasn't been tested when libbsd is used in 'namespaced headers' mode according to
+   # https://man.archlinux.org/man/libbsd.7.
+   sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g' ${D}${includedir}/bsd/sys/cdefs.h
+}
+
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


