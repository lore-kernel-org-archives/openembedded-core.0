Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367DC001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web11.4920.1689796143412175585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=EVUqjG0h;
 spf=pass (domain: welotec.com, ip: 40.107.22.87, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMrK3BNv/b18zgXsDI7+abKhTUtW/jnMqLirIJF2pjb/j/3iXZqO4T8Y6Mv2C1DDzP6XBHwEZ/lO93bz6r6WkdiGxWxiFVfiyeYXkRlWtXWCbKU6It/LWrRLzPc0Cb30N+FwL1C/f361Mfu8hnoptP1iLqxWEqKW8E8kkITBS+wR5lamSjyQQSGC2T+BPExqg0SGazBasDXxH3arVTvfF+wC99tyFZ//JvTKODeTIvXU7Mr+qeIRPvTORgJFazUfXghGhiPwnsd29GiJGIIj30ValV9ft0LtqzGhtf97wC6vuY2rZwGIicpZjBzbiNkW0x8QeUbUOlQ/t9m3E7B/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=KYvmEpcuyxOq2lRLUke0KbBlzMsJA1tdAD5iT2xcGdATEnv63SBDoWLYeyC15uWKX9OwS9226eNCKcxd0kKqDXzZz130FSzcOX53oHgjwZAtgwJU6tPocV2ut3srf88cCOFFu6yl5PcuQ/WYD96KNEGCbtcmtjsXO587AzfaTrl9voAa7EoIeGP/h02Xf0vaGxbfYKJJSLYYBWtKYH1G/KU7vdUC6G5z2dTFUPQs2gsHVxNuieCBfDCkXCwA5Mcp/eBACH7tg0ojsbjV8NCrB/rNtu5hqwcUUAaKxaE+MfPj4NKBKe8RMUexOXg9Q/XSLxFH/MZuZczNIBmfpuf+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=EVUqjG0hUk4VCtC7o9J0rw6Rag89bpWGjo5YL1VX9mYy+qfYrEfg5Jd6yAp3XZtMPUzoADbQZs6AwWH8SzM6v7SVxQ5TiiEaWbI+hJVeBfAGtA27+FbwzIUSW7ZUrRF908x3HRSEmfKf5u+nPgCwBlEhFWJRQd8tNvpYHfQV+oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 19:49:01 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 19:49:01 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v6 2/6] package_ipk.bbclass: add support for ACLs and xattr
Date: Wed, 19 Jul 2023 21:48:39 +0200
Message-ID: <20230719194843.330741-2-p.lobacz@welotec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 141fcc92-ae92-491a-4f48-08db88913308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pbG7znHdk39tp02ICyR0xYdknIUcHupJRgoD/6EK3DJ/Mc2nHDMDpe1Wp5olqWZi60BHTaI7pflxw2S6b0bgjA8TUQDUjmzn2xJ++0/HPu27rRKFlLe4L5VtF0JZCk2/oaC4FnumNRViYL5xfKZwhA9KdWwbXUhe027lkRBaax5GMDPERaBS34nl5BIsw2FS6sg7t2wpktvciwBCKWp0br1Yq0d5Ex7ENBnuWxA6tP64lST1ZCHMQwU1wsmjo1JpPWw4yEPm2wPmD2jQojVFxP0FgAjhjWEwgZTode0CU5x8WK6AG+9O5ojLsvFc6tzrX9JZxxubwF2ZdX7dx0TjselTpFvWMBQR1eWgRD9fgQsAVa4Yefw0/n1wFHQ+jZMx9puCHCWVxTUy322kjUlJ3bpuWO9ROxblhzLK4/vMfM9mov3XZs+RqXM0FnmBWZ4kmYF3QnFcuyat+kmx6HZgBMwzCD7C/VTY/QcrmgNyPHpkkUI0ULU/WQucUVTdHFShdpQhE/IsqAUUATJci2cIMv9iNJaC3J18+cpvJqyQ9amd8hrCRchNQeJdCIg/rxsefrCP2xV3ybn52DVdyZlnd4RDFQnyjsX0R/k7CY0AASc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(451199021)(66556008)(5660300002)(66946007)(66476007)(4326008)(6916009)(316002)(8676002)(8936002)(41300700001)(2906002)(6666004)(478600001)(966005)(6486002)(107886003)(52116002)(6506007)(1076003)(26005)(186003)(6512007)(83380400001)(66574015)(36756003)(38100700002)(86362001)(38350700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pvi8G0tlOaaK2V1PH0LiWCY2SutUPJUuiYLcoUf2qksm0GFShuAoVNdzImx7?=
 =?us-ascii?Q?UcLtf7wcPrPE4BHNkv69ceRS/5OE/wWdPTo6HHBT+VhxbtAFk47BZqWpyghV?=
 =?us-ascii?Q?Z0WyiPwwYsXhjn0Ts1+IFgM+xDeIea5Bsbpk6TTSjkM2rYkIMUnKyM7eDzfB?=
 =?us-ascii?Q?s+yzL13MRnVZooRSMFUIneUY3gMUYSKWGWy2dp7WOFoBSCY+ZCFNyyqr/uYo?=
 =?us-ascii?Q?jxgPpkswRL06Pxd8gXKwGHa9aU4g+eEZCrOvqQ/haqxQEjl2VIqy1Qd3OtHL?=
 =?us-ascii?Q?hnydNVs3+EoQSgJT5XWtJnpEowg4Svm3378Iab2vQqtPzC/Wo6ctgBxVvS8w?=
 =?us-ascii?Q?aoYe2g2134fSPr2bUdP582JSbJtcqLcsr5S047KxUwwxnDaRd0mP39MEcn1n?=
 =?us-ascii?Q?F1D/sGrYb4ZtRrOmwum2MIPdl6H4SuthvZSuLJ+AGZmd65l5uRoO7Yb35ksb?=
 =?us-ascii?Q?BwONz/Xt3TIWlNJrJXmjTrz89uLt3Drk6XsTq2DOymVQ4qFV2TbZLm96CXfk?=
 =?us-ascii?Q?9tqVpLH5GBKAl8MdUEItp7SMM3yu5Z+gYg6EOz0Tg8Ft/z6NvPv3nLkFffFQ?=
 =?us-ascii?Q?eiFZIVjVMf6AW7DGlPl/2pWe8ZeCqs6sa5f05xc5nnXblWbB5U2F4WISqhlN?=
 =?us-ascii?Q?2skhoYJiwREzVZcBCnzjvAKU8MSkv/BkDyrLxo5Iw/zZQ55pOgHClFgUhMb4?=
 =?us-ascii?Q?MJsf2gtf0BE9ejVSauFv98og8cv+7WkRm+TluMjlENeQpimzQzQV9A4n3KjE?=
 =?us-ascii?Q?c5EGaioWeZLl2P+bvoQgQfZC8+kcN3SO8q/n6xagRn+u7N+jYRH8pIzzYWJS?=
 =?us-ascii?Q?q4lKNgiZbs+wvssg/3D0pyXIRjOK7abIfWCldOCziQdtaUYApEt5ATDIAJwD?=
 =?us-ascii?Q?F2MMYzF4TukRP4sh3c+G1YgETprQ7iNkjrQ/6Twdc/WuSnKA4g7DqXuPd4EQ?=
 =?us-ascii?Q?ilynXVyPcw1Hc/1kEkkalUSCy1+MpOcLHSJ29IVB9RAt8/yJ6HIUNkiVwQeN?=
 =?us-ascii?Q?LACffC5zaqSYkMCCYoFWItLJUifIZsSBPFAZAubAANXrKLRWJDHLyvYcmtWz?=
 =?us-ascii?Q?YulNy23vQd3KyWbfPfYnyNsniUW3r24MZdwDWW4N44IXtU52LtNEMn82Y53F?=
 =?us-ascii?Q?74tZpowt/nWIoxjNv36svCMDoOPa5N9zRWIK/FbEVDEd0opnusZzH72SDtpz?=
 =?us-ascii?Q?/RxrHFyGJpUBALZWGUpgWNdqx3iFzTQo1/Sast/djAioaynZsXUiFRc0v6LR?=
 =?us-ascii?Q?2jEqVEtbfFog6m9HP/zUk9CxGyx0k7Glo011x3eTt0XEUEvu8qHs2qpGf8PC?=
 =?us-ascii?Q?DuCBrHAK6aA1Pr0+OrCBZtjQ5ut7tn8RrTxXfUO6WrbNIhCxEV1uVtmDfywg?=
 =?us-ascii?Q?ccyA/kL27bAr+b7uax5b7NzMqFDaN5WQW17y8Re2bD9xzbKz+5X/EiODpA6K?=
 =?us-ascii?Q?WllFBUKt7fQDWhskKnOAFJB8HmKB+RuJtiZ5+PMkdoMAdL6Qnp2jwN0GWtAA?=
 =?us-ascii?Q?VEOpiiZnCkTTsXdE+KyOCHVHLOkYTWtiq9Vgxxf4yTxoOhNCGFrnRO1Zc46k?=
 =?us-ascii?Q?kS7hmnVjHpiBwpUOWr2ROHvu8rSgxiQqraGgR+TX?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141fcc92-ae92-491a-4f48-08db88913308
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:49:01.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMnTgrwU4OYuta2E2uFfm5eqBGzEiCJCcUQXD87ZOzXIxJtHArK6FHr4MRynGfu5H8NMSVXItJbBhCjRpy3XwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184595

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
index b4b7bc9ac2..5e151be3cd 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.cont=
ains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO=
_FEATURES', 'xattr', '-X', '', d)}"'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


