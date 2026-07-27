Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E53DC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:37:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27006.1785143679778795297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sus/2vXF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=166884ae32=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7TRav176423;
	Mon, 27 Jul 2026 02:14:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=g/G87xWPs
	md1SdAsN5vTXrm4ypS1FRdO+OwG2JCV9Vg=; b=Sus/2vXFqLHig5M8MqtIZiwGt
	wrrwP9yJHePofRkoVVEod2pLlFbY6E4dwQsgUMvzlFsRqGOvl9mvzUa1ANGsmEni
	VmmLoLlW+tabT9eKKVXssMz/HQPDfAse1Nnk5qJbseI13hvzhb8+iDamGw4mwaok
	NPbt9E9C/KUnC09UBv6Eo2r0x5ivczzegs1hgN/0XGJfODl/ZS3aSOPxqD7puURD
	JQemp/OCCLpPvI5ui0WYuuMGuEJ4nEmN7T43tcqINAYMHTSz2f21WQFv2SC9Ucwq
	gpUcbcowDiXkmuV0KGhvim2fJZOAp72Sd2+N/30Ccp6hKij124pEiFqtVWtuQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf1mvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2026 02:14:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Jul 2026 02:14:37 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Jul 2026 02:14:37 -0700
From: Himani Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <joaomarcos.costa@bootlin.com>,
        <Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH] gawk: skip randtest in ptest suite
Date: Mon, 27 Jul 2026 09:14:30 +0000
Message-ID: <20260727091430.81858-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MCBTYWx0ZWRfXyhZfs0EM0FJM
 8LXIUM6AsE/J8hSDma34N0Pfi7vXJNTOvQ6Sl4d+HTIFipt6qG1c3tx9knfW+8qc81Y19ze5vrk
 Oh5DJiszMvXQtdUc+SZRE8zvjvsy2M6Uh+6Oxp6vl4qT+7KQLDh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MCBTYWx0ZWRfX3djBHFtYVEXT
 e3B90lMl3ukj8U+cLX/XLJ7xgqUFuVGk6HBOgjjhFuGLGs0M648befS+uuVdUSUr5kXcG1FlUBW
 zVLqUXZuiForNw2jVkFiavGB5EqlDn0gTF6pQJcZ9Kdd62znTUxmW10Nz9UjrYLV10596OIAaT0
 efg7UgRPiQO4mon4dYGdJ7HRyuJLGw1C9ZeUdvgtyYcC5ixwMyD5pDgJsjoIrcucszYtJUkaiEc
 8FKAYp4JDm5cJzGHVQSVDALXM5hQJfwrsZNeZFsg9E0MYTRK5hBiuyil1u+lMFJA40GxzJlBves
 2BU+DpCW86vjdOlsLS7rrxYIlDfE2YpFw9lg8ynB6dp/p0SvnlD7lJl64AK5DMm4zNK3I3UKp9T
 G9NlYQ8wS50fe2WjM74XO9DuQjnokJS7/gThF3QhPIPOqcQbl+TQNFM10WyiXEmuBRfDvMWXbVg
 iE3RVHzad/OJ1PRIVqg==
X-Proofpoint-GUID: lDdFOSPMUmXXPImOBZZQv5595_P3i4V4
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a67217d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=hUgc1Il7cNA2zVh4uZUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lDdFOSPMUmXXPImOBZZQv5595_P3i4V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270090
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242075

From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>

randtest performs autocorrelation analysis on random number sequences
and fails intermittently on overloaded CI/autobuilder systems where
CPU scheduling and floating point conditions vary between runs.

An upstream fix was previously merged (ccabae3036a7) to improve sigma
threshold handling, but the test failed again on qemux86-64-musl-ptest
on 2026-07-21 with 'Tau= 162, Autocorr= 5.15181 sigma'.

The test is inherently unsuitable for shared overloaded build
infrastructure. Skip it, consistent with how 'time' and 'timeout'
are already handled.

[YOCTO #16254]

Signed-off-by: Himani Barde <HimaniRamesh.Barde@windriver.com>
Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/recipes-extended/gawk/gawk_5.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extended/gawk/gawk_5.4.1.bb
index 56930498e3..5cfd4e61c3 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -80,7 +80,10 @@ do_install_ptest() {
 	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 	rm -f ${D}${PTEST_PATH}/test/time.*
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
-	for t in time timeout; do
+    # randtest is a statistical test that intermittently fails on overloaded systems
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254
+    rm -f ${D}${PTEST_PATH}/test/randtest.*
+	for t in time timeout randtest; do
 		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
 	done
 }
-- 
2.54.0


