Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A9ECCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 12:15:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8003.1762344901379991224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 04:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fC9IhBE7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404face84=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54mBll2095745
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 12:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=6SGhdNHEg
	67zdEsTsrOHpe+0ko9YK1cP9jur9DgW+Kc=; b=fC9IhBE7Jp4O6g0FBmlm/m43l
	ypH2reUogVf5mjTjMHkk7VbsUQ5DV6UU1fGhREU5D+IbKj0B8qb3f9hgdjzLwE35
	Gt4opW6hEmXkJaDmat2M6s5CNnZ2CK3Bw1d9kF22HN1adVMtd5pt82KHRIROl1Aw
	ymdEr7fr+tnsTt0coIGZtcg+KiVWx4gVALb3+11xi3Ybesrdc9VuFDO+nFV42DMR
	7eacKNXgvULqtkdY0tmlaxKDhNxnq8O0S2GGx4/tPDW8CYxahbiYDfkETHI5aJt5
	Qgv/7S8YaULE6IlwKgbPV/NChOazWs/o4RMwxmohYuyB4aqgVnAt+iqtqjFBw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war8eq9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 12:14:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YORHS9t4tqH1Osk7o7aXSosI1pn1Q0StTshpTK/HqSLBp374uSjluXcZ6kwH0n5UZJ1/ksbrCU3RS7gTogejO3X2pWROB0IQU0wWVZzvgIZ/spGVRGcRTxc0jraV4N5di7lQhWxfLtHGavhabpAXPYQd1QzEaGqtja8IDVl2yORtMo0vrL+BTftJVD7ZXO4xOR3hG7fDcaVCCzPD1ZAn3TnX6UQEZ1/FNJJaacCG7ozsEl+d8HZFpTAt82iZcV825mqP7OkH+ou8x56hx7pAZMmm0/8LF5AcqEB2H+jwMJt09ywL5+lRh7+21jDQvbYiKUGHOp+I6rBdtbcHybaUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SGhdNHEg67zdEsTsrOHpe+0ko9YK1cP9jur9DgW+Kc=;
 b=kCZmPI6sf95HJ6tgmKm2r7E+TmQJThE3feaBd7YfLHq/kYcDMBKAAGMO157nF4dRsfitfXuPVat+QAe0dH3ljfR0LICduWiv0xQBwv4X3T6R1Okmnj7KX5831gd8UXkS6yTh72nqnyIKwcZHYuyvxpi8EYG87RndY6F+Ej3lKVh1FIaGmSvNxBVnAKDmyWuPqTNz/JTjQb2sk7t4R3gM+kSTSLdCnAvEyWT3kPcALNpdW4PzEACg2JtAqhbQux2+KNim/sTHjknbqfraruWFmeXtctmx0o78Q6dIRFmFc96PwDztZJ5abAf3ElHAVGs548wxCBtFDdQizxBCjAxE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Wed, 5 Nov
 2025 12:14:55 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 12:14:55 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        jpewhacker@gmail.com
Subject: [PATCH v3] populate_sdk_ext, create-spdx-image-3.0: ensure image SPDX/SBOM tasks are retained for eSDK installation
Date: Wed,  5 Nov 2025 04:14:32 -0800
Message-ID: <20251105121432.3987350-1-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f377d4-b5fa-4017-e893-08de1c64ee32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fNEKUWC72/x/awhTltzudD/k/n6pXQ3y/c1GuD8Ov56dUsGhSsVNxCSKXaCP?=
 =?us-ascii?Q?veruMLDzTASfABCcY6YRugHAz7m/U41HLvIN0THRxC9MG57sDrSMnApyrKCx?=
 =?us-ascii?Q?CCLi9LnAJ+BfMrJFBBKUzCBebuX2fICzqHCRVCGATg4xCbeOkjY/xTSZJXE3?=
 =?us-ascii?Q?HvOVjtWN3J6CE1MS5m8fv6KrCAIYxbcRrcHjnsQt3AwZkJxfyiqiR7z81V4Z?=
 =?us-ascii?Q?Z1rETMwGZaePz6tsOr7uuCy+cx0GW6qwe2tfOZAab5LLiaTHa+I1PTr3rqlQ?=
 =?us-ascii?Q?tRgQVbj6gppZRpv0/VfGJfipFNedZdpV0mJGjBet+CBDBrPy77pevBQTQiob?=
 =?us-ascii?Q?XHKBg9g9VFDUZjJwysRWrsONtNPfwesQCk2EbKQv9mjOB3PfGPNXhaIfuHpM?=
 =?us-ascii?Q?I9E9Kua5BnoKnPwnilJYGBgqbqVi5csFnHNE+4ncMl9oIQTTXE3Q6uTpFqGe?=
 =?us-ascii?Q?W0n2SxC7GRI22el0Bx7eBp4XVX2gxaSD0tWAWR0V2D60JNbgPIOMOzVJZQiD?=
 =?us-ascii?Q?AfPM6ixBDAWtYeu0yYLKNm0TD0PXuuvq9feFxQ0jeDaannD+TP6tymYY1EaC?=
 =?us-ascii?Q?Ql2QPR8gc9IhkrlPe+cT1ArnKQY11yFCz2CwNnwQR0Myjk9kWjiUofD+0hIX?=
 =?us-ascii?Q?lt/uLP5CyNsbxWhVBqBuIa0rTqvKmDoM/mquYGyWvvdir0T5bb5j15PKCFPe?=
 =?us-ascii?Q?P3k6FoGj9tV7NVK+ih8rkhSJsQmCDOVGx+1hjRbJ6UOrLL3PiwVDG/+qaBgk?=
 =?us-ascii?Q?FKFxNfBSNXf7T4NS4iYnkoAXBXFWpP8ZUmhQJDAcpNHr6WPlC73dhub2ANec?=
 =?us-ascii?Q?Mbc1HQ0kz8cm3ihYyoDc9slCnjPo8JyIS+M8pf6pGTPyWEomsxX9mk6c1cCL?=
 =?us-ascii?Q?09wwDY+NLCDEUFBOSqTkRzhCr4eWeJuRTlZncf6+42My6Czq5JEw8zJpE0HL?=
 =?us-ascii?Q?GdeVGfH2x9GDSSMhvIWV88cmWuGNLgPEpqTcuKYg4IvcSn5Lr0Fc+Y6415iV?=
 =?us-ascii?Q?6Bifd3wKJh5AE6X4XMk/wE3jyUOjElMtTLGRhU7HuXVmbezlSo4crzAlCrtL?=
 =?us-ascii?Q?ed3BP7i5mZqE1pyAlKmAwiQ2NCUfCcjeTC3ijcnUk99VDGLCOnr/o390WeQ/?=
 =?us-ascii?Q?WEth0Su0zRufgVugfq+5m+x+iBI/QcKkT3CydQAVtjtvQ/Qdhj+j4eIB/s1/?=
 =?us-ascii?Q?2h1Gemm6o5/JaX8Xml12pBCv/HztsVDT/sHeai+SGXVxgpxVYmACh/9mKACv?=
 =?us-ascii?Q?IdRYW0mM095EzNlPLUJHsg2d8ZzNOZW0LDCMNF+GIYSRboD2XEQY4d1VjG1N?=
 =?us-ascii?Q?v9245BBoL7B2VzhToG+5854S6Wh0RrcrfVpO8sYfgFN0hFJOq2SbM9yIY83t?=
 =?us-ascii?Q?94kZ7ULuYsVFkghHVzKqpziRxxHoS3vdOZT/bkx83ZaJQQORK/AgN2jXZ9Fu?=
 =?us-ascii?Q?S19ZAJAS/h0bV3o91QQRFU/J0CsCQgxf9uJXhSKu6LcKqDcdHZ5VOCh1OsGo?=
 =?us-ascii?Q?QmptV7Tw/4HdnEtX4pXYUJqXhU3Eoa6yrTYo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3+w7q/uIuwnC9dycritu8MaqdiTYicfQz+pRYutxQ0Tyi9v0dGQ2vAsVPvqe?=
 =?us-ascii?Q?qAY1vpOE/Blr9O6Wb88eNcCPUrl/FSQ+RC9gxFeUATHdG6iL8JVf7/v/7aKz?=
 =?us-ascii?Q?EnmymkBTXJ6cSwhjnFNsk3eWJ6dL4D6JXgYLIdrNuVHIs6CHGPOo3VyE7xF9?=
 =?us-ascii?Q?lsQZNzo/q42RiSI21cljdwFGxSdJC5ozt8B+noRh/xfL6fy8xArTvvYrUu6c?=
 =?us-ascii?Q?jjxsq2sHPXgQ2SxyOtFqrmcixmpfwCs3OmzvNZZUdvzQsn09SVpSkJzwOw1m?=
 =?us-ascii?Q?a2nsmcmYJuGryC2c1XsIleeCuRSpNnVDAfhCZe6TBXFzhwCbu9jQ0pgyN4U0?=
 =?us-ascii?Q?0xd0YQSvOe/2vux3aBbhJgixWld5jqi2QfK+vq6giXcj2pSJwcvf8tLB549L?=
 =?us-ascii?Q?OHTPEFXMbsQZXNhwPygBK7SEXQggmSOUaCWVji2q/1Mx6MHhjkYla9T+6nU/?=
 =?us-ascii?Q?AcjoW0D2Cd2s4RJW8K+veW4zaKA/LydqGpHrLnjupYr8dtpGevtm43aNKstr?=
 =?us-ascii?Q?YV1cgkkqIsDTgHxqyxYUbKVPvxrK5WIFrHbFT2GbEA6vf2K5dJT0rj9KuY20?=
 =?us-ascii?Q?VpkYD8uzMydEclRWQ3kEK1EzCq9AcCwmOW0pa1YGPRwlhQwUAHHYXPFW8pYD?=
 =?us-ascii?Q?z7ecMFPXTuYN+APoBMOlLfAfs2dQYxCUvnmFtUui8NhgLsAeHjgzAbQ5vCTl?=
 =?us-ascii?Q?x+SGU9VlfPuKqZxM0B3xbtfV6MbZpNeZlJs6joAdcIBEDW0L/hFOjEAbEhZB?=
 =?us-ascii?Q?PFjjxn/2hrq1ppk7fX1FlVj+o+dhUojk6kl9TX+yWFSz5m5/YWc4S+X9aNcq?=
 =?us-ascii?Q?XaIhcqa5p3rOe1HLtJpyV/v5pjxbWFo5l6+5Ihr9/wPIvERyIs8Vds5ayCkU?=
 =?us-ascii?Q?8fKXpf/GyYHFphjTY7PtcFEIudEwSVLAZWA2FjDoikWrCDj3w8GtmXifgGUo?=
 =?us-ascii?Q?/vXPZPprWzbCVjiM0xCsiDCI9QGqYMg1+1/bMsJOFam7lFC1kTSMjdUNMihh?=
 =?us-ascii?Q?wr0IAxhCwyOnXBvcf5wZUpEuN+7kBrLQx+DcVbBamGXMKJUcqV87nurYOPDh?=
 =?us-ascii?Q?BxZT01W03A6cVSDvoi95ZI2pm+9U+JIoKaX2rZPzwvAZWBiin0n1HlU09ny6?=
 =?us-ascii?Q?fUcO3Dcd5jcsUB1w0IBo12JMuZy3TovoSYlAQUIcOgHyr4VaNezP8aWkAZQL?=
 =?us-ascii?Q?b+hagYpodKXdSmEb548EYMdNiq6BZQz8LiJp7jBh+oqiehBORV2EUI4IyMIM?=
 =?us-ascii?Q?r0UcxdYC/nhyCBlANH738cxEDiWSDQSoqzNkida5IT8KOgIsRT/NKMBUmTXP?=
 =?us-ascii?Q?hsy/ulyyvXMExKtytRpIU990PtM5XT8SZGdCO5HTo2TI5yRLIvjtpLrNYF0l?=
 =?us-ascii?Q?giLAz5dOBG/+XeLKkCqgijjjCy6zxV3C7ycFbt1WFhlLiVdWO5/wAVbZzZI9?=
 =?us-ascii?Q?/pb/tDXJYQ+FNAGLny3gFXq7eyzmGHad6gSC+vf0XkE4fzsaN8TMXcDzf4ot?=
 =?us-ascii?Q?FaA4wyHYRs0YWBJq9bmzc8ogY/vdp1d/un3Fzj0ItQdokxROo+NuGFAA4/CZ?=
 =?us-ascii?Q?o+h4gFI0e1qJ8z96eK+WMFV0/8nQE9Ydqn1Lou3p4pDL2SsosvxhgEO5LseM?=
 =?us-ascii?Q?/RXn25N1Hr2yRB8iHw6zehg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f377d4-b5fa-4017-e893-08de1c64ee32
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:14:55.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUlQiYYnWZ5s8Z4QVIY/x2sJDlxf1DsDQapEDy/jK01itUDq9Ejcb00cZDpu6T8RO1DlObhFV2zg83syoRD7DyMbrFalhxhXtbppYLHS3W8kvPqM9wFHXHOqo4cs22bG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690b3fc3 cx=c_pps
 a=Kwamffe9LshCGz4O85X6AQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=KBRu5eje-kLlBGAKLwsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5MiBTYWx0ZWRfXzDV3SbkMmEKN
 6QUOPSx5im3OzjLLFaqLCa5TtiNLWuoudDBy5N2ZzxbAiwAYptCWg+BJc9Aq/NVhcazoIRC4z9Q
 XmNQ2Vk2J5pl6XV+ov0PK1CPpSTI9e8MEbzC8+lVA9Y+D2PLkQcEVQwj//1wSPr0VWjqlAO6fo7
 TJyDSpVgA6jkS8Ws9xy9b1JFd6XQQhLNY4EOC61uMRxBMg9rMUgZZL4j+7VStunxUkoeccSWjDK
 q5NM6mYQb+VgNjFNeoMjImRjWdZZ1bdnZyJeWV3LDj2WMsvPVItnG33ncAWuEdL0s9zjviHYwe0
 asDTuoBXroBA5POijcUBKs8vX9gcAGH9NJmW2p7d8A3jk5DUDAhz6wDL/YOZUS1uzO+Ls5YLjBD
 Fg2JClBao2wbWC2Y/C8BrSlcWfFuHw==
X-Proofpoint-GUID: n1Eu16bBudK3BDKUT7QcGuEkrsfazcKm
X-Proofpoint-ORIG-GUID: zdoQKM8Qkw9x55nzXN9GJkTW3hZNPJBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 12:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225754

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15726]
Fixes [YOCTO #15853]

During eSDK installation, errors such as the following may occur:

  <task>:do_fetch attempted to execute unexpectedly
  This is usually due to missing setscene tasks.

Investigation showed that image SPDX/SBOM tasks
(e.g. do_create_image_spdx, do_create_image_sbom_spdx, do_create_spdx)
were missing from the locked signatures and therefore not present in the
eSDK sstate cache. As a result, these tasks attempted to run again
during installation.

This issue is resolved in two parts:

1. Task ordering fix:
   The do_create_image_spdx task now runs before do_sdk_depends by
   adding do_sdk_depends to its "before" list. This ensures the SPDX
   image generation tasks are completed before locked signatures are
   created, allowing their signatures to be captured.

2. Locked signatures filtering fix:
   In populate_sdk_ext.bbclass, SDK_TARGETS (e.g. core-image-base)
   were previously removed from the locked signatures. The logic has
   been updated so that SDK_TARGETS and their multilib variants are
   retained, ensuring their image SPDX/SBOM tasks are included in
   locked-sigs.inc and preserved in the sstate cache.

With these changes, all required image SPDX/SBOM tasks are captured in
the locked signatures, and eSDK installation completes successfully
without unexpected task executions.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
Suggested-by: Joshua Watt <jpewhacker@gmail.com>
---
v3: Moved the logic from create-spdx-sdk-3.0 to create-spdx-image-3.0

 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass      | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 636ab14eb0..f070b7e697 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2859320ddf..2838ca1a03 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
-- 
2.49.0


