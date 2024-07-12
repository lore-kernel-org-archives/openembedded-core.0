Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0923AC3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 05:26:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1178.1720761958956493010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 22:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7923e07da7=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C4jBkv011505
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 22:25:58 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 407170nf5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 22:25:58 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 22:25:57 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 22:25:57 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/2] webkitgtk: fix do_configure error on beaglebone-yocto
Date: Fri, 12 Jul 2024 13:25:55 +0800
Message-ID: <20240712052556.3982466-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3mWbW1aI588ueMAdtSwFIse_L1v9BKzH
X-Proofpoint-ORIG-GUID: 3mWbW1aI588ueMAdtSwFIse_L1v9BKzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407120034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 05:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201799

From: Changqing Li <changqing.li@windriver.com>

* According to latest comment [1] and the mentioned pull request
[2], build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
supported, so original issue already fixed in current version, the
EXTRA_OECMAKE setting is not needed anymore.

* This EXTRA_OECMAKE setting causes following configure error on
beaglebone-yocto, remove the setting to let the configure process decide
the configuration:
CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
  ENABLE_JIT conflicts with ENABLE_C_LOOP.  You must disable one or the
  other.

[YOCTO #15254]

[1] https://github.com/WebKit/WebKit/pull/17447
[2] https://github.com/WebKit/WebKit/pull/17688

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 29e12bb8c5..14f7531549 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -114,18 +114,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
 
-# And for armv7* don't enable it for softfp, because after:
-# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
-# https://bugs.webkit.org/show_bug.cgi?id=242172
-# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
-# explicitly disabled causing:
-# http://errors.yoctoproject.org/Errors/Details/734587/
-# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
-# https://github.com/WebKit/WebKit/pull/17447
-EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
-- 
2.25.1


