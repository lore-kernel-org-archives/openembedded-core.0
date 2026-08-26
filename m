Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BBFC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:37:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7874.1787733453579052003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Et67cuIY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698864a1d=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RsSH3369885
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:37:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Tn5YxM45c
	KbbJrSsdCi1Q4ydoGNxS0qa+DwmKt3yvT4=; b=Et67cuIYSAA0ClqwK7J1tpHLb
	ruu8ZFW+SDE0aJ9GiE1VldXTP2bXJJWWylQD1WHFxr1/2QXdxO3ZmR00Hx+PnCNj
	L8/oJOXRIj5GwENEipr+2WljZON+59V4vRbaHeKs0sCAk4LhIx4Zer0e20d61/bH
	CTBopmSWRYnWvqVBu/qxCkQPdr+r5N3KLWPxHKLlSFUEnSlHjKLxtojrtCIj3gep
	n8NPdPlPZQHyoIoE3wZDvMFUN3U9Z/stmh6fLZI6gPXG5QAim2braDAN1W833rH+
	+F+Q++U2tVt1cc6vJpmYYrdyXmvGELTkL7XXH5z5/cCw2CJzdyLKu0yWOjW2w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023072.outbound.protection.outlook.com [40.93.201.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gp38a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdXmqSiDgaMJ8vd2ItYJXwB3sqFA+NOEKdY0kGRYL5FHPVjIJPav8yka7DTHQOjYEbAz2ctjTYJUQz+XSBhJVYVXb/FQGa9lw9EZD3/1B+NckjMhojPNYdxBg58waChUxowCbFGUrLySY1OW1RaY4VCUvp6ey7YJSUBzePShcX89U0nTs5bmYWz4vuSIfqOAFtf+MvJj3PWCU/0/CL6Yhe9C+siN/aBM4w4ukfqi1Nhqan2gEhgJ7Fg2mbKgRh0ku1Whr78aCgnKEncX6R/2idGh1I32ra4DXRcz3faeQh/xmB4K10kZ4QOCkSD7nIDvf9tpk2pApnjJkGQcy/6DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn5YxM45cKbbJrSsdCi1Q4ydoGNxS0qa+DwmKt3yvT4=;
 b=kKuKt7kt7d2ceTCC8SCdq1gg/1P/4mshGyQHdXkllIu+MMQufMZ+YNDmGFeFrwbMLswIo6WLHpDLoS1n+1gTrpoqB2c1qQQo/wNcjh0xcJiwYkirRxvJ2UWa/Sxj1phG9ILgV98IwdhwhfiP+DN1etva4eh8XlsWYC7rP0PSLCL8ysnUmtnxgxZ79TRX3JSOQC+ourPereddAcmorFjmFra/6ZafpWiUhqH1eSvSvVs6Ljkxc4sDLjIhY2W8uR/sjOzT5CeER5ZfgIbSo5shJiRhEagfzIThjH4DwWqI7beTTovrHT/biqDcy3x4mUJEkFVb1mvkAZdCD9RuARWmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA3PR11MB8965.namprd11.prod.outlook.com (2603:10b6:208:582::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 08:37:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 08:37:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] kernel-devsrc: normalize Clang compiler entry in auto.conf.cmd
Date: Wed, 26 Aug 2026 01:37:11 -0700
Message-ID: <20260826083711.3771175-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA3PR11MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b74dfe-6656-4412-5f71-08df034d4405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|56012099006|10067099003|6133799003|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dYO1OfynT4BxjLc1YhRAWu5zaQ+i7l10i1gGq8ggAt3zfYcsXtlKsH6vAdS412jbkjNmcus0yMPOBScqYs3fhPA2YAC/UCwN5gLkKFpQmsRqdzFbkkM9CINejPppckPqbUgm/hrGjeOV4n/ppX/rQ65pTVtpTIOsCSsuayUry8ZJLuTbVL+6RxXlYP4dx3ehgGzvAC6CqOGHE0j53AcT4Kusr0Q/AM7Mzl2prIFo44yx5b7h4OdJGMySNd6U581VItIxj5Rvrj0xNYS/pPEGwCQB3EMjuKQvwBH7AcckAYWSAvE26yE6QZPYrPbSpU7eUe+MFyoN6hSg3MxKe5dsl5bdrFsHysvrqMxAFj+jmVHReEs+o6TgMpZwlyUKm4wI/flqX2+nn10Lq0H+gNJw9zz0TgdtC7HKU83JmUfsGTRnN64E/Vwg0MrmGbSJEDCyLI80CFDo1qqN52jTTy81tG7xTjeD8VgVFj0GM347EAgwfLCcuEErPnsl1speztJT0tHyzdWwlIqg7slCmjMwsgAQF7HmDtyz0STE3jKAygvo9VOlpV4GFptfVQWOLnIZ7yiD9HihhagkMCwRXHfeaEMF5tsR1YehkJ8tmltdw2ps3gjUtrX7VyWQ2lR8Dsk0SqDiY4llrcoGG23WIs7gqb3mi+JMUYnWsD2eGnbDux0ElRTSGLr8pvKuzOa/IjMKnvjmv3Pc1yTnagjwy+xze6K/0Km1+1aWDkfdSqs8l4Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VPKXKN6Flwh/uro63ZbAmDgrv8pDSyLc+ImvLR2nLifoUBIcpaV9G/Tc8YH9?=
 =?us-ascii?Q?8N+JrANGZhHZjdCx1g76/btbXlq9mG8tUsBr3bGfG/1DlDfUrVE7+1CJouoD?=
 =?us-ascii?Q?UnDdf5gTp29F7DcMM2iP2voidoul5QTVnO3igD4Ge0ADg9lksjAwcn3PfzwI?=
 =?us-ascii?Q?qHIxNz6BgIR3N1268mua95jM70CncEBu+7JUozRd62CnKr4iN5LO0Rc/ZfXQ?=
 =?us-ascii?Q?ekUUVma5rHt6SRxMxGZEaQ4mkl9Xv/Q2DabI9wqnN/UiW7erqv/aXHtPGgvG?=
 =?us-ascii?Q?+OS6jl3PCyeNXsCADZFgiDXKnsKyzzTfxhdRyTa+j7ggIDqogiCJ0QUmJ31L?=
 =?us-ascii?Q?Gd7XJc5q2A7M58mrl2lesmbRzi1I4IaYGL198oLK6nIj+7LdkcMMNdI0oCuC?=
 =?us-ascii?Q?9VZq9HT16O/uSq2EUfH7JAJsOA91wVPfeAwNUbArWXI4mrmsfT65ds8wOnDh?=
 =?us-ascii?Q?5ZC/kn+PXQsNdaLPprpQFlwhZwCZCpAinARdrisI/EVVszAigIQxSD2tnYDS?=
 =?us-ascii?Q?l67yzgioW2dWFYOYjPDKmpsoTpVssZKLztTFkD+x16CAG+TaYwIJLMey0pYV?=
 =?us-ascii?Q?xwHaFZVuCj8Tema1Bf/CDvo9X4pUh5af6Z4Lo005e7BBqOgr1mQEXRsMTgbd?=
 =?us-ascii?Q?xxw5M20pjK3y48PsAiXi80xanyWwFY84YG32379fEj/4g13zziC0iTMqdWOt?=
 =?us-ascii?Q?fhbnD6AC5oArVppr2NAc754tuIvRjPvk3TZYKfbeB9TLOhE4ADOylIN9KLJJ?=
 =?us-ascii?Q?BSb0vN7jz5kVArKAOsi65PQ6SUrCp8OOKg26FDk+MCqCmw6XAafGZJR4RNB7?=
 =?us-ascii?Q?685surp+dKjdV0Us8lnzjl3+b1sLIbhYV3qjH1mRWhD4QRj0O56/2B9NVCNx?=
 =?us-ascii?Q?iByjkXgu8O0KHWjP2mUDbW0yZpvdCdz9wBK9A8MmMI5iqcxFQMMowsswDOgM?=
 =?us-ascii?Q?9C0KTB+Ox3KoT9W64m6YILIvG8bu54I4yMLXUnoBHghnU5DfQe5w/bnWEHm2?=
 =?us-ascii?Q?HBeSUL0Obv/82S3U4/S4a2C572ipeglfhjf5HRx5XGa/orR0qawQD2n3seNB?=
 =?us-ascii?Q?DC15enY5WvImdEavmMYp00AivGzsDGkfiVKcutG5W8j3Khnk8bxJnQply/2B?=
 =?us-ascii?Q?n2+UHr7rfi7l7OQ4xfBsuyZLa7zd7CE+uq6CrfuFriz4cxMo0engkYTV67jy?=
 =?us-ascii?Q?akx8bapiKs6ioYfdyHb/sM6ehxvBJAji7BHzUPQKVXniTS3DXJDa8uS4dAHl?=
 =?us-ascii?Q?b1qcbJWFd3jKVloDD9uFLz1Ie73y/JNgUKwCosp1r4RiAm6NDZ+sps1+QjVt?=
 =?us-ascii?Q?7A3Dhiq9/8IWifCkWFYaq7wDiGOOURkyNd/c1/eUZKARTo5jJp3DC+q8zJ3i?=
 =?us-ascii?Q?XhIEN+EXIe5DjcSCnE9fqcfGkLGNouawkLKQSX0+BCQ/Rq+zz2A301g+I5AJ?=
 =?us-ascii?Q?xvXLXW7l4GngOiPancMZ+Qm+Fe0NiAOKYkLIwwRkfSnyp0uVDpEcJyLgx7R5?=
 =?us-ascii?Q?B/O6FcHUq3UbchTGtesvlW8QFwE4P5uIFaD45ATACvqFjFRzNTY+gED3CM0Z?=
 =?us-ascii?Q?aXmoaK85zQ3IaA//t+IzLioNbJ9HiMaDZ6c6PPt6l0CusNazkfl4M8wlL42E?=
 =?us-ascii?Q?Wt/xZwf57+lg6/cVx8EZR7vBUGp9mxtjWDavaxKYLdmh4OnsEeJdFn3IqyCg?=
 =?us-ascii?Q?Azi8jj8X8Bp9GBW26MjsXIe5/KaCad4FMRZncR10LFIKwoiWGbZ2mr4kxsmO?=
 =?us-ascii?Q?CClQEJqREbMtzF3dtI/4AlEkRTbL4Fk=3D?=
X-Exchange-RoutingPolicyChecked: 
	WUUj/RRS++pUfX9FVaPCPUcSUmgiVLG2ttZgUs2Kb3igovyiaR7cyHB+rQCYawkY+h2P+TRlDcT1mvFug809KJw5AfRjDPJpi6nVIRN2syCLlbKnKHX8nIiBVJmhENvQ/iRbtKHvZGr1rid6s7PRLtF5c8Y+vxabJBWSWIP1B04OX7+x6lKEr2WLW+CkZuZneS0d1y8lY2Yx2yMB2QcIejCK35Pgwtw2yMTERQxhz4aJeOkWS5lxXTs0X4eZiIZjMksGjDg9HydGbFx2HrI2BO9lRmB46Jg2zIBKCjXH4mPBQB9/k7nsykJTnCaefyyaI6lYFlidpBuqfBbwIBWuKA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b74dfe-6656-4412-5f71-08df034d4405
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 08:37:29.9291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpMITd9g778FBKbS5kPB43mwto87aqGwWJk3PMcSvb7u4RDdutat2JxMO4iQoT/61k2A9QzEDAndNtPKa20NOvLDwZ6u1DjxAtgCCYSwzVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8965
X-Proofpoint-ORIG-GUID: OEMoWUdspES6_FbtpJM-JuyPii7kQfWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfXwSTajWRjH1Np
 ZAnUO+FveizQWYMZgmAhihXoV6ifcITm1xJ9WIX2QkLsWkdAASLf20UnX19PJ5Ea1e0CDaBcs63
 UhJmiCNUZOH126vRc83rRxsJVEqnjIvRWZZTYhRpHI4OduqrHZomgal0JfFChF5eJX4jDXr32Tc
 kActWAkOEodfST2w4LvyfI11uDynm1v52MzM967Q0P7TCteMLmdgrr+IetK08+6aUgUUGpFNx0g
 s0OCEBZO4i8tNRjMIos5ISVxDkzUXf9shlbbF68tZx3okH7xNKgCSmh145FQaKfErBmZS14Pusw
 MOKtu6JIBuqYQ1QtcCA++ONwf1f1RZOZ2H/JRdgi0rKSlp5OQF6BbGQqXhiS9mWw7Zd51VXGott
 p5v8ntyA4nGLNzxH3RZCfnHLzvXmkFYWyY+DoDEQvmmM8h+97diMivagFXPRqt45pJohDdwquHk
 Cjx2P8DZr/Yp8N1+aWw==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8ea5cd cx=c_pps
 a=a9BdPFFbNpLpmASqG3lITg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=hGyvibDXF9j15EeHaVwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OEMoWUdspES6_FbtpJM-JuyPii7kQfWN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX0wJWyeER2DDe
 PBVgvEMk1YprE3+3UQC+2YNGCvtLJCrhz+cspZaSh5NWg9gUWgwF449eWoNj1h3zN6zmtZeItz4
 SHc27lPr7fCIbkdKlLvXOr3xd514tBX0UfKICnl1qJiQBVyA6HX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244377

From: Harish Sadineni <Harish.Sadineni@windriver.com>

fixes:
/lib/modules/6.18.35-yocto-standard/build/include/config/auto.conf.cmd in
package kernel-devsrc contains reference to TMPDIR [buildpaths]

Normalize the recorded Clang compiler invocation in
include/config/auto.conf.cmd in the same way as the existing GCC
handling.

When the kernel is built with Clang, Kbuild records the full compiler
command, including Yocto-specific path mapping options, in
auto.conf.cmd. This causes absolute build paths to be packaged in
kernel-devsrc, triggering the buildpaths QA check.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 2d80278830..a38e4fed44 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -420,6 +420,7 @@ do_install() {
 
     if [ -e "$kerneldir/build/include/config/auto.conf.cmd" ]; then
         sed -i 's/ifneq "$(CC)" ".*-linux-.*gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(CC)" ".*clang.*$/ifneq "$(CC)" "clang"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(AR)" ".*-linux-.*ar.*$/ifneq "$(AR)" "ar"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(OBJCOPY)" ".*-linux-.*objcopy.*$/ifneq "$(OBJCOPY)" "objcopy"/' "$kerneldir/build/include/config/auto.conf.cmd"
-- 
2.51.0


