Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7876CDB482
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=XyIRDXeF;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTahZ/i3K+gv7tbjqsGwHmIdkUqHffmouRR3KNXfflVeAWzZe/0Wgd27D8mNI18LJf3sgbNwBwwahu1B+0hdgF3JJOJdgWaAnwyu2W2ThHN2B9zpu14gD5njKHpm7k4nnfZapPm28448GDGWzIMMKbwHyDeBsM4LXVm3uB4Fd4U4CL1g/GgJJHFej4uwbauSutlOlpGB1Zk/VNml2OeDLJV0shBS1gL1j1U+pEhQtBegLIycJ8GLLWKcP2MRVaJzuKnnOQdff/ZF6S9PyWbuTtHlX0VLWckQOt2saACzRLb+fhC+4qmtPwZXbDJqOieh6uiEJO1qVUp9OST7zBPYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=XcktPAw26V+7lyKUVnU19/NHSHSpiN1lJFvrc9CteLI1/Uu1OxZJJ0Q4RqxFKZtX1mrOXppxqKU4Alx/XyCY+V9wSK8NhRRt0OTrpoml9WKHrOx3hnYKtyzLufGVsgeYSu6YVOhk7ozPuKSchPKWFihjM0gedsgq6fsdedepumESmpSnovjWx5ftEKr6xW2C8EJ2dEmRcfuNDlcukMKQwlxi5JHU2S39K+WifNUoVaCxIrBswQRhKVKIM8eoi0HoaJNGzIQ6SDIq5KMg3EzAH1bjcgJgP3cbsc/SPZQIQtuHULbZHKmI8cPfbQp13wFTvRkISNXL3LXMlm3/ItPaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=XyIRDXeFAPUfsrZkpdHi6DzkTVIskQWEtP4ckLRsFHudyG/lgGh6XfVIBw/2sPGgnu4XdgyjMQd1h80sy3b8nVuomvGN1bKbu6bFK807uePgnYRih5vgIFhVROAZJZUYr3PXg0NuyLTW51+24uJ+5zEtRUwEw9JBteenRSnHSp7QSztKM0PrUc+LgixwSG72PLUvNG7zBMLkAmW0OkIUweJAf0hImcwYz8k7e4moK0ZCnsgnReJZkRBT8Ifk3h5zFqHi4j4Hfmm/UIvj8Ep2O5jHb0HHuqAxNJNF91X+hYr+CVDRrI03jmYBYugY5Tx5ZdnsWuze8HlBbGkea/oZUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:35 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:34 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 06/11] package.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 16:57:44 +0200
Message-ID: <20231015145749.69995-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: b4435ce4-31eb-48bb-e8ad-08dbcd8f3479
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U8NapkGvk/IPpDGjSGRpUv9L0z6JLcuPri6kcTgyN3H77QWkRuDLtPdltz0MHPxS8/oX80qQWF54YNfc6DdRWKta5OIUYyWJjl7iwbBtgyINxuIn2DY26HNkM21wsgAg+jWQbFr4FcL0w9qdCDDGeewqESKp3BJYX7mY1S5MbBTcE+Q3B0cvf3HtpCe/1E+LzV8l3s685CjAD+/GQj/FXXDQZ0w9a2MUJWEmRjID5lDCHbZkwD71QpQZMRuFk7ZShQoVwv+//05X1AHiHI1W0sZbnDnTZMWAWcsiAo5VEEbFGQPvwjDJyYauberdUGTjbeHi7b5HlkoxUmLcP0KhOV0Q6mmOF6nG5mQCIqUpseBKAPOdIOqhFNi7hFj5matw+96T23KSHqE2HaTtwlrgheyHQdICe6GWCWHwsF6glU5au51rcv37TzHSkM6Ikd5sCZQ+r8CrzJ8exOQ68PCPaEgzJAIp7gaz6ZWXp/+r+I5vInMZL7cJvBvPtytc6Ioy0Jo8iwNAGg+2/XjfhC0N+EvoEL4t2HDMyL7r29mCvw2EPWJrWRHarzuXag10KYhHzj6NssE56nFIynXs7gSn5IfuehOrfcpoDeHxX4HwZQoNh2UDMyixO6igcSSLIQUo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V7TpyL43VVnGwKvjY6KshgJ17pwfU4U+5gwPOTFEhR7NIKAZIEWb+FQ152W9?=
 =?us-ascii?Q?+myogU+pEecjK8lfbPzKA0+6WJJC6uGd4HjpvuWwfn3bi5v7k2I+gvfVe52Q?=
 =?us-ascii?Q?o6/tc6wA/xd4VUdlEEYllHRm+KV8YCPdlQPOWDd/8zgHoYOg/Sq/W8prtkne?=
 =?us-ascii?Q?pQ0uhsl6Bge6YGFrMcU14kyxNFrhJg+o8mn9didikwEBdQT9HghXG5oNedEf?=
 =?us-ascii?Q?m6dRrQCJ+lWuo5tiUUZ7nLuPRmG1oEW3RhtDo7bzhe6L8naFq8xC2EJe+OyW?=
 =?us-ascii?Q?CQGD2RKs2W/ed4SehG4X5QsoU6hlRUz2y4at03E99N0OAeT+iT0t61U9jEGI?=
 =?us-ascii?Q?CeVmoKDOrIx1jf+RTyKGBc+K/GoEXED5IKEOW0vmemVvPmyvD14FG/eSCP/V?=
 =?us-ascii?Q?IDFsCjiLvNNo6az/o4OLvs9wMVSRQKXlwj+j9n+HkNtDP98F4c6DHriXmi0W?=
 =?us-ascii?Q?HMUjoZ1KrNy34DedKsIGJ0qZ7tFMk+u81uF6Dpsl8f60M+/S+Grjz87Ufjc5?=
 =?us-ascii?Q?tdExIiih6oCazt7PqbLM1LtgIcwkU8swoXxd5W5td/yBHgjcRzf/iWpPhR6T?=
 =?us-ascii?Q?+nDWw+a2i72GRrh6RSJNtNBUMDv3m5hTEAQkcHP7QjmQhxyQZCbuKCgP7AIr?=
 =?us-ascii?Q?PI8xvwwGcJQrTPrzqwJAS9L1xhh/PDCxSiLOaa9qcithPLi61UoQ32HT7Odp?=
 =?us-ascii?Q?hVFNunix8fjaZBzZd9LnmSc/kCY4Xp69aP8zZCAQJXHfT77vCzI4HzhIpoQ+?=
 =?us-ascii?Q?gkhlTkXX1n/TcCMD1DrX+R8DMyI78QosZ9HNiU9IJ0UM0sS7YYBeiQlIQ+9n?=
 =?us-ascii?Q?rwk0JLRx/JKhW3LnNUt7L6dLPf3ZbNWHQDfRlpVv4RgBiqrYfbuGKbjUwfip?=
 =?us-ascii?Q?4EqgoVwSKhI3vat43YeMPxXuKae6Pcs46DaX5duQ8W7T82e1Wz41L+ZgYsQW?=
 =?us-ascii?Q?/iSC/C5Fiq+E5RYfnMffCimVANmuJc73P8ie+4ZalJlrsqQYAk4jj656iWRa?=
 =?us-ascii?Q?KLErIUj9tH2ZDq7tzUDcknRSIIC/3zl0/YiHaiA5yt7pb/s/GVXP1SfrEVBZ?=
 =?us-ascii?Q?4Bw2bNBuyKiVS5HLU063SVVbJREfHUt75y86nAgpkMEWyMbvQlDhBFCEKr8O?=
 =?us-ascii?Q?RYSyvmtespYmlXDGd2ziN/G4Y/bAUXl51PR2KB47Ro3uzvWcKoHbTRQAx2df?=
 =?us-ascii?Q?wYLvb+8PStj3F4nULQEK1qdvIQycR6p5NrkJ+HSKtsXBy1BgQp5DoPNihdEO?=
 =?us-ascii?Q?J80E3zjsDUA/ISHyfT2MjV5/JwKm3l3kgX1w5YTt64GLsBqttQn2vEe+pFpx?=
 =?us-ascii?Q?wnLTYPeKi5gFq81/dp6EqeFojjs3nUbKi54B0VUuJR6YiqTKduIsiJjffgrY?=
 =?us-ascii?Q?vlvWKan0V7+/l8k8+nw3WOPGFQrK85iB536nMeB/VlUaQYB8wo6S4bHWNA5q?=
 =?us-ascii?Q?qkBb5qptP+Hubg4GYkbHqrHzYLQyczH8n7ZI3BC7qjM7uP6vkIh+H/IdTfao?=
 =?us-ascii?Q?CYGmyRdwefzYbFkFYFEc4owsbkpBqr9txP8V4glHAAwqvJ6zhGfpU63gcL2C?=
 =?us-ascii?Q?0DTPz3Pha91yavDVt3ebjGJtlDq3TZtaCTqZXk3u?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4435ce4-31eb-48bb-e8ad-08dbcd8f3479
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:34.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVXCums00skg/1OkNt8mK8qQBsD0/cN9TspHwgofvBz/FPZvRsEeNvWkIJC4y82IVaiVhwi/80YOpfE1kfc70w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189151

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 580884cd83..22af6552d7 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -353,8 +353,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar --format=3Dposix {acl} {xattr} --numeric-owner --exclude=
=3D./sysroot-only -cf - -C {dest} -p -S . | tar --format=3Dposix {acl} {xat=
tr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.42.0


