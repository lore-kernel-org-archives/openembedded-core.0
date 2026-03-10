Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF04FD4F17
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:45:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1322.1773164698772253922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oKBbfq6U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75297c066b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5o64T421581
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vPY997npY/CClSu4GW/5WqRLph+lVTvaaOWgSA1BLyk=; b=
	oKBbfq6UANDkHSa+WgGxA4H2vHGTxBPF0rkRtXIrzvr/zP/bE/FkV9BeNwgUXzl/
	swIWtiEIvvtQ+r06o3APcAquT46noE9KRUWJGtIypv3yNi1U6bYpTGJNIkIBl4b8
	wwe8U6JDlam/GSqSXnTxlqVlSclCuw4pdixVAsHeTgOWbfP29Mwp8l2Ys8dKnzNx
	7Bmdw6Qqt8dXiKVyd84YK10FnBbh5xLMGQ+WaEup5EeYR1eVv1SeKa6cXjTOTcsd
	R+0gvGMqnEpOvDgrnWVQZj7qTRLBqXJQXy3/rPFzeQUOaAT7pmr4ODhEkwkc2C3F
	v7Yvk9PV3YewZippysusgA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97vbses-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:44:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMQ7YlYTfvJZ6stSOatzAcJsj+Ns6oBLOn8M/u9KKCkUPMb9nXe27hc/8/tW9P8SQaAy5zR699mzZ8O+7gc9z0Vk1LBnmIcp9w7iMYQ8SfjU7oHHsKwNAaDM27jkKGkar0w+bWNd25gNvO8+VTFE/36d4Sg1h+Dvzo/S8+Zxg+5CFZ6QpOYovQnLdTphbn1ZnQjxRLSdG686gV4LrjSttkOFMkSE0Wf2yFD3Bor2evnW6Rzc1z5A3Jg3R5L/NM+qDHwrLi3vyKBDEuN3UP/Aae1cV4LxFVm/8j2mrPJvOM1+q3/L5MSH/nTuLhycRjUd9SaLTKE+xwAw8aeZzytmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPY997npY/CClSu4GW/5WqRLph+lVTvaaOWgSA1BLyk=;
 b=fGDP6HSgdYKuhTQrRxSfFlYLC+c2J3ZVQ8qeCHT6mKnCZ3pYHO+Nq5RNGfSkroRD03pidPXe6KG24Ky4+go/8vu3oYSMGvHDOBJaHhrP/RLRR8vD9rUf+VgYNGLehyd/pIX6EhqUE7coSg7bjqhXqJYAIC8YT+rgaCyF0DFFrNBX0j50MLZ0zoOIG4cqM5RIuENoGUUAYHRRahhUe0UMXQnsj+EyG9Jaw7DqxF3fcFf22iasXxy6dYVfYQiyEGRO/mtbSmPih00YskaH1490U7UqzYQQPl787K1RyIDIljqo6mbVqNjCnLeJ2C2jkgDz8+636E4JKmhH3/E+j1aM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV2PR11MB9538.namprd11.prod.outlook.com (2603:10b6:408:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:44:56 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:44:56 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH v3 5/6] barebox-tools: fix build failure with glibc 2.43
Date: Tue, 10 Mar 2026 10:44:02 -0700
Message-ID: <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0580.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::16) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b37308b-5a69-4f7a-9bf2-08de7eccbe0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	C9CnoKI4Jqzeew0VWruE7hjTRBqwfS70W9uvSs5715FFW/iWDAqomLHUD8PSK/MXAFlif+zV3PRWar5p5A5gCaQ5lyjuTYvKVgyYFA1L5C7ATUIXKfxGhkBXuM/YM0Y2w6CnHEZzZS00YQx5wPlRCDSH4BZQiLQO30IKSrQBH3GZYBM026EB5SLnrd+KeaXSJsGXvy9kyJ/tKY4ElC1eisRkDoKO5oMdx4jfTHKxU5jAbvZxzAUK98wz1suHzBvhhYfYirycM6q7SKFy0wHwKd6EtmpM5JJZgnQ2H/deWlO5SxBA3RsatPQyF1nFhOk0bnqJDsPEff7U6JnhRELOmtND9q1GKznk6bbEI4H+3SIKd+Va+3Ajex0Nb1nvmsY+mDEJj2SxBlT0Ujo4kGbfubxbt6RDT8GDasYMPvRdpjbNGRwXY1rf2VGsaN4ZnlbG+94OgXAjsctQLSoLOmTYYAXkMXFJ5Gkvft4Uu3PA9E59zWRJsaBNmcWFsjj7xqxeXo8Rlc48n5HLnSdygud9ZzSRoiZ4Daan07mPQLgfokk+7uIApXX6+TKciJQ1k9+DsqFfVH6CVJGDSqSd42LYY2TlaiTwzAMB1Jp6Qwvg5dlb6XCNup0HaPrm0Rj9VGXnpuXjQo5rdkBf52o3m+xw6WNXL/Z1kB0EkV9J4MY3M0GiPLrIhrZgac1iDC55KJCeH/eqxl8kiHQz85CLpJFTkw9sGgIHXClQMllv6AnlC8FZvg8IGYC5vqseAyi1InkjHDga/zyFPibwf5KnuyQqYqpItZ0vKDwvBTpcXGcx2Lg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?85lb4eAi8x43eMPPgy5rIlR1QtX3EHiOJH5YFtcsm3/TdOZrJxpSZ9f/zSKU?=
 =?us-ascii?Q?VSS5EOLlxt8tjF45TaNlcyFZkAXvRM9Ba9B0ivaIsyjx+2bvp9MBQt+hiPvq?=
 =?us-ascii?Q?ean3qWbiz0/RMtpAnpwJMJxKxtbWZGNKdifdRlbsqO4Y+q7j2ekBrl+a8k8G?=
 =?us-ascii?Q?skn+LNYfEAjgcD8c77tFX2wY/iXsFLqv57cRmMQSVFhebBPX+F+pbfrIksh0?=
 =?us-ascii?Q?4wdStWNRIhCiWldOoAlVS3LLYV7KV1muUnt62itBfLk489Z3n89tZ5GvTPru?=
 =?us-ascii?Q?F90muoe9saMjicfS0kdW8eNvQyIFuhMwx5VNysPjREPC6KwO+v/UjLbSUV7F?=
 =?us-ascii?Q?SH2L8gmwIOXDyygrdtTB/SQd6EQezMMKS62VQomPKr6whyoyfZGhkQeYVLkn?=
 =?us-ascii?Q?R3vc+vHxgwZmR+W2R7vJdBMXbWg1CKm6x7qgQnSZhHnGBlOhaqAEpF7Z3UgO?=
 =?us-ascii?Q?YugXSB1/dowsWvbNnk8YAU9VKYxQ7zcNErXYrUMFtuNsAcXOauuS6f5Qn+8g?=
 =?us-ascii?Q?M61wpZ5OxWcjCacneSG3w6JLMIGeQGAMoYOSD5X7Bk19jX5GFHBK0YxukdaS?=
 =?us-ascii?Q?Xd8UyIwO+tgF2caBuhH0qHlIu0OxW3IULL3ogoUEpAsn3BSl2lzdrw0h2Pfy?=
 =?us-ascii?Q?uIvhSFJjLjLrQevT6sLHLI2hFCJjQ2Uk5AT4W+rF/qXt4Yk3315axcWTelgH?=
 =?us-ascii?Q?Z20BpDiaIZlg6c49vJeNV+TH8o1yIFF/Y+eKOhNOTpE5LiTu3LXj5lMTb52F?=
 =?us-ascii?Q?aBztkNBnor25EdVLpQdrtlAoaY6cuMqNX/RUgSYv+z65Wi89oapcauovqGWY?=
 =?us-ascii?Q?EVyKCn32hNvGy2obJmrXVEC0alpFDnMCrzrZQQD8JsYwiAQAdpv6ndyTXDMR?=
 =?us-ascii?Q?Re1FR9uG8ZcNndRQmFUVYvStbYK5Xf/5fRCXP4OYXLaFzCFOSL9RcHo3NJSp?=
 =?us-ascii?Q?ISRJhbdC1LXWCnBXZc/BrHvRlEpIEH88vQLxeW6ZII9HQgamRawZfVM+xL+u?=
 =?us-ascii?Q?eqJsdL7O/JxT4iMxZtSaGHRJG6J1tlggniRZuZlfc7bGEjaiK3rWg4UGwNM5?=
 =?us-ascii?Q?GGIaMZQdbvVqqJbkOOS8BAlnH9LL+zK6uaAEZP5RXZlnT/SoOO2euflyLuoV?=
 =?us-ascii?Q?ZcLz2K644Yx8dHvBUWEIQ+/Dzi9w9PXyxhcVKIFF9iR7mPzyJt1DkrnvQg97?=
 =?us-ascii?Q?nDQcNoAgH0GCYpujXbKDOQy4w3abeQMinTMmdr3WVxARhPBQSuAnDBzdUF1R?=
 =?us-ascii?Q?FM2yL5OOSWM7fDQi2huthLqjVNZKnGsPLVZlbmcw7q7c8pwIIp+DTgpnYo0q?=
 =?us-ascii?Q?M+qXLOS+gVJeQcKuHvDpiJs4fQYY+9uDrIjQhQVzsBFzN7QfNm9HBE+C04EF?=
 =?us-ascii?Q?nHWzmH8yI6FpQW8b36aFrCjoecUUIDkVxXGft/LFHPUAaXh1CjsLICYcubH/?=
 =?us-ascii?Q?CNjxANwEhw1MHnK5yMMoGj+8HXZmTqXlRUNfmgpANEmZ6wPHRRosZjE03jFF?=
 =?us-ascii?Q?VH5GoM1xa10HlbnCGdY0dwL9CdzEQLgrWebaevK8x2h1GNKuB79/7BluyUoM?=
 =?us-ascii?Q?x7K+3NW48TwrfdGYpq31XVylVSAag9BOI1f0ZE9i2kOYhhwLgXhyw347R+L+?=
 =?us-ascii?Q?UR1sYX6j7yyER50V5p2U5ly1xdOHxsoVfB2qCPo09X9zDkY13tGgJglL3LfT?=
 =?us-ascii?Q?iPwcfB921Tkj4V+daROI3PgirLfH1Rbe6XhHsvot+Mny3Zltvnu/05AmPBCm?=
 =?us-ascii?Q?EJr+IJpb+5yhXJ+H2YvZN7qpDriMMUE=3D?=
X-Exchange-RoutingPolicyChecked: 
	AK9mXwfsoJOx8iTECS5XOTohJPQFiemz1QT8hkPvuxRcjPBy4VX+f+TPiiVOenNTmoBF2w5NkWUTLwXbt0AaXDAw1L0RRSRvMaiPx5uXtP1PjToh/TqkKhJFD7iUPaJq/cmzJS+AQKTV9hlKYRHL3CQI8bQHvHK4P9qQSUO6G8dQ+3vS7RwGDyvtxmLmZSUO5ce9xe5AZJiFor7lLkwvIePBul5q+hho8WsrvJAJgI2imKLyiDyIZTp7AWRqc/dM8e23Hl0DMssqOo5uxakPQ2AW1BKWiwKo5kEmkmxA2Hp1nzNPKpI1krhCbHvcukk3f5fFKdSk8UfPv6W2f5Z/MQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b37308b-5a69-4f7a-9bf2-08de7eccbe0e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:44:56.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 805wHgGNj4guOlh+x5WCBktk9G6Yn2AzHtmL+N8W6RYv6vOvnvkzouyASitGdz+vKS+z6zpgAuyANYejXb4nTBSHhgk2gt87/fsdDLTTT40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
X-Proofpoint-ORIG-GUID: 5n9nmWIPKLU0T9VxGaaW7_33C2kTo3nH
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69b05899 cx=c_pps
 a=1PMvcOD3Mx+UKTR1GZf1Bw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=sqegTYKcpFJ6_3p44j0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE1MyBTYWx0ZWRfX3hSreJT3Q9uQ
 mjSDPPpMgHrrBYK4Gss3wLr4QfYZ+T9yFL8QsQNzi/Igi88Jvitox3qw+SXqF/TTwAGv48xyVdn
 8VQHb57ePwRSP2AQmpPhIqqvNv0cdJHEl2nDSJL1jasgvwDagULOppy2do2o7++zEYOVnFMce1n
 vT4rc++JJAlOSO1A+sfKnankHJZxrReyeSqD9NGHkj1gNs6weLKIlXo1WSrtI5maTxu7fiz7943
 w/FR8Dk8cMP6GPD13m5BR3ROI5/rwEHyLDtmWYOCyWVAtrcf3RGVsBtFzX5L3i/P5ouCtWMoBlY
 GsTCn5C/u34/k+qaS7YU56a027ajlFNkhxQ4aJa0Eb9ymq3seOYp8kXF6VC2Q/7oAetkjJu279F
 Oqn46evGIlG5lxxSkJq+osk//06OT9ejplRnWlb2YZyZyeMTR33D+p6RDSWV7rVO2ND4UCYZVqs
 L/FgU1/wPOnYaEVeCxw==
X-Proofpoint-GUID: 5n9nmWIPKLU0T9VxGaaW7_33C2kTo3nH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232805

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

glibc 2.43 introduces linux/openat2.h through the fcntl include chain
(bits/fcntl-linux.h -> linux/openat2.h) which expects __u64 to be
defined before inclusion. Move <fcntl.h> in barebox scripts/include/
linux/types.h to after the typedef definitions to fix the build.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 +
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index eb327306d9..1459f48db2 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,6 +2,8 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
+SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
+
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
new file mode 100644
index 0000000000..2ff7cb82a6
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
@@ -0,0 +1,43 @@
+barebox-tools: fix build failure with glibc 2.43
+
+glibc 2.43 introduces linux/openat2.h through the fcntl include chain
+(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
+__u64 type to be defined before inclusion.
+
+In barebox scripts/include/linux/types.h the header <fcntl.h> was
+included before the __u64 typedef, causing build failures such as:
+
+  linux/openat2.h:20:9: error: unknown type name '__u64'
+
+Move the inclusion of <fcntl.h> after the typedef definitions so that
+__u64 and related types are defined before linux/openat2.h is parsed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+
+ scripts/include/linux/types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
+index 5b01333..33cea19 100644
+--- a/scripts/include/linux/types.h
++++ b/scripts/include/linux/types.h
+@@ -4,7 +4,6 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+-#include <fcntl.h>
+
+ typedef uint64_t __u64;
+ typedef int64_t __s64;
+@@ -15,6 +14,8 @@ typedef int16_t __s16;
+ typedef uint8_t __u8;
+ typedef int8_t __s8;
+
++#include <fcntl.h>
++
+ #ifndef __linux__
+ typedef long long loff_t;
+ #endif
-- 
2.49.0


