Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA985CF3979
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11802.1763570908493052631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RJzz6L7o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vuuC4101401
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	RJzz6L7oHfdnvNXd3s8S3MvJbUM4BD9f3LbIhKSzY8MhGkeIa0FM+16AAbkbsep8
	wSDcz16vsJFhIavaniHE7jtLXzJBP+zpN5a/Srs7Imn8/A7Ty99ZkDR88bB2ZOLA
	Fa/QmmLlTidS97ld1/07B/TypdC8tcew45IJSTfspDuy23AecFrkD9FjBgdFUGXX
	ysO3Z5RsgSBjde0LjYjJSweqBQ6uN81EXAhwlB7tSO5vE4RJ0ConGae9z0zhIj0c
	K6/B/ELubhmVXz8/6Z7yVDzprEwGA8EFR/xGgzG3XwKiw6Z2FWPchk0T/Je7NWgd
	351HKuuTKAuYitcW35lbiQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBZtJuF17L+AkG99UF/DkKxi7WzYIur2qfo/+noOzylRP/Vc0K8vsVGZAlE8gifZTagEK2pM1nnBbfadNsn6YPG2W0QGHUS22cdKnERYY5cTUoABgrAeMwKVCk3P/0Kzz5FZ0/weU1ongBAynUpQisLXW5vkTUTtYFTGIh0pOeAsq+qA7u4jnzVNGBpYnZUktASPXQVLRwx3HUNoB++uck97Uq/JEmM4xn7v2H8IcdkPfje9dpJc2iiMaCVL1pzNPlKgL9mabYBQF09FDknoiRwEjQqt+pEsYeCfyeY9ncDrRkP3Udit6++4uzYOQHOB7kogpUWyy86egVH6WFwaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=ROi7Hr/7WUXPuJNBpGEYt7s3Xt2xrLmeZMJRs6e+qGBHK8zkfw5FylrE8QT1zHBb1cpS/MKgJHE6GK11toru1WHnULjzrp4MKgHZvA+QKcUAKYd+O1ReXTDXQnVhhWoaDZ8GT9DaC1rV4faQQgNYHo6p3klvFFXCwPyhcjY2rIxUTZTMpm0RUGIfS4dkbjHzGWWqeBPRGHI8uMo6ZJOgT2p5JMrGEsApYbkhbNABjDS3Gu/z4FxOISnoqKeq2XNA8PrnDPD3O/WhF5aHRhA8Y0qojbhTGzFsBBgo6/hOkytICcILk78wzz9gewjqcRTbFkvcYI5u4JYd94ypqm7eiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 01/11] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Wed, 19 Nov 2025 08:47:53 -0800
Message-ID: <20251119164804.256364-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cd20b2-7665-4c0e-0442-08de278b7375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LArdkx56PP7/XvSuLiLcbnwA989kKJ/UQvCTu+z4y65HL3A9zR0qQVv0gxh3?=
 =?us-ascii?Q?cwzFrWT4EVtWyRpdXvF4Uk7AKh+hiiLkP0EFNX6L9OE675fJC+e9rX6DUp+m?=
 =?us-ascii?Q?f7zH8AwkFvRK2niwFnVHjusT7/i16Ku8XpLPPEFcCGAhNLHev6586Dseht0x?=
 =?us-ascii?Q?+1MCpPnOxQvAyjm4jIRyQfx3lYcgtN+8B5A+f6kq9pVqjN68TJyjAcF5CUGG?=
 =?us-ascii?Q?MtCyALcD9UDLMC1MlZzH2wz/EEPCrB2W4/n5RKD6bPkkVrXQ+EhS9sqeVkxl?=
 =?us-ascii?Q?BaM6ghLAlDl2y6FnzbnZ0/8hSWe2rwkxCB16GzU9g56MYUqDI0iqQyIQmZZr?=
 =?us-ascii?Q?0z+E17KMxVg43vPPtLZeTD/7x3BPLLb2thH3/v2fmFu88OZKTbkx2kPWFhns?=
 =?us-ascii?Q?AqpZkIzkOQZeI4jNHsFLpHEzmCOq4ORgAioVFFVg4WmWga1nxuQ0QJqzfZKM?=
 =?us-ascii?Q?rTYUbw0xErQ/WEq5ItwhW4m5/or+dPxxDPkNpjsuTWnukBlwlRWiJj0rhnIX?=
 =?us-ascii?Q?yKgSKuOixNO8PlynYg1toFEzZox2LI4SN44J6a3vPKIliyFtTJFwri9pN/Bo?=
 =?us-ascii?Q?T+17ACBXkw7/wSTwbKt8Hk1IQm31CYRELxs11DLFjo+x3z8Pt5x/QAoIreai?=
 =?us-ascii?Q?y8QBfmbwxatV1bfxYSruR4SIFDXWRdhLeq7kz1qDfFfnTz+JxZp7T1LdoVbX?=
 =?us-ascii?Q?QzmUax4/3XHoEeQokYhQpNrXz0j3z66yMjGBlSF2v2C/9Cb/ARBfwPwoy2D6?=
 =?us-ascii?Q?QyGd1F3V0bwPGwWmsy4eVVkzz6dv8+xVGRmi1hPNSIgRKAAnu5U9n8KbT0G/?=
 =?us-ascii?Q?q7mEasMLteOsGnXTD7ADEURjNXimyKwA9w6hVGalPbtCxn4C66tEIwkv7eeo?=
 =?us-ascii?Q?EzlvaWDCe72nv75F+CtgWwl6WWg93gK34DhmXQn0jLCpWIq9EH39mt2im8o3?=
 =?us-ascii?Q?plqwfQ+Lg72xh25J330JK1Vo84ywR7isjLjt3n1GPMFJbBFUGvGkz3on5Kta?=
 =?us-ascii?Q?Q2Ab2aK02pDymEVodO5neyaJ7thCb6mlVWU8vsj1XbHwmAFn0LDH1sDGhEyK?=
 =?us-ascii?Q?zuhNNdT9A1gnLMHMxKhD+QeXUw/NRGhTEjYJrnUqfAhwMtFePLHzujb0EtIB?=
 =?us-ascii?Q?Syzpcd8sDTDVxtP2FahBk5p3JJWVpMsDTUJDy02/8u6c3otd+Q3HaNxaEL+u?=
 =?us-ascii?Q?AV6re787tsIogC08zKhtS4d8/s22YGr5neAj5A9xanPgAONOuohwdzXZfwsI?=
 =?us-ascii?Q?nH+dX2Jo9HlP+zh6JV9dNBLgwTy96Zzt7VlbT7pjixCLTHap5En9wjFU31ik?=
 =?us-ascii?Q?yUXgI9zDTjHgBwmRZDvWHNpB7oc2M+K1Y8Dvh1YpkVGqbTASU30rTaHi08d7?=
 =?us-ascii?Q?MkQWMc/3Uo0qf/qyPMe0PY8NA5LCnmknfIJZhQoraKTWpbSG7map7olUMOUj?=
 =?us-ascii?Q?u2E3YJdvUGgKB1xMQOwR1lHAwOPTh5Os+hptCMf4aj+wmN4H8OVgetvQrTEm?=
 =?us-ascii?Q?Xw42BRB2advGfN4KnmpB0bEWSAsEi7mI5woO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZCtqHxylGAo5PYgPAqg/TR6X6WC8+5eUyhRCgdp92Kt4xE00SEc0bOdE+JcO?=
 =?us-ascii?Q?F0T3y7hU1IzJDqaU02wsuI9u88y8waorXandypeIhco7p0mO+GCroNDCfbDn?=
 =?us-ascii?Q?lD67zsbQlK3MbwmGUf4u/LEEHOJBIzYuhBqem8eXBiRuKS+cgrPW+iHun7Yg?=
 =?us-ascii?Q?+Vk+bL98jl3B815dcWcg/hTHEa0GnmCDwMuwLnfZmqjz7KHNEGcwy7Xlid8Z?=
 =?us-ascii?Q?pyKO4oQkrt7jvlc2qp8+aOEeNnMra5tP1BdsMe9gU8zRvObe5wQJOneSzVYd?=
 =?us-ascii?Q?NHCgSlxBYQodOQh7nddFxHJnQ4gJX5J9Bk8a6MXqjV2b3oeLo+iA8hlsC9If?=
 =?us-ascii?Q?iXwMfZB60M3gM3ME3xvdAbZVFtvz/cSvkNI3AuqmiCGSWhW20mmgNnaljGCn?=
 =?us-ascii?Q?OnNZmtoaRScXHIJNiPQzvUVMUiSCON3+rhvsFI9/y/2Y8tqpJW00EXqNJLjI?=
 =?us-ascii?Q?4poQ95wzSA8ktawoJ390VbS6Oq5huqP/qb0F2Ict+OuYmS2++hBzY97KUvNe?=
 =?us-ascii?Q?/VSBe7F59mSovqMdrzv3xFvcNospoEFML55VApMWb0W/GRucIVkM25Dt59w1?=
 =?us-ascii?Q?nCwd52Cud5dNJLp6N1vz82JwBdZ5yNXw7dsSzGySJytMKna4Bu2ZCyAcf4A3?=
 =?us-ascii?Q?4w96b7NYvoBzgwLRGstoxzfoUuEr9uR6Il8f2bq46HR9Yomz6hQ6JCSUwP3U?=
 =?us-ascii?Q?UAWd5Slf70O+OlVEvgxpaP6w/0eHrF/3Y+di3/Uk6BBKz0mye5vsecezc3KP?=
 =?us-ascii?Q?cCjwoAPx/MxVDbbZ3m9IosVWiMCGxjR+ZU+ODiZGOQLjzDD0GxCNZmMmrogN?=
 =?us-ascii?Q?1QZmUwhB9Tvmz7HLIPTivYqaiFXWPbC/Be3wtsnXVabiHauM0/OeHyttbTgi?=
 =?us-ascii?Q?Sp/2Uhw0UpwQUhnFh4awg22IwnSP8ydqRK4mV2qslb04I3bN4ODHfN6kgs/S?=
 =?us-ascii?Q?RPxdYgvN0KRci8CH6LgLRxjg97TIgf5uK6xcCmbNw0qF743mgOBjWhHYIbMB?=
 =?us-ascii?Q?rSSNkpI7MlQFXP33LLyetPRrWBQtdWjsnXmLEIzLAy3etmd3Ntu4sGIA6htw?=
 =?us-ascii?Q?9E0506cHU5R5Yy7G27C0w7XkThCIuQn2cKm+OqagGYEU2d5Hd54fL6mseED3?=
 =?us-ascii?Q?mgZJAxgIYiC65KbpRIehJ+Mfq7CsHcuvSfCy6H2yL/YBrSpMUmRNTyLiPWlJ?=
 =?us-ascii?Q?LrD1UQWcgf4ZkTu2NES5zDD9sCQwbiJBjJFLYf5jMIAnYXt/+S/AZoMp/fa1?=
 =?us-ascii?Q?K+dxEtb6TrdGjHTDd0AJrGTK02Kyam7h2+rbR/29AoK3HkvKz0+4IeUWH1ZP?=
 =?us-ascii?Q?98oiPXbP62LPbpcQ5n0gWtD7smZZ0yZT7NDO9mH+AAV7ET6Zt7YNUs6thm0N?=
 =?us-ascii?Q?31J46J6Rqb4N4Sr86lOeGMuGsiU9NrXast2GSmBDzyQtnmmfpr3KiQUpP5pq?=
 =?us-ascii?Q?1EYSBxbogBKVyEui0WltC09oA1bsfkA38vbQBKlSmEyp5ODIU6FuWT7NoVoy?=
 =?us-ascii?Q?crr+3JBcSyZ2lzx+sIwyo/SPU4w8PTE2D6iuUiUDD4BxQIACJcBz3TtPft1y?=
 =?us-ascii?Q?AN5qxelYSoPtwDAY88FsBza24j4XPFMZ146CB2wqiO8L6h4Uvr6+jjtlEJOK?=
 =?us-ascii?Q?49UEoh4yAqJ0xVkkmTNNu/8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cd20b2-7665-4c0e-0442-08de278b7375
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:22.5721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb2Y9M9c8EZqbmnoCRIWd/SsfwhLr+pzcoXhJmZsUMEH3q17JCVtKAD2iuWRnFUfSByiOU8LXRO/hz/khCcqz6hKBddayIiljfIeOF9MG6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX4AjCbg+Dof+H
 3t54Xh/RxkWokhAKhDQFdQWFWng05p8HrmmhfYMqnNGcv3gIr2tpR3xHZ0MYsfmao382pag/nHY
 sODRbozJawtVwSuDMSBLkXPnX27PbijkQ/0fUJrATtR7E2phsU9Axoyx6KCJ+bP0yjnXw7bIfeN
 tfj0r0+uJTcteYvCb/7xTvhtohBln6FTV1GyKWlzWOlkdBRWnIyECWhrNlx/MG06vkFS+FnQkyQ
 ueUwd7orOB6P+qHT/V3VkgksH6ZYwyr9mkN5h4oJBbL39Nhl8exWg/fmYkfqwsOeCmlpwgsNXdK
 FV3T+CiW2zilLhXBmvw9hcCXb142iQa8MbcOnAdlghVhu02+lh4BHCKk6P37GNLWPpDRkh4+LVQ
 2S9xBKtFmvRFXBMLJCrfjh6T9CqkPw==
X-Proofpoint-GUID: Bn0_dwSgY_ktf5BOXmADZ6VtG2yDTdgi
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4db cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8VzeawkSf8Nukwpo9KJaFrYNGQmCX7nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226561

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


