Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31094CD37AC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 02:45:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26845.1778813102150213631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 19:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b+qHYsUN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9595fb6126=li.zhou@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F2Sqlc1308302
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:45:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=NCpLYRqiz
	NtXU3psbmOmpo9jeT/tDhSVHNVNwJFvnks=; b=b+qHYsUN3bk4kC+hPusbTzHSK
	VTJYXnHkbK5JhyYkR1NNlshjsJdmj44BQr30mo9qFd/wKabYLe2qAUsrPU/rOLuh
	ZjGw1SqnUBgDIbVTqU8T4l/Wyuyxew+zbV54pJuqDWMCCf8chHLB4cKEnYxHzYTC
	MahPrC4Q2ZXSmbciZc+3iA3ygGeWlhKAFkAiUy+F6oQ3JD9QCiAWZgTE90Bn87CW
	9qpU7ksnvVIV474sk7lUc4q7/K6G8w1h2Qu/erfQoWfCUTeQc8IZklB2PtIukLKu
	5KqnAyrF12KMMywBpOGEWYaOzJVDftFnySDAnSQu1lsLPUCTX2IOadLDlF5QA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m67rbg4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiImw/FutIApU9UD/8TBr1HGL9scK07464kJb6tBlctoNxDZrwBkWafUHw9KfnaNNSblfJUVzPyMX+xrW71c2un6ZHlkjL73MO1bsCSaMtq5XmdlsbHolteKPH4YJJkoBPC8szcq+LT/R3hyE/ObHqiuVuLVVVNotMKxWgx5+10u8j4x75WbYf76KgEaOGoE/7e5eyRt1SFtYca+Q0iGIl4SnzpeYj2IXJyj6BoGqpuv+NykVJNmmX+08sMhR8Eviv9V+cn8p4+Ku7n4xisEGWjdl9xfyz/YknhvoFNcKSMH+HjF/CxgpMkDaHRf93dg4J4WQgxOJOaqCS9aBO2+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCpLYRqizNtXU3psbmOmpo9jeT/tDhSVHNVNwJFvnks=;
 b=nyguhPc7Ij4PKbOV0xqQZdiYYnVB+xMt1YTDqA3EfgNJnyeC/r7QgGeHS3ruvowP6UIImlgkP99yqhnHOxgAAKqA4nUEJyr9R3A6mY86SvktpSetWYfiU/N+mnQ0T0B4baduDZ4GtOuSGokpueBzpei5aea6DyeBLe8sfX2qNOmsD8QYc7uXs9p2flDUWVShJGPvtDDbyMiuEydUXYbj5/bMLXXJjsBXfgWqIsPhh28+WaklKs6UNFa4vl+eaMBK1BDe9NIrOp0bU9uBNzP+zDStskYY0T5HW1yAL1827lLt55KigsLB0Uzymo0NmjBPnKjR396I6tgixwysktRkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 02:44:59 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 02:44:59 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [OE-core][PATCH V2] xrandr: upgrade 1.5.3 -> 1.5.4
Date: Fri, 15 May 2026 10:44:41 +0800
Message-Id: <20260515024441.147453-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0035.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::17) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a024a6b-3ce2-4fa2-9f25-08deb22bf47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|11063799003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	Iz52uzsa7qO0eMwpb6+MOCYP8iuTJfRLOX18PfWZa0CsgUZyH8jZHVsyR7Qd8gyIHO+QVvPlAqwz+t/ZgmFZ8ZxmXq2yIQButbBXJ5nflCbx5o5u789W4IzuiPju24UcvwcyfMX6yYgKpVj4XQvpKUGUrDMWoTv4VIjuKVr7Jg5UhKhOO+zoDy2/KoWJO+AzL/A6Sw0aKkeizkS35RPdol6N+JR/C64bta/Z+tocGlHEXgGP6DdOeee2fKxvA+If5jN5imXL4W/ZMHu174LAEqC3WCVn97nqCHkYz9Hi/O7nlQQJ4sMgR1WGTMA2ZjTesCE8Jy7kdQKwCVQECLceFh6ojxwR1x+GuKTLq54U/pvEOf6sbmVhlwlQA475x6h4EtEMyMdpq/au2hiDp1exPQ3Lf28xeS9AHZbZJxvPQ+8c4wTTw3pl0w0lgvKsw3QjWpQH6vmTYBWVOk539OZXI+2viExR0rNbtei7rCnc3KBktAQPfF2SINAorLP1wR6i7wBI7nCP3vJf7vKtOEM1H//xoaunQRKf1FKIMvu1YDV5rDI44ydl7AzOnaAaNbkncdNjzwT1OGdEeR+e51SVJkWKqrRImoa4iJuH9M4BWI7SbTQiMu8j8ixPe8Vmag+rTDwFNohLeMCSOneJPtTb2Xu+G+WP7x3Y/SkSSwjdBb1C395Z7dFGtNBhsxNFhNsB6SPCUlhDL43HhBUu9lS2bLkU27Ex/xB2k+AnH+Sa4eX86fKv43LvrNXJ3EjKkLNS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(11063799003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+qLPWx/YFrkyoKSe3T2m8H4MJX+5HGKK/1ViMZYrToJhMvX+KF5UiAeBJTZj?=
 =?us-ascii?Q?bfi+dsfrMrdOsw355Y9UigOtxxrKuPC6R9isj3qUjMw0VqMH6lHLfz3hg2Va?=
 =?us-ascii?Q?sJM/mDwx3HIyKBbV5hs2+BESi6yKQX8HCduHR/Ou9mSeXXz6zsDku35rsh/C?=
 =?us-ascii?Q?RLR4GAZsy2JWpVBmPytPrIcbpNRP31vc/5y8/sJlDMx62ZH2JizofDve85rT?=
 =?us-ascii?Q?9mYMXP+kwRwBzSXxhIleMCepAxef5m8zKuUc4In5JxLI3jKoVmrTwcTkHeHL?=
 =?us-ascii?Q?O3xhbVLYuMF9T9Jp9SFcZrrETzkVkeBhelc5y4MMOKgXqBNRi1HR6feg1sEF?=
 =?us-ascii?Q?Jwy1m1v4F3abAUc2bK8cFj+WhMwBXZ+aEoB26LgZUKIbk5kxKcFwlSrW6+hJ?=
 =?us-ascii?Q?3scJhu8ij3xIDBLBR5Xa9roEKvXuExZqrKrCfpNBCEf7ileWM5Aax4MedWFK?=
 =?us-ascii?Q?FhYQ5H0cVmq1ZzaOCOXq9tKGzZC8MdkF3gCO15QvYQAMVXQgWf3YxVfDB5Me?=
 =?us-ascii?Q?LXbuOkTaTU11zg5u2kacgz2L8qNfrss8BYHLXdNONsbhpYEosdPHa95OZF+l?=
 =?us-ascii?Q?fTL5Vc3c7lZWx3ZkvyA4qHTtCFc6oJ0uMqw51Mqi2/6wD9ly4uG/W8T92Lax?=
 =?us-ascii?Q?/vaSsa2lek0M24BrDXxxohmS9qqzJpH3isj2xg9z7cAxZYakLWD6OJDVU0Sg?=
 =?us-ascii?Q?fFz1ICMhV3k9mpVmqqc484B6zQ19cBVsz8vo7DlxPipbollhdYAPGuSRWEib?=
 =?us-ascii?Q?yf5tplOhhGK8wiz61FLKW7tL2NHLmbvOUQt0vKrpim+Nil0rMLPEaSOlmj5D?=
 =?us-ascii?Q?QYPhoNHTKc0Y9U/7nX4z+VzBmze7lGURh2HARpZ4T1M0s4GWJIQ4FTdG6E88?=
 =?us-ascii?Q?6BBH8XqYXcvaXr3505GU0gsU5G/7D8EH5IVJGj0nPPPqph3pC03GxUFCfG8R?=
 =?us-ascii?Q?R1E5OKTtEGDi9iRcSCTXkSd2vJL0IswHNni5O7QvHr/Jl3xNjve/b3ocJSNG?=
 =?us-ascii?Q?UgSuRKNGD16eJ8gl4GTZE3bS2N4udeMYZDMJMIPoaLRgQKhE1GQs86pv/k9E?=
 =?us-ascii?Q?ybf1C+UXJWAbZUyQeuIh2ypyvLDogW71ky5iUuOfZUycpLwadTM+isLtNVQU?=
 =?us-ascii?Q?+CNxFxa49vuqnD9DqTVYbeeEchynrFhhhqE3lOzqmVu4gpJM0gIf5vyBO39b?=
 =?us-ascii?Q?HkQ7KBj60MNBgx1uYvBs7J42jFx6yhJvKzbs3JYIhEELyS4xmKCewDCz6Emw?=
 =?us-ascii?Q?cWpaE2yIx8j0PwnHxn0rZwViYoGZIOsUXFciKyxpLk/Y716a5UHv3tAN6Ntc?=
 =?us-ascii?Q?p3O8ArxuHu6e2RdjTkhXVhry01VqGGRsIgACvOf2rOGqhot9iU38M9bsAs9B?=
 =?us-ascii?Q?Ie0ONGeKzjG0eW6wQ2wnz2a7e2uZsCXCk6NxB1NAFasKTdh6299EWlkVdgXL?=
 =?us-ascii?Q?HWcI5ciHkbHdGu367t6Q87aLFuzR2OyfaDxu92y1Gy5ULbft4SGXo7wYeKJo?=
 =?us-ascii?Q?G5vfXo9IAllRcbTU/9alXX9XfLrAbpHYKy0En1XsSxxrq9/sun9hVUSTwErU?=
 =?us-ascii?Q?AaAVzBKay4XoC/8aKlhovtYDU9U5MVsRvRHgGUzapzYXWSqjEp9qjNp53Ekn?=
 =?us-ascii?Q?ytvJ6eaJ0rBdc2ieUhmHn4JU2qHvMXeY8LCsbhP6YiPXeXRYn/CcwfmskooI?=
 =?us-ascii?Q?mhz+LK4uSVlI2NSr9gi0HAmi2ANykoyohMBU+dc8BpFLCAalAPGk0KOvmfLc?=
 =?us-ascii?Q?usXp+0ZxGA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	cgN5Zopcvz5psvCtuF/sXFEESXxJi5RHw2p6wgaIzKKzjvwQKWK2wNnsA9GWDBDGnR7+cdG+EHPFcH7OWyr3m1eqFTBmg0UZaEjmTdUSXFSKvqCYwfGHrvmZLSqaCRg69ihTFbdIYsbWg35MD88djMUFYzW99R8bM5gltVqsA0lPl+DbRFohsacAqrxFFe2vjaOq42b4+TLl+2Qm6IujiYJyIRq2VGR7qp8ddr4itU6rrbAYsvRwF4ULOv+mx55iXUZRzXJCrj665Nud+/eQvDWEOh/TQvWe0Hvlxa1Ve7SrWa+/Yj0qdSX8fcXgtOMtIwvE++4GzjMUTHFyCH1r0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a024a6b-3ce2-4fa2-9f25-08deb22bf47d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 02:44:59.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ff8dk6Qyd+8wM64kqBzy0Nb2G+e5MjZDAHlkx4b8hnQD9yAouFYYJ2y6SRq/fo9uo5bUiBzeQ4FPXKQCu9g7uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
X-Proofpoint-GUID: -qHGSskkCKxYMJx9rBeHny2UYMLOkeqs
X-Proofpoint-ORIG-GUID: -qHGSskkCKxYMJx9rBeHny2UYMLOkeqs
X-Authority-Analysis: v=2.4 cv=LMRWhpW9 c=1 sm=1 tr=0 ts=6a0688ad cx=c_pps
 a=SMA1khf41ao6nOkIv5XeTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=F5Vi2CEgCvfDx2jnrcAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyNSBTYWx0ZWRfX0EQzpCmTyQMB
 ecGM5Hy+RJgQIyZrqkC5mQZDgqQi+F2qsNVn7MRDxyZ/95fMwXWFqSKJfcD6LrCICShPlApeJuZ
 oTqi47L6TkY/jlyE8bkvreVHbLDaaxuLsV9VAEre4aGRhEjAeA76juYVJXi0efi3pNMTB0FJQIM
 lUNVOxr4mqhuzf2butgrNPcCkh9nuE7HKSvhOlPXpophLX5/LMDgDYxsIcmI5g87sUnEbmMcEf/
 WK/ewapsTvzbXuNgGJK9jbjucbk9iAkcjVF9PKj9V43TvIxyrKfBZP+lzYiRsSXYZPOfBJrIfOt
 JKHSptZCfa/jAynS2Rk6vFiYfUQMFOAOZWo96zN/AOgyyDgALcLMLL2V8MPlNMvMJfyNyed+0bQ
 N3e9SteAzGGd76ow2+4fBOOi8UwCE3vkJIwSJH4dwKVWRc/xVXWvhTiJCByWHeWJWJaXDVSUuV7
 USqYhXSgY8z6Y38YeLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237064

Changelog:
==========
- meson: Add option to build with meson
- COPYING: Add missing copyright notices from source files
- gitlab CI: drop the ci-fairy check-mr job
- set_gamma_info: fix heap-buffer-overflow with empty gamma ramps
- Add more checks for malloc()/calloc() failure
- Strip trailing whitespace from source files
- man page: fix warnings from `mandoc -T lint`
- xrandr man page NAME line doesn't give functionality
- Additional man page formatting fixes
- xrandr.1: some editorial changes for this man page
- Improve man page formatting
- xrandr: Warn when running with Xwayland

License-Update: The COPYING changes in upstream commit d29cb495 add
missing copyright notices from source files. No license change, no
impact on the recipe licensing.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../xorg-app/{xrandr_1.5.3.bb => xrandr_1.5.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.5.3.bb => xrandr_1.5.4.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
index 75656af9ea..ad864c8ed1 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
@@ -7,11 +7,11 @@ reflection of the outputs for a screen. It can also set the screen \
 size."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=97a36d5c66965b1cea4666b3708ca6e8"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "f8dd7566adb74147fab9964680b6bbadee87cf406a7fcff51718a5e6949b841c"
+SRC_URI[sha256sum] = "2cafccb2aaf2491a4068676117a0d4f90ab307724b96fffc54cd1da953779400"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


