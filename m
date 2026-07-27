Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6EEC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:39:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27218.1785144946363164569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T0TXg9sR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=166884ae32=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7TuMC048939;
	Mon, 27 Jul 2026 09:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tlLx8xokRrAbkM9zcWMFtCL2moJOh4riaAmBLShcL6w=; b=
	T0TXg9sR8SRwj7OlgU4SzQ9FIpRaWMra+ZcAd/Pi4NlPJEs4eT0+FqPA57caVlVK
	o6XK+fQ4s+viuwNvYXFB6SH5RNsEdotcWx727CusIgrAxiZFbHF/Bwec5DQIAPnJ
	EVnuailpqQ8YVrYCbRWtGYd/8Cxsy0gMgMECTfjShbIWKf86AciZIASttlo2ZFAr
	Ran9Faon/XHZeSbZWg8eC2nmybAtrOAMryijM2v5Ja6YOwAar/9yRf8OWjBHkJLh
	VR/E1K655/9Aq7FgGvBi33cMcxyU4LQgJ+c6cN1t55I/fm91sJC/cGPa9TLi4tx/
	/QFbdnTBdMuhesotb2oPEg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmm43sxsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2026 09:35:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Jul 2026 02:35:36 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Jul 2026 02:35:36 -0700
From: Himani Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <joaomarcos.costa@bootlin.com>,
        <Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH v2] gawk: skip randtest in ptest suite
Date: Mon, 27 Jul 2026 09:35:30 +0000
Message-ID: <20260727093530.83107-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727091430.81858-1-HimaniRamesh.Barde@windriver.com>
References: <20260727091430.81858-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=I/JVgtgg c=1 sm=1 tr=0 ts=6a672669 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=hUgc1Il7cNA2zVh4uZUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sQouwrED05c4KFYCB2LjLHF5_rhhV68r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfXxN6p9VdvtXkH
 xf1FJEQv+6MipSv7kk3yz8BNwGIisu+5L83uGv4QSKIWtSGG22/OjZMKzVNiejyuSZiBFt/dd69
 Ftcv9lm15+fzeIjIjP+D6N60PwVakYGO5os5fRn4o/Tw2DYxvHinMLMSRdkBt8Nn62ZXGfkXQUX
 8JBJ8Q5Uk6zyehlUlA3/kdKhaVUc+iDoXsY8Pnv3uq0C+YU86AO7BI8ODoBh0yqbm7+hDpTjV/p
 VklVP4DZhO3Qj6mZMBWeneBLpPSVJsRbModHrBI/g8gH5wLzk1YD+k9vDEnUp5hPB2rTg2FAS7r
 kq67W0ggG1gRM5n2pApvCPFREQ9KdS+FDF+Xqr0CT0x+29Rafr0hHaHrIRZccUUGF4Zx3uoiOVx
 o29UmfAddV9pGeKc/ubdIQuSwd+xdSVXfLAMAlKk5SbQ5nbSjdSGFOjxVDmUhz5+2Pa0xCCt7Ir
 qLkw5dpowpw0mvd1BaQ==
X-Proofpoint-ORIG-GUID: sQouwrED05c4KFYCB2LjLHF5_rhhV68r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfXzlu5dyqtb2ZO
 N9Ii+brdpoqmsvYcrQfjeuBLgoKD4D1EoV5Lu7bDbJyENSxaq1bmiHfOrpueRGR8ZFH9dfylwDD
 14n6zak7URujKVF/obw5Mpc1qiwTQjsLtzJrR93XqfHktu3F6c6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270093
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242076

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
---
 meta/recipes-extended/gawk/gawk_5.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extended/gawk/gawk_5.4.1.bb
index 56930498e3..89b73a1641 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -80,7 +80,10 @@ do_install_ptest() {
 	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 	rm -f ${D}${PTEST_PATH}/test/time.*
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
-	for t in time timeout; do
+	# randtest is a statistical test that intermittently fails on overloaded systems
+	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254
+	rm -f ${D}${PTEST_PATH}/test/randtest.*
+	for t in time timeout randtest; do
 		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
 	done
 }
-- 
2.54.0


