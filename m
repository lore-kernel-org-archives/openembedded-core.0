Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D9AC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 13:13:32 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.62])
 by mx.groups.io with SMTP id smtpd.web10.148361.1698671600734719202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 06:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=cs7X1bW6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.105.62, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg5xtGyZD334lq63QDMgC/x9S+KqJfAhCjahncS+lzPDP4OrAsUa7+DaV6Zt4vwhAWjrI4iOM+xqRk+ODrshcKiu7nIh4uJjHEp/0CFD4fN0PGhp+dLYqG90R8C4xJP7QntInc5YwFEk8pzbZTScfayU88nK2dKpKHfz5MCGt7WAfeMCMXWT2+GsrPVWIIgTwGfVdf+2GUUG5kkJ27imJFzcuYX9BylF6BtRCAqu+g5MPXWpAIGrABa4PSIWpjFz2PWcgdBKM6aHuyUGHvNkTzolCqBwzscUp3UUxToRG+8ncFiS819gbG2xbmCOSi8LDvUVQzM8XXwf449ptAVOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsHoi9FTfXIkoBGUzwtVDYchGf2YQT9FFKO+FaD17TE=;
 b=dzuKYdK1vuqFGhn3TmirbyH3R/t3YyXd0zxHWnBeAaFN5CMNXYJpktThTckEzMGGt8pmkUWusdTO3RS8bdqQ7iW4ZbXPzK5+S76328TlxadLg19UA8Sq7A9fstWd/XNvNJD86m2MvFr0JWqYjQz/Ycv3iNnFajk4BuSI6m40MTXYToyUCMzqfw3T9dMyxj2/cbknhVj9RkOMxp+aq2PcHVKAWIhsY4UXVdoVL2sA4PNohSVdeJpMIY7ll/2ZN0CLj7UfUHGDwY2ufFGQNhIZnjuA+RvIOrq/YlWnAPhZH6I/XP9Y/iBcDBK2anR0PqkNTXToPb2nePOYVV9G1aKG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsHoi9FTfXIkoBGUzwtVDYchGf2YQT9FFKO+FaD17TE=;
 b=cs7X1bW675ypjLQ33N0QZFb0aoZSHXnsxXkQlAI3xVJt28D4p/2foqPjdKRBVsrJitjKf1SUvNz38LhovLUOJGycLO5kO6TSf3IIsSmw4cXyLPhky4eHMfa+QGjK4zrb1I2kngjC+QprnivPf7XPJUw393mOSh0DVoDoIPfJUlL9YlU55WnEFArQoyyW++nKVuSe7ucPxAqrX/xQ6XkcO+uipTkzB884A7pb/J2Qos0ENtLuJwIUym7BDw/XnoOz1mC+55Up/W+kPDgfdpwoujGZiDuQU0QYlFsVISKOg4MYNAMMBsHLNGKtHm3f2DWIYNITENJAPVYqRwePlu0KwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB7715.eurprd06.prod.outlook.com (2603:10a6:20b:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Mon, 30 Oct
 2023 13:13:17 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%5]) with mapi id 15.20.6933.022; Mon, 30 Oct 2023
 13:13:17 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] image_types.bbclass: Use xz default compression preset level
Date: Mon, 30 Oct 2023 13:12:53 +0000
Message-ID: <20231030131253.1707354-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00000107.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:1f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 64054a12-c21a-4b34-c8f1-08dbd949fb12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Kc6C6nasFgpNTV5kzZAQyRTBOAAbix6CpLMRZslCIxRix4N50pqGl11QoufQ6/CgtkfNBOhl6bv2t1t/vq2DK/NdE4eqsoDS583X0PMGpKHcARntxJIxsqW+eYfnD2CKxJvbQdapGwKN/BBWb77TjozpEDkQdsQ+DIg8B7yu5BuBdcu9dBRZui3ntd1U1fDUaUXZ9aYD4LWWwnSw4IaP5DWdj/rirIYkQ9/7fbjH5rOKQvEbb95I0U4Heeqtd4JK8kDvhL22d9U1IXtN2nAZSeYNPbg7Kl+KFD9mhV1KOPExC2dXJxQZlNLN45EDR2Fh+DBNkQhuK8NJJP9Mrx5ZEJu8BiA7Owva7bdWoXgUgD7x71T6gWgoBzzCALPU71jNHRY3ZaLpE99NN3jgYARAftOSFHHmeRQu1fZK+WuuK4ZvgzB7qGrv2Pd+XbrTaw0FQ8YxuJO3XLpbsLFx/OZpQ0h3i3iV1UuVH+fv+OgC7iuEppaWiwQ4du3zJzy6/aeAmY0uk+jLVdGCKtjj14ZXOKtqVn4yqdqOFAjWnqyhMii4/rygyNq72LJJLDdODoLezEUljcfT+4q0yXvhsvq3UTiAZOCUEpO83MHDOV9llD3nB8tCQM6RnsDjjO5dEJ4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39850400004)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(26005)(83380400001)(4326008)(41300700001)(8936002)(66946007)(8676002)(66556008)(2906002)(66476007)(5660300002)(86362001)(6916009)(316002)(478600001)(6486002)(36756003)(6506007)(38100700002)(52116002)(38350700005)(9686003)(6666004)(107886003)(2616005)(1076003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PLBkOnocEEZxKQh+P2MJxjWPlQXPvY6Vr2EP6PTqwnJmDl88Rgb5hevBCPbc?=
 =?us-ascii?Q?Lf/4wXuQPL/hk+6sr2KunpBl02DFrEYFTWJVc12wvt5Q7QFAtC85Xv5de73n?=
 =?us-ascii?Q?N7ywN76nKKiRLZoPhguo60yIika96zc3t7Yj12JiAWrz5QYSNBLN/JfJOrH/?=
 =?us-ascii?Q?AZ8ESd6ry19DLgeRG0O1FaG5e3PdSuQdAW5rIM8zrEAYBV5EyggqOpMi3Nzk?=
 =?us-ascii?Q?FIIEZw6MpMOPyr4HDogKHx5di16vMV1UY3hTr4njaTxx79n5AHanZmsnBd63?=
 =?us-ascii?Q?sTYVqIclthbCT9T9SNy8MkqHK/+b694GRWZylHNInMvQfnxsLOrFVr+6V0aY?=
 =?us-ascii?Q?esDTOjnFcPnCV7MlCwrlfe8B3RUCW9vRfsCYlqFJVmJx3OTrlYeSz9Ld6hzK?=
 =?us-ascii?Q?POSxyE7RmTIf3oO4anTidNnSV3SUCpB4DCWEIAtAs+aCOqELjKwK4+1TKcWP?=
 =?us-ascii?Q?jKl+KwHG5GmwW0dtZC5mPlHUzcAeapiAWWRRmJB6b2Df0NKhUnxlxsm5iaW6?=
 =?us-ascii?Q?nlvNiKepRjtk2TSajX9e1S6jEdcT/Yw71bh1ioG0Y9olvpq5q9wmr9T8aCsP?=
 =?us-ascii?Q?glpSUCXPuoIbiaJOwVr42onQxjXvkJ79rDdxa1Pt58gPGbypx1so1K2BcnIZ?=
 =?us-ascii?Q?qMgywHbRyKrJVYeCI0GJruRpj7dSYSTttsHucbZC09SEvhndLdGzUsOmjE7e?=
 =?us-ascii?Q?/EX7dtEmEQ/AnKMEvOwasAl+KbNeKh/JGbten+UWCFw9P988eNMkgm56vD0t?=
 =?us-ascii?Q?mOghJ3QYHZLEUDoiJwYVSl5IaSeTnReUy4P2iP0Z0c9HGSepq07mpw+nX6xH?=
 =?us-ascii?Q?eADhCZ1fXxrTLE/cLefWuLBZs1EgQt7HvrvUEe5Ba02Xwj5+Fztx6txA6HIe?=
 =?us-ascii?Q?PEDIhft67mBxSJy6dRsUjY2U+NSHdnnOk5qyqYxfz8je5YyoyidlBQXIm6RJ?=
 =?us-ascii?Q?PfR8X2H3f4kZwRFe5LJJj864WxkFop84Gl7lkyabV1MqJV6I/Kg4viJZEWbu?=
 =?us-ascii?Q?aXINvd2jpd6xYr3L8I5mmb2y34S6GyJSxmDWpf3X2nVTpOcBpNQbnsl4VSED?=
 =?us-ascii?Q?0x4bknvxbapgP2rYpeeITWshLOjcdNb0MiYZS8eT+usoOVbyQaAFGqu6gTem?=
 =?us-ascii?Q?hdlJ+L9XyyU+5zSKg7To+br07+nI9ux7Ss7yUAWIs/hg2xm00RnZdg0NR+uw?=
 =?us-ascii?Q?24SnBR0T/pPgTQZpof8jtuRGHf3AE9ByZ+9gAhIY17ZtmkXcrNe7hC2dYelO?=
 =?us-ascii?Q?E+bW2nIWUJuVuJrzGCqyA71/8k+jh90h3CKn2F3g7nYKEuw183L2862ffXSF?=
 =?us-ascii?Q?PR0uGg820+tBA/LuxDMkqn1V4u4lxox3yaRF9yET43FWuzDYp3td+9CQudux?=
 =?us-ascii?Q?Tr7N1o1VRa67xZabYfqjbjL5ZNeRbjsLAoAgwWyvqtdaqcbDw6RwAjn/bOW2?=
 =?us-ascii?Q?Ej2ND8uOGJn1W6D6LH1ki9ZT07OrNMXI4u/VO3RM+Hp0pW+W94JPtg9+xOBS?=
 =?us-ascii?Q?6uTeJ9qV08VpNjnMZXCCEpYyI6Fb7yFfH3FXDdmNfwUK5cB4Ld0PNWtl9HuY?=
 =?us-ascii?Q?+sm+a13I7vjEDgISDQ2hUIxJQml1Fxm/wKIfmmXWV0S+kwZZbnh0qTvFrKCE?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64054a12-c21a-4b34-c8f1-08dbd949fb12
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:13:17.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkRGHlRCb3BfJ56SSuuRbZfUJnEYWCVeSeHgsskdwXdGyQtPtzxtwJQyrdMja+cN6JtyAOPZr6oeWZ9bDhSbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 13:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189794

From: Niko Mauno <niko.mauno@vaisala.com>

Commit ef0654f1453ff0afe98d7e921626b2a96cf2f6f6
("Set XZ_COMPRESSION_LEVEL to -9") changed the xz compression preset
level from previous value of -3 to -9. The commit message explains that
the change was made in order to be consistent with other compressors
that also use their best compression. However looking at xz man page,
under the compression preset level selection chapter there is mentioned
that

  The  differences  between  the  presets  are more significant than with g=
zip(1) and
  bzip2(1).  The selected compression settings determine the memory  requir=
ements  of
  the  decompressor,  thus  using  a  too  high preset level might make it =
painful to
  decompress the file on an old system with little RAM.   Specifically,  it=
's  not  a
  good  idea  to  blindly  use  -9  for  everything like it often is with g=
zip(1) and
  bzip2(1).

which is then followed by a table, which mentions that the decompressor
memory requirement for preset -9 is 65 MiB, whereas for xz default
preset -6 it is just 9 MiB. Given that the use case where a device
running a Yocto generated Linux OS decompresses an ext4 root filesystem
image to non-volatile memory as part of firmware upgrade process is not
far-fetched, and considering that a range of these devices can run low
on available RAM when there are other applications running at the same
time, the lower decompressor memory requirement of the default preset
level makes sense in order to prevent an OOM situation from occurring.

This change was tested on a 32 CPU core build host with 128 GB RAM by
issuing

  $ bitbake -c cleansstate core-image-minimal core-image-sato
  $ time bitbake core-image-minimal
  $ time bitbake core-image-sato

With MACHINE=3D"qemux86-64" and IMAGE_FSTYPES=3D"ext4 ext4.xz" using
XZ_COMPRESSION_LEVEL values "-6" and "-9". In both cases the resulting
'ext4' image size remained same, 38141952 bytes for core-image-minimal,
and 565043200 bytes for core-image-sato.

The observation was that with this change there is a small increase in
the resulting 'ext4.xz' file size, and a build speed improvement that
was significant for larger rootfs image.

core-image  XZ  real time    time delta	   ext4.xz size      size delta
-----------------------------------------------------------------------
minimal     -9  0m44.992s                      15932508
minimal     -6  0m42.445s        -5.66%        16243484         +1.95%
sato        -9  2m40.828s                      85080416
sato        -6  1m38.891s       -38.51%        87447456         +2.78%

Regarding decompression speed, issuing following command in qemux86-64
target OS

  $ time xz -dkc --memlimit=3DMEMLIMIT core-image-sato-qemux86-64.rootfs.ex=
t4.xz > /dev/null

using the lowest accepted value for MEMLIMIT for each case (providing a
lower value caused xz to exit with 'Memory usage limit reached' error)
showed that decompression time saw a minuscule improvement with the -6
compression preset level:

XZ   MEMLIMIT   real time
-------------------------
-9        65M    0m43.83s
-6         9M    0m43.28s

(In the above tables, XZ refers to XZ_COMPRESSION_LEVEL value used when
images were generated with Yocto).

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 4aed64e27f..d615b41ed1 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -54,7 +54,7 @@ def imagetypes_getdepends(d):
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
=20
-XZ_COMPRESSION_LEVEL ?=3D "-9"
+XZ_COMPRESSION_LEVEL ?=3D "-6"
 XZ_INTEGRITY_CHECK ?=3D "crc32"
=20
 ZIP_COMPRESSION_LEVEL ?=3D "-9"
--=20
2.39.2


