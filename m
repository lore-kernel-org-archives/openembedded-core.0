Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083FDFEA814
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:01:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16650.1774422097926111373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NTkPsIoB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7544d13d61=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5RLCl3789110;
	Wed, 25 Mar 2026 07:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PtORkqVjDDYB8NW6fD2u
	jsA7fDhNELAa0UTjBcA+5gU=; b=NTkPsIoBRYLQLsXHcjwp4tS9r8gxHXn3DBoK
	+S0bWgQXSFILFPtY6TgFk3ohQ21KKi7RvNSkITvIODc3f5wmVw4S4NDpaItTVsXr
	6tkpnJjyJ98Yg1ic2k+hOR9W+lMuXvUTuczPvyfEVyaQRv33svuggTFLxyENvI5o
	E6Lv7T4C+DYthDfmN2IguqI1Lm3XGv1I66ts8CN7wu3Bu0Cj6eMjqgEvIIYiRpe9
	YBrKD5lhuSUFu+mzN34IFfpw4t/xavXwwf3DlEvPd80W/WNgWKuNDM0c8Ypa8WfB
	gqJclU/bxjVatYR1wU4VWm71WuDOXirm1wc5NXCApP7FyLzj7Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj84ndw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Mar 2026 07:01:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 25 Mar 2026 00:01:31 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 25 Mar 2026 00:01:31 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <Ross.Burton@arm.com>
Subject: [PATCH] python3: add _zstd C extension to python3-compression
Date: Wed, 25 Mar 2026 15:01:30 +0800
Message-ID: <20260325070130.462403-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rGzb1wcwuWQQKYyMToyLX6Mz0_GSmUbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OCBTYWx0ZWRfX1ENHRbNxWpjI
 thdSmmdg/N1jZTkTG85+CEAN2ZUAz6zN89CWOadbKV0sgQuoj2PB+LFG2A3JACmbBwDozbuKLes
 2ZJf2W2ssi008HFFTwWMpjcyXlIQtJX3702DWafeQ5q2SKczO99Qe9Hwsioak0mddgTx7AXa/PK
 13pPsLDmjU2gPJHYg/GEVtQoZ3yD0NfoEinOo8huPHjwpzepOZnXGZ9w62Cn5MJYlHXT+4oRDLh
 VCLZNNjhTOZh/CSmU1njh0Zz6t7GR5yUd/DjN4Lq6dm/UpWRoYB8XJK+fEWV47ueD2z8voh6NEj
 zt6YqYTrMA7xs0asMce8O3fI+Dn4ccHZXVOuctMLO3SrKShcDQmopqQRQ4UIJZkQkQ0BPwiWM93
 ZskZD67bP+Uy8TkXaP5R4cfjMYzJK6VlsDAMemKCdjl3P/UsPEhLgRL8ss9dxGOT2W+xHT8tb1M
 u6gXbSCbz87XcfiPPAg==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c3884d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=cs1-fbUnOdpO1YpEImAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rGzb1wcwuWQQKYyMToyLX6Mz0_GSmUbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233857

From: Jiaying Song <jiaying.song.cn@windriver.com>

Commit 5f34680219 packaged the compression/ directory into
python3-compression, but missed the _zstd C extension which
lives in lib-dynload/ and fell into python3-misc. Add it to
the compression package where it belongs.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 64e54666ce..11ce2c97d2 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -168,7 +168,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/"
+            "${libdir}/python${PYTHON_MAJMIN}/compression/",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-- 
2.34.1


