Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C002C43219
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:00 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.89])
 by mx.groups.io with SMTP id smtpd.web11.6161.1633679337460503950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=mfEPR/dH;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLcoZdj+4yjpfNiVM9ggypXhDDPoo+VD7WR6aFrdi3JS1sJpPup4i/UFG134iN6zxoQtGFIuhu8M4Hsk7Gp9s7+KplwvSUVjdK7aFPjSFbXLWRLlGaV6VLxdgtQRNGF7CFsgIIqIayLno8Yr5o0grFAJMLN+Fm2Y2KdTe4eRseBnjkr/BwxPSKZq1T7cZggHnQDmD2jVx8kRoi6VD/Lp6ztJf0MGhKofi1uwvRyJdyQ/S+Y20GJgjPlQ218pdxjkVlMacdiYrF+dLGmolBaTSEPJ0227HbyTPQWeWkJ+tg4xMlnLi5suAbz0YWbumBul3O0RJu7oYzcjo4w1x0c3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5uWmokHYBrRRDAP9zXZ+CTkGe1yfGSgPs5v0CBqxFw=;
 b=F1jt0JrMvXRBWc4RSgCzP+Yz5LR0lkhESRzxrmq93100bug69Zar0bh2e4FANlY6M68pnYWmhmxrVZfSSmwSmu6VlVOmtrP8Fo70Y4zueKuSFJtmSjLq+Drps6VXyYBUCwI9pZKUViPSyHiNQ7ApmPmhY67puVjPpj+3wDhF4CSN19W1kfIIOO+5OWu82efmyX7ZmkaTQDQDNPiK+PytDw3vQaT548qeUkiLQHduULwoby0REnvWcTS6xzQknOEkJOn2nSk2h2BNuH523IXkpQOTXFtYoIIk/eQ6FqwWlp1NTWtbFzCvW9XtvhcjXhWdhKlClvJhuyvFjg9AATJfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5uWmokHYBrRRDAP9zXZ+CTkGe1yfGSgPs5v0CBqxFw=;
 b=mfEPR/dH4vcbnh5zWSnL57FqKD9rSy/gg7wK+GafveMsPEy1YwRjimQPZWSVnv9PCTcF3Wlf2Q9J0FxDMBab+vKqaW8vLghQ1528UW8IX4kNaJW6cIdz3uB5LecNIKaIhAaBk6XocEWAf3N8CbOVgKevtlbVdDaPn5ZU3L1+0Yk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6478.eurprd08.prod.outlook.com (2603:10a6:102:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 8 Oct
 2021 07:48:55 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:55 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 10/12] npm: Add variable NPM_NODEDIR with default value
Date: Fri,  8 Oct 2021 09:48:33 +0200
Message-ID: 
 <20211008074835.10320-10-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac57a1b5-7e1e-4f26-5cfe-08d98a301454
X-MS-TrafficTypeDiagnostic: PAXPR08MB6478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6478A182F39C1DD3871A4035D7B29@PAXPR08MB6478.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Olpz6aL9Uy+nimWO4Ws9+B0tDehbzsctD7E9/CgHXrcOerYlUIrQg9YsVZrEe8bm5IcpfIG7qnF/RrPXWOHLe5yaKJ2XY4zbXKXN7jhiIY2NyRZY8aGdJ+1WZtcSVblOpE4SfaQIUdTmKsZH+DosLFy4BwtZZc2htT02PlScnaBV94oFmZbVzMzkBdga+yz/al7yttYng6Vo6RTB2tAyqxAkeVz+oZuIXZsgIKbSfi0KakU7fUf3TJj8DdVqQKeOBTcgdlzhwtHmipsKZ3HQ1l2ovnlcnThMtWfCf94+CiljrF9dq0I8QvcIYN9LLz7k9mIVonlx2A+9unP/pfvdZveLrxe+bJqUGYt7VNomrKki0IkvfQHQU2GdFV15l7debYF0Ncwh37q54WLfjXwxJQ9o3o5AsQGU2gvEtkCbZFvzCntnGGm73DQ3GOhPdZlt1ZPXHsMwbIhbBW78i6TQEmGX1i8l047u0WUP37kvrG08pUNDQymQGfVcXcg2RaIZ1NF7J7rLqq6vTVsO68SymMtPFS+2ZU4qAWNlKcJGCp56P03SSkmKbMaOMdEZC3/ofaw1Qdr77VoTqYExwNoKn/KDWnB5EI5ix98MhGQU1oDwSoeHWmb5tJL+jHl6FpT203BHnJWrvvG3BOjl9fa8rj+vPjAs4bPtU0VJJ8Box9po9YaOYeBvEENKMcx5b2aX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(7696005)(4326008)(86362001)(956004)(508600001)(52116002)(2616005)(2906002)(83380400001)(26005)(107886003)(186003)(5660300002)(6916009)(6666004)(66476007)(66946007)(8676002)(1076003)(8936002)(38100700002)(38350700002)(66556008)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PgberzfYfjeh8rXvt8STHmeVYJtFh9KrcmCkFdVouFQVf2U7ucbq8ygyNUpY?=
 =?us-ascii?Q?P3j0x4HDjUTuPhZSXmymlTEH5dstJc435PgNZPbrW02m4o9oMg4m17RfxRF4?=
 =?us-ascii?Q?1kH0ka3qcCwoHodYfqWB3rEPRxllgH66U7iWc3v9Bg4B90wjKGKjL8KSptI8?=
 =?us-ascii?Q?/jfwwOp5EhsScURfKnYRFnaEmWv/93qlK9zFC0FdQJ4eq/0Mo8SiPEYIMTOh?=
 =?us-ascii?Q?JAL+v/WAsorOGNpw2aRdKcFashiWQkbt018GQpLsXVASLd9OLeJzNE0h3sTR?=
 =?us-ascii?Q?K4n0q0BwHybtbQVKjb3u4pJrfodeHsq/7aC9LknjKoxvmLgmq9cdgnczVqT5?=
 =?us-ascii?Q?0DtDsUOJPktNsIA+dAy47kSTnc3gtHp+Bsy5HRH4ytdW94xWZH6bdPJ2H3KB?=
 =?us-ascii?Q?kBVLLTVDAAOfczuqe2p5YSdjMHWKCIg1LyRZeODmKbtRjjm8ASib2E1Z1Qwf?=
 =?us-ascii?Q?OV0xo3/M1mfUHoaPEE7zcpO4cnEeuxn2CP+opcW21LZVwT0FFmbtN8/oO4q4?=
 =?us-ascii?Q?9fHeSQ2Ng6sBy9De1R9yXyoR14j8WelhO74jiTGHkE44CGAU01uiU97AdPCM?=
 =?us-ascii?Q?cXqGk1+S5Lc4vMplQjSTSLy8g/Yf7YlhBWeB/cRpn7ZqrrKKxR0B4ANNMIAH?=
 =?us-ascii?Q?ZR+6+PAYvpdCEQwVHPrFqQb+NVbCqRGNeVLTZD2sBHY3k3xa3QuUsi/76bFK?=
 =?us-ascii?Q?+C5dPCxQzpl5gF9E/fVLid3XgopO1So+Poan+WTbj/KeBCHGIuz1v6NhU9pA?=
 =?us-ascii?Q?Lh+REZ/W2hGqlpi7bAWEEVcufcmyC+MoCCyCRooCiixVstXNSlrzZ4QnFbkZ?=
 =?us-ascii?Q?2Mfz7OJRi9aD7/Zb9IWqfD4YiqmxxjOSoa8SR4MYy2e6qhd1sSza0pnWgYCW?=
 =?us-ascii?Q?bzWWzm4Sphgi+ksVsA9raBQh3vVVInA81ehnSht6ZC8qtI88DCgYqrgz/mbA?=
 =?us-ascii?Q?k4+EpXbPDJDnDgb099g/jDPZ2tBwxIExonJdH6nPuUwcsXffgm8Lhjfun+HK?=
 =?us-ascii?Q?G2894c17D2N2mYhzPAW47gT+2OpMJgmr30OOmHWc1Anyn7BExYoeK0ypL08o?=
 =?us-ascii?Q?0NXpaetDowpatdEe5F+C2nQq3ieGM6Xb5cFRKJV9E3DsjCTzkxU5fBfvMkz7?=
 =?us-ascii?Q?N46wOT+5Q/hAD2kAHElSkhzyqcJHNcVFrOgt/9DOlxyz7quHGSlFU/PVY0Dt?=
 =?us-ascii?Q?Co3nK5DSZFsa0hLZFwUyKykK58nYU8SXCy4jIs1PgIwOIh9LK03JkwAENqD0?=
 =?us-ascii?Q?9qckyyw70Fnro2rtrjyF6sfe21a2Jdy4u+Bf1iH66zRXC53w8eHuQaAnXxkx?=
 =?us-ascii?Q?naDZDagTfOSbl7djF/QdNyBB?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac57a1b5-7e1e-4f26-5cfe-08d98a301454
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:55.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 b0LwjvJpeKWopQr8hQ7L9kGQDhDTdwrcU3k7EVWkN1XfOqRLlJ2KauUhwZyIZsTZD4TkRgQY3phGE+BPKKlY8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156764

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Replace the variable NPM_NODEDIR fallback to a default value inside the
code with a variable NPM_NODEDIR with default value.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/classes/npm.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 477b40d921..05bb9f578d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -26,6 +26,8 @@ EXTRA_OENPM =3D ""
=20
 NPM_INSTALL_DEV ?=3D "0"
=20
+NPM_NODEDIR ?=3D "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
+
 def npm_target_arch_map(target_arch):
     """Maps arch names to npm arch names"""
     import re
@@ -249,11 +251,7 @@ python npm_do_compile() {
         # Add node-gyp configuration
         configs.append(("arch", d.getVar("NPM_ARCH")))
         configs.append(("release", "true"))
-        nodedir =3D d.getVar("NPM_NODEDIR")
-        if not nodedir:
-            sysroot =3D d.getVar("RECIPE_SYSROOT_NATIVE")
-            nodedir =3D os.path.join(sysroot, d.getVar("prefix_native").st=
rip("/"))
-        configs.append(("nodedir", nodedir))
+        configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
         configs.append(("python", d.getVar("PYTHON")))
=20
         # Add node-pre-gyp configuration
--=20
2.20.1


