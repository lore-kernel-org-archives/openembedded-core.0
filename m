Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7337EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:29:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web10.1378.1689118147839251392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=OIlLw+HV;
 spf=pass (domain: welotec.com, ip: 40.107.6.85, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mef5LHqhS/ADioR4x8CLi85vB5Fmiq1tydXtHkbedlGybmqEpbZpsJv8hrz/G1KIEZ8DpHpHHDnMzLM96tAcgqRW4vxJtvDhKuuXVRavFIUJ9ptH2qRU4c4TytNmBHujVXT+BkYdspiYIaMk6J+alYRHoMbLoxaAN2iBvDOPmCbvoJXxPVFEg5TTJo8J6bWdtK4G/tEhSQzud9SGwo+twDttvd1fGkB7wy5a9z6nJhz6557w3Sref8XbfwYrI/a2Z0rFFsZPBUiknlLktbMReJzpiHDFLKOHMuMk6yy7VkHK8DYUQig1Vx/EbabPtGDcuY7cn2YHivXAzPkMsitvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhSbpNtIu01gzcXqIIgE+KAoxaSghkHVnOFAdrtyjwI=;
 b=a66Kco5oYEtbewGfwmimyJYTcnr4hYHmFvSQy0ZClyu3N0Wv9fMI4WJp8QVTJ+SxqCXk9NW6IE+y1odQPFDYILWg2FGzEc76Js5hENdbOH5eH+RPAKXXN6ULF78hbyGHX9kLGc0WCOFMkwkBMKe7WubmPVC+GBbvGyBATLEZfDl9O1e/woWWiM9UaE5P5AF1VcD2xWf9sGQv9tp6D9iOPM0Cx/5v7XD3chfuezR3tlCeSGv8rHIeIkCnZqLOJr1tHF+HK8l6UUUlDNOCKe0hzje7TwHEOmJ9nDgwISq7C2952DKIyupCWC7N0dUaPAjbURR6aKVNZ05tuhW1QhrrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhSbpNtIu01gzcXqIIgE+KAoxaSghkHVnOFAdrtyjwI=;
 b=OIlLw+HVKZJAK/B0hx5tiNOXGH70GjZ6ZtR5N4D0zJRNM/XwMgOXJWgMPzS6xkEZfcqZO4FwakMvk/NI8NqwfM3kOqZiW/WGQMx6ZI+Qfcb+nGlwNGDY43yJOLncmUMEVYt6A3HeunqpvJBYka9zOkO4s/tGtRKCyYl0igRbhKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 23:29:04 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:29:04 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v2 1/3] bitbake.conf: add acl and xattr distro native features support
Date: Wed, 12 Jul 2023 01:28:17 +0200
Message-ID: <20230711232819.2212134-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce53115-1dfa-47b4-9155-08db82669cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KHFePJ3HhI1GcQ/8drVU4SJoy73jsgyAtEQ4Cy5ank5F6Y6kN7U28IthmNZf4RVSSzPVOvKBpOitwpPwh9wji8m1ivTuBRxbmXyjRfyGlBCvXXwyjTs8gCK/0wkvYIcrdX9r0qzeiSUdjYAmsFSeoY65TqFBLRma+CP4Mrn1/fjasjZYnl/12mHADDlzdZCoov3+j2sXEXMn0Gkluwxvk+n2VvrEH0TDOeVqvOoYcnawxM2RRxrThureuBRgtHK24kndrzlfqhhxYc4O5spozBVMj2FOcyFPKRlrK73BmElT/7l14mMC6QtSpm8bmTe26LeomjF32BG+hU+3uLP+KY1/tDBXMHjXOvF9O/EX0SkeScDvHBbCwJyaO5Ps+z6HAX+IXifs27ebx6bNXJ1UUVU3CcEeF8VAHFHUc5z+kmvW7keKxaU3RSv9QBD1SzBOeFjLnzThbQThVfznEerBqCVH+YFlP66oMIVnA5GvpSuLRsCpOdRL6m94dlVyNe93WH5G93hSnIHu40KEP7omkvdQDpvjiSEEoqMAjQzYPnTJ8PH2bdKBoPjc+5eJxoqRkWIhAPlgjafeZA0UXzt5GzGS7MSM01+X9e37kfDPUPbFJjyMTezi8+hVLhBdVd4j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(346002)(376002)(136003)(366004)(451199021)(38100700002)(38350700002)(86362001)(36756003)(52116002)(6486002)(66946007)(6666004)(107886003)(2616005)(6506007)(26005)(186003)(6512007)(1076003)(5660300002)(66476007)(2906002)(66556008)(6916009)(478600001)(4326008)(8676002)(8936002)(83380400001)(316002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mH6n42jWNu8lAHID9aU72rBMawuHXx+CgyJUAs6rm0i7cg8ze43epaaATwfY?=
 =?us-ascii?Q?q+mQPrVUA/wx4SyK95XQG6sKxzzna1pky4hvII2jjTg2ENUZW2IC0voCg0hu?=
 =?us-ascii?Q?QhDIPXfb6NpW0lDDtj+yORSbVEM7nMuKFkfY6BmBeUA9PDeThRLrP8cK/tJf?=
 =?us-ascii?Q?fzg1QM36nn5V5uybG5UcvGhWvyDGs+oL+sRBtx+n7ecLo/NCyIESq46Qjatm?=
 =?us-ascii?Q?SXHMQ4iRAklYWf5Dt8bpvmxyE3Nhsqg1aVMNL3Vs/9pNiriKxkyrm8MrjbDr?=
 =?us-ascii?Q?Uy5D9CcXtYRjKM/tqpB8herKWGOB4evlfV3iOKwVSIP9NfLV5EuWbZ3y4D4j?=
 =?us-ascii?Q?5/hIBpgvlKqapldK3iDPlYa+jMbUl6lY/jVEb6q9QfQdHy9VuLr65A7LAll9?=
 =?us-ascii?Q?3TQMsMFdkdhweY92Y5RZdX8j8Fl8C33TEDCz0nfs0b65Fm/LCWUFdIqn6b7d?=
 =?us-ascii?Q?f3ZjzS4zbz0eXC6ByS+98btZJM/LwzRpA+UGVIeICNQDlB/oNU5Q8yA7hYk+?=
 =?us-ascii?Q?PSD8cOkFv5rPdItGmsQ41dG1yWbelhlDf8F4wh21FlsGgto8AnnXgcI20UqT?=
 =?us-ascii?Q?xUtQKB8AKIVScQaOLtLcNFopDCWmilIAOupsgAbIKBkiufy+HNMAzAFkx73w?=
 =?us-ascii?Q?lcYOkIbLLpREyPSWUEEge8k1cxHKdKa944lIfl9tCv4BEu0FQ7R9fo7z0r/M?=
 =?us-ascii?Q?pFYTde0NrurM+mPgfug2dn7DEMJwhvMnprnEc4iWH9XFOElF9BtyTDzbqWCz?=
 =?us-ascii?Q?4DvAd9BrE/UzEdaYpZFluzqd9k3usLoHngZ2glmeuhFVnmr6K1ejuzotCpPR?=
 =?us-ascii?Q?MnfTGFv6ypb8xkEd0z+W8mAXaHBGCtJkW6vVpm6vqUzulI8hcCJrMu8OCMLS?=
 =?us-ascii?Q?1+GGNTnngQtaOQPc9qo5Ws0sEsnQG4UNXT4sWsjT3SSFh8BvMn+8yCqZSyxY?=
 =?us-ascii?Q?hMUElb/nNRIiqnsXAiP8Ii1cJBFgx0UFSj5hsRBDpFys5TdwVTnT/z+N6L4J?=
 =?us-ascii?Q?BLq9Wp1v3P6yc10Nm8jLfK4tde7dv07rBBBUHQRc+0QL6hRIFnTBeuVLjL3b?=
 =?us-ascii?Q?k8sZ6fFVFtTYIjaQs5OUHYyq/lOK5TD5MoVgMKOYdHxwcYCapySZKMXlUf/a?=
 =?us-ascii?Q?0MLwzAs833FXVjN5p7yXDdRLQ0/8jCeH2MspjN0RSCNdL8tiUkO/93auo/nn?=
 =?us-ascii?Q?2kND0vaqq7eqEs0JXyoSv/lk6ZwjEA7Y8Yr8kaJpqczVoMdYPp4Ol+QjtdS0?=
 =?us-ascii?Q?rSxl1ARDxGTkWldsG9tGcMI1aM7FI4UYVLNRjizoiAAkAaG1Bix5/l6EuJc7?=
 =?us-ascii?Q?eweRl+MAAxY0JuPGgT93n9516B+B3wgGS4RnCpUYkSkQ+33dSucHRnif+KYe?=
 =?us-ascii?Q?V2emUOXJnsKP9AZcNRwX1ahec9TqDFuXhi1OIgO2GWon6HehrzJ4/Xk2porj?=
 =?us-ascii?Q?Avgf4XUnC4+tBWIEFdRG2zJ0/szuzZ6n0mGmBfjpuZir8o+OyU23GIj2gzvw?=
 =?us-ascii?Q?4+rhK7VKbeJpjgzde3rlIKlln0I/nDPOrTn6Zmd64/ntYaW6ChQHLfe8VygY?=
 =?us-ascii?Q?z222Hyy6jOd3F1gJD27KPaX1fcZHwaxnNN5l95Pd?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce53115-1dfa-47b4-9155-08db82669cf4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 23:29:03.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fTI8KMo3AH1UZbE3B3SpszbEGDO9M9ImQH/0oWZfa3aVwOwd8Z1RbUv5GdVdEsuFaaHhPu7PMBP3IHnXUeTAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184158

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


