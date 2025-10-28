Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FF0CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:10:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8705.1761649845859839249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UUt143NI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33963afc6a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA1YeE981122
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 11:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wTab8NlLz
	LdVkezjbyUjkakP45Z4VxdeGv0rmfXL5vg=; b=UUt143NIKffUkhPll1OFT/T7Y
	Xm/bIgvmQWQIsYS+6tAtUMfuSELQD5Ly+UyQNO3ALPoe/dTjo+FwH0fUSWoulcC9
	1KgNzf8obwLLQ3am98jOQIGBxMh6EpE8/GFI5BznuMwmKsCjmU+S0SCuDQTyBbfP
	ik+Eh0/q7gQTkC1F2yutCo5XT8WuKXzZnJpI4kGIOdM0BaYLE3N0Db0UrS8ywByl
	mcvj4cMdXaL8fCKNxsuutjHiVXOg2aNSkjvL0DhTUcOVjRbqPYtPNcGKZQxrj3+A
	1V773K4AcShPp4gaRokn2XWa/2fuLQZwFJdV0cUTlrykIKifnNbdqITSF1yRw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks034s6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 11:10:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZQvGHjhqShbWRb1wvPqV2B7w5T/wQOfEonJWTPaBQT26UGHUYpdfwTHcyYDCnlCbhpjoi8SW/6M11nUktAZk1UOwG2nn2HNLob56hpA/vByIFRz5HVFKexkMLaDNvlZ1ss5LWHC5/JewucwNfqwdadyGjsjuyeicV5qmT/G5gfQhGRczCXeAmQBG7Krl9KUKt9c7wTpFuUjQRRaOR1mXFo858gRhHFXQ9AmAdmLcglLCmEUes3oEtthjCY3/WK67hEmdCkHJQAB1CQwOOUjKfhtQoiwC+Uem3F3pfNS8AkGlAAtaTuGLVQ7UP/m+3hOkyP23f9Xh+QHhNZbVROINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTab8NlLzLdVkezjbyUjkakP45Z4VxdeGv0rmfXL5vg=;
 b=ioKuws+fsX6EYq3/g53foghW/7CIE+fM6CJgs9G/Duq29dTDa7lMuuZgR+IHEuaaekNupCF8/ZAVcHLZlNpM17H3tWOcAL/mBq08SETo5qgsJmLo/ZEM7Yqh63e9FRaacB7dKMR/flgRfoPgFiv//CFGZ/GXWy22m6FDLFV76dIwU31HUtkxQTkGjdx85wqo29G5cMKzRhKkt6H+O+mUUp7l8T0cfnDSL9MVVQHGG9LcemNX/nha4WAtNImBdPRD4/Nx2nngxt/aZX/xoleTfavjNxHvQE5riczCnuSRmfeu1JzjCeuFh263ChB+6cetfFIIyDmVTrh5J0NQ1MODKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 11:10:41 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9228.016; Tue, 28 Oct 2025
 11:10:40 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH 1/2] binutils: fix CVE-2025-11081
Date: Tue, 28 Oct 2025 04:10:09 -0700
Message-ID: <20251028111010.3862497-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: c7eee1fb-c3f0-4e3f-7974-08de1612a17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kikki6X+6sIpxVoaJB2bsmGlZ77PzcS3iAiJqMp3IPQUa6b7vZS+zkgrimCG?=
 =?us-ascii?Q?LolepqD0wKZS/Gpao5Bws2aYspMMc0KIuJUHCVKTw/RRTk43Q4ZD5IXQgxcO?=
 =?us-ascii?Q?ygpU9zMkhrzN8fPQaQFZM95Z/BDB8bChTXsL9H8uCHG4QELOzEOTrfI+LG1I?=
 =?us-ascii?Q?Wy5Da4yYHEmBAcJB3tTMki8p6bkpkxum3EH9gC/PvW7+F6nnsCVjh9iig8O1?=
 =?us-ascii?Q?mY2xmRbdfP+RIJjRmApT4zJaO7A8tBctCnLl8un0mRk9CLZ/4PPWEYGF3Xwn?=
 =?us-ascii?Q?hAA/0c7/Omc+M9pJt6VdyxI8qD243/ow2n+afJc4YFFUfg9ESgpt3O4Dcmfb?=
 =?us-ascii?Q?ialLdJRHiCM6H0vbB6vvSyzuRN23H1Hrww1j1dc8HMAlPd/gS+GS4rUSCefb?=
 =?us-ascii?Q?e/nM9mpeKoUTjMAt699pGHzAgqicRe1iwl6foWJzKIdRDpZ15kks3m9FipXP?=
 =?us-ascii?Q?7UM69u7UMgkQj62uL1B9Et/H/IMcSjaEz4r3uTYIJPxk0JJ2DczK4qNqbpyk?=
 =?us-ascii?Q?0wrxn6R+c2GGFtx/UXswkr1x5zpdKfUeK3xD+3R1+PDD5dz8NuyKAnX6ZkMW?=
 =?us-ascii?Q?PXf1ks0oN3Mb3+gaU4ZNoKOIp3azIUmbbQVNFsYCyey/3ccUFvryFeJbI9mP?=
 =?us-ascii?Q?RzX5d97B4GKEnka1DjHE7/F4CYvNug7BRk1jXcrSrkHQdyq+L9j/SMufq174?=
 =?us-ascii?Q?I8UXxI6upETKIu3bwFqT+Et8nFTgJ/9mAEbAwjJi5j15BSw2O4hmMJrVgens?=
 =?us-ascii?Q?EfIw9aWo6YsxZnaL1JvCWTjRgw2r6lQzmwA7XHeWv6WWDT169mMxB+Iy/XR+?=
 =?us-ascii?Q?htac5iLtRrtz72Pr13qrZoZkm0tEbXi59hZ8C4c4pAmZSpcMBKH79Vd8qi8o?=
 =?us-ascii?Q?jXkqcUDZUHLdb481GbxjR3ZYrwu4WaYql6Ok0lADr39Zq2U3FVjLMxI2Lci1?=
 =?us-ascii?Q?ijsLpKlLSlUjBip/qkXxZZ8CMPFP2SutvJy+ClK8j2em7af57h7qUnmiXa2T?=
 =?us-ascii?Q?RJdVHiy3vTH0yWzYVvW+6CfycbcsVnXGvM64KoM6vFtmoocTnRXEb96CvQ2w?=
 =?us-ascii?Q?lyUaGVZGYx/XdbQY6Jj0aG7EizyGi/8x2T+/Wl9BYpkcUP7ruzsvK3eOdQ85?=
 =?us-ascii?Q?rU6oDU2dCt5k/X/7MytPv99BP2Okps2Ag/Ye66R9i3lXP5RDxA7REUQdWuOE?=
 =?us-ascii?Q?Zw1cQJ9dpN1xCV/n0yIjXuMZkL+PRccM475wdaqdeB5WcwYtOG9RRADENxNx?=
 =?us-ascii?Q?yXrrb4gKxB+JmOdvkRkTlZzDrd0YZNUMxVaiYxu6iE87qWDHXPFkeJS4OAU0?=
 =?us-ascii?Q?4Vx06UTcvwbK8jvsSqqKV3Bog0y+BIlbl2qxcQ3hlT1snjA1S25A5HGM1Vst?=
 =?us-ascii?Q?kmDtOfc2GL0xm7D0enMN590zKhQLQtkhebyUQDk3uAjW6q4y+sGIEX74s3No?=
 =?us-ascii?Q?N6DwgQzOyMoXzurDjV2vtu0W9k76YMhsCHMG3WaZ7xMQ0IRMICvSdA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dcCJSfVcSQYwUF8/wDxqPtkQX4xhz5xVBfAAA5a4DqOv21otLdVZXiLFTK4F?=
 =?us-ascii?Q?Viz4cQ+XlvZFb5Kf2RkIUKdFrP7Mck6KXhaIxdBcnBWS12FnrOOoOMoxlF2K?=
 =?us-ascii?Q?j5eJcQO646Q3jp98FUiktFT2/vWLzOrp2GL8t0NAAek622IFTF5zHwv4Iv6f?=
 =?us-ascii?Q?vvwQE/vMUqCeo62KksX0PqrPknGHgISJIFEwDBaeyPlQySXO9g3IhCaNVS0z?=
 =?us-ascii?Q?+0ndRXhugVEtC+PK03oVcF6BMMhPJrBjUZ9fEVB7PROeWGPMUlJFvuxV4vNJ?=
 =?us-ascii?Q?BIG1KD1pIwkwn41G2Q9Od62gT3bQUkpNLdj908EUE7vjE9iusnxnlxq+fm2e?=
 =?us-ascii?Q?gWcSj7J2lv5C2gb2HAmFEyL7RdJambGGrRwr5z8W/hehQD3dkA3uwnTWeM3G?=
 =?us-ascii?Q?KQoBi78gg5u5nCaCw2gkQjcLolyphY2XL85kdf96PQv+T86w3urecbZpJvWw?=
 =?us-ascii?Q?v75GM8woThHAQf9OPefzyLGqcvjhfyizMHxCW9IULtJxjt6uUQq0eyzhLAEU?=
 =?us-ascii?Q?cRD7ma05RPFwU1JVauoKfOYkWoOdYfEn7V5guUErprLztf0JJ/twzPQhfMnB?=
 =?us-ascii?Q?d4uQ1ZjlitoayTI191tw/SemVAimihRS1J4XvGcg0OPOk0DSiCQizDwd3BqL?=
 =?us-ascii?Q?D4NgupQvaJVEtZwAX4ubqcsh7VI7R7rqBH6lDpbQDeChytMK8obNsLWzjOxo?=
 =?us-ascii?Q?wEfPVIAavYol9Fkjc2aTOTHyrvEJmbWX/hzyvz8UsZGZU5J5CWk3kks5cZH8?=
 =?us-ascii?Q?TdOU+EG+Oxce1OGPTgmvarVNN4xBqKA47pbCGKSk+TC1ose3z/9FjrPdHlsE?=
 =?us-ascii?Q?6OPso/mkc9324mHj+wZ2p2Jpg0uWrC9VsAjBX//Q+F5HNZNaImh52G1hOFp2?=
 =?us-ascii?Q?htPeAsh6nAweLf7NmNXvQ9PElLoCZR7aRZees2Lbb/MnWFInhYH01FxGFZCR?=
 =?us-ascii?Q?fAYYZ6K/UjMtqdOqHIdKbDjvbhxlyy0AOpw+In4IqpiDEGEgRqd+VCj7Ki49?=
 =?us-ascii?Q?SKj+uo/hmDSTAPdyxrMxTDymT3V/4N6+jKH6LWpwT0jCDf4mPFjDQeb+2vH1?=
 =?us-ascii?Q?2JbrQ09lYxBYSXagBWvNxmL83XVrqw0U1Nv5HDHZwTDJWCEDGM0DhfseFre5?=
 =?us-ascii?Q?8CV9b2TM/Czvp1eT+lEEauzHqYwrKd6BgSU9FoH2bLpndYqVcIHs9ecjTxg5?=
 =?us-ascii?Q?Ugw0z6hHjQCUAdLNJ63vCS/xEKYX+keZBPM/V8QH9YbgMfD3LatpwdMyx+6a?=
 =?us-ascii?Q?Cu2R3cPblidmS70fvPB1O5Rd0N7Dbpb0ws8Fd4lzCse//HAkjUKJyCOdVExe?=
 =?us-ascii?Q?Rd4A5gHAOU/E/bFYUh5Qx+pWJuglHvIHKO3P3lNWMKuUEVMdagA/jcjgiXEc?=
 =?us-ascii?Q?zxqDXNDDmVPbofdvEZ2J9d+yOJ3nMjnXPIjJ626zlAQWFvHLm4UEnE2/o9MO?=
 =?us-ascii?Q?vnYH4mpI0C4JkwwOSG785kHEqVlw8MhOQHHYwg8LpO4chkhjyW9lFu01Qevt?=
 =?us-ascii?Q?GJqCHVJDyHAL8Xj2GXfWKM/9Uhm8LlkodoZkw3GOyk6K4HMmbZMaAIfxqbsz?=
 =?us-ascii?Q?we0jaj5XZ5nHycj73EDFKVyY/wWiPuwOiAtAk9c2f764tuqfN0wYf4jE83hs?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eee1fb-c3f0-4e3f-7974-08de1612a17c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:10:40.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4cjvY7fum65KFy3UBZOhC7CbnKkQqvl/rQKW7aGWqX1GxKTnQRuyAfrpjRBwKfGKEXAY6MW9qukqMbPI/6ywZciyAHKYehs9Fou9Q2WgOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: M0s43PVGv2CA2gr5D1c7LWKimzrxDprb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5NCBTYWx0ZWRfXwmmGtlvE/mO1
 9JGinHGthdU3rTJ5XWNBCqyFjgz848mNwG3vbPMHt0adEsSMSA2AtjovFugthgtZ/DPYk52FyPe
 QvMHtFUN5a1/QSpDbmKSgn2xSq1K8PJKZPmlLvgXCtafAVDkKQzm4DmlxZSPHca9Oof9UXUdjvM
 RCaL2INsptybQEc21ThJbUucpAIlE38aLO9lnQH0MQK+QZ8BRxmEmsMwi3xoB0w0Tb2HSHn6IF5
 RFsG9wAIzX++uZjVaQYypl+pbe11YQAxr0UFG5YkkoKh8/tIa8DXhIJga9VBKEvfoIuEb7tVLWn
 2mPP89yxuV8Ji2aAFrunYjZ9cs87wcdg0yDF9LQls/XLLzjfnwGlh+7ADfBdgldNDFh1a10JsWD
 vGpc1TtHt99+Xgm+kqu7COHTe3ZYgw==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=6900a4b4 cx=c_pps
 a=wszTalFPv2ofqEyTcV7qHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G8xoJTEVNainHG8ybTEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vxh8KWUpNcOwZpBbuZ6U3nI-rx5sfIE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 11:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225394

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-11081

Trying to dump .sframe in a PE file results in a segfault accessing
elf_section_data.

	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
	elf_section_type without first checking the file is ELF.

PR 33406 SEGV in dump_dwarf_section
[https://sourceware.org/bugzilla/show_bug.cgi?id=33406]

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0046-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2e978edc6f..2444a304be 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -82,5 +82,6 @@ SRC_URI = "\
      file://0043-CVE-2025-7545.patch \
      file://0044-CVE-2025-11082.patch \
      file://0045-CVE-2025-11083.patch \
+     file://0046-CVE-2025-11081.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch
new file mode 100644
index 0000000000..31dbef52fa
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch
@@ -0,0 +1,84 @@
+From f87a66db645caf8cc0e6fc87b0c28c78a38af59b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 9 Sep 2025 18:32:09 +0930
+Subject: [PATCH] PR 33406 SEGV in dump_dwarf_section
+
+Trying to dump .sframe in a PE file results in a segfault accessing
+elf_section_data.
+
+	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
+	elf_section_type without first checking the file is ELF.
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]
+CVE: CVE-2025-11081
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 290f7e51f66..ee8823da05a 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -4418,6 +4418,10 @@
+   else
+     match = name;
+ 
++  if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
++      && elf_section_type (section) == SHT_GNU_SFRAME)
++    match = ".sframe";
++
+   for (i = 0; i < max; i++)
+     if ((strcmp (debug_displays [i].section.uncompressed_name, match) == 0
+	 || strcmp (debug_displays [i].section.compressed_name, match) == 0
+@@ -4923,6 +4927,36 @@
+ }
+ 
++static void
++dump_sframe_section (bfd *abfd, const char *sect_name, bool is_mainfile)
++
++{
++  /* Error checking for user provided SFrame section name, if any.  */
++  if (sect_name)
++    {
++      asection *sec = bfd_get_section_by_name (abfd, sect_name);
++      if (sec == NULL)
++       {
++         printf (_("No %s section present\n\n"), sanitize_string (sect_name));
++         return;
++       }
++      /* Starting with Binutils 2.45, SFrame sections have section type
++        SHT_GNU_SFRAME.  For SFrame sections from Binutils 2.44 or earlier,
++        check explcitly for SFrame sections of type SHT_PROGBITS and name
++        ".sframe" to allow them.  */
++      else if (bfd_get_flavour (abfd) != bfd_target_elf_flavour
++              || (elf_section_type (sec) != SHT_GNU_SFRAME
++                  && !(elf_section_type (sec) == SHT_PROGBITS
++                       && strcmp (sect_name, ".sframe") == 0)))
++       {
++         printf (_("Section %s does not contain SFrame data\n\n"),
++                 sanitize_string (sect_name));
++         return;
++       }
++    }
++  dump_dwarf (abfd, is_mainfile);
++}
++
+ static void
+ dump_target_specific (bfd *abfd)
+ {
+   const struct objdump_private_desc * const *desc;
+diff --git a/include/elf/common.h b/include/elf/common.h
+--- a/include/elf/common.h
++++ b/include/elf/common.h 
+@@ -528,6 +528,8 @@
+ #define SHT_LOOS	0x60000000	/* First of OS specific semantics */
+ #define SHT_HIOS	0x6fffffff	/* Last of OS specific semantics */
+ 
++#define SHT_GNU_SFRAME	0x6ffffff4	/* SFrame stack trace information.  */
++
+ #define SHT_GNU_INCREMENTAL_INPUTS 0x6fff4700   /* incremental build data */
+ #define SHT_GNU_ATTRIBUTES 0x6ffffff5	/* Object attributes */
+ #define SHT_GNU_HASH	0x6ffffff6	/* GNU style symbol hash table */
-- 
2.49.0


