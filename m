Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733B5C282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 07:25:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.47984.1740986706990737330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 23:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51571b8f6e=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5236aOXr010246;
	Sun, 2 Mar 2025 23:25:06 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453xd7smh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 02 Mar 2025 23:25:06 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 2 Mar 2025 23:25:05 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 2 Mar 2025 23:25:04 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joerg.sommer@navimatix.de>
Subject: [PATCH] python3: update python3-ctypes RDEPENDS to RRECOMMENDS
Date: Mon, 3 Mar 2025 15:25:04 +0800
Message-ID: <20250303072504.1006878-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KICgDEFo c=1 sm=1 tr=0 ts=67c55952 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8 a=Jl_lwIndQlXpoWiYjV4A:9 a=lFNf9BRdavUA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lGVxnSFRqVqFKOPFpS-VFuU-64AIKWkI
X-Proofpoint-GUID: lGVxnSFRqVqFKOPFpS-VFuU-64AIKWkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_02,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 07:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212200

From: Changqing Li <changqing.li@windriver.com>

ctypes.util.find_library depend on run external programs(ldconfig, gcc,
objdump or ld) to get the pathname, if none of above are installed, None
is returned.  Previously, RDEPENDS to ldconfig is added to ensure it
always work when installed.

This commit change it to RRECOMMENDS, this allows user who don't use
function find_library could remove ldconfig from image by
PACKAGE_EXCLUDE

Refer:
https://docs.python.org/3/library/ctypes.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 2010f6b7d1..7c36fd92ed 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -477,7 +477,7 @@ FILES:${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
-RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
+RRECOMMENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
 RDEPENDS:${PN}-ptest = "\
     ${PN}-dev \
     ${PN}-modules \
-- 
2.34.1


