Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A08FC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:05 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.47])
 by mx.groups.io with SMTP id smtpd.web09.6032.1633678981177233539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=No6JqMN4;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.47,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7AzIoRRoZE3le3PjPIdMfYKxI2dmEonREg3HuGTDockz+ZTa6QoVgCysDRp/cth1j8F0waF+XFcJVvuw53GZ6urmBZP8a+nDh629/E/hUiNcTfZnLNRzzJ6DDDzZlDyPgXy4RD8DDzB03WY5RdKt7/XC5BLjA1BZXkEXCxTBOJxn1XjvD6NqSDPSGqFgA1HC/eUQ4P+htWkJxjDlOf5xordI5uM9XaWFQTidajkBGrZKQn8oqfbDKlNz8bS7/RyUDHYfSnFaSX052mGKs9iO7yPbcTOCwU+fUo6IwVcoEeLI3C2lV11htCrDM+3zlAynnVDzuuSDpDk4nLH578oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SEuFIUP6xKVdAROCN+nwVeNErAF3J9BGVsBzVh61oM=;
 b=dgTVrMMWnq/sKjjXUfSIReC5fNRsAnp2N/DF4e29yXAXWX4W6Q2YA4QbKmebPUhnX2fmQsnsJVzhF92eT5UGkSMuoG1o0Nn9d+ls0KLM9U53pcuPISGQCaOPSHXW+/xF1mK35b7cLwu9R2sullVunB5Z3kZK/qAAOYkfB1+C/qDczlB1PpjvwGeZiIc0kPXDIdSpNoQ4gqhTyawWRzccBzzFyBDkHW7GTUOt53xRI9Tt9tAs3jNHy7NBCw0HOArOhQuXG9hsjTinq+IvQyYM3fvaz2cTe6MdNzC8G0e9ecx6nxIO+un4QL0X88D3aVYXbNEXobUKNqZiJh10TlEeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SEuFIUP6xKVdAROCN+nwVeNErAF3J9BGVsBzVh61oM=;
 b=No6JqMN4V0FN5MBMdMkIiIYzJoyGQVepjF2GW5hLAaO2EkpdFljxKlB02sRExqbwGRUyBiHLOphU/Ijt/hAQOu4T6mvkynpTOhwd8pOj5Xu39ueKroz+zOQopcgEZBUmSxWcGv8uDophNNibLEeYs5a1BR2WwaC0H1O35Tm7+s8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6128.eurprd08.prod.outlook.com (2603:10a6:102:f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:42:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:58 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 04/12] recipetool: Change default paramter fallback_licenses
 of function split_pkg_licenses from None to []
Date: Fri,  8 Oct 2021 09:42:20 +0200
Message-ID: <20211008074228.8635-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce94217-a2ae-44c3-efc9-08d98a2f3fac
X-MS-TrafficTypeDiagnostic: PA4PR08MB6128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB61289B6C6A0FAC76B6579AFAD7B29@PA4PR08MB6128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	40JscdGpaDTjIMg1gRidIm5ZrEPrx3ylUErHewJdau74Fhp1kHTc33/xRekcZyH6PUPob14vsWqc5uYskrLuhWfCBVOQcZpgjjA/FIE/ZgdlXIFnQm9BZGLGNJvqIMNg+KE3goS/dNcYq1y8yOk3rI7U0Bo0GwzdTWeP0JvypAbZyExOoLwC/IvsAKvNpUopC8l9aZIJ++v1EtCzISUK/o9Bt/aGcz96rrrszJlA2OOaFmvjPDI0oNCBrQTzw2YQJhDp1sssUeuQYDVKPGHiaNeFzy/lzaslkhLdHZKJ5ajmRNwILjMHMBzddF765HaD04a3PB89WokWOkia5ogJYBxm5QHhf43ZFJaE0akm4loSjPOGluh8OCRrwvSOlq7Yjomz4npq2bH/ECLxC/Z8zQ5pavn7NTV7bNenbxfTrmf4iPNWtqRQ+b3BdwMRGy+WCa620HOVU8mWgd6HFIzafOUph7xZmqqzKXDs34n9nFq1oGve1yryYDl944cWnUU+59zNGSiUgfiOpZXejjU1rfUzrHbxQs7bOoYOPVIa4EjwOZSN4S270rbVUbY4ata4L8IYNlvfkKwkzy7Lp2U2k8nyE1kRzfROuk38y19sbn/BsEEs+hbGTlRLpdeFDzMUQHc+v5h/KAifWbgqTuCGqfnetCzl5TVBrT8l66CsLSWqu0DNUXol+ujlOpdSruu4KiHKSeV7X+WD37pB87CMag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(8676002)(5660300002)(508600001)(36756003)(956004)(2616005)(1076003)(83380400001)(6666004)(26005)(52116002)(7696005)(66476007)(66556008)(8936002)(6486002)(66946007)(4326008)(4744005)(38100700002)(38350700002)(6916009)(86362001)(2906002)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S/YsByn0QQflU/z4zOQd1O9U54926fJS5jNtmDDga/7ovrjQi4N/2i+9fBo2?=
 =?us-ascii?Q?W38zAoRp+vwlZ9xtqWmfz2aThXCKjUsWJLAPJvjN6EloCCAk34qv6tr+QGCt?=
 =?us-ascii?Q?o+i1RD/+lcBf8gO1rJzi3W8qbRzkZ/ETbtHJ5/FJgIiAA4Sw3whD5qto9bgE?=
 =?us-ascii?Q?mRQHYODrATv/68HqxHMzAI5k5Y+xgIzFMBgDgMtosdolbeSiK0D7NuHI0W2P?=
 =?us-ascii?Q?/hYPqynm2rEbJvEDBzIwUhedaHdfr8MfJ/RlSHYV2P8oN4uvxMxNajkwQv+A?=
 =?us-ascii?Q?Y/yCZsGN/Zc7MSL2tZOUJtGFCz/m40WSya6UqDT3ymHKts0FRCVXeuqSokYY?=
 =?us-ascii?Q?iMWYrv9mHnMw9D266o7O0PiiTAMNDii0RLsbdkWCzboYZXJl8CuoxTjExmN3?=
 =?us-ascii?Q?Bxg3OxLPmgLT/zR8zFtexFaU2y3dT7H10gE6Tawa4agBZBXHH6z2cMT6u+so?=
 =?us-ascii?Q?y2oqV9PT8U7HAm8Z+vcMtshXcSl54YDLfF9o17Agj3H+s3v2PiUEwppGXYHc?=
 =?us-ascii?Q?aSQwlYS9dZ/KBmQSp79hRrYd5TRT5LWSRypzW04/MvjtDo5OmiBzblXGBCp9?=
 =?us-ascii?Q?wHJqsN+Be2DPHvCCDnLJkZpOBoHXgBq1WXjyoSsFfBBv7OoB5J9J16eSvhKZ?=
 =?us-ascii?Q?6ilr+PoqrYKKF7MDt5zOGHO8/c4AoE5hHByVorBdqmbWuJKnzTk7eFlPhHcY?=
 =?us-ascii?Q?Bc5ESiKeJGxzwyuDAal1tOfqTizxkM9Tl3oxfnQz0i45vKso8Arwm3W9rT+L?=
 =?us-ascii?Q?7IkhYl2rVGlh7tkOeflfHWd3Q9MWmI2+1vvYC3YRndpd7bTpWp+ztFPBsahc?=
 =?us-ascii?Q?RQylGSypQ8/pZFSDGY57RA/tEgKBsaEaXBZ1ssnqmJAv1QZ4E8ZtWhwxP1JG?=
 =?us-ascii?Q?58OROp3yIP16fAzut3Nu7P2jhVXTeT4FLMd6LNhryTGWrTmgWw2580nsMZ8z?=
 =?us-ascii?Q?qkYk9Dvd9hCvzQIlc0BDM/UybBs+NRuXhDGXBE3P360WoAfCsHhgmNNg2KtP?=
 =?us-ascii?Q?Q8v9p73BlH6InxgvggrF8PmZwx7DNIqmzLfOxtnGa1coD+oPHgDiyWH3jebI?=
 =?us-ascii?Q?um3+7ylOR84tGe8todIapNgG+LmV5d4ub6aOQ9EbUL1mOhljvljeNmcG5jhW?=
 =?us-ascii?Q?kOeRERggnELfcq3z7OoJurgm4bbHntC+siF+UUIiwi4ED9QTBjB+ovB7FShg?=
 =?us-ascii?Q?sR11bqEXVFxowoV1jzknWBxAxxAToINXuKmBFL9EO9ybC9LlTDXtvo11v3il?=
 =?us-ascii?Q?HWGHmJ42Om1W+uSdt9r3nzzOQlcdV9uSrV7CDoj8gB9JQfq9aYgFAJ5OUSgb?=
 =?us-ascii?Q?ziITQ5XkI1ecnOOSHplt0m3T?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ce94217-a2ae-44c3-efc9-08d98a2f3fac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:58.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n6Zy9+R6uWTeS/52y8Xdlxc/CE8J+jjZakLiQRxkybHWm4hYhAaj2CEDd8+tMnPvIBJKdGzmwFy17NhvXb2Ayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156746

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 83cf25d9b7..893980a5ce 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1134,7 +1134,7 @@ def guess_license(srctree, d):
=20
     return licenses
=20
-def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
None, pn=3D'${PN}'):
+def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
[], pn=3D'${PN}'):
     """
     Given a list of (license, path, md5sum) as returned by guess_license()=
,
     a dict of package name to path mappings, write out a set of
--=20
2.20.1


