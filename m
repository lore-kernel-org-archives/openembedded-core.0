Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDC3C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:48:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.6087.1633679334680079990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=gDPVbMio;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFGl8inuwqTUYn2Lw95Gh/6z0zQcUfINt3elMug4nUUlXFPS8kYw7ODRJa5QpJsY9Xsnhsdsd4rZTrs6aFzaaombaxCmrLOzsGdXZ8ajrFwwbHtrhbAIvT+qrV4/RuUdOjBpy833/8vQKhTV+BaV9zqpVar05ld+sPj4Sfj11ywKseDJGh9lJOD1NK2bLMGFCIP/sDC1HF/lPbY7EY4Zdis8adjRK2KWr6U7SGlYE3DkdcT34Aiki+aL8V0w4JZ12sI3IOzQ1AviD0HESMghye2pdGl36rDYFALBXSFx2wtoJs4Dh7kYr1h5Cd6PYsaxdxMVYT6hscowq1iqp1wP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/58Wl3Wz/JTTdLy0/SdVXBJfzcvEKMOBgMhC2dGNk0=;
 b=hNi9z87rSeKJzHb580tld+ucto0AJ22hbjxS7s2X3C2P3pPbmt/pGy6TENm7UfXc15VeNRpe8s1SbM6EMqk3RlcSOM64oR5PTXlXq9E2h4ogTYlk2MzS0n/4l4TcxCZRJ3xR0Ql5mz/nOk++3RG0VOS+1iCbWkXb05MvnXnVqemRETsS1DCzuiFZiNiUUMOw/T/fC+TsPQTJyTmWtbKIBe3wrkNMEXBF2IzHfLJGq0pugHCXJAMiLf83s+oYR5gjV2lSGdB9YhOtgFl3m2rkEF8GKxn0nXFiFRVn2P36WsRYRQbyyJIzOZVxEeWdv6jKWEQnA4GkZ5X8oLCbrUyEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/58Wl3Wz/JTTdLy0/SdVXBJfzcvEKMOBgMhC2dGNk0=;
 b=gDPVbMioWzzdCCiSJdHFcbv01L1+9XjQlICqkYouhqm3DjJ+MvZOm7WY5Mc+JKHTczcZR70UaWAbJ2acLekJ+tVGlUdOo1aXB7v+fsye+lBx0vxeWiEgWs3Fir1fR1BxFT3YO0HCgY1+6m86awr7eD1h0Ck1BUnNg5mF6Q1fcjA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 01/12] npm: Add support for EXTRA_OENPM arguments
Date: Fri,  8 Oct 2021 09:48:24 +0200
Message-ID: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
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
 Transport; Fri, 8 Oct 2021 07:48:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f3ba171-6097-449f-d9ac-08d98a301289
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB612792415CE10F054D364942D7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jAIke4mFK9bd6dp7GKFB+iv517o67hSc8q5WzzoHK42p5MVZpz7Ret9eiLWCa9F7QHw0wyJPMl+Kyf3YT5FzdNdInKNrqwHY31ugRq+cUl18L7SvntNJ+d/94yW6ZybYBfooR/QR7L6O4dAXtdtZfYW39i7MPF6frZkZHoRB+OgbJw2X1aW+8ZqXTBbFA5mTxjIQRSBPc3nYZP8v2TCAhx1Qtl9+5A/Apo8UOjbwBpSEdv+RvyHstKHCkE3zpjg0TUCjhZjppF5Orc/wixapp/eQS/ympz6D15FcRimtSTkqRUnrjk6j/bmXI7lh1MUgsGufSO0U7mS28slgUVzJgc+zRdIh5awaTMbxF+p/iQH3mz4uImwE2tjnISGJpNWZ7hT+f5/c1qIJ4nsmoYnTiUT7x7b2VN9lwTgZmgf1aDBDEOSTUzzQVBxpRE3g7BR/abUsal5FecJdQTjPkdVn/PlUvWJMlv78Sn+khsRBWAPu08Diacj5ol31iHIZE0VR39s1xCsTYDNoWDdm+7EdewHJPBQtLAp88rVcBe2KPvhLDbnlM43E4RIxHB4/LXNO1QPsiDp4EV6X02e/UzUzvAMnhwJEyEks8SLJPFtZmNOUQamlNop7KSne4WyQS+u7x4XD9IjaG+TZLWIhR1Pys2XrdVvTrFeaLIYkddGvn7bykMrjS9VbW8d29/ZzQr6Xb3O9B754Ayi7iYRH92NVEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(83380400001)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EfSKaT/y46RxUsaja8i9qfPqsFvr+7SU5Sg3ZpV0lkc0v3tsOzwiOrZbfNKn?=
 =?us-ascii?Q?sOTNh12ffM9h+UKcqGDVf9+KGBcW6EEpSwpUCBzQLyT44VVwaoMq0I5NOAPb?=
 =?us-ascii?Q?MBflyvBIE89KDunvpPZh86B+sD1V8ALhCF6qnP4++o/V+othAoiL9wJHXvN5?=
 =?us-ascii?Q?ou/qwGN8eCUBC2mFhIsqLbQskz/li5h4bhCHI7OwRfyu9p3GaDWZvtrnUQsQ?=
 =?us-ascii?Q?ipUs4TJbbNtwqedKHyQs5B5sAZZJyscsyi1GN/zTjOrgChlpPh68e4MYAQy0?=
 =?us-ascii?Q?bQCQAc+btx1qfxDWgMRAh3iaXfMbxbR94UklA/B+gZzbvqEj3ga4kTCIknZ3?=
 =?us-ascii?Q?zyBff8Txorp4RR5i5zKLbPbBF+HnNnZwS4OHUM9+ng4QktGvIYAwYWEaBcmQ?=
 =?us-ascii?Q?SMiMXpMxyERISqc4DaEZBbe5dBBHCZnOUSZycE0j6rxghdS6bgXqEXEGKZhh?=
 =?us-ascii?Q?n60JNqrw/0R6U6hp7kXOr6ZXEWkDLyng2DJkQJ0R7uYOq8K7HUee9ix24xvA?=
 =?us-ascii?Q?o6Lbj9nkVGB8pirdXwhOohfuGQOGVyDYzZ5UKeKYxbJ7RuexUMYr762f1Hdi?=
 =?us-ascii?Q?2AAI/tV20mWRfKNzOLUJTtaqDsyNYaKOczX+PTx5Elyf9CZa/3c3ndr8lBR4?=
 =?us-ascii?Q?tga6erC4My2YRl78tAbyx18cWv4YsgoDphxs2VYC5cTRyaaZBXMhkq6EFFRo?=
 =?us-ascii?Q?8S2/bDUngRAjXhV4dPnQVwjWpGRt1qCseBe7Zwue4b9cNeL4qwZpbxyiqLKO?=
 =?us-ascii?Q?WAoYXPsRSU4z+L+YsSpcq6N6bYNS0rCNsrWy+P8puV+iMI1ImcRrfzRhXTC2?=
 =?us-ascii?Q?fOJTtFfFAHLd3ZMCv12x4PWnTvywr348vPyKft2jNF1W776NS7AK/dQaNbdt?=
 =?us-ascii?Q?rOZI4e9+LDr2y6XrIVx2O1tIUcyEorBFXKZO2OZgnEACSgfbD30XsaPVoD2M?=
 =?us-ascii?Q?t2YwunxA4e0TyZ0x+pc+BbFW7wpJM1LJrWJyye+Z3xjQUND6bB8E0DdDYO3k?=
 =?us-ascii?Q?QqEAxaFYB48+UAISz9n/Tre+1VB9rJr+voHHGC6NtOEtv1s+ZyJr8xVh1iYC?=
 =?us-ascii?Q?0go0RNV9i1b/tiRJEX3aa9NQK0J2XyO3xAv4Fi+Cfz6+ZDJ0Ps15zG4ZhbqT?=
 =?us-ascii?Q?aRAfY3jTrd8SYpzFzt5dwE2PDFYhiEHYe+Hft2BRcw8P8JPEvG9ugg1HZHP+?=
 =?us-ascii?Q?h6wjwce3PZo0zRSoMPiZ8XBB7MszC1IzkKD/dD+uEoVOzckHbqdMjK5Wo2s7?=
 =?us-ascii?Q?sOirt51LOtGO46Wbg7neMiYq2SMNvuvAWJRUyyt8dxkKmdcL8OnGKzPNS+KN?=
 =?us-ascii?Q?0a206Hj8FZfg/o776rwP7tHf?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f3ba171-6097-449f-d9ac-08d98a301289
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:52.4848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MowJis6UGO5zHd7N9wtsdl44uhRgRzIzAPhij76gIoOClogBEmHBarFtH1IWDSbZ+5GLUg33VoTVQr92xQEp1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:48:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156758

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for EXTRA_OENPM arguments to set node-gyp variables for
example. This allows use of shared librariess, avoid download
of external sources or build from source.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/classes/npm.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 91a2321116..477b40d921 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -22,6 +22,8 @@ inherit python3native
 DEPENDS:prepend =3D "nodejs-native "
 RDEPENDS:${PN}:append:class-target =3D " nodejs"
=20
+EXTRA_OENPM =3D ""
+
 NPM_INSTALL_DEV ?=3D "0"
=20
 def npm_target_arch_map(target_arch):
@@ -260,7 +262,8 @@ python npm_do_compile() {
=20
         # Pack and install the main package
         tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
-        env.run("npm install %s" % shlex.quote(tarball), args=3Dargs, conf=
igs=3Dconfigs)
+        cmd =3D "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXT=
RA_OENPM"))
+        env.run(cmd, args=3Dargs, configs=3Dconfigs)
 }
=20
 npm_do_install() {
--=20
2.20.1


