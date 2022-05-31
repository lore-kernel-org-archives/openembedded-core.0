Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5D8C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:11:28 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web11.50771.1654009875952838778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 08:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com
 header.s=selector1 header.b=AD40Zj/M;
 spf=pass (domain: seco.com, ip: 40.107.7.81,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0KgeAdKKxfU04/kElm2BzDna+orhCVIwACJSpNT7Y9CF9I1qExW59WIZLMUgRyRUZhndu4V5LpO5LQKYX6KeeUvEmxBkbT0VjdYAJLuGEMZYVoth/2LT0tgWds0HaoNBoaH45CZmsQcJPld+qWrCaqtWc9kQe+Tqo1jlbgxusiL0gz+Yz9NPT+mP6gZDHqFhASTWmljVUc4H8kwgDXrBiF4pEsAqK6W0LeBvQ0CLzsbna0YdYliC1HNfbIHHnVt+mRUo2o6Rvq925XXinuVNvZUaEYZp1+G2mwCOjHMmmTA0x+M/5IgrCOuMNAvKd2dJo9o3fY7/oUjXt1QiDFPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRGfVOie8B3NvObz+0mHVsSRg+POp+eMejzDiTPvgKc=;
 b=IlXSdKRLDLCLR1LH2vTR96kVaKh3l38NZM8l6nTK6VtdEgQYD6sCKxPEZLBkw8bSPre5q7i8pC7rZHJS6BEqVjcu4eSCFd3MlXCrElhOVBFlo4oYFTFcsn27APs9VII1Op2CzNjfdZ8BEbK9wNkCpzzjpch811DyBvKTnqFevAcU7v/7ubSWgPrhKgc1xtyK/j+Be50IRAfrWc7ytnvHV/jGlYLywhqIMCyTmUHqzvTmRLp269/XFWjSF+JHTqjIhSecuz3lCJy1JZZ4HnzZQKQr21xuIPozNQ57GBM8sJVOhyWtdwxrIsV59pvqTHAM0CZxNBib4O7pP8/NMOwPRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRGfVOie8B3NvObz+0mHVsSRg+POp+eMejzDiTPvgKc=;
 b=AD40Zj/MXbhEsQ+wV6RMxgPA+3MIDWv/K9/ms68F80y+FjKzp0oj8TgJSi9kMPwlO5c8TKX0D0Xm+lvlnGCj9JpxUNEUO/dL9HFgMoCuQaLw5tXIfekn8mW2qu30TNDtb+Xd/TQ0lDuXsaK6pc5FYy814SsJ2gUP5mvJ1/ho4YD4W/HJpX+C0MLAEGgUQr4Z1ZzbqgMtgqn0fWxDA6miwslxrBeEt0/zlW6lzRsw+5GbUNcH1u8aeFYBPtkjLbEq3tozIQhrGgoiuzLvaoMmIHfyfYVJ5cshD5rhyJ2RvqGyxVBZ9XyErim7dL4Lp0DnAsznx4dQuLkR0ya2wWDpiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM9PR03MB6753.eurprd03.prod.outlook.com (2603:10a6:20b:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:11:11 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::c84e:a022:78f4:a3cf]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::c84e:a022:78f4:a3cf%6]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 15:11:11 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Christophe Chapuis <chris.chapuis@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] rootfs.py: find .ko.zst kernel modules
Date: Tue, 31 May 2022 11:10:52 -0400
Message-ID: <20220531151052.3667079-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:208:2d::47) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6255094e-bbe1-4804-5420-08da4317cbce
X-MS-TrafficTypeDiagnostic: AM9PR03MB6753:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR03MB6753E70759535A877EE75AB596DC9@AM9PR03MB6753.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j37VvGvaWHyGceLWT154T8QsYMWZevtT6CirCrJHSnCDE05kbGgU+NMiIxJ93XOv1QdZrQk51AAMCmr4JY3LkRopgblaDNDZMDXGITtHtlPZojvFNlAYCQnP/rMwdg8fMwQU5KxZJruAF8pRG1oNPKAMKTTvDwizTg5Nr7/uAl+jj9nBfzQw6YCsf0y4FBL06vSrmYwQRcXcoJJncu9cwMNOBgeOfEGcTPm4htVf0zCdqHzOmP6IckWGS4SERsT1lZCFlUpOUlLBBi0Po6elLFu0fa00Ex8APgCFat+UngDjK2LnDWsMSjDQvxjfydDQcUBqY5cIcQ4sEBDfWite583PLHdxqcx8q19pj4b50xqpCzmRqIdbcz4CAhCd2rT6KRI3gogWUaI93Fwgm3/KkzrhdfWZS1GJBDeXqMJ0JU361/t/iagCWxvKT/H9HMQh12nMyiAGdyrEdoIwt7w9J57K0ZBbEu5eQz3f5lbBp8T3Vou1kWAgLxdTdu+7JSu+d5ImFVETPeQB//AJUjnjjpJzcvErPEypDkv9NwVEvw5MPa5GTipGPBeKacGkhVgiK2+oWOBn+C2nmvF66zXdR4oaGYh54Li4BLw4hnwK7XYCWbOEUq7c/5mL1ELIgTakNFezWn9rZsIDrnWezcekIj/Q9hEY4rrbI8JwnsVYUy2c+iEXSpNgLu+RDFEeceN8DDoY1rjP0hDHsTAn6ZhqGmLDzx7tjaqeAXDEYIHTIXQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2616005)(186003)(1076003)(107886003)(38350700002)(54906003)(36756003)(4326008)(316002)(6916009)(8676002)(66946007)(66476007)(66556008)(83380400001)(8936002)(508600001)(6506007)(86362001)(52116002)(6486002)(44832011)(4744005)(5660300002)(6666004)(26005)(6512007)(2906002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hFNJUZU4iDk6z90ZyM0SMMZcwrTzSkW5BL7v5EaxZ3T+t7QWiHCfymurzFr9?=
 =?us-ascii?Q?tnVuy85wF0VxFWJjRAqZsRYhhe6FwLEqlTdYkA+VzCzUVae+VVGKHGYpO9kQ?=
 =?us-ascii?Q?Nixs/fDN6NkYVYU9Al2cOMu63H4ekQ1wxolroDgGfi7LaRvTLjm//6Mq+G+4?=
 =?us-ascii?Q?STYtU+QpCyUOZZwmWHNFl1yJU+7bLklykqTjjWEy6tRywdf0r7q6bt1rBHQq?=
 =?us-ascii?Q?5TzzOmQvnLgmOexfS4JTE5F5zRIl2hCrskknKy/C+f5EznYb+sh8gij3VQug?=
 =?us-ascii?Q?pQEo4KKv4gh2L5VcnYSV7elzYSBqbsBlbvU7Nr1PnkRoNGmFDwt+V+uNOS4W?=
 =?us-ascii?Q?AVQ86d7Bt+sVvL217Z/GU6mIaYvXGqEqPr6NJWFD1tkUMqwPhD3AD0snRDkq?=
 =?us-ascii?Q?WfSWd3zPfjXtmS90hVKzEPhnAz7pc9dhy5NBFej/edEdtlzzSQJ+1Adc14Xr?=
 =?us-ascii?Q?1uH5k43VSawXEzL6zyMVHmDj+6jLfIootas/RYBPQyHDNUmmU5/7lnc+uZuq?=
 =?us-ascii?Q?2dw3tdIBxNoOi/zB2ZPm2cyRu29G5iiqePYaUjRgjOjepyPUFjo7Cliwj2iR?=
 =?us-ascii?Q?7c9fZ+nu6j4TH6cwmANGTYTJcGVORjLx40m3oFEJL8UXqe4d1uPZfH/mfayN?=
 =?us-ascii?Q?in4QjWj/3AiqGz2uwd3l9WBUEHTGg90jlRlJDJ83blTqoGLRXNQZ+rRrkL9+?=
 =?us-ascii?Q?XpIUUemaJaDMQ+XcsOgf8Kgx8B/1zTdFIGgusegufCxIloLWH9By10sTBQlx?=
 =?us-ascii?Q?gK/ZCCJpcP2CyNDJTxICaVbvSFoKFNf6KMz70YrIJnkhbcw4Vpj3Tk9R0CJ+?=
 =?us-ascii?Q?a1xSZ0pWmaeJp885WVfEw30lMuf+mf5fLED7jsN5mKo+VGc01Ie/rlKMbKsD?=
 =?us-ascii?Q?6VU7viDi0y0kOOBZ1qXK/yhnFfSgX5bCA2iDs5H/j9utrHjXkh0LJB8bnzmk?=
 =?us-ascii?Q?9gRKfou61+wVFskEtOULBvFNk8dRVqLbc0s3e5H+ISaQuh1pg/5w3hOdaZYM?=
 =?us-ascii?Q?DvAM8gSGGPEsyLte3k4PIM3T9IBGpFg+IKLCMJnX+mpYDc3YtuJ09EUInjzm?=
 =?us-ascii?Q?U/3pERbI1F7FGl8on1phpuhcG9wVgEZRQFCtB59YqjtJ47fZE1JfrtCNZlPp?=
 =?us-ascii?Q?5FtDpFBXo9esAzrgSATH5VvVtsIhzsRvOxple8zf/ZQdjs0wu7LbaZNL0RpN?=
 =?us-ascii?Q?cTWngcfK4f1XVSAb/kR8jp0FgzAAS74Z39aQoUNXsw8HDBEY7odxsRtbCOOL?=
 =?us-ascii?Q?1mbbBxTvLONeEgJA2g+nYhJjU6SHm7Ez6flhE7c5oAhe45/zcPeHOnQYO2TH?=
 =?us-ascii?Q?Qy0NrPQzvLoLcZ3UGp9hTyirMouQpV2B23T2OMk0xeJOlfa42VEqDDPCkbo6?=
 =?us-ascii?Q?CmTcx7SwpslLn8d24A6HAxryWOzTxEsFDBDQWuvD/HedFFQ3SarDoF54898J?=
 =?us-ascii?Q?HoyoaakloAdin2Y+JiSltTeAP4vtIHfXRiR2x5Zm23blHpTwOg90KVGX2GgF?=
 =?us-ascii?Q?iIBCM246NyoxAStAXWukNUyEIkkVY3QoleDi+/c9g/kGD60KFplIMaVwehwA?=
 =?us-ascii?Q?YexfDtp5IRS3Wgp54RxCV9C6qyVFJHXjXZ3IeR24TNGllmQ16fhqt6Cen9w5?=
 =?us-ascii?Q?sZXMSsk2yTeBMmXe7iKzCl81x5K8PMTbMaTjvnHmRfdBXyQeBE+jlB9z4eIr?=
 =?us-ascii?Q?78J2pdi6wucAPtta5zj0OU3G3AA8jtguDtmlcUxvwGTqG5S7NuJqmX62QYz0?=
 =?us-ascii?Q?mS91wVj195rnjShOAgzstxQPUBniKng=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6255094e-bbe1-4804-5420-08da4317cbce
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:11:11.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3lEkpPJrR48ZwWHRNtAO2Gw2KvL74jcLzO/ghDZU4K6ehXzRR9SGqj8zbco5rOWytGULloCcUsiJ1MZPhhQk+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 15:11:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166319

With CONFIG_MODULE_COMPRESS_ZSTD enabled, kernel modules will have a
.ko.zst extension. This fixes depmod not being run.

Fixes: 1b696a45ddb ("rootfs.py: Add check for kernel modules before running=
 depmod")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 98cf3f244d4..61ccf369f12 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -311,7 +311,7 @@ class Rootfs(object, metaclass=3DABCMeta):
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=3DTrue):
             for name in files:
-                found_ko =3D name.endswith((".ko", ".ko.gz", ".ko.xz"))
+                found_ko =3D name.endswith((".ko", ".ko.gz", ".ko.xz", ".k=
o.zst"))
                 if found_ko:
                     return found_ko
         return False
--=20
2.35.1.1320.gc452695387.dirty


