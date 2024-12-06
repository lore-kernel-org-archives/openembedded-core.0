Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675B6E77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 08:45:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32805.1733474753728995551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 00:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2070bee6c1=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B68Iv2S031244
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 08:45:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp773ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 08:45:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Dec 2024 00:45:51 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 6 Dec 2024 00:45:50 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] base.bbclass: fix RRECOMMENDS extend issue for multilib
Date: Fri, 6 Dec 2024 16:45:50 +0800
Message-ID: <20241206084550.2424753-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qvqk3Uyd c=1 sm=1 tr=0 ts=6752b9c0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=hZu-cNGBs1XrIsJxfoYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NCUgVwpUu3iCjEvt_hBSwJwznayAe5uA
X-Proofpoint-GUID: NCUgVwpUu3iCjEvt_hBSwJwznayAe5uA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_04,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=822 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412060063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 08:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208405

From: Changqing Li <changqing.li@windriver.com>

After following commit in meta-oe,
[fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendation]

bitbake lib32-cryptsetup will failed with error:
ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspicious values 'udev lvm2' in RRECOMMENDS [multilib]

This is because RRECOMMENDS is not extended with mlprefix, with
this fix, RRECOMMENDS:lib32-cryptsetup is corrected.

Without this fix:
RRECOMMENDS:lib32-cryptsetup="kernel-module-aes-generic kernel-module-cbc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic kernel-module-xts udev lvm2"
Whith this fix:
RRECOMMENDS:lib32-cryptsetup="kernel-module-aes-generic kernel-module-cbc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic kernel-module-xts lib32-udev lib32-lvm2"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b81e61fdb7..3aaabb67e9 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -471,7 +471,7 @@ python () {
         def appendVar(varname, appends):
             if not appends:
                 return
-            if varname.find("DEPENDS") != -1:
+            if varname.find("DEPENDS") != -1 or varname.find("RRECOMMENDS") != -1:
                 if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d) :
                     appends = expandFilter(appends, "", "nativesdk-")
                 elif bb.data.inherits_class('native', d):
-- 
2.25.1


