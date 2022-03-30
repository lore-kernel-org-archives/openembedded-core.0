Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0696C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 10:46:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.104])
 by mx.groups.io with SMTP id smtpd.web12.5602.1648637186916786791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 03:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk
 header.s=selector1 header.b=RAsKujTn;
 spf=pass (domain: prevas.dk, ip: 40.107.20.104,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoAXLF+eaNhFVy97Ng0Y4buvuDslCf3LQCEbb3u9Ie/ieHV3xPoA/SjfhNIzdr4TD5k0xzUXpw3Ct1tMnZ7EBjXvu99WPju7TGRnywsBhxZO2vdLVP8nZKyHwAo8fXCFMj+g1GFB3TF6NtgFqUQLfxBJSEIr4OBFnpuOTuHsVcTtl/CWi6rzeVEhnncaKtPItCwWUzQjKJHOMwb6/CwLdM1p0HoL6jPoVYcEwOpZb6SyKZioMnnzLFxT5RgHoaKi6ZASpPEa59HxhAs4keS0kLg+yVVo7Ak1/WZGWYVd3DDpk3wCficrrrT6D/FprxL7g9fdSIKCf/XTCkcHOVFPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzECT/6RJhm4Bi9X2vWmqRZoBRIhYRNBuyhjeKc5/ic=;
 b=brUiK1BBEa3R0GjGETt22rz0sDJr1Ii1Xq1x08WgYtpZiM1/OkDvTTBcPtAHhQpNnkcUMgwbk7zmPQRaqsC4B8frZAkV7QW0EIzocnKrJwFBBuiKE+Od/ltPuGWfKj6YtPV06AOjV+Bi3vOfZaW3NZlNofUhyKrQ1nMqxi1S80mkhwMExMZkfm/gM55ZB55obOIIlla1ScpbFdmklVIYD2bgMKlU1oBVh+GtjlYT3KxBvm57Y4C9TSob3D0ojZx6VSPThUV3yGAvROcBnTSUnhNZpEocZ6hghcqyAuI4aEgJlMcIN6hCU6K7mF1jx3cUEOMcY8eAT0/9m1GsHnFL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzECT/6RJhm4Bi9X2vWmqRZoBRIhYRNBuyhjeKc5/ic=;
 b=RAsKujTnoOYwpahetDQoDXAyZmSStyzXZAH8TqI8mRQurEc4UDN1nD9Gifx+bjFwThjq33n7G1UujxeN5TKJqmvpNS4qP0oByc48P+xxHnpQCa/yXScf9bb8pvUseA41JFZgspLRaByLDmoi+hs/oocsNC/L7VFUIYw8ZT+NkoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM8PR10MB4740.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Wed, 30 Mar
 2022 10:46:23 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9c95:6717:4f50:ded6]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9c95:6717:4f50:ded6%4]) with mapi id 15.20.5102.022; Wed, 30 Mar 2022
 10:46:23 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] git: make expat and curl into PACKAGECONFIG items
Date: Wed, 30 Mar 2022 12:46:15 +0200
Message-ID: <20220330104615.3178842-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM7PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::15) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdfde1ab-753f-4c64-ad18-08da123a889f
X-MS-TrafficTypeDiagnostic: AM8PR10MB4740:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB4740D883C4256ED302210940931F9@AM8PR10MB4740.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YC57R5uwIw5ZbqHqBugqhLHedoNwK30Tb1PetL5BHrCE3/wNFB7ZpV+ps9ONI64g4DEDSVbT2azWQpyPSkZ82/8tifYrpNXwlos48dHDWm9CmA85HhH7c3RNuTH/7GzePUlVECmDTYtEsCdt+g7FL/nqwo3bxy5xiExG+i1OB5/wknKGKtaD83XcFATJUJ8qz37xHeSsRz7/jCIO35KP5O6ebecdP9UTwSGqTs/xDD54tQIqP2k4/3vZuF1cv3PfMizBMbtomH13+fbP53YV/PvBwy1VOOs66ozRQVW2ZqL32Ii9n/FN26jzVE//nbNx19uI/spcEgfB0KT3qTv6eg6jQbqyc51g4TLlHsL/8MmdmiW0haio+kJvNbBF1Wl2/Xz2WFaIp2/7P/VrnTRth5dtMN/7JPlyjg+sU+r1Dx8r0zrU+EUMsyFzf6paxX/DB+eGZll8w9n7SINFqkbTNTKRSVYxn0+pJj5QMprmkt7sNTCu0kKQ4bIGK1iJiqWm/uX5zvBabxnu/wiFKgUaSYv4eNbWFlurrzlddy7r+acYJ1igfdRUedRvFQ2OyrRwH5meIVZ+Xayft9RkBbI52XEGEkYfcdepIlYYVpG+ZjHwzgTn65nk9BEXn1rG1lGOvkWDDoiFdChy0wIbs4YMeAKkNWvZ+tgvV7mMEKiSqVAWE0f2krp2h+YPMbOMsJFHl+4A8fSbU6qyoQUe+pNDiIZFKCSrnSUQcfmCv17X8AkS8cnl2tMBM2M+5JJ8L7Ch1ph8fhCwhIZepZIjnSOhdxoF6UhAQOYGL0iTOOPeyVlHLEa0Dc1atVQUUPLVdD6s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(44832011)(8976002)(8936002)(38100700002)(38350700002)(5660300002)(1076003)(26005)(2616005)(186003)(316002)(508600001)(6486002)(966005)(6666004)(6512007)(107886003)(6916009)(54906003)(52116002)(6506007)(4326008)(8676002)(83380400001)(66476007)(66556008)(66946007)(86362001)(36756003)(2906002)(376185003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?afBoicbfnZhmNAtJPTr62KgJ0BwwNfK1hrvApFY9bYbckwHjY2JMKrc40A3d?=
 =?us-ascii?Q?fMqOLeKpYLuIOfSE7CSy5T9s8lYXjmyXEklWr+GeIQPICg41Ho6cw1uMgnXv?=
 =?us-ascii?Q?nC7B+rD/K5j24st826KWCp/8TCezG/1kHkNs1av9aFwQ7eio+88FzIgtXsJt?=
 =?us-ascii?Q?68PG2dejBH+npSlGCk7G82YPTDRhecTjNbvgbX2nZKFK8p73XDcWHtWoA/Kr?=
 =?us-ascii?Q?4Gnw99hgcZf9zf47AA8sJQRMlREj72S8yrC/jjmchJkvP8J5Vubuckwl8xG4?=
 =?us-ascii?Q?6ZwfSCRwZYvxilg/JQmnL5fZ9pfYIUvR+zExU0GGm6a8inIjku1wEiaoKDEx?=
 =?us-ascii?Q?oRfwWO9lg5kfEsiC0P5IgZAPcOX8jRsHBKLr433QmtHJZOZVrceQ9sMiqXJI?=
 =?us-ascii?Q?pxvTLC6JJmKh17O9zdN8XpRyx6HghGB8al9w8QHCjQTp+/drrDLQFD/nUMAS?=
 =?us-ascii?Q?2wwpZAhQjarwM0C8+A5+APTXPnYUu2rkBqNmvpyou4GpimdWgPP4NERhdv9D?=
 =?us-ascii?Q?TYRJ00mTuCcUE2dClmjs1EOBuewegmESPwI03xDwuAqJJaZssJ4dgRWgjlUj?=
 =?us-ascii?Q?M2LiuIRC+SaEkiEj66W/nIf56bbwj0Nc9TitrWFfPet6CdhyTCL0Y7y6Txgi?=
 =?us-ascii?Q?sMCPqGNcqRMETe2yT1F++KHi2u70Cqp/zRi7749M9KJBCi7QkT22Uq6x+sSf?=
 =?us-ascii?Q?Jnc6l1Hvb8qnEsvrJKL9yZty5BPsmjCwk7sez72ftyKhZ4fbi8ZHfNNzfi2a?=
 =?us-ascii?Q?pveUkFyik8EynUIhAvFb9gpmtyX6vW5Rk6W1EEt0UsIQoXPeIuiWfbFZN6PZ?=
 =?us-ascii?Q?uTcIzRqHuQyXRFnAGfKW9FdR4G2WYcrcP+vJSqAhHzxtk0OeeQSi+lUq58Lw?=
 =?us-ascii?Q?83V2Gial9M02deLuSE2Gd/Yd4fOQHv1Zv2jbZzUhQZZg/0VRRZioe7DMeUQZ?=
 =?us-ascii?Q?D+uO/wZIsbJrvy/lzu7xjp/g9AcdUtvbMatF0SFenAF+jroifWVscYXTMGB5?=
 =?us-ascii?Q?OOz7IrD6Wvii7VIvPJlApSPRSrKvlcpNjE/HgPR8fKBHFpIDdnR7KM5zANVO?=
 =?us-ascii?Q?BE1WmLNnf5ftDiEmLWPzTKihgxh+49D+wy+KbV6rEmVFJ3pPg+lorxKugUs7?=
 =?us-ascii?Q?6WpXcTv2d0xMs2xB+IlBpXIZDE2HRx4ynIRDE1hLIbY7Cns+oG+N8vehs/Ym?=
 =?us-ascii?Q?+geFmk1oSYJ5WMpk6WWmtvEUxqUyjxkP69mg5EjS735F9YTzAH1eksYRL9VU?=
 =?us-ascii?Q?bPHunbenssaww8vL+g1LykRx9biyY5nbtjpCbGJ6OkfVPQRa9ErFb3SA9UYt?=
 =?us-ascii?Q?fMA+JPgdDzo9UGW9n5IMLY3dlJOoNNQP8lxfVe9h/zwfhKGw6ya260eJu3uc?=
 =?us-ascii?Q?iBH7FwFaTOgTFaHxrz0A9+gvM/4Qmn8DB4HlbEo36xTuA22ZQG8GFMXOLvXa?=
 =?us-ascii?Q?0kPKHfZ/lzp3YFe04y0uuo/Nu8UNfW0pEdr+GNs8HTygSg5Y+/KmwFpIz0DU?=
 =?us-ascii?Q?c9WeEMUaYk+qmuk9dztW5apdoLfesF3TkWyFStF+E+l/lOYu9qC5whMfMYtM?=
 =?us-ascii?Q?q6OixCMz8dGMevX5L4NSRumxZniwyDP6H/Gu+PT7mlq8IFcNDalqj7KCpA54?=
 =?us-ascii?Q?lFOTdaKlyhAGSxef19A/3HghtFpWXwbzdI0pkgTFuJoIfnjH3+u9cptsIRAm?=
 =?us-ascii?Q?CnAXulP1lHNG7mgKg8yW7RfSuix06jqpcWHhDjsmXdp1SFuwPsFX/4Ngg99N?=
 =?us-ascii?Q?pOrdZcef6iUnnZcoOrhRV2bvgSK/dT4=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdfde1ab-753f-4c64-ad18-08da123a889f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:46:23.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U2ULH/ONK+D42iBeXOWM5hNHRARHsdJgS3U54H6NH7xg413CqMfRw4xYk2kCHTctWn0ZOauoza5fmdulQwNTiLFVKmXxJigGyQiitCH96Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4740
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 10:46:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163781

It can be useful to use git on target (e.g. with some wrapper like
etckeeper for keeping track of changes to /etc), and for such cases,
it is likely one has no need for pulling from/pushing to http[s]
repositories. From the INSTALL file:

    - "libcurl" library ... If you do not use http:// or https://
      repositories, and do not want to put patches into an IMAP
      mailbox, you do not have to have them (use NO_CURL).

    - "expat" library; git-http-push uses it for remote lock
      management over DAV.  Similar to "curl" above, this is
      optional (with NO_EXPAT).

Setting --without-expat and --without-curl reduces the size of the
installed "git" package from 18M to 12M, in addition to avoiding
pulling those libraries into the rootfs.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-devtools/git/git_2.35.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtool=
s/git/git_2.35.1.bb
index 0cff3ce1001..47c22118640 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://git-scm.com"
 DESCRIPTION =3D "Git is a free and open source distributed version control=
 system designed to handle everything from small to very large projects wit=
h speed and efficiency."
 SECTION =3D "console/utils"
 LICENSE =3D "GPL-2.0-only"
-DEPENDS =3D "openssl curl zlib expat"
+DEPENDS =3D "openssl zlib"
=20
 PROVIDES:append:class-native =3D " git-replacement-native"
=20
@@ -18,10 +18,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c0d7ef03a7e=
b04ce795b0f60e68e7e1"
=20
 CVE_PRODUCT =3D "git-scm:git"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "expat curl"
 PACKAGECONFIG[cvsserver] =3D ""
 PACKAGECONFIG[svn] =3D ""
 PACKAGECONFIG[manpages] =3D ",,asciidoc-native xmlto-native"
+PACKAGECONFIG[curl] =3D "--with-curl,--without-curl,curl"
+PACKAGECONFIG[expat] =3D "--with-expat,--without-expat,expat"
=20
 EXTRA_OECONF =3D "--with-perl=3D${STAGING_BINDIR_NATIVE}/perl-native/perl =
\
 		--without-tcltk \
--=20
2.31.1


