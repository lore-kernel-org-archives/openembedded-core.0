Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A27AE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 07:49:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.147731.1734680983257717373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 23:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QOCJHD1c;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734680984; x=1766216984;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CRQFZXXKCInFKUStj99QikO0MR4AUwKdxLdhXnUJePw=;
  b=QOCJHD1c+zIVcvky5UHu17qCOrfz6j67AV+tp6pknyNsMzfxJjINTPj1
   pvL/kBgKsad8IFkB+DtN0nXMg++LDWrqvcS6aPVlfKorr/HH6xpcnhL6L
   UL1PJ3Hr0ISf6RSO0asiPMrlzDg70JOwiGW/+f5deHaq0+EEOh6RwvCna
   lmizKDOWT2lxE5sszWxYhnFRRdymVZEGs56IP02XofEFRJDK9zh4Vffzo
   LRHqaqwV/BujHVAKESPonosxl4S4Xeev2DVrV1v4kkQkLRieHXg1KPXp8
   yB3AfQz0HoG9oFQAVpnCxNIyMmgaICzVQQpk9ZwnHExZMd4mqNnDUeG6Y
   A==;
X-CSE-ConnectionGUID: d+SzwoC6RnGvJqfVm+Jc7Q==
X-CSE-MsgGUID: KmCL4JaCQy6BybzEPsTf4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="186833421"
X-IronPort-AV: E=Sophos;i="6.12,250,1728918000"; 
   d="scan'208";a="186833421"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 16:49:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D576DD4C2B
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 16:49:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD2CFD5C2E
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 16:49:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37AC420086EA6
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 16:49:38 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A81AF1A006C;
	Fri, 20 Dec 2024 15:49:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] debugedit: Fix install conflict when enable multilib.
Date: Fri, 20 Dec 2024 15:49:27 +0800
Message-Id: <1734680967-11172-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28870.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28870.006
X-TMASE-Result: 10--3.686500-10.000000
X-TMASE-MatchedRID: 9CLtS+2vXX+MPz8Goa6fXdl0i+WyI+91F4r8H5YrEqwZ9O8/hC7KBjBX
	Xb/qS263jYTdiiDZ8mEjRHi5XR8LVFpCIuRr0RxKTuctSpiuWyVUENBIMyKD0Zsoi2XrUn/JmTD
	wp0zM3zoqtq5d3cxkNc4FzPgxXCdilPIRCZp8lbtaIUsO3zyEZCJmTY1LcynKFXLGM67C5zhQLk
	SSBMMPz9mO8epxD5/I6T10zrkRO2zw6NvYWmWbDXRZ9X5qCZfHU/JCITmuhS7oZbNFHtbIdPl43
	iPWIJMPxwTT797Vag8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 07:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208967

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/find-debuginfo conflicts between attempted installs of debugedit-5.1-r0.core2_64 and lib32-debugedit-5.1-r0.core2_32

The differences of find-debuginfo are as follows:

@@ -360,7 +360,7 @@ add_minidebug()
   # symbol and NOBITS sections so cannot use --keep-only because that is
   # too aggressive. Field $2 is the section name, $3 is the section type
   # and $8 are the section flags.
-  local remove_sections=`x86_64-poky-linux-readelf -W -S "$debuginfo" \
+  local remove_sections=`i686-pokymllib32-linux-readelf -W -S "$debuginfo" \
        | awk '{ if (index($2,".debug_") != 1 \
                     && ($3 == "PROGBITS" || $3 == "NOTE" || $3 == "NOBITS") \
                     && index($8,"A") == 0) \

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/debugedit/debugedit_5.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 5dc103f643..00c40473c4 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -21,8 +21,11 @@ SRC_URI[sha256sum] = "ee9b688b2ed8fa62551c54cb5dc31aaa05853e7dedbd9e1237c77894ea
 DEPENDS = "elfutils xxhash"
 DEPENDS:append:libc-musl = " musl-legacy-error"
 
-inherit pkgconfig autotools
+inherit pkgconfig autotools multilib_script
 
 RDEPENDS:${PN} += "bash elfutils-binutils"
 
 BBCLASSEXTEND = "native nativesdk"
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/find-debuginfo"
+
-- 
2.43.0


