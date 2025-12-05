Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A89D2E034
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:10:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1168.1764922210121019361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Yb4dmIte;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56Tmhi2240488
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 00:10:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=x1BVZnx3pL9rRnzI0H6R
	TAUV43hbeyyDEw9azxrjmwY=; b=Yb4dmItedADWAYm/CzBTUSXWGx2rcz7zkLlv
	qKH8gcDC25E2MoE0puYljdrKcJa9UNiI2zC5v6rRiWM1+BQ0mbj1BHPMZLSS6om8
	fo5ErdE5NfDtXWRtok+L2qIX/EWh1aNWBLZ03UYCint6REnRuCK+xMQmvWij9gpP
	zRfn2aLLWdggAHefCokc5YvU/Frbiv6TGV8YLKuCHWNgSYUwRMjAfVuc6Pi5EQLT
	+J7L9ydqQXEqifQ5ixdy/euU/uKzQoKnQ10TbJWvWLRuKEhTbI9NlZOcfGJKxVyj
	q9Wtg2enRPnonIfPNzt+npqZnD0uDKYhCdppZIDyunEl/91dyw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17my640-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 00:10:09 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 5 Dec 2025 00:10:08 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 5 Dec 2025 00:10:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/2] oeqa/runtime/cases/ptest.py: use to_boolean for PTEST_EXPECT_FAILURE
Date: Fri, 5 Dec 2025 08:10:07 +0000
Message-ID: <20251205081008.320482-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kA2qW33aI5C79rSUtoBa3a0bBDcGnoHp
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=69329361 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=-OOBmiN1J9IJsVfkvR8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kA2qW33aI5C79rSUtoBa3a0bBDcGnoHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA1NiBTYWx0ZWRfX7eoRcrlw1DJ+
 ZdEUDOZFoCnADq3dsek0R0mmNm8KLCkT+Y60I6hsZvsiC/pulb82B3VnD12hn2+gI2IEaZTMp0s
 drSKzhnAnBogOeiLgb6FESZXj52/LVuY4GUTPzTSEvFi97Qc617oXYFXvez5ufHmx+OprLL2YsH
 LDh8oSA4rLE2KGzjHSjKH85115DEALcAYPiXqHpFhXCRW1vNDnqsUsLs4Mrze0a9eUv0i+ldH4F
 xlnuyuRf/eIn534BsgRk8ys0mH2UizIM5YI9XMKC8Q90zTl9JNb2LZFwwm65F8dhraxFw+vsYPM
 tc56FFsX7CRPsDjn+95ko7dIdX+tuIfF6eYvSKtfLs/rYVy+puQLmCdf5wbWhP8Dtcf1xriIf5x
 VyPffV1u+WvwPL1ZoEmqUprSI3Q2pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227336

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


