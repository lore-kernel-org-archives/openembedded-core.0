Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6511C3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:17:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.96725.1747207027896200472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 00:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72290b1e6d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E4oG1d014178
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:07 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8rpgp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:06 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 00:17:03 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 00:17:03 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH 1/2] coreutils: Fix file-rdeps for single-binary
Date: Wed, 14 May 2025 00:17:03 -0700
Message-ID: <7d13d6ecafaaf0f06955156bcd9e19b61a92ea80.1747206852.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747206852.git.liezhi.yang@windriver.com>
References: <cover.1747206852.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EQuvDU5zw1_veJBRzmxlbyqgniMrJECy
X-Proofpoint-ORIG-GUID: EQuvDU5zw1_veJBRzmxlbyqgniMrJECy
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=68244373 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=dguDzgtpWR0mOXr3VhgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2MiBTYWx0ZWRfX4D3CAaA1UAJM i/F44PsI6ADBlQqSdBtEOi6jyiOvbjPvUOSIDJIS5D3bbq65tJ7VfX/KXL2vzsTRW7kmqfGWVau JEwq7P9KnFeFKmjA45GYW7i081s0B6avJbnas8SLAc3e5iLddSwk58a565dcdNt/ZVKef5yoJBA
 iV94zCT0l6WlKXD+QmBlse3LT1+if0AMuPOJTaVRnTai4dU7jYCuKf4H73ckfZGWMsoGooqi94q S25nZGQkH5jPBXwrnuv94OL0wat9vS/e538ckJhagMY855jwNpoTctGxe17LLj+err5C7kgKLZP B2sP1JfMefQSVrNODmDTFXWSOxPUaiN9rMJl9kXvFshgkXF3gE1mL0QBuXTyaEqWCKI8dLxz5Vx
 VuLlbdvTpgrC2EeFvnDddoCUI7b6TPI9H+lj7tkvBnKm5rqSOll2VQqutp4rJ5w2Gtizlo2h
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=867 priorityscore=1501
 clxscore=1011 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216480

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
DISTRO_FEATURES:append = " ptest"
PACKAGECONFIG:append:pn-coreutils = " single-binary"

$ bitbake coreutils
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: /usr/lib/coreutils/ptest/src/yes contained in package coreutils-ptest requires /path/to//tmp/work/core2-64-poky-linux/coreutils/9.6/build/src/coreutils, but no providers found in RDEPENDS:coreutils-ptest? [file-rdeps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index 6e1867f3e4..c9fd3719d5 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -211,7 +211,14 @@ do_install_ptest () {
 
     # Tweak test d_type-check to use python3 instead of python
     sed -i "1s@.*@#!/usr/bin/python3@" ${D}${PTEST_PATH}/tests/d_type-check
-    
+
+    # Fix for single-binary
+    for prog in ${D}${PTEST_PATH}/src/*; do
+        if [ -f $prog ]; then
+            sed -i "1s@#!.*/src/coreutils @#!/usr/bin/coreutils @" $prog
+        fi
+    done
+
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.49.0


