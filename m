Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2280CC43219
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:14:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web09.9592.1633601638149770076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=HfuCi3cw;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.58,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/d57dVsXP3Tzo+0SLrO6EFLEdnDr4UUU3wy3tTpxGCtI/4I30qL3xJn1HPymfDm/Z5TGnx5nXGxWlW66hJJOXO9qBeImUnkHSfQfAPuWjTWqwTkCrQeiuFmb70HqHefZDTvHKZCgYVdrHfQ8pB/ydgB9BjLUxoJIbzsy9aFbI7Iez5eFR2vaAtcs3/PppMCkF8OwcZUj+5d7C4VbNw0KTRMBmk6mR3yT+EvyrZT9XJYk//Bed8h6wtQsQPaiyhfdz8jPY5lWhXUDFAakz0A7IiXOEDfO4Dk2pmjYQLM7BuII88xwQdlx+6+2gR84/2U1OuZKTAJeu4Hxzf5OgpOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD3qWiSJkXAH1rlkFXyKEGs/L73Zja5EH05FDhaPtSw=;
 b=aM0Whj5RSfUpJSUMA4mesOayMtkwSqjfKdaouVeH4w9tdtC2OW4Yer3oDujBM5WpdZmEy3uV6B12ibuLHnFMbYZ1AmHmkcbshSMrMN5d9kB6JQ4MCtMVYbQheJb/mGAi5hUZ8/BdOAxvPYCe1SPtemJ+4akpdivm+R9v0KTK7t7jAYyzeVjdFyY2DcdGceXq+/7SIoRXCZWA8RAcT/QoK3BIM/gdACydA3zCxihdKr44+ToePfpSXoZyC5xpevs4h8v5wXFQsTNGYJbYWKzGILGN/MGxycR+ZmHbUQkrjmacewBCVaLhrlFxjRvRNZBb+EKDXawkwx/JReaN2c0T7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3qWiSJkXAH1rlkFXyKEGs/L73Zja5EH05FDhaPtSw=;
 b=HfuCi3cwjqJee0aHpSGMOIeUk84/zpkLMFB/c0u1SHQKWDt/bFjkDBpXvmckNsDSa+U+O2rmHd1cEQjEl37DruTKXOVYSPMurMgR3yPlnD2CZkpS44j24K872ziNQWPxdw7DJlNGNJ2Z5yGHYv9bMemt32oAeay8tQ3uPWk5Yj4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:49 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:49 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 06/12] recipetool: ignore empty license files
Date: Thu,  7 Oct 2021 12:13:20 +0200
Message-ID: 
 <20211007101326.11075-6-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8dc5eab-da47-477e-8082-08d9897b2824
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4649B2CE8A82948A26617C96D7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	87yu1D/tLX78PbZtAqj2stQ4ES8u7PsNv2D3KZm5MDq7V0UJBu51dbGLWcICzAwIZ7JuYxPv96Xm8Q32PqbzOBCc3ft9r+Ce7HPlZPkGYMKh8P49bLU7sL5mRFBBE/BQWQMQCxOa5ddmq2npt3PVmH+TkFl3HcmXsmfOTvTug1WyIftuXxCL/FXSVLKgNrHFfB8nOES2AwbRC3vlrrRC4aBjyQTNlgpnUztEbCHq7ap/dF5/tGEmaA0ZIVzyGBSWnXoiWbx6SWc8M2z9tP52D5ZMbWIKb8sVs27K2X+H67kXuMdkgKjmuQy32JiZ/DDEf/l7GoEHDdOKCC0ThOwtSW+380wT0dd0NGilBsCA4gyxIK5NBHjnRnAlG2kk3CLHzzBgUNYRt+kSEhVNhQU8NJn2gTKlt7IlNe8GEnnOsXJDuK/C3KtdypdAIEJeMqx6U5Duf72oiVhm+0SWhC5mKnVFa+6NqAGb/1T/of+GJ1ruDvBbaydaSGArYLZnryUxz7DfBpm/xje/XEqKLOSst2jULb0QwcKLvEJSlJtoDdKaxSyfWo3R2eXt4pvZCzLJRGfBm59aZNjJM8WCSw2R0qKH/aDjXpV86fOBa3EHQWuAHp/Bgy5Iwr4eLN44fX4thGLdupdcInDwWE7k+KaFxZQi56bq/W0Pu7FCitv3U+Hc7sBxBDCjbsEKDsns4D81LQ8LPW5h+XYktfGJ1bfbTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(83380400001)(107886003)(4744005)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3WHUc4AI3uqIh6lGjr+2YCtTy2xDPRLOZdq4W+tzb61ojxz3FUYnY00ll+Ll?=
 =?us-ascii?Q?gnQbY8n78YhGOq8Zo7SB2c6fko6wAq2ie1d4rsiCj0dzkEY62h0XfLNvdVzW?=
 =?us-ascii?Q?t1jyIoAE4V29FIFI+YvIQxPtIYorM4ons/EDgk2+kmGfNl5a07joU0S6j8zG?=
 =?us-ascii?Q?4c4bbvIzfJwJsAancFeUJ6qJs7ja2EnQHcY9sqIH5TcR4aQdDk+DJdnC228W?=
 =?us-ascii?Q?736cVOs5c9ucA3D1JiZlDEEZr5We8eTcfhlw8QbScLd2+iVEiO+RhFFmI+IE?=
 =?us-ascii?Q?hqEqJW9xLz++AFZRppHtgTWIcKPYi7nVY4ympsHZiwvTK0ALb+ZfAL5HnhkP?=
 =?us-ascii?Q?G7KYwBbawV3z/D2kaovDC01AYyOgh7aXeO0nT87kfUSxcY2ekM9qG1IugLFE?=
 =?us-ascii?Q?sqXLQKhQ/FHVRd79oCy1A/ZMZ5NNafWU1JJzcfedfor6EPy8YWI6PXKV/7KW?=
 =?us-ascii?Q?4Lr+drFwxz+iRvgNeWEfamWAe7cEOd4fUVeVjIdwDFS8UsZ8wmDXYmtsmTJ2?=
 =?us-ascii?Q?vq/y3klzcgdG2v4JTbMngNL66wp9qyXPbDMxU+HYdA5JcpFLgBpWAs/y96Z/?=
 =?us-ascii?Q?ZreQsqa6PNg45uVa/2qkRyFbl1vYBzJb4gtEtJiWOOS3HUfg+zqaZnJvF/c1?=
 =?us-ascii?Q?Lc4EUD2Cydgo5ypTXnXYzBBM/C6NJMztxQcW4Uo0b0VdJsFs1oKylIARfKxH?=
 =?us-ascii?Q?z1OTSfbOlJulJbCLOPAa1coZABJsOevhWgfwwZxC8P6AnYEmvl+tO4hcuzAg?=
 =?us-ascii?Q?oLJrxfFjqIwy9OO3KOcXIXISu621i92nT7E9SY8YuVj7q31Emydky7WQOQ1v?=
 =?us-ascii?Q?ZxJGi29nwr5hQTPcKX0E/RfSq6v2U9w6cxtL0Bc1OajCBHT3/CNmW4aluFw5?=
 =?us-ascii?Q?M1myTeQYZMJaHz+ndEzqWDKm+CDT+Tl7CEqaSuIev6Fhcno8uMFsxJA2ZGdq?=
 =?us-ascii?Q?W/P/2Y5D2DfV/12nsTONOLZJ4sNaFQOUFAlZeSKGFOfa7idGEZJMum1Wdk2d?=
 =?us-ascii?Q?oq3KoUA0rscrH0+PReABS3NHB84z97VvF20drpe3ZIJPlwRKdGaO8pduyLYh?=
 =?us-ascii?Q?acKnQlMG6Hwt3vXKZrTsgbh7m1eZC6AuT7Y39ohN7OjeKXHyVA4swsAkqmTr?=
 =?us-ascii?Q?7OynmZqTeyXTPfky3/gjp71SKfghKVZXWkVe6C2SYAABcLTY7nHh5Mjnrrre?=
 =?us-ascii?Q?sIlhRAbDFZ8M2WVvt82S/jpSEx07MisfVnzuQpBWYAoqHdQ+5GgBvoulhiTR?=
 =?us-ascii?Q?XGaWvLCFhwJxNABy0v3uPeb2BvkyDbsDLieI8Dcou52WjO4G/0P+pwTLWrX3?=
 =?us-ascii?Q?QdrDg92q9FIFpdngbWkgG33W?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8dc5eab-da47-477e-8082-08d9897b2824
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:49.8752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8k75UMpaLDL+Ie4cyrT6A/b+wo4m2DHQKefLrNUy/SAPcwz0mUh1NwZjjavo/OdM7UApSBfG9Ni3L8E0WvtDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156716

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index d86b98ff1e..071c845ed4 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1125,9 +1125,10 @@ def guess_license(srctree, d, licfiles =3D []):
         license =3D md5sums.get(md5value, None)
         if not license:
             license, crunched_md5, lictext =3D crunch_license(licfile)
-            if not license:
+            if lictext and not license:
                 license =3D 'Unknown'
-        licenses.append((license, os.path.relpath(licfile, srctree), md5va=
lue))
+        if license:
+            licenses.append((license, os.path.relpath(licfile, srctree), m=
d5value))
=20
     # FIXME should we grab at least one source file with a license header =
and add that too?
=20
--=20
2.20.1


