Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB36FCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16402.1779175553406889290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jPv1nNYo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F40D3123077
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=r5ahqopuW
	b1LAh3LvTVxXlcOPDsdeYiRgo/qsOxjHNg=; b=jPv1nNYo0U15HbHCjgoBruCZK
	ZtsUHWSKGYom3TLLGtMLqOnNBCmXy8tLGPXx+ZE0gV6rEQ6abtNKHaJtsMjJk4kx
	Vci0rOno/vazV2UGLDg/FQ9kOhyRN3ppdK4jFkIrmmV4k8yiSj1n65c6wa2Megvk
	LR1JY1qK5OnbRP/0KwiE4kPj5tehnRSYuSYSPsWEI0FohVBC9bF+qSbpHHDu+L03
	hV9WOGrTPJdXUIepJMlR9GwpXuMrkDbk/LPIk/4NOUde+BU7SaSy0E8mmW4dwtC7
	7mQbeKsw5mqjk7XuBpgA+JFfKsH0xdC/QJKbBQdZAk24MoxdvRAlVpT5p66Xw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf37vq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezBo75oQXLratJ5UGFvVvPLGZCes9QEzaMEt6JttwWWy/AHgenK6VwKGMa4UidgDA9C/k/ZH2Ox+GqsTO6rC90rX5M50Vf6wxQ7VyiJbt8ygyJgyhHAMF+8sYdOfvR4eUBBJqHPUfHgHuxI/pzo255zpQ3u276yr6xRGl1Pg0xh21oW4p0t4zHjo6ga6vvbiKSRp/ZwcgNaKZKzZVMGD2p6dJJI0Pw1f3SNE9/n4SvMo6vOxNtfT895bR14nlMHjJtdHrHYY/kVVmeGhOTW59hassVlskR50xUmZ/5HJ2awWM3lMeYJ21aQrHGUVpWq9pc+m88J8PXl0ROOqlKcNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5ahqopuWb1LAh3LvTVxXlcOPDsdeYiRgo/qsOxjHNg=;
 b=Hitraevwg8CpTUxLQzLKvbh/emSzTMcq4VGJHl7rDRdCpNEZJG9NgJQcpA+h/tHmlWrcx/s+4AIYiYY2YlpE+9xZAeIWgCifxSXj1qI40fExLpk2KJwzGKPlyrAzCRHaWRtrHbskBU1nnOR+gPCivf77mxj4/bTESDg+tkvgRhecETRK02Lj+pHIZ6L9zwCCWsj4vIXTtc4DFOjYRTPqIO9AH8oHxxiWTcXF6MgRbv+msyM5kgtdCs0wlCdbWPvF6nmBQISRrOub9riTI5R/pOFYYBLJXjmKaOrz3964cuYlt/xMgkB6RPu1iIkoQOOk4t51Nzsa2E57VAdJGk3taw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:25:48 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:48 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 00/12] gcc: Upgrade GCC to 16.1 release
Date: Tue, 19 May 2026 00:25:22 -0700
Message-ID: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 15db77c6-fc90-4143-f4ea-08deb577d8ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	VXog1wL7yqFsyvF+7TSbBD4p095gJibdY6eBDhkIjiPXE6gWAzU96yLVj+azVe6k3VrtcW6llUpLCRDmbIfMzQUu/t95BMkhrfgzo4cEl+UPOD8+P0Hio85daagvB/aMZ8jS8Lif2mtRxU1MzxCGw58pR4PExOXB7mJc500SGg73eZ+ds1ocNFHpY41xuvjB8tMeHczeWXTM+FwTOUVBwq+Ykc3dIhMwzEYs/LPczmDeXJbFcSry2R+SbMBLL9XKsoFIGaYRz3XSs4nmwtFZD2WXQ3hwB/rt0gNZ/Oxhx7jQBj3sbeR1kJfGGI3pWY9CHqu7Ob2fz2zjlN+qr3P6L4rBq7lpV+6muPTZl+FHdH3kpjuqB87QKgb34sfDP7sg6yByRzMk2XMxc5Ukh/css3ULFic/hwbYtcBCXduQrBYNhFTugjWNOZH09wQedTEP7bPoCeuEEQx1n6QpHmcRcYzXp0nk2Y6r0rLvQgjl1Db78ms8XPFgdhF+sTqcWE15lxDG4aJX5Yyf4AocJRsVXUoX4+FbVD5hoCIQ8wDBn257ZOk32xltR1ftGSGQpbQHbSlpcXzmSA5xFTfH53bfE26j2nik5lMx0MymKUMR0frR7dE5Qqcs7O0jo+1TJ6VPK5Np//Dq5t5lizIK8AsrEvkqLI0O7AHreD0wDxY8qg2Y5JjEifgpzrgvK1+i/uneS2L4S2Ena1agjqho8DtrRC4KUYCh2hFTs3WxzgNhaQFfR7TDKf98xQ6tigP/C0bZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eZ8xWeu/ZxAdSkftDlwRsBH9liy125MJx3i8p7aRMB1STIlu8ca7T2KrFsN0?=
 =?us-ascii?Q?hqYg4EN+H1R4nxe2KwFrWXpAkJFHhqyiujoAT9WhPw3EnkaaPjteD4hjGDCT?=
 =?us-ascii?Q?zL11WXKbQ2VBO2RlMXutKumT/I9xlhcJuqDW00secPB3P0yE6E+PjvSTsmKE?=
 =?us-ascii?Q?CTMevcxaIlpnRMxeHthToye+CUH781eRWkV7u7fVAaRqr0mKjdVMB9bDeqTc?=
 =?us-ascii?Q?algwGqoVoq/ISWzHXHbhj56R12zf1EzinCPzCxrmjLjwkZQkAp9k5YmgS9z4?=
 =?us-ascii?Q?2H5PbX3X0O84zVUbxF73Ga/JhsG00bXBhjUU/HsYxstv4ZyUaiWNOxYX+dlW?=
 =?us-ascii?Q?cnQGKqvIXupnMs9WUDIcxqeeAX19lVgnNykMqjtO5iQaEaTrLAbgNWlICxjP?=
 =?us-ascii?Q?GlDZ0Q4StzyNRQ/kN0hH98Z3MHGfpA9MoiBLaVLe6td0MYxGWvwM37OEARIU?=
 =?us-ascii?Q?YScgmBmVOeLlixHwsp3k+bQ6fBZ4GbvqjSDbJQl4U/MYa97Fq8cD3vWUXvfN?=
 =?us-ascii?Q?5WQ3B9Grzeikx57pv2uEeYRH9BguP6HDwbOKnAbK4X7VwyhFfcuPlG5qgf8v?=
 =?us-ascii?Q?zaqM+89rI7pFQqOrTLZI/4A+250dztccyGySIZcFs653bsJ3FsiMwa7wrqjb?=
 =?us-ascii?Q?lWX3V+5KxyA2Kw7et/yMJV5kKJ4f3ouLVh9OqO8++p80OBO0Cp5H2US4HcVR?=
 =?us-ascii?Q?MEKn2uUfAJFGWhgXdNySnkarn0pEZL1spr3rV6ScoNruGSBhcUy8TZINibSJ?=
 =?us-ascii?Q?ivTbwldQyKaS2XmP1+wCBnRtGmk9OZPUEceOKbxslxA/b48aFtaQ5CL4Hsan?=
 =?us-ascii?Q?HnBkCjX16NRrgPV5Gph9QKa5LvIUYM8PgOBwDCyVma8LF3ME2IE7y+jnjgt6?=
 =?us-ascii?Q?p9MJrvI5U++81yqin2PWKFqAIU89X7PqUbwSypZVSkl3k9Rqmk2japlfd+oc?=
 =?us-ascii?Q?QsANPb9/jwuCdM6BpHDdIr6tbIu7KKRqn6Z7lVK0Jm5cUUyiJd85f0y4xtUW?=
 =?us-ascii?Q?4YhIiyCYBeFTUycXmiD8+ZXTVfI3b06z+k9Vi6KBAFakmp0MrEw7HCNhZSPG?=
 =?us-ascii?Q?sk8T6tXr1e6xlWIadGWwlOM02S3MnRZmSxme1NmJ6iyAThgjF97I4fvagcdu?=
 =?us-ascii?Q?wkbhGdKkEk4XULDHPyb6FT5lV4fX1JvRL+wp3bkM7+Mu+9Xuzqmdi4pO5SBN?=
 =?us-ascii?Q?9MDLN/B7fgJzEW6YLGSr2fSpPBTK2cA+AyM3A+weaeSmGYsBgpHTG2znWOZn?=
 =?us-ascii?Q?OUp1+FB+xXzDCAAKwDiQRKIuAFjH9Hm0MzqahBuHzORPyNfoKRe+VzbICAgu?=
 =?us-ascii?Q?v66Sd37VgOfLkyC+VfzIxeU3g94SzyFGqJ/3jzumTetJqs/w6u5jrG4/kfcP?=
 =?us-ascii?Q?344rGd1X8bPh0tdXIc+5Kxe+DilU8rbc+UAWtse9rPKQ2aIQ5IlJoKUk6HD3?=
 =?us-ascii?Q?nUVyQ8j0V/I8dJ5wsVvKwnNeaUX0r/lezOJ1+clsiIjVrWhZLFDHWUlI4qIP?=
 =?us-ascii?Q?2l6ogEOuvn9cNRGUW4ybpv3Hvp+1tgvEq9q/Vmq5DzD4txPEFkemCMOcM2ze?=
 =?us-ascii?Q?ZwjzzHxPQXHsTvUh7/o3pvXyLZnllKmAqh/R/EAMMIWEKr5CIC+6QAMvqHtn?=
 =?us-ascii?Q?1dnoB7vMiDnfnr5FcTqtltP9CX+HZc/UsogOWo7FwMwT1zykruC8ERV82R+/?=
 =?us-ascii?Q?HEUBUwzgAwXVYDtEi1LM9uLA+4PJ3TtV1R6DX2z6FknIfiudzzAob82aTyVc?=
 =?us-ascii?Q?Csrw5CfHzHsHWy6MCxGXoNlxaFPrXfE=3D?=
X-Exchange-RoutingPolicyChecked: 
	IQ4MKTLnxILqhVRZqIJjWqf76FROWZNONjBLsmn7DNz31l60+9I0JyuVP2VjbCoOfknLWU08j5PVL4eDdaaJJFyWKsI78912eGV32zEK6yvNUnilBxk2ZSeduVlVEQjKGGnUZtweYXDiGTZgSqag5JhDlr0FIv7DgTePBEvoI193PdOQuJCZSykuPiB5lBFlJrsCYO5lao/E5MBKdQJveyL95nSwn3/kcCmeUckGkS5g9XPn7VADAdXy86v/zPvsXBrrGmDpGcdajHhYOpOEVxQtMyyfwvSUHMqWmfpi7wET0rOh6gTJYJhtHg5sOpAAFphLRoyQqgJsJQP6Tikn/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15db77c6-fc90-4143-f4ea-08deb577d8ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:48.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04U3Ym5ZN17DNM1a8rI3yL7px7LoHrJGr3kEckhK5VG16T78x+zybvuIuablg8wic5jYFkfulSsklm545aRJmrWMTp8gW8CtIRSHw3akE+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-ORIG-GUID: Wy-ICTDyGDMHX8fQsnabYmvzJHVeKaAb
X-Proofpoint-GUID: Wy-ICTDyGDMHX8fQsnabYmvzJHVeKaAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX9ksvSoF/tqA9
 Q6GgEZP6RfZ8ZjEVBLqofftVM6nHGU+NhU8VZJM2t/7u9bzE2n7Vvcgve67J9LcDKDEN5DrDtZC
 fyBwLv780ek/uLZ2tOVpj/FEEuCnUXYhtSpdZCIDKWA5nYz4H9X/73xEqRc09yqgGfVm7LVuSLz
 yIbpaRCh30NUCp2TQIOCQSLO2qv4TdLqPctxtxXkxaCGYO8HbSusGTATafgWJ1/5OVbGOevT6cT
 Gm7yKwLQH6vc23+ZA58j37ffU7THWnmVRwRgI5yOyRAAS72bG0EflX/zao5TbWtOZ//hyOV4mjf
 PnBzSJCH6G5lVsolAU/Z2iDdCq27/jtsVKFcBsQ5FVNHRlLhz/FED7SRHPyGuHD4BQUHZRi/MEO
 hW3Cy5XG0qKAq3ckT8Dy5fAeg1wbtH+YD/LH8jPtWlCriIA1DKut1I7F8kekTg0vV9t+ZY2H5mO
 1sx83wdro/qdUarFWrg==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c107e cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=wHz0Q9ddJmRdBx5sDyIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237275

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This patch series upgrades GCC to 16.1 and includes the required
runtime and compatibility fixes identified during testing in OE-Core.
The series also includes fixes for packages failing to build with
GCC 16, updates for libatomic runtime handling, and packaging
changes for newly generated libatomic_asneeded files.

Changes in v3:
- Fix missing Signed-off-by in gn and gcc inner patch files

Changes in v2:
- Add libatomic-dev to elfutils ptest RDEPENDS
- Add libatomic-staticdev to libc-test ptest RDEPENDS
- Package new libcaf_shmem.a static library in libgfortran
- Fix gn build with GCC 16 on musl
- Backport GCC i386 ICE fix with -ffloat-store and SSE [PR125308]

Summary of patches:
- Patch 01: Backport piglit fix for building with GCC 16.
- Patch 02: Backport rxvt-unicode fix for building with GCC 16.
- Patch 03: Disable automatic libatomic linking in glibc.
- Patch 04: Upgrade GCC to 16.1 release.
- Patch 05: Disable automatic libatomic linking during gcc-runtime build.
- Patch 06: Package new libatomic_asneeded runtime files.
- Patch 07: Avoid passing MULTIBUILDTOP to libatomic in OE builds.
- Patch 08: Package new libcaf_shmem.a static library in libgfortran.
- Patch 09: Fix gn build with GCC 16 on musl.
- Patch 10: Add libatomic-dev to elfutils ptest RDEPENDS.
- Patch 11: Add libatomic-staticdev to libc-test ptest RDEPENDS.
- Patch 12: Fix ICE on i386 with -ffloat-store and SSE [PR125308].

 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/recipes-core/glibc/glibc.inc             |  3 +
 meta/recipes-core/musl/libc-test_git.bb       |  1 +
 .../elfutils/elfutils_0.194.bb                |  2 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 18 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 meta/recipes-devtools/gcc/gcc-runtime.inc     | 18 +++-
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++--
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++-------
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 89 +++++++++++++++++++
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  1 +
 ...001-gn-fix-build-with-gcc-16-on-musl.patch | 33 +++++++
 meta/recipes-devtools/gn/gn_git.bb            |  4 +-
 ...h-rename-local-lerp-to-linear_interp.patch | 46 ++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++
 28 files changed, 323 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (51%)
 create mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch

-- 
2.49.0


