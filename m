Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8079.1792577316663924105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pov0bCaQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5aGB335146;
	Wed, 21 Oct 2026 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bfCQn3KzlT6tYk66DzgLXZskfaYbaJuC7gN
	DMLkJm5c=; b=pov0bCaQ0/ixmaD/rFhdbENOpX0tD+jNhGeiQ94LL1nC/CjMEjK
	a5ui43C8wTHTzCm71kPbnJJI5O9tmodK2d/i2JFSJSwZsglRlJO8D6mAIQN+RloY
	6xnVC6KYPXy8mTzZCXZE2+x+C68zfmDbUua1Y7d6Y5OmDXQRpTkSrTLCifn1yhgb
	n4RuuYiQRXwGnQY5lZJb45cPl9+wUFVDMz1KCBZwwIvfDZhH0Xx8OqhPv9RGFFNx
	XJ85NRfgVOrrj3H/ExpkxthlRK0IU+QNfcPOXdK0bBSFloZ4i3NoKJww6+fnVajo
	2IFZIDoo96wzMTML6kbpXmByzroAz7mOesA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj486yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:36 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA8X9M3533785;
	Wed, 21 Oct 2026 10:08:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69LA8Xg33533739
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:33 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 7A13023523; Wed, 21 Oct 2026 18:08:32 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH v2 0/5] bluez5: fix AVDTP and OBEX issues
Date: Wed, 21 Oct 2026 18:08:24 +0800
Message-Id: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 0ZDvHIkvf6OtFcukA-2Rwfv2gvFu7h8A
X-Proofpoint-GUID: 0ZDvHIkvf6OtFcukA-2Rwfv2gvFu7h8A
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad88f24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Q4-j1AaZAAAA:8 a=F3p2maQHJGSzcnfQ2u8A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX6pURMh3cJsRF
 lhCs+T+HXx7JLHc5a+lP69kqWGG63Iqc9/gzFuvswRRQ+qiFxMrMrp3pv9Stt4D4RsZUWQvhF74
 v28yK7topwGClgJlijNhJ+JGeZ+nsQy8wDhhp+vuD/v5hECprHd6WXJ2LKTdipNzn6DsZehivxl
 IQhq06/xXKRCcQqQhYdDE8DG+K5OiHtATGoou86F69AoR0QyCANHWSAJjQVKSWSOyPqA5KYNvpT
 MhS+7QxOy7iOt69SdZwI+O8clBQHdw0uJfr6e4PL4nFq2LTPrrUIq1duksoM+aFaIiz3TViNCeR
 zuiyIR53lirXE71MUIXF5b3g38nlMJ3IoX1vyPKV2UcFhBXocn6TbUju83dlUwCah+Uz5hRI3qa
 dkHomBUhlommfQl4QGpQCg2Gws7lUFY5z6fYstMI6L+P+1xrvFAT/ZhynBSutcYjdAyzUwCcxy4
 hDEYdMWJvLnvhJb3a6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3EP3LTk6ojcY
 tWbpxF4u4GjEdYaji+4ocm2uHeYqBWNaFz7Y8pEQFo/iry80Xkw1r8J0xbhFJGRV3/yU+qY8Q2q
 yppCCtioKPvNs7aiIhJ7czkCkNDLWUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248381
Content-Type: text/plain; charset="utf-8"

This series backports five BlueZ fixes: three AVDTP error-handling
fixes, an OBEX gobex ABORT response ordering fix, and an obexd PBAP
u128_to_string bug fix.

Changes for v2:
- Remove Simon Mikuda's Signed-off-by
Link to v1: https://lists.openembedded.org/g/openembedded-core/message/248142

Jinwang Li (5):
  bluez5: Fix error handling for AVDTP_OPEN cmd
  bluez5: Fix GET_CONFIGURATION cmd
  bluez5: Return correct error when SEP is inuse
  bluez5: Fix ABORT response being discarded
  bluez5: Fix u128_to_string skipping data[4]

 meta/recipes-connectivity/bluez5/bluez5.inc   |  5 ++
 ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch | 36 ++++++++++++++
 ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 48 +++++++++++++++++++
 ...turn-correct-error-when-SEP-is-inuse.patch | 32 +++++++++++++
 ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++
 6 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

-- 
2.34.1

