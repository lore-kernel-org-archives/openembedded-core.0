Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55969C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12863.1784293290969870574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bNR1quHv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJ6FT1111860
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:01:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dVRzyHlbF02oivTXo3eyvu/NHP56zYc9geKJhvDFtSI=; b=
	bNR1quHveXnZGhbSUBhPxpSHG909Xd2JvE6q+JfoI2tjFfRj/9CZWYB4yZWqOQCX
	FbdVuS0c52vfiIaqioMdhKCxy/oXIVvdbSljrV3N7PIqwiIhaCUe/WH0QGJHmuCU
	fJPmgvf/jPpS9++eIfwTINkds3c34TaSHRCgDIhBVHNlstIJq/DW7JdsnoigVoI8
	rHtIBDQFB2w9/WTHH/sbm2f5fil1kketNUsgC7/FIyO/PHhJBzNdUCuh3HXt92iQ
	EVJnYtrzLcmm7VqolQ2Af9Ens8B+j3u8/Vz9/9uEYEYP5t1MDDjretqOWhf8mwtu
	VqWwyP5kHXPwm0psr1/oPQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgn58b4j-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJur3bRXNwioupPlHGl9YxmPVzVh3+D+/52tm/thUNAEA359wcy6YhjCzNLs1xl9wCD2ICL13kQgLPYznFZoarwJ32nBvPawSVmvCZAZ7f0VEqkc8pNNy2vPSnluPsqZ75CuGc08PWSGm1ATu1NI2fuT284v22y+rbSQgB0PcW4LnL+5eY4OiOvcpFCUHIlpxC/ozTQuDqxl8wvs/nY57iDHGZgM9ZXXtuT2DlgADlCMOxQson+Jpi3D7Jwf6m5NIjKUIf6Ys6UN8Z4RtGqSMqDtJZOP1Q9L0YV3keCWCBKQSQuq8HPCBsB7VQIDsyQuF6eN+5V2xNGaeMX4TsiR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVRzyHlbF02oivTXo3eyvu/NHP56zYc9geKJhvDFtSI=;
 b=O0BtIvMv4J7fWukljOAMyuUe9QlDRdbHEKlDP7F7sUpn29kduUMRgRtD1+WVQ3fT3YolN4+2djJJFpqSfIlph5GiEEMCkHmAxlyN6GMamAlHL8r1UcMlD152zGXLKZrp0vnqeu+CAFiwakYp/e0Cl7WmJWEs2UQzrzv6lTBl4udRjILt0BAr2fZdQPjIfiEvUBOw7lFCtHLzYnvkWF6ho1PMZZmvB+UpdN2sYWkjEyhcngOjHyWoSXGK9rKlZlbDaU7fFSZH+U+Dfd3PBsZYPo6ujknxwhjfcKCu3+TLBlU3EClCtRM8He6zgZyF5alOQ0xugCb4JO2l+YgnIzdJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:01:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:01:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/4] packagegroups: add nativesdk-packagegroup-sdk-host-rust
Date: Fri, 17 Jul 2026 06:01:07 -0700
Message-ID: <20260717130109.2187282-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
References: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8c3d67-a513-452b-7386-08dee403839c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	XlWFcjiTpQUN4+hfx7HA4k+ytwOYsXKigwiTv7GnGQvf1bWEGZ75J0hG2R87lJZ1Jo9UxWnvot1AJCdkeLX74tSKb2k4sGrrTKWnl1NVlO2VWdDdKc7S87Kga+gdt8z02/FB9uUhMgKqxRwyxWuU503MmhvfkIBZcK47dETqRei2z6lKfammet5P2I40fLyg32P0b3n5DNbots1y9wCVMoi7uAgArGucgt/r8TH05HAvtK9duS+EFDAoYdSQTVZFC2A7Il3QoaEpOwIrg6t+8W+BdH0crSuEIQ+HEmnWxEBszd25aM53X2lEowiaO06UCiv5YFtoCm4HE1TnLa00uZofyGIC4LTaNSzgXlDwk0u/UGl4fM33JKKmyF/PN90H6XfrNm/XKoZywut2l5NnMvou+NWIqcNGMkTeLoAWvIT6kiNZQ09OpRmCFMQwepOeVuP3u4Jc12EnIeMMQ5rkSjSAuNc3m72U33NWUQe9flUBcpJ+q2j9a0Pj99HQoaDrGqz2VdKDlPRtT5HJmU5r5yLQlKcH2NVh4P5m8vV+QbfaIuLSN9EqGuU77I+ndzMxxlsQvnyEtZOeyhBjEJ2kbalR5JeNi1hfuNzHJpbfK9BT9sH8EdKVoZVpc4YFDvYMcK0h9lIEUfaS0JxkWboOM5cFJd2b8jPe6kkB8QBtt1m6dgBhE5YR60DWP9co8Mq+kcxYMoVCVLQS2CQMh7zU244LyGjGnLJnyqfu8Y2YPSM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eRD1PnurcppJFFY0MVtSFVHtWW8AvIqHeoMh33CDfusbFYxNUAUe3RC8nysx?=
 =?us-ascii?Q?Zvlvs7Se42OabBuuD+QV2MfMq0nckc+6YakUgvE9bvZ4KcwQn1k7T/gUdQKN?=
 =?us-ascii?Q?8DL9fKG/u2TCFuErAjYHFxaQDZxvHCQWPXVMptHxDZ+bxPYPevIRbAjyqP8G?=
 =?us-ascii?Q?k9hbTOqAl+XlV+ZeL4r9nB0tGNSu5h2lcrx/9llBzMqSHbOsLodRrgoT9WvV?=
 =?us-ascii?Q?NTuFNEswWivwbTjxzzihXNesxMFJHMyh2pX6lWOndmk8DdI4g4sVVaa8kBbr?=
 =?us-ascii?Q?WnJBbilkcR7DN1WUB4KWajQ0gb9ZCVxkgUWHNpftWRsFdY/UA0fRGrgQ0M1w?=
 =?us-ascii?Q?Vy2MRTHXKAKmE2JmgatDcjnFiYFtj+keJFnO4tUgd8ewbZMMJQ4AJOC7quAH?=
 =?us-ascii?Q?oOfsnya1VJ0h7H9EIx4dnJgw6Aq9kZAVtbaeWD3PLMNFEZ2NxuntSZO+vpXE?=
 =?us-ascii?Q?x1KH5Cxpmkc3KctSjyXjwDNlw9dej8EpVFT2ILIgFum0xtjk2n8R5IsNSHsm?=
 =?us-ascii?Q?YA9OQkBaeUR2N1CkV7WE9GurH2EqN77hb6P2m+UceZ12xmjTSAdDb28tlGYO?=
 =?us-ascii?Q?lPHsCo2lL2sS4CUAPhqcOBSVktKKIanaoSokm3RC8vrVBJpCH1IkZgsBUUnO?=
 =?us-ascii?Q?ESnrCtOi0nF6RQCEW6CmLRQ0ocabN/GUO2ueui/mcPTl4sk0fSu2oa/8UPxJ?=
 =?us-ascii?Q?iDBNO0O7SQiwIM6TnxuHvEGe8233pNh28QPjLAY9qgiqFlrQOXYSOpYyP8+v?=
 =?us-ascii?Q?CNi+xUbFmmelic5g+9Yf7ByYWPTXDDs/DD+yDkdzUmvOfVDTuI7+mD3RicEH?=
 =?us-ascii?Q?kfPrAsEbMszwU5yy1FBogmdnDrIpHVSZDLfqKMSjNXql36t/RlEhTjX/1lBZ?=
 =?us-ascii?Q?oUl7oV+Iyvr2GT0CdYhDd8adG6vya/1hu70+nsEfjpLNRlp6plmW+m+TDWL7?=
 =?us-ascii?Q?CQDvbv7eccR/THj21nnsKHkpLqQ/luJQpmUfic+w31ioZnLuYJ2xhyIvGDnO?=
 =?us-ascii?Q?ZlM7J+vtiBhjLY5xN8gLy0xqDaP81DL9RF311ihCyCEUKsZTw9H965NIAVlJ?=
 =?us-ascii?Q?Uz8KbZCAVcdRGHu/R4KhzYF/yGSrhRnAB6UfsCb9FzmSrkYgIjdWEk08q0wf?=
 =?us-ascii?Q?DxL5JReZYtuAATq8qrpF/ojQszaR5NX5fP+ISMPgLn3Wwtm/mWJHgjKk4YGz?=
 =?us-ascii?Q?0EAnZdl5+W55w9DeT0PB3cwGYvyPIAcsBXw/J3ZIbFymMWOo2M3s09PBNC7h?=
 =?us-ascii?Q?8ES/cCuMf+XPeoVn2k3OzO/1ZZK6r2YRwYPqzTueO/a4vdB2EA8IL52gS4tj?=
 =?us-ascii?Q?TjVVbYsLZNFoVgqY6ksLWqVJOfaDzxA1S9PjhKyt7LM524ZrM5DM0HZiBz2Y?=
 =?us-ascii?Q?AwSvlBX5FvpxsTXNuugucf9xazfHQbTrhwD9n9lKXg4O5JvxiF4OCEFQ6g+R?=
 =?us-ascii?Q?/lj4pSXMvlfa4pJK+2sDQwoc8wJX0Lru4afwX4Ekm3+0JD5edJPIRuH6TENU?=
 =?us-ascii?Q?n71QmypuMsHAOtz9MZoP87Mrt2lpffnRzcpBr3bFd/fdAq8cvyqJT4IqmlJ7?=
 =?us-ascii?Q?KctzjlJwII25CgMT0D7s3Ym5S825luWTZve/jgPY290UIyXu8BEDFBCpbMTR?=
 =?us-ascii?Q?aAQrW2dSr5e0M31B5LMrmHc/FBV8a63MT8GH/cvMxG9KhfHFEodmTN0CViVS?=
 =?us-ascii?Q?eLSUOh4uoIkvCRtUDRXzLcYFx0KWK/0VwXkBW4obexic18he34BCiHw8grZC?=
 =?us-ascii?Q?snrMOqH9P2ka0qDDt2HNuu/iKbQp6ec=3D?=
X-Exchange-RoutingPolicyChecked: 
	C1LGq1LTloXmaYSywEclfEBFpIloWs8tDUXySFeVhqIM+ebiktXCKuXFMt1DYBYaifSylNmayQOncE1Aw4CG/GFAum57eRxeGMGg24RDW6vrbk/AX2nKqpVXiY6+uYsffWBQYCuKBVzQsLRdVZ4eZ0zEjsD3Xk8lvsJvCBclNUJ7Cz1+kwdt0curuoirMZzypHMJidubOdEKDKXd08b0B8R8fFyfaJcK/sr8VcOCQ4GSyG0P3rmA9QMjY305RFNRWXTOW6MLg1fjvg8IBhNKyYRDYMQupt1ouTHMURR4FTIYpgd2xIKxYe1M593U4ktpyavzsaXpCG8RtbKwNhqgYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8c3d67-a513-452b-7386-08dee403839c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:01:27.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uV7WA80W6tIwp7Lqu8xVcr9qWAuIzdokCE1x1PLJ1LPfsh2d9BEmlBLPRuV208WWr85oD22+AmU6pGr6eTzk3oHc7JC+FXvSyCKE++lEbDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a5a27aa cx=c_pps
 a=P6W5axN73kUBBlOjEPV+4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=1HcokD4nGsmBfvQgh2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Jcj8FXs3qE5Se6QOd9XnyRdy__V-IDj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX9vzgOhy0yeP1
 sIVTXcRPow0x8ptzqdcFiyyi60QTdOJ1FF+jKmit08U+PHdp3yh1h+IYeeidws3FqMI3yjhMSwQ
 Jy5IUx2r0xDFwdHDDgvglzxMS4/g1d4F0cyCvKHE6kfx2rh1lwy3GPBRHKLgDX02wrTBdD0w+0p
 sbo6qRKjST8Qs58zFiXSbC0UrJ5RNPTVEIq2bkHiMt5QpdTWykJy9wjEXI29M0eqTrC8Cr+s/ov
 KqsGqt/BA6cu/JyIhe9/EX8u604ohNbJi8Pk0Rnme4mPjMeOnck9xoiD07iLNcq+l9fOJsAidXk
 FKXHsCQrWywLpwGuSEU4Kajvx0meJ+gD2rbGG5RWpdM1ui9a5P+19qzYaDuUgJNHA3ZTi1wK7xB
 YFPjlj2GyQ46GOJ/SNA7QGTjZim1R9inG1oU1ySTBHKKoQl3fW9GRvJsmG2lNQcAcs7eQXixfHF
 Yl+RCHNsV0l05fZX7HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfXzZgF1N6jv84p
 /xe0IplenmU8xcS62TXWSBHJKu5KjO0caXkjrKnqwnF5YzFn1zRjPhdbnU/cjEwjueyktlorbKI
 kPOcu6iSzg6EZNxo8skPmfaQU5GYnZFpunsOhERZqgWAXlcIV40Y
X-Proofpoint-GUID: Jcj8FXs3qE5Se6QOd9XnyRdy__V-IDj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241177

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add a new nativesdk packagegroup providing the dependencies needed to
build external/out-of-tree rust modules in sdk.

Set PACKAGE_ARCH to TUNE_PKGARCH instead of the packagegroup
default of "all", since nativesdk-libclang is dynamically
renamed per build (e.g. nativesdk-libclang22.1), which is
incompatible with an allarch packagegroup.

Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../nativesdk-packagegroup-sdk-host-rust.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
new file mode 100644
index 0000000000..b10d420acd
--- /dev/null
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
@@ -0,0 +1,16 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Dependent packages for building external rust modules"
+
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
+inherit packagegroup
+inherit_defer nativesdk
+
+RDEPENDS:${PN} = "\
+    nativesdk-rust-src-lib \
+    nativesdk-bindgen-cli \
+    nativesdk-libclang \
+"
-- 
2.51.0


