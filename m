Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E53CD5BA5
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16153.1779175557178403004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DK8Ga63W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wL3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=THXef+1OePtpzyeKpaoYawlJdfAGTKza42RXE4ak8ts=; b=
	DK8Ga63WHKOlbSRAXaPijAWjzMI67sdZ8eK++HXWgXDdtPU3egLqkcmyzf4nYgig
	in3/aaMvJwVEMmesKN/2K1xIv30C+md+4vjnE9sWDwW9wQXLVF+FxLQNb4LhtAZ8
	fucsQcXkHaM4BvwtI3fKsdvJ/dNtgVGWczBArPbmTDfoPZkuy1wJ2Ds2FesKNMky
	Ok8gizv/nb6ursVskxT6dFBZe8WEvHge7sSr8+ySb8QTFb815/WwbroKtf4iGO75
	Oay3r7p5Pw/XMQ68tsp9kjP80XedNrT0Cnohm855WKziH6JXOlynLT7Ghld5xayT
	1y6GxlmvNzW3xfCUqDB80g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWHkxjzfMLMJ7qr8c4VyxyIshJsUt9Ro4TSV/t3FL6M70ui5Jn99OpBFLwpvKVjMa1jBrWojNy2gncmg/CEhT/KmK1VPsVa1gf+B4caYwD44UW0Y5xZzPLwrLzbWE6i50De3JpEe6KwZA/y5To1N3DFV6SvTT2Th5j5ZqNQ2nAt5b9vfa+v6vJV2mZ8M9j6uLEMHczI4zLuHU0a3RfisehAB/kIYrhD/9z0E9O0b/EdVbAAYPDh2O9UUfqb3ZvvaiRmdPDexv6L6UP0uxr0p/cW5X/UnuGqigNP8u8prxdMbF7oj6qKGJwdm75VSYNvQjNkpYb+W/4tzGcgs3Hcx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THXef+1OePtpzyeKpaoYawlJdfAGTKza42RXE4ak8ts=;
 b=DdpGn4nat3spchL1SZzCtoO6QAuXRvRwhBzEhEJj8OPtemwq4Be5rPY1w4jXeRDlteJEr4gWf6CGIBZP6edqPOXeX55sBvTRcEjfi6i4FAQbyVPv3en0oIZatwSLJOLAwgckazr57Ok27DCzCTHlcFN8O/GI2DPICXucNxpL3cGHsv2h+NQxtAvuyPnQL9nWa6N/uSKi1ZwpRkKJRBv+D/l80FX3+EQK9xh2PTVnQmcPXKEnGevik2BZP19xmEeAkwhHttWJbP3IMW1lVypOoWcCh5BzNDPE4lYQ5mzYOyIVEgDesceQgDChIpjSkAj65ZxJsB6tFg5iFJFhxYUPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:53 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:53 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 08/12] gcc/libgfortran: package libcaf libraries
Date: Tue, 19 May 2026 00:25:30 -0700
Message-ID: <20260519072534.24588-9-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc2def1-4ce8-4ad2-311e-08deb577dc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	yZfkW1BlFltylMxaGeNDvOlpB8GCXm2Lhq1UT/VIMoiaLizW79OrI1LKpjsaG3rnIfhAQg3BASTX8V1ACADYgVCuYmaZqBbQ6idh0AfVz0ueGvIFx6z64tU/KKlsjmi+gSny60ZVudSPPCfhvodXZT8OSlQYndlfcaSVbqcmDu8pQL09pBc3UscGMZhD943D4jK0qETWL5Crv0Jo/1/hUIcse+jwo3SRi+S9OmCm8iKDoUCOivzrZsMz0jvRY0kiTEGqMOUT+xNaYcOOxhU8TBQP9Iwzg6HePbFgCJBh6dhoRXibjBRvSOkbC4Ybt0blpWGrQ20N7AbPcCLmEstgWF13NLuSIGKKE6N8ZZofSzDOWd46TGKeMUi7wmuVXL8dP8BKK6/WydL9a21dKo9S5m7F1sDHyLAU5jNg+H9TlSwvb3cFlD6ZDBZGEd9ZeZE4sJzHjPv+wYbfTpUobXT6e0xoIQNRn4fzZDPTLNdiMJJdeXJY+ghbfRQPbwuJWBM0uG9YPFRrhkgov14APQwZlSVkxTBAKtKQTLW0wveblLQmyLX2cWVk/O8gyom+GXGNzXtc4iy0K5JNrV6wx5CqdIFPQQGzByEQJDToWUwMMJQVOhe09nY2hlac8d2aGGGcjFjhBzof00ecR8bGPkdSQgoqcVa3f665ev4Xg2IhsDS7wCoBxc+xn+m6/ToOU4Lh8BzZJYG1P4Jhk7gRtluIA6VN0QxUkAuNJCN19/wGD3oiBxAhfSzlfw0Yc/5EOy9g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wxKLEyzpYCrsBianzWyf5ECdAtKmc4F71QkDNIdN7SPDYW8YzDe0LtQViL+S?=
 =?us-ascii?Q?wRxsqyN8PiyhCCT6hvwh/KcBT4aiJtDFBGyX1pOe4fY4mMabaPUWIq4NgNFg?=
 =?us-ascii?Q?G1OhDYFeSptWNHe0t2Mb3HiNdXs3LgM9CTuZOMeStvPbC71XeRDH3/h8rTkM?=
 =?us-ascii?Q?I8FZzZh1oZvV1HNKRogIZWkNzqjhDWt46F6dM2BYO4hD4XURBUq24B4PKR2U?=
 =?us-ascii?Q?oY1esgUibrWmpNaKzVRgAeBwyOR78dMKrAH0yWvNj+A0/eAlWJ7+dH6ifK1S?=
 =?us-ascii?Q?cYooSS2/iIZgNPpz80EftQVJlIrFOtQBBWhLJd1CZhqpS/7mHqV67ucMHnFk?=
 =?us-ascii?Q?nS9Cyimglgh/UajuTZlkB5cL/ym54m8EeMHXuNB5Qt+YIeATqKtRmYMQg7C+?=
 =?us-ascii?Q?LYr7V0s6pvYMe4gV761SBxcJCGFjSZmvZYuGRVtQddYkM0Wdqsl6Kx0vz5vh?=
 =?us-ascii?Q?zmyUX6y1Rb220Vgh4RuUz650iwp+9mc+KJeYSLhShYU8jzr/vRedcm5YydGL?=
 =?us-ascii?Q?x02Ap5/ZWV7V0p2PVCd8M44YYYoizsRNpZtRI4dglpPpDehrFdWVUhNwq82a?=
 =?us-ascii?Q?2ArAU2eik3jWdMLP9wXadpPxerxDNUdvhm78oFZWswf/ue3H3FK0f5n7C83x?=
 =?us-ascii?Q?0Y+vEGftn0zPU06eRbM2njucMt87BHn9GqtaMtytlpZcujMy53Jgq33QwPad?=
 =?us-ascii?Q?UkdxYtEDChMDNM+TNVUXuXV+drS+Hc/EaB80ImjsUWKP32g8Qv+Zj9fN4ge2?=
 =?us-ascii?Q?pU01CeA/m54FX4JbSCrtoC6cuLnt1Ywu5p+yrPBgdFw2DyEf/A47+FPqLAMB?=
 =?us-ascii?Q?K30FG++qJ4SbI+xiWal8mDXYAtAb3RPh+HJhShY7B1gtttGpl8xKa8KdOd8j?=
 =?us-ascii?Q?8hqyiXoPCr8yt+Pf7AqYbZfKhKCzbL0Md/LDZW1MAGIlyhNCwQZMEMcRV1xC?=
 =?us-ascii?Q?RXytzy4ZyeyXSaNZ/wR5V7EBT13wklFwhSxIb2jCa0XGAK9jbWp1qLd6S8DN?=
 =?us-ascii?Q?2+605/3adMRAbvtW9yfK9dQLTyC0RrTYm1jSUQ7lm2SoYrDF8O/M+uQJxwZb?=
 =?us-ascii?Q?eoaqBrcJ8nhlX5cPm6lXdX1afBAOnvSkghEaR+fQ3g2oQIEjVmz+RbgmUCaB?=
 =?us-ascii?Q?J+o0nJ9Dp7tZOFqTPtU1J5kTAoS15Si9JaEaLzuSQ5PI8T4eMX72cSlI2DrZ?=
 =?us-ascii?Q?mDt5LamX9npsd/xzk8A5ekTXM9n/UeYa1omeY+eWQGoYKI3ezAgCG1tx0sRW?=
 =?us-ascii?Q?mJFQfBys2G1ESfdtBn5l2JrP09PkZqCjLBqJkc4polbsYBfnYPJugQg2+vJR?=
 =?us-ascii?Q?mdg8TPjutz7Q0Qmsdp9mTJNL1xiorZB3JCVMm3ce2qPk9maGru4kpgOwU0pT?=
 =?us-ascii?Q?mmbztM0o2fxpdrDnlamHtFDfwDVzx2++fARdK/mK+JuovwB6RmpRh/jOBbgj?=
 =?us-ascii?Q?z+cmzatRn/oM3ASp0NVovr0OodZLZVNm5vvRGbsV2+zS/OBJdFJDLwN1He25?=
 =?us-ascii?Q?NaNf4oIHIXUE+bbRGdKJ6u08dIHPRBEBrQzsyeRzor6d87oiam0w6JPThqPT?=
 =?us-ascii?Q?+YOlZNHT2NPoTsaowLLZILTvsnODlqvbHbGiFweFhMxFzib8CudVcBhl8PK6?=
 =?us-ascii?Q?MxVh+VT1YyEMk27S9sIuX6G7/g+VXdYCNU5lEfICWHvSJsrX3VefjRNB/K4Z?=
 =?us-ascii?Q?JIkr7BwBNABWwTGnomu9N5VoN9eGNe9BAbHFTQ8cBiWTJi/OUsP+s4q/dqzW?=
 =?us-ascii?Q?PcvjO6zoQi4KAh6r6g9nrzHrDvad6Ok=3D?=
X-Exchange-RoutingPolicyChecked: 
	wqDeSLmi2OSCGKUGqB31LL7yqtMWIy1h/aCp88hiRwrtutI5ENSwW2XThAWulzsz3h+DHBQeXc0zgU7E+CqggoQZNDisRg/rcfGc3uzqdwwo87I1DmbW12AWVicFes4gLZzqWkGFF2FS77yOTBqPff8NB+WrLM62D7n0m9mSl3VLCvUN9GWkiAqtVegtiDWMDE2THuB8MJItQLz7M5/TH7OIfgZo31VNdA3SN6TSW6RE6KJhW2TIM+cfD/QYlPjHMgt/gCrRHa/yzElXUiQkI/fYxAj6fDz4JVCBKeyhlchLe+30U3D11zY1oxyZ80qGXt4b6YBgua73r8eg3hvbaA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc2def1-4ce8-4ad2-311e-08deb577dc11
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:53.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mk5VQNFkr2oTxfTxxBksi/69jk4EYuEHrHtndhCXvCPRjNn0vM/50xor7871RLT67VTGFSf9M5/NdEqPjaC/jqEp+l4aBzxPBFeEhx8WIDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: htmXq4A0PYyCWG4gzrdMKFlLj1pFaWC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX16NFywgL+bMw
 rgGRPbUStxbSCgufXVQbbW9u9XSh/Q4TrqCcT9ecS05aimI1KRwBThqunU9XIRzb/auMw3FpfMz
 BzAji7D8Ssl6Ac0xRinYF3ry8YyW4iMNVCncoIK+V/ZylFkvkadYhBf4ZwSfTSdlSsgdjDDShZm
 EPg9woB/hkqyuN/0VJpzOCgCM8AfzArkv0waiO0tLqNLSunI8biz1yM2S/7wDc28bkVzPMRbejn
 QNkLr+fagM/kmYso27rE1G0YTCqbGdowqNIKtj5a1cjN7AYKaq/LRhIgo0/EzQCH8bsIapsyW97
 j80yg+HxutiQucdrLnHIIUo9qC11w1X0dNUhV/cDyJp7PR/MU/TlT6hQJiuhm3InhaHW91pq8aT
 41Tz7t2kzIUWOIxUzntQzyfKyGBfQHrXECMcrwzB8qML8OGw2pcz6+My3wh72zaEGylakZsD1d0
 QE3b5zM17f2F3Lz2V2w==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1084 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=DZa0YRnvEpGXjuqStjEA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: htmXq4A0PYyCWG4gzrdMKFlLj1pFaWC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237279

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Package libcaf static libraries installed by GCC 16 to
avoid installed-vs-shipped QA errors.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/libgfortran_16.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran_16.1.bb b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
index 71dd8b4bdc..6ad12b73d8 100644
--- a/meta/recipes-devtools/gcc/libgfortran_16.1.bb
+++ b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
@@ -1,3 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require libgfortran.inc
 
+FILES:${PN}-dev += "${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf*"
-- 
2.49.0


