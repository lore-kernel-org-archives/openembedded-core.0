Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CD7C001DE
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:22:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web10.7252.1690363361353950502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=I1pvfBbr;
 spf=pass (domain: welotec.com, ip: 40.107.104.78, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KioC2dgVRr5kuwicX8oJxj/YzAwO79DZdJx/FQzsw4tZbmKCbjYUq8DMlK5bdZyjPaQxnRkcSruQvBox8vSWqBBangvfjzWMFp98QcA/Mi/pTf5qXRNSbuuoRUtR7XwoZvttLqXWBLZ7vH00PrOMnfA21O526X4lokw2GPJ4HibCgDX/EmeZIy1vXEzlIK5mW+wnWbK3G6Vus+G6F1CwGwDOs+5mUgP2WnzGF1jq3tVPRDmlsJmwRXGfkXdOf9bQJ0JeHH3XIUq+Ess6ub+M55iBsdH+t0YjO53Y8qfJ43JWu16im9m+1Af07i+DoDTiPpmJdozUO8gZXgtQ5s/pcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=mF6vaQYx6TzuegMOwpoc0Ql/YxrOYnocLAgHCmjQEQEtUZ9ZVQ8sUKsIpYyG3rp3WcEa4dc0yMu8MoofHNxLaPzRSEblbV3PHI4HPGzaeyakn1GWXKswyTCCaVmbUpBWho4ku5VtTKHENeiYUvxAo8IoIPpiNHNzppcYfcDftuHlsIiTXF3eSzr3zYqTakGlzMlw9l2IXtVZDJtEwPDrr2KVK5MPBhM/ueVGSVGBljHBw4uArXXZ1nt3ecitm9wIPvPR7/85P4uj3C8ZYs6axpm7oCr3XQO5A/kPXyF33AEXPCqmlKspMLN0jScVhjYz/5MAuFNKIs9K+cMKbUv/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=I1pvfBbrsvQRjr0bPKbgu1NqPI2458ISOT+W7trhw+WV4f0d4CyrB7ZiTZnFJmyDLDFxMRST2IwUPyS8jNHiYSTa2O9jHfLG+3h8vhvO9aNqNmMPcrPRvrJJw7WPNNeSPEghe+mmXjGpxS7eu2PLQILeOD7dmAoGDR3SrlZL+v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:22:37 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:22:37 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Wed, 26 Jul 2023 11:22:24 +0200
Message-ID: <20230726092228.1005306-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: cde68419-359f-4d0a-2fd5-08db8db9da45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RK2/pW4fDgXjhfTX5NqUm1P5vmojf665UwkIB6Yi70D5gZLW9a9GT3w3/aOP2uTAAgijX9yY5R3MfWbyjWL05+Dc9Yc3WuBeESPRyrHu73gGbwnO3Y+X5v4nUXf4AMoVFhc5egxLsvBJqAZeFJs5KPslSVA/JWoZTFuOaFuMWaT+K8wlEDcVipMPKS09+JvWHKLiu7/F+S867T75Fe38m8O5nvG29tPTF4GPzmPuhOI6Oc1x++Uf4JONyIWGlaU7ezfzXlCVinKF6BzqkQ9F3FoCuAl+F95S9iCfDPPzEw9DJghtPIKmiJjSmXgPaXE9PhTIeq61DyHr+kB+hCT3ZzUd3iLdN39RXi3qFvGJ+w4LFgr+6W6ha2psVHTvQqqVA1sr1mLP0XJUjLwmJdBp1DO9KEZVQfauNpl5cwSo5CJCcG/UTkQsYHQH6VleWZ6iT5zN9QBlQjCMjsGepxwmq3gsrtroxT7EdQDRq2tjJOpc53QuJ8PIcjszGwsxzTe/6OwEeigHMgoMvUuUF3gLDQBMPApThzgrCwwM9403e7ZwbJInWJ+rG+tu0wjowo84fdEzUOZUWNdQ/kIYgzB/eJSwrn3x0o7o5ai4zPBddaQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(451199021)(316002)(41300700001)(66476007)(66946007)(66556008)(6916009)(5660300002)(8936002)(4326008)(8676002)(2906002)(478600001)(36756003)(6486002)(966005)(52116002)(6512007)(6666004)(86362001)(107886003)(6506007)(1076003)(26005)(186003)(66574015)(38350700002)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WcMJTZYj2X3nHRTK57eJ9ZSX+J6/Mq9JL80pq4YMSfu6AaeKqbmyDsq8rp2S?=
 =?us-ascii?Q?sDCHv7TZr2+2OXys5iqVdqzSfRHLCyp/77dFHHlNqY9ZG2XGxWjwOnPkPqYs?=
 =?us-ascii?Q?E8DvI3VWyB4OPNZN8cVjiGKqIWi2t0E3LUDzeaSlcZJfdQ5DxyS76flIc6K7?=
 =?us-ascii?Q?TvhOLvBK2aTQrVfr/U6KHiMlhX2Gnmc3Zim5TVGWZg8y8LZfHakhZTyNEsbv?=
 =?us-ascii?Q?5ybbat0nCYZw9nZnwYTZjzC2J/gX8nZ7ydvBLCqEqkr5Lb8mrYF/x00pvI7q?=
 =?us-ascii?Q?antSFYa6Bu3xsqwgDMTMfbDk1hjjDaEVUTRCZCuiwnvMq4o3NygQygfxggBP?=
 =?us-ascii?Q?F5tH0lb0UB7qa/YEKISrykZazXUcGvqGcLI6mdXIdH43PL444NcJfVS1/FBJ?=
 =?us-ascii?Q?rVPXCjGXKXKGvXnjyWZSFnjRTXr3gpl9Qa7XcsdEbIPalYzZpWhKMHcHRz/b?=
 =?us-ascii?Q?4L1zglmIfsL5t5py/x6tV2SZAs5I7vyifNKRiwUw/z/uH+zV8XzmObqS4Y+0?=
 =?us-ascii?Q?CBno5CT3d6mP7gXi9/WKzVJkW8uokd3m++U0ts5JbHKO4FQgHxdpG6k69prw?=
 =?us-ascii?Q?8pW7CV/FlD6Hcys0YNDL1d3Yo46l1SYF3qXgPtmlgEUiPRqWJUIUkIHYCX4S?=
 =?us-ascii?Q?4eQUpkCeFVh4ChAcjjhRr1W1YiFU23eQTypXDkky1BOYqNrKGHqTaYzBk1SY?=
 =?us-ascii?Q?QAyxjM7VWeM8g9cUzCsohmvotsYEOTs6UGXJ124Ggtc8nTepsRTGpLJT7Ubi?=
 =?us-ascii?Q?6avbIKqvqGfQy7b4pYa0Si0FvJGYedxIpWwPRoof7XSw5cTHhGeh2+FjVYuX?=
 =?us-ascii?Q?9Bo7KTDxnPPNn0sBlheyGI10+v2tR6v+hu9R8Buh32IAed1BZ2Ks6aEtQU3d?=
 =?us-ascii?Q?6tY0ZfHbqMs3TXEPfUPOuaJUUx2BoCNV3mJ4NInSpdIJomqIoQoLFm9Fm2kj?=
 =?us-ascii?Q?P/vpWtuS8hcc1HxZhAKKl9CVu2dLbrrnK5ZsbA84/6DkUWLsypmKUWtfnVkB?=
 =?us-ascii?Q?mtM+RwXE/7hVVrtL7jLaE/Q/Pmk+YQMmHwFx7HlJMcAnYPhiqTE3tk+Cv3iL?=
 =?us-ascii?Q?I2mQRzxViJD7PdIy58fxepnCHFJqqbTLT5UV0qdUCBniap7zZ8eu4dcAI9O/?=
 =?us-ascii?Q?kLLHEDB+IXPh832RYoTdv4nOUv1GHpqRcfsIaPKKMdQ+SKgVVXM6y3LamAec?=
 =?us-ascii?Q?GWZbu3gT7mo9CshItvX/tc97Dy37XXiZ2kPjeR3SUwyCCdtdcXP6z7PaEtDe?=
 =?us-ascii?Q?GMAzNIf3lxeQUxCVkJ/elVNnaFOd+aHZuxvgQgEyOtdqYnMRja7m6hWBiY7q?=
 =?us-ascii?Q?+1L8drNFs/hQVxigiacfCLiBR6Vbvx2wp6TBrqPV9KXqDFN9W54JfOfayQ0y?=
 =?us-ascii?Q?9pv2sLDtigRSbUmmWM09X4S03kP+uN5k6GS8sGo7v8tKY2IzYCGm8A/rn79s?=
 =?us-ascii?Q?kXw2DLFSG5GLvW+MPLoWMq2PphyAhW2c0SowFDI7SyRz7Wr6YDZ0dIVoXK54?=
 =?us-ascii?Q?isbmAWEDyPO29lcTIT3o9UWBmst8CMYmUcf/uddmFQRs4PNrHb0LlUjJeWuw?=
 =?us-ascii?Q?BCcLqoXUNXDdSqoR6WXjNBkkkRCy2zDkG2HSx87H?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde68419-359f-4d0a-2fd5-08db8db9da45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:22:37.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dcrgf5JjhLMNzSizOMvdA8b2Y8Nt1D+/S+P1Eh/AfcHunDH/oHEc8d64lf+Pe9p0ZuHWr60p9vuZTHB+5mxMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184870

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


