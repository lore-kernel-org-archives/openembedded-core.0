Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAF6C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 10:42:20 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.40])
 by mx.groups.io with SMTP id smtpd.web11.8690.1668768134112524536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 02:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=dxRbuv+m;
 spf=pass (domain: witekio.com, ip: 40.107.103.40, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHHxGVoRpRY5RGlZGjHidZU29+oHB5kP44I4afdBBHYaLmk32aQT+S470msdLga/ZJ4pFaBM9HJYvhO12Ngt95D4jPt/uoPtti8sTF3zxF3ig/61Q+7d5MptGqqcNheI2ISJtsbLzyDpc/AtB1tWUZ8vuG1cv20Sd9d9EnDCepw+biO9XMgPvDGti3JKt4jeOWso/+94u5J0UgGFZMIAAHhoovN41w9pfwFpi5vvLdR18K/IONzFGBbcn9m6hZf3sPjVO7jCSDBn++hMIT/yJmpmltQqT9pDSqDhSXopBxO28T4+s43YD6ThBUoSmUCk150W1Jo7F46tY9dXSrNAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYJoAlsGD2JjPB0mqu1s6WcD1cHmGVxekqveFaamwZc=;
 b=M3urveJF3PxHMOPr5ksQDZkf+sgRogO/+g0+YMC2s6xTPfCC1pAev2qoarvgQNDy7wrtRNXifRe/0NPYEqMK0pwodgyQjhsbFARNs0RWe5b8MABwvNVYvO/JLhCgT4tqrRU8Q4eHFiLQst/iEJyQnYUA1aJCXd4HGZn248tjai8FIoDMdrroa3V9Iq+vO59QDmAZOylCm+WlpPlCHMq6QEF7aqTq90v6WkUEtrMz1chyMgit/R0DaAoL2jc/kayh/CyMNsNf1GqvskJczfQ4oAWX84TSaVGqUl9eDganeBFwY/eUukDPPGq0Uu9UD/HGt7r84Fpq+OwAkwu6ixPTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYJoAlsGD2JjPB0mqu1s6WcD1cHmGVxekqveFaamwZc=;
 b=dxRbuv+mS5XVu+cua7KqlNB7tKQcxAms9kKi5fI1mEurOXvRm7yvv2f14PwMouiq20fxnnTO92Z30GAv4Mq/3aRZKnErJIZ1drCKrsDyK49jpN16d7JzmTjMiuCWoZf8uvhVC5JUbQ7xF6F1QSMFYZWPIimtTpDHhxTl8Qsqf7L1V6zmj6Fh+sQv9vDkFa1Ahpyi/OKLXOwTHA+hy7uvhxfzEJY+7+X9AYP9O9UOIcWucGDH/lFH9Qy6uh2U4DkiEeM9awBsBCpQAuLQbdZ4MNoWCuYOau89EAQG/9zCFucBQcFIptD8cLy8VmnR86WMs5sBDTiTo1N1mLELsFw6Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by PAVP192MB2062.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:32e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 10:42:09 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::68d0:6364:64e3:f204]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::68d0:6364:64e3:f204%9]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 10:42:09 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [OE-core][dunfell][PATCH] vim: upgrade 9.0.0614 -> 9.0.0820
Date: Fri, 18 Nov 2022 11:40:57 +0100
Message-ID: <20221118104057.1067-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::17) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|PAVP192MB2062:EE_
X-MS-Office365-Filtering-Correlation-Id: e1519c99-f8df-45cc-f540-08dac9518b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UFVRFtkRz4kVGRcDmHlwU1x5MZ/FgFsLpMfcksDeHppTj4RvoI5lc1Cg2yIp0q0jdgqYCG+rLb8ZEjqWaOWgY2Ui2U+hwgigBLMGqGnrcVykFvFIaVKfqRl8AAC8hw/9eWO9ldbCFaed20Nbac3MTgNj9CvfumLpqxHHIvWJ22SBYjf78VT7VeLZl5Ck0CrqDIgiP31J13Lm4M6Hv4cTFQDpkUWG1x1j4F84+ahnXkNdyfy3wCqZYu1oUKKw0cUw8l0L0b15RYb0ADhAnmbaXsSu2FzqGvK9jf5UxBX8GYdi3BUU/NJcm9tOYyn83wukd0eqYL94Y95GlelwwCiKmCMbpXCAC09Ndu/yZD0ENOnFTmJdYgmh4xeGWt0kms7G17ztmvlQug1QiDOPbLP4CiIA5V3cXql2/5dnnKrRh84SSg088qN7vJi78b3Wrs9mEeQ/sp2KAER7viMYadlQTElh8j2vKS6Lm0rZWT+vyCPCkf194Jwe6/GmZ6pmSpIiREGcuIOhYIe8rR4jF7rxV5md7au4Fb1AOtI0wAF/qn7G43Q7zKOqg14YA28QtIcG5qHzvrGvSWOY+ma4/Qiua0GxRssCTLDsTJtVchTxrj7DAo5RGfRh04pHXteaF3CJS578BR5htyoI8T/UAGL6r2zN5pgZ8LOyHlENttCmPNy6V4Eo8E6b+lZWBx9PiMNv6OAu4dIobfTMeqU5+9D7o3LPro3HQRBnLz7OjRifFzw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(346002)(136003)(376002)(366004)(451199015)(5660300002)(2906002)(38350700002)(8936002)(52116002)(66946007)(8676002)(66556008)(66476007)(41300700001)(6512007)(36756003)(4326008)(6506007)(9686003)(38100700002)(6666004)(186003)(26005)(1076003)(2616005)(107886003)(83380400001)(54906003)(6916009)(478600001)(966005)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wzsmZ/tDk89wcXxgn6dm47tx+SdWeBhILCZwiSP7ILIGU0M/+USzShxIMNUr?=
 =?us-ascii?Q?rpEDhyRk61WuS/9xBM47NvGsyYTMDjZ4PoYJq+Qxu8LzVufiwLWjRsvHzodU?=
 =?us-ascii?Q?H/+IZ//cRnS8JP2/EtB4lPbSc8HAFj1ezGIQ50/qX8jZvUKa6kHCSnr2qqli?=
 =?us-ascii?Q?Yz9oSYeTa62XP10lUESXG2wgt4/NmlMU1sgZrDu2m6sTGkC3eBRCIRtIj6CI?=
 =?us-ascii?Q?9XYcjhUzRMX8RZNAdzi97GVJATxKqfrGnx46OeAXP4qMTIXolvJBIjiCukRD?=
 =?us-ascii?Q?SvaBvJta9UlRYPe0UwrytG51HvMtAoGd+8FRcK1tKUMT296Y0LC0v6hyMMru?=
 =?us-ascii?Q?4fiitEfx1trxaYTiY3GJWWSoZtTTuPYDXppegbfXe0YR9qf9fUjdxraSn6Kb?=
 =?us-ascii?Q?9rRgL0bQbDa7jkUhHgsC2rhLYeV6CX5Dxd4bSSQ1uN7WR2rHY/WquxaQJlgO?=
 =?us-ascii?Q?pjeh0x2UbXVarV3IDbImyY7DfBMEdw6czSzyMthlRGW9XOV3KjEkFb7eLNPN?=
 =?us-ascii?Q?AjfNbcwZaBk3QbT4TUtAL2f+IPhG3aRQustyyJt88aPxV7A/efu1M2Ma+Lsh?=
 =?us-ascii?Q?KgFehBU1ARD9szJU5Gl9pLQskibrrEWBPxstxqZjurkMeiywB1ymfkBsWaNo?=
 =?us-ascii?Q?OkVFprmgluWxqd3WWuVDdoLk9hGUD7Us3Toqep5H4dFExmYwjuTelCs5Zfum?=
 =?us-ascii?Q?/AedNmfSMYUYZ5CyQdVdKcpmy0lVoWNb3MBS3KtlzTEsuvreD55ka8dYbOyv?=
 =?us-ascii?Q?WQNGzWXPFj338an0gyDpbVHUgRZquwNxDDw9nFfxtr6IhqvjQngrcohjso7I?=
 =?us-ascii?Q?1FzZ2duJH66IuenUzSeDYJ+0MYOivIB0lGr83694wsVwo7LhW6E6AI2hArGO?=
 =?us-ascii?Q?rgMPHsRSV4ya4nbVDFFH52/OucTE3KQY72mE9Kfmd2gXdTqwF7auCeRf8tdS?=
 =?us-ascii?Q?5sBKDBuSajAo/NW4IeDuhfdwcUibmNESUIiv4EMpMSVbpqfZc1SB/CX5+T65?=
 =?us-ascii?Q?YX/ySGf4qN1zbJG9QVIi6OWegfEw2FxqNHS9gP/d6jjo7noqadI1ZFvxEhgI?=
 =?us-ascii?Q?Zo5HjNubRB5FwIHAB7MDJ/AyTgdPd6mifRwbVSaFuob4vczT14Y6cX8K447U?=
 =?us-ascii?Q?fgTcLy6aj3SPw7wT96lSGPpl7VZqhliO2ytYDfiiHiLh/y/oAnQh4jR4gUKg?=
 =?us-ascii?Q?8aTZf/ruzVVd4CRbggg2GmRPTTZWAgTB3DemqfqyP5lT5VtUm3uxknyB4l48?=
 =?us-ascii?Q?9E7YNccD/D/UusaoVHm9fLK6qvGDexsjQR9A7RqfIJtwiUKqD27D7cfH31t+?=
 =?us-ascii?Q?Vk7FuZBctiuBD1PwLH9Dbqn91YfEuBUKRDg7/prh8Z29jCrzWqXitOysrGNW?=
 =?us-ascii?Q?aotePsqPyVfFPOvtOG8p9/khfDf6tVrv1AI5wOPuQrn0W9VNK9Xd0hnzLIY3?=
 =?us-ascii?Q?pOW8Byle6oByRbHvmqjLcHflAdPdLpw2LYrtM6vHLjFdj87v2wDv0tOOLF5D?=
 =?us-ascii?Q?8EoO4OcbhWPdYxpXxHvVQ2ml9alMcyz8TUFKjKDu0RN5rNwGZk7ceC4YRYcJ?=
 =?us-ascii?Q?KoqJkEo1FyPT8CnbL/L5LK8eMNKwjuLG5uH7qdlzilU3zGzMc2fMGnLGgkYP?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1519c99-f8df-45cc-f540-08dac9518b0f
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:42:09.0677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZi+1mLty+zN3W9zttkYZMMBWLGN6+Gthr+GUZaECBcuY+aSFqW7ss+N3EMDZcQSpv1vopnNKMfSnL0nd0g1xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP192MB2062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 10:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173452

From: Tim Orling <ticotimo@gmail.com>

Includes fixes for CVE-2022-3705
https://nvd.nist.gov/vuln/detail/CVE-2022-3705

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6d917bd0f8810b5ed8d403ad25d59cda2fc9574)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index e9fd7a3eec..262c97bf0f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster=
;protocol=3Dhttps \
            file://no-path-adjust.patch \
            "
=20
-PV .=3D ".0614"
-SRCREV =3D "ef976323e770315b5fca544efb6b2faa25674d15"
+PV .=3D ".0820"
+SRCREV =3D "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
=20
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--=20
2.25.1


