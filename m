Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E31CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 10:02:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39442.1781863335444874708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 03:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ug199IuA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0630244f91=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q8Cm2347420
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 03:02:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=InVBk52+n
	0uCmEoNYies0XRo4MlZsQ7XKAZH3BuimaM=; b=Ug199IuA0gWRHyS29rFYt2mII
	KIT9XHS+9K+b+hCWo0JTFJL61lSRHvKgqdKBvGExTQeNccqNS5Vk2MNxrRcdYzor
	QP6gfmNqhfrsrPKL4A9FyNntIggSjlYw9ADI9Ai9qrn+6F3QdJBrVAv/4uZ+ZtTg
	uq0JSED6xeuQeocQ7ycyz3JNDkLA+QKaIWyuUVI74s6myvhNlnOHvOXdruU5dQUs
	Vr8+jwoGU4Hcz9FcVocX/muuN5qssc+zRQATprf1NgXGviF+P2KWpIcOTAyEQf6v
	lJ72ARpxVzSyrWDoF8L4i2mntDv2n/EoZBZPSA1goroeey2ZuRoeJtEVlGJTA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eueft4353-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 03:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRwrfEukIyPHBSDN/Hpvx0LWZB5dtROD1mOgQAOk5/pV7t33mITSetIF7WX+rQWTtwE9ffdREQAEDa0SzLxKxSjL/ys58rFnyBgPkQinwfz5L7D6dQQqFoX5FQVDWcE1PWHOlITj0iEIGSSJ6vAPwPyAuIgnAvENpqbvP12BCPf3zZ94QZr/yJQFacnGPGEsefgk/cuB8WSjL/lbDsOhy9Jarcwn5SyGi/HIOb04JOPCdsbdpfF+scntMmIXpXXdmHV62hVURJ/Zrqk50KSh69ylZCD+4+9z8TwN5KY3vBUBfNoyFM3Nnwdt2eIIGIAkW/Bag+HLtcKihcsNOpC9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InVBk52+n0uCmEoNYies0XRo4MlZsQ7XKAZH3BuimaM=;
 b=fMU3ORJOFJH5u/ylFN1FPwwY3Xuoh1TAPgBo+1bVvCz/Ip4XCZ164dtuDZZz2qXIk6JrZTXVQOmOVoGcPc5sCJ8V0CtyXgSA7LuagMQppA3i0W9TD1qQoON69AX8ZOAL0e93YwqHMobeAHUXbZ74mOhevbOUrH5Q8R3C0PdWhiZkDe3ZQkVMpgBMXALdHvDCesWSWc5gO+fPfUpNsMAYI7gilBgh5D4UhdlV9zjvToocpQHPoBtDbBPdU1T2be95vntNO1kF9m2skXx8ucavBlNKtadTHThNsCKXdr7bHkroTsqAdEEaz2FKHaWkrjQX+YNBT8YydBjo1Em9cc96Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:02:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 10:02:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix for CVE-2025-69648 and CVE-2025-69646
Date: Fri, 19 Jun 2026 02:59:07 -0700
Message-ID: <20260619095907.3687727-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c8b272-4927-477e-7642-08decde9d12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|52116014|3023799007|56012099006|18002099003|6133799003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info: 
	AQ37NnqmyNjz/wPtQ4pyy2kLTiJEE3rHK3e6JiXlxgGzL5FND8PwVZOfIavex3FCrqR940AiUDczsc2faJvNgBu7lnnzlABG5GIKQRJoUccjgRGFyvNb+3Vwj/a6CdCB9OYNJUHkvR9HcuUtQ21vw35Wxic9KH+qQPmZE2pR0TGWYVMgHyCMbvqEGBOv1NXF9ubIfQmNiijdhsC0rTsOevjoE8g9uWwFYoOTrxDfnxPU//ShaKTAXRIpiJcT7JZJZnye3l3A7pPJgHCf+hgPp32B8fJaBRF1WlRGqE0W3Ao46DAusdwjHK9bYpM3BZptmsFoql4+GF3DoZ+Uw70cw3JwC7LnEp/5q46ZoeZhoLCxmuODehpkzRa/nbXyYnaqMnumPLqwkZRbmFMmnnJIuLwZuSkulLpw366DkrofbfSZaSsrVhJzBwG1T3wkS30IaILpc+axXn+jBobxmUDEUJ6CMh6ftSrXgEIS02/gMOyKS6Vpikfl7LGt6vYh/dBwmtC08mQCfhs7UQhF0qqa30UocYp9LAV6DME/fVIcrQx9Wimuodw8Apk9C13mtlY3WszW5nyGmGSMoAMq9ZbaRu+Q1yWxTW3d8nMw/AlJJ1c2sJdOh8PiS4tEhKoJRzh2O1nOr0kjKimlIjHoFjd3ZNWz8FUvmsa3F1E79Rjqm5o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(52116014)(3023799007)(56012099006)(18002099003)(6133799003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pfjgdIugeckDf9ejAL0R2uLMqk4vkU6gXTadKt5vfcWhqsn9sd8wGe5v0BBp?=
 =?us-ascii?Q?mGfn9fKimvVHAXqXpLdLvkIu9/zY4sLuNaLifyUftQJokshitKglTFNXr/wj?=
 =?us-ascii?Q?MZco1oeHz6lHl3tOGRehFCiZkiCsnosq966y3DcJ6pASqxVG+2iHEofU/Gls?=
 =?us-ascii?Q?Nt8wT1FTY8TA9zxuY3uRDsIVWE0c38q2XhMEy9bWx2tLRyaBHNjDXCGGdNwd?=
 =?us-ascii?Q?8Hjd/Zu56cRA5A4B5V4sYSV8U/IklzDx0tfSrRCLAC/jn4CX7YyYf4oZwJ0p?=
 =?us-ascii?Q?LQvwMwjqYcyf/pFNjsa+xNwGJcTOhOcKLUuP9wXKEqMB3gGIdtskw0s39EmJ?=
 =?us-ascii?Q?1HCDj0Uz0mLj8FVItSOGKpP7mAtIzlQNcbtExtpXopHLzKwzfblpFG6pp2Gd?=
 =?us-ascii?Q?FfQT4WSA7xNoXw0CCnk32XU3b0SI9rCSWZ3GlvACdkRjvIuGdVmMZz/SyYRu?=
 =?us-ascii?Q?TiEnvfH73S/Q/CZJNmUAVXlHxyPdlO/K7OwITgF2kBoKslnKMuVNS0eJdgGG?=
 =?us-ascii?Q?X6iHlVJ3puyCFr3bgvfQ308ZgvzTPQm6Bzw1gjJdrY1FE+C24qsIk8G96Q5P?=
 =?us-ascii?Q?RY7EDXpSo5jnclKzAtIjWnKjf/2IpUYcRYFMC/EkpMkmUXQC30bWctuw4K/g?=
 =?us-ascii?Q?oIGu/cjRoMdBKz3EEB+xSWsPtBUt/Gpf3jx5dQ0aTWk3FwgDzc4gnIx6W3Jq?=
 =?us-ascii?Q?vkHvm0lmBnXLRRaEexrJyFSzN3xJbLMZvPzSqy/JBiZHQM1HwiEDOEJsvr29?=
 =?us-ascii?Q?/MYcg6xGAq/b70zgJhq9ByGa131I/nqEn8syW1H1MdfQGUnrJLXh4OhedXwK?=
 =?us-ascii?Q?+x47Fdapsmh0MkC09//Hr3dRAHrjMOV3qwMtoWSUIMmGtpw5WDnku9kQeeCq?=
 =?us-ascii?Q?/ggvm1M/bs7QJ1kQ7qOkP7rKnAtW8gDb6czO4N0q1fa6fEiBVuhI8wlW53gS?=
 =?us-ascii?Q?Vuxv+KN68nc01ljUFi5jF0UoxHxTsblvasWc2uo2qfgEgjuP2teEuzm7AiNS?=
 =?us-ascii?Q?gsfbaV+hnYk56oXc/G4qlNvlFdE366El8wfElH72UgdvoF+ybqIhDziIkNhp?=
 =?us-ascii?Q?SBMU/dVSXgp/J+DINjhqqtEcBHk5uJAj82L4TiLBq/QDbHrA+z+iCHo9xapz?=
 =?us-ascii?Q?PSfdjrQaWcEbkNYu3sva2pEj24vdAeKIXmIxY4dz5TOcdlS5nQzcNaVPsDfZ?=
 =?us-ascii?Q?RW3PNayYWLxJBNMzGHHrXEhxry0f1qlfuyqfQokYrtUpz3AYFA953oD0Y/ic?=
 =?us-ascii?Q?8UzqeR9PKNkxyw8dgOsu+eOQ6wQfqSm2Bp1H8s4VHhUCWqm35LfreBZj0ay6?=
 =?us-ascii?Q?y/C/GWzLu4Iz/6vUMOwNOvLunL77B0Q7Bl4ziVU+PGiHbBIWI7gM5tVSgyX5?=
 =?us-ascii?Q?lx6UiKDXZQq//RaibVqhKJmLqgDVn4Shcb14Q/gwcsT+JdEUgLnv08XSCtWa?=
 =?us-ascii?Q?LKt2eI5S2IzbkKdIGgBJPl+BMe5ZJGIdvxabbjzYsPcoWxO6Si+k4rUGC+J0?=
 =?us-ascii?Q?ewZVCVnA5VU0gnERNr1d8gExzltL/ZLJHliqySh3CrIftNPPlfE7isC6GeBI?=
 =?us-ascii?Q?90tqg776vbTtxHHaC8e4B7AZnpG484caGH2QAKEEuL0cizYzUq/lx2IQ7rON?=
 =?us-ascii?Q?CjKAYfXJvEaD2MlOrKoeI1ZEJViHRp0IMooPt5TVnanEiGnhHRYLU/tn7/gD?=
 =?us-ascii?Q?ArjaxEmqG7UxcjBULYXUyYFTH6h52XkFhITfrUw41PbC4IZemad28C2RXzg/?=
 =?us-ascii?Q?IDNVh+Kp50mN8lgQ+2Hxxka7yf2ss98=3D?=
X-Exchange-RoutingPolicyChecked: 
	PYZWioppqaHnivC6p+20CtY+KcWFxv6P91VEHmStXYSvtVewpWFdugvU+q49b251hRgZ5LUMGqEA74ljgItFkMGu0FXKEMA+RUZCOm7cKQ0ZtiX0Rj6nfYOAUfsex6ZpXe1u4deUztvwEVF4cJSp39OeccolBCmEY1DYKpxBqHkNFZYhKFqy7mhzUiswoJUuX8gWIhT48u9dN+4q1KGDoKIzKSdsl0JEWbTs5uEbf0g3jpRHm7a/J0TtoyIVpyOLjrCq3f0s4RiOrse/L1yZKIA08/2MKSyP26DWawktiw6o1M7DaqdsmcK7C7Z+rZVVsXqwmzazwDcqrrk7b7SY5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c8b272-4927-477e-7642-08decde9d12d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:02:05.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuPvejYa4W4YhDPwOEAv/3oGd19hOYEOyoEoZCSkWLz+lzAlffBg6fGBaado5TJxC/7TXJae1Ifq5gv6ajKHvhwYU7/Ex6HCJ8Isa8Y2Co8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: SddTeePKAIc7_vUpl0ENYZsvuhSLV8Ha
X-Authority-Analysis: v=2.4 cv=B+2JFutM c=1 sm=1 tr=0 ts=6a3513a6 cx=c_pps
 a=MYJxclL+TLfs1lE1Gew55Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=RxXRFDq2dMWh8urb1J8A:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o-dQmXmPn3C1pxtD7IQddLSIwseOak4z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5MyBTYWx0ZWRfX0LZka/sYgbqk
 9SHGhV7mwsaBGYQIeOnRr51wH592t5ITczjL6zD8lGwaVc3iCbXdaOp/hADI1wSKKuQ33YZGyNl
 5x0ZyAhchFBsdkj2pDxWoiyeyP9WWD1xIiPXQBBf3j1q7PW7fnRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5MyBTYWx0ZWRfX2wVKV/2Iiis/
 zaT+tW4KTOne6FE1jlRlvAIzO8pfh6AutI1pUZmqo3QLZho1n5a0AdVMF5eoXlJY2rTiPSX4MoC
 9IdAZ4kjkSDrRnQ7eChm8yXogp2r4GabUI2NM1ABX0+LwoLcjQIZQg/dXk91OEayV20ofywTh0H
 0SySCvZBTvdSc+8AYzJQsnDYPwd/QQWRQghRJJBE96T1fphdbOltdhd9epaai+rbBy/Thac1I0F
 C7JGwxPbkDGLF0mQ6FBQcQK4VnMT1AgoJsIIvCcFUDJ2U2jmbNU1iy/A7mYh7svZZ/VZfIRvBfw
 nt8/p3ITHFz3xK7ksJIdSDCGTv1zE7+MY2vrkBvThhCWVbEumU2JBJ871voztFNdzbWe/SUCKOE
 MpJDqkkOF19JjfljIUj0SejUq1oVCbmanYGVg4LbJlYzHvubA6IB69858QBYv3NqUIsfCa5Bonr
 e1C/SaH9X+L/Y6x7sIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 10:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239158

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
existing patch already fixes the issue associated with both CVEs.

Rename the patch and update the CVE tag to reference both identifiers.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc                | 2 +-
 ...CVE-2025-69648.patch => CVE-2025-69646_CVE-2025-69648.patch} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69648.patch => CVE-2025-69646_CVE-2025-69648.patch} (99%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a865c45f4..96e9e6cc21 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -73,6 +73,6 @@ SRC_URI = "\
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
-     file://CVE-2025-69648.patch \
+     file://CVE-2025-69646_CVE-2025-69648.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.patch
similarity index 99%
rename from meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
rename to meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.patch
index e04d7ed6c2..b02b5e0531 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.patch
@@ -19,7 +19,7 @@ length field.
 	(display_debug_ranges): Check display_debug_rnglists_unit_header
 	return status.  Stop output on error.
 
-CVE: CVE-2025-69648
+CVE: CVE-2025-69646 CVE-2025-69648
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
 
 (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
-- 
2.49.0


