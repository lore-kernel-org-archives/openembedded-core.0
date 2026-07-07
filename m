Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ACCC44500
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.170139.1783414581284249028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MvFyj8KZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1648a4fd34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678GVin1133882
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 08:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=IuhS40CKcELOH/wWWrTE+HaSVAOi7anIOgm1Vo+aCdU=; b=
	MvFyj8KZ/vpjjCyPXWfy0E4aJx5RqJBivoKjNrM6tklpIS2S+4tUHF8GkoXqLD2i
	5JUxI+G3mHLHFvQQ151WJH4chMDQNLA9xc3GQQ6unF6XzRLl6+H3Q2NLMLQlJ09+
	oY7otwaQoIEeNNiJ2mH+Sh9rfIBcrZkqNtbAmPStJ98o95Ke2i3LFXeNoYGCEEe9
	mabtvLztuhcKhKEic4+gmLa1QGMsR1RhiBc+oJOgYRTIejTblNf6uLesDTW/Awis
	xrBlSuvnpukawfLMLh3FR+nfDi68C9TtXVAinjsafpp9m8qXs2EjMPok0i8ke+eM
	zoJyNbebFzFMMKKU7WzHEA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6qcwbwkf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:56:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxVKCcRKZWcjX9LKluTF0UgvxUPL+lwVpRJ2rBOW13Ut0QpMfLIMunjcCzKcjisapkDqnQTdZs7l7KwGYYqcgICP+xXE8M+rGrxZ0wv02Gh0nq6RBQ8JmcpxOMDhaeMX+gspH0BAgeudkigHSHQPQXd2Hz0PXRnW752esVRDkmHGv20opBnY25RInjicQGKXYxJMgZsllmsjMRDvy470RgclVtSGYy+aQ6J9JmlyuNHwCHrLLUq0a5Hfmu0SmrQ+ZxX584plli5NJha1z0E1hsQqFZYwiZ6QUlls8JQ3WdnlsPYbo45g2KSU7CAwOqAH+d9lZ09xHm9CW91YiUeNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuhS40CKcELOH/wWWrTE+HaSVAOi7anIOgm1Vo+aCdU=;
 b=xuWR30FuI5RIYnBsmZe0q8LL76YJ+27UiK6E6uaeIoGzLAYyJ+ukEFt7hkgcmi2R5VbVbz4SEM3fk8+RKMpPERWBR42cmaUdIaE+z4PIxUutRX5s+FNWGMy8Sle8z9NJvdCHfD/DSxzmvZaybyL1kKeeknnQWAr9U3WSpKQGBkC13ME7wR+5Ko4MOZqB/bfRXwx1q6NkCQMo3cGGlaDhQeDwpz9S3jIyqX7/HbnEF2vyQxo/kkJ+Fipy0dFR4gauwpoTiE3xfIj1FSJ6Jisz7DXb7nGea8ofETYboqmEZlcLNVkbwFojCl07MUB458BWmpU9gzEF9h7IGZ7BB+cRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 08:56:17 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 08:56:17 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v2 3/4] kernel-yocto-rust: Add lld-native to DEPENDS
Date: Tue,  7 Jul 2026 01:55:50 -0700
Message-ID: <20260707085552.981820-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
References: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFF6F855567:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6b4677-93dc-4a84-21d3-08dedc059b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zhSnJvdhlPcw5ndNd/bKG1ThSXaXQrRlycn1y8WZz6Qmujo9QJi6bXKQhQhfROD1Zv2vIrA/7v9tzmi2NBePGiGktwXrRrZLg1B6iHR27Hbqt5kIIXdZ2/xk3S0rMb689hi2zWdZzwwfkw+JKXxJ/1Chq7CuNJMSJdpr8jbcDmgmir+IHoBYYrZzOxNdiC8FVmFnpHrwGHZ6y0lykbUNNGDNQfCOlfRBBqchiFKwgHWW1Q7qyq/yWN6YI2jixezOfaoblMF7PsokkV3Hn1j7G4oTDiE/eFrZ+o9DN6y1YzCOA8gNhlybQKwph40E76PaTmNhLk9mmMbcIWops3H4dA2dgmim4da5eKuF3Vmyp1wsaMPJAWpPhIFam158W9cWOb5OEg96q5ijv7DGb/5aU73lqizVOIRloSQitep5OngxlRT4+v63yoBAR14ehzICaGyA1VJX8WhmtlIHUb+8IIjHVU6K661RSKnVnfz5OYb4DCM6vC115bnVS2rVmMwFoUxBp4xsGFRY55t2k5ShmCVpNeEnSRvFEReZv37rFVZfZQiXFrAmKcEA+MzF0kQnmoWvnGeW/gD0P7TxuuDjMbzb4U6XCRFLwwdx2TjerPP3QLaKGVpZW+s5nd4efQiaoiAk9ZeaPgNOQDsrKqUMljIHf0byuCUNGCVT9u1SiB0unBX22/gejUEAdXPE2p85Phx3Fe15COo1KFElkzL6ux1QabWrSz+nn3l7GAiOEWU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eWAxkwvWXBsON8tQlyi6e5EUihDIjc77nDWUH/F4Q8E9m+wXkq+/3Jynxdp4?=
 =?us-ascii?Q?/nGSWZpplcNf7Qvbe9m2t/+2ZeIuQ9XPF5xyruit8QXSksFUVQz1aFBjGgCJ?=
 =?us-ascii?Q?gcyMPf6pPHYaX5ulCTcvbs7rI/xs2TiA4LRMS1zv2nnuSj3G9CNVRjG28bCi?=
 =?us-ascii?Q?YTNUkMHupdDc05JEZ3Xksa/viPkLsyV4u4I7af27z4NGYSF8WEuayaS3Xguu?=
 =?us-ascii?Q?QCSFm2acLG/DM1AiJOSM9uHUciV4LpSgy86Uohekb/+GTAfLmJdlm6/nIXnH?=
 =?us-ascii?Q?0P/MC5tiWDJX9GFme9rvzy0EOd2/VFUw1/Y4HWsjMoFRYI6fAi+SqQEuNzIl?=
 =?us-ascii?Q?ogcDoet8pMu4z1rpHUUX8Up2G8O4JLwG4eGsJCPJEEQhj5hh3hmpYD+mbPCl?=
 =?us-ascii?Q?AYhliz456df+mvppgJhxPEXOJ6qYNFCjRbvnmNzPnY2aQDmrqIu3CPK3pST3?=
 =?us-ascii?Q?HwYTjPzp5zXABhn3VzxeHzj8HdCPNADU49duVB3DrjZcNYCeJ+3wEZixCkQ9?=
 =?us-ascii?Q?M+lWU+AtYTZvyZ+ccvwgtxBBR8r41DdJOAnetm0xBuF7L35a53tp5iBg0fbI?=
 =?us-ascii?Q?o1c5FgSSo63CdwADVE12ZMIRaDbBIzOWSSS5oPCLpNzV2on0EUhkg8+OicfY?=
 =?us-ascii?Q?dJ5qqG7ARMzD9p8JLLF+MnvbtFPmvl8UyuDyFuAjtfqzbi20g5qQAtkvIjMD?=
 =?us-ascii?Q?KBYEQPrvT8f9pBafwvfSxG6LBDgUndiT/UGfxKq6jx1Mh8kcZP3jSVOeMwKT?=
 =?us-ascii?Q?DlO89TexY8AwiIFcBoa0pnCAj2lUASYlNfa6/ZgTkKNbzETq/MbEBa/VmNYr?=
 =?us-ascii?Q?CDB3/KplJgkdWVjzfHAMPTleGRlqnSwRUqDuu/5kLIdiyVJzlULcQI3F/wiV?=
 =?us-ascii?Q?PnRCKU6EZPjdTUBAqD/22dm/tlyZW1W+e94VWQtJSYNcqcXb52M4Hu3Tz93Q?=
 =?us-ascii?Q?lOdzHX84o1P/09tTXpO6CiQoXydwNYWkJCELDQAPjHa4qjNgw+qgmvfie/61?=
 =?us-ascii?Q?ujf+8xXy9vbiKjcdOKaBVvnVDzJRdzUKjweTjioYvjWSnQ+ojnsHGMrN2CXd?=
 =?us-ascii?Q?BLI3vKCcrh4rPbkRmA6AjvBpcHNeHFTrkc5Ht77bRaCyc7XKy0wW0Txk5h6r?=
 =?us-ascii?Q?x0TpFLEs8LgvIx2VICIL77q6o27M4qXLrUTgUArM17X4CcwZzvw9FyhnRnsm?=
 =?us-ascii?Q?Tl+T9uYIAUG9bubYWHgE95SYu7TD5G06GKTJQKUlmhh1FTkoWom03eeG4o2e?=
 =?us-ascii?Q?/teO6/oqB6PDl5R47Jm30NDnZUkyk8LBkCtffkgkx5G2smNU0LFt3iEv0zq8?=
 =?us-ascii?Q?lq40dBQ+qOM2x+ocZ2sxkZZhTAKBMLxFqq8KfsQZiNvdQnmZfHrJMKCRXgYU?=
 =?us-ascii?Q?dDgf1YbIZQG2VVTDQAQ72jCU30AcWeAsHajdQ2UKwR+/xPi2t03ER9jFF89N?=
 =?us-ascii?Q?FXw/pN7bWFWINevaq6bbwz2Q2niaM9B/EGk4FlSDZmC0wj91rUao2E0fMN27?=
 =?us-ascii?Q?a+8PZCvRMm9i9IYCrjENKC3hpRWkOxE7X+5Of3dlezWCzC+y3vmDUFui4hKj?=
 =?us-ascii?Q?dnLBrGRSHwiaTNtZCUJl38ooAm+q6OZ0nom5BK4QdhrkAgsoOJ04EK3hK2FL?=
 =?us-ascii?Q?zzqYXNSxn6WqJxLK/VKBLIjRdk/yboGKwb81ZsXbG/pIJuVTCgTbdsyZ4Oi9?=
 =?us-ascii?Q?Ool9jXZprK+CrDunhGLc7O9lEqGUQt/iSAfnd+HFHIfHw0Sw62rRV6gPV2Og?=
 =?us-ascii?Q?zyte+5vzUHV3PsYS/M/GALF6RGe0JUw=3D?=
X-Exchange-RoutingPolicyChecked: 
	C30gmkwsmRyNjxL9E2QBL49FvvWxvFNI8dTw2J05YaBMpzSYLc55/QD1Y7k9bSj6nvKVau4iJAvmFvzLMn0OHD1unNAnBPd3+O1E7fZbA/ZlYtBBdyqKp21EvB1rYv0uysLdMO9f5gS8A07E/96MkxK1KJrYfSmPpcAhvuA0iX7T02vHJvDRGQpJoYeuPcjg9VF2n71msxqFtv6zXgVpb6U5n8G6NnhPLuaEe0U2BIYjgUmzD5wJlNMKU4PrufEVddsB2o9Ye8FMZc1Jdj6cn+W26R3Z532x//0CKrkwkWZP+8QmFxgUHrNSaXART5RLsnHFMAGTawGnkcEHKfbM2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6b4677-93dc-4a84-21d3-08dedc059b5a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:56:17.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/S1l4pvgs4p4g06zUhx/vQAIFw2WX4e+s1Zr8azHoUQqFTTAtnaSYBMqRak9WbuGFlcvr3IdVOjDBXZsp/4HIQri07zJfVl4vnJsWpDk0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a4cbf33 cx=c_pps
 a=U/rLDH1MEKAiLKQqfACAEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=bWKH01WpkPuerRjjk64A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6trVutrhR8KZNdUhl9eDxQpYiWivC-lX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX56sGP65Gc91c
 9a1QxMCmIBwfHM1lf4IzZ49FYXpDhv+EgjToOsN3AT/RXwDH05nvqJgZoJYg/ex03G4BPvoOou+
 7E4HHX8vTn89cVKeZHkQ0P6bvIStrH9pQttOwmuXu8Lz5vnjALBI
X-Proofpoint-GUID: NpLkAtUpCHxdh1YOweWXh-Q8ykUgfq7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfXwjbts4tKs7LN
 1Q0CH7kLZQD6WPeIHlFcBAC451n3fO9aWFP8izJeTMpJ5rQ0nf7kk/qKOfJOlRjLS5QVoUozb8Y
 jpp8ZPyMLx6IE8we/MSC2+Fpe2b5zdXsrVIskv2mv3aUtdidsUys3M0rTjFUMmeTDm2t9cniCHq
 NfL/oZ3pee3NiIKsuLg84Dqu2lJ3LIH7MLW4gd6EqbuCecXR48ECUZh/+xfPa+rP8eBvMYmako/
 ljm0vbpQghqQadJKyM5VTrX1r29NFOv0CoHn4OYlkYPU/tr+ZkGtWJFiRe+QWVG98BG835lrLKw
 waNyjQF+j46uIXxW1cFSJUPj2DOmh0S9WwnYUYF+qSh9Adl45+KbEGYD8sKVw6KdSnAN91nXkGz
 7qcccWGA/MV47OmTwo0zehFXz+daFc9/gAUhjSkxsVzDwB5StJxrZE6B32WG2+TjRoWtqwpinKR
 1RLoXksa4hTqmjM4wbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240372

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add lld-native to DEPENDS, As lld linker is required while building kernel
with clang.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..1badb37476 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,6 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+DEPENDS:append:riscv64 = " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 = " lld-native:do_populate_sysroot"
-- 
2.49.0


