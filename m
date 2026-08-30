Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D57C61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8091.1788094782848012019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OWTAfqD7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCfFeI800297
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vXNQC7nBsrMXS9PvHsjBmP5sj8JhTf/L8gBHIoEqb9g=; b=
	OWTAfqD7pq3rPjiFCSPvOWsjZIfz4QVN15PRF4Ff2IYjZ02LHslfwpb9ZMFjLqWy
	AgX8omHNWXOomkIZoGo3L7HMeGoOew0u7RwqNa4vOVUD9gt8bNR5XjKtzyy9TCnp
	AgHEZRcgH7pW402a5pchvPIGEvdsIiHYdm/iXcA85Dl95IDDxuv5vFeZ3GkqAfHP
	/WWnB/X4niXdT5mLtq9uwmgyziFoQPzSWBuRgbm1ZDYywh1c/CSz8rE77F7HdALy
	iQ+xxr3KdJBOkopHV3IW+ngoFUGq7slPnZ6caf62BRot2hKfTTooFW6L/wrek0AZ
	kmP/Wo5AoI0/ms2nGeZnwg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023143.outbound.protection.outlook.com [40.93.201.143])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7s6qr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 12:59:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euu1g96xKAf+CfGhlcoJMcoU7GxhzaEafsKxQqUDaQc1Fsw8vwczgBm6fQ07Peqz7OhMpDpAjQMjDo2E0qrQAgD6/eA82Vad03qBza01ElDF3otdZpRDasf+O3VELQtuc4jxAR4l+QGSCgEQgIZVYYg711JphHX2JE3WUB1JmCSen0KYNEkbw9DSYW6IycTPnE8SJVeHnnZkkVNqF+E4ZMLxjyR02Ig5jPGPOMAoRik0ZrgLFLNYcLbP9EZvxKFcptt+e+wB0xnALPIPZchqiPmiAwIQtY6k6JpiyJlGnZnUybww1o5ssbGPJ6wu0g8NHnRgGxRkyCMDGBHSRIve0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXNQC7nBsrMXS9PvHsjBmP5sj8JhTf/L8gBHIoEqb9g=;
 b=DA4kUmasHLpVhCOeNNw5eMPxFkAcpS2Km3anu5hHotTEcRw86wRvrmZhJBBiNUF2wXjHd4cjr8MDmhl5ncmFXAxgwIrFqGD/8d3PWtf80OUefGP/x37Stl74YJV5oHzR/wW8shV/7Nlf7UQj07vyLNNdpdyaaqFRvdG2S6FQ+0l68BPvyNqzk/ET4ec6w0BDOGCc00H8wsz+PGOIVwMLTPLcChN9195THAUAyJEMsj86ycNs0P53XbvM2VcdHJDEpsoB/em0guy/EPcn3OGkgci5/LPZAZRNss6hWylzmE0k86QBt9YX2ouDtKcW4F9a8Bti/Jf3WsEn1E+oWGzojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:39 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:39 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 10/11] gettext: Export a fully-flagged Objective-C compiler
Date: Sun, 30 Aug 2026 18:28:50 +0530
Message-ID: <20260830125853.1139807-11-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7ce67c-5071-447f-e744-08df06968d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|3023799007|56012099006|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	KrqvjMyBL9MhoHaCQdqxw0mMtdhGiW/1RCmxOhrv713aOtHcjPg1cFdQVNwKfTOczMGjfTtdeHTXAkbGRDyR7NeL+L3wPvkH6GU04DLHvI0Wf2/cNhWaxuz6K2kRpfu4Bw+2pYYPSilibzjb//1B3XnSjHgPT4Quy08BnQhYkTYJosxHg61lGkK0LbmseyxvIQwyfSORQuxSjTUKdw7NQxSQR1J7+r7UnQLGfkWN8uE+NtCaRPMDYja5KDBIO+6/NfqCoG0jx2LDr7BWiNvSpSKIPV4DHmJT92FJn+hXIADO7TmgQmvH7EVP1TCcjKUseYf1HAuA0CLdkudgN4HXSp8m/KPH0Hy0kSb2OZaZbuDcHbQSRiqZjDJBASWKHe1rQvBRrJ+LPCYP0G2gr322N8eVOF5hnmcoxa7BDOMNcY60k2hFK9aZDG6t7zOmArkwwtIoZEAuvgGUDRCTkR0BCYru537ZY4sKM6+65PD6ZG5JyZXT0XDAP1TM3xNauCQ0LBnaJ454xqwXd3HPMIT1kjOMbooJ14VeYAC1O8eqia7PMrFjp6USTeRrnAjVQpJpbFxd0cYZrvnEoigh2nyeT7katGfmqeEEyTHPWycnH5vPcTeGd9Kyt0/3QSwqR5bL2WQ7hmX8UPebX70cy/1FzgS1QRAixi8dQXPkY6/yFtoffBu8z5mtcN9l5s5wAlyqA6i54cp9vQq1Vq9WVq6UYa42W9CWcIQcTN6FiIzJzVM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(3023799007)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hGoXaqk8uYE0fUE//oXz5wgzWFyYg9rjdlJp9PzLbpXmK5H+v9x4AvYtbJNq?=
 =?us-ascii?Q?ohTQ5hFRvREkiZwj7HL4CMuahvfzV3IDEKpwAvve7nF7dQxzfTi4MQoqzXya?=
 =?us-ascii?Q?P+oVoz2U7HFYwthPET1O5Th1aEZ3nGYkK2w21wQVBUqxeewSr90jDeCGFCP9?=
 =?us-ascii?Q?qTd1qEpV0IIZhaq3THSIsY2a8zJp21HkmCiHjylA7ncPbvwXYPsHXZWdOtOd?=
 =?us-ascii?Q?SCaHpbfUN5CQCg3S6nxioudOW0Iyz7nJZgElocqDSbNJWQ7qalP6sxB65vTM?=
 =?us-ascii?Q?QfDqE+sx0OUitUFRHoEO50jZbR09iDE32CChonQgm7d8KMwYyfI8H0NlVYnY?=
 =?us-ascii?Q?1y83Bd8U6UgWcW+Tm5FYrFO1JzZrVPC/slW6rw2NpIh/v06n5Zr9/yu/90Fr?=
 =?us-ascii?Q?eQsaPvX2g+F7IKk+uDYo1DWCy6ffEsI/DizwxAF/lbgMVjdO+SfV8Lc6atMM?=
 =?us-ascii?Q?s5w91OK/u28yk1X0KrfALN/Z2CaAyWOK6bedzNtSWFEXt/lkgUtD3qpkY61C?=
 =?us-ascii?Q?KrmZqkIwR72Wob5p2k9UKbyV8SRYZ96Kqa+WabOSdLBQIfe7LmSB/O1up0OZ?=
 =?us-ascii?Q?opNkg8iNfXaZ63/mQhEdFpPVCGBsa3ULoCvhk0m3iAkBkwtIYfv6Vt+knw8i?=
 =?us-ascii?Q?IDyL066a9aKH1tX687ZXeuUSkgSd+5eIgCqRST+UxGp0dpr7ZMPO8zZtfdQk?=
 =?us-ascii?Q?4QogCNrrCwHHAIJs1+uXcHyI/MCAdq657q2d18zwCEpsYGQui3pGbWKSoxhb?=
 =?us-ascii?Q?2b29MTmXqufuxZNygJu81j3+W2fIl0SEyI/zJJaj1xp7SJq2kuYwGVZ7MyTv?=
 =?us-ascii?Q?2/PtT/KtMuiv9g/hM2nIlIwajrWSw0AB9M1gKv+lnwhnwM/hWso1oKQY1Aiv?=
 =?us-ascii?Q?D5nTxUZCWpnoC6XsRkC73dPANgG+v60C2lMEDSlkK4p1S2nI2llMB8Wy+ocQ?=
 =?us-ascii?Q?wY4y4J3330lZUpMSLyKyyNvAVdzMbM7dI+1fs4X7IwYwc4UakK2KX68BQ0DB?=
 =?us-ascii?Q?C8E/zaFw6cC6DQVeWaG1CEFbpACz2490YRtbq+fMdTJImZFu01Y8xwvWd5rO?=
 =?us-ascii?Q?SJ/B8SaVDyns8PueILrtZ5rwfNjnjAokIWiMX6HvKqEoJgdq54C+cQicKGMr?=
 =?us-ascii?Q?YtUSrnfWyKNjWopSBRib+IKs4aunpSq5wPs663EFhQlI76N6+HOZT24tMTZI?=
 =?us-ascii?Q?WMblAmRnrQy1ys17AxeZELd7mIkkBh0i+YMjyqduBcGLQ7ZOhshK8g8MEZLx?=
 =?us-ascii?Q?reKK0gzsx9bzqU93Dsg0nsevF8TljcwzEsOsowZzAQsoNG13VS274Q/02B7r?=
 =?us-ascii?Q?v1k/9j2aWS/IPvweqKvWs6pXt01EME1o42gmTHQyBHlXxzkXwZg65rGC+SUx?=
 =?us-ascii?Q?Qc/yDKNoRjIg419L7/I2dBs6352zFuZxmK1i/vM47P1dPQJ3B+J3jxBvNmqK?=
 =?us-ascii?Q?8EhXySdR3GKa5y08pL7SO5dIrCQFg5ugCNgN8QLmP5gwDtS1FwlTcvH5UfMx?=
 =?us-ascii?Q?/+IUgmXs01eXq6C5InakmQ4mLwQHiAJ4GV+5V2aC/HseipFJR62BRKGiAMWM?=
 =?us-ascii?Q?e3w2Cxh8gOkTXe1QoBd8mO96pNJo4dxzfs66WZ7a0GapvsUIGozwwxZdc3Iq?=
 =?us-ascii?Q?JOM0rOTVrR+/7pdkdrztiQNjF4usuZ60CbJmTdXmBT11sI26PSaTxy2mJW3f?=
 =?us-ascii?Q?H5fQmkM4bo7gTBliRP2/4TLSd9pPiXVEb0GmdAcIVHwzOiOz5EjXTqv44TWd?=
 =?us-ascii?Q?3OarI9u6hZ/NO7BicBceCjORbJ8aM+g=3D?=
X-Exchange-RoutingPolicyChecked: 
	TiSqRQg8vGmd6g/2nvfeUes5bu9MbVDwgHKjGtMDV5aS1KrswOeEpjDHL6/AzBbvCCMPjLozDCXrv2J2lZD0IMVmsKXrStTObQHXvLuTnrk6it4yCG41Gb1qA/+XEt9weH2QRS+RZ0daMIXj27ofy+fEiA5LD+t6p42wuq6i0dYGErKK7epIDO06TgKNdAhT6Tr1hD13PREgKXes/hTxYjzR7wUkulL23+MTjok65eRtdR8TRPLva6PZEoQJ2CYC1o4QHAR9tK795ge2+vrah8IpHGYDC3uXSP0GRuSNGc+s5CadZyHUToEWrKxBDPXsgvgpedr3mQyXvancPpX0Ng==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7ce67c-5071-447f-e744-08df06968d33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:39.4837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFzENZXWfY9dDj0rtbQZFuPaIQD9kwBp2HzikvLGMc73jcebgRLFxFlXLhQ/Q1WB8wQzrPdyixPOlfCo0qCchyNFVZU6DX2DEfqZxLMuUJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a94293d cx=c_pps
 a=ZOsnctmsBCw54sLOPzIoIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=IVwVbTo52HGmDg3RedoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX1lZFYay2JP+o
 BycqC8bh5M3kp9octscUC9c3Qsa5NKE9qAcv0O2VAtnTWUDhmA/15vdTc7z8xA4O2veKVRldggU
 xNPw/bk+lLhUsbjE2ZfdT0m8UO4mmjKRy37RnguKZBhLlb0LPoUPFbG6VGT607yDC9kdnQMxLxW
 TFcPrM1w979qqF363Py8Rq7xqiBestL2Uz5k7JOobMdf/RVNzMXeS5711uMAgbJ8U8wWJCX9xUK
 4jKcGvCTDIhXHgzX/ai8ps6fpMQNTUGEgH/5FJ0/y4uTiR2D+7bdqDZo69rtS1OFoRrN/b1Gd2b
 +OhljnyEVTW3WQO99JKAseSi8/Ukzsei5VPI67Seommst0NQePHR8iclE01Pu0vKTtcY9dJj9Yp
 8+EEQ137wYR2w369heW54B16dPWZrZIlizH3NlE08gtq0Kd9SlKRZLPbhxW1uil0ypu3gAC9XtK
 dvZxcKbzvB/iFS56HQA==
X-Proofpoint-ORIG-GUID: 0Wml0frs38QprVFa-KtsZyogBxl9p6bQ
X-Proofpoint-GUID: a2myYKLG1iNQRPE727Crkfc__d492Iv0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX0Ww3jX4cK9pg
 ZI4j/luO5IOj2SPIzjkdrjJn2tK46BmD1sc7qb0I3dIMCNGwy4DUZ2zwbTj1SlDAgoCuI9i8DJA
 hWB4UXWWUKgh4Lq/Fmi4nUNmKK4Lph4cRWjb0nalUuuDlnj9yrPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244652

From: Sunil Dora <sunilkumar.dora@windriver.com>

configure probes for an Objective-C compiler and picks the bare
${HOST_PREFIX}clang, which has no default sysroot, so libtool's probes
search the build host's library paths and do_configure fails QA with

  ERROR: gettext-1.0-r0 do_configure: QA Issue: This autoconf log
  indicates errors, it looked at host include and/or library paths
  while determining system capabilities. [configure-unsafe]

Export OBJC as the fully-flagged C compiler so the probes use the right
sysroot, and drop OBJC/OBJCFLAGS from the ptest environment file like
the existing CC/CXX handling, to avoid recording build paths.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...nit-env.in-do-not-add-C-CXX-parameters.patch | 17 ++++++++++++-----
 meta/recipes-core/gettext/gettext_1.0.bb        |  5 +++++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
index e59c73fb7d..67214be3e5 100644
--- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
+++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
@@ -6,17 +6,22 @@ Subject: [PATCH] init-env.in: do not add C/CXX parameters
 These are taken from the cross environment and include
 sysroot paths, so are not reproducible.
 
+OBJC/OBJCFLAGS dropped as well: the recipe now exports a fully-flagged
+OBJC (same command as CC, sysroot included), which would otherwise be
+recorded here verbatim and trip the buildpaths QA check.
+
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
 ---
- gettext-tools/tests/init-env.in | 4 ----
- 1 file changed, 4 deletions(-)
+ gettext-tools/tests/init-env.in | 6 ------
+ 1 file changed, 6 deletions(-)
 
 diff --git a/gettext-tools/tests/init-env.in b/gettext-tools/tests/init-env.in
 index 0968388..3d9a8a5 100644
 --- a/gettext-tools/tests/init-env.in
 +++ b/gettext-tools/tests/init-env.in
-@@ -3,10 +3,6 @@ top_builddir=../..
+@@ -3,12 +3,6 @@
  
  OBJEXT="@OBJEXT@"
  EXEEXT="@EXEEXT@"
@@ -24,6 +29,8 @@ index 0968388..3d9a8a5 100644
 -CFLAGS="@CFLAGS@"
 -CXX="@CXX@"
 -CXXFLAGS="@CXXFLAGS@"
- OBJC="@OBJC@"
- OBJCFLAGS="@OBJCFLAGS@"
+-OBJC="@OBJC@"
+-OBJCFLAGS="@OBJCFLAGS@"
  CPPFLAGS="@CPPFLAGS@"
+ LDFLAGS="@LDFLAGS@"
+ LTLIBINTL="@LTLIBINTL@"
diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index 696fcc3bb7..ce1d698260 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -31,6 +31,11 @@ SRC_URI:append:libc-musl = " file://0001-Ignore-failing-tests-needing-BIG5-encod
 
 inherit autotools texinfo pkgconfig ptest
 
+# configure's Objective-C probe would pick the bare ${HOST_PREFIX}cc, which
+# has no default sysroot and trips the configure-unsafe QA check; give it
+# the fully-flagged C compiler instead.
+export OBJC = "${CC}"
+
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
                  --disable-libasprintf \
-- 
2.43.0


