Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE23F5A8BC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 22:28:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6398.1776724086330225529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 15:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=khS8Mu6B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8570430ff1=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KKswxx1779824
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=UPWMfQRjq
	H581CNQA4QoqOi6tQdk1pXo1IXDRS+kPm8=; b=khS8Mu6BcLPPKjNTG1zn1gY2f
	Jc1WxaY5CxhzqLG294zF0wr3PCfgvCkS4sshSz6qzsrwW6pcJXC7BeVSMQBJ2rqr
	7T3yYRVrKyg8/U2+ye7U0J+2HjNWIwmuInI+0Z/KfORPqJZ4kTGwBEswR0Wxpkvd
	O+MaN7a1L9a/PhMIw0DJJkU+EbWIiiHfQZGc7qqrQIDFJRVdpd69HADQdhUpFJkK
	yKvrgHKJiRcRF6b0WUaTvz21f1M5Bg8jVjVo9azfbpwRTaCR3eTPqcFY3L0tur5u
	/mxKihtQokJinh3X0hA5pCQgfVulgKpb2garcIO+yLQrLEIzj7f+z2e9C4zUw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013000.outbound.protection.outlook.com [40.107.201.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm0x6tkd8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 22:28:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXW5vT6Zy6HY66t4UfrLAvcgioYIlgUlkPWAOVCeV4UP1b7eUEMCe7Y35Qwu0pPnirKy7ykeKzDnSlZm0y4uiuuv8lYTCc8bH4zbOZa6d/7JnQE/Wbf530adfUMmy6FXf8qXLg8+mvLsCx7at7CUyx7AFfRYJfaC1WfmpwbSHwSL9qfCUvDnet7bK4sHftlXotEQF0ewblV79rL14NmF1QcTG0EA1vPvyg+wtQCmNLHHMozwj6h6HwDdxNeSGLceV5zoFP23pcgvMopKrh8qqyWhZbg1dR0YZ4iooNLOVkK04xVfUY2yMEmIqYHbnNDMFBEfxadJOoaogH5Nxo4k0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPWMfQRjqH581CNQA4QoqOi6tQdk1pXo1IXDRS+kPm8=;
 b=YLjvvIeyPVjW4wu0dY0EpAPk2MfdNqnNfmlM/HRr1ewIHgOUXSWT3A3zstxowMORs8boXvlUWDBmkNP/T/jUBYApsxmMtrhKoh/dREAeJKM06dvLJbrXWdUQAq22jkhr+U9eKsPWL1ZUvZG2rYwhMw6O5seTNtnGLethfP1PhF0gwi7EzQtXE9oKJp6okQAMboaecU/p70Qn2835K3Ofr7R5w8ks3MxTFG2FyQiBGf0Rk4Y4lkDDSJsllgAZHIXrgO/Xhurp+CUZ+2PvdtYG0jCFxgG/OtnThcIVSlcTTwIQ+fZTIrQrrkYEZQlsNr3oqLOFT2YmX4eQkgXLkDnJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ2PR11MB7713.namprd11.prod.outlook.com (2603:10b6:a03:4f6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.12; Mon, 20 Apr 2026 22:28:01 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 22:28:01 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, raj.khem@gmail.com, SunilKumar.Dora@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] libcxx: fix libunwind collision with musl builds
Date: Mon, 20 Apr 2026 15:27:42 -0700
Message-ID: <20260420222742.3790348-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ2PR11MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dc4ad0-12e7-4cd1-9842-08de9f2c14ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Z6Ueu42N3Pp9yQfrV5D2UH7QiKIkf+/PksDKtZCjPGfl3V5u39bIuGYEO+0HogZGrhdNDv8aMWPR85CdojWiRUOa5efrVCCQGmHLgU3EBzTazP/zNstLnHJAvD9XR6eaGl7PP9OOx80BiNkgh4XTx4ZiirxjIrkz0JuCuqFMFvmPQvJsW8eZ3vQr7jKyFWkyujXm/7RjJNg8o/tzE4WnNq1oyeWK2asRYXFIxLrfJQRXZdQ34wmx1POHDTPqx1ydtQuiZSQPXnZAXVDHbj2Y+Z3Dm4T65/nApb7kpd59qGE74IP/zWXaK/YBUqH6QedJKSXhXFfMkZ3wLHWYb8ek5JKQWbcrINck06Rzp6mJGw1g2CAVmPW7KL6DalNKI/9YDbSGVLs1cxu4yMc+3RczWvRZBXO4xb/5nZADPRmu0R0vCx/oGAGAMTH4zJxwxbtA9uHR8X/3T68KtHLO5UhAOI0T7gU52pSfz9ZiV3xOqw90cQGTQ95lECq1O41NHNyyODr9kpYn6OJIQAmTsZ8qETE8+JzKEqiy0kEo0r6tgJ3uKwvvI9i1wNw3l5Z6YZVcTzr7FUPD5jWxZGHU7KUnhknYCYws54tHTP5R1lX57KuaIaodEyJVZiOfAOslef0UgYuuja/KlU3ojYrnedCe2jHV9CGMwVtfOJR+sp+pY2eSpE7g4IwUaPWyZQFeMNidHQtoQo4kyByRvzghTXzv54zQc9z5+Kn08oRc8QJjsqmSAvUH4hxNabD9uskrWSYy8MvzYJkTwBbPjCrcC9Sr2YDGSm7qbZd6YTzxp61U9KI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iQbor21Bp8TAjf3U43agarBC4Ng332HKmxxc1afbnDPAueIqrD+Ly/qUstjB?=
 =?us-ascii?Q?o/eLldgfMdbOcgmoTcpzrsXqr+LMIY77lg6GGPyAsyIyWPHk/2vh+XnJSc2E?=
 =?us-ascii?Q?UuVWQG8XInLRt8fs/rCX5bRN3GzcDq/5C1JlyxhZApZdNfrReAKo6VBChmr7?=
 =?us-ascii?Q?ygeCESYqY/jCOveeT9P+Aq1gazx1I4kDBfaHZATQhux+b8d7l/WHYqh4fOBS?=
 =?us-ascii?Q?GyPwosW8G0gNp4Y6cZbpXRT83lkI89beAbfYIWuHnuUn5ZJduOhFV4TbrNrq?=
 =?us-ascii?Q?c/t4rygAVEyNcU66HdghapXR1ahUoy5T8oAGkppMZ/zbm94hu5kb/twtezHn?=
 =?us-ascii?Q?WBkejLjAZJlJZyWO0WQgnqwjwqRf4W3ch0H6FAvjHukVmkBeOMlkPxf4gB1X?=
 =?us-ascii?Q?1W7SEj2xzna7GnTXue7MtbjzHP0PNgv+0CV4Ui2FIGprjKtXXShb+9K/+A+j?=
 =?us-ascii?Q?TAh6Y6mCbpLu2mMGd3x9rv6Mn4+NS1OMTYfGH68yJKnDrN0hLanw3aSQfYs1?=
 =?us-ascii?Q?B6w2cSVxdxDyugnVJJoAxI0ojQ5gj9trykkAPQnPInAkDtGklBtLUBy9gqSQ?=
 =?us-ascii?Q?mBmDbKDhbaRWEKJ6YXP5W9Hu7YJJSqvw0mke1mc8kTJg6ZCk4Mcvihz+XbRZ?=
 =?us-ascii?Q?JKHB4hedHZ4lH5oiWhTwg1GfMDe+KXVXLQi9VponPYk+Gwo0oyRis6ZUuPe2?=
 =?us-ascii?Q?8a6etg1EqmCCgXdMB2fMo0d9JMZ/kDA2iGXbyiRNl8YqKvzigBhIJ5amvo+I?=
 =?us-ascii?Q?EtMr0wmIaKsa+YbpbyRV//gxPLhf6U5eNzBVBDzruIQN53H+GuCVvAAHk7DY?=
 =?us-ascii?Q?NL51DYeAshilqpMNDhjqTCcLL/fhW72o430lA6th136+gOhsdatr8tM5Q3Et?=
 =?us-ascii?Q?MvBNa5/h8PF8dVT15eHzYlW1ZUL80BljAWLY8Va3C65VwQPTU5hRPNUC3QpK?=
 =?us-ascii?Q?Bjj7hFCDzjVnEheAsTdWj6S2Ihiu7dHkuLIdBFazYiKOgXAXsQ4yowx2NBMK?=
 =?us-ascii?Q?Uj/i/IAT3VfUUxMqzkl1bR3+1I0wmGKY3dqGmGlhlbCPllH2ydjwS2R96xwJ?=
 =?us-ascii?Q?Aotytsi6QoOexpZ7Z5Lrr7ApvVZsB1ieZ3Ls8Bm2JUnqK9ArFZJRReJRe7OM?=
 =?us-ascii?Q?ZOLG20Fe79PKzTLYpX2Dm5G9AN4IJYhr7KflwXujvqZuUJtHyNBcUdpzehZY?=
 =?us-ascii?Q?BTFlalILK2tDEtM7YRcuCsynbMod/s6xttS/O4JLcxt2J+vtfpaZjv8eBJYe?=
 =?us-ascii?Q?eNes0M8eLnW+u4luQiHsGSMcv4OHHrP9wwL02RyB1Rwj/W5eSOdcOO5RGCfc?=
 =?us-ascii?Q?CUku8ad/8MnvYD6WOBlo86p8tTTFoo8Q6ps1FyFADQJrFd//RRsdK41xZyqP?=
 =?us-ascii?Q?2MTPrEAx0qFKDe26LQcPRO+I0hPKQs6pjySTT5cSYFCXZBXMdar0+ZgdjhMW?=
 =?us-ascii?Q?GgOch5EFbNc9Fl8NgGWQrSh2y7cDDjnItw+V+EywcWAOBpl83ZqIV8LTwmYP?=
 =?us-ascii?Q?8zVhHEaNNytM+BQnN1w4QItXkLHE68yjCdWyjgKOuQU/NJZhwYCAz5+xUobD?=
 =?us-ascii?Q?sECbQLOk1kGCsZ3V3R9VxpqmCrDSC8kQXOBNdvre6wTsrQZAheRFO6DUDwuR?=
 =?us-ascii?Q?CdE8eFUt23uSDSzh/vvTV/qB8ktQMEZnS6AoANtaZcMrqJoj6Pn3Q5XMiDPk?=
 =?us-ascii?Q?QPn6/9IczacUq5sw/QV0pZs4k43qczNSQ4JElPeiehTyJv+uBxzeLN7AcEe5?=
 =?us-ascii?Q?XgogZHzp9EUl/KfwNJ8vPK0m9C/q9hI=3D?=
X-Exchange-RoutingPolicyChecked: 
	qexbVK61NIfP6g7ZQyuGGT7GFZvNXJ8uozll41FPNjgjOiDBTFRY8as92aNiXJzpMkGpJ27AVeVdo8vGWBc2xVpkLdmckJ7bs5IPbdFqBp0YwaatgFeY2HX+SRAX7I/+/e1VfoBYRCuPuTP3mbe/HxZNa3rNssz3QU5yhm1jjm3QU/69ecRtZqltkdbVb71/fSfZIGzG785rqc2bQewUNzxPqwhYbAPaZmnRqddjCShmd0bFww/LNErAyIOkRhwsahCYmJjX3jXSVoBa/IR3QR/m9DehpnDuUgt8/mNQpw0She38KR4CJOzLkk93vUFPDgSB607j6DWa92Kym4Z+nw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dc4ad0-12e7-4cd1-9842-08de9f2c14ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 22:28:01.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1g+DpEy8+5VHD7sBBEvHXoctDxNd1ibalao2rbssp8KreH/c2JFDcMfPuVC63qGnKoSdAbjZJ2nIXpZ2WnXXSbG29g4dwrcSrj2WD6CO14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7713
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bOMm5v+Z c=1 sm=1 tr=0 ts=69e6a874 cx=c_pps
 a=kza0H2G5rmQD+2VTu+diIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8 a=Q6KQqGZZzcsPRddto0EA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 8X13-cozXwfiBHDbWR_gW1TT2zMJTpEl
X-Proofpoint-ORIG-GUID: l_h0R7MguERNPFDHjUqz7BijZsqEXMd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfX8WC0CB2eUz08
 s0Srfr+vIYA66XULeTW+rQAgspmJycLbLz14sycLzqc+Dxaf4YsxCv3WCLzM4SH45SG7EwE/occ
 0uYTjBjs1y7/z7cYZ05yYRnKpTxzFw9hERZBKid+2pDGfmt4B5Si3CgYBO4LcKHMpKswlW1845s
 bShXWZb5Kzi7N9GujZ9GxVT4mkT17tsdMsNRMmvbFLDLHf9ou/r9AUlHWLF+P9Q9YPvINxSqK6f
 D0LzqcnsTMj6iXGlBaKenxT1rsbLiCwiH8ilQb8K10gHS5wfibCRgFGCtMkv546bjqBgyepy2LS
 e92/Oy2ItGP0+YUiyzXCGqQxZ78MqxPKTHLGGjzQvKfpabTM8BoeOi+WRq4nehKoEVtA1EAsjU0
 4qAwXZppmns6dJzS3MniLsljM0Ek8u8bkdfzvu2zH10rzEee/YzWxWvXeJVh9vt1o4RPOfHOLlo
 qh9QT73ZpVkkvGDHMHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235587

From: Sunil Dora <sunilkumar.dora@windriver.com>

Commit 75409c60 (rust: enable fully static linking with TCLIBC=musl)
used install-unwind for musl builds which also installs libunwind.so
and libunwind.h, causing a file collision with the libunwind recipe.

Only libunwind.a is needed for Rust static musl linking. Since no
other recipe in oe-core builds LLVM libunwind, compile it
unconditionally for musl and use do_install to install only the
static library.

Reported-by: Ross Burton <ross.burton@arm.com>
Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index dff063ad8b..d7af23ddbc 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -32,9 +32,15 @@ OECMAKE_TARGET_COMPILE = "cxxabi cxx"
 OECMAKE_TARGET_INSTALL = "install-cxxabi install-cxx"
 
 # LLVM libunwind.a needed for static Rust musl builds.
-# GNU libunwind never produces .a on musl so no collision risk.
+# Install only static library to avoid collision with libunwind recipe.
 OECMAKE_TARGET_COMPILE:append:libc-musl = " unwind"
-OECMAKE_TARGET_INSTALL:append:libc-musl = " install-unwind"
+
+do_install:append:libc-musl() {
+    if [ -f ${B}/lib${LLVM_LIBDIR_SUFFIX}/libunwind.a ]; then
+        install -m 0644 ${B}/lib${LLVM_LIBDIR_SUFFIX}/libunwind.a \
+            ${D}${libdir}/libunwind.a
+    fi
+}
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
2.49.0


