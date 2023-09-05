Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CC0C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 07:08:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.15937.1693897677122694872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 00:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="130806777"
X-IronPort-AV: E=Sophos;i="6.02,228,1688396400"; 
   d="scan'208";a="130806777"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 16:07:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62800C3F8B
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Sep 2023 16:07:52 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 988FDD5EA1
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Sep 2023 16:07:51 +0900 (JST)
Received: from ubuntu20.g08.fujitsu.local (unknown [10.167.225.227])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C819F87BDD;
	Tue,  5 Sep 2023 16:07:50 +0900 (JST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core][PATCH] glibc-package: Fix conflict error when enable multilib.
Date: Tue,  5 Sep 2023 15:07:49 +0800
Message-Id: <20230905070749.151676-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27856.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27856.005
X-TMASE-Result: 10--10.315900-10.000000
X-TMASE-MatchedRID: ITgmcA8KJOUxY5Ka0OaG6lhRyidsElYkGiQ8GIEGP38OkJQR4QWbsCAw
	obBsEdDIjHOlHc1VgaLvW1oI3KzQE1pCIuRr0RxKTuctSpiuWyUUi4Ehat05499RlPzeVuQQYzz
	J3aVGYA1O/zduVmTnixWtrS1T10xCL1vtt3X2p0WeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRyIZ2tlKMJMRD7hMQSSQ8WxLd7JWwaSQVaoTALeIiqgr+TJ4ka85Oc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187199

From: Lei Maohui <leimaohui@fujitsu.com>

file /usr/include/bits/math-vector.h from install of lib32-libc6-dev-2.38-r0.armv7ahf_neon conflicts with file from package libc6-dev-2.38-r0.aarch64

Reference to the git log of glibc, upstream modified math-vector.h for
aarch64, so this file has many differences from aarch32.
For detailed modifications, please refer to these two commit log of
glibc:
commit 4a9392ffc27ad280f84779eea3ba01f2c134d1d8
commit 78c01a5cbeb6717ffa2d4d66bb90ac5c39bd81a9

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 7f9e7503a1..1d4e4c5274 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -87,7 +87,7 @@ do_install() {
 		rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 	fi
 
-	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h bits/endianness.h bits/struct_rwlock.h
+	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h bits/endianness.h bits/struct_rwlock.h bits/math-vector.h
 
 	if [ -f ${D}${bindir}/mtrace ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
-- 
2.25.1


