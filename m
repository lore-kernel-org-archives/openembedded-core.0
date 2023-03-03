Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1453BC64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 20:43:10 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.84])
 by mx.groups.io with SMTP id smtpd.web11.2296.1677876183644758652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 12:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=GPBCVtFb;
 spf=pass (domain: nxp.com, ip: 40.107.15.84, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0AyR0ESUhuYHTIIsHhRgNDD2jO5ztQg6v5NDQV9pG5rmO3tQ/k/wdgC+ZwPtLevZjJWIN8f0mC0AMcGcmBbaS8TxjeSXNXeymtJRRuKs34oFpW57FgnyQLhIwbKIVsliabaezW3lfWdwmDnvTyFWbBwX9vi/y6isr6srZNMFyTS1OUrRBg9G4C+KtxQnbNbqX7+UN2hbk4toFxtwa7X18PzZKgdnsLOIc6vXTFKfaz42CHoyJa5ZiqrBdFwwzrMmAdv0npFVrATGzNd2QyvV1qGE9M9hBFk4A8Bnl3XQytyxJ8yaJi92wY4QLkkdbqjwY8TVSPcgFL5N3dS3U3uog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPhAXEdqMqu8g8+ANTEc6mI2LIM68SYqJ5JwUlQ2YUg=;
 b=KDfFdtRLcqPNkdB90vt9wt1WEOTUGd8jdKpCkLK5fEo0mKsY46VOA6O97ZpCEqVr6drGTkO+apGHc6fllE3bnEfEpHsOwtd8FQuiMUYRZ6EdIH5Ho7hO0twP1VCFs4pXnTtXSY8fdAMdooG4zOguj6mVxfF7eaVZPeQIqU05/DjnAXAOSyKbbJBpkGMmIz/WTNX8nGMBGw1mS/V2NDTQXSYV9j3rlYT0B+KLWJBaDZM3dYWvVzc4W2ct4VskG+5a3lBeXCFZa10q2YCrdpxgI9edtwt7lVDNY3aK99ZK63XjzxRJN/X8rkkW4cKbOWog7hSjBCm1Ol4CyMtWuCsdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPhAXEdqMqu8g8+ANTEc6mI2LIM68SYqJ5JwUlQ2YUg=;
 b=GPBCVtFbnxsGygGT8H4E5rbsN69y+RX/4wAIXitmtKNGlPJ+DvIZJTdVibWDI2MdZrDzh2HM0p0ZpPO4XrQW6jdYyj96ZsPT+c8Uwz9g+esu/lWH4cwbN+6YmNgGdnL7KA3simNuSoEs9JhIfkAHcxQiikVsEuYyFfiB92/u7cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Fri, 3 Mar
 2023 20:43:01 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 20:43:01 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core][PATCH v2 2/2] oeqa/sdk: Improve Meson test
Date: Fri,  3 Mar 2023 14:42:37 -0600
Message-ID: <20230303204237.2508724-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303204237.2508724-1-tom.hochstein@nxp.com>
References: <20230303204237.2508724-1-tom.hochstein@nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b4d352-08bc-4ecc-deee-08db1c27e162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kRmgCScBpwxeWoNi3OG5nHbsYYeioCpD9vlgSRLVMoRllMgzHdqlW9Dp3wOBXn3hDgHZtxie9cOq+hDgSNUO8RKOwliXndhJpH2yXWwWSOIzWtq77W2zC+i9oOonCzjTLsoHIJ+V6EDh3fL8x3kBPJfw7/GWeCLXy0CS9GcdJD36T+DvqviflIcsHbqO/AKvZuijNd87F5hiV2t7iOQYyZ25GVx5FQk3rLoYpH0ShCEMaaJDufIandfmNV1urOs6c10/4Cv3csLQNcLeXb5KSd/8YnyjGgZQoxGRXteUGVi/RyYfb9k4ubkJ0sVvbBbw1HE6l2i3R594qLXs5NCCH6pXMLwC6a+xnik8St6MOYhuIPl3Ht0BjFM3qBGAsUpLKDlkawsD4taJSekRBQOfna0u0mXmijVt9EvwI1byfrOvScbXG8OMvCVDTiCiny0hDPpn0MqcZREcv7s6mjJhPNf7HwXa4YTbLSNMiWa1oOfXiYyFQ2shdUxyLvjg+QL7xR3SE0p9eWkylk1vRTcr1saBMwk5IDHmTJJ6AmRM1fmeiadDlzgWK+c/TfeuYfO4CbjdFWZQI+PdmyZNfn12buiJ1WJbA5OnovBL2pcfQTAiR9FBUJsmEnNNkQc/+UULSIgZZR5+A4gl/vAu8G5xlKU90ZvLQoah64XT6hSK9Oqyc5AZk6mJy8G2wjtqlDiDZ0LmIoRc7SiormPKQa3wjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(4326008)(6916009)(66556008)(66946007)(8676002)(83380400001)(316002)(8936002)(6666004)(41300700001)(2616005)(1076003)(66476007)(6512007)(6506007)(186003)(26005)(478600001)(5660300002)(6486002)(52116002)(86362001)(36756003)(2906002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O1vQnN22PWGF2PUoO9iryvg2M4Oci/siHY9ta43m195ImY01aW1xB11KzfMI?=
 =?us-ascii?Q?4RthuM2J5HE4vf7yt8zH3FOhbBtBKufR3RkQ0JTfLrdY06tYuxFSXt04t4vv?=
 =?us-ascii?Q?1UxLRuySLXVonprgaQ4UKppet36HyoDgEeQxsn7ZXf/L2ZRExKy6Sg+Fsgj1?=
 =?us-ascii?Q?T/ENANGf02UQ1auXY5g3ozmH0Ps6CgeZe6N5oytXj5ZSEqvMxKPa7UyRhZIz?=
 =?us-ascii?Q?dhKXZRUNvBIzritP2ysMw1TgsUbpXFnip5MoaEZXO8Xj500KC4cSdJ7+poWe?=
 =?us-ascii?Q?tPAE1J0ohnBcEJjph83WC1xhBZazmaJXJnncjEZ/rKfonGr2OEVGQwoFw3kU?=
 =?us-ascii?Q?bRf6ppy3gLVPFyuGWUqKE5ysPH1v0lDZRp2MjSgUZDOKyVLhwfttn4v6KvB8?=
 =?us-ascii?Q?T99VCnlbRsubSiLGYjgQVY/Rv9C56lC7VgESngnwW+ojZcHlBEduHXOTALPU?=
 =?us-ascii?Q?mpBsD6GGf+vIDL700/dcYZnTIt5RnkjVuqJjmdr4o1+T47iKLXtA5nTHjn/X?=
 =?us-ascii?Q?2N2VR+8OTn8l6cjgYFPPwuyogxtsX/UKaGTTkob1ZhaDLcBkRRFY/7EMx9hj?=
 =?us-ascii?Q?1QtGeJpn9Ej7ysdDFBvAfe/eWG7/6BRSNWdZQuZYyDTfhXCdSuSry0oQXuCT?=
 =?us-ascii?Q?fUoKOR0BqdXYUz1x+ssZzkMnElzQ29JXJoUi7oEnc8yBGHka4+Qos1/7cvrA?=
 =?us-ascii?Q?2c+xfuh9EIDceyeJGStLQs8MhjBi921ipXZJMw0mvoFTWdi0gOCPjzj97lNa?=
 =?us-ascii?Q?OCzp5QvP5P1ND9rJ731Du6aVLaCkuKb5BzyoPEyeLYsS99e5UecLV1452MV8?=
 =?us-ascii?Q?bZbp4RIKCITvsuLmzDAKTD/cFkDeVeGUHuOrykoUX4OfLHHMBaUdSCe31y+G?=
 =?us-ascii?Q?0VWd9S5U/ZH9nVp1PjhvKNr0iek7NgHkPkA338d2sK0Mv8K/VWdBsOTwA5k7?=
 =?us-ascii?Q?7Sd0PSF5XYuTC+HxOJEoRsjLZygD0cTNLMseKR3EvLf7/rKAhJW36mQZSCqm?=
 =?us-ascii?Q?0qEMLQph4HrWkXjJr41i9yx/qsyY3PPbvD3LaGcgFATDZicZcoVKl26av24n?=
 =?us-ascii?Q?CQ4rvuhlc2K96Eh96VwKPGnrwb3o0c97MFKbY18eDSP8ay/NwzcG6LU6LSF/?=
 =?us-ascii?Q?VtTMjy+zPe6aXIfg+Iu+VtazXAuCtU2Oe4f6MYbpweCSGWkMHYFzKisWOvOz?=
 =?us-ascii?Q?cspQpncERnPtijxqBiHxgtvQtuZ8hUx1/ka7jYVARFvOh8HuU/T7s+/LoF4N?=
 =?us-ascii?Q?gMJnIFv1vUGKAeUWfVSaJXayABHZTaWmEna8BZNPbsA3qg1FHP0yONRLJm/w?=
 =?us-ascii?Q?OFeeNjBUmijfp+36pUne+TxkoiyULUTtRvAajr4Sadf69twYYFkuiSlP/hhS?=
 =?us-ascii?Q?Uqqfj1kF4CqGxwY4U9TovOJl5qxj9VioGrJVQ+aHJ+aErKroPCLMldXUZwva?=
 =?us-ascii?Q?9crOsqzKdo4J3LQuSaXVuheWjc3CaminakoJnL8+fCkdNELIQjzEGMGsBRTe?=
 =?us-ascii?Q?Zn2FGioBNgilx79KP5xtsqb3Z3HsEONMchnETJZrwV1UWJl97yoDNNW4+2Fx?=
 =?us-ascii?Q?H2uJKud7Enhrhd0uczpFQVYK28vz67zpIIGGat30?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b4d352-08bc-4ecc-deee-08db1c27e162
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 20:43:01.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgL8hAzRnLJOi9gkpC+rk+fu6qy8P3u5yWbiVhQOJuF9clAt6EoZGG7wvbwLMvsbDjf9aMPABjFRMBQBg0JkZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 20:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178025

The meson wrapper setup command detection is broken in the case of an
implicit setup command with an option with a space-separated argument,
but the test was not detecting it since the case was not covered.

Add the option `--warnlevel 1` to the meson command line to cover this
case.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/case=
s/buildepoxy.py
index ee515be188..147ee3e0ee 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -35,7 +35,7 @@ class EpoxyTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
=20
-            log =3D self._run("meson -Degl=3Dno -Dglx=3Dno -Dx11=3Dfalse {=
build} {source}".format(**dirs))
+            log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno -=
Dx11=3Dfalse {build} {source}".format(**dirs))
             # Check that Meson thinks we're doing a cross build and not a =
native
             self.assertIn("Build type: cross build", log)
             self._run("ninja -C {build} -v".format(**dirs))
--=20
2.25.1


