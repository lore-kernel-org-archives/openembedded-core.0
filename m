Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EADC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 10:18:59 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.40])
 by mx.groups.io with SMTP id smtpd.web08.3346.1648203536022940151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 03:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ZlexY/kd;
 spf=pass (domain: weidmueller.com, ip: 40.107.5.40,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1233/JIk59oAcT37/BIFKhW3NrR68MYCCTwSmyym5lR2mWsiymKak0X2h8fXvXJJU2VBWz4HC9rMUKWBSLbe+5q5KP4yFyCl6ltXptXJUnTnkkd896FlIHhWF84J3E3r8IS6nIl5T+Xevy7aVM7elLwfbB9Apa1bW5FNfo/TDRMgSrmKPSf1GNvXdwV1x2FeciEW3MaR0IUkt5INS+frZFPBdj/qiz7ig23K+BgC4MP+WSLS15t6oJxyB9qSq0TiZ3zaCrKktX0qBCwq01Z/q9fFVFLNRn/2WBCGiUhXVSUEE67ybPX8mq07CzuMnqoMF7u+W3k6yowdsskxOxTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB+Ol8ra/VeEehOJz4lbTQGxrZSIVMrF5Z5KOxrpBmg=;
 b=lLel5V07fwNWOPXkRCwSI4ktJIHMskLJJUoHk7hVEmo1FE+Q3T4Bn5HmyOhZI9I6ymaKbrth598jSZSb+01fNa6mwy/+EbobFAgraxvp2fIzpe0TLzyoGFhCl6U5QDKXTmRSnWH4TD/cqw9A/B2f5iwqvPxT0nNnPrD4uvd8hqHsvrfpG5DgQvUujGbgVpqe+JBUL4+I94WFFlzmXxT5ESXxbRzBxY3S47fY2eJe5R6W49pq4Hir6Huzfm9fehZz78u1BMDqgvJjC8kEwmkUiMBt5TZxlDHi0GEkA9r3lRleXtWIOzrh/kTu2Hcu2Je/AJyGnzSjDemZN4WV9ztnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB+Ol8ra/VeEehOJz4lbTQGxrZSIVMrF5Z5KOxrpBmg=;
 b=ZlexY/kdz/QVQL+2jhD71rr99tYiXGmv0igH82TT1aUMmY+SKFZCGxqyKr8A2hNtlz72zODcEuxg/y0FSqEX3mRMg6eRlAkpeKzMZH8ZIhkLQ7zs+CWX/4HxWoBaZv/N3XjHYopGcQYjPWSnm9ZeUpFlvD41/TRg5q1I81SIOaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6414.eurprd08.prod.outlook.com (2603:10a6:102:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 10:18:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 10:18:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] zstd: add libzstd package to minimize runtime dependencies
Date: Fri, 25 Mar 2022 11:18:31 +0100
Message-ID: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0602CA0022.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::32) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b4f3759-9886-488d-de50-08da0e48dc20
X-MS-TrafficTypeDiagnostic: PAXPR08MB6414:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6414E6D9B72FBFD9C21BBDD6D71A9@PAXPR08MB6414.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XOnUK9a8g+21nSLXIfwI92yzPY1TVE65q/doXW9BsMPrS7IocWICrPiOCrmpljJAv8pvWyw69sWpfBCeyhrxQYnNFaprfQAJKFKy8VhU8QwYFCOksAjlG6dTI83EMRqa6hOUP/BGNq6jtDDNuBkLFiPuYJwVVLxt9s/SOZb9P23QglQHA/62wLXB86bPWSyS+Xa2hEJaRWDK+dGm+x03+Yzt1+FLrPovzM/B6L0DNWXRbZsn0bsX/t+OIpZz7fJYVdvmuBIpGWRqtpl35o2OfPq2d0xpVYlhFSkNM6jh0zZr5wwN8TOxufn16M8B6n77HlxzMqC5xg7UxRNp12Uqaglti1mEXLTZR1imBktWU3wObVULmk1xPmRRJGZnTvmc4f9XNKFtmrXQ4AeGWOwqk6uQ9nwOTEp9Ww0/4ByBopW63d5Mq+m2RfR670707yw79s9tYcIMiMD/E4hr3PHlHMslPMA6S0SxCYuiSjDB/DBDS4XdsHk/t6ij9VIhDVA1ZaQsGGm7CmUziagnFzfl8rGExxS9MQOKoPhFQwjd5iW9iNFFp3A+WQyUn8ghLK9XBnXRd9q5FJb9Lj6DO7EQ7DmZ/UzuQrkFknTPeS9Go8fr8GVMyoiFZ/SGR0ZsFn7rC00BhZXIJLGmHXCpm73szf0ox3U16MEFb6se9bkR+aeKZ//iA1/jXnSPd+ZHF6u+7Yi7/ka1KANFjainfjhuwg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(86362001)(316002)(107886003)(66946007)(4326008)(186003)(66476007)(6916009)(1076003)(5660300002)(4744005)(2616005)(8936002)(2906002)(66556008)(38100700002)(38350700002)(8676002)(6506007)(52116002)(6512007)(6486002)(6666004)(508600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5KIXXULV3h/DV/pDJWnYJzd+eepfJUVK3D+/JCFSQiVzUXvdfytxSqBnxfeg?=
 =?us-ascii?Q?a6LOCqfxGEIZJRqky+fP7xGMrKzG2M0DPcKS4KwFxajs50BqD2XCptApZqzq?=
 =?us-ascii?Q?sR37JuFnIugTFgCyKY1UngtzQ9sFn5s/XyefGCXwQbjpiZkAPCajWXu/0Cb4?=
 =?us-ascii?Q?OVK5lViFxMY6ZAK5SP6QakUuc0nvDpm3l8agfy2S7mii+gzKjqP7X3lYUMmZ?=
 =?us-ascii?Q?rnvxgoloorJR7vN4u3dBIM5zAUVnXOix897Ixrf7UxQPq3GVmKGRootwUY4c?=
 =?us-ascii?Q?PhbEiLkuXrwEI+H03VV/qrpP3uuOr2w5w34wtPDAUrGwiL2RfBdKL0tez/Kj?=
 =?us-ascii?Q?TKpctz693UceVk3eVg1tlOEXCWFvxtcKkxnaNbpeaUANiO5VIiTrztmcrI2N?=
 =?us-ascii?Q?O/jJORcXbVlSHrslU+KLUXzC7n04UYof3gtLzmuAmJot9jckMpYwPIRUooPo?=
 =?us-ascii?Q?JWM8Zml9s6EAmj2bnpZXkwVoy0xAV2s1w0qxBNZ2tMBadHyQjwd1bOMvwtp0?=
 =?us-ascii?Q?V+AsX0P+n9YcBuHt4Ku9TCM5JlcBEzbVltpKBZ1mzUemnX2ZJZ/8r7ljjevL?=
 =?us-ascii?Q?Aiz5o97QpODpm783dy5sD1LTHodZW7iDvSUJn2x46wUnX2+mcFl3tzIuMfNv?=
 =?us-ascii?Q?+e3Ih4P2xx1i03Z9q3X5B/CHz9tBlJJqK1oVBwXZUSBQmotQDBystyt/kz8l?=
 =?us-ascii?Q?3AyNU+I5uJfU4uBLqy1180EzeIIEPhbYcChutm6tZcVn06g7pxjk/qEWFwlG?=
 =?us-ascii?Q?YhIX8K58SmO+QUyEPovd2frUNDhRJhyIK/tRW41TheZDfVIS2JooSktxRQYO?=
 =?us-ascii?Q?jgB+9uOCGVA3KaUN26DIX3A0l6/Q5I15Fln3brgdhynYiASFFba6sletR1hD?=
 =?us-ascii?Q?XOP1v5brTqyx1yiTN8040NUUFavKTLXPx2sdsdELrHvFQYYzfAdlbvCrah3Y?=
 =?us-ascii?Q?c+jqqm8w29IT2SmmkLi7Ap6PaHQRI/qCqm2cxVePRKmG5SjPUGPYx1XG8JaP?=
 =?us-ascii?Q?GNglBFaxBpd1MDrkVseqHtX5ti1uxj89AKKY8CSS+hG6EzuhA0JBa1ZpVNjS?=
 =?us-ascii?Q?q2ZRaCIQPhO0LJwuN5oriiEtXCbn6oHZLUD+SI/FWxUsJuEmm7x8LRgybL5L?=
 =?us-ascii?Q?qVg28ieCE3amLSl3TSWNeYEiDvqIVeoMvfa0x0YPumfF1v4HmZAeKTKrWdWY?=
 =?us-ascii?Q?IiqRO6vw/jjLbVA2eU2gVgaVTHiPGUmL5tuBbNhIEXNSQwVwgFZbE4W18/WA?=
 =?us-ascii?Q?mKSU7A2tPnndlPCYcpVFL668VeigaU4uwSKK6g1VdymV4FsjkiIqXx9ihHsF?=
 =?us-ascii?Q?SkjRHulUORlhJCmEtrZtfKw2R4nCFmdaYcsXhgfmAyj/taGmIzY3h8cr9Xhc?=
 =?us-ascii?Q?27a4RcBG8c+hBf2HQr8OYZgpl9IL2V+oVJZf7Qp7NL9u3z7Vh2TPTcxIjwwO?=
 =?us-ascii?Q?8ExXC9qWVKLRkgmsuH7fmcx6kmo63a/7hJRR5/ufgfcV8cY+q2aomhdFTXRh?=
 =?us-ascii?Q?PeeyUBdMLH2X56JEm9d0vu5B4BJn7rnfN+YQ1zU2b1YW8jmgCVeyjwDvEPo4?=
 =?us-ascii?Q?gaNOHDxtdENVIPhofdLIvODqIH7nuf8ZaJHJhLxCGEAzWWCDY8ZHmPyuX8aG?=
 =?us-ascii?Q?5HJv/EqaVf6Eh0XcS+ftlPJePxGOgZBqdhDtM+xJ6dre5+Zo6dn7kAXi/6L4?=
 =?us-ascii?Q?X5RUqY2RYPOFA3d1rq2DwnQEP2KF81OXS3luBxzjp8tJKPwISXVpQ1roenFT?=
 =?us-ascii?Q?Kxf0wzMyaGe+A3zdpp56I6HmjsTqQgc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b4f3759-9886-488d-de50-08da0e48dc20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 10:18:52.1809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M4YUniQsey0UOto1rBaiooZM8m7572H9yVgh4asIod3Xke2Ix8juJYo0S/AVjIG+r8BgvYxOLWN5Gu/8ajYcrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 10:18:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163632

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a libzstd package to remove libstdc++ runtime dependency from
library users and reduce the size of the library package and its
dependencies.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/recipes-extended/zstd/zstd_1.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.2.bb
index 0ddff469b8..3887f31ecf 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -36,4 +36,8 @@ do_install () {
     oe_runmake install 'DESTDIR=3D${D}' PREFIX=3D${prefix} -C contrib/pzst=
d
 }
=20
+PACKAGE_BEFORE_PN =3D "libzstd"
+
+FILES:libzstd =3D "${libdir}/libzstd${SOLIBS}"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.30.2


