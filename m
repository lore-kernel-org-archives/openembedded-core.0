Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D839DF33832
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:57:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72296.1773741445420170831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cc5+QRvD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75360f6290=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7StcG1504384
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 02:57:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=IuzwjkbpE
	XTsy1rT53J3GNgwEXQSUNtVBhBq7NAdowo=; b=cc5+QRvDpFoK3JZk+B0uNjxCX
	lemJ25GwuPQyE43XHzaONSC7QP+lvMZa4p9jhVfajfyvzDRpcAI0K89ehpRc83G+
	fixfcRMuUhWffcbzWiFm1/CBX22Rdqft+skME6TJvsz4Yicz0J+Bw0rY9XXJpwl3
	QIcdAMW31JAQ70F743onlXdZd+1T4kv1vFmT9CuIgW0GAerg357rcgHT1PGsn+oZ
	VophVBT4e2INEMiaFyxsE+CWyVgih0+5yPVQo9d1lfU78sTQGeZ1+snFH7SFEZM/
	3bAi3YCFK3aCMDkjG6ev0mL47d0kKZt9AmfdeozQ6z3pLS90eApeTVJGj0cqA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y1303m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 02:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8PCXhGRa427NXQh6AqKcVK5ou/wyj2AoerUvMj83/wqykkgk6cVVjC5ttnXZzG1ZnYur/ohKOFsoSizKP1Bq8wbM+NrMjzZfeTmGz8zajAfE5shgM9/n1whQlvPrfTiPvy0+9qnsVn/WFnz5CCJp65vK2l7SfDJ3J+Gb88akhQGZiCD0rhgnK5j1yB9S3bJ6SHx+8yucjfCNmAtjc3+1HB8esbQRd0bxf4S/F35A+Rmxz+kbBd4P/xCppsfcVZOx3PXXhBd3/BcKyizic5f7lv0PaUWnF4KiFGrK8INGcHMyrDPKVWIKmx5qsCc7BaZIQze2sOPdEZhyao97Gx4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuzwjkbpEXTsy1rT53J3GNgwEXQSUNtVBhBq7NAdowo=;
 b=T6flfEp8MtW4I9u8fnGSqoYrWA6hOnheR8mt2NdmSDS0/pBVmElKwtJww+Wqz43e8EH5jANo7IHxcwGKDpspICpc0Goevryd1LqSB0qOQTcSftR2B83RJhtJx8ZuzfQMy16Pn/xvQudGNF9kbhjRDDjAgn46DmTqiZwA2+O40qKsoecRBf6F0azYVSnVkm6P8oL5FCAzPF0I+Hiq2Lgp2RiFTooIEGWF90kpmWTFT22xkAfXhxoUAz3cioEH7I0tMEo2WMVH2OpE0myXFqzSp40kk4NFW2pPn+Umr9Nvw+mVrEeSnXyxl0/4bic5ckh8v2o12/eMX7yVm2lrE5TSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 09:57:22 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 09:57:22 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] barebox-tools: upgrade 2026.01.0 -> 2026.03.0
Date: Tue, 17 Mar 2026 02:56:50 -0700
Message-ID: <20260317095650.990672-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0574.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::12) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d23e932-c5b2-4dd9-4ff7-08de840b9554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	mPRe96PK8lyFwPtUWTg2hfiR05jftAEBYfN7MNuD3JsEZCQmSqewtYb/vh4UUmtpSemiiSWnJRKr4U66z1DmutAauLeHTPO0b02cYclYcTp9iqHKFbOTWbG26N7tEPg6P5A0HrRAVsKDZ6yQOsvHTkzIHMdt7nOZ57B7LFVvGB6Kp3W7gZzNXsB+xTjUIm4NcDiKM6QmLoZ/mu8RNLnv2rMqPF9nI6KSBAJLnC5Vbk1r/cBWck2qp7BZOetF1M4mqqxdyuU7VEJMQtIRV9MvZBFQxQ0fAuKdKoXJa+77g7ct69mnyXtAtSOD2sIQENXEHwxWEiQpaNccZK95tEmJSbhQaNbev+0qZG3MCZBGQ93jFYBAtNVmnlAbVv3tWIpvDltoxBDfTd3bEtGrYThV/tBmYfWo12ItX/RAq7RVO5qGAZDBcwoK7pSpNeaZ68XrDE4ADzwzUQpkdR8669weftdId3GcKfzLrr8kQdkwFEjEi6IguaS2tV1PaqGVWCY1mVwqw0mTO/vAPIGAnT6+BL/7gA5k9K5VGuBhaqY1v/lsHzxTPGEORIRUpUH3wFRWxnIa+dIsvWVnVi4MUwwu3kfIXNmErnEhQVcad1JiDHke57Q10n+PGL96E0tdJI8/2dwrRd2XZWyxez8fVO1IGvHvfb6eXFui5OZmd8C29wJQBrUyrshkgnP4SRf68ggxbJa0oPDGhOArWjR/Nwx2re5l5bOIgJypw0Yf0dJ3Kk2Ij5jG2IBJlJG3e4Q8T+v7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hESFSvKVCnqPGSt3dVqpwyeWqKo8H57OTC3sLZXPmmdCZsqmNEi/KsgDOmPX?=
 =?us-ascii?Q?pZX6h37yrFtUoVhiqta1Jxac2oiZryV82hvPxiKqi+BoJ51zgdykUWquITYg?=
 =?us-ascii?Q?8Ka1QGtEVVqGD+6izOQIfDj21izlkQkwA6jfoLuxrDjE45TkMre4gzSs7NkK?=
 =?us-ascii?Q?SareSmr6pq+Nnp6apXeODER2brKMlg1vFLNbqEosOZ0p/TwyGOG13W0JXm1o?=
 =?us-ascii?Q?l6eylGYGvUdr5qYLMegnYqfM/rkY+nhxpWlrmh4Vh8M/MQowhvcmv5Vmsdnf?=
 =?us-ascii?Q?hon9+UUaGhhVbjrvm0nhgSgIdC2S1dlAsHQ3AsC9/udrG3q1itMtTWGr1YNL?=
 =?us-ascii?Q?YSP09+Ye+XYd2v/8pPWEFazG6hsayRCVXmgV7rPZl6mYuQlBEKCYzOGPqq6M?=
 =?us-ascii?Q?uqDorXZjRUlWu+noNrRmha6m65luFPqifwfNJEOjPAyl6y1EROFs/8SxyCyi?=
 =?us-ascii?Q?vcG9CDNvq4eXsYWCL//BwxAkjmGjfH+O+cLTK/dxMtMK8BPtGIcurF0IorfC?=
 =?us-ascii?Q?/8sdnOsaq09Dsx5GO8R8f3q1qB2ikksvqfx1lx9j2piclDQceNL7FInoV+IP?=
 =?us-ascii?Q?Y6XW8WztQzx7hVdmOIbi26xLB3th+0COkVJAUC7gqtRT6f81jIgRgmtYWixl?=
 =?us-ascii?Q?H6IzGNroyIlM6UH+4myXMHegPTU8qAq23tI9yPaIA9IMdKW1QW99fbYPEVKH?=
 =?us-ascii?Q?CzaumsgnadHMn33C6Q1bhfGq9mSwvWq8BINkgPCUEtbRC+E79D7v5Uuk39zT?=
 =?us-ascii?Q?IkwRS0dgF6Sc4QINE6CE6E+/HHhtCY1OQvIHeFDuMP3XNZwgCtk1XzUqDJKA?=
 =?us-ascii?Q?AvAd4Mc/N8Y4NAVcUqFPTSwTQBh9H6tzoc9j/TpMg9NJbfUq/5GisldFCF4B?=
 =?us-ascii?Q?1bUrQcowCP/plAY3yY07QfbYPGhr7Dhyj5jYT0s+McB7GTl3VXGZbWUc4hNo?=
 =?us-ascii?Q?/mD5fbKJWPaX6ZXSFigGJDtwiauuOrgIZBTdTOiGxPOfJAyNcTd1fM9PjoDl?=
 =?us-ascii?Q?zxbZRY1PQP9aIENxTW8DeX56KaeUogxX1daFJkUo33bA5d99LknsUaDESPnU?=
 =?us-ascii?Q?8Z/26tHT15OjgEgSCDiLyezg9rhd116rwb09yYTD6VtWF0u7Vl2EJYagtqi3?=
 =?us-ascii?Q?uRD7/6fX3vRDNNjnHyYofDfsJFSZSb9vgT6zIwBFyWTZMkGgGvTtHNvaA2kn?=
 =?us-ascii?Q?Ua1nEZfJPese/QiibwrBVAlWqEToOxVfcv2eVLu13UNovtV7hZ7EM7ZVft4Q?=
 =?us-ascii?Q?BozS85xvn+XtA2g26APQyovotnykdXqEDBRljfWuBrZ1QfW+9RLOhGH5/vVx?=
 =?us-ascii?Q?bLs1tzL1dq/3V2J0Y9a64XJgIvgH4eaH3tiBsoLpLDr4t4xhMIic1jF4iHkp?=
 =?us-ascii?Q?EXi0HYqQ/mN1eDY7Nfg+MdggXuZClxS+YQJ0Qs39OiOjeWzQrx61FB07Oup7?=
 =?us-ascii?Q?2nJfkwD7nMXkjsNVTZEpUqXTYZP9aAudvp57e9mi9NnO16SfNS/zsUUmTKfP?=
 =?us-ascii?Q?KUkLzuV/P09wyP/HeF6iHCTvdvsN2W/XduLQKTU2yuZWgvTdD9WfOqj3ICp+?=
 =?us-ascii?Q?OqX/KHX1C6cN4kMPdxz/AaYiSLUEoaxxGzwuWIusYiPi+GVi4Z1yqw7jgGaz?=
 =?us-ascii?Q?fzEQlJ7Uus3awu8TeXeJinNMBiBbs2ieIutsY8xxHhVbkbdsMUqJAXAoIeFa?=
 =?us-ascii?Q?d0L10XrRakfzlZY4VkyL+coPNH40hD8XEqEcn37ibqg7MYpBqZ4swvEDFVvY?=
 =?us-ascii?Q?6xwCba8KiXQgGCdvGE3nJoPocKPraOM=3D?=
X-Exchange-RoutingPolicyChecked: 
	gDF/UdnmNvZgn6tL/n8qIbjzc0S2i9NFfQYr75xiFijKGyJ9/XbRP2hUCrEO4gCWdDyixDYYriL6W2BLOZj5ZTnBoBAImTGFUkwWqQ4eDw1wgYTZSVKZoLXb0MdPskK6TwTCrZiGKi9VNkRHSKls6nrkNir1G6hQp/ZIXvrYQxlVUuxsIbkMqMpm2Fu2ju4cutw2OVM7CoGdeZ1DN3R1nVTuBmgCgYeX67vRRWQifMQRVWXtbhabA76mRw4vREV8ULiNTzTHRqJHIc+VSsyo1Nx69f2pOD1DzaLB85+xlz19xufgWnUvMJbpRip6FRmX/DnUhDHVLPSVsqa9DPLhjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d23e932-c5b2-4dd9-4ff7-08de840b9554
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:57:22.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTiCW4FVEro12lXCEd1o8aN1FeFHvh5nLPfod5Z2DAd1vcwLPbAW/V3l8G7GpU67n4ypmjQcRTYWFMHiljXqnmX+9WwA1cl/bmLyUsEheqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69b92584 cx=c_pps
 a=ZfP+Ya0swgQO+W9lSFUZ5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=nTWVe4aRAAAA:8 a=t7CeM3EgAAAA:8 a=Iil2exeA2RwXTvETjisA:9
 a=OCs18tFjoTMAgHLyVtgT:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NyBTYWx0ZWRfX6QG1kB02J8uG
 tXmX8RLD+MeP/lpJFT6nM32UlsyJtbioa+uurpr3iwVOAMBBLj5jJiwtMRx3BNmrJZ+/xei25F4
 axha8pvHePmb/QM4VoQMSUBitdTVDRsI4CXgmic5Ex3zQ/LZbcjDsEa1qjhyMOrcwcZV4tsYj4y
 hMLOsvNCYkjPuv0wxELeioazrb2oDewP/qhQ9Itp0Fp8p6lrsD6LYGMPzNdbwzwwpVBmHTi2jXD
 Ks9O3JEls5QrzaGH5xyx9hshZUqJnrLClKmu9b10pD/otO06gsZNiZGIp0P5vNlKhIhyj0LW9po
 NmLnwawIQFrvOqmwK7odjK5tNPrduq1dGXbY6SBQm7OketbeDi3tSDIHW+a56fNcfNLex2+Ptw1
 HlrZvHTkpvhZhfWkvvjF5NQwWcs5LAPjfrV4tqhrmmIZN8um8cAvbrLpTPn48nwrRd9xgDlxeEK
 TQ5E/ajFTQCHcOYXvRg==
X-Proofpoint-GUID: YqSonb7OPQM3Rut71LXysEACTN458bV9
X-Proofpoint-ORIG-GUID: YqSonb7OPQM3Rut71LXysEACTN458bV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233311

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Highlights in v2026.03.0:
- Security fix: signed FIT image vulnerability fixed; users doing
  secure boot with signed FIT images should update to this release
- Added Rockchip RK3562 SoC support along with KickPi K3 board
- USB Fastboot now supports booting Linux kernels generically across
  architectures (previously limited to ARM32 zImage)
- CI infrastructure gained PowerPC Qemu test coverage
- ARM NXP i.MX8MP: Fixed SoC UID incorrectly reading 64bit instead of
  128bit; enable CONFIG_ARCH_IMX8MP_KEEP_COMPATIBLE_SOC_UID if rolled
  out devices depend on constant SoC UID

For full release notes, see:
https://lore.kernel.org/barebox/abQ56zuKfzKlZvcr@pengutronix.de/T/#u

Dropped a local patch 0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
as it has been merged now with this release.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc   |  4 +-
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 -
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 -------------------
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 14a5ca9709..17cfc25692 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.01.0"
+PV = "2026.03.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "219283d67c5d2f79bd22915b8a71906531223cb01e6e5b8d1658f299441e4169"
+SRC_URI[sha256sum] = "760f22ff34ca00539d29826cce07d83210e41ebb51266616c6969b855c099bc2"
diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index 1459f48db2..eb327306d9 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,8 +2,6 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
-SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
-
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
deleted file mode 100644
index 2ff7cb82a6..0000000000
--- a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-barebox-tools: fix build failure with glibc 2.43
-
-glibc 2.43 introduces linux/openat2.h through the fcntl include chain
-(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
-__u64 type to be defined before inclusion.
-
-In barebox scripts/include/linux/types.h the header <fcntl.h> was
-included before the __u64 typedef, causing build failures such as:
-
-  linux/openat2.h:20:9: error: unknown type name '__u64'
-
-Move the inclusion of <fcntl.h> after the typedef definitions so that
-__u64 and related types are defined before linux/openat2.h is parsed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
----
-
- scripts/include/linux/types.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
-index 5b01333..33cea19 100644
---- a/scripts/include/linux/types.h
-+++ b/scripts/include/linux/types.h
-@@ -4,7 +4,6 @@
- #include <stdbool.h>
- #include <stddef.h>
- #include <stdint.h>
--#include <fcntl.h>
-
- typedef uint64_t __u64;
- typedef int64_t __s64;
-@@ -15,6 +14,8 @@ typedef int16_t __s16;
- typedef uint8_t __u8;
- typedef int8_t __s8;
-
-+#include <fcntl.h>
-+
- #ifndef __linux__
- typedef long long loff_t;
- #endif
-- 
2.49.0


