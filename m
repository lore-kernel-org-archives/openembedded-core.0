Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2371D65C5F
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 08:58:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33017.1731574711831375978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 00:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1048a99a80=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE8e1V9028941
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 00:58:31 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpmkjfm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 00:58:31 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 00:58:31 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 00:58:30 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] webkitgtk: fix perl-native dependency
Date: Thu, 14 Nov 2024 16:58:24 +0800
Message-ID: <20241114085824.3504475-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114085824.3504475-1-kai.kang@windriver.com>
References: <20241114085824.3504475-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: X6eZC2tMleCVjG-uT8AuSSjlkPimufx6
X-Authority-Analysis: v=2.4 cv=ZdlPNdVA c=1 sm=1 tr=0 ts=6735bbb7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=ouM3oSCzCiUaaopHYuQA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: X6eZC2tMleCVjG-uT8AuSSjlkPimufx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_03,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=853 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 08:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207146

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, perl-native is missing from DEPENDS for webkitgtk even though
perlnative bbclass is inherited. This happens because the DEPENDS variable is
reassigned right after perlnative class is inherited:

inherit perlnative (DEPENDS += "perl-native")
...
DEPENDS = " \
            ..."

Adjust the DEPENDS line to use += in order to fix this.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: a207c8f42f809340e0794cd326cb5c45e32d7d56)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 16acb205b1..a62d99b227 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -36,7 +36,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = " \
+DEPENDS += " \
           ruby-native \
           gperf-native \
           cairo \
-- 
2.34.1


