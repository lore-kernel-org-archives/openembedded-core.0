Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE75AC5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 08:51:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.48857.1724662311673303451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 01:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89689f30da=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q6p2qC016781
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:51:51 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754q9nt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:51:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 01:51:49 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 01:51:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH] webkitgtk: fix do_configure error on beaglebone-yocto
Date: Mon, 26 Aug 2024 16:51:48 +0800
Message-ID: <20240826085148.3492132-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tXtjlCEEc9skIi9-A56DxQCHqVJHT37M
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cc4226 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8 a=iGHA9ds3AAAA:8 a=LxHwoYbL2FXGP2J_mhgA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=FkGh3qDytyf094M0uOEt:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: tXtjlCEEc9skIi9-A56DxQCHqVJHT37M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_05,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408260069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203741

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
 meta/recipes-sato/webkit/webkitgtk_2.44.3.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index a79a9c3824..90fb7a1d42 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
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


