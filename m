Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FD4FD707C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 11:16:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73552.1773746164397805084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 04:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FkcE/94z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7536f7b35e=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H5EZDg537536
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=yGjrn40NQ
	U8NSnxKeT1Z6a56y1VN9sNZQsCdhvpzNN0=; b=FkcE/94zfpByTh2pHQZYTG6OG
	300AMvlTPik486FQ2loLzyThao/C8qRE8ATjtbD5vVgLzF7UHuWOD/REF2VVyGul
	TmpLNGjiAcjljMOFq9VoSrXNDX/GskqRI2FqYQRI0PO67SXSHpgBDZ85uflQIIUN
	bwlOt2GtaETZ5O01gAQnh17Bwb7wVlR+ZVilucUN7ozskSgisVXB/Ii8NCipnK+g
	TslLdmxqdc9pv8hOoyOMaK1KgN6NAKxe0E/36C0asBD3hwcdl3/E+3cdeoYAyEM/
	sqkDWStYck1pwd8r4W2QI4tVcvII4xrNacceA99DyV9Qve32/XSZD380ubiIQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvykagp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:16:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlwnIfrcyujm4JolyWY17PGjZsZNmQDDCcGKUxS73G0VHOVszyNRnQ5YGyTwTFPWB0JwMarqfTkFCzeUXMlx+a3ydfPlwfapH7wRiPLTGnl+zQDWIVRiqJZQ/NiQ8rIEJcTW5s4rz3bTtlqXX5w3SAw+4N7l+Du9TTkRPmqGGnmxylROf10McELjd70OnDHmALFZ6ro6rEJyfTRgKk6QrbPBXg+4DYaodWhcIll6Q60cR5RIF8GUyoouLsv4qaVwBlDGN4pn3x52G/lfB0x/cva/RN6J5tvOCI1HUDT0EpDArZgB0GLhduuRRFqi1Fho9P6DXGxrYc60Mp1BzjdAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGjrn40NQU8NSnxKeT1Z6a56y1VN9sNZQsCdhvpzNN0=;
 b=bxqI3fpUw0oatjQpj6mqql+rh9s4CSHz6gOIVcSzr3kkpTrMrrXZFr7s7VvJyf/GlIsl7luYtqQdjKA1JZYmB8RAI2uRU1xuUDpsCLxUZKdAZM3Z9Os+6zG6aRCHyjZ8alME+k8Xf4bm6SmEFHaxtKRDAziSCG1C3RKYPN+3gHQJVpiyZQopVlTwkixI2Dm+TMvsDU6sPyJbYb5rTre/fDpgmtOQfaglB6wDshIXVizJ4qQRJxHbel8fQoZvbpgcH/HoaPowouCAmEZ+krGNWoUipZoCnAqFaJtzyOtSTmPsBMOi31d05P2YwHfmEScpd6UTp75mf1SVJZjncbPCng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 by CY8PR11MB7874.namprd11.prod.outlook.com (2603:10b6:930:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 11:16:00 +0000
Received: from IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53]) by IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 11:15:59 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH V6 0/1] gdb: upgrade to 17.1
Date: Tue, 17 Mar 2026 04:15:36 -0700
Message-ID: <20260317111537.2699962-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To IA0PR11MB7910.namprd11.prod.outlook.com
 (2603:10b6:208:40d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7910:EE_|CY8PR11MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 013a58f4-ff9d-4f64-b17c-08de84169147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GPzCUZYXLuNJerIA1VBcdA40k87xf1bCaJRsrSrco1lbwAaRgpT63ARWTjjanyEoFsYnp6KJ3aMtwGc84ts096pNiRaNHq9cneVNxwQqzW+pe8IRZJGNUHatnUFYhAJvdplHwSDqImQi/b4bWyEF0QsvEfjut8+JkrZ4uY/vaZrg73+0zou0hd7toWAQUxzUuCOVid4EAFkDMpgwTH7o2kZGX0sxojCClMIvbBWkNsfPBrWC2KaSAP4g8icL38XtK2nc1iUS1YcdG+BFDejiQGz287GYcBu8PS8eyMbQ2GEwGOWCudi2aNaJsD5lP642m5cWVL2S7cxalea98I5fbxab9X34jH+ibsxSfRYKZW4CLgnc1hRY2MDsRHB9uHLpqbqhJzINBHP7/hG4v2FDizDOdeOwNlbDW6X6rpxPhRlxC+XfqedQTun93LAfWPqcHjQrg7AbxL4JnN7n7nNMyH5dBazUi/df1gnCEDHJdbdK5qlf8ErMSagFhnG+2PvZCjyZ4m2HVmjjAHZrolPEWhZqdHN2/JJ9XnA6YiCscNx8+QidRoMNdK4K7GMHu9SIcB92n0+5jkS19K1yLZr0AImWjGaftrR+fSk8mD5h+FoyESzQ9oyppZ938377AOoFvp/+82AJ6y7P5BmlMlM+jKSfnZ1CIcM26eBk4DSbUDM4n7IF07pNKmBBNMeA/qD5694KdeGb36iT64sZnk0kUAnVWKrrCDYK5VFlGIyDMSnu8WbZkanx+vnji8tDrmHI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oFefL0pqeyt3qJG2p6l+G0/x30HCmO+K1nPThrHGU3w7e0XS4ByzZRJUtg5o?=
 =?us-ascii?Q?PsMYcLYX/Ex4xBjFl+O+R0dsYHj5XXXt012dFe8YI3zHczUnCFMSm1URdyUM?=
 =?us-ascii?Q?OkF4v7y9mPsJfMV/oKbbcs3Zsce2mblhdgjKdXqqKg++IP2tia++pliBtxqv?=
 =?us-ascii?Q?n+AAeunCIO3Vh7Dr/OyoWgyIjLMgEYPECPsuB4+UsgWcBiQ+FcH7+A8qC2w8?=
 =?us-ascii?Q?9c5b0dXbp8n+/lat4CJ1fK2nRPslkeAXrWFEpOKSw0uapKjBGXEESysN8iGD?=
 =?us-ascii?Q?LR+6/cExG5yobEX08gAytCAd0mc5eO0eut3UUSRYlBa7v6H6YEIwwHldAKLR?=
 =?us-ascii?Q?APBlHRElDEUeKAIGulOg3exAJe0ZcFfew3jLQujSbbzAZDSxw14QguzFBh/g?=
 =?us-ascii?Q?ZIvHgFl4hOIGKejh6qnWwPhWhY9bR1Arq3F+eqF7DFnYRZ9cquiAakPfDWxM?=
 =?us-ascii?Q?vfB3EV4CJ9RSDCiYPdy3BXVGb6/W8Qsf0Q0ARrrdoZTUYNZOsHyKm8wLQppw?=
 =?us-ascii?Q?V8MmpWf6FUEoRcRe7NMvVeqxwR/xImuRG3vJC1POKmI44FNH/TfXUfjoAJCF?=
 =?us-ascii?Q?loa12hixaXOjO1U4wUOw0JTV7mPK1P0tP8h8lNjInIzjV4Z2VVZFl8QytPYl?=
 =?us-ascii?Q?Q9AIIAqpNhye7Wi0aKIUb27aY3qvxGrb16u7hIdX5tKj5MS/ZtXVz48xroHk?=
 =?us-ascii?Q?R/v6gOGiVmESr7evflBvJRRPgPyHRkFkxE/MeGn3vC1eOxMlhnVgD7c0PP0b?=
 =?us-ascii?Q?KGFEme28U1MBv+4XJ84wv2pqxsqDhW0Hx7fiy7QVav/yIuk6lFcmts4lMdRv?=
 =?us-ascii?Q?S/3Mmn9qnLFalfqO3z6Y2fd0cMOyXHVj9o9fRwdPMWY1UPgTjnsShJ/yFFut?=
 =?us-ascii?Q?Xh0hMYWOfXuBFbFC3g3ccuNIK+gXHQkRFa+9cRK+D7QEk00Gn+GOWNIWBgGx?=
 =?us-ascii?Q?Wkxz3YLXE+fPm+HCQHIqrcmaLZfYX6pYvL6jHzEOCfYToZYHx09ZywqEzBvE?=
 =?us-ascii?Q?nN+rC90qzV9PzeoRoKSOydM1l2EUxJvCHTcnI1dExpIxCkiKAJZNOY42jCy2?=
 =?us-ascii?Q?R9f1CChS/RrRkkO2lkOCtHPNhxXGxe7tmGDAi5kkP4lRhkFtkPad36EgeTA4?=
 =?us-ascii?Q?W36e0fIxbLbH5GE0UnOwzhDfemXkovLHdJh9ruWyPq+MQhQcLZxbVQiHtNV6?=
 =?us-ascii?Q?cKyMdrBedkgN797hWYDZNsl5N5bVOudAivfsjl8lzQBBSRjJ98fU/y+APPaN?=
 =?us-ascii?Q?dAM/4JJpEQzyjFTm2OPrehJjqOUUbyyPU5aWx2rmvKBz6vo94T9UQLtUvVki?=
 =?us-ascii?Q?wWxLt08YCEewvvsMRvXD1lL41Yiw3DoWZfsGK7ZkNhxmGtkjVwLenAMsR+oM?=
 =?us-ascii?Q?oLXnceSh7bCxkyvq7rIM+kqrma4xfmAtiO7OrJIAVpYGlxXo8QRHWcjA9jxX?=
 =?us-ascii?Q?yqI62BOZNfkS0xY8SENqGQdigguSh4LjHteIr8vDO4Cz+ZCy+NF1YECDJkrp?=
 =?us-ascii?Q?YKpGg3VWmzkNYh3EG8cdmmzK/57KZU2U4v5PASSuyW5MF0rBNtrXoQ8UTAaZ?=
 =?us-ascii?Q?x/3p48IskqOV18hFVIzoKXXIqmgl5fUwZpJoFpH9uoZwhVH9OuX1IuMEcEkU?=
 =?us-ascii?Q?zLsqMm5U92jKCQvEJvgL8NlEg9Mmpy88zPBrUiec/2nGNbsm4JinzR6eOsNH?=
 =?us-ascii?Q?XpETCSi07sq3PDjL3IDJTgOp83RQivhaDr7DTWmVYdBzUPYwfSDceCOL7ycG?=
 =?us-ascii?Q?CZh5fU2T1lVo44lrnbKooanQfrRerfo=3D?=
X-Exchange-RoutingPolicyChecked: 
	S/z+u+GEkSY/p96mJ0pVJIDJEynM20zttjTWB6ebdkBU90GI9Id8NdizC7ILyIUaK2DowVKQaOojWCCDkWngl0OeMLE3Fsi0j6RX+dynf4JRw7XQP9gKlSZ7sQpaVvo+RMjjVWnCkPWnQAgd3p1U+hSdcGr5FrVZ8k8fI8MsfBKjk97+b/c3CaiUr22mi9cpFfk/OPKtvYXp9TgXi8aGXVsxQSmw8ZTW5m/NqOn8yMLMdiXgC1e5Td2vHXrtjMQMQ9LytKLYKDRIIQa3FYAG6LPiQjlxEtOFyQtbnpM4Q7ISTdVVIVGnezZkTCIAyYozsNBnFJMvt7yDx8zM+sjYJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013a58f4-ff9d-4f64-b17c-08de84169147
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 11:15:59.7663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lmvjVOYJRzSSlegCNB07ytwHqVvT1U0UsMSADDnJP1UiBu7yN2Vfb2OpsBZNkoR0VueBC6irDt6LcBO3TqCW00IWtkCu9OFJ4AFe5fTW3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7874
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b937f3 cx=c_pps
 a=3Q3Nz7QybYLir9TwqGRfQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=9LAt31T1uAaWqOzgBSYA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwMCBTYWx0ZWRfXwiPEL2IlMPG6
 cVKuZp+vK6uKuQJWsU+n73NB4C4Kyg0VkMp7IqRxAmsKuOoOwYcouta4Kt2/GLZe1/hf83eVdjW
 447NyN/H3PXVbk5WuzDdD/0AhrlUTTzR9iWDSRiWoAHWfDuXSTEtXAAfR/7hIvOtFLST293uA0V
 xkt0VEGT4fgkKfbUFdDlTb4llQGecJXX+V9qAER+3WtidR1j9P/A96jxmhQv8/q2/CwFCrOvp7K
 gB8g4rbFt94wWBU0mBVfESF7PApuhJUBms4n63RarSfyS+pONqXSo9nzoA7Uf85WfnI+v8c9ike
 j7jASp2MAJS4s3ZX5z0gEkQWyoylmpiEluxsNSv6H5Pyw8FpPpsQ2S4y7OMGEeuBZikLNe6dDXJ
 NaTzpyZxhL8925cPYggbylZ1o4iQZ+CYun/KzFUSajVlntPTIiVD/4YeMYoQvtUKPMPwG/1eo8n
 z6D1Z3uzgFhWlBzM+BQ==
X-Proofpoint-GUID: Z0FsjxzsfVzpcUx0D57Ydm-_kW9lNmgV
X-Proofpoint-ORIG-GUID: Z0FsjxzsfVzpcUx0D57Ydm-_kW9lNmgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233315

From: Sunil Dora <sunilkumar.dora@windriver.com>

Upgrade GDB from 16.3 to 17.1.

This upgrade resolves build issues with newer toolchains and musl-based
systems. Two fixes are included to address musl compatibility and
AArch64 kernel header changes.

The previously carried Readline 8.3 alpha backport is no longer needed
and has been removed.

Changes in v6:
- Discussed with the GDB upstream maintainer; the patch has been 
  submitted by Thiago for GDB 17
- Updated Upstream-Status accordingly

Changes in v5:
- Fixed patchtest errors

Changes in v4:
- Filed upstream bug for header visibility issue
- Coordinated with upstream and added workaround
- https://sourceware.org/bugzilla/show_bug.cgi?id=33926

Changes in v3:
- Fixed GDB custom baudrate issue and submitted upstream
- https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html
- https://sourceware.org/bugzilla/show_bug.cgi?id=33747

Changes in v2:
- Updated patch metadata and commit title

Changes in v1:
- Initial submission upgrading GDB

Build-tested on:
- x86-64 (glibc)
- x86-64 (musl)
- aarch64 (glibc)
- aarch64 (musl)

root@qemuarm64:~# gdb --version
GNU gdb (GDB) 17.1

root@qemuarm64:~# ldd /usr/bin/gdb
        /usr/lib/ld-musl-aarch64.so.1 (0xffff8f690000)
        libc.so => /usr/lib/ld-musl-aarch64.so.1 (0xffff8f690000)

Sunil Dora (1):
  gdb: Upgrade 16.3 -> 17.1

 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   5 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ++++++++++++++++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 ++++++++++++++
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 7 files changed, 447 insertions(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

-- 
2.49.0


