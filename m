Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80828C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:15:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3019.1753780548059323677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 02:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=030579cdff=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56T8TPTl018321
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 02:15:47 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 486tu4g1bx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 02:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYxLArn5LOUJalwII2l+oimFmy+gQf/sZGMx3ep//ZsF7O9ufIPyzsLJWrgUx798iZteSE/jXZUnNiZHAkq/Rys+3bhQlt/iFCNJTRJbhQb+S0xHZfEXpn4TW/nit6TIVnH/ppruOSUGB0Ecl7+Y05YaoYyV3eMd7p3ahfS3zKM4X1W/73E3SNXOR6d/8jIppze5GYTMjAuolb8cMDQMXm6CjuQNFg2r6lAV3hbSRTlYHbsvh5wa5HcIfRTsGJI/i706q13oduEKSbLC3Kf5y+rPqzYypL45NkDbxYCKtDkvo4ffJY23NRgso3RtPUsbUddgVwGzrb06nGAkwfHwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67bdsPQ6/4hCZYb7ciDELQRWCYkj5faJ5Srfz1J0fWo=;
 b=lN0xjIkkuhQhAkBOyugOX1LbE+6GWqFCX0Eq1CN5FEcNapw4jfzTv4NzWJmSZYSNVTzR3ihCLMjHB6F0PXul5ANJA+CfLbjVcZTHeyCB69WMkREuaEve2zCs8llR/+WC4GfZHlhYvD48k16VItjXHCBKhbxKjADXz1lGxKJYhqGWm61j50durVzfiJtvfyei1JefzJ0P3pGVy3IYihaDqWxFcO+LHk+EXbpoo960ANZ8q6Yx0c0h3vrQNsuZtF78+0IcnaBCcfxgPWVtppzHxlRGL077DoTbHWoqhwWeFh/UtNqsozvJrVByEsKE8DqCxPceNx/+CuNjst5QvpRFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 29 Jul
 2025 09:15:44 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8989.010; Tue, 29 Jul 2025
 09:15:44 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-7545
Date: Tue, 29 Jul 2025 02:15:32 -0700
Message-ID: <20250729091532.1911969-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 71512c9f-ff44-4bd3-76f4-08ddce807f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PV2p/DZK4DxN40UzJ9Fm5POHKtFOkbJnK6nN0/F7doiMOxBlBfb8b+8WrA04?=
 =?us-ascii?Q?TKmSR6P8iAMfqxkECPpWxEUQUcsN6bLkRJ0VBOXrmUZUP/U1uRHa0nWYwlfN?=
 =?us-ascii?Q?9jz1muQAPz80xi6DoPfz6sBdF5ZoTBBWydPMqCD13mKfD36bW+UACqk/gYN7?=
 =?us-ascii?Q?cOs3yqQqhV2ZOGgdPVTXfl/WatWSBaDHDGHphFB5MaHcGrEQz0P56D/mhd/X?=
 =?us-ascii?Q?HCpC2+n7ebhZLjx+3piu+BianXo5oFDQBIwhXR3XtUhosGBUL9BbccpRSBLg?=
 =?us-ascii?Q?sS/KazgwYU8dRQZmtwqTvPMbiZh5cDQQMNg9x5bZ2vwXy0T1EoQr2hP54Kzz?=
 =?us-ascii?Q?5Bs7oIEH3e0E8F9D2TrVya+2F1WA+SmFGn5r+hv5fy2rD3ffd/ssBS1k5zdb?=
 =?us-ascii?Q?DTeLkI2rJDMI4GpAUbWGzrVwt4cXZAdgUwVXXX3AMviRwB8GArnTS79oSGKl?=
 =?us-ascii?Q?6fpH5t2amEhQ1pksyqdJ3FlPrFYlGwhUO+YxZCk9MV58eSP4N5kG2MCCKij8?=
 =?us-ascii?Q?ONU5KuWSRWDVqDIvZAYXY0DTzHEzr6L3myA8ik28SrhWfrComN7LUJbdgQFG?=
 =?us-ascii?Q?jqaMUF3Isi3p3zkHB7dDeZssEwVxrx3hCgPoKgbE/9a97TnnZKX86GPUVvg+?=
 =?us-ascii?Q?0lcA6pvoG1J5zlIB/RuoH31ZZVGE9hPRd0lLewojEs0+/lXBIy37UpjDewfG?=
 =?us-ascii?Q?lWbAfrKRHPnlZXvP73ZYxbWCABCeHKEO6Zns9U233vI9UBKONTc8WAc14je4?=
 =?us-ascii?Q?0FbmANoznhpCQEocXVAaIzExFRjJFXoqJi5uUBGyQYlUoReqykehdYcetm/9?=
 =?us-ascii?Q?Hj5IZfHw2IveWFKYtiBY575QWPRBdk5TwV2k01MN8uJ+GnrgyNchrGAONpyu?=
 =?us-ascii?Q?CTSGd3wSHYGVQ2uazYY7F4hamd46nc4vHIA/qocDXGU9beOno5yJfCvyEcFn?=
 =?us-ascii?Q?Dm9leMlaDzRmJe61B4jCN1UJqlVGhxC6NTPKmE0uRK2QCCTm80273kM+jppT?=
 =?us-ascii?Q?KMDiBgpuxjFm2clcSeWNTM/FYWucKBsFWhYu0KdRbo4t7bviRtIW5o90LCge?=
 =?us-ascii?Q?s5fxqcwpT9Yb3br4lXs/KYsgkEIcorXuMAW/TNComYSAXnKeP/yim6QuXlIR?=
 =?us-ascii?Q?X2g5gX4v8q6s32uj2TBG8KIrJwYPI+ByWcucQPe/QKVeEjN65I2Qg770Vabc?=
 =?us-ascii?Q?HOZV6+lbL2ldQ6ZM4yv2zm9Wi5fyRSCPpiMt6UiclPybBwZ4D8bUOQWr8T5T?=
 =?us-ascii?Q?hZnSj06ofgCJBnss4Ectq3gP9E7GS+eVNSaPeLAQUaXBQ1gRNxkQvsl9dW29?=
 =?us-ascii?Q?a8w+Yrecz/v3oCgoi3r2OUhBJnQCxnpdi0lRh+hedJKB6qrSIZS9ymhM3Gx4?=
 =?us-ascii?Q?QkHVrap1R9PJG0nMwnPjb25m/RRvYly+71Rcv4hM3njMvnNaTwrshdIyMs+7?=
 =?us-ascii?Q?xVi6nRVPjMBQf1UaDempiiPpX32Fg9WN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nj0VPg5u/NlDKEwGCGm/diYXeWchQXhJ8PJpPv6jKT5CJeRvmuQdhz5z5s95?=
 =?us-ascii?Q?zxE1MiPZ0nSOYi5Bj6AlZ5vmwdrRU7DgX1P20u0ULX0pMoAzM8bvDp6e3ABk?=
 =?us-ascii?Q?PF6HjIOo2yPxczSixdSn20s2TUsiVoh8jwIjI/QMRpSv3B37D3sLBzzfpxE/?=
 =?us-ascii?Q?CPO51IyGJDp9i+5Nfr4YkZve/7G3u0BzeSx1YquqOG3uXg/SaTra7He4lLMW?=
 =?us-ascii?Q?avbSv2YLPoUhJk97ivmD5zQR5T2Gw6av1HdjjRyA9GPWZ4JOH25pQkXx0QsU?=
 =?us-ascii?Q?RUSjxtCzqWp6yw/7eR4VejvqWxFY1zsblk68XyoFMTDW6PDe+Kk3jGjlLMnH?=
 =?us-ascii?Q?mgV5lMxK3RHpJ4GDNmctrvynsm5su4xA8RpAI3jqas9oP0T8btcI9rxe9y4n?=
 =?us-ascii?Q?7sfxQ9Ef182cplSbs9RwQhcXKsgFJSHSdROGPe6MKu7pTWsH0b8idRuF7WFF?=
 =?us-ascii?Q?/HEdwlhpFD94xZuVXAx0Nj5QWCV35gDFlN+I5GHTS5BINbx/t+/OvlSS/sBx?=
 =?us-ascii?Q?WpbKYRk6D5Ih31hO9A/6jWQw5Nl52bbcIkL/ne2f1teQoNElMcnjhVfyvfKp?=
 =?us-ascii?Q?QgJcu5H423lNRA2S1sTBiQKU8RCV6TSs4MXjSzvvvKp2n3z/ILyrs64Atcib?=
 =?us-ascii?Q?ioL+hmPMutl+Ma/RMKyPrC63mHVsBQdyxe1ZCo6PEOLcnw+eIcdt2PfKjEfo?=
 =?us-ascii?Q?z24EGT6EWr2QidpJ9UPL85PqctuABOeq+tjI8YC5cTrPDmbSaxForrA9Tl0Z?=
 =?us-ascii?Q?Aat6EVsqBG4z7FCpscnGzY0ltRcluclz9TjXMJ2Tpa6joxNldxTqcpWnQyXN?=
 =?us-ascii?Q?cZ39psvANITD6Q/+f5HTtrv2xEqPR49jjrkvLBO+ISixcoV3psJYsM9bJbex?=
 =?us-ascii?Q?xhi3boy6pHMWJgs/o2I+hP0K5/uYVta3po19k6tMDShmJMJSEb3iN9ybAgPd?=
 =?us-ascii?Q?XEkCjxaXea2N+UHlb3VMEL+TwA07/vdoaam0VSZ13xzxEulnBozGD3V7Woq5?=
 =?us-ascii?Q?9RG09mw7/uYTZWLys/i1Z3sFHcwB5DhRr+x3SAB51DnzDQ4TfKyENvQkOquO?=
 =?us-ascii?Q?hnhc5vQigfSF2e7hSEVctusytTIbfxatUTIvx1j3LyTV41O86lAjyMDGMah2?=
 =?us-ascii?Q?cyFNDw/P43284qEGaSi9vn77iIIcGsBpTIZzwy7UNLKLGONoqfIRDp4QR672?=
 =?us-ascii?Q?YzQ05jbDmovqFjqtzPpfbNR6H7Z7LxrSYdETRk3IOLC7WpKO85TJzWwkBRr7?=
 =?us-ascii?Q?8UieYphocaicMhgtjYNx5ARy04w+IQee78QfLtMUtsFKhPCHeUmnG0KpPW0/?=
 =?us-ascii?Q?uRt0H8GM3mJJFUlGTcrgzonoc4usGVa8NnCta7YgqrE1+jtNFGohPeoum09V?=
 =?us-ascii?Q?KZYZbI1Ms36B/OZX5eo0EbKQLRCXB1r6AJVOmv45JzanZw8qcp4HOndYFCXG?=
 =?us-ascii?Q?cdaZD0rfbLPHUg1JtMaJ0C8nhE5PTqxa3hiX054I9dj21kT59MZdqQ86XIq+?=
 =?us-ascii?Q?gfeQvRJjq42lT5cVgwVC0JU/QqZPk0Mzg8doVwOZ4XAT957n2Vky1DP1ennK?=
 =?us-ascii?Q?o20z/r5tDKbhR4Jphq4DzNBcRGvRodG38dllAE2q/scskVgbiFn5NyMEtF4+?=
 =?us-ascii?Q?hDEUbAXGOhXgYiLbozoU5+w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71512c9f-ff44-4bd3-76f4-08ddce807f55
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 09:15:44.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zW+57P4NHNQuFew8DroQ/I189EI4o44cmB22kb+VCPe/pcBbEvvT3hhwgAouCClCN3IBTzl/0AEuSGtkcSdC75cJKLNOXPvRDWHAMVx90Z2PzmNHgPYA+lt2RRl27dMS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
X-Proofpoint-ORIG-GUID: ySj8wM6wp-EOe0U98n7ByWGdXBI_VymV
X-Authority-Analysis: v=2.4 cv=DvlW+H/+ c=1 sm=1 tr=0 ts=68889143 cx=c_pps
 a=YccY8Kzx3+W15EWE9sCpLQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=o8x1PyFA2OIQ-l2cK8MA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3MSBTYWx0ZWRfX+tcbqnzRwlCB
 X9KJcTiz25yTp14I7sebU8dyUFYqlDfyBuMJ5jeigYTXdNQG73b3r6MkgEWcdM2G9qjw5Tb0/Y+
 dtOC3TS+dlIhl5xYcjbAHApA9mmmPHXjVDPNG/a0N8Ya8+fgDOF8cmp9yeRI/Q7t4sxyk3bs3k3
 iCOXtrchI2We+7YKAnkpTwoW7m8yrr2X8TQdnxeKlTCXfFsPxgHQ3gMF314v5FBObBA4poqrdSG
 MdTTkvu3pCsZr81IMbZKbBPDA7bXmNs9zEZuA2r1UVKG6JyiNBvfVoIAGe/Uci4CVY0NiE0gb3l
 MR9sHGVK6SXShUSEh68o45AlH4HWH5vWRTk2HP73+oODMzjfCToNy6Eb4SsU0K14Ueh25Er5a9A
 LmnnwkZh
X-Proofpoint-GUID: ySj8wM6wp-EOe0U98n7ByWGdXBI_VymV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507290065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 09:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221044

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0043-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index e25f52e171..72e884ed59 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -78,5 +78,6 @@ SRC_URI = "\
      file://0040-CVE-2025-1182.patch \
      file://0041-CVE-2025-5244.patch \
      file://0042-CVE-2025-5245.patch \
+     file://0043-CVE-2025-7545.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch
new file mode 100644
index 0000000000..0019ac28de
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch
@@ -0,0 +1,39 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:36:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
+CVE: CVE-2025-7545
+
+Since the output section contents are copied from the input, don't
+extend the output section size beyond the input section size.
+
+	PR binutils/33049
+	* objcopy.c (copy_section): Don't extend the output section
+	size beyond the input section size.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index d53aa5c6..874f163b 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4444,6 +4444,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4463,6 +4464,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++	  /* Don't extend the output section size.  */
++	  if (size > memhunk_size)
++           size = memhunk_size;
++
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.49.0


