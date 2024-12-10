Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2416CE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 06:25:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4207.1733811899762789414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 22:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2074077de8=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA5bIRq006903
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 06:24:58 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3jbm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 06:24:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 9 Dec 2024 22:24:57 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 9 Dec 2024 22:24:56 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] base.bbclass: fix RRECOMMENDS extend issue for multilib
Date: Tue, 10 Dec 2024 14:24:55 +0800
Message-ID: <20241210062455.3666288-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nTBHMHIjpdYTde4ruIiWGfiTCW0ZQZLM
X-Proofpoint-ORIG-GUID: nTBHMHIjpdYTde4ruIiWGfiTCW0ZQZLM
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=6757deba cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=XdT18p_3L5ksVl0oCWYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_02,2024-12-09_05,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=892 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412100047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 06:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208519

From: Changqing Li <changqing.li@windriver.com>

During handle PACKAGECONFIG, DEPENDS/RDEPENDS/RRECOMMENDS is appended by
calling function appendVar according to the PACKAGECONFIG setting:
PACKAGECONFIG[f1] = "\
    --with-f1, \
    --without-f1, \
    build-deps-for-f1, \
    runtime-deps-for-f1, \
    runtime-recommends-for-f1, \
    packageconfig-conflicts-for-f1"

[snip of base.bbclass]
 pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
    if pkgconfigflags:
       ...
       appendVar('DEPENDS', extradeps)
       appendVar('RDEPENDS:${PN}', extrardeps)
       appendVar('RRECOMMENDS:${PN}', extrarrecs)
       ...
[snip of base.bbclass]

After following commit in meta-oe,
[fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendation]

'udev lvm2' changed from RDEPENDS to RRECOMMENDS, but RRECOMMENDS is not
handled in this process, and causes following error:
$bitbake lib32-cryptsetup
ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspicious values 'udev lvm2' in RRECOMMENDS [multilib]

In layer openembedded-core, we do have very few recipes that have
runtime-recommends-for-f1 in PACKAGECONFIG setting, but f1 is not
enabled in PACKAGECONFIGS, so not report error when multilib is enabled.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b81e61fdb7..101ecdcf0f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -471,7 +471,7 @@ python () {
         def appendVar(varname, appends):
             if not appends:
                 return
-            if varname.find("DEPENDS") != -1:
+            if "DEPENDS" in varname or varname.startswith("RRECOMMENDS"):
                 if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d) :
                     appends = expandFilter(appends, "", "nativesdk-")
                 elif bb.data.inherits_class('native', d):
-- 
2.25.1


