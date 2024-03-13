Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10749C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10649.1710313780271938630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pJ2OpvnE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313780; x=1741849780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cfg166om/U6/LHpO9LH5rEWBkHInW2vDPPv8/UNIZ+4=;
  b=pJ2OpvnExOhkn2joXyfJXSCIDbpHFPFLPKfbXoGFVzEGf6opsXFiLhj/
   3YabQZavB2p36AzxEX1XAibGdoRvOh/BlXkHt/+Uos3m/tuhppnCOrr42
   EDS8HSSLXRaMvOrolnFbBDHJeiF/gfiJW06ttAEVBICazgRrDOO8Za5wg
   xD1bqC2JAvYOQ1eq/TsbJDLpXu46h3IrzOeTYJ7ph5DvPkwNebGvER+Zm
   BTz1tFcxYwMg7SaDfrx3e5BcvFSKWVetYDob3a3jCGiybmAsac3R6kYM0
   iHRFMI0sJbHc4foohEXF4kDQWr1glf5nocFnxi6py962mM+11Hd4Kescs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140577470"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140577470"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BC79FE9642
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08A34D7B87
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8714F20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 353F11A006B;
	Wed, 13 Mar 2024 15:09:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/36] stress-ng: upgrade 0.17.05 -> 0.17.06
Date: Wed, 13 Mar 2024 15:08:30 +0800
Message-Id: <1710313714-12541-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-0.557100-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrKQNhMboqZlpX8NsIfG8xHYDh
	pmG4wK2W9+i9Bl0CJespqjiZNhCgAk4GO5MhEQotlRdhw/BBzaeBs03RHrzjM9Z91MiFfg/zlDN
	q3o2K3ehbGM5QOQjnIOdS/NOFev1IAM0/G7XUdeOZerWbtkIw39XLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMt4HMSQIKmdGWgws6g0ewz2TnSpwnlY4yGbKItl61J/yfJvo
	cwUrWp7dgkRR8OiM/8nRE+fI6etkhGNo2ObZxbapBHGJNLUzSHnCxFAfALftTIk7RX5dwSJI2EF
	ReaoQ7rF1bFRoa0FcA7bqIEkmcUsZTHoAkqk0YhJ89iq58DeeUu/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-New fd-fork stressor, force copying of tens of thousands of file descriptors on fork() system calls
-New bitonicsort stressor: sort 32 bit integers using bitonic sort, exercises integer compare, copying/cache/memory.
-Add more signals in the nested signal signest stressor
-New --progress option to show --seq stressor progress and expected end of run time
-Add Arrowlake and Pantherlake CPU support for target clones gcc optimizations
-Add IRQ tasklet entry/exit events, IPI Raise event, swiotlb event to --perf option
-Add --crypt-method option to allow crypt stressor to be selected
-Add --fork-unmap option to fork stressor to force unmapping of shared libs to speed up forks
-Add --fpunch-bytes option to fpunch stressor to specify fpunch file size
-Add --vforkmany-bytes option to specify mmap size
-Add NUMA hit/miss metrics to numa stressor
-Fix aiol stressor race condition on termination of pending I/Os
-Fix race on peterson stressor with modern out-of-order execution ARM CPUs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.17.05.bb => stress-ng_0.17.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.05.bb => stress-ng_0.17.06.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.05.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.06.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.05.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.06.bb
index d4a427f89d..a52b70d22f 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.05.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.06.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "4e68895f4fe68863b360ab4a6a57e2dfcff85d60"
+SRCREV = "e6bda983cb48a201b6af173204372c7b37d6411f"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


