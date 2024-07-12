Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE0AC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 04:46:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.738.1720759574917410922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 21:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7923e07da7=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C4iHCV018178
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 04:46:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x5mgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 04:46:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 21:46:12 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 21:46:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][master][PATCH] multilib.conf: remove appending to PKG_CONFIG_PATH
Date: Fri, 12 Jul 2024 12:46:11 +0800
Message-ID: <20240712044611.2778403-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dGMKOV0gMjnK8zcpwxEFcAR8f5T10v_4
X-Proofpoint-GUID: dGMKOV0gMjnK8zcpwxEFcAR8f5T10v_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_02,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=739
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407120032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 04:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201798

From: Changqing Li <changqing.li@windriver.com>

* Since commit [a23c482cab allarch: only enable allarch when multilib is
not used], allarch recipes will also be installed into
${MLPREFIX}recipe-sysroot, so this appending is not needed.

* This appending also causes some QA errors. Eg: for lib32-php, the
recipe will use 's@${RECIPE_SYSROOT}@@g' to remove host specific path,
this appending makes not all the host specific path are matched.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/multilib.conf | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index ef3605a73d..09546315b8 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -22,15 +22,6 @@ MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 
 OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 
-# When multilib is enabled, allarch recipes will be installed into the MACHINE
-# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-config to
-# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
-# inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
-# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
-PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
-PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
-PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
-
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
 NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.25.1


