Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D47AC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 05:52:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10339.1714024360596192299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 22:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TZuUwxhn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714024361; x=1745560361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AzuuDFHwFSnvITJg2Cdt1SMaq03hRW7DA7DgRKA6ZLA=;
  b=TZuUwxhncmAOEs0qEX9zw/iLDkvhnoMwLx0wiwFq10bbvZmgep3Ak9i9
   h2HJ+ndzUgw0b5nzYwx5aT9/AsTFheCaMe3ewjCJy7nuL0hLLAz0AScfS
   tu08gj6syz66Az5Tz+glebS1zyBVg6qaE1QlA9PUhs2z5OQjYZ+H9iV/y
   WHp+bE6R+hZdKOqVVJfEt7HvUbqbpnEQk/X+wqBzHKtB7hxM0Wg9RrVPW
   lEmGxfOpwtZhyBx1p+29B/p8cr82GiRqdtMdjmv6CqvDDWaNUSQ0s/Gqn
   LHGZoyWpS3wFlKL2yPaNmEe1ok4hEJjqeOiLtRAva9jDl4Yj3yvPDoAme
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="136072613"
X-IronPort-AV: E=Sophos;i="6.07,228,1708354800"; 
   d="scan'208";a="136072613"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:52:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7315D9DC4
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 14:52:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA876E499A
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 14:52:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F17F202CFE84
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 14:52:34 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01C4E1A0002;
	Thu, 25 Apr 2024 13:52:33 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core][PATCH v3] libbsd: Fix conflict error when enable multilib.
Date: Thu, 25 Apr 2024 13:52:31 +0800
Message-Id: <20240425055231.668897-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28342.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28342.005
X-TMASE-Result: 10--9.116400-10.000000
X-TMASE-MatchedRID: iExNx1Upv4UIGXYTUlAoH6qHmm/V4M/Pfb+ZO7kHlEjpklbZ73CAbS0n
	XeuwLq8h5zNBTgYU5cFRS7xjEb+dxCNvqM5/miSs8t4fUUGeErTBOVz0Jwcxl6vCrG0TnfVUaUX
	s6FguVy0KZgIdNrUtgHk48PxckV+kHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDw5awVgH63AzLS/w
	plpuSi9vmwaiz7Bws1yAmPlsQQRK/K65bTVG1mFQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 05:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198694

From: Lei Maohui <leimaohui@fujitsu.com>

- Fix the conflict error by oe_multilib_header. The conflict error is as the following:
Error: Transaction test error:
  file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs of libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_32

The difference of bsd/sys/cdefs.h between libbsd-dev and lib32-libbsd-dev is as following:

 /* Define the ABI for the current system. */  
 -#define LIBBSD_SYS_TIME_BITS 64  
 +#define LIBBSD_SYS_TIME_BITS 32  
 #define LIBBSD_SYS_HAS_TIME64 1

- After oe_multilib_header on cdefs.h, the path of cdefs-64.h and cdefs-32.h in cdefs.h need to be corrected. Please reference to https://man.archlinux.org/man/libbsd.7 for details.
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
 meta/recipes-support/libbsd/libbsd_0.12.2.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
index 7d5e88f293..e1fc7d9b3c 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -40,8 +40,14 @@ SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig multilib_header
 
 DEPENDS += "libmd"
 
+do_install:append () {
+       oe_multilib_header bsd/sys/cdefs.h
+       sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g' ${D}${includedir}/bsd/sys/cdefs.h
+}
+
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


