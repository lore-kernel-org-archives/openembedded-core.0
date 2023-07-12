Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA6FEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:26:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.5969.1689164770219531763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=y/FhxEzG;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH/CWlvPiW6PgdvhrNwJBtT7EiyLcOciVSHwqNnzzJCBO6b+sO/GCRKieYREJXdSnEm7wzGQxqrVxygVCgWvEqpILXfrAjo4HRDT4KMHNl0BTrOE+2VpRMXDbbQANMmHji14IxHfRg93zze3yqZIa3XKO3mE5GJdKda+Yxvkq5nWrKrMvsIoz2jpkcwnpqga96evz6D5iQue2Kq72ZLkZ9mr0f0T477foPvBaiFdvFAci5DqhLuVF7GRN77aUISrbWW/GEQDuubHrb1z+S94I+J06GYyXjgn7sEs1UUu//OyVFtVePdmaUH286UGRn/FZF2u46XRRLCwhpQ3avx/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhSbpNtIu01gzcXqIIgE+KAoxaSghkHVnOFAdrtyjwI=;
 b=jlMKQQdSA4d61on7hgm1q0mwdtt7smQsbV6mSMNGoxQcnKMvtZuzqAEPavff1Y1+fgc169YZ705JhVj+RWVr1vq0n7MWlEQ/HwrbbhgR7UzuXlccsl00Py3jKwz7LJG5d3EjPiCo+BdV1aIy1IxfNUJWdrl8Q6+perRn7SnlB3J2xE63XHjoc0N1TDb2Odf/3y6UCBXQrFtp7TKgWaRZteZKs+pGzk1gb1UC/aI+st6XWYa1tPUGAKlgI2qRD/oAfwAEIn+SFkJ8t/rW7y/oqQmqMolVNcuxJTRXJII/BOm701Zv30PL/cpSYZFv7Wnt8E+0y1HfCjdHDG2+gxt1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhSbpNtIu01gzcXqIIgE+KAoxaSghkHVnOFAdrtyjwI=;
 b=y/FhxEzGt8VTC7nMp2nthNxn9eSyiYgKUBWHAPvhmBl1rYnQIvjnaAhjlIW95i4Z8I3TsyGkp4/zaE/z3ZDtmLsa+99KKnSuQxua7iOHJSFkThiwycuwrGGo82jydtIJ5ksp/njT+T6SyuNgbU6U0yGkBO4MXh7i+vRdugd6t3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:26:06 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:26:06 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro native features support
Date: Wed, 12 Jul 2023 14:25:54 +0200
Message-ID: <20230712122558.711029-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: f2826461-4c69-46e6-1944-08db82d32a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kE6uDEpRpy/zBenKmZKOct0yOuJ83rpXdJDcAic/O0EtHV4SGkK8k+adItFrjZqV/plihl/F8eSb0NZdA3vzFVtVdTlNrupyrqDQblK1JE/u0VzVGhJF3sCmn3FN1gx/Bor0NpfpYhlZMo74t7+XysdHeEA6/bvJ78yF7AMHI/2iSMG3QKmNT08Inj91PcKDrlkxkzAtVxIRL+ohLAFfRpsunQfAucBhDcSx3Z8tGDutm9FyO7gGxTA+ZNlJbEh355f36sIAU1tXJU+pIq927RRWp6K6tyq+fWBoYovT6hzlvIlpwDFJtH75pw1V5df8lTn5FXfLoNvG63YQtqwmSRMyPqBpkIFuA0LJBMFJvN5FmiV3gDGU9V1OoLYrzWCQyR0XXH9LlOttDHTvqIL5XO3+PhcMdBxuBAAqESLfECpitVvI5mLzfKlLzkG2x1xvYI5gK61V6lCIrmnWAdr1hr6da3woFTf97QbsMCO53meyV48C02tbrnC/h0vGT66rMznmplYC7BJ/omGovPPepOQP4Djx/HMGiDWtWPgb1bk1r5S9zngEFVkQir3ZJNrLiiBqgFKj1DfiUrjHUNvOCQSZ5pKIOCvmnGqneBylcjEntQcloNLt4yyYZSHiD9kw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(451199021)(6666004)(6486002)(478600001)(52116002)(83380400001)(86362001)(6512007)(107886003)(4326008)(66946007)(66556008)(66476007)(6506007)(26005)(1076003)(186003)(38350700002)(38100700002)(6916009)(2616005)(5660300002)(316002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z6sJMZxo/rZfnEZRE3+H0rRFEyVKSGoJ7VImPrmFX1dZyUt1C84WyRjayCSR?=
 =?us-ascii?Q?rRgFdebMizU205foiYKf77ZYQbaL5OyqxfkbR8FVFRDj05F/nSsYkOUY24Dy?=
 =?us-ascii?Q?ejtq76I7KOt5dsmIWD+EmgDWWkBe4r8/3c6i8etfpWgG/D24mbz2j+Ll5EJm?=
 =?us-ascii?Q?iV7vMDEavkgGzZlxs8K05WQAzj0B141JfLan0fVYUtWXsdHRVSznmC/kHapE?=
 =?us-ascii?Q?LSUCTaNo6RG8EGSqfNuzERXM4EZ7CiniNGtuZUuIL/UrXecZEHYdhhLK9C4N?=
 =?us-ascii?Q?ObA0XK9HM4SjIelVTGvgyapgYRR6hDeUztEuXHz2SoWP4fnhaoBggPzVG+lz?=
 =?us-ascii?Q?R6YEbpzBOQL4rXu0e3sXwdnlAIEBAjqo+6xn7K7sPNwRCQT7f4UxMyYM+hE9?=
 =?us-ascii?Q?sVHKB/3d/I2eaZmExxeck/diL5rMeboiJ5j806DPPLyc9uODVk34Pcg2EcPX?=
 =?us-ascii?Q?eFeFAqqLtj83lHp8eve51kQ7U2l51fLd9XhHHIE7bauNSfk4XJ6JVmcr0H5r?=
 =?us-ascii?Q?SZ95C5SK/0pDonIoNR0nedsmdzzvurjY8HPRrFjPZ0jskqZ2uuspzp6dGY5d?=
 =?us-ascii?Q?2jHg6JsYLgcqgNzUrXKv1OXgfaQXZMxW4CioQLo+AUS/uBdS8dYHa+ZQMtvP?=
 =?us-ascii?Q?LePE04YBR5+k7Ir5r2FFP12SYXkRea0rf623RRuxlADSPXOkMX5mX4QmwgnR?=
 =?us-ascii?Q?3GmYDHzuVnQN+miBxq6QxUraXaM0GLQqMx3ewzksvepaGebSlcpot2LNU6M2?=
 =?us-ascii?Q?VeXxCqDaB7cXqQ6EvNOsEzwdcHu67FLEZWkKmY4DL9ygEG9Upm760V9vIg2k?=
 =?us-ascii?Q?V7vgF1YmMFesIw4sEwlrBenvbmCdGtHD9IZ7zMAevlIsQYtvu7EYJaO8roFJ?=
 =?us-ascii?Q?aKhdpQnL+6J7SWRyywRGWDZdoO9lp1vxalxcKvtbcX+1B7VCN/ThY9iMxVYM?=
 =?us-ascii?Q?V/GIFGTU6e3C4hWc8bm7axusZyvSlOxdaLeRczJGuTTX7dvT+m01hWQHrRTW?=
 =?us-ascii?Q?WNkfLf+DeIXPFrhC9jiNeAi3f1JK9gUPKjQng1MPUsiFVAMa41CfoTwFdwmn?=
 =?us-ascii?Q?4TFtDAjy8DX7iirieYXTbcimKPeOQmzAaia+nhakSt6UqvtUvagoWjLMga4+?=
 =?us-ascii?Q?8IucsDsPZzu1Qt2c0Riu7zKgVxMspetQH+aQ7zuJDFxztpzRpWWX44bXSG1R?=
 =?us-ascii?Q?N1B68PkPLnxApOp5MmxZtFbdSn+iwor+2BJmwU8+7ZR2Yg4/e8Gl/Gi2E2vZ?=
 =?us-ascii?Q?MebvIZ0K3Qx4HW+9q7QBLr269izFYpoKhWAHA8q1Wga16zpQ6wdmXRZI9HW3?=
 =?us-ascii?Q?HAnTTI/EPwMmkjaEBzfwjrPJzCE+NvC4E+aya6GFfE3vw/SwVS6JLZrnAoIg?=
 =?us-ascii?Q?AvP+0AYvl+So5Nol3qJYH0OJTWggD3Pm0r9iCBwFGWp+JJ83rEqbSCu4/U1b?=
 =?us-ascii?Q?CtI+Ht1GBbdxNZofefSJmJRluO+XtYyrcX9zrSB2ekniXbEIS77hZ8yVTUYY?=
 =?us-ascii?Q?Ezsu5+kPrBsrKcAjkQds36HqR8EqIBppBShhf8Y13AggSyQ26i8dh/gKgmqf?=
 =?us-ascii?Q?c47BIraGdvttZBrTnyBF6fBWqzw2TegmC9ZzddRZ?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2826461-4c69-46e6-1944-08db82d32a59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:26:06.5401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hunp8W3yeGBdytA6XjxtJD5Pz3zR5l320Yabgyf3O+aOk7OaoKLyhkJ1pnCAIuBGww4Tbb1YrGHR1niomYLYqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184189

Include support for ACLs and extended file attributes for native
builds, depending on which distro target features has been turned
on.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..20684a5126 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -904,12 +904,12 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
=20
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6"
 DISTRO_FEATURES_NATIVESDK ?=3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl wa=
yland"
+DISTRO_FEATURES_FILTER_NATIVE ?=3D "acl api-documentation debuginfod openg=
l wayland xattr"
 DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod opengl=
 wayland"
=20
 DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-da=
ta ldconfig"
--=20
2.34.1


