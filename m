Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABC0D232CB
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 01:36:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1190.1767922570442351807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 17:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cnWgK+11;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54696e60dc=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60915sMB1644659
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jan 2026 17:36:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=275WNpTX9h84AexRtrA5
	zan429gTgVfvHIhgGQ4Brqw=; b=cnWgK+11vaT8U+8yOfEXJghlqa/HEO2F+KnI
	t313tVuyqzqNTkeCdv2yAo8XOgi+FUE0S/8L/y2aVUfGPc3s6tHc68giHdnDfwMd
	+7lVRKwlP/x8ehvGTXdcgLVv94X9wIDX/V6zj4H9wdNjHAyf4g76pvx9Hs49udoV
	v35IxkCl6JtkLaDva0YY1Mb46mtP992QxpPoupEz0hX77UIKwU6VItZIqt4WBgPL
	K1Ojlr5gyqnU8azTrtXhZYfVPiEYsFFhkNpvhJu/NcAfwxLUWgz4zgZB1Xhvt7ne
	6cZCohDlcURT79DtuX0EX6PVmhFf9eFZZl0NjN7s/RyAizpU/w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bey9264c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 17:36:09 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 8 Jan 2026 17:36:09 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 8 Jan 2026 17:36:09 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V4] oeqa/runtime/cases/ptest.py: use to_boolean for PTEST_EXPECT_FAILURE
Date: Fri, 9 Jan 2026 01:36:09 +0000
Message-ID: <20260109013609.2950474-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VHCWR56yuNZAc6iNWTbvAKdiqQR2Oiv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMSBTYWx0ZWRfX3V/A4fHDFV9k
 1j4doyurI04kNUSBjyUsFOqeM53nRq4h9he3Y4nLuVoBBv8Jg7L1Bk9131May7mcmPIsaOk/jOc
 LcvB2XYipscz6hzES3478tM4FzqX+8fLEuWp+oX8R3bNWdO0wSqUiJWnFeS1i8rL7EXBdJLGpKs
 41bu7J7jlci2vd/bjevYRsfSyHx40lsTqjcaQKM3rQkh+RxNX0RerkpSkuELf4cbviSAv7HjPXg
 53Wo/kCmpUnMyMw6yNYR8DNCDKiawGDtas4hfG02pncoxPUh3+HhxTR0tk/CYFKXgmRZiwLUqdK
 +BqsFrxihNSv/vz5MveKav9AGpHsFhS9BlbNUMqIvJbpgiuinkeIW5ra9GWvKJB1PemRpd+AOZq
 UMM9CsRdNAGTyBt9XKzc+XAQfVlAusLAKdRVpsnHmPIiY5tAux+5VMdmsshH6egyqN4Mt0xcYoD
 sATc2uHjR/yMF5DpZhQ==
X-Authority-Analysis: v=2.4 cv=HtZ72kTS c=1 sm=1 tr=0 ts=69605b89 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=-OOBmiN1J9IJsVfkvR8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VHCWR56yuNZAc6iNWTbvAKdiqQR2Oiv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 01:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229090

From: Chen Qi <Qi.Chen@windriver.com>

When PTEST_EXPECT_FAILURE is set to "0", "False" or unset, the expected
behavior is that ptest should succeed. So we need to use to_boolean.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index fbaeb84d00..75165101af 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -22,7 +22,7 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OEHasPackage(['ptest-runner'])
     @unittest.expectedFailure
     def test_ptestrunner_expectfail(self):
-        if not self.td.get('PTEST_EXPECT_FAILURE'):
+        if not bb.utils.to_boolean(self.td.get('PTEST_EXPECT_FAILURE'), default=False):
             self.skipTest('Cannot run ptests with @expectedFailure as ptests are required to pass')
         self.do_ptestrunner()
 
@@ -30,7 +30,7 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['ptest-runner'])
     def test_ptestrunner_expectsuccess(self):
-        if self.td.get('PTEST_EXPECT_FAILURE'):
+        if bb.utils.to_boolean(self.td.get('PTEST_EXPECT_FAILURE'), default=False):
             self.skipTest('Cannot run ptests without @expectedFailure as ptests are expected to fail')
         self.do_ptestrunner()
 
-- 
2.43.0


