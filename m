Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3624C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:58:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15764.1783537081857738980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AOnkZMaF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GJ8q4132052
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 18:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mUbqRZAeKCBBZWQdrN18NFmxILvPgu7bjVvZmvL7Bug=; b=
	AOnkZMaFCZ78CVChdyfuZkyqyAtl8hml9SDmnUL8c/ODZJ5RlBN4DEmLJo25o3jD
	sUaHlcVExosZL32zaF3Bi2bNsWwX0CpPEtmvI7RniT6cvIqnEQOH9qxeS/cdalqZ
	PMRNI/J8Uh4/+H6jsD6eYIhz7bgPs4cV06Wiyd78g1mO/xEGjLapRAJlVlC6IfXR
	FsGzvvUD37TWo+xNAx+WRxYOT7VoXZG0+6BWL8FWVQwzvsD8XU3UmlpxGYiJPDak
	4QMKU6GMzG7B2d2N/Pb1yoxhxdgfTPUSDC4g87dxMcyumAiF1q9YR19Oxpa0DE1+
	UIV+9NJFD/u6FcAl3ces6w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58ewkq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 18:58:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srPTW8IcEv2ploiv1zm6pT/bXn1DYQXgqbE0jlRlkuRmbog+m2Nmni3aD899EdIZy/1bf5n2N0PvNopKJJw41QUcQAVgumYWVpsq1WRZtzU/sB4gfSIGwbts9djTtCCToLTjB+Pbg0AxToPNJhrBizjToKAvr0Pk4NrV9mjHOVJ8p7Gv7m5io3lfG2Z5cdHLb7Alw0xvR3OuXhVa6mMNKlqmbi06yGNXdXAabBpu2sVkUsLP/Lm1mv6kZgmLSA88eV9i53Y1y3auaopg5PkN9D75E9qa9Pc5TxYk9BhQ8H0/sBhJx0OUfzH0XfwEkuq/V6d5Ec3+WEYkS4gO+MVVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUbqRZAeKCBBZWQdrN18NFmxILvPgu7bjVvZmvL7Bug=;
 b=j9nHhGB5wqdeMaJoDWJqR+bhpKLsj2UeAx6HdVK1G+3GxnK32z1HbkKF/+MlL6BBhV+YWRlgrrF/HNfxXY6HT8i0BL9iZ4XGA9AIaeM0qNriUoQj2fsqAkSDf//UTtPblt2w3WGBwgSmxjFOfe1/B/D9aBSHkoFhtGFry9mzVsb22vuVZzHGRZFJygfBG0TchUcue2JizSRbcnAj0rkhK5sN3gshL/uSX/X8DFI/mH0rU8PeDfl3F04C26OVcPKVL8h7QSMcUu5Zwi5dohv49o+voLSZp0KP+FJui90ImSY9CRsAVmKvyfHQ/hFOHj6S9Vyuy8zqax671k/SyJURJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:57:57 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 18:57:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com
Subject: [PATCH v3 2/4] kernel-yocto-rust: use clang toolchain for riscv64 when Rust is enabled
Date: Wed,  8 Jul 2026 11:57:22 -0700
Message-ID: <20260708185724.2183159-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
References: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: d6068a09-e6ac-4493-d72e-08dedd22d339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|13003099007|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lFrHXCepFbsXx/rSCUiw+Pj9+bdQJ0uFQdstQ9N6HZawdZ6AZ1/zkdZya0kuQD9bsxjPGMj7z9dbgzJa8X8LPTidUJUcaZJWFFcbH6fYsCAyPKkAOe8g/EAEabWaj9JVDn5gj52ptGf8rPZxBEF/cllsmcwc/HOAsfdUWsXgC/5hLzYxpy9Hg+oCVVXJRMgga1tj5XhvKTNuUUcTrrGAPwsCNk+i/VLgFN4kPpWtJNGY8Lcfwq+4b5E6bNIhqPcRNzIkGHgAaKtMzbQA8Jy65k3ar5ftDBlxYP6kQ7o09SlOMKWg/8qBffwp40umgaBOTBMmLi4T7g5MwC37PkV1NkDxTw7Olx2e26zOTVhf1F0D5vrgNDi9ylNTlLFH1LeH7Oig1BAVEFliaqHYqRlSB+qWueviDLis8Ib3NAWZejxTu0C3oUKzm+SF0CZPdDqqRz3qQLr4fbGNxnoK08/BjjRahUSkCo+Z8LXSFOziiClCxdSfkN0wEyH6L3RzsdEahozXzmExNJMmRHgkbiX3l60CqLCvt2rNWYA2R08F+h6NZYz+FfQUAUTOzrR1DT7ArYawEReNh0Vwr0rONwkLgk640kZQaL7VuEnjBERJGJa6vBP0I8yZA2SW1TQmKgS3kxxocVE6AVMzIdnL/WTVpZf1TB/dQXce45KHULgt+VKwh+G2YOFMwS+7IyKq3ANsFcxNxv6PV7MjbT7BlLSr48BbIwhB4VTjAyeGwHfe+g4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(13003099007)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/jugfpHwuJF6a1ehs48jp5JpVTjxeBlanvbx7/XeC7kCyjyZ32TP0nvTMa2F?=
 =?us-ascii?Q?lFD7Sy9zcCekdqJxWJV7uWbz+36saO9bIOSxmuFtmxdQ/fTPILcKRRQxaSBD?=
 =?us-ascii?Q?d+sc0++3438l4zS7fMfZxSk+As+g5y5S0a2zuWZ4H98v1LEoDTqe3A/tGFil?=
 =?us-ascii?Q?PIrj7HNyR1ISpUWos+2OsZK1g8di5ZsEA+HCEMEvlRMO0LbsicEtRitto8IR?=
 =?us-ascii?Q?7xWHacaneMuUaw1WYbMoniHDmLXvu5LFA4xEBQnv+RBjKDP3Xoopm2yAZNKw?=
 =?us-ascii?Q?8wZVg7ihwSJaYMMCtPQXrlvKy9yqZuLcxW7uQlmq7JawGizhXilXkeXfibHI?=
 =?us-ascii?Q?3lYlXnB4itr37K4wqs92awpqH1V39GJK8r+uDVPKpjwyO/ydfMLsRZOIthE5?=
 =?us-ascii?Q?xPddCO+lfATNqEQ1JnTjBH8AlfTauzzLMK2EqVpP41cUAuVe3t/XDAaaIEqM?=
 =?us-ascii?Q?0dFk/MUF44L3dEqheac6qqwT1DL73MwK5hSKOsac6Sh1Giv+HnAIP2sIj2i+?=
 =?us-ascii?Q?bMyo/H0NnSP+6LQue1xp3AoSDoSeCDBgQSRJUrOmkbCOW1pj9RWpebod9anC?=
 =?us-ascii?Q?IhUXBAG+xacp8fvDNhjQ3EmtZ0QBbquuisMu4LFzyq/A6qab2Vhok4Oqqin8?=
 =?us-ascii?Q?ct7YXSWzNf45EvI3xAxvhpP8JKl5XYrcEMkt+ILoGNtPP0UpWRFyThD+9D9v?=
 =?us-ascii?Q?LqBlDbOfvhxmF6fi8RqheS8lhUXh5z6grdNnATjYJcU4jybHPeaZju0r6Hwm?=
 =?us-ascii?Q?CsmXFF3eXD/tjER6MXAo7jTplqmrR9b6oj59aGACShZG9lqyRI2MYmMZJ1vv?=
 =?us-ascii?Q?gqNzaGYh1y43SzFKVpUVs0YX7w/0HGsjaPV36cr3GN7IrRr/oiMla39s9Ety?=
 =?us-ascii?Q?fazMSBSc94U5ZTYkhAdsvIfkhz+Mhx0Ug90o9R5BiX2APuy6zZcjyhYnbDGQ?=
 =?us-ascii?Q?otySrvAhj2LLojxT36CoPqn41Iekz3XYE8CAkO7teyLVDPE/0mPanoD6ttTI?=
 =?us-ascii?Q?0OJDgkzVvSNxc1FYVCK3v0rS1ZHHARavj4q4mEEgE/T7qtNnH9C4s6Qatl91?=
 =?us-ascii?Q?jdzjyWNKHYu3qxqsC65iOgUx6iPpdCf29D/nCMUNtQC+QX/S+u7zYrYKwnDu?=
 =?us-ascii?Q?eZCyfkYnPc5bY9X1xXDlXwoGUlbqa8LWa78NLRCSP+AdMV/rLpE60o3lg16e?=
 =?us-ascii?Q?ymHmfLfuDRLTB+7qU6bcRL87DzyiRA7MkJgc2vRZVfGmY8sEeqGSD8G5PB6A?=
 =?us-ascii?Q?YMy/Xccfhp5QfVDmA2vMxfrwF9GNSCrjBq3rTkCk52A0C5d/849zIXP0v9B4?=
 =?us-ascii?Q?MwuyQsf+tkaiZWTuQm4QqEectbuC0raiNA67vvanpMrSQG1q4b5WGJMf5Dpv?=
 =?us-ascii?Q?7Q/GX7lo9HxPQr156b+VRFx56ipaRI9dtVe5ZWCsIHB4Td514lf/swkNOckD?=
 =?us-ascii?Q?EuTxH5Es185JbaLGrxfPK3/sKfMPtFjek5irZt+NrdLYT+C33/HK4YawXZ6f?=
 =?us-ascii?Q?osKTlPVQMM+7LskbIV9TCP7oH+cGWshvvZknBpOq8aoM10to85eFeeg/5P6m?=
 =?us-ascii?Q?Nf8Jq2mt4Ws8DwEDB9KHxUlB40KLljTOdBKYYItSeZXbLPlnw2Ii7XdCStwl?=
 =?us-ascii?Q?fbA2Iju465tsQ9vcOz5uXor17YVShmFW25UrFBJ5hFjHCi94kNuhgtL/tRXd?=
 =?us-ascii?Q?q2fGiSVHVo3y280rE9cl7aIrDOQzI8zUj4Hljn82Yem4YMg9y0gCSkComZs3?=
 =?us-ascii?Q?LaNS+7zs1tSvF1PcMwHAW1Pd/6F4Y+A=3D?=
X-Exchange-RoutingPolicyChecked: 
	fZ8EU360Sjre9fyNo0QQFUoWTGzW3gLoaqnFP3PG5Zn1qFChbf5z1rFwrJyD6I3+8henEuS37RiKlvlsXuEgGncqPTCDPMDS3PbnVnYry6WJsvelnchv4aWaaRyjPEnfukbDfc4qadC4O1DztrsxT9Vboj5EHvGmqmmDi/k8CdSifXgXXPrAhw5LONWo/1Z21pyLXJfRVMZOvVHpwHiheQXp9okQiJMDhRtuDavxTAr4viri9MhK2kMTdKEwZT4zdx1OjYEJ/P3Ts/q4fuNzutnwRdPILZBHCk0Pa5Nb3Jks4S8P4s9pws83nOr98i7y53cd1N6s2rLmUKrM2NNr0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6068a09-e6ac-4493-d72e-08dedd22d339
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:57:57.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cu0G2SsEtrG5qC3twr5ntU90kw/Rm1Z+GrVzW9WfZ1MuJBpSTY0Tg6N+olwGiO+JypDRDt1Fpg2fWCA9voOj10TTVnZh6VmhQrxnD7oDXRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX61aR9C31jHZW
 z37pbnkbTuOnpMSVxhI3pOzXUNOc44Q98w737/lIewBgGuv9fAM4PpsQBgXYt5OMQVvFO57jtWa
 gUJTsQghBX23NW6KVdUEvVspe+FCf3qjsJb4xYI/vzUJ5uxSicpW
X-Proofpoint-ORIG-GUID: _cpEW5OeA8FjsNy4dtp11WSUSBtQwoRp
X-Proofpoint-GUID: cMwADiXNpu-PhyRd6yuUnBFPJLA9V79D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX78nhoUYKsCcH
 KqIBSHLvPkTeCkyIco/q4+b6ckXk2DelCybBUCkMMBQ5sDVxdN5XCdqo2fqYNufLmyTlJkVtGPk
 NhiXi3M880SBKWbd17/7ZVbgHm0s88sUtoaCdKuQHD59LI1hibdiQNf3/Kj1GcQJPmfLhMaGck3
 u12J8Y9A2kTXQlF9EjYR0LtC8Ft25xq2Om9HSrW1s7nlWt77DUNccqsh3ahTWrErUBiaWeCorG/
 /QbTPyLBorRpUxoaGC15ZEjQvpjyHk6l/tD+Lk9q8LpmgQZwEZi8VJ1URgjpJVtu+ZNF38Bl8e1
 H4uT2TQHaSnxgworUqztWGsVANoB7fPNQ8iLF8paQIIoCmuz0cmLlyQlP0GV7u4YVGZJ6Vd0mG+
 nm77fq/Vxp+r5sX60odmQN9vSGUC67PZuiqF+7+xMFIV2SttugIBueyXKstGg0QQBCvy0lil6/h
 IN8Tf+Gro+dg9VZH4Rw==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4e9db8 cx=c_pps
 a=OViojaO3c1oaidwcGWKC2A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=8GuF4qZaY04rh7fV96kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240512

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
is enabled, as Rust is only supported with LLVM toolchains for this
architecture.

This aligns with upstream kernel Rust architecture requirements as
documented in:
https://docs.kernel.org/rust/arch-support.html

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..5d047b5f01 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -91,3 +91,7 @@ do_devshell:prepend() {
     d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
     d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
 }
+
+# For riscv64, Rust support in kernel only works with LLVM/Clang only.
+# https://docs.kernel.org/rust/arch-support.html
+TOOLCHAIN:riscv64 = "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', 'gcc', d)}"
-- 
2.49.0


