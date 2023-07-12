Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D332EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:26:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.5969.1689164770219531763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=dLc19/Ej;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWZZ0lqPhhKcSNinKQ2YisudU/nvpkSvrhdnVEBlxuSPchXMzJd1xJ6hAEpLGJJNYSTYVVm8J3VXa4/zoNW+AmyzG4W7CY6vzBxuKPl70JeksP3SvA0SXihC6JVqE0UJ4CdPH03oVA1c4JYNIlGwfbA25aeBOISLFW/yUxUKs1qHrgbUmFsQo4kIclHEvZcqVXP4zyDMDv/2cV1BKxxF7FEljEAIv5FdTxjMHYYtTonoYbN6JAzrVdmvHtNRmr804gNBnPssUGlHbEvd7lV1fskHbfiB2IFCrkHcf2q/PIB6fnJDolBo8BfEuwqClIwxzvmsf16zg0ZimDxoUb6vPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=bwA3nJY80NIDgeCJLrSEDepDVnEWhw5oZ/K1rb6sxlWkz3NuwUfMsiB8Eeut+0DxWbxhQU4NV2kKK10QAEIpKTF+vEc3kOZAkS3YVFC2MJVjKq3xnYiDDmW10zMvBTSitfnpgebfphpK9ZLZZExMmQS5CRRCbf1aB0TCTvg6/vr8s8HAGZ7t36hhHOaDYav0Z5CDS7xG2Dtp7Xq+aDjCZ/Wx1gv2RAiwauP/XrfuXitvzrHejvHrXqFGrwuPZUZuj2srrVK/27MQDzJZVvvz60CboA80RGIhCkdR+oOPXeIgbbBA/5NUQRo6jLftcMBJF0IejpgYZ6CJ+uBI6J2n/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=dLc19/EjZ5FOTN5WCMNyVTXcYOUrn0Cjo7HJXtEkLnGiAOYrY+qR/W4/un5YTkPM8iFfHSL1G/pU70vNawSGbFME3qYLoObpBgLLjTmp28qJRIDgqRtr7ZpA78iqV5oH3+1jbdad51GyuTh9QK8KBwKbGGOCHWRVJCG6Ckf+Ou8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:26:07 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:26:07 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v4 2/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 14:25:55 +0200
Message-ID: <20230712122558.711029-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712122558.711029-1-p.lobacz@welotec.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d75101-a710-498f-27bc-08db82d32aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NeuUJkkdaCmUIPQvLqWvqoESivTPEh6ja8sEcxZViu5BDBVMtm91/bTHMt67lDGRi97YlKzDuyW2TtVHDPKVm1TAJNshvmY0OyLO3IBxYp474Njc7lbmpaiZyKpeRdd4t797MHtOEZFBVpDsiZHm5OS4IU9ryJuaoaYp/6uJTfFECfbTdM+mVOEjAOu2wl39+d2jwHgesgViJ963RT+r8QG5yjBB2j6PgoKt3xEUTrKZlwVX3+1SxWiVMLlsEcw8QRU95tLKJnF4vAA83QzQEvWSzEob/JJIWfGWgTDqsKU/WBfLBtpy8MaU6mmvC4HDPlJsrf3bmnVBcUYQqkIEs+EF1gy/BQgMguSkxAiLKW1KvQFjTKyAgBome7U0KaH9mZAPWCxYhNq6/QuCbALRTzwUOxMOAMCzyVysfCvBOuPAg9fadHVuujxkWv2A8KwOGgT58RoFHzpx5Dw3HOWkoXbajqZXnGBi6GO9IbIO4L4IrKD79PeetpU3VBD7bFJkf0sQhC8XCrIm1C4/iL+tsZO6lcYr07boynWln2J58kngRpWi5LE6yYZnP67td4UR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(451199021)(6666004)(6486002)(478600001)(52116002)(83380400001)(86362001)(6512007)(107886003)(966005)(4326008)(66946007)(66556008)(66476007)(6506007)(26005)(1076003)(186003)(38350700002)(38100700002)(6916009)(66574015)(2616005)(5660300002)(316002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tHPFn1e6JBwkqDZw9Kxsg92IQVZVBmpZdg9urz/wcn/EovRK+AJC+KfMW6HY?=
 =?us-ascii?Q?LHXKlD8FM+KSIiuLtTNQuoQTnn7NNOH9VZ0zfdDAh5oJSRdUQQREDRAluGvu?=
 =?us-ascii?Q?8HQjFFW+nWYq1i9N3d2ECfRj7F/HGhpA7FbX2IeJNq67Gop/7PZPUgJFAZ1m?=
 =?us-ascii?Q?PFBQ1m4tW1ll9pJqVGsQ7rceOxzO6iZNF3tyQO9E6vJpXOpzDhSpHVwgIGXZ?=
 =?us-ascii?Q?kzouV4RTKpoirACzb4nGQyl42nReK1zmsVWJwJFcYAHVcM9QYhrx8faQnDIX?=
 =?us-ascii?Q?MQ8+u2wumbn/emb1u08po81BIgrighF726/C+YneqG7bEqfSZaiu9QQfJPTj?=
 =?us-ascii?Q?H6I0/ApyxdxU0UT62WftISqKGYRY8F7SD924X2SxbjqhOvcc9lS7kkao4ezY?=
 =?us-ascii?Q?5EH30eKhR5unHS0UMqxOp1TgQ5XYdwQxyGK38w8vnoV8uyq3lItBcDIGccbn?=
 =?us-ascii?Q?EOvqKKp6bXqxpovjq7cSqe6ajXRy8k/qzuenHhKWD6cvtCkFXXfQM0W9yNIA?=
 =?us-ascii?Q?id6NJrlhAvBISXiwDTIJf+VU1GJVdGrKydZ8uHU4MAqxTuWIyASaMx4svqs9?=
 =?us-ascii?Q?vOZbBJEEIMSm02G7KXdh+VvLLAw/Iu2y5qWqcMOg6mJnsUGVSkGRUY3HAkS+?=
 =?us-ascii?Q?Q5NZ0fNRQoWfv9jLFcvqPu1gYKgJtlexGYN43zen6AKDLv9CJ7XI5E8j6HM1?=
 =?us-ascii?Q?NhmkaO4QCfIpmA8AYlCUdRx6cAZz6T54oIxhETQNhCOz/5xZmSIkQCGOHwTu?=
 =?us-ascii?Q?zhVlmkV45B7Jvk0jrXib4mgfvAk5cPfiAJK73SqrV2k1z+YhPrJijjlu6oaN?=
 =?us-ascii?Q?vOl/1KQ71DTraqZ9r9mQVFj08w+7dDGCU46ILojoZSWBQzYLbaIBVLbbcPXR?=
 =?us-ascii?Q?c/1pGyoWwY9m1j6Ylg3MmcliVkwC7cTOCLrCSNeG/w3e6BO/4zk4TG4JwUXY?=
 =?us-ascii?Q?Vzy++l/9U1G3FTOFlgWjVDBP8Ge3/Y2XpS4uot87DWWYCnKEf6y6lSrinWbK?=
 =?us-ascii?Q?2Ojp6LwtukbA08+mNx2oIg+ec7g+LECoMoQDKi2sOuh7Zv1h1dQjbJmd+wR5?=
 =?us-ascii?Q?f/y3pYmYeDvXYbv4C7bzZ/r033SetFRR/gG9qgesRogNAirGkL4BQIUgcow9?=
 =?us-ascii?Q?CPBoTWEmuTMF1eVenZH7PeYH6F+j3o+N5zS1kvZK6FJceXxrdIcgky3B3f+4?=
 =?us-ascii?Q?wCiO97lbzc3hhd1oJwwZ7q53Brk7/MhAyrariPMgV88Of9b11NjQKxxrWDF6?=
 =?us-ascii?Q?vrcrLGfniEV3NasNY40RkyLjmL/DfVZkcBu9ZBtIoO34D5s2RiV7NjRCycJu?=
 =?us-ascii?Q?sNVVSvey1E9sMGx4rbYqFed7v2rkgEMGDNoW7fOIgL/hC0llD4uTXEW5bN9R?=
 =?us-ascii?Q?TgXX7lBqRJRRAIMckZ/aDCUgRBrEFN0oNJd3gLmwol/sH3HXLkQ31LLq/+he?=
 =?us-ascii?Q?/ZNqLARbMfi7NGUbA+okERfKSOnhOD44L0kOQ3X4LPIjWopXsI8f1eBK11Vl?=
 =?us-ascii?Q?VBaNwDVmLSgCayl0M4ufUKy0/jGEf1NnYE09LGLlz+R0KHtve57gto4f7R2q?=
 =?us-ascii?Q?gOMJwFcdnRYYTtulo2Q31Cj8qBCjlfKB0B5+QCNs?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d75101-a710-498f-27bc-08db82d32aaa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:26:07.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K34M/YZgn26RtyFitWzqGkR+ERCWm4MMqpG2nJd4w/Oz6LrTAXcHdNrO9Eu06FqcZi1p4I+ZCy8hBO5Imx/yPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184190

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


