Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487CDEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web10.186319.1692276425651255430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=tSaQy0oV;
 spf=pass (domain: welotec.com, ip: 40.107.105.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvqR/nATUV4/IUegHWKm18iDEjujWtrMAziJZi0Ogz6HRE7vcgsQp8m9gW9a/a+52BGD4KDcp7T5twDciquBZV+OlW82gqkFVhfbADme+z0a5Z8GVhEd7g6z8T5f8vhpyBxYE9UUfJ2MR3XavDi1cZEQ221K42sA9o4fecDR4rWBns0KGv1AwH3c0kxmzrsey0yPq7Cur3TRXSRXrHmE06TnH2rmxpaK+qadTusKMffIAiohKOl8LlP1szOVeGFOMhs08PrKoJ0PvIi2upiZaucQClJ1S/wVYcMw6oUGykee5bJJ2sP0kWE8Je8EzZNP8M36IZ6O7+exFgjlTQa0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IBMFVh4wf17o9Mrml1rTHDO94uCT1CWpgan0449Ea8=;
 b=a2nJhD28u3/H1LEB2YPsHq8yC0p+NEjwm1lQQ/aqtwGoE8IkxeFEyyVmmx3cS7ISoYO4qgriiUR7qU/OkPMiyqK4K5FjZvVxz7xByi7KVs60aKfy5ycE5cYuq/VlnDhD/4RMoqK5VTFXNwP8FXbr50XxG8SLyCOvp3GafKmz2oMXeGwrOk8XT7NEf098KfR2AqM/f1OfMOrxnamMHxHSXAzYKjzJDBUC+VC7moGZGqstE2BYiTRSje7Q7ec/jAb5FZHth6PA7ZByTzXPtY15lo2bUQHNr11ITuTWwwL1Y43Bu7Z8SvwnafR5/rPYy9/as870B+Yvr48k5d1Oqz7aAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IBMFVh4wf17o9Mrml1rTHDO94uCT1CWpgan0449Ea8=;
 b=tSaQy0oVfIGmLYEneMdMume3uvV59lwiHsCOsQxcpCmqjELRb1TTSzxDVGZ6PaInDHYRYc0cy+3h42/CMZ5AGSQZmHx369Y8at0NwNGsy14VmzHiw87f7WK2Ayv54hyBBkERjTsQY7hZ+1AJU1c/66bhVB+LpE50N9aT4rbKBwYHPh5gKuHi660HPEsbgz1skW3xlKkDbXzJF86NvtKnMUDsdwu0lKFiowofT4MYnZvJ07jFJXX5sNf7t3LRiqI5Hs+2X8n2Pax6RBIERoEdwVwNNTqQwV3gGAnWP1VU4yYP3ALD/ocfaZwg6G9IOVO+zML/+ScIJh3zK8HigkxOuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7808.eurprd04.prod.outlook.com (2603:10a6:102:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 12:47:02 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:02 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 5/8] sstatesig.py: fix hash calculation for timestamp
Date: Thu, 17 Aug 2023 14:46:09 +0200
Message-ID: <20230817124612.1043464-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3840f1-2a42-4064-b4b9-08db9f200dd3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	omSBIE5DTL3jhTj11ufYDpqedGHQ70wSfwqz3M2cH5CXjBNQ0ZFDG+ICM60pJQZ7ffUgLFoTGA4LG+yVgQRJAD1viL7Qto75KJx3jfIHj6wxZ4rklHsH2FKkbAR0C3ficz7GEJLREgsqA9Elym8NYd+YL6A9k193Jo4Q/6u4YyLNGAkwJEdf83jJgj5iQ38XVkYOT9kcllxl0B9mJma9louoGKaT6n8yZ6UyvYzvMgWQrLAdpCcw8Okg2JIT3wdunW7uIpMc8UTUfCM0M27uMXOwX2UII4puCJh4pu3ZK9zfoWGdRqDg7MU08Mb8wWGv5G/hiY4BdQmb4O1ibvAxcVwxsz8ioQeXw2lWKFi5rsjv9ohz97nVwPugaZhMzj+oj+SvCTHvdswEANbEJ1hmpTezkr3opY7OAYvFr6bnbaF7RS7KlvpEG9k/9vED+PL0C4q38Q/ciuIYsFSni7MMcIqVEUKLd3iDdoOeTIziy6RNTGHx3f5vmgyy5ULHn/nVAVT+1hQHzrhYgUeu7yZuDrl8MwG5DW/iqS7Re8p9G8imKf8uJ9MN4PyEg3WKmNKyUPNY8voYQWo3RScBl7Q7TWazhS+AgT1XXmynwRrfMGKV4DNGgXaY+avN6N66PKA7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39830400003)(376002)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(86362001)(5660300002)(2906002)(4744005)(36756003)(26005)(1076003)(2616005)(107886003)(83380400001)(6506007)(6486002)(478600001)(52116002)(6512007)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(38350700002)(38100700002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uty7bw2U69zoTT0GwjwN373525TfkLDc3s00aPfHWt3m9aKU92V9HE5CkfXm?=
 =?us-ascii?Q?gnEscfiXY3eiEKWAzdToeL/IDI95BXTbM34L+gV7A7AyQ0WzRtcJhIMs6E6m?=
 =?us-ascii?Q?jaistBaB7Ac4YFEp3qsprDAFuWDdsA9X4Si0DmadpaILjiUM0cJ7zKOtaG9J?=
 =?us-ascii?Q?1D489hPArATcvRKsSSBPmU49dUJ65IUJOyy8fb8P4RFLd759jEkCWiesjBJ7?=
 =?us-ascii?Q?EBx5I/GOOLyrtQo1pXrc5zIOOUMw2/Pa7DO2JhZaFN1Nixa0N05zLukOiy31?=
 =?us-ascii?Q?6y8KVNeeU6ZbrIei6AcoRmJrcJudpVx7rlZ9uaSR42dRbVHfxVv6i/Ki/QsU?=
 =?us-ascii?Q?p4SUQ/DdQR9ayE8so92YnUC9xHMFWNGtrCndFPJO47adUtRn3rIsW/CoWcyD?=
 =?us-ascii?Q?QaMBnVZtKFYgpFrTohTYpMohDXw2nW8SM5XMB2/32+xrX0ENX0BqVjtNrPpY?=
 =?us-ascii?Q?jxSJd/7Uaw3VaJqTscxJLiMPOu5vGMa161Bl4d7knjoTipLneuvnU+KCSGfd?=
 =?us-ascii?Q?KedOKggtzx2I8jKHN+N5CcvcYZsAKidSuOlLFsAiBPQ6j+axoOJOfFVlAr7I?=
 =?us-ascii?Q?r47yqkVkr6CaCetn2OgRxCbnyq1PVrrm474qQVU6L+Umx8fZ9K3B1gGxLIdZ?=
 =?us-ascii?Q?7MAzOXm/T1aErqgAyREIyq56gOnEZJNwse0qdmt44Cq9+N4hLHEBjPhggPba?=
 =?us-ascii?Q?B8za/LlgReWHQ45nRR85TrMvlxDJV8itofUnSIgTgd3VqJjFmfMLEIsM/PBR?=
 =?us-ascii?Q?aIcTHEbG55Vz1VEUBKND0pg7my8oiRzvanxVvUUeq75jqmPGZO7IDUJBDnw/?=
 =?us-ascii?Q?csP37z2GkG4nRYrZnBLAumQifqBCsVcEhPo78NvYlOIGBZNJ5oK2Gw+REE2W?=
 =?us-ascii?Q?u8UKgpJ1KrxqwRodmO/JsKPQEnU3r7ZzKippDrtRNLCm+QVBr7EoCZqF88cS?=
 =?us-ascii?Q?GqNdJ0yK3IfR5qYitFPFVasnKxrMmio/Rjgu4J/YVPloZefJpB3ZGNYhYeyi?=
 =?us-ascii?Q?OxHXo++YQjJ6/C0tdqMwtOURQYn6Y3LUne0QSii43XZ82YYNhEOwBf3NT0yv?=
 =?us-ascii?Q?J71JuJD3GznDO//KW+wE1LsuZ9UoEQL26EgC3FSLthAKbCpBlYIHdYa19EDD?=
 =?us-ascii?Q?78wV+eN6NyBVVEsNRmZQY5gzyixZbzFKVnk2Lx4rL9FVG7dZt1/xXo4DmR4P?=
 =?us-ascii?Q?B/KPUgYZI5E5ozuVehXO3ySg1H8+Ovxq0HtvGWcvZUBpoiXREltVf/WnTX+R?=
 =?us-ascii?Q?r10NT4UdeoiDKQpXO0mAVOmUCyNUxZbpZfW5PTj9CBDCSIxB52kwbkTdYULi?=
 =?us-ascii?Q?/7Tm+EryV8U5hfs4yfpqwAQ/V066G+vla7nX0vZvrzEp66VVWEs8gCMXlyxw?=
 =?us-ascii?Q?DtGyktPCx/ToXBpeNB2hoTKW3Qxy9F6DYYwHiCmgrT9Fs9V75x/M1vu9P0Vb?=
 =?us-ascii?Q?RKddIRH3TZIwtEpXR/MBEU59vlmN/GbVEEEr26iJ5HJjB8PFehzmPqIkZmt8?=
 =?us-ascii?Q?JPE2yNXpDD/kHIKrE84/HKdTLQhEeF8/yhMdxDuX+UhxzeF8z0CL8xiauyDG?=
 =?us-ascii?Q?6pAstoBZiDV4BwJvngmo3Va+QT2fbhm8JcL/klK4?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3840f1-2a42-4064-b4b9-08db9f200dd3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:02.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwImRNfXGgZcHGf9HGs0HhyEY/agykLaVxDWIFr5Hpw/1TA/eIyaS5SQtdTeIWwSFZSzP391CwguCGTXvx1ydA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186311

Passing timestamp as an integer was losing precision, which led
to problems with badly recreated sstate cache.

Passing it as floating point number fixes the issue.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 633a0fd450..f7ea3d366c 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -588,7 +588,7 @@ def OEOuthashBasic(path, sigfile, task, d):
                         raise Exception(msg).with_traceback(e.__traceback_=
_)
=20
                 if include_timestamps:
-                    update_hash(" %10d" % s.st_mtime)
+                    update_hash(" %f" % s.st_mtime)
=20
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
--=20
2.34.1


