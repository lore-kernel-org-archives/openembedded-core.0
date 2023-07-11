Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A866EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:29:18 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web10.1378.1689118147839251392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=0rUMOWbm;
 spf=pass (domain: welotec.com, ip: 40.107.6.85, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmXFRd+e3hRjL6KOmTiO4lyAx0KVawyvCds4F6g7l2zfEN/YUQCsPq4h1jC1sWrft0GnYbauHJyY6BariEas1sGi3m4Fu7TBJxFNfHJU5KpEL4+mqkXEAtAbONkVlaV67xp6k5gngvArmeMPp7yxX49fgYprBgqdz3D19pAidL5MxOtWjByVrNloPK3pCZ6/t3+0d3nIW2BPRGuL3KaKxyRCfKKfRUiZP5uVPPsmzccJM8wiq69wVdIr0Y7Oa9mtONtFs6DpB+ClEiG1TgqADdD97rLdYbKBj6ZHDM38kWmgK80AcI3eNx2V11sUYHmIF0hnGXp0PS8pDiJpuNEVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=b4kKGPzIYjYq2RoLXa1l1GjngVVteN4761eXRwZBfPyBN+iazXxJylPuqXi1ktpvNtGKoh6UXX1cvf/7hnWhzdhm7xSkBA+jaahwpJfr8rW8sEzijO+y5YmLhglispbFSVX8e0wtaN9zF8Mk5RL4wcf/+6Y6o1HuX3AJ5WrBekJFO1/RBAnH2mmfl5owDReyXmtRsRQ3KkPDSlVsmEnyQwpl33iS8f1l7gQky6rl6utwz4YvqOALLf+G+QYnmCt0GuF2M3JMkWLAJQyXb7chyhtGuDL+bMlU8O8+1jtw1A/8mLPyg2dnoCWsi59pPdFzZz00wFRbern3eqFKkTRqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=0rUMOWbmgy9Eq9shk1Xa2i7wzqt02+UcT6bHspt3UqE4YZXP33hXnv3ivuN48ogIvs/v2xau65ZIMXyZP6aip1L2rIJH7pLeb/D274SHn1UK9jSpOYDWkXPXE2MMaOyRhZwTYGWU+v3AvUDHVI2jFg4TFLblqrpqNNEaOwZfOoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 23:29:05 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:29:05 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v2 2/3] package_ipk.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 01:28:18 +0200
Message-ID: <20230711232819.2212134-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711232819.2212134-1-p.lobacz@welotec.com>
References: <20230711232819.2212134-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: b579bf9a-4682-467f-9dcc-08db82669d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g1VeetDnJTwlosWocGn25AT7jPRGkEmVhCdyjRFuHZx2LggD81HQYsyUuZwv4S7km2P4bQG6WZ17JKJQuFGhjmqEVONhKFLY/yNbmTGSYDIfrArXKSfs//FBxVrQFu4lgVzr2jJrmqQ7334Aco/zQcFBIfWykaRpyQh9ShJHHKUz6SIUWzAuUYm7EGY8DFt/AB/B8PnuxXwF9ifhXMoXUyztEsv0gYh+JminAYMJT6GiErwkCFm8tnKWXGEs5ZvW0VZPromz8XIk9YOP/QvEqo1qXuR36mViKkQO4mX2QaYF6rotNQoACYhh1FaMEiAkNPKnpYaVvjl+KICTEpJDzB2d/bl3Svzisi49Mqe+nShVLPdBCVc9d8euIr4of213YUMPOhX5khWOW0lp8YuuFoOKnem9kSaLKS0jhjVHVXODHI/hqPbqoLjnS//zXWQf8St2EjxNHZ5OUw28Hb0BWE6vpU++GUs5DKWFhGMprP6JjYMhBY536US/795NUoDymEi6YyYm6nxqZNvy3X7iteRQWqj5ZZWBhNfghn7fTCDCrxb3exiHTS9Y+kY96Ui6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(346002)(376002)(136003)(366004)(451199021)(38100700002)(38350700002)(86362001)(36756003)(52116002)(6486002)(66946007)(6666004)(107886003)(2616005)(6506007)(26005)(186003)(966005)(6512007)(1076003)(5660300002)(66476007)(2906002)(66556008)(6916009)(478600001)(4326008)(8676002)(8936002)(83380400001)(66574015)(316002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/amyvA/9X61ATEpZ5ZWgfB/dym42uj3CgZr4C7Hs8FOrpHTfCmSrGHAk71qk?=
 =?us-ascii?Q?TIKty8yG67pkY+A7rMAZKKeA7Hb5raWaHqJhH5Ivt/XIFxKRbRLEEPRqQO9y?=
 =?us-ascii?Q?gOs9wcDT3NbO8JcBCQehDF/5JQOSQazl3+Es9OL2rYgGh9UlPMDcYzF1pq6F?=
 =?us-ascii?Q?d0KeCySk0bQ495GkryvkKuQgoBMrcldB2psKqTISBZ9q//w7zZXYt28LJWR8?=
 =?us-ascii?Q?Venjr2g+1fzQ+3Aqw/44A41vHtLnvUI6IY41A357UVOgIDCf0iTkIsF4T21O?=
 =?us-ascii?Q?hjkm7OIlcuqmfoAT6xAjF/RnLWrsqSq8/XzmGcNWh4W2q53TiESBp0afWPFW?=
 =?us-ascii?Q?EYkep6anSNlUwom/FVRA9YzDm8C5NpicT9A2pkc34B6+SVg18xvGjRSAe41h?=
 =?us-ascii?Q?Fnl6sSM93gwVqUy56w886tnlH1001Kzd9cwBrpUnLlV/5KFAzBAT2F95qMlg?=
 =?us-ascii?Q?abD6pMUvu+gkn74ViVG4Wmc8sohjW1IaARV4NxQLxOqhhUfuzJBWM8s5dCGP?=
 =?us-ascii?Q?s2sQDPRkdeojG7Bra2tdCP4V0n/48DxBNDW2rtSMBOJ4QgFCZ1qaNWLi2DzX?=
 =?us-ascii?Q?c1W0xfJv14cZFovxu2vigVbO7928lzpiJxFtU7OlJpSrP1xIBmYNJ6+Qmv4b?=
 =?us-ascii?Q?S8aDJuDtyzBMBhnSg0X23hPMmhjXUE4Ksd2yliX4inW92eI+h/Ngxi66BLe2?=
 =?us-ascii?Q?NW5f9k6py3csE1DF8Nn+igUzQfeGOB4woxcU1xEqNimcBKH2Sq1XFGG7we9Z?=
 =?us-ascii?Q?5pfMokZQfr9FlWpJRFqZHJfQVmslnAi21d9HHerpI6iUL7Sspuwox2PUIojW?=
 =?us-ascii?Q?MMagVGsKM47D+RBQ+epKz0TpBfj+LXnQFsB2pDPWtBSIUvh8LIz5KQDJayNq?=
 =?us-ascii?Q?eB19Gqv14WFF7SXvuRF5EcI0beFrWFdmjS4d2E/9PlR2yv7LBI5GafkL4xdH?=
 =?us-ascii?Q?jKQVJQUr54CCZuho+fTyzwmZlE0jBWsWImtQPPwJe3e2HtST0oXpel7EUZAY?=
 =?us-ascii?Q?tS/vNVmlzxmC3R1LmShFfCdwtAiKBpbhz+3VAgFjwJBUWNltyR5cKT/P2w4p?=
 =?us-ascii?Q?GMuiSjq6q9p9+ncn4QqHnNGL0eTWNRzSfPff7nxCLkcPtLOe/k+F9sgxL60T?=
 =?us-ascii?Q?kZ+e2pc57roLU2GnltSqFTI5Xz0m0Y8zGQioUmj6HnUo8J5s5lOIOfy8jj8/?=
 =?us-ascii?Q?mE2uJj1SXVE/mkws8miQjqyYqThg3HgVe5uaBnQPmivMXZMEqhxjMf9Shu1g?=
 =?us-ascii?Q?yfZ2wo/IFhC9w9acqdiW5gR/xwt8xyIU0sKNxiHNh92C3FNnch85NHOPvWj7?=
 =?us-ascii?Q?FLGiM/mkC2aVvRq6sSUlNO+0MdPdGC7hyq0tSBN4B3+Dtl7zqUBxQoOqJGbh?=
 =?us-ascii?Q?CkFaqotScoZvVncmvBdysAvjAoQUlZ1pK8ZD3GOS2SC6p6eQqEhBqRxszBrD?=
 =?us-ascii?Q?cS+RyATdOlLF3aH00XXHPJizhBWp4iLtoJITzhkepw9FFknJl2bmrG/uNtKb?=
 =?us-ascii?Q?1iQHh6PihVWYVhbWqnT2sYasjlbfpMJRHyfU6RIs9mP2GNeTWHVhuRkwOk0o?=
 =?us-ascii?Q?HHzSgi5i1wv90aIpprXTrHw/1kN36cuE728EB7ee?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b579bf9a-4682-467f-9dcc-08db82669d64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 23:29:04.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwZYitiF6Lt1T3tPUzrUXLd4X2tAgrOeCYPWpgmMCIm4+t6SQmaIMEXLjwCOllxhQ9tQYPZ1Y4hcjDEBU+BbXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184159

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


