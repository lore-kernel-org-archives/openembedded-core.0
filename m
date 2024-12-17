Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD022E7718A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.77568.1734425918925110419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ao7QTVHb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425918; x=1765961918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NMvTiHM+CwnX1n1meZx/9SmdrI+JgDOpcI/mUerd3ng=;
  b=Ao7QTVHbc0t1RAAY7el9xd5LytwZpycPemnGX+C08653j0ygDD9an3Jn
   hlZ3RA7kYM4EoJBnn4N3tgdmqILSMjiSyVGJBDIZ/+h5l/yLWd+yq2dHP
   /nftH1o0CWLbdqxrgCYe79CxAQ477iiyCgt/igOs+u9gs32Twyg6kJdAg
   0CZVNCvGviDequ/Ck1BYFwtwxhGvYc22G9gT0osp6zPmNgdpuuGsZoNUh
   xG11u2os/uXS9gpWXBKHzht37GFzaVX6PAhtBalvmEH51IEqatGNlwpxA
   XWKZG0u5m129RujVSeG7tFkmyGOLzAxNE8wZdnd+DjQiRPUcqc7ZARXks
   w==;
X-CSE-ConnectionGUID: pOw93hr1T76CLK/eS3svWg==
X-CSE-MsgGUID: eDmNXR4ZQKm2r0umCsKqdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184237982"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184237982"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:36 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D3251D4807
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7FAEBDCA8
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4474B2007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:34 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E093D1A000B;
	Tue, 17 Dec 2024 16:58:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 16/21] nfs-utils: upgrade 2.8.1 -> 2.8.2
Date: Tue, 17 Dec 2024 16:58:02 +0800
Message-Id: <1734425887-18069-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--1.583300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv2+VaI0j/eUAPWTWEh5N2a9HJ5SXtoJPLyAyYAiq/SCJto8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJsJnUaX5foXGLZ3imoUmmSqFBi/RBiBxkmP8
	B47S+SWSOt78duiQAWx1jBQs4ZdxsrShcPndV9LubVyB4hxYYmTBARJ9LTbgT+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208820

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../nfs-utils/{nfs-utils_2.8.1.bb => nfs-utils_2.8.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.1.bb => nfs-utils_2.8.2.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 488a1a7e70..543c68f7f5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -33,7 +33,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            "
 
-SRC_URI[sha256sum] = "a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28673ccfd2eff0c505"
+SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.43.0


