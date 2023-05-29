Return-Path: <Mauro.Queiros@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4165DC7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 10:05:43 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web10.46333.1685354737612817709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 03:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector2 header.b=nx81sncc;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.8.48, mailfrom: mauro.queiros@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apsL2q6oYJUABnheMenaKNgsawJXUmvzV8ncpq9Dtii1o35BdKjI3LgIAYOfKpN0/uI2gR9eFMmWOdU2BqRPr/UmjSpxfbtQOknOJ4kVrov45afe18RNX8P6x8aIROKxUKOaocvugZt1BmhhaxLqFisCXUcCHdVn3GqTJ0MJ1kcUQQM/deF3grlKzOkf96b0KFjEPISQq4s4DTdBWnRHcnLlXd0JtqD2VFtOAWqhiMV1yxb63/n23yoHFYRgPW0D1HpGMS7eUjPKC9G+ArVY2MPnHMMO1xebLHLCuA28nr9UjT+glFNofEvpm3iI4auZIOWHm/u4Zxu3MtLnYr1jXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXZ1c/MFQx6a/y9Rbj0JZJ62VTeSnIegjifquvV4Ydk=;
 b=lKOlpFGj69fVoDwRVh7c1Qq0q7tDaQB0GE2Y5Okwjn9owJtU2sN6M8k5lXDZ9hsNpLiKVoK+4YlyFymUNzX/OHdVqnpVoqNED8CWFvNVMtIuh1hKz1mvFx0Ok7Nn7pi79Pc8qZj1KyZV0NCDfgvYbH71mv4vFsy0M3okq8WvkBp3EvnloA2voOYSo9FkbJiu0FtXCV/Xrw8u8mOLT6j9esYi30qiFIRYluJies+wnodXDm6XViU/DewRoPg1gNb8AagkbzLcY84gDzcUOXeX2wey/8WvfDK7f9dwNamvKtPp+yEX/FBbCsqWiQEMgQaoN/qDy2j9HAe7E4/smEuXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZ1c/MFQx6a/y9Rbj0JZJ62VTeSnIegjifquvV4Ydk=;
 b=nx81sncc0aXwhkX5nBIQljA8cI3jILn+ih8MvhmIUCDJpPgGY+NGDQfDMlb+aiDmrZTNfgdgZG75y33DpgBKniadQ3+mXkHN88R8TeweCPH75dPcDyVPFKV3Z9T7uVBzUU8+jPHzCzKOBt2NG/20TQY2OYeReHDhauiAEeUGRBFs0FkAT+pX/mMSI/IbrrAHYVEa2NxLxpOSUrrL4UirKse3JrXLMCdgoFPgaZefUQ9b6+xtXLLFjtwesA91nI543PXe0ktYpo5s/Zag9hT5ZXjliehtaWpvbj9uCnAJ/ABSj3LkpkffVyOclaTuIbP8QqZRoU8LQOxmfRzqZfndNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from PAXP193MB1902.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:1c9::10)
 by PAXP193MB2282.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.13; Mon, 29 May
 2023 10:05:33 +0000
Received: from PAXP193MB1902.EURP193.PROD.OUTLOOK.COM
 ([fe80::7048:9693:821:f597]) by PAXP193MB1902.EURP193.PROD.OUTLOOK.COM
 ([fe80::7048:9693:821:f597%3]) with mapi id 15.20.6455.020; Mon, 29 May 2023
 10:05:33 +0000
From: Mauro.Queiros@criticaltechworks.com
To: openembedded-core@lists.openembedded.org
Cc: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>
Subject: [PATCH] pybootchartgui: show elapsed time for each task
Date: Mon, 29 May 2023 10:09:02 +0000
Message-Id: <20230529100902.3951434-1-Mauro.Queiros@criticaltechworks.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::23) To PAXP193MB1902.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:1c9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP193MB1902:EE_|PAXP193MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a51d6f-f7cd-442f-e903-08db602c3daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AWpg4pvBDltGAwD0YHQaOWTOKZyYVXO+TBWkUJJv2Bpf97pdjRPCeTva1GIIVyrOjcYkCQaj/TBMmfF9KQqxZvc2MU/WKV3IG+q28/k8xuXLkgXGFPYHQKFnIEe8pF/QzvQBa2R38eoMJ9/LYv+CCqjek0e9dixhXiO2f/zhDwsQavIvYSBMdWDSu5jOkzICWZBO6tX/UoDS0VbYUycJ8BRE7Ndssg3M53LZEm8GzW0Qgv+aO2VwPky8jVJBe07CCcCVn76Lypb94VQjLbB6s78p9eZnauYsL+gqG5rlLx/J0D1zEYkJe8mVihSIaxqV7l8ucq+BxPkVmtuzY3SrGl0yuQBqVMbl2qiNpIQLrRue0YDWMXRuLHjEDvSCJAu+qnLHqNFrbPVd6u0GC6aDrvWkxjl9zCga8+6vr9G7tRLRko6rNCySakGGC8qMpIRWdt7mhOYaDUVWckKbifEwBJ7Qb4Vq0og0kh2Pv6NHmM56rSPdDcTuAH3ty38PuoKl+1E93V9KUJ2TmBP05yYP/MRjpR0hBSOLuk4xMNuaZ2bmDLN72hDidXWYHYzOeUum3tZp9+6lGpkYUOdaBbkZKtkV+u8wthvGH0Ir2D/AaUU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP193MB1902.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(451199021)(66946007)(86362001)(6486002)(52116002)(186003)(36756003)(1076003)(6506007)(26005)(9686003)(478600001)(6512007)(6666004)(107886003)(38350700002)(8676002)(8936002)(83380400001)(66476007)(38100700002)(41300700001)(2906002)(5660300002)(2616005)(4326008)(66556008)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OfrFlh2WdixM6acphuua27KQ0eNNjM7I8CzhOEocrXSUpdsrzi8/68aUU9kk?=
 =?us-ascii?Q?NlwV/RalXvZHcUWMj34pgTowAp3GxndCrEzKjQe1Lf0rJsRXvG4iEwbDlnoA?=
 =?us-ascii?Q?+RvjV6GIRam9orA63Hw0EvLiuPfaiwF58IBt3yRXZTWrJAoOesT1oCfBuJUD?=
 =?us-ascii?Q?kxg1Y87ktaeEAGiQK635idHUun5v5rgoIrybaArlFshLX4U8dDx86KAT65SI?=
 =?us-ascii?Q?iy34zOoVDIbdgZtW1bxSdT8tvlFoYIKcpu3wwIDWpAXArbg8OlS4hMoVtLMH?=
 =?us-ascii?Q?mUE+jA55t7abmT9+cgbIfWq0ePagZEyxiQ6op4/aGI6PHErKJX0I/joW62We?=
 =?us-ascii?Q?49Y9LinhAGvgNecrGUvQAn5hAdB+PKeS+xOQSPEIIu0s+68/+7JB6omujgJz?=
 =?us-ascii?Q?a/VEH51fmuHujKRDizpjlceyxaJwDpaqoWd/NT/eClxIc3FndTLgEGh16ZpA?=
 =?us-ascii?Q?ZMdUc4KCA3PxGcyOvkw36JHUHbH2x2nk8ngiDNCi33p6DyHQcJBRBgy7nOcr?=
 =?us-ascii?Q?fPaHGJhis+hOPm76w3y+hwmaCYOdF4FF7NykVFtqOqZ6hnDqvOU57G1V8C+/?=
 =?us-ascii?Q?PRodWV/DUGXaUQrD9miJEQ2NPHaH/xxoHoaLL8mmli8aGBbINHBkz5wtDG3s?=
 =?us-ascii?Q?Iyjd+/66jswqgi7DHds6RDNXtjrxQoLywW0T6i5uEEbr+pk1uXPHfQ7Osfue?=
 =?us-ascii?Q?QYsHV8xLj2eTzezn3FFMiUq1hgPfv28/19wCgoYYIijotTrjQOVTTZSZ1bZU?=
 =?us-ascii?Q?fPUeWFfh8QsmGAEWZAUl278cRkdJM1ISQrVcvrAehCCX/SMg0kPt+RYAfq0K?=
 =?us-ascii?Q?PtYmGOuMQ3o5LM+Yz9ZqbfnzyK3X4jYo2Ps3SSGxzNnR0j78RfWIR1sAoSK0?=
 =?us-ascii?Q?TWsT2U8H2ATJhacZL0ZcnpsScbwqNQ6988S2Ed89gSAYQNb1QvKScSjzqWiX?=
 =?us-ascii?Q?Ve9Xq6lIg5hRgLb/xrtli9q6Lwl2BEHgiWWWEXYsfEfxMw34TXQRXozZZaZc?=
 =?us-ascii?Q?DrnHWAKRSJ6ot/vgkeOgmGvlZ+Pahy5c6bntHo/LWKFV7SL8hOUkQp3fMLd3?=
 =?us-ascii?Q?wq9r5HQZ8ec5PYf3j+YoO0VKJTkrYw27Z72tmsnOVigZSMdTOwbAbkysv7bP?=
 =?us-ascii?Q?0A+kVr3SyZXAo2hf+9roODBOyj/WZigStLe4RDpHlPDSW0qaqbQ1ZsWjosAB?=
 =?us-ascii?Q?0jgbvpcbQwu/YYSCaaelxAsMudBPHDvyfZ2X+Imo0kPD515QA11Yi37RW5+f?=
 =?us-ascii?Q?fKxtaBgT5uKYZiFFjd8qwr/xPtTiwseRSdC7d3VOUthNjzK6nlhRqB754DQN?=
 =?us-ascii?Q?vCjBOcHozqO0PJRdwihhwLVwN/jjo1DUSzmiaQ5h7WOVmSfieZeuFCQuMWpW?=
 =?us-ascii?Q?tO3PI3dCKhIT6Doo3DpooeGRfbPgkTFzULohStT+RFzUwGnL5Z5lL96qobLb?=
 =?us-ascii?Q?NfI4mQgsvNHVM9w9Y46TWG5UXs7CCoNS5b+OU9BF+MXFuF6LiLNjEuYqRjRR?=
 =?us-ascii?Q?pairUmYrzEzWWYrdazm4PPzTbrGv213i4hIgXjRZ2alM+pLA4BQFksMe5nys?=
 =?us-ascii?Q?lPG2v6FnxIRXzkoATeE+lh8UordpIH6+6t1J936pVfben3c9R2HTMONcoAYl?=
 =?us-ascii?Q?yoYIMdWt/sp8G9my43Wrazs=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a51d6f-f7cd-442f-e903-08db602c3daa
X-MS-Exchange-CrossTenant-AuthSource: PAXP193MB1902.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 10:05:33.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEkx9lfCoFTrTwiMyZxw+CiPehcVJjixixGiApcoi8qpwPDpX59VFRfVU3fLr1DKT/ew/jijUhPwp+VDFIgQh6TSsfiNubCQQPFkRFr5OR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 10:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181862

From: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>

Currently, finding the elapsed time of each task in buildtimes.svg
is a manual effort of checking the top axis and finding and subtracting
the end and start time of the task.

This change adds the elapsed time for each task, so that
manual effort of comparing start/end time is avoided.

Signed-off-by: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pyboot=
chartgui/pybootchartgui/draw.py
index 6d445aad4f..e71fe09ea6 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -682,6 +682,11 @@ def render_processes_chart(ctx, options, trace, curr_y=
, w, h, sec_w):
             draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))

             draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h=
 - 4, w, proc_h)
+
+            # Show elapsed time for each task
+            elapsed_time =3D f"{trace.processes[process][1] - start}s"
+            draw_text(ctx, elapsed_time, PROC_TEXT_COLOR, x + w + 4, y + p=
roc_h - 4)
+
             y =3D y + proc_h

     return curr_y
--
2.25.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

