Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210C3C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:53 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.84])
 by mx.groups.io with SMTP id smtpd.web12.9504.1633601630854998573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Mk+lAEhx;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.84,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdlxHAXiIfR0SHeO0XYVpUGXVmx3xy4H0VoA1eFxuXFcAVlUDr2BMTo3rT8TKAjXvl24tTdhpC09XJ/Kcax19B7oDzrBqrwRx7QgUAlwy9lJvR4hnaGKyBmdG81Sc0oxobvS4clvGd7BOVoWtiDvSPAE0qTb8XbZoUZJ33PORzAPyX/TwaMef+s6cKe7pnvVxUwRqSD4qgK2Sfx7v1jgCrLoZsWxiCrYYGBY1OMTCZlGiMSVhdq8d9fnKsezBUVdTDRJKn/F5qJBY0al8XCzD9JqLRr14GKRxHwGzRW9oi/Ck9VXv+qy8BWr1KGMQw99me+XWLZ2pS8vOoIQ0EbZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FADGStV4W1U+sB8FZDfi+F+iGwonqTdt1/E56H29ZSw=;
 b=nUj+thmdrPOEu2EXK4APedO+2ZSdEuUI+alCEYD9Bpr3ZeinH9viBgwFL9vtS3SlzAJe5psmfSmO6f+1tTHlVnz6Ht1Yp9zoAhKhsJmQp/iltT9z+nKwJVt7uJfZ/lO3PomlbMBi4FL04XPd7AmpZFcAm317IeLZU8e+lX3/UfL7rJyKpWduo42+Kn9IkfTKEu9JGygla3f+7crVkwMEq+TnUjlmA8ZZGZaD47y03PXY4bJp5TafThyIKnclQi69dsPRu6vunCLaZhzoQ/UaNz1aMLPOjHA75UDb5LMOh/RUfzBybScGiMhnHUYVuEIUH/VUngHJ63D9ODk8zh6kMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FADGStV4W1U+sB8FZDfi+F+iGwonqTdt1/E56H29ZSw=;
 b=Mk+lAEhxcSig7mcdx4CSvraUhka9xEETtaP3vMBiYwk1KDiavQeeOg470xKOWkVNOXFUQ2saAkXfC3J1EC8gMmV9aOxSqRjnRlosmzDmNZZrXg+920zrtQkkx7jYjWuAiCTkKy5Ak1sqfBWfQe5+cv5EE7EcNOdmikGuZkOLw5Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6367.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:47 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:47 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 01/12] npm: Add support for EXTRA_OENPM arguments
Date: Thu,  7 Oct 2021 12:13:15 +0200
Message-ID: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
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
 Transport; Thu, 7 Oct 2021 10:13:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c15a56c-8143-4790-129f-08d9897b26da
X-MS-TrafficTypeDiagnostic: PAXPR08MB6367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB63673139D59115145696FB63D7B19@PAXPR08MB6367.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	skEqkNY+yw1WHw4qC+HW0Bdlch7ysIC1IiCN0QvYTMrUu9vTYtZbbm1d9f8C1xzyoH8h3cKi1fKEN6cXZ1VzUGlEVla9KtYEnkU2d4aEFW2WoSJx/CcD4H8esaWHwWqP0wsg/qh8bzTGPLXT5H3bmxCvXqohZz17Krl+UpFnjX6z+uRwSJhbAK4yJ/926/VwBXyz7ML6uCFxdpB6iAeTD8masTmGwD4EBK5+zKGb2fRdhV1av9QFzfMP++v6PzGt471sqsJ3KuantJCZsaN+vAnBgk9qSxyaWI/MkIUCel1HesEQ8aFQy31CBMaCkaFEw2USSNYfPAkQnBT7/dj9HmnLq8w366woitNWgW6Up7yjPbw8Y90H2tfMMsQQQI01xY62GygE/2WtGCYJ0eRf9XdHFIle83PoyzaVexEOu987X3/hz7Ctt8/0X1BkKiF4y8ipGWqnNHoh8t43EuT4FPgseLPjFJuiB3gey/mgzerqe2ak8Jq87wETaSdwgoH0wE97i5gnuS2SFBwLgOgT1ANOcmGkNwRjJA4HJymryvjnXiTSpw1jzvLTA67qvRGMsRs6qtV4TL0hFW5VUGhO0kNFDAUCUH4EnSsH4S3icjQJv6+0I0vuqMlZO1BNokcior/3A2d3cFvnEnO4HTbF87dMd0kwwLFbtjIxR6vTJR4Jh8U1I+l5SEEy9+XBVKwPZ8ikPT8PYb3bI4hqsug42Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(186003)(508600001)(6666004)(316002)(1076003)(66476007)(107886003)(5660300002)(86362001)(6486002)(6916009)(52116002)(36756003)(8676002)(66946007)(8936002)(66556008)(2616005)(956004)(83380400001)(26005)(4326008)(38350700002)(38100700002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ssy/+5T6OFliZaBHTJWeZwTH0SAkq2xEYMw5gpRTnyTjyWDjtminC6BYuEGD?=
 =?us-ascii?Q?B4UOPh4Rvw4QpqJN1Mie4wVB48l6VrxfHvUFR+dHORrjab1R/Q6v9BIUw0jU?=
 =?us-ascii?Q?+cxfCRxGEYRGggu+kWyW9pi4vSU5hmdQhjcKvPPQDhmRB76OexkIKUl0qMsY?=
 =?us-ascii?Q?jBsjt5wXh1gxBiRVBYKrmppjjVSX7hUobUw7LqcnSMsd4Jo4uXYYcduyCuzR?=
 =?us-ascii?Q?IJu3bsSYynhO9wFUDOy1+fHjhxx5Ue/G3iLSXtBwhd/wV1FKYjWc1z8drmw+?=
 =?us-ascii?Q?KYNnf29EdzNdfCme3vmur7+UoWWTNcBr0lwJVDN/Mowic9QSDMKYcmdC13Uz?=
 =?us-ascii?Q?5eAsk0F9VL87AlEsShH5VYTPvfE/olsePhLkld7g5iHItHVTmnkXvKs7hVKP?=
 =?us-ascii?Q?Mfa3JXdNAIVTIKk6j99+d78gSc3ZA47q3Q4F5cfPuMHsGNNGm9zWboe8nHdm?=
 =?us-ascii?Q?jJro2CdEbIK7EGphse1OUtIh9ya8lwWsdjI9pRl6d0XmkkFjv580EP5JRyiq?=
 =?us-ascii?Q?OOSHskP0EYV+BbA5iRFxJGUFrGUAfgBSxA8p4VS1EscD6FrJqDq6fZlA+TMr?=
 =?us-ascii?Q?/FQpmyTos+yaTucQ7BOEekUEkqqfEaAQzDUzfD1Xiz9IaqafFiPmPA5oeRXJ?=
 =?us-ascii?Q?nU92FuLQyoieE3OrMR7Pe9Ar5sP01FzV9Db7Qp4GQoXHJkA3NqbeQCBsAGdx?=
 =?us-ascii?Q?xbiDjsVp9hflbvydZzBZBU0akXiZ4fYua1cDsef06BcAPUrt7q1DPkE/JYrM?=
 =?us-ascii?Q?DhalbABpr3e9UQ64Ba+lJRvy5lF0ZcIrnVFTCZgTDhTc9X0D0RK+vzTlIoLq?=
 =?us-ascii?Q?auxZLhMznhXgNSGejNy3AE2068lVVIsX+ZoxYhL/4ZQeoKR2GtIhDY1kTMOI?=
 =?us-ascii?Q?eoYH4/h/k7kkm154N9lRK+r4v+BpflVeCRSIsMbRbBwuOynXdN10tLOUIXBg?=
 =?us-ascii?Q?gtZ5jjGurUS8xNomnalKh3/+7d1lvr5PYL8L/J2uv4m2KVPDRGddBRMUGtT0?=
 =?us-ascii?Q?7dO5cIKFV2cTHB7v6zoikOUTVqqiVXe1CDk9qvzMx/z1w3Nbe+Lk+doKKs7i?=
 =?us-ascii?Q?XjMV89MeGS3abvkw0TGLDfSuxfq35cqryn8N1DnfqNLoNDdPxeC7lLKvgMQR?=
 =?us-ascii?Q?qIzAzQHfE/5mFeaT8QYKxJtWR5MB6bJr54ddihv/LTyn+5fiKwuR3rghnPTK?=
 =?us-ascii?Q?Ityc5ssF56fwN2RjmHHa74YoVGVN1XDth2I/eLEcL8bTuMT39loGtOb9RnFo?=
 =?us-ascii?Q?/vZjiMynTaz7ubseUosCn+YIcEkbpHz290VoSFsUMxiuP7m6yR+YLsbKEa+N?=
 =?us-ascii?Q?2d6Z1PODsrcBhQ5irIRPAlyo?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c15a56c-8143-4790-129f-08d9897b26da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:47.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PHD0xCRamM8fcOQ57JZ8pb6TZapBr5llkj1aLHbc5tlXvGKCkWnWfCg+V3f2n4iMtBl/e/L1rUa2tshzw6nNDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156709

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for EXTRA_OENPM arguments to set node-gyp variables for
example. This allows use of shared librariess, avoid download
of external sources or build from source.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

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


