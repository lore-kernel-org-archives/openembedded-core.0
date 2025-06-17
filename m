Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD49C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15280.1750154985065620793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6v8CE009026
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jy6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:43 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA3hFb028261
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:43 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jy6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAGtqsI3Y5ui9iMtNRbSns50w6ZVxnnuxsUrI+ZtkTgET08kCNsa3R5RbdkbS2fBDvS0XV8Yxe0t3eZENZnU1nAKCUAhIhugDdkt4Q/5yg5AxJchsPf/obSsPeL4FUk7lI20q4pDV33VGryUJUh4LrWCjI1vuU7hM3KHS1OpnEthgxOj0ygAR+QO597TE079bbU48nRNQaV7btosVc7bwS36zOIjoqaEA7Nl7fOiicCpnwqZfo07L3xtvVOgiBzx97tuKZqBd52jlZuvxKshGs5rrRzl+cbIazGDgkbhOfXan1Td6BkjCpvMQh5DxwaQVz6qMLU+R61OH+0XWMWe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0IrtYlYDhuT9PyDVaWe/m17L4Ov8b2H1wS7qIWgAGc=;
 b=fP2po33nqRlBRl6oDb2MFR0Seslo9RLYA3C5UiORTQvWrtzzahb3+YXcYfkVdcvYiXsXH1fIea3FX0eCmyNiVACE31PgceCivTwjwX8KwZ+IN+YnN0CmPb35z1yXtwF6R9MBUpPrLUcWFJkH60fjYTCucOIPDnf4IYHEIJqYVoegStp9GgsD3RC56xN6XbxzxSeVR+S19be3tFxswN52xY2zfN2V0wh3AQ379w+4IHbIfF1KS59+xWNFD6tqUMsff19UPoC1Zbv9oHEaJpFvBpGMsbSrgpE16WDF4poXqTYtSN+t/Jr0L/JAjovDHZO6eojF3LE7+9jtheWguwpQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ5PPF12B0A4A9B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::811) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 10:09:41 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:41 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 5/8] glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested loop
Date: Tue, 17 Jun 2025 03:08:52 -0700
Message-ID: <20250617100855.2696492-6-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3559c022-2a74-49d0-8416-08ddad871329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kmk02cU55+KjfQkjIXfwKNKEJ8ptobdmDYi99QkUiWuyS1N9prWtr7plnz81?=
 =?us-ascii?Q?NLmb+4XRP/v9y9QChXkTFiGRmWV0fMwmxoAuX//rAtutzRNUp53qQVbkECVC?=
 =?us-ascii?Q?5hj3hp5pTIc4mK+J/PUSTzs8V9WN78jgKspkL2a6auT9PiKWoHD/oT96jPcj?=
 =?us-ascii?Q?Er4jQCwg0aWnC9jjUduKKuEnvK4dVZfN6pDurzZydrfOCuU33/hCwkMompA+?=
 =?us-ascii?Q?dEcYKfZE6vi9COxX95Xh5el+WU8+Fj6WbjQs7XmIZeo+n8MZQDoCn0S5AKTC?=
 =?us-ascii?Q?+o+frGNBsX2WlCQ4kpG5S/pKs7VA5/SqXaaDM2Cbp0AevC7P8t4GBrJ2CRGv?=
 =?us-ascii?Q?+AZBtea30iJXMPL0YRhKnMJU/4Silv5cDgznu8R9bFvVb46buxpJlpEs8Ubz?=
 =?us-ascii?Q?gMzIs1xURmlJev4tkMaxE2xjycdfIdBARsuGMcQu2l27BdtuwwbT9GI4CRds?=
 =?us-ascii?Q?dwvgrNuokKMCFJ8IpaGNdpMGti8O5frEYhDBCXJDDlj7BoESXwG3WptIF1xP?=
 =?us-ascii?Q?tiBYUseYYbiGf0Fw8BmH6vBedLNgE1vJrCNJlctHO82E+K3phdMHF6aRZkEA?=
 =?us-ascii?Q?BDC0aRHNOqn78jsq0tu7LXYLjkwDcYWn/TuVa+HvO/LZc6C7SF74LNJdp4yC?=
 =?us-ascii?Q?41AdQWLiXWnwn3dvhbMzkhpJthmcREV3Wp8s8cHkqnewp9qYw6jP8qVMkngz?=
 =?us-ascii?Q?0enrzEHlNu2bofYRA2cc9mP9dDlKlkTGdGf7ulArpyQ8OQLdy0dBCzw8wjIc?=
 =?us-ascii?Q?LEWCB8y36nirQJuLqYRDEJmDmDNU/bh3ZZL/squ6aRF84joznPZCAgiLTN7c?=
 =?us-ascii?Q?LiXc33LVKkyAUX0uKSTytYgL51fyUSRUJ39etOblaBtntGBZTuGD1Yy4pDBr?=
 =?us-ascii?Q?0SRo4jXzc4SSk6Oqdun9nrgr5RmISz57LC/YRdAds8mGWaauTu6OvbZs/RJy?=
 =?us-ascii?Q?eVXUbO7c66h3dM1JZmtPgeuxXaxyDGnNDmDAPDvtKSIewpWo6Tfz2PruOlNP?=
 =?us-ascii?Q?d+eToyjShT37zzvzK+GLhGiRKst/EFu2z5DUTUSrf4Uf+kjowSsMQvnThN6h?=
 =?us-ascii?Q?xmtbqEVcygwe90GHWKwDWi0w77tluuFX5sgoXP7h0lpJpKutPErCTcEgEnbY?=
 =?us-ascii?Q?VZTHZCcR0Ydk12f2QxhPMYZkAnRx0swOjT9bp5ZVUGPdZ3iNeXQp4dUB7FUr?=
 =?us-ascii?Q?nb2LKRuU2vBrEzuykT4RyZyBKuI1AfnjA1mSfWB6s0p5cr4HOqtK1YUvHBsu?=
 =?us-ascii?Q?yxE+eobY8I1iFPUAZ6E+iUx6Hg5RDv33SXjKUyq/Ue5vv+7aoPRLIptPsOxJ?=
 =?us-ascii?Q?7AieInNl+kBuOui+nr1nl2A7D3OzuwxR88x+4EZb8HtUCEcEKJmbQDTvyWkc?=
 =?us-ascii?Q?Ig8W8clIafsmvMoUZvNpeWHCBbFm4Vtqll9mcfMnx3RvYAzxTZKI4vPw3LzQ?=
 =?us-ascii?Q?xXvb1fTgvYE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gdXb/4AWP3eRw6YrcQ+SJcAbtPKyCMzA1P3X/BxI5yBXZPu+pK1FNrIbm/jQ?=
 =?us-ascii?Q?82GrHxf+w6RtKcdWJJhkSFX6KMyYlZfroHp1zTbWoOJ8VmUKD7uMapSdaWHi?=
 =?us-ascii?Q?t9N36oxadkXwfTz1oax3iGCu7kXkNJI80JYK7zn6sONZBeEabRAQK3UbbXml?=
 =?us-ascii?Q?WBuqZGQM/rAzf5/0nYFUmSEaPnuOVjF0Tf8m7f0XFU9JSfvB7EEJFlsjdncO?=
 =?us-ascii?Q?+HXvwKkxva7HFva3k5wBRhsIkd910oE1CMY8nTQCMDZ+xPOFyk/tJXR4wf+d?=
 =?us-ascii?Q?pCE+LO3FGmhoLbSORVkmf1ej54z4L7bkaoJjzhw9KSa9DdM7EAj3WfR2VWrI?=
 =?us-ascii?Q?/ydDZ+SA4u5ZDpJU6gGOSnnCO9VVcVuPcbbWoE4j3HjWID0UWmFmydoAg6xI?=
 =?us-ascii?Q?AAzwc1NrDhBWGPri8J/yCjMpX19zRye23roiOOYXRjzvv2iatcUBhOjhbnLg?=
 =?us-ascii?Q?EhxuqUYvziqz2bG0Hopb7JsmrkSlRAZTxFWcciIgT2e83VOivDS5YLf5yysy?=
 =?us-ascii?Q?iKv1VSR/za/oc7PHe3y4ShWs6SAzJ0BUc20WFqJ1gBy1DHq9T1VT2AdujoNG?=
 =?us-ascii?Q?HfsbofAr1s1vI9qjRAroGCaHttDXuWLxLvC67xq17w6BSd9r4JGOV0JkLBY6?=
 =?us-ascii?Q?VcCgl0W4xNzEvR53+P/2/rRUdHwb9O4+y5S4CGzBXeCwwFy7eoNMODR5urRJ?=
 =?us-ascii?Q?YsMiUrmYI6QP3RhTwFmFMb/+71Ts3C3RJUuFQeYzyji9N/ek/t20QUrKPEmB?=
 =?us-ascii?Q?lwm/ImlJxvA6Uf0P2O16KJhxLv3CbtpdWb6ixr3OszPfuvPDRjjZbhp2vtYY?=
 =?us-ascii?Q?QfpLFKY6vadOQ8TZOvCRYjKv2yZVrRnxpm38sjY9U82ufgivVGvdAPsi5K2b?=
 =?us-ascii?Q?+fkTIznIAKkAejyGoKIdCVD89MfufiZQjeYJLkBDN9/vunDECirPNExt2UMg?=
 =?us-ascii?Q?ri2hMjlJM8s6R5dzLGcBZnIpnFqDuP5U2qpi6HIaRv8m6aYVhLyXKmp+5jMV?=
 =?us-ascii?Q?R7rWM9g3Zyd/gox7alqIFUgr+riHwT0DPd4ZlwjdppQkPYDHnstbfUP/0P2q?=
 =?us-ascii?Q?L1gQ3NEGcP90WPMt7+7Y+XcYFJQEMyE+pAC1AUjFZtxCbkWEWA9rGs7wgliP?=
 =?us-ascii?Q?zuZIMy9n2yUzXQgIC/1n7wbMdG9TJRKl/91RQte5HJ7NNtTVyGnV0eYnD4Ok?=
 =?us-ascii?Q?RK9EC9j0uEX0r/L+MBJAklIvDhdF/dTQPEEx4PWL7Hp2Y0x5DZXjuj/dAVy+?=
 =?us-ascii?Q?lTXTob17tDRcoI9xeWh4D7sZAq/Gh5WTHFFTYzjG1dUiKwGuZN1eIThZkG/t?=
 =?us-ascii?Q?tZ4oH+8L95+Hm+t1z0PkPUIkO8Brg4DQhoJPbfHfvfUzUkT+wc8YTgWwB8pq?=
 =?us-ascii?Q?CZDbnfzHagPhRvi6BZZ6s2T53G/efLuLIT8D+5fZf3Z9nZ2iy+xNfF8+ZHGY?=
 =?us-ascii?Q?qnfPmZ7QWqziW0FeSkiBy6IsT5as5n/l6n3PZWelSEBDsmHqNuOw+4CyLcId?=
 =?us-ascii?Q?YbQ1Clf/b4vHKkuBTISKAgHjIkP4g9jhP0olN/AmMJW0SUlZCDe9Y6BMf8QO?=
 =?us-ascii?Q?nyPaepIACN7RqJgCBjsMCJPLzQjhr9Q/6VJaMLdG7syzJlvpBgSB/k3JbxIj?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3559c022-2a74-49d0-8416-08ddad871329
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:41.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH1AUWjTP+sLYO0Ym20ws0CkIjkPQQHXE5G6i4RYgz+YnX2qCOoa1PemL7vh3RnHPTOv/PgZ3EbICCnJBNr941E1EsplgzMnK4bfDdP+TAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=68513ee8 cx=c_pps a=EMkpfQS4iubUv0iPKfbWZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=fSV7xxviPA9HsJU1cEYA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VIITP9Y1TiP965mTRLas4EbOYHFhyH7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfXyo2r+883613f E7z6a2KBL0pHYBFist/iJ/Pz4jmLlVrXCJp1Fy3dmPhAX1MQTJztVAwkzFGFaHYlxc9TESsx5ug zG4EadOeScDBIXXIPNzj/KTOweRPVc8FlfqTTroFEaBLrZ6nQraj9ROVuWExAQV81Rhn/Ix4tkb
 5iqpapogsmDrgxcKEWYQ7YQmyG6OLnEw5yvkL2f+xlr8Pttp9DvNRJ/1VBdJ7C35fiFaJakFDw4 VQjDV8UJS8eszBdNDU6yZEd+McUv83ShfNBPNf+qblTdp5nMI3xQJAoepEgwTCXHLTfCoLpcfgX qwYT2TKgRfu/fGQD7vuH7fToG6ARyid/PR/1wcgWHnMXlzJT1NvtM9NboDQTC11L8O4psduhU16
 pYZMaFnYGPqQJ8isdbuE5IeRiCEOmMIWF371mhNt0P1QaSgRTwxbt2Zan52Qx/JyOVvlEtia
X-Proofpoint-GUID: WgzmV45uBwxiLI-vAEa8yYyVZWsXDN09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218874

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-5.patch          | 105 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
new file mode 100644
index 0000000000..16fe6f8460
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
@@ -0,0 +1,105 @@
+From d9ffb50dc55f77e584a5d0275eea758c7a6b04e3 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:53:35 -0700
+Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed of a
+ nested loop
+
+The loop was a little more complicated than necessary. There was only one
+break statement out of the inner loop, and the outer loop was nearly empty.
+So just remove the outer loop, moving its code to the one break statement in
+the inner loop. This allows us to replace all gotos with break statements.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 41 +++++++++++++++++++---------------------
+ 1 file changed, 19 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 47e834cade..5c86880105 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-  /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe (signals == lowseq) after group
+-     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-     store and will see the prior update of __g1_start done while switching
+-     groups too.  */
+-  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-
+-  do
+-    {
++
+       while (1)
+ 	{
++	  /* Now wait until a signal is available in our group or it is closed.
++	     Acquire MO so that if we observe (signals == lowseq) after group
++	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++	     store and will see the prior update of __g1_start done while switching
++	     groups too.  */
++	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+-	       goto done;
++	       break;
+ 	    }
+ 
+ 	  /* If there is an available signal, don't block.
+@@ -438,8 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+ 	  if ((int)(signals - lowseq) >= 2)
+-	    break;
+-
++           {
++             /* Try to grab a signal.  See above for MO.  (if we do another loop
++                iteration we need to see the correct value of g1_start)  */
++                     if (atomic_compare_exchange_weak_acquire (
++                               cond->__data.__g_signals + g,
++                       &signals, signals - 2))
++                       break;
++                     else
++                       continue;
++           }
+ 	  /* No signals available after spinning, so prepare to block.
+ 	     We first acquire a group reference and use acquire MO for that so
+ 	     that we synchronize with the dummy read-modify-write in
+@@ -479,21 +485,12 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 		 the lock during cancellation is not possible.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+-	      goto done;
++	      break;
+ 	    }
+ 	  else
+ 	    __condvar_dec_grefs (cond, g, private);
+ 
+-	  /* Reload signals.  See above for MO.  */
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-    }
+-  /* Try to grab a signal.  See above for MO.  (if we do another loop
+-     iteration we need to see the correct value of g1_start)  */
+-  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+-						&signals, signals - 2));
+-
+- done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9aab1466f6..05f408065f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
+           file://0026-PR25847-5.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


