Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E341EC4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:02:09 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.71])
 by mx.groups.io with SMTP id smtpd.web10.37240.1699884123300484584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=GSVbl0if;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.71, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StoLPtChOZMep2iZGuZj/46Eefo2CR+zOawQBNSmiA4HqzQ6xP48KFi8C7vTjEJV+5dPek4mbFwdRJcH6G0hzNNFsgeP3Yvh0QOw5j3O11FUKTFMzFGVUbyQkZSNCzfN3/waPJnQOTvzeaOS7+kxvCAIw2ewUJihwj5iJFgbAufVQjVIs24jUWvKVJboxYWQpEAgr0RtbBnw6mk8qiZoM5UW0e5xRzaqntm7ck+o+peClwRoCyaAtI4WRplOiNEEZUflbnbp+PVEVPmHRnmyZywyFroc5QNsyPlxDi7U3H5056yX5Zi/XsEO+n+kOXzr9qk3GGR+tAWdJnZUVu4UYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVclCLsjhAqZnqaqmxDdA/oqJevOwMzfPsooz9Qv4hM=;
 b=dKY+GdqdXd5bwRH3mGSZlKqdayjGkwwiJGc+966Q3SPXg7Vaiiijkb+1lpBzOiS4IP4hFa2TgUAyFx/p0zEUifa50eDsLvkD7jrc7WIItlNDjQXk5KnptpGVE8J083CzoflK3F76gY+TwrBdz1U5e1htXQSn0aT2u0qz8VYLQlC/kxUN+MuLpzJ9SRt082hntPMMvK7tVYqzIwRk8B5/MdPxzNIEHGWG/89pibCTjReMp8z1PtX4rZr/8FPhuUnqHJJ6ZbP8G8r52MnDQHbIZpe22xm3QFi7hSMFDGlWE3VVe5K92DwuQ4/cOQkd6Q35njMO0qJill+n4eqzcD/gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVclCLsjhAqZnqaqmxDdA/oqJevOwMzfPsooz9Qv4hM=;
 b=GSVbl0ifBclhdAYHuKak/hLAuXNvf9gJOq0UIwIGBov6zN7q54sY+Gmuf9oUm5c+NHZ1gD9MzNcQ4baAhwNiHIm/s1Rny7PNrdyDHcnJT7LkUPf0OOmNvfDvCBDHLaqsBdAcijfJvB9/WXpgeffWJd1rqfC5kOk5cwZwDorjU2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS8PR08MB6535.eurprd08.prod.outlook.com (2603:10a6:20b:336::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 14:02:00 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:02:00 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Malte Schmidt <malte.schmidt@weidmueller.com>
Subject: [OE-Core][PATCH v3] wic: rawcopy: add support for zsdt decompression
Date: Mon, 13 Nov 2023 15:01:54 +0100
Message-ID: <20231113140154.1048359-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS8PR08MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbd42ef-5383-4371-f13a-08dbe4511af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pGkMIqz1fuOxQ7uBY5xIMmCeuvgMrDFR/ejrGVn0tOiU6uWxly1rkubLHrh+z1yrDcZzo1V91/qH5CoH7RAZYNgw4+5WhzDkCZe2Uut2QMklhBZIPmeqJlheuvS1kFRnf15qzX75pJxQf70bjMa9L5rQ5tELWrf8+ed1dSRRWqc8mhU0DCj1WIXwj+hWJ4ALM6TBrIx4tcy8t4pkNI2P7aZWR8MDj0oqqfCAIoT/3AjSu4/CTdzJMMmEtUkQXbiZ3LehwgyIxkGRAmw/wDl07PWdExDyUhao0H08gB7sOg56lJrbLNXGfnKKXV5Domfo1O2VUaHBaMCSGOqXkPTM3754h9Rbp8gZriPQO4TMkxmd2h9MNVcVk+5BoHzJy6gm4HGxxkrlsbRiV9NBw9CBLVu7mmBevDsiAQzS+WIqsY17J2uzY/62zXLGIZ23DV++MkfFir+GR1o02Jp2RWo4EEpSfEq7hDY9fHbwdnkSKbmzUc9C77YWbYU53jbrhBh1tmHld9+12W6OAs62Qdfc7cDD1GqeGpg/FYqSBOd/ArWqlM76l8RSlvFTiiLs2Ygq1nY+bSn6/+KvG2uZsqas4q/F5N0/pO7cCsg1L2SjHzU1rf4MUY+sadc/7peE80p5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(107886003)(2906002)(38350700005)(1076003)(4744005)(2616005)(5660300002)(86362001)(41300700001)(26005)(9686003)(6512007)(66556008)(66946007)(66476007)(6916009)(316002)(38100700002)(83380400001)(36756003)(478600001)(6486002)(52116002)(6506007)(6666004)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1xuGlJazuNn43ZOPVPdP86bnkAL9IwZ3ldSg71m1QfPyOsk+jvFG/lfsu2xf?=
 =?us-ascii?Q?pAdszycHkQphg9kJQJJB5og6C6Ol39rAdfxPLOIUayNCq6KsK5Py+kd8E1ON?=
 =?us-ascii?Q?Z2jfMGMec3aPjAp7OVskrpfiLnJp+ZxWlSwnQYneqy2uBW3eBpVDVsFPSlRO?=
 =?us-ascii?Q?gJmTVAzR3qQsOLUII/f4RXFqeHPp91xpANtbr6uka86JyWnt4h5bq/CmZu5D?=
 =?us-ascii?Q?hf7nLldfRLo01gktXNCHJgBQQEAXGQhqG89w0mIdBP+NsOuZAFc3IA8aZJbr?=
 =?us-ascii?Q?2MXhVFXECspndwYmU2rYSxwsKRa8+rv/AMHA6QB2gf/AyZI4/HKWfCNWPI0B?=
 =?us-ascii?Q?D8pznfE/fjdA9y2kQ3GpMMEGURti+xsSWYoS+IuYitO1S7SHIvOsvnKcQKOg?=
 =?us-ascii?Q?Nxi9xgN54vcb15YRRaMvbH2HZ2WAhoty/82c3RhOP5suvoktJfLoP1QfbVeL?=
 =?us-ascii?Q?KkzGq5l7nG33yjwj/pPwMbqhnHbHR0SoyuKrpGedTKkPFPfI2S/qPU6R271M?=
 =?us-ascii?Q?fWyGFZh4RKRGImfV1qFQpTZpfxa6Upi8IT2zP5lu9i+G+nOVHOqp5EvS1NLV?=
 =?us-ascii?Q?RTxysmY49M7K/agTRoPm5151w0/KTpzXtBwi0Pshe40dq8aNbVt/eNYPvJP7?=
 =?us-ascii?Q?HswWM0vauSPir8eDuFieG5AMgr4rACpe9OaNIk7Ih2LYyYtVwXqES05u9ztd?=
 =?us-ascii?Q?LM846PhHvKPT/RWrZRQ51SrUYk3sxyCkJmpih5PihLxs4yP1QVivhVFr8Cty?=
 =?us-ascii?Q?RpqLorL3/9VNoA23ns7v1AXzQJOu/I3uA8YnBhH1tJPzacMGRtFNH6DLSbZn?=
 =?us-ascii?Q?22Nlb2qDvqL7BMzHi6UVk1FZNtxdfDVt4EZGLDkNIYVlU3BzUZgeU1hvP6xm?=
 =?us-ascii?Q?Xk7qdaHfq8s5ctksyd1ZENJCDMGW29czAdUdfr5AvcybZGJmR1fqjl5oN5Dg?=
 =?us-ascii?Q?KeIgLluOEWL+nzX5jQ5HvE1g0Jbrk6rq1om91GggZjdmoDQ2UmYvrERxY38X?=
 =?us-ascii?Q?uH/MLeAC2VsTPsp572Iyf8YYHZQaLy6JFLl3j5Uiar1HwDxysPS9wm7dcnbn?=
 =?us-ascii?Q?88KilbqRRhcox9MDAx8/3wREZ7QBMnd4zcTeoDfTWRPL6zuf5vYb1FunjFVI?=
 =?us-ascii?Q?64VRX81kdxlmcAUQQto6cr7mEA/VqVCgZAMSdiqy1y8QXsiFJiOXjkz3JiOo?=
 =?us-ascii?Q?aMY5wzSzWFlGgOtSQeR2RZJfAVQXNWE7sn61eg6PBZI3OUiAbHPY9bvqAKlZ?=
 =?us-ascii?Q?xIoiXzuvyjVvOb4IFGFw/e5vZE/PFV/P1WDJ5OMdpxYZ9J0bhKranyP5Gl21?=
 =?us-ascii?Q?XemBz59XRKTuhr8ZY4ENms+hSTi6UUdSQ8i4lV3AoDGEQUbJXmoU+aDpNsbq?=
 =?us-ascii?Q?iBMFxQswWmPdZ5Ca/0khttDAKIOwX1NBFFh1D6rbuSVUI45LQlEdbMyyXoJk?=
 =?us-ascii?Q?gGTIJgb9fei4D9/cGuE4aygMwtO4xSw/CfFGCk8bKTVZTtZoF9Tsm1hfhG81?=
 =?us-ascii?Q?sRlgrqCSpYs498r3ytBvCsnCUM7xML+sfTipj9Ia2h3C+pKbOJO8p5Adu39m?=
 =?us-ascii?Q?Ky8gJ+VmTOE/iKZX4cdL6gqsunbtEyiQr/K39lKkKLpuWi7zhgQYOLqgFmxJ?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbd42ef-5383-4371-f13a-08dbe4511af4
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:02:00.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1/kKO+gE7h5fmeQC0VdfgZJBn7KxySDeuDQI/tOfpu9G0f0ZBMYi5JVbczyBccy4dD3XEid+9tAfsMRpwJSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 14:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190473

From: Malte Schmidt <malte.schmidt@weidmueller.com>

---
 scripts/lib/wic/plugins/source/rawcopy.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py
index 7c90cd3cf8..82d38fbb84 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -52,7 +52,8 @@ class RawCopyPlugin(SourcePlugin):
         decompressor =3D {
             ".bz2": "bzip2",
             ".gz": "gzip",
-            ".xz": "xz"
+            ".xz": "xz",
+            ".zst": "zstd -f",
         }.get(extension)
         if not decompressor:
             raise WicError("Not supported compressor filename extension: %=
s" % extension)
--=20
2.30.2


