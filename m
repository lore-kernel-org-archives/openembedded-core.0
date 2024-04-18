Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8252C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 01:22:59 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2556.1713403377416211556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 18:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FeWcrveO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713403378; x=1744939378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a2ATc2FaBI4AK18abS0l71l3UkDMu7UTT+sx+MdJIo4=;
  b=FeWcrveOt5jcgiCPHQ164LU8CGuwoJKdqWhcHaaUVBfjKgcvBsXJGP/3
   kxoXEe80d7SQiSmbtVfQSSwNzvDQSihVmQ7bg2+R73wwUAvy79xg4U78e
   4aigTvZo8unVRdmWSvWUUOEj40ByE9b8v9Fgo+uunQa8ZyWvIap1wXmVr
   58xNIOOeEEGSDKE8EF2iswlcxDgWufG/2n0nmxIiS9dEj4G/Me/3n0prR
   F/J2wc4MyFEQo4J1hcEJGHp+0Bm+QAuFrww8ac4M+AZ28Q8FShRZduYdo
   k+LwafrTJy2lQvNseEAPnMW+tRY447gYlX/806uZ4HJJl51S/n19/T0+d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="135290882"
X-IronPort-AV: E=Sophos;i="6.07,210,1708354800"; 
   d="scan'208";a="135290882"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 10:22:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97832D4807
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:22:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4B48105F8D
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:22:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 312EA2030EE45
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:22:51 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A5EA81A000B;
	Thu, 18 Apr 2024 09:22:50 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core][PATCH v2] libbsd: Fix conflict error when enable multilib.
Date: Thu, 18 Apr 2024 09:22:47 +0800
Message-Id: <20240418012247.490545-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28328.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28328.004
X-TMASE-Result: 10--7.866400-10.000000
X-TMASE-MatchedRID: b3nQ9wmEox3FDHbj0bewebstbCLHbulS96ryTp77YeG4GyTmeN+AbJU8
	xJRxYi7Kjs+GIL5CCDDGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BUENBIMyKD0RHfiujuTbedEXo
	uQwO8rUmxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdg7AFczfjr/7NqnuIgLjNDLLA5yt7CMhaxGui
	PC2piQyfydli8/RWimGCzZu0keM7k=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 01:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198494

From: Lei Maohui <leimaohui@fujitsu.com>

- The conflict error is as the following:
Error: Transaction test error:
  file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs of libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_32

The difference of bsd/sys/cdefs.h between libbsd-dev and lib32-libbsd-dev is as following:

 /* Define the ABI for the current system. */  -#define LIBBSD_SYS_TIME_BITS 64  +#define LIBBSD_SYS_TIME_BITS 32  #define LIBBSD_SYS_HAS_TIME64 1

- The path of cdefs-64.h and cdefs-32.h in cdefs.h is not correct for libbsd after enable oe_multilib_header on cdefs.h. It is necessary to fix the path.

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


