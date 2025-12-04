Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC0ED1D86D
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 06:01:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37099.1764828055795850453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 22:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LPn4qGaZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44335b1eee=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B45hDKB3941392
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 22:00:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bhCVIVoxgqBCcnUWgbQ9
	5xGZwKq4b00gI2JGAcjL1ec=; b=LPn4qGaZB//esUPnEhzE7B737Az/TEl3Fzek
	GKW02pjmBvS3nkht83bFVaHBLYfL+YMgP/e2TvjzeBoBhI+mQSKqdXxBiGxDIwh8
	uefv6lnD8jm0AQbtpE5VOeykqpcAnzw7+6KqSTGsu6ux3WoMYgedd8Wmb4uxiy9v
	Bnwq0tNW1L6nTAG651X8I0tNGmyUblFX/Pm/KyPLXqdZgUZ2mVbHsnKOpvkigfFr
	8sfsSjQhZrjlCoHcjx71sx0rm3V0SQC+fpms1ks06tdkXPybOxC/erMKYTFyLtGS
	tXxXPcl+PL7n09A1f+NKqLpQcs6XXJTqt+gaVoQUUTMcQxfoAw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mwsn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 22:00:55 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 22:00:54 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 22:00:54 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] icu: exclude debug files from ptest execution
Date: Thu, 4 Dec 2025 14:00:53 +0800
Message-ID: <20251204060053.3858475-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Lu3KdY-gUl7v5RpxlaYoaVOQS_zZw1Po
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=69312397 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=Gf-UNYict4WktVKwc3IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Lu3KdY-gUl7v5RpxlaYoaVOQS_zZw1Po
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA0NyBTYWx0ZWRfX4Jx/8YqPCOQ7
 LHc/DVlsn9SkwoHyGpDmQcZ007tMWGsK5JfX6JqZW5uBo7bo1vWqUYnbe2I/V6synXpdUuf+0LI
 uP6LyXMWJSvPMpkYUoD8aDSrvMxeBBU5eDUM0/BlAaWAfTHZOxhrahL63HliqToFdJDkTQ9QOAd
 tJyGm/YkONIy0ytrCT4af8YEohgGTVsPkDPdDmPtGX3YSEOHWWbJEFPQLh6MnLqe67ubUe82HvB
 S8s6eUpyr7P561UB0AR7JpjmfyLa+cL9VoLt/MPyrb3Z4703E4uFTsrBTzOqaFvnR2cfbR54wJu
 JVIxhSO3LpeoHtCJ6m3nBDtcwEQBobF/Ds/wKOlW7CvhRuXupTGBhJ5/mfnqgTa4lyqnuGTSXxf
 p/QzBPb2WIhmNQL+YSCiETYc7U0dmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227268

From: Jiaying Song <jiaying.song.cn@windriver.com>

When EXTRA_IMAGE_FEATURES contains dbg-pkgs, a .debug directory is
created containing debug symbol files that cannot be executed, causing
ptest failures such as:

/usr/lib64/icu/ptest/run-ptest: line 7: ././.debug/cintltst: cannot execute binary file: Exec format error
FAIL: ./.debug/cintltst

Modify run-ptest script to skip .debug directory files during test
execution.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-support/icu/icu/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu/run-ptest b/meta/recipes-support/icu/icu/run-ptest
index e5bf27a822..ccf1d99a36 100755
--- a/meta/recipes-support/icu/icu/run-ptest
+++ b/meta/recipes-support/icu/icu/run-ptest
@@ -2,7 +2,7 @@
 
 TOPDIR=$(dirname "$(realpath $0)")
 cd ${TOPDIR}/test/tests
-TESTS=$(find . -executable -type f)
+TESTS=$(find . -executable -type f ! -path "*/.debug/*")
 for t in ${TESTS}; do
 	./$t
 	if [ "$?" = "0" ]; then
-- 
2.34.1


