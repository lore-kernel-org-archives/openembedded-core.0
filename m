Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3DEEB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 09:59:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.35842.1688983162832059003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 02:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=K3MIrvVI;
 spf=pass (domain: welotec.com, ip: 40.107.22.49, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWD/qPYZbhoSSTn8MOoL6o1iA2liVKXRPbCpPL7+5vR2aFALgLsxZCgsi29hmUrVU93InB4GPj/FkWEwJ0v1RrqIUIqey1kDf0loQtxu1zHVPTPWurGHZ3epnSMUATz8m4aYiwIctVIdhZXP1Ir75p2fAYyXJT8tvR7UZZz5CO1Fg7ZM3jgAL5iRdbJpr01OC055RRg/Gvrvv0boQI3/4MPvBvz48t8e2elbwjnRbRG3dwH0DysJ67MloVh+CyMxO6TjuvErEyWlmf6kFCUpppkXkXvm9MXgdYCtcYbpkv1PFcud4qQWMCis1etoCakI1W5xvhAvgvuuVL6FShUmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=iXOtW7RJJL4RXpvIT3F8Xc8D7eUyuhuJ/9cn1+QVZCwohxBanwuVATUQVeGP2j/+HVEYL5DoxMRTU9iA9CAbI6AidQ+vlDKwPxYgazUQjCcRXvCYiiCs4dxUoJ5NXg9+mqse09J0snxNnEVnifZ6PdgqoM0tzSo2tVFSZJkwWIyok09MYe7nEDFc8b1GDz5GaShXoOlHJzXhMyFb9tQW52mlS+1Tdt0Hu01sZoGdXALKFFT4v6LTvc/E6tsdIDDIh/TOdYDiXhXuO3Bz1T+EGeA8OEUHJznBh3Kb91mhgvmaJhk1TNukDz3cQDJUB3Mul5pMA8VvA8+tfj5hd30jsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=K3MIrvVIbnRcmORF2dhKwA4HabUuK/ROeGmaLJ0EkvTMnc4AKGeIeLgA5Sus7vfRgaha3a4G+iQEv4lGPQYhq0JfqDaXjHFRMKF4ffHwQuy9+cScWel4s3OT674DcbCSrmZJEGxIf1OetSXHA8vr0pdnOddhTaMhzMqZnMwbWc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 09:59:20 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 09:59:20 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH 2/3] package_ipk.bbclass: add support for ACLs and xattr
Date: Mon, 10 Jul 2023 11:57:59 +0200
Message-ID: <20230710095800.2033309-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710095800.2033309-1-p.lobacz@welotec.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::15) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: fd423b64-3139-4095-8c02-08db812c5480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1VTiXft4jYTtpYGh6YD66IdAT3iCgjdqGbReiE09fZOzE8PERaEd72/hg0eqK90xR+HmHH5PJhngFFJPSjmiDm11iiAhNCHaT+au8/CmmlgPURXz61w9Rgd9TUB0FrfXLYWMgUhhVkDMSCt1eusGo58QV6Q+K1fLUdX87iEPVkOCGDlrmvqwGmvId0S/7Go4Lr+MvvD4pzvwVsEYUvsZDUOixVV374TH64BIPKleu9+bJwKvF+DLB8XuDMka6qoY5V5JU9fJeLEi54DkpTgiMRXNlNNSwhPAzFNfg+vjby9h/3f6rCZaT8Awt++esibeW+5clauXhXxbuLAze/bhirGB9HLRDHxhm+0h2UgxNNROHeNQ0DSBy5eur4mG0DygBGxxz+mgExKdjWQvq0o1oh+ngDd/x8+vgFq4YVbt1zh6lsaVCGMJnyOfwz2izyAET6mA0o6b2rV6rN4U9HRqEkgJHm6gvTSfQxlSvbq3D6sSMpAHxGv/Na1D9zOQoyh0XCu6etyup/BqvZlqwDuMWQ+ce0+16bX4mbtxhjFL1WvR0VdPfmEwfjpkPVkKf15+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39840400004)(451199021)(41300700001)(2906002)(5660300002)(8936002)(8676002)(36756003)(478600001)(2616005)(26005)(966005)(6506007)(6512007)(186003)(1076003)(6666004)(6486002)(52116002)(86362001)(6916009)(4326008)(66476007)(66946007)(66556008)(38350700002)(107886003)(66574015)(83380400001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Z0lGVsAGFoObQcWy9MtbHcD776mO3Jlbi//rMSMYz5B8XINx4QWbWJOSnPE?=
 =?us-ascii?Q?XTRkAWXBJMYeew+eAFzF+Qst90omLZ/4vagWAsr5bGVGlf3ny8gwNfFHLaNm?=
 =?us-ascii?Q?rUNuyUvfKN8rLyakzuOI3TrlZdUiZOFJfEmUZCboDSLHjWy0RqwsT9YOjis/?=
 =?us-ascii?Q?OCopcdl0WSsoFBWHrkToZ2oqXGlPVp0sJsA946TGGACDZMCEJZhXjcg6VcRs?=
 =?us-ascii?Q?llAx4nHCeBXbGMSMCuXE+zP2G+iKER52SzZCLjpujuW9hkxwnLRnLjdGX6+X?=
 =?us-ascii?Q?Fn8v8K+vsDXHbdJA6lNwHvHiUNWjsMIDwb/mCutu091bWbpod+0DDlW3LzEO?=
 =?us-ascii?Q?cMj7Io04DIqX087aE7N/t/JkVM8hYbfitIVYvf9KtBeAOIugUu71K7xF2Z88?=
 =?us-ascii?Q?dGzzFwvxeMQPNOqXeKlejMDbMx64Pr2kv1LZbXaBvLn4yUaP9kQdoxHYBS6N?=
 =?us-ascii?Q?AqYpbEBwkqD9Irt5xh17zMdPm68frA3suu6klLDJi93nwX5PxzRpw8KqzqlL?=
 =?us-ascii?Q?d4Vfgfs0IlJ2hPUUi1XqCbFJTRqe70GAoJcwj/TKVL72ClX8ga8dlqTA98Q5?=
 =?us-ascii?Q?X/k1Lgo6GAcCXUXj9ffL9qV8e68WsfoDnaqfFRMDPFPdJ5wPqxSlaJZ7a0h1?=
 =?us-ascii?Q?jWFQSyyKIdWx6IL/DhCzUV58ZWcF7PubD3yf6yZ7kmJB9kiPgyBfVs0HtvR7?=
 =?us-ascii?Q?v6oStGagWCwVP8DZjD5YGOypVVHWlNSMdtNRX3QroEqD1wlaFWVCrOoK8WAn?=
 =?us-ascii?Q?13/vr1azEyXvGKmGcbBw9uL6Dw+dVr+wpCjAQg/NnSt6FjiTC5rj4w8Yfxzc?=
 =?us-ascii?Q?Z+YeGxAWJ6R7Jl9AFg4nFWtttuqMZN7patwpxpVGKgvvXIy9KeJop/j7WZDU?=
 =?us-ascii?Q?BiMS2K/xe9ma7yCjXy0Nxtu5lnRmQqjLAYNTehJ8OocA8j0b5ARoq4f4mW2C?=
 =?us-ascii?Q?gvy0q+GcdZJhYYX+D1Cgl5p4UeQk9+mmlMKQgX7JTYsHirV/t22AZYziVX+C?=
 =?us-ascii?Q?UAcS5aE99WsJzo7+ps9C/n0pF8EoFNmBsz9d7DWFC4jNr4iIQKsNnIXbFarD?=
 =?us-ascii?Q?GO81wTOIRPDbxjplwJeBRTR2TdF760yR1hzvqFQZ7yNlJJEn+OHjr8uQ7Kez?=
 =?us-ascii?Q?+ytCpvjYidLQ+sB1F1GlPylXmXyGU/9wIr9riMYS8jRnJtU0leWaAUwDspq4?=
 =?us-ascii?Q?HFz9urjgwHIjCz8avLWaC511ZQc3XAaTZTyLZ1IDfAXOr7hybrfWln2yb52t?=
 =?us-ascii?Q?ujezZZ9hSaHXPeK/44sF3I4qpZ5o8aDUIDek+Oy6vsDptcBGp1MoeorIZx0h?=
 =?us-ascii?Q?53DZm/fLY5YGmQfWhzq3iU287EhMYCIgjZGF0D+e3kEsm1OCmDwrBMRLy4Yw?=
 =?us-ascii?Q?d84pQvKKV3qDO7TY0bmLr6onh7NRaQ2f/xynHxNe6Rc5X1AxAg32INtqq3CV?=
 =?us-ascii?Q?ZZl/Se7KIX/nXHlNO7l7nimtb7xWu6GIJporkvVm+lGg+afLVHEIZhYI6xw6?=
 =?us-ascii?Q?LRJ7XG6LCszZJaMH6tdfEa9sqiFG/ORgLnVu2blAFvTzNhPy8IPM6ntqlWSP?=
 =?us-ascii?Q?jynz1/PfwyPgxhy4zXcQVFdS9jzwfg3Jfles7Nsc?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd423b64-3139-4095-8c02-08db812c5480
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:59:20.0908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUGJkYsBGZUBZ1jsTSVie/0zwiadY2XzaRsorhlhE8t2jkdz0Rjfcc9SjvNfh1kX8etVzjJlMsAj1JZYKU1iZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 09:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184064

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


