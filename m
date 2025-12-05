Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC21ED2E038
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:32:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1333.1764923525341321576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sE5s/kht;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56sGqp3789647
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 08:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=x1BVZnx3pL9rRnzI0H6R
	TAUV43hbeyyDEw9azxrjmwY=; b=sE5s/khtkcd5hrXieW864FnPrZG5F0R81PeZ
	lL+rFKOe/LgEIlqO+l4tezbdhv3okin0mwCdMwnbLfg6h4VyA18dFD9q/gc4tp0I
	o+V1MzQHeBBGhdBhwm5RBYwur3fysFe1kxG2yphInrWGTNEtbXN2F8orN63uDYVJ
	FkVR1eHO3bcpdr//wMofZbFvaFdgHU+o6o1HLEUjzNulVT7mB9S1QzCmI6xzeI4A
	VISFxrxCM//WwHZUsTV+RGFjEAj3evmtdk7L634YDy8ecHx9h3e3ydrCHHDN4MPJ
	hdbwKmJn3Xga8yRY6ntgP6sg2VNpgrZ5n5b/Eb9P0r29sPRYrg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4auqv105y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:32:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 5 Dec 2025 00:32:02 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 5 Dec 2025 00:32:02 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2 1/2] oeqa/runtime/cases/ptest.py: use to_boolean for PTEST_EXPECT_FAILURE
Date: Fri, 5 Dec 2025 08:32:01 +0000
Message-ID: <20251205083202.330982-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MCBTYWx0ZWRfX/YOdMVck0WzV
 ZALD0lADrhMbjHyHLDEsukUN5uFW+oc7tKpPz1ZYKFCIf/T2jBAUCamoKYKa39bWyrn3AVlA3OB
 Z1iW/AFrg4W/YHLuLfsoAQtaBBDburINBR6SfDtKtuJKJk3TF9Qk853cG6vrNPfQAPKwsRc/4xO
 1ws8CA8cMsTu4KyurcFw6MDK7p9n683IcHed3uESEKsIG/Bgkhtcjowcq5sQxZs5Deo+HwFtVnJ
 dlsf+5y/rCW8PYbftn0Qz9TE9kpxgLFAt8xGc5ek2ULi1eglu13JL1afb+OrUJ2bhO59FuQojpL
 siN166kzzgNIFHoWsI0NiXy2itRigwnWNgQEgQP32PFBe1GjjKYc/jl26H55WE9amPNfPuNbXBh
 q+tJk4Qxdv8m0U5LHMYMENHQC1qFzw==
X-Proofpoint-ORIG-GUID: 5vr5feuKOu6gGPYEWHmHj33mz_L1rYa1
X-Proofpoint-GUID: 5vr5feuKOu6gGPYEWHmHj33mz_L1rYa1
X-Authority-Analysis: v=2.4 cv=dqfWylg4 c=1 sm=1 tr=0 ts=69329884 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=-OOBmiN1J9IJsVfkvR8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227341

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


