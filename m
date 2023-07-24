Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C71DC001DE
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:47:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.5608.1690231619658110944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=bSHYJKPG;
 spf=pass (domain: welotec.com, ip: 40.107.21.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsY58ED4Kimx457T4rVffCHUnmcgHfkyMht+oRu8e7Ae8aSfsZVTENwE//cywKvsZz+dnpiM2ohQb3usfl6noydqx9yT9WDvy5JsrHzDNB2nnsBpcjF/eA3GEnQ5HvcQfhfv7OMWF6nZD8oXz8Skab+YIoPZDpXkesmcZ7dMWcScBPCUc/qgOItsjLxlSbTLkvL0LzvYDY4CunYqxnYowgzcy04ZPG+ri+x7O9LSfOB5OyPxUwssGutjAkX9O+Bm/Z+ZAnu/cOUqkdfjonlCAgtAKAPksFz+k/fHz1buRDSO28+VRGyU+8ZPbLU/BieY9hQAnia9wAkwh/2815maQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=IXtCCHa0kE8Oknbz7P8qnyTUILGG//zLjfnIKlPznK87744xYCMT0kIg455qwylST/mEeBO/xWNGaf7F5bwz/c2fiztWn54a5KRbY4mJWp9+7VzNSho/1pok4NX3Waz+OHPWWGsU5Q6jJlDneXN5OsGiw0UkjcguqeA2To78pX+QcU+hCvjdqui6DamILvxJHyz3/5FxfkYnCYxsoo7HG7AbLxZFED6NzO7o8lhtbyjbLSgyRLsmu1vXh8lQby9+KRxnBt0sK514rJU4QQij/CFewTwP3+6NCovHREsTvIxXKP6SMJ7fUKfZWDzv1M8B+lx1vTMQnkwMXbm+WGE5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=bSHYJKPG7Vg6f73a17oH1VhbXUH4XCJNz2o2mTJlq03+HkTegFeC3yDAkQQkquG3QxZh5PzamD/cgRsh1RHpM3PYLTnhXLQJAkAF88E2kWeM6lN/XstCy5loU3giKww7VprPS5LG4/dq2x7g2bAxsn2KdKhsSQS0oq54S3ycxlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:46:56 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:46:56 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Mon, 24 Jul 2023 22:46:35 +0200
Message-ID: <20230724204639.353571-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c5e0b8-6ef5-4d94-ec24-08db8c871e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s0XyjWk2A19MX6sAa6uoKygkRcmvSq5wk9q89rFFOnh+euilj64DV16c3M8zt1plNXdgcMOgN4QIpay6E2AioyZRd9LdIUZmjqdqNbIxyZ0HMsCgw7MaB09pVwWwjUjvL6oTlD0EHmS9fn8G6nHh4pDb/FGcUFEU0KNhNhonO2HIVrAg4DjR3NO1VIh5qhgz80O1hlGKNKEipSY4jDfnq5nP6hARz2sojRrybiCQkKtVaiSVpIzk9nUm2K1dK9zvcGdSU6V8YTSGVr9pgS+5n2C0DL7uBUNWo2BUkgWBJUOfV+S32ZcVkzR9CGnIq8zhLq6dXPc9uuZVAZVeCQkE9mr0NcjeuE1P76vSDhcZrUoftZoEhUSdbR9qFzZyT6Bpdn+P9FTUmu/2vx15ruQPXFRstZyrfc4ItitcoQSKi/jm0PpqswB+TxCKhmL5okXt9tXAhT83KqoVxBYiosDYUvQFgCaVPsbefhCZZcl/xYJWDXrpua7GXbLz+4FaDH/PSj0aye9uEYrjytuO9W6VycKrGbtR+3ldERYFBXHWu+F5Lcnmz9J8Q0IWJyL51xhHuGXUeXYh3uJw+6gDQJIHsOYvySdbQb2n0bu3qS9LSEc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(451199021)(186003)(26005)(1076003)(6506007)(5660300002)(36756003)(8676002)(8936002)(2906002)(2616005)(66574015)(86362001)(107886003)(38350700002)(38100700002)(52116002)(83380400001)(6486002)(966005)(6512007)(6666004)(316002)(66556008)(6916009)(4326008)(66946007)(66476007)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GVHWygg5/XpQ5Qp+cVwoYSjvfDMzzuadqg7wd/fm6U7KbryckSc6bDTrU+NZ?=
 =?us-ascii?Q?vqdR3aldmSi8/62DGZ0rfkmmqbBUayc7qBlsH1SEHsY0ZvbDttwGL4wgpu86?=
 =?us-ascii?Q?4TgR1rR5O1yC4y4LSL/+MXWe2g0DuFmTWF2p3XNgoU8TZRGvC28RsgnCTtr4?=
 =?us-ascii?Q?twOAA4KvTySqxvLEWffJxQErDB+hY1hT8QvdO7oFvcruz+dZWczzSHps7+Sa?=
 =?us-ascii?Q?YF5ziI/5lAqeZXhE4oGNpZ3iw0VBEYWIxKvOYdG4JxQMotuPoi63PYfQWbI9?=
 =?us-ascii?Q?kpDGoisovJKwQHoo6V7XdOPMxogGm2ZFptrC7xGBL0SKsL874VrQLmQ5C5dY?=
 =?us-ascii?Q?+5lBp8mN8feP++9VQyWTZUPoGBIIHH0KpxoHbIwNELRtVN2DLGorDNFw72Da?=
 =?us-ascii?Q?oq78Mn2a48vRHLQcPHTOsBu19EzKJYcK1PbBYRGMx8OqGQYS4lyOHLMgssMh?=
 =?us-ascii?Q?ejYS9bgCSv86J6NedUcJaE8IbilhhhL9Rg9cYz9LdWZaWzih9ktxlRsZ59jU?=
 =?us-ascii?Q?YM4VWSJ7U+QqRniCY78E6cJD2pwh0U/D3iYOP0NrQdp90hgEIyPpPi2vx7kZ?=
 =?us-ascii?Q?L82WOMFoDPvq6ADGopLqvqnVVa2QM3F63geuYKy0Rjmbo/Vfxr6lLSCymYhT?=
 =?us-ascii?Q?fEAWTJdH2rw8uLEWXxSl/PpQnJUwqAYWkxvgXDMjnvZ/QUIYpkmPBpzdpsB7?=
 =?us-ascii?Q?YhsgNJVzgqkBM0UZF2nqfO8jROplG4TR8qOF5hNbPr2L4rZVxRFyMCoHl936?=
 =?us-ascii?Q?kiJdhVYHLKg6M6v/bIGqDixO+32h3RhbAwqonpqxY0XQdraKym0o8gO1op5J?=
 =?us-ascii?Q?NDKZOMqXuToWXpa78BbmQATN7nJtECXG5IoblMvtIn7hUkru9pD62G3TOuvt?=
 =?us-ascii?Q?w8PhGgyx/NCtsOdZc3Wte7fE9iQ+LPMxyv4Qw34gkDkOzhufLyX+0RVWQXXy?=
 =?us-ascii?Q?EPCs7c1IA/TeZSaeJRRZQNvlgK+clw6J/1Er/B4gYUkBk17AdyLrnmZiUGQU?=
 =?us-ascii?Q?S6Sk7RqIwHprtuw13bFsGNoDtx3rOEO22UU63F9uhL2vkse6iKzgqb21n01d?=
 =?us-ascii?Q?1aO/9qwTTsu9oxMaBH15dJcBP8WlMb0mZbQxWPrWwXmTkp7y6ochJQaiu99D?=
 =?us-ascii?Q?klqQfEQGsxMM8CRhnPPkx61aVvqUvGWAHjFJq+ieBNq1nx1vz0H6jLyn9DfR?=
 =?us-ascii?Q?OZDcLNqT6MjC6f7PJu55ItsKdcmeaeM19N2Mt5pYgsE20ccc5mrLR2oTIUWF?=
 =?us-ascii?Q?FySwTzDAQLt7pAiL2Gf9k+Io06O33rL+N8/b14W9sCcLKEn194/iSzB7w8p+?=
 =?us-ascii?Q?X1KRLMWr//Yy/Y9aZqKt7S8avhJknTIXJa6MTD2HhIXO4iTMs3evJs4OkhEw?=
 =?us-ascii?Q?3MssdPYUsHxWwYFAAS6uacFJO8bGUhTLF8TIB/9IoIXOBb3+SiXqw8K2SUdf?=
 =?us-ascii?Q?cGQSXdbIEjebW9IcLMAWGbkt8xwxXAmSNLNnnraBq7JiDnyIkP/+X0JWS0fv?=
 =?us-ascii?Q?jrFUcOZr24HbzCImpsUeXMCUlWKcazOwGQ+4H7yHAvHocurPilLGu3fJlpep?=
 =?us-ascii?Q?0NNTNODu+09/b7y9fHvSMBG3d3WfXlx8p1DVlVKt?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c5e0b8-6ef5-4d94-ec24-08db8c871e7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:46:56.4428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyhG6tSJHVtyjGK4gpjhRGJRny+1WQKtJkOfNq17io7hecJdN8gnNehFTU3E/lOG5yk54JYial8cj+sRiP6UsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184813

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


