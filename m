Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F1CEE36A9
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:51:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49793.1770915064824431887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jzW1WTEJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503aba4eb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5C12T3049776
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:51:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=gnUzcQmAy
	qUcHlTSJO+V6SYsLJl2Vb4w+pBK6CJwXc8=; b=jzW1WTEJ2gdaXgUaksQoQVhT2
	c1e3n+fcbLLYJsYDGkL7QAr4Kjok09TruqkFc/jnRiVYbwipLnjg2Tl9xkZYcXsM
	LXWM2lEGolBwPLOsVz8m9Ef8UrQRxgJItEp4/hzTbpVpFl3QHKuTlDsI4tGU7xvZ
	oqh9LCb0v3ybtYShkrK3zSDNiLVq/1IJoasE4DIYrtF3puCjh6XxYKR69e7KNptL
	32kiHkaijk/5CKeW0qOghiNNQPkFb9Trrb1VDJ3MqlzgXfAyhr8v483S+QqxyB6Y
	9VBxKwHs+he/qmSP8JELkLeWDMiKdEeIqECsiv7g7nqerUDzJrFEPbUDtAANg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj631k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8QvsUEFHXP7PCfBaM3oP63AgWqR8JGkH34RvqG4vkD4jRuDPAOTVF9xNTcVb02sxzzeywIt9mBrT1ju4jOhCv71oorvtriAymmTVKC3rYSAFaQ4Qazf+nkxF8MJWqJRAUhcLXQxrbxDa5TOIiTtilLxfyIovTVUW60pXNj9OJIob3FLl54dzgw0oBQ6zYp6yz2Fcaiks37dKOirkyPc2WgtUsiDKu2CMvjDJqRzl1C8WIHStCr0L8U6snhTEuZxuYKWt36FniN+2guuQADSF733MON3shNfvcwHPAldv4ShmrMBF1w5LUGIwP6znCrsarOVxm97bn8Jt/VhvLQbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnUzcQmAyqUcHlTSJO+V6SYsLJl2Vb4w+pBK6CJwXc8=;
 b=RQQk4StQPrVui1Okp6lo7dj86iz+pN3JQzLGqhYxrhqfrlUVfP41S6z/30lQlQi0FmOQGS8wAyTlV9tlunJzlQFzoP+SulVf5gX8sv7/N+1YX3UCSS7aKXFC5J4/pWM9BYuWW3vlbQLPaOzZdUQT2rsDvpocNco4bh1DMAcJArXfwE7Z5ONRmVhQ6i13aJe67PT43r7D2fjvy3/KdpBDfOg+kXEPDfGtkkQagbC+EV+/LB9QIgPla/B2IiAxnVfP/uz8yDJd2IC/lhnmbP3OXpr3LakVLnelo8CXxhx04Oy+yRzP2L6Ba+gNbQ2C1OkkUNy7ryFBorg+5TNADOPu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 16:51:01 +0000
Received: from IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53]) by IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 16:51:01 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alex@linutronix.de
Subject: [PATCH] rust: Enable dynamic linking with llvm
Date: Thu, 12 Feb 2026 08:50:35 -0800
Message-ID: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To IA0PR11MB7910.namprd11.prod.outlook.com
 (2603:10b6:208:40d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7910:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: f18666a7-fc72-44d9-0972-08de6a56e72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XAgK8cFeCMsLX7eTqT9jJrEoIHEOHIx8Bu3ztG65Eu3qiIqGAVDgVmpZmnhx?=
 =?us-ascii?Q?SAoxfyluvENgRr7w9bmmeue/cjn4PjErXzv24L1YMhCyhaaNEZ6E/ZSDDA4Q?=
 =?us-ascii?Q?1UJCw/SPElVrvDgld2PfiAo8G//drtx0LGWLmMuiLsCI9HMwNIdcGqTTqaT8?=
 =?us-ascii?Q?49fR35oN/iLzokuSV9Hp2x+qs29GVnodb6Xhxtti+tRMER2e4pI474SOsy56?=
 =?us-ascii?Q?uNFRXLxOdricCxzAHt56t2CThsaFsktTPfwQ16uUtFHI01BdH8M65dRie04U?=
 =?us-ascii?Q?sWv8kCCeXLcw1S1DyRm26PHtCHa9qls3I0bA1C9NCANZrGv/Nv/EFGNYwq8o?=
 =?us-ascii?Q?jsrqmdCc4fIB83yZZQGtWOuWjb9sq/e3/x91g0DYlb/PbCYiIwV2uywWZty1?=
 =?us-ascii?Q?n6L8ejVUnxoO+fvgdIiGmsJf9EvTT7dtpMONb/aKOj/pY0dNYAJzcQGoX259?=
 =?us-ascii?Q?C0e9VKrfFaxj0rtMPRopWv7wZoP5nkSMBS45GgAWVmhAK7ZV24d1wtqFNPzJ?=
 =?us-ascii?Q?mDIhcOE5JzxiKnj0wayXaCZ71ACjjMXg6mNFHTzdSUuUi7UOBcF96NxqgeSj?=
 =?us-ascii?Q?ZNYV3uGJxoSNMSjtVfzIlkn1mhct34dbcwAI/v7BMnsXUPuaaldynQFFwRzy?=
 =?us-ascii?Q?TAQdFzCfUnQD+MrZE7PlZLxuD+ePGiWSflZ/ULYWjJXzFLx86nb9WRIi4bam?=
 =?us-ascii?Q?N3WXUHr4MOb0gI/iqLpivYAuOkPeX5v5dndF3apjnXn3HkdBrp8mC4vYSbaE?=
 =?us-ascii?Q?ytBx4AEg1tAWfn0nfZ6fn8vWDL4KEjcnFPhmqFEOt1Jb4b4JBwbCt2t52Ymy?=
 =?us-ascii?Q?k4lBxBK/VVp251q9fsVNxfbFIaRhFb1CjhfOsNGBqbLYE1n3YlOM2qRkDjqj?=
 =?us-ascii?Q?j6+gzSgZCUhERx/mHfnymWO583Zwj6U5t/9IfqikKQPTQRNzX80lyW2DKAQ4?=
 =?us-ascii?Q?94n+ZMUtlj4NeZhHwiUucCPxb2QDIpmnlyZfHPsu0BOjYrhRWiTt3yICTP13?=
 =?us-ascii?Q?QRjDcdxgqXZP9oes2L2jL1jREAvzxfrFzSMeNP5Qwth/c0ul+RJKtM/eyM4h?=
 =?us-ascii?Q?HqrmaWyAWdaf1FBrNgaBk/rY6xGNEmV/tuiw2fz8YUwANCMuRVqzDjXQAwxy?=
 =?us-ascii?Q?SCb/R/CGH82MLJRuLPKnjeVtHLhdRFlBf/W+YBqaQarTE8dd6PLHRsnp4dTc?=
 =?us-ascii?Q?HSHCtmDDvPCTi/RresiVfkEdZrNIY4mKr4RQKJt33hjXorq5A2Dz+dNXxDIK?=
 =?us-ascii?Q?gvYXvk2e5eRCuidSrb5glXoZy5xVombUqMbYm4qQSPeplLxrbIsfWBr6C6lJ?=
 =?us-ascii?Q?XzqALoa7jDX0ax2TyxJgbzRyBeabSeQRj9PRL6Osu9WiqDFKx5kkNGjZ15HP?=
 =?us-ascii?Q?H0PHmpBragVBNUCya8PJxPJDMa4bG/Zitd3kXAFHWqP49CZUtHK7SMieNwVP?=
 =?us-ascii?Q?G+YmdKNVkrD+TnYohg8+gqx3LgBVp8eyIHMvOKODdTdVmphwPMVH2fs9Ou5F?=
 =?us-ascii?Q?cmqEZx1I99+2UzCeJJg2D3Zs/2Wmg60XTAFwQZ+x0/oZLcXGOBJmitlnD1/q?=
 =?us-ascii?Q?QtW3U+bsbnAmhjHVn29j2dq9tWza85D1h8mEeMzxRkVmWpNFALzx2q1macpo?=
 =?us-ascii?Q?1laqP4j3YlOiViAqlTgMjXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SVHlbzZO0X+2nf6nLpZBWXwELn3aPteX+o2RsZ1iusN6z9JJccEvkE4ypcBo?=
 =?us-ascii?Q?y54fwAm5x+dH+TvT2Vpp6nm8MJ1I9HGDRBfYixl27c+MywZSpWT04/TBYkcR?=
 =?us-ascii?Q?kHRXpaBEoDoZhFe5qp9A7lKOa8ep1FWIBsSH+Wt4V7nw7EgBUt7XWTD0IVyr?=
 =?us-ascii?Q?49t0MT1VvdnkRuA/NMxPXvVNs1JYbLY4zzjkP4ODpoZrbfv3mK+4Fur66yNw?=
 =?us-ascii?Q?ugig/g2zWafza9zSYr+ttanSYk10E7Rsb9REjsroTTx/A9LWupodqkWRxGPX?=
 =?us-ascii?Q?yprHbXrxVjS+9jxKXoYpJ6BkXizPPDXQsuocQa/KHE5g/Ps4ehPC3dNylpGp?=
 =?us-ascii?Q?OlgPOkWa3CC9p+S1Tb0qrYL3y+qrtIQGnnssetZ7DgZ13kC0w9bhaRqDmcpv?=
 =?us-ascii?Q?VHmZV9lwquI5Yfj6G8X2t3qpH7ZkE3hf8bfb+PMX8XxJsV0FPLDgJIfA5HCE?=
 =?us-ascii?Q?1RelK54TnWHExbuks/yYg9DgtV5B95V1qg1boLcy9C6MtwT3/7Iyb9uPg2ax?=
 =?us-ascii?Q?Azo7NIlZxfLWUzndA0BE5cTbT+cFqnNROdOkEXKbJBJ+7kGlCX0rEhSQUwq2?=
 =?us-ascii?Q?p1WDmkI573uDsRpOgyZBwv1Q5FTVmglEyHCKk5QcItocQwuJiEXFO5VsScpG?=
 =?us-ascii?Q?M8JOGWKXURDqFXooaWR49P5QtSzPPyd7rZ7dSGIwnkiUYqjYOKwOKq39BoLJ?=
 =?us-ascii?Q?dlGPJUaZdXwsuVAf/LETJNsBAqT7gVb+t2hyZbDgL9qe5zyKpV/KXzRiqQEk?=
 =?us-ascii?Q?Fq3UIdKANs5fVEDrQdlDbqmG/fK9v1oLdKk4zHLugMvn1nJRCzoZorLmRmWO?=
 =?us-ascii?Q?2rW7hgEwy5it8Chk/m9VEAvUS+U4KOOf2x34PeeiTpftbjoi8DpP7+NgfGbO?=
 =?us-ascii?Q?fbwnxIHEKfPzmWAVKW4rBSU3F3aObrbqR5dk5qjEgM/QBqJe7NUew6fqqexL?=
 =?us-ascii?Q?zPWsbdwj1+CQ8Mo5J2aIjk13JNuSfwaX3DRRJV+YT49qOcq0DW1DVgxGjNWA?=
 =?us-ascii?Q?yE4mcmBa9F/B0BqqgAVf91ZOgc+c4VOWdwqOJ20Kh3h7cF+mGZ2kp4vcbxKz?=
 =?us-ascii?Q?WxQmSOGz5X1EapvSvd3sSFC9hYvNwdMwaV7YvoQ3WaMSNgWRxOaz81SL3AVq?=
 =?us-ascii?Q?70j7UDfJSQmKIZSezq0AI0XNmh8M2KuW6CrXEIa72MHeCYskGUmUE9up7OU1?=
 =?us-ascii?Q?4945aDtNdU3eQCKWW1dTdJ0P39S50fh9ghP38MJbmn49aUiWpXirbtHFuIk0?=
 =?us-ascii?Q?JCVgL87SrbsDuB1XbhMnK1HX4WtDeSh7o40jkYw2cMYS+rBE1iK1m3ACLjJB?=
 =?us-ascii?Q?2DHWFt8U+WHx7WLFPIVtK0KpFWX0XavfJpH4mAJhCqqN/2bQt80cKI9s008d?=
 =?us-ascii?Q?6w66pnnsMwffUHwIO9IMHVY+cRE5jygwOMXso6/rA5RNKnMDERDNV3QnoUPb?=
 =?us-ascii?Q?1YGF1ogJ9D1oretOTsrHMcOcPxGM8RIiE6vVh5kbQegJtUC/LZKmJ4wXrZUi?=
 =?us-ascii?Q?wCBEuHRioPPEpu+grorEQFfVnj+31mQMmzs6BBfzC91gNUt8ng9Ps8VyvDJY?=
 =?us-ascii?Q?HF/hXsE4dlzQdk3uM/WDlc5cOF91/KymgPQqSz56gdF/7EM0TQLBw+gP1tg7?=
 =?us-ascii?Q?BJnWur5z2HOpvCJprjhOOxMuSwj7vPYRgAapV8yOZiSOVF3F2fQ0R1hQs09t?=
 =?us-ascii?Q?0XMT/sRhHm0pvSAMMUhmBJu0eEoSKxB0mC1Tc1USV3Ehxa3eBwhGEJ/0edtl?=
 =?us-ascii?Q?TJYR1K7bcuoWClBlITgTNRVhU6Bhb7k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18666a7-fc72-44d9-0972-08de6a56e72b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:51:01.2286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9jpAp03/oLLmeScdFNyRAARW1SmIkMKA7QSMd42MGR4XlUKmok9/XjaCv8T0MjkeCFygXfb7DCrKKtFDo26FXXSgbmxsBDuOwQYTrLjEwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: yabPj0HL8djW2dgu6qBO2gqeYwDAwWP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyOSBTYWx0ZWRfX4NBBwUAwvckN
 pSmPIfGd2M9QwcythZZQEoAgo7UerNv8cHcNBvrOXgxYa4UNaDMSC57z1bHtjh7H409bRm/hoxb
 jsFS+gYwLrqRaFZ855ymoWRbGEX4yk0y230MiUFy4JrHFQ8LVyVw3liPtmexsOqHIfIV9KHhM7L
 cGH20xCd8rjKNlKF3ykURAzujsbW4SZxFfelL5WKg5gmsyTekwbdUhuff6CmXm7AIH+hiHKi9h9
 Alnwx563QVvh64QzrtFty1CQCDEbMLTUxX0qYoLSDE1zx3imK55paxG/5xas0aBnwj+U6IF2J5U
 Vr1Mxb7Ihnh619QtwtZcUfcPB3TxfUjYhwi9rDOt+QicIAgKAfO9Qwq3erP7AT1BHsMUK3qHasO
 GGWEOvDvjrLcqXGeNaUVrKcnTdNsu0XnYrH8exNNaswy2pI65Et1PN63jy7BKEmeW0Y8l+qKPkB
 zWWKlpmSi0Lbj2WTICw==
X-Proofpoint-GUID: 7oO6HWoV6XIEyC9yZsDQGlpdbRZ_952z
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698e04f7 cx=c_pps
 a=SD1VBa2HPYRYF6UykHdizg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=L2EHl7e8yB_yJGBCF9kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231048

From: Sunil Dora <sunilkumar.dora@windriver.com>

YOCTO #16058

When llvm-native is built with a newer toolchain (e.g. GCC 15) and
reused on a system with an older linker, rustc emit segfault at runtime.

This issue occurs because rustc, which is statically linked with LLVM libraries,
was built on one machine using a newer toolchain and then executed on another machine
that has an older linker. To prevent crash, LLVM now linked with rustc dynamically.

Added llvm as dependency to provide libllvm.so at runtime.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py      | 2 +-
 meta/recipes-devtools/rust/rust_1.93.0.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 3ae1946e43..7614941661 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "openssl"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "llvm", "openssl"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index a25f65f674..cfee48ec78 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -124,6 +124,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
-- 
2.49.0


