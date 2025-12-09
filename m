Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C0D3B7E2
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 02:00:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10130.1765245642065095801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 18:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iu/NVtFC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438bd960f=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8Ndp4G1299526
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 02:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=x1BVZnx3pL9rRnzI0H6R
	TAUV43hbeyyDEw9azxrjmwY=; b=iu/NVtFCJyONP9SaWC0ZdhBFrBn5dh+g8R3D
	kjfT34j+docqRgL1UNWHgQHnkSfHZW5wlY/69C0TG939fQXAdCn7xyPMVTvvk8wz
	dQwLAUuZB2zGjkfoR2rmpdt+c806kFBmJ6g2nvnmaVkxOzYcxSUfBN/ENFmtn2W8
	6nNNfZOQV0Xqqn183kgiHcB/T+NtxUq5+s18MKFSRvL9FFAIj+9tMJvscpRLa24A
	ruronjA9ir6xwSCw8oQ/egbahivvK2x0OU2rOnPunchA0EUEl2xJnw2n0cCHgo6C
	e553tpdsJnvCCL7UfVv7DgZ96iQjHxijwJ0MNIs9JAB4+T8/DQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742ddb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:00:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Dec 2025 18:00:39 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Dec 2025 18:00:39 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V3 1/2] oeqa/runtime/cases/ptest.py: use to_boolean for PTEST_EXPECT_FAILURE
Date: Tue, 9 Dec 2025 02:00:38 +0000
Message-ID: <20251209020039.2341108-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZogRIXDOf8dUd8bbRznoYNq1Uyr-K01d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxMiBTYWx0ZWRfX8DnZS1QRvFQc
 /GDmcq7hocOowrInQB/VWUy36wXjOrlEqKzPKYURcNAwRG9KINHkN6c8jj/wO2jwc6wAM4CPDeq
 fNkENJ/5sd3TSwIBkNBiGl6F7FqxyNJg785njfaRzIFe25oZ4RNB4wqYrxH0kZq1Ci/mVVGE+/l
 CUbJ0cYPtPFi/qvc5IlWW/PL5PzN/f4Gym260W2ptA42DuKtxoXXx40K1y8xJTsQy8Iv0OnsXFz
 9TriRiv3GpQJaKFNA3CZkc5LQFztBxGp3gWmJ9fhr2tZm5nyLCCZzpBdxd0CF6oHAivDr3NVo0g
 g+8N5wpMzIFr/cwcKOsn93fGO4lsE50OQJbW/CAGCuJ5MlP1UQ7CTxFbt//NuXeF5lpOnzFAY0z
 NGO7eBLklOHGkTaXi7B3xEVqUl2F1A==
X-Proofpoint-ORIG-GUID: ZogRIXDOf8dUd8bbRznoYNq1Uyr-K01d
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=693782c8 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=-OOBmiN1J9IJsVfkvR8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227411

From: Chen Qi <Qi.Chen@windriver.com>

When PTEST_EXPECT_FAILURE is set to "0", the expected behavior is
that ptest should succeed. So we need to use to_boolean.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index fbaeb84d00..4bbed290b4 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -22,7 +22,7 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OEHasPackage(['ptest-runner'])
     @unittest.expectedFailure
     def test_ptestrunner_expectfail(self):
-        if not self.td.get('PTEST_EXPECT_FAILURE'):
+        if not bb.utils.to_boolean(self.td.get('PTEST_EXPECT_FAILURE')):
             self.skipTest('Cannot run ptests with @expectedFailure as ptests are required to pass')
         self.do_ptestrunner()
 
@@ -30,8 +30,8 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['ptest-runner'])
     def test_ptestrunner_expectsuccess(self):
-        if self.td.get('PTEST_EXPECT_FAILURE'):
-            self.skipTest('Cannot run ptests without @expectedFailure as ptests are expected to fail')
+        if bb.utils.to_boolean(self.td.get('PTEST_EXPECT_FAILURE')):
+             self.skipTest('Cannot run ptests without @expectedFailure as ptests are expected to fail')
         self.do_ptestrunner()
 
     def do_ptestrunner(self):
-- 
2.43.0


