Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A1CC54E4A
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:41:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.21659.1708958455668094328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=tqOXs0+m;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.138, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYp62F7oeqPVFqwLKhehMLX01MNtByR3vjcLZtaFwRKda3z5tsyfzj7SULK/Z0nAuZAnfa37zen2cV7pPo1dU1nWyyHDf+qs5yH0RD9FNYT4J1j1W1rNcDmPTz+fJviq4qGSNC3ZUO3AK5uxyKZDicFTDscH9YD7w8LPMBROFfxT6CxZ2l4L6KdEkEcJD68+FDLpjIuvf/g3rteJNngE7G22o8MuQlRW9uetmf354q9Ss1zrk8kS44O1AdywBGdgxTdFDj3wmc3MzXPiv5JWyFj/PnghypEuFg8BALV7ZJjl+tusdGdw1d7XksEc1HaeE3Gr83DuddREanpz7N1QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQGiSXr2qWVFV9zhKTm5zfDLxMWapxggi0QP3NXyoPY=;
 b=fqN61ToFw6pQpXd2E0JNKuZ2ZKuZL9eDxAjfvS+wPKHqFgxzb7wS06n1lq3Mddufuh/o4T8P+QQxREHOwo4SjZX0J0POl7+cPyn5ly1c9f4CSRkpTE4dPvZtj5KaUxHDgnx5x+nQCVVo/J9MKDbxiLmmgqh7IGwrrqTln3it4se9k+xzsj1GJEKghoENiT9ihDumqqWJyi/Ar37TVRi0JavVvfwG/4MnJIbP8YT19CRyQyoDImW7BMGlzpaZzieDR+YJY3hrKIoxQDxg8mOIM6/1RMtOgsQPLIlyWk2iGGWZ50uFkVWnsnAT9qkIZscyDc2+Lkdmc8RrOO9Dq2dnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQGiSXr2qWVFV9zhKTm5zfDLxMWapxggi0QP3NXyoPY=;
 b=tqOXs0+mKtKOk3Gp3iTIq+3BNWo8bpbBj/CH5xQMlCvES9VUOK9O9kOHJJEEsfbW+bv1a0n6E3hbNqo3U6YrxtRhr4H0qmo3VoMhevGnjgLzzBfFol/dsxJE5fpfTXHn4iVSVgDr8eXk4+ncGgobHUREzgdAvbsuUt3f9WgoRBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 14:40:48 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5%6]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 14:40:48 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH 0/4] go: improve vendoring
Date: Mon, 26 Feb 2024 15:40:36 +0100
Message-ID: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PR3PR08MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc72f58-6a58-4444-ee6d-08dc36d8ec6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4D9krY4Jo6SQAEElXaQAiHqGQ+THqVqAYwFt6HNstNEVSJhqxE5hh6e6MNm9cmDIEF0mJjHoAN66CTu13lC5C53ahwpSWIJ9iA/yz/Z7Argbe5JJRDCOEm0f08IPw0RTQadaYbF3zdEaTDJl6zBUEhGwGd0xn1+GGcn0rAIBb8rRyAuYCnUo0k+VdV85SuRa4k/Varw2RIWzzu5vP2F+sQu7o8yrBR+Gg9zpNBTxtkyK6LV34bLsP/ydNh+eahNmG/29d1B9bpCGZiG1xWAAaJ4CrosbalB7DzuDDbLYlORT73+MNC47bOUWxboNlxmbKcYLpfMkaaMvnebiSB73OnOR5be9RX15KsAkYnxYKZI5cqmOay8+ofQIbc8+pTQSpaEd7eDU3axnnIH3ANxqphnuxwo8sFWCbj2DW65xogCWTINLGKvo9S/vT+iY1BXVk2qo78JNyMMY8JebMtT96NrX1ykOCD2rk36Y7l7tmJAdc+kAI1PIRSWe1ztXRbQsxlgLlY43qbvDqV3KpLwxLhUdN0QF+lz832NUlXZ371UAV08YVNHP6jV83zlNRICIyglsxzwDOAStl+way8PM9/s3+NtxTYhkFUF18+afOPfljylZKQY+cHjOCrlbF3bcbRUnHcvwOHXvuFMZ8tcJQ7VLaLs/QFHW3xCHmFHtkwE6iFwgp7/kmGE1bHUGXzGQYV4HwLeUBqt5/m12auuAzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gRShhHWVf7T2q8gFrhM3o8PyaUeibg4Bjo7JZdCrbkBPZQizTNBjJu2mgila?=
 =?us-ascii?Q?9rul1rOTkKnV5TxZBUwe3b79cM5engRb8Urc1If62G0Myv/HE60VvoiAbZ/P?=
 =?us-ascii?Q?D8MXO4wf+pLLOUMxlNYUwLZbuhf13FNRDIE9JEvl5WbHroKuzvFMThIDc40e?=
 =?us-ascii?Q?3UoZ45jjnLDQntbVZBUSgKi0HYrNEIuidPOfOoJi/FiI3BCwBvkJBITGQe0m?=
 =?us-ascii?Q?tMV7+Hj1axh2m1I53ECI+ysPXqz3oPQccBFKgzFn9r04pQ416gdswQ5E3Gdh?=
 =?us-ascii?Q?2/ZJOBYA42bikAhnNp7y1/6usRdKhM94xHaf2nUTWguR5H701v5kkNg2qoLY?=
 =?us-ascii?Q?mHyycJiHHZEBloifvuw9krlKofVh2AYDcSI/476ZyPXPbspcoAupMeKTCYWh?=
 =?us-ascii?Q?PIW1Q7QGPQAcSVOAigAtdM9oTeY5w6jWAltthY74Ac22mosC4u2ET7LVIZ0Y?=
 =?us-ascii?Q?kvhpmCWJkcuCRvEaIyw7tTfasHOqr5QuH2oDf0ptKvhi6A/xT+bqhc6wibu6?=
 =?us-ascii?Q?w5owipwVl6oPmF2c5SWQgO67D6KcUXaXgaMOTlwBMYwdZzQTVgBvldiQZABy?=
 =?us-ascii?Q?9z4tuzXcXLzn7ti8VI/2b8LWLgQWXeQwgMENz8rd/m9m0GkiYA2I/GDeaPBn?=
 =?us-ascii?Q?x373OJBACLZJS59t1YERvDXawPo25fXL1iW2Hgxtaf8BgoYJeSMzlK6cQs3F?=
 =?us-ascii?Q?Ql1T9B79TooYcRmeNOrcfb1DVSIf1zSEl81mS4q+i1qGYTT+mbMy059Y7SGr?=
 =?us-ascii?Q?QAeWBSYJuSpA00D0+lLTMOQUm9lLvjAULY4S95aXexN5QCfPx59wE5zqyf10?=
 =?us-ascii?Q?2tTbG5w2HGA3RQux2/V1xl5z0ObGwBkYQyCdXhYBqLbAP+g609pGupTj04Y3?=
 =?us-ascii?Q?HS/fsw41wng1ad/u3j+9xkK/YJTyBV+ZpgOaLIqXW68xRtQlZHwA/S9goWp0?=
 =?us-ascii?Q?KG6LsnfawOrkYAIIilV+fqrTSaSjG1IsB0jcarhEMeLyBJ9ydZCDCnRpRG0j?=
 =?us-ascii?Q?QMN1aH6bJPVQKIGlp+8kwzO7C/4WBV6t0IqdRmsVTKKt+C65i/94xhvV+WRX?=
 =?us-ascii?Q?8bvEStGAEk8vtaqlyil/kQpSatH48teFYJmnnTvM0DNtI6Ts/eia08O8Gtoz?=
 =?us-ascii?Q?mkTYjl/3kW1KY9/X2ghE/6hcZWVF36uICFm4hnvi48Lpw3cOksaZPvZcws/A?=
 =?us-ascii?Q?NWuqTm50bne54/qeRFpzTtuR54fmrIkUsR4NyU9KJjmm3Dn805uEjnWvS04Z?=
 =?us-ascii?Q?VfLVhWEBY2hY7x3Er98VCeF21oNnYkZagrSOsKOjQcJ4Iqn/sGFjIONp3d7Q?=
 =?us-ascii?Q?4Y8Q/4xyVCT1EhDpVXDiD0xWYwefG7kLsie9mIKAzri37+obsnh89lP0ntIv?=
 =?us-ascii?Q?bjJcFDiqESUWjvS8EETSTuFlRBzJOlrXObDCK1EEADfOyz4VbZ4qjuABuNcK?=
 =?us-ascii?Q?wrLvsjy8I850pq82pQQZCUhguIku9y9UInbCRAA4NBFedhqp9FzmpPJHCEq8?=
 =?us-ascii?Q?21Cock6G9TQzYqu5qlIRq8Xf+PjlHKYzqVKAzplSVxZjpMZAo0eIT0lFi3zp?=
 =?us-ascii?Q?JJ7nIMjVZRjLJ5SH7NWaYgKNfkdlFCN3Z8Y7ToQ3FGyDcD3tJ1CMlYbPL3Eg?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc72f58-6a58-4444-ee6d-08dc36d8ec6a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:40:48.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Phw1GYlWqZOgDHquOSPxIcE6QAV6M6UUz67SywVT9fH9UAVyvHVTidzfwa3h8PeMbPgsWyIRhiDufDizYu+2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196207

From: Lukas Funke <lukas.funke@weidmueller.com>

This series is intended to improve 'vendoring' for golang projects. 'Vendor=
ing'
is the golang mechanism to build go-projects in an offline manner. It enabl=
es
the fetcher to gather all dependencies during fetching-phase and unpack the=
m
during build into the workdirs 'vendor' folder.

During testing on our go-projects some issues were discovered, that prevent=
=20
clean vendoring:

 - The '//go:embed' directive enables go-files to include additional source
   files. These files/folder are not considered in the manifest created by =
go.
   Thus, this files are not copied to the vendor folder by yocto, resulting
   in a broken build.
 - Some files contain additional '//go:build' directives, that instruct go =
to
   ignore this files during vendoring. This case is now covered as well.

Additional changes:

 - fix an issue where some go log messages are included in the vendor manif=
est
 - run pylint analysis on the 'go' recipetool part and incorporate suggesti=
ons

Lukas Funke (4):
  classes: go-vendor: improve handling of go vendoring
  recipetool: go: Do not restore go.mod/sum file
  recipetool: go: ignore 'go: *' log messages
  recipetool: go: apply pylint recommendations

 meta/classes/go-vendor.bbclass      | 324 ++++++++++++++++++-------
 scripts/lib/recipetool/create_go.py | 362 ++++++++++++++++------------
 2 files changed, 449 insertions(+), 237 deletions(-)

--=20
2.30.2


