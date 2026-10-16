Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233ACCCF2C2
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:22:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14488.1792123214787856294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bLJJiYLF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1mUB83202281
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jzyvBTloEvb4zt+BFCjpVoYc/F2Fpu+Gbga
	cqxFhaVk=; b=bLJJiYLFMdVpdVuha3ISRpULg5NuvUqxSoXHiJKZlj+gWB8yLhk
	o+8mqddMfXJGrrqZikYQzASS1f+5OvxvCz8CdT3/xllieO/zv9Dva78y1Vrcs6q4
	/fHz9sgj0UnWZh4ZKzRd1HPT4mEQFdgHE7Qg3AkUfB5VBrI9X5oNeou2eG0b9eLG
	PaAJ/zWCSQmBomGLJ+ceZA20xhRkNgWpUNlcINLCoQidpP0nTwzxl91KOqBz+Wio
	lUAmsMEjpKwQr6N3Tl7UXxWoFzY3r0+E/eFhshFlBEWDA91L2qTLin2uPnqx66od
	5wfbx2DcE2WOh0lKxZPynPWpc/bvzU8MIoQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39tcd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:17:02 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3H0832743189;
	Fri, 16 Oct 2026 03:17:00 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69G3H0MC2743179
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:17:00 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 3D3CFAC5; Fri, 16 Oct 2026 11:16:59 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH wrynose 0/7] initramfs: backport startup optimizations
Date: Fri, 16 Oct 2026 11:16:57 +0800
Message-ID: <20261016031657.690337-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXy/9SEhC0pIIn
 ovN1eXnslRwzYo08wYkYwPRpZTj0Zm2YLfhTbtRwXdKrM/evEwS3kPUiVY5N0d9u9UZGQop8xCL
 2/jEXUXR08zsUwP5nsfnA42SzghOzJVPbOGk4yRteus+itRDC1mz/9t14NpgCZ1TchyaMbHS1d6
 itfU8icWYK9bHWhiRoB7Ud6sguhIlRF8x/rpdNEs1JbCh5SUPX9IbYqejikKdM9Ozk3276mW3tt
 Kkr6eLsYvB0q9c1tPc6VTrKhh2Q1kbI3SUOaSm9yYah9nnWarLT1aZ0CW4aWmFR6guHi6qGwqoF
 YDETkqKz/MYQnvNsj2qlsJushX663nn8ltItIjngmoR2dJyc7JCturFqfNLZAcfvWMBYDMMyT1U
 9mn6jfCPB2lGpt1JEjyLa5b0+zNB5ymBjuJSJYhDRj8kIRWNiqdjDu2tfP3BIPdyRmlK1J8t8he
 WVkqlnguJQzTxr1GfgA==
X-Proofpoint-GUID: ZeQ0d-rkSD6E2ImFBS3YC_ZUDnlAITUK
X-Proofpoint-ORIG-GUID: ZeQ0d-rkSD6E2ImFBS3YC_ZUDnlAITUK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXw1OszusgYuzj
 tmK7yqKdxz2u14tgO23eYE3ycF3hM8gU0LTZsv7H6FTNjKyZ09JDSIxnOWkESL8DI5PMfjnPA9R
 m+3RRB7s4xk5K9EP0RAbffqOF2g9iYg=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1972e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=MA1YaH5GDOQqEit49M4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248034

Backport the initramfs startup optimizations already merged on master.

The first three patches add an opt-in root-only udev coldplug path,
including LABEL support. Full coldplug remains the default. The remaining
patches remove short-lived commands from initramfs critical paths and
allow platforms that do not need early EFI variables to skip the
efivarfs mount.

Wenwen Fu (7):
  initramfs-framework: add opt-in root-only udev trigger
  initramfs-framework: support LABEL with root-only udev trigger
  busybox: enable findfs for initramfs LABEL support
  initramfs-framework: avoid external commands in rootfs resolution
  initramfs-framework: allow opting out of efivarfs mount
  initramfs-framework: avoid processes when parsing cmdline
  initramfs-framework: avoid external commands in module loop

 meta/recipes-core/busybox/busybox/defconfig   |  2 +-
 .../initrdscripts/initramfs-framework/init    | 37 +++++++++++-----
 .../initrdscripts/initramfs-framework/rootfs  | 37 +++++++++-------
 .../initrdscripts/initramfs-framework/udev    | 44 ++++++++++++++++++-
 4 files changed, 91 insertions(+), 29 deletions(-)

-- 
2.43.0


