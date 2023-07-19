Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CA5C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.4875.1689796146017961249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=2LYVvjFY;
 spf=pass (domain: welotec.com, ip: 40.107.22.84, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApgizQrO4V0uI6bLwyLZtmYlox4MgacmsOz4IS13lIbsCcSLE8wGzgB6PbwTDYV99tvLWZ9AyDeqX9ECu8vln3ukkS3W3jPgT2Rcx+JSrAuWXfM247uwOuNFQqitgxvpPEnmRq7a5phnCvNCAuyy0qvPbGHB9RmdbcdR+gow3mpciaaeFyWT2exRXPYzs5v6QqshBeJIzmGHobEA1b1wySAZbcsqV/2DtM7fpKlfa/Z0e1bgqdLxAkU3MTY3G98/taqmN3fSpDspjIvUK5CE351la3CNGy3QrqOLwQqxLSKT8GCSnmldJL7pgQY/6kY79l9w1g0KZrkUfzEyS+scIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=WkGwWO1qbk0qSZWGleW2V9JCrYPBxJ03//cE8xggDZ6OPHjATfQ/Pq4W5QokqMDTkYJE0f2lRwUhbw3+qs10JRipoPOfmQANKF/MacLQtAvnABrilQS1DkiWnJysaHeYDSYTTNOBy2jWSqP1H9g7vJyvC6Zba1OzgzfJVtGcL1D4xxvnCHReC0wZRbA2n82TGCIkCssgpk1zKMOkjYXj6A/VdTSZ807XNEA64Cogz5KL6XxwPKOd8TS2beIGZ6kGRxE41vy+zdlSYpY7H+N9Gxv3AOtQ2VP4vhGL9wQzANgOY9QsYZ/mRYdEnb+wiFvW0QeG8bPqrHucfq+XKnskaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=2LYVvjFYLEb+dpbZb7E6tIa3uNQiWVecROmvz2E1WD0AZ93CrxqjtKq3HVm7lNc9zZcvjX4K2JjHIWE1oF/g7KxDBT78LV6d8kSLL2G5CNm+rUHn2hPDGqw2Cr5OC8s0TanOXZpDsr6k0f9itUT6o0VMvh84BAtv0GigpKWc+xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 19:49:04 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 19:49:03 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v6 3/6] package.bbclass: add support for ACLs and xattr
Date: Wed, 19 Jul 2023 21:48:40 +0200
Message-ID: <20230719194843.330741-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719194843.330741-1-p.lobacz@welotec.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 15060075-3922-407c-bea2-08db889134a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A9aUz5ypjGlbnIs7D/Bs6kxzFA+7iDoSHdGmmu7xnswGe3OovpVXxB8gzzITtxPIGh4b9600mFJt8spd58bmsfV/4NSlS8NFrqLoj8u+Xyls39PzZuGiMRI78hEXkcylw9B92teUn6hZ0tRr2um2+HWbQYPPildL21p3eVUzU7SOTCUATO4kkEEVfyHXIVefSV8uONLwrFWHyjsebZiDKCxH84vEPxo+AE5qY3hcF/7jmQQjaXIHTXcz3cqJjz075Vg0at6AkOk7HoMLbfOmpTj6/tGJBggyhDpcumO4g1YXOVbJhqprMWyiZWS3X3Xd3mizDtHO6b7wv3ADL2j265u+UFAvLUY0Bxy0aIxtdvIUn1N71QAAtZk+JCr7HD6d+YgS78T9PyvdvVWqRHv9GLbpXZpK92cVFZ0MvKjZmGla5vwEzAf6IPXWPHXMLjJCP0dQzJMO9qFPl2UHHUBUkDBSkhSu7nUOJlxFQPF9hsXP+yjGjmpdhXQXeIR2syTsJnPLV2gBZidY+juZU9+d+avSARqIW95VwfLvp+cPZ9abQ+9onKUxRJDsirex2SSBAoI5bqU+2RgsPSfH7gsu3zCyoGVCwqpRDAeU4xrcYKoxuxHjjOb88IBbvTepLA//
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(451199021)(66556008)(5660300002)(66946007)(66476007)(4326008)(6916009)(316002)(8676002)(8936002)(41300700001)(2906002)(6666004)(478600001)(6486002)(107886003)(52116002)(6506007)(1076003)(26005)(186003)(6512007)(83380400001)(66574015)(36756003)(38100700002)(86362001)(38350700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ePJ5ImduKT7yO8mKV/0pddGV/rAQinCoplSY7eAqdfOLR+OIg4grPW/M3aEd?=
 =?us-ascii?Q?ajMQ2oovgsqXSQTzBt8Sftr91TOJUV0jAj8plbMr/NlYGcSv7nCdwjMfHuye?=
 =?us-ascii?Q?vPkHJNU98TRvGcqufc90Hk2ZJOYyHp5HxBRzQ4N2MTXmJFRtqUJBkJgeoN/Q?=
 =?us-ascii?Q?JGvsdYlcXS6kZUwRIxvYIV/0nz6oAJE418CEf+rQRBb9rSNgXCjGOOjI7ZpK?=
 =?us-ascii?Q?a3hN6sdxJ+DS4QXIB8AE2sn9nqK6uJ6KnDMliHQ2Tw6/deF4ce2dtn/sTDhp?=
 =?us-ascii?Q?uMHthsiopQFNy17tKv2XMeYqXvigfPtO6AzbXxnXkkLcZfh1jdYIZflNcfRF?=
 =?us-ascii?Q?Y7iFnhMWaXRJnUwghk75l7DmunDBRy7+ZsNHAyIoclezIIfioFexWDc0dAVm?=
 =?us-ascii?Q?EbGKuFxy6/tUGbd1WvES1fy8JMT4jXL8yqwL8TzQntyFbc50dPehmU/8Cne9?=
 =?us-ascii?Q?/qo3GinoU/82X9ZxyJhMb3xhGlHC8XPHt6JJpNLoOJnPRopD/sTQEh03aRms?=
 =?us-ascii?Q?E2alnw3LjZFgU9B5c8HMuKCnx+fHfCgWcr5NSgEtC3feht85YgETWKq/okGY?=
 =?us-ascii?Q?MZ3RTJvlvEPXJ4jaEpmxakRgyIWrmYdsONirHipFaoVnkQFvKDV5UelnY/3i?=
 =?us-ascii?Q?fZRs7OTuUY6D6JxcJUa4hjI5JIs/1rqZg5J4UBTmNtWGxOkGyzj9zGWIXNw/?=
 =?us-ascii?Q?ImOUCYjzg1PvwmyCPMd/FxN+1dqU2+7wPQLcvmblyZC7afd1Zzfs+/IkSmoy?=
 =?us-ascii?Q?rjU5qlY0H6TH+fOvm39s2x7a5ZoAWD36/8cy0fdYsmLqJBnq3VJVQanE4ooO?=
 =?us-ascii?Q?01ABpROy/075jTLqp7zMYYloMciL377oL0ouUTVp/5HNdLkgAfEjJJfsHCNu?=
 =?us-ascii?Q?prnXr9AL2xe1THbvadF2VCN6cxXZKeQ+U9sk5yi+ptDzkNNND7+8tdGHR2hq?=
 =?us-ascii?Q?OtPKz5Ya7AsPvF+3V9YOT+OmR38nq902TTHOaXtjbIahZ9aKWxEd5MYXtOSp?=
 =?us-ascii?Q?qft2OUB03L8ROnZYXSqW1h98rXioVTJALJcCBQvNMxgytdLF+5cvDkEKUwTk?=
 =?us-ascii?Q?RsGhyVx9G/MW1QzvsutjgqBJZOhhx35rYC2v2tt6Hh5Q4yWoojTG6k2pbUNB?=
 =?us-ascii?Q?2Gn2boxcAlkWQUnrWSoG9diSJjRW91SSIZ9tEYUARxvqPEIGjE650ts+hWXO?=
 =?us-ascii?Q?HW1/e4vl8crcBor34VilyLDJuFvybLxAT0msRaARMy26G3AOLyAj4W9fbAsP?=
 =?us-ascii?Q?i83/6YsoGtXS3y1qFikb7BfiuQUDrW4eIbIp22UYhWDuOkuwpW2PVR9IuzAM?=
 =?us-ascii?Q?9Pt7R4W8iDN5ssV1KYPVq1ynhIQOPbF6DGEQhe2NTnVbtglEaryHR5BUKTNB?=
 =?us-ascii?Q?Yx/aC4ZBJrz68ZVTMMyHOfnsfwjYGFc/z4oOWJi7wBmzuorJP4YxQzuysQoJ?=
 =?us-ascii?Q?7DYt2PnnaQD0rvL5fTMTsqjGMM72YqLZ8iC/K4j1i94GNYqBbFObpQNzdEmU?=
 =?us-ascii?Q?elN4TCPny4UAj0yhQJcHYwE0g0bTXX5T9yIH5dnv0OOF01vpjM+gDf0A6omk?=
 =?us-ascii?Q?T0s9HM77HyNSYMnuR1iDt42f4nYBf2hrN9K5D0PD?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15060075-3922-407c-bea2-08db889134a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:49:03.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1IKChiesnJRueoRa8RP+NrdMUL3VcnI0ND0D0dF7q4wwFP0LevISlN1EspJC+YViizJ/YAUorgKYy7ZeSvXZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184596

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
index e8055a9cdc..6e5d0dd4dc 100644
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
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


