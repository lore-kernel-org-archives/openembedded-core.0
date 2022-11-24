Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9ACC43219
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 10:17:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20359.1669285038275951685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 02:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8327f913f3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOA1aZW031193
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 02:17:18 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqbw97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 02:17:17 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Nov 2022 02:17:17 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 24 Nov 2022 02:17:16 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] cronie: add selinux PACKAGECONFIG
Date: Thu, 24 Nov 2022 18:17:12 +0800
Message-ID: <20221124101713.1789943-4-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124101713.1789943-1-mingli.yu@eng.windriver.com>
References: <20221124101713.1789943-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8IKljbVnNXY2XoGKN860Smx6wWTbGNoO
X-Proofpoint-GUID: 8IKljbVnNXY2XoGKN860Smx6wWTbGNoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_07,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=786 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 10:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173738

From: Mingli Yu <mingli.yu@windriver.com>

Add selinux PACKAGECONFIG logic in selinux layer[1] to conform
to yocto compliance.

[1] https://git.yoctoproject.org/meta-selinux/commit/?id=31325005e4409e08b7f68eed44a9c4086453e4dd

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/cronie/cronie_1.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cronie/cronie_1.6.1.bb b/meta/recipes-extended/cronie/cronie_1.6.1.bb
index 078187534e..1b31bf0db2 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.6.1.bb
@@ -35,6 +35,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
 PACKAGECONFIG[anacron] = "--enable-anacron,--disable-anacron,anacron"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
-- 
2.25.1


