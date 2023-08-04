Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97F1C04A94
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=pIFxKFxh;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUhC2GM1rarZtwEDuZMp9MNtTxRYU1wSDTxbbVAIWbos6GL9oDVcT9zaiQIjdXFdSI+Z/xmEsU6NOoTSe5zkTK/jGwL5UXXwzFpz9QGCFx+ZtcC0Pq1Mi0HVzyffvleW9lTq4dp0f21EfwGiKEpcocvqnH2Q5JzpIG/AAQ+tnarLb3DHLlAXI5nL8lybN4gzJ2RsxYKwTHIAh3vlyGt3fbSYdE5vp7WBK9c0nAW+qjQP5/T8FdvKVb7ZW+ZE/NoMGR7MJS9p8O05bZ8LOIgLLKDVDNhu8aBtdSFLWUcbJHxi+sThrrnDH8tMYVQPxqHZYxwr5DtTwtPyNgPFu4fFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TF+qEwmh50REhyZ/JRvQy/lPDHLg5sfGXTakJMfjslI=;
 b=Oqg41oVxzJ4OZB7vdIxHYCnOg1BimotjSN0HwOl1X3mE/6YZoXVZz/9z28G7ItCMDcQP7/F3f8L0VuCvNWPSdeosfRJg9ITnKTiHbitq4w/Y4p+TL1DN/FA6VU1IsVnVtMtih/XU1cT4JdA2b8ndsXIFUES1S/xX3DkcWdaaCi9a70iVtcQQ0dT/uLUic8jLaMDRJg5gc6sFWFXb9iYfyFvz9n1nlXnNinW5vB0To8nt+OW7rA8Uzm/WTy6xDbmNidsysvKaF7fHCZip5yNBcl6LHdNKiuiHUciBxYLRgZ7uc2DMiqlEG5GhH1q4/UGPionR+AhBtiiwB1YwzOLnig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TF+qEwmh50REhyZ/JRvQy/lPDHLg5sfGXTakJMfjslI=;
 b=pIFxKFxhSAdH2HoCCztOOXQIoQwMuQIMqRwyzKRsKcgJ5dAZ1riwfpL52XGTBT9Sq29ot8BDKyST3awBLDT/UJ9MEGNCulCOb39MxCqVCc1Vo7iEqF4J5/0mmnbLG92YZo1qirmtd/v2nBqkdJTiq6R1iv23iU+WZA0yEjLaHB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 08:45:09 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:45:09 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v12 3/7] package.bbclass: add support for ACLs and xattr
Date: Fri,  4 Aug 2023 10:43:11 +0200
Message-ID: <20230804084315.55768-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f57535-e7ed-4ae0-092d-08db94c71bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dUjkvYTNFpbSkZTE+1Ux04fEtWUdQQB7UrlU2aKpYnOS39TQPrQUGT1t7BmKNvGzdmzMKbu8ubNjLZdXlborRipH0ip51vMRAEYath4qaIT8LW2hts+zKiKr69gvAx86ykEVGtT86rxG5zQz21OOcPVsPUXkXCubZ1O/TK/KNheTu6gMFAks4odVXTT0IwTDhIGb+Fkq1o8W4P1ZyzWNHVGMruajbenwLdMu4425bOcDV5aN8h2Ek7muKJbe6mWjiDTHZgHGxu5JfAj7Ch9BoE1R4YudtbQimQMdRjDcdsRpGWhy+huew0tcgOxlYkz2ZFeUqy3D+sDqNHC5uw0N+AOKyMK7Jy24l8kpok4acKBmj4noVUfq1A0p0kq8wE5IrSpMcz2L2LR4jkNDqDKriuvRdo6D1FBHfBOALwlnaYYVz2qXCh52rQeC1zG/lm871a0BExCwvJdOGdIVvPPAJCLOdFoZ1Ea6eYvU5wcJfTlAV1XUndvXNtJUpohTDuhSMKHmqGEBdC6RTZJiGQd8XEkexGAFUNVYY98DYSIhJv405jXxmI03+5lkyTl8ib9Pjz9Dt66RpF7ciisunIU9e2oNhKA+EopF/wxWK3VgXDX1fLY4sp6safWSn1aPA/kA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(6486002)(6666004)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LIVRlCY4+zzQdb6a/AHxXk9lyrA9qUmgARQ6a421v2pf9TkNUFYfOzmfYZeA?=
 =?us-ascii?Q?eIvotLDWJcRJ+HuEx9ZV8533f5nGfp8bw9pj+j44tbGQ9IPv/LW3ssLAxzjD?=
 =?us-ascii?Q?bhO17bSfo/AGY7RrpvCgR5Aawy8se8eTZH63bUo5jFfjEOCHzZOwXk5A2IqE?=
 =?us-ascii?Q?S8MhwsyHdArSdZlcKK0k1Nr+GbN1WJyb18Ky5NHgHHn3Oh3cNMpm4W/gGySB?=
 =?us-ascii?Q?lKGzGPnDAM1InQTHbEu9DGozzJMqoBu3HB8Yp+ofo8NohyiYkax2jqGXVlH4?=
 =?us-ascii?Q?x0zi64AT3DzO+yc2omULw7Q4eTsqiuvP7Y5zmFqYeKVtC+gVMCZxo+DC3OYx?=
 =?us-ascii?Q?sTLuR0oN5kzUborKQCi1lfbi1ZA2oBJia9F4pgg9txaZUlgVmSHT/jIHD1Uk?=
 =?us-ascii?Q?k6igVuCZrc6kkpoGnyOEHucJvuwRFrDE8GYWiezQa7apheAuO3YfcKzp2d35?=
 =?us-ascii?Q?+EtE0P9Uh/KIhMYTadBS5zfbp8yuAkZxlSMt/XNdxnerORyU6HKDA9xIM5BO?=
 =?us-ascii?Q?24VG+AoxS3vYQJH8+lofq+NYqw06GmEU5x+zjmkVcl4HFVtopIYyElPlC6yd?=
 =?us-ascii?Q?yU3PpKhGlcFoxsk03l8x8v1l5mze1DOZ/X76lWsxTr/5EYASWklvsn1gAbe6?=
 =?us-ascii?Q?JZTGPwALCZa0zwHx8RLmyhxPf3qAvRcX+7lQoxQphbrei69sy25wZoXqgIPe?=
 =?us-ascii?Q?sPC3RDNihb65qO4Cr/eh0QbI035gd0Bee3svwCkBJHJ5UkGjtEmZv3MxhzeK?=
 =?us-ascii?Q?AA9d5Bn5Hi4jTuAVFO2IFQtSUmyrZRtq2IvzUkzFKZ9z1/6iScyBET+GDyIS?=
 =?us-ascii?Q?qPfI/on2DCEt0x2BE3PV/vT9GHmel9zQREq7wT8TMuHd3aB2Uj823EN3cOZG?=
 =?us-ascii?Q?3MuZwW5u1x1RnD4/FZkljwLcuGTolEDwunOuRlr3xeG1YifLiQzWfbGwj3Ad?=
 =?us-ascii?Q?HUtctOe5cM75aNFkHgJXyZmy9j0GlbgggADYFzsGYQZvzVGFIzqjhUNTISc9?=
 =?us-ascii?Q?puDEGvH60o1Cf2PoL5iqQII2yQqTUOHahontY1DLGK/dSpT7oYAME8VJ23xF?=
 =?us-ascii?Q?tGOZJtxRM8vkF64rR2BTMOQHsuSy8VzFAFH3rIl9Wfr4EHpxrwkbCkktzk8D?=
 =?us-ascii?Q?5p1/L03JSu9fIMqH7/LArx8YqMehNxEDmEZWi5jzA55R9Pmm2ZsLOqqWTxXs?=
 =?us-ascii?Q?+43NaiLDa1GZ/mmr+Oh8QfQnYdGG188j9xy9VSmx+loH6jHTgy8RRAzuEjng?=
 =?us-ascii?Q?ovN531Wswh/Q0XDW+nKUtAEP/UFBE5JccaRch7JOJPa0lxZh90+Ni5AYrHmL?=
 =?us-ascii?Q?ucQY108mYEjUBEcFuPKAxMzJbXpia+MQKMbf0NKJbAuHPy6Gsb+NTThZg3Pa?=
 =?us-ascii?Q?45+sSssCXmxFUrvjlN+lHtsxviXhcJYTjExcwWPs/Xl9GN7HO2Xx/R19gtqa?=
 =?us-ascii?Q?309LdOL6XuSsswZmnldfbywPcyF99iTh9gMnJJEYWQjEr5AJZr5LTnHjWXS0?=
 =?us-ascii?Q?mpF4scDUtGfmkRIIRAYpZXhig7oXwh1aOU4SJ6cWYxF0N6t2AcLSlgdQvytE?=
 =?us-ascii?Q?9VmfQfiwfsqG06rKWWrUN6H92+6oNHev1trouH0u?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f57535-e7ed-4ae0-092d-08db94c71bd3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:09.0690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtUR3cGIiC2QRJLTQkbSuXRsgNEPlx2PWEG/DAN3YRTybIOBk7x8+z7ccwV1r7eD7lMQQ8PAHtYi3AfG+tR19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185513

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
index e8055a9cdc..6b65641aea 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,13 @@ python perform_packagecopy () {
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
2.34.1


