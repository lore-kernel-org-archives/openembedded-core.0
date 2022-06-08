Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BD3C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 13:12:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.101])
 by mx.groups.io with SMTP id smtpd.web09.6268.1654693938864977903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 06:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk
 header.s=selector1 header.b=LLWFjKPZ;
 spf=pass (domain: prevas.dk, ip: 40.107.8.101,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bv+9Is5TdRPKpBj/J4AbW1hyZuBCJolZfktXV/EKvBTchYMSocBm4NJEGfsM83yksFLaqErChxHr0lUqEycwoZfWsdXS9jqRop5hzfzs47JnPxUzdEpDS6+0dBF6SaKpKmnJdwAhJMLRw0894ntibpIQELIuutylWWiN6nsOIkCDqfQsZDhSdIUttK+A8aaMzpOmDWOt1g4AglviMAl/f14hJEAhu/w06sYwFof9FMD9YGRbShF1EFekS0k32m16jwtgLGG2UvjzopvfkAPM8SrEktohbYAZEzGSSe2Ng+fxUoHORjirddx1Aq7U0ksRKmHz65LKdXFbYGLipZaHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7lnGMyUbD/fQLUr9b5kL3KKss1162hlvxzIp2Z8QqM=;
 b=JyipRcIcIQH9Ol3ouQXoGRNWGuE8q1LR1bLkJW8esEKg+BftxT/Npf3HH127dxGXICh0DcPlFXod/TWtC/gtLSVmP0tx7/JQZrTVn1N2k0xQbZyBWeT4qsJeqey52iU0xyH6JE67N+9/yTpPt/g+FUr0xFQ0JR8MUjUZHJfqDuYPaR3maWwoT45GjI9qI8w0JTP+fTTL5t5mDnfDM8qmETbIBLw2hZ1gRpAPruicnx7rO+yrpj16w8PsdlGtXhK2sPipCxQswnA2efnzQBKvrvivaXZfxgJrgXWrq7mz4Jtm16sUXsGCjCRHOqDvxyvZ9guuMreI+5dWnnOeH3Su7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7lnGMyUbD/fQLUr9b5kL3KKss1162hlvxzIp2Z8QqM=;
 b=LLWFjKPZsua984e7jDZVnOJpanmwcsVQoyi8S4DQuCVPY+a70PDMSWVCkzGv8VpKk3D8ZTOa6FBi1Pk8hrNeta5FzqJz2sdVHZOkcTGo+CjkpgJbqmu6Dg9T2NASh68X0aD+ROn63lyF6FMltMxJo+PbFoMoGd16+6mllNheXNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DB9PR10MB5618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Wed, 8 Jun
 2022 13:12:15 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 13:12:15 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] e2fsprogs: add alternatives handling of lsattr as well
Date: Wed,  8 Jun 2022 15:12:05 +0200
Message-ID: <20220608131205.2218528-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0063.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::27) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b9b77c5-e4ad-4874-6f1e-08da495081b6
X-MS-TrafficTypeDiagnostic: DB9PR10MB5618:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR10MB5618478EB77CE350DBCA085993A49@DB9PR10MB5618.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yOFt2ZQzTAPWpcM9fGJqWQUkoK3kgeizjh5NJlZoqF4UALx1eueYS1A7qxBG7VbeynVYd1VByua77BY9GOt1su9t/GCDXa3iX1LYU91H3A/rmFbv3AOQXhnyZ7F7KPMhSCSLR0/MxE31+N5QEO695I1DqcXwnq2E837vk4hBbeSxmORCWplBgct0W5ZaJQA3mGoy/0xTNrtgwfTNLmwG0JM34Alf6AqIfpWA5mARvxI2+McT5nA78Eub2SrZfaEabHCPK3qbrjnyC43CdPzm3Bmm+9Y/bOrdY7SW+Mbs1IomqeF1zceNmvLXwzaQhN6vRDHDrG8rRpdqELsTkpPFKr+qt0rEWT7QDdEQ+dm6VwGFlUf60u8XcYc/5U32AiCR/3V/TwxUZvse/qGSHmu7gbhUN1099ya/B1amtiFQFjko9dZT5swCJZcz/20gIOPOxewtgPGUiKb2gfTj12TIEEs/fb9ISHmh1jrisu2GdSehqHcOg72pHZWQpSaVDTpIkH4iVQDrJID+Q2pE/MC01rNRsFucpDPQFyTh5Xgzkrm3CXLyDPAV98yQJtwcXhuORZnkIi13oyNaDGARk2le+3un73B+p7U7rb5fvBaCuPQu7L3b6lLYlHel5uWyXEw+iBxGup2rasybcSvtA5Mn0WgK0DuaslV4H42dnfk8DUGvR7cyKIwxtS5yN/3Qf85ohDP3pgmggqIZl90i5PozAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6506007)(52116002)(107886003)(2616005)(26005)(6666004)(2906002)(54906003)(38100700002)(36756003)(38350700002)(316002)(66556008)(4326008)(66476007)(66946007)(8676002)(6916009)(6486002)(44832011)(186003)(6512007)(83380400001)(1076003)(8976002)(8936002)(5660300002)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eTYJjQKUQjCk6A9oO7yZecMmoX6rSNwe7LslK9X7GkYx68CyBxzbesycUhr/?=
 =?us-ascii?Q?/u0EvxsYeYFALzcQjk0Y5BWdcgDoT3QvjrbmCY2LA2H/KHYOid9bVn/i7W0i?=
 =?us-ascii?Q?yHIv9tgj5W88NO+KFxpsN1UeVdMG+GlU5rD/hf8kzDCtrp3duzL8MVX3+Djh?=
 =?us-ascii?Q?Ii/9czU1u6K3wUDDczIE4stxWQUXSlcAHJEuUAor40eRVC1O4tIIdDau7DIN?=
 =?us-ascii?Q?v9FtUe/m9IN9DHhZ+YcPTgy+L5W3OGbWUQnPqhVq013ZUwhGeUXxgGhHJlNz?=
 =?us-ascii?Q?bL9cEORwFu+u6CYk7Fj3KmjumIEP6oXZiEx2kGvrSpqfHXC6TKExlVodfEWL?=
 =?us-ascii?Q?l0WdyqAEXBmWU7tmXW79KPj0wD7ISfMwDqSotsLQmXGebfiFL046cGsyWUdj?=
 =?us-ascii?Q?pqwOSpxjptT8IdnUxdWy7VwXkUwByNvnG/ArJ6ASKXU45ezkofAAP1JzVjC3?=
 =?us-ascii?Q?UytkBBiq7zmnIxyTC+BvxNta4NQZwCJLjs5w0vQbO61IXMyMZ2DPUhTrRyxA?=
 =?us-ascii?Q?AdWoslu0uA4AB0oCFGy9HbfVv/soXhAcApnY0L4iKA05twcLL4bOZxsggC+T?=
 =?us-ascii?Q?/vNSQ+kTXeOKepI4Cr/fGZx8maw0iQ7Xu1DqdD07A5ILojIC/PgeLoCj/zCn?=
 =?us-ascii?Q?ZY/N0/nzhbnQsMfyzFaw/TlvyWCNuTgaLkCbcvhmZVBkablOWo6pdkacCDLF?=
 =?us-ascii?Q?/4IdHE6KrEZBgbPW84k3j2IFA5wTAyEH8zgBLxVv9B24h0B9XewWSRnMAvtP?=
 =?us-ascii?Q?yPQJpr7wYSqctNwcns8v630Ab+iQH2TkvSNh6pHvdEHqNhikFDIx/QY00e0/?=
 =?us-ascii?Q?lG0JSpD803fK8s0Oi9cKMT6PyiUig7zMww3ZaaY1gxd47h80X+3gzj4jRvPz?=
 =?us-ascii?Q?VLa/JEQYn8vth2WKN74Sux22IKVyKRpylsFEKbOS0dOXyYtTOrkdk7mM9RRz?=
 =?us-ascii?Q?9u9vfAPeZ7cceQHdSieDERzL4eUuZ27MX08cleZo7WwK8m0trn7we/allnV0?=
 =?us-ascii?Q?BcyE5T24YEW0dAMvkfDdYgq3Q7BWhTYFl7YYA8X8f2WOKKK4s1R0Gb08SlE7?=
 =?us-ascii?Q?a7tEaFBgM+4RswHJff+ZWyjrE2rWUjIQFCGRJCiUANnvw3Q89x8OsW9tvWJs?=
 =?us-ascii?Q?FgkdVAkOrr5kifHczGq9SBI/KhL89JX2yhZ4qVTAlN+XAXDmD7AJiYI+udB0?=
 =?us-ascii?Q?90lIoFBlHyJbRSUXp3TxnzuQ6gJtpHdde2vSQX+kCba8dCSaVfu89uWUCfbC?=
 =?us-ascii?Q?sOQnvtMxUaLU7kHpy0Z3gJAfCwTKGelDgunzbr5RZOGoFOOP69EGnsu7gf4N?=
 =?us-ascii?Q?OrIaSisgF97o/+GK38w5r4OYwEZodYkv7qUOcQTeC4bHYUsmeitkFVEQj+rR?=
 =?us-ascii?Q?drnhc8qi/gUPEowSwXMUOQ/hZi9d6TvOTa5gQyP6LK/1fwIVLWVANhe2t0uN?=
 =?us-ascii?Q?iVyYG6dzvCdA+RBQhwhMWITlx09RKIQiUYZti3BYMPVsH5rzryN2/U2MnnzV?=
 =?us-ascii?Q?FqYvFjGo3yd6DLI7QTI2OJp5NxkOrMqem5QAH6RUiOGt+od/AhyBbKs6biHU?=
 =?us-ascii?Q?XWv4IwwXYbDPN7jsZKrE/z368BioqOrjGgH1wB7cfbCLN8+OsFMCH+yu9M1m?=
 =?us-ascii?Q?GTB+CLYKNA5j2NN3p17zP5RInqrs6Y2l+jX6akAFJz88uVGG/mlW4cMAdGrv?=
 =?us-ascii?Q?opOW+A8dHUb17qIwC53HPhZKdKILCqTxADaY01AtqG/h7s5c7Q1Ao85lQDmb?=
 =?us-ascii?Q?d4J0KHqXnLmZUsiKuQxDqfmEQFDpm/4=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b9b77c5-e4ad-4874-6f1e-08da495081b6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 13:12:15.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FnyrCuPt3Euht7VDzG40KSKtr9CkrmDxBc+fbQM9kT6HBexBMPBZEys+f3SkqngxZYhXyRJXfXqetVSXt3jFHcWzuCk9iyCB6OvlzdHHgZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5618
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 13:12:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166707

Building busybox with CONFIG_LSATTR=3Dy and installing that in the same
filesystem as e2fsprogs breaks:

  ERROR: ... do_rootfs: Postinstall scriptlets of ['busybox'] have failed. =
If the intention is to defer them to first boot,
  then please place them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

Fix that by also alternatifying lsattr just as chattr already is.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/rec=
ipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index ec48f419c7a..5b2d1921f08 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -51,6 +51,7 @@ do_install () {
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
+	mv ${D}${bindir}/lsattr ${D}${base_bindir}/lsattr.e2fsprogs
=20
 	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
=20
@@ -99,10 +100,12 @@ FILES:libe2p =3D "${base_libdir}/libe2p.so.*"
 FILES:libext2fs =3D "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so=
.*"
 FILES:${PN}-dev +=3D "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}=
/*.so ${bindir}/compile_et ${bindir}/mk_cmds"
=20
-ALTERNATIVE:${PN} =3D "chattr"
+ALTERNATIVE:${PN} =3D "chattr lsattr"
 ALTERNATIVE_PRIORITY =3D "100"
 ALTERNATIVE_LINK_NAME[chattr] =3D "${base_bindir}/chattr"
 ALTERNATIVE_TARGET[chattr] =3D "${base_bindir}/chattr.e2fsprogs"
+ALTERNATIVE_LINK_NAME[lsattr] =3D "${base_bindir}/lsattr"
+ALTERNATIVE_TARGET[lsattr] =3D "${base_bindir}/lsattr.e2fsprogs"
=20
 ALTERNATIVE:${PN}-doc =3D "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] =3D "${mandir}/man8/fsck.8"
--=20
2.31.1


