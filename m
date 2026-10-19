Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F29CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29870.1792398237415158310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QHdqnthC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j2S81553034
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=znTYYTSj0cMhDeiql9edR17oS5+PO+nvUtF
	1IRIx5yA=; b=QHdqnthCRz7H/xPoChlRO0biy8K5TQth71XdQdSjl5jlGoUsiPZ
	+32XJ1+95j7+68nByxqO8joxhpD8KsvSB7MtI7NUS4XtjjBIx0m72gRMeLovzwy5
	Uh//2G8FrGIal8KqEuimqv+YDmv8U9AZL1fi2LWj0664enIg+aCM4qzxpWngq8t8
	WomOgknSbcJcbDXJC8ZF+iQiTUe0mhNcRT4V4l5wjhdE9l3C9kuXnCdhvtCl4/YA
	AOq39aHcObCU1q+g0gFQM1v3C5bg9wtKyF6T8LTNyElnHnQRjlWzuQYBe+KVvyKd
	BT1Aep0ASiJI0eCp73ch3ouGkPsFq+2k3CA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1sbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:55 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8NrIU4111157
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:53 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69J8NrQR4111140
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:23:53 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 83AFB23AD2; Mon, 19 Oct 2026 16:23:52 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH 0/5] bluez5: fix AVDTP and OBEX issues
Date: Mon, 19 Oct 2026 16:23:41 +0800
Message-Id: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX1UU/p6BpBA0l
 p47gb4joads6uAr/co68UXMcThXhWloC7kRgW8tlOtH0hbtf1ML8/EIuy8wWZUm4XMr4xSxC0IR
 LyHTEGBvFJptVXA+9Dm64JEw4Icd9vU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfXzq1ZJ1pItORE
 WDqyMhFqb5yYdnDahV+F4zkMFI2jpgnez55xm4IBAAU4sgjkPEJYCTQ1NR3LYzCm+8o5bMZByZP
 O6TBlahQVbDVFeOjp0WtzesfPNX9vLmy+JebpGggcXPauBTbatbZ1AqO4fOwRiXB11iK0eU8CZW
 se0wZnzUU0j/B4j0B61t+JcBmVNRWyd+0dEpLjO4E79aMHT6G9GQCzHhEtVJavb/uZQ1qgnystQ
 tbxoHF/haW+OxCYhRxUz1I2d2AFv9G9GdrvgAqtI7PKnuPBNN4WfnR4hXmjuXUUWTLJ97LSszgn
 XnwAkBLhGcI8fNWZxbaUg/nC1vOUuR9A6Wtbr+zGaCGYmKYLwURCi0xdSnvuUIWen17GLhgeMSZ
 dcchPlvMBu+zDfAt+hr0TeVDXd/zfnIPT+Cz2QCmYzFP0tgAHqs0iloJRl2XbJGuuuYf6tldmFz
 pC13sfUW39LK6i02Fdg==
X-Proofpoint-ORIG-GUID: gzNsWfyC365fQk3K04EOVkZmsNhNF88T
X-Proofpoint-GUID: gzNsWfyC365fQk3K04EOVkZmsNhNF88T
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5d39c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=F3p2maQHJGSzcnfQ2u8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248142

This series backports five BlueZ fixes: three AVDTP error-handling
fixes, an OBEX gobex ABORT response ordering fix, and an obexd PBAP
u128_to_string bug fix.

Jinwang Li (5):
  bluez5: Fix error handling for AVDTP_OPEN cmd
  bluez5: Fix GET_CONFIGURATION cmd
  bluez5: Return correct error when SEP is inuse
  bluez5: Fix ABORT response being discarded
  bluez5: Fix u128_to_string skipping data[4]

 meta/recipes-connectivity/bluez5/bluez5.inc   |  5 ++
 ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch | 37 ++++++++++++++
 ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 49 +++++++++++++++++++
 ...turn-correct-error-when-SEP-is-inuse.patch | 33 +++++++++++++
 ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++
 6 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

-- 
2.34.1


