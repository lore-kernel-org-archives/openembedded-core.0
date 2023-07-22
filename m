Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AE0C04A6A
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 20:56:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web10.13777.1690059370641442747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 13:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=ez1pKBdM;
 spf=pass (domain: welotec.com, ip: 40.107.15.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4yNmcHbpKUgGo1mO8fGibMRUznUlIPV6giI+k8ZYW+Ho1UABPM4m/MFLqc7LRHdXrOzZzs02qsCOmLcm0Yr0ktIwoN1v+fgClp2FyM9fw8mEPZTl/FlJ+NyaLKnI8EcQCBgzX6L2WZyNHrjv9wdwSytmAOIgjLvcuyZ8X20T4QqB669JIiol5UDsqTWTSS3m0Etcx9zInL5+K1a6FdNzmiMC5lgTvG1GA5tFsSnBhN4g78UZr5TjkFfx071M2rYJEQM5JLj3h2Izb1vJv7BBqormYfcXdLNpANAJ/BTJT6KIw0PSw/HSV2ZyXXOs3xCD9JAE6pQul2MMlkr/hrl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=MJeSGvMdNXVYNytB02QxSA1Ro8xdJtIJQQi5/9I9PUhufPHEJxUXpgpeoJV42FG6mscOFfdWpObe1tBdETa5Hp8PH+6Fo8Tjm25kV4WgItsse0I4s1ZdEyHBEoD/6F+1oTsgZN4b/OgwGVJE6Pj3IRAzq6uFEAGPB45bTU5QjTGtHLVGpLLu7sr2hjy9RoHJAPl+JxHnn97lJZOLNMZZrk7VIJwpy72QQElrY4gRbLQBUwK2ogpLvspdLPqgvxC4lUAUmCC7ElMYathOz5lxw+ZF+SgsGhDbGXrGMNPjWpPPiIu9/Q7agcwFHUAptz+c66HJu1S+mbp365EKcxUJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=ez1pKBdMNQvEk55X1CuSPgieV1A4q94FzqW1GJTJiVMge9ZFVHOMAp1DN+NroCfHitY1TI7fDda/4KiBINa3LnmpQ3CeZfK41zQ11SXxPVpL4LA4+cQMaOq6XkO38ZzMcBoBslORQ0hAYjY2x5Y196mQVTiDlSXqK0Cm+IVWc2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 20:56:07 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 20:56:07 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v8][master-next 2/5] package.bbclass: add support for ACLs and xattr
Date: Sat, 22 Jul 2023 22:55:52 +0200
Message-ID: <20230722205555.2487992-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722205555.2487992-1-p.lobacz@welotec.com>
References: <20230722205555.2487992-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::7) To AM6PR04MB5368.eurprd04.prod.outlook.com
 (2603:10a6:20b:9c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9e490e-330f-48fd-5895-08db8af61242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1uKKLiVD42pcvzHirn1E8sYbqG5a9GZ8U7k1WUYLkJ4PJ+51uiuNQZqdz3ytyN59bbowGDYZZxPYQ5UDtzldEhs7wvgxML22EiXBCyTIXFWifnJWtDmYI7HUfDB44ipCmHdPItJ3swoIpgeKXgnfpeUzDAJOCqe+HmKsvnlj63sDUrniwM5/GtHqmF1HH5QbjlL4HnHplM7kRmXN1sBjI+BHdFh4B7CV9Ht3zuZr4B6/EJORXaBozLvWO5R6QgZTPNfWLyHTlxP0M0vMpAdNluMc8eMkn7T1JyNCPQwdHW/W4FGiaenrd0+ojo/BfClp/TIEh+kXs8QRR7rX2cT9eYDtP0N0fcQHH39nW6SSH3s8l+qQpYthxKxv8JO1v0FWAhkSAmxLhaoSURSpavSKMZ979A2WxuJDz5+yvxyr0Hh81C0/jN3kwKVGdFs3h6k7c5O9C2tHgkj+X8zL0GHE0iVuB78aZds/TxeNOOUSdIoy++2I+On50xcjloUcnB7disE7ERaP4yPNZ19W3YWmso7aM9OBbqtWZDiNpacZeh5RBhhT1MMSfI+H55akgwPEzbJWpmauFt65cSpsLqEkAHgzgnxquRKRgxQ9lbkWXTOleHDCnObEHqCTqrD9iueX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39830400003)(136003)(366004)(451199021)(6512007)(6486002)(52116002)(6666004)(478600001)(186003)(2616005)(6506007)(1076003)(26005)(107886003)(2906002)(316002)(41300700001)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002)(66946007)(38350700002)(38100700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NjLN27NiyvHM9rmqCKEJAEz7LbLY3QpyKu4yz0tvecKcNR5csuEgvbmeLJtp?=
 =?us-ascii?Q?VfrLjTOB0UVj2kxR7ZpgZGMTsp8/K0Cd7+s5NtTG5iYlkmiFBAECS4Csk37z?=
 =?us-ascii?Q?Bh0MD7NeuFIold3sdOgxK0cLUov9XBlzyLgICkUjDkZu8Db1SULlRN5huK1i?=
 =?us-ascii?Q?IQ80REKqIdsFiHJO06e0Ir1Ofe/0MwS1xzFX0QgO9oQKXy8qXQoLId3qcZ0B?=
 =?us-ascii?Q?zxLs1LNPkd2fb1qS9RkLUfvRdLgWr/cLnsSpYbSatpaKabys75HXp5lCjkhb?=
 =?us-ascii?Q?okpZh8x/lTetD4dZpWeylHqTZHRYyXzv7BAMhwgDDu8/URcSz28ALf+oQvkz?=
 =?us-ascii?Q?kFjAZRiGpn4u/d4JQRc+Ze+zdQYSxopFe0qGn1YuZQDrqjkJNQMwlnECaNvX?=
 =?us-ascii?Q?+tHKXCeCbWzBciP3Yjhaa8IYnleFDXW0sb3LnM5KW6xlCGzqcrWPTdK0H06b?=
 =?us-ascii?Q?elT2JpIeoH4BOn/V53y1BuFnerq5iMhXVGI9WYR7iP6JHhO4CkVusN6dn4Wl?=
 =?us-ascii?Q?xtvQC4Vera7JvK/DjnkCIfoa/BF2CLv5OazTaWZBV6Cb4CHnpYWRhRIfH+K3?=
 =?us-ascii?Q?WYe+2EgMV5pR7xsi2/bvrCJaBv1m+k2PVErwvKOdOr7CE8PTKXPQgb6bep3g?=
 =?us-ascii?Q?Vv/QiuGH55xehndUMOgODyAutCzu0x6e5RB1PQixzIELZYxRfeQRYEpcd8Hx?=
 =?us-ascii?Q?8sJwAMnB3C9380mV9RsSwy7iWASToYvS+4mPaoqPFvUJeyYaPOfARWn0N+vw?=
 =?us-ascii?Q?5dX/ZtgOKAlG9j8rfNarix3f2GXJZbBoqGv3W/H34Lqe091X/Onw2ijpzRBT?=
 =?us-ascii?Q?LdtJsxALr4HDof+uBf1ef8xwd5BIa7IdpWhMH2LAoEITpCMtP7p8vhLudmx0?=
 =?us-ascii?Q?woUWnZtOb/Ecd/Qi1gUEUvQRGUQ+a6rCg/2SU8FA2j6tKnvMxB1zzztAiAX2?=
 =?us-ascii?Q?gcvm/9+lyaHsq8ImEH/xR2OnIkGLbqDpTSWt0AYu+AA4fDQA7VrsQsU7uCIi?=
 =?us-ascii?Q?of+MU8ck+BMgeiDWYSYSFYaUlalLDJwP8zzFFOg139Iw9NJ15h2q4xWdbsC8?=
 =?us-ascii?Q?uSTmqD8/SPA4md5dQw3GkExXrWOMy+tiVn8yjY7tOFFC3ejlcxfr+uc3Jx6M?=
 =?us-ascii?Q?G2vcQnvjOijmIkRnvGnUeGJJpZ1DFCm+bilbEu582yDmgiCkYl3HBzZgsalG?=
 =?us-ascii?Q?Smhn+6ziQQuQfzKRg6OfKb6E9qGnzePu16hfNfkk2DkppNRJuCW4uj8JjjxH?=
 =?us-ascii?Q?k4PfpOaYdMYybNLzr0btoV0imGuB2j3bcYQ3cDdNageKF5roDAkMkaQXNZIG?=
 =?us-ascii?Q?H6x+hEbqJDwdlK+LvsmU9RIk7cISUpA9ia6sraTKuy3uxuBT05/P4FWo4pJ0?=
 =?us-ascii?Q?hUatZlbqDevjmg6Uz6wq2/EGhQrFZDMrqz/JLRfbp73OrY6cpOfQ+LpPeUue?=
 =?us-ascii?Q?P246qV48B378EawoiYRzzJBczwPkIzanxuqcuqmQCx9DyQUe5d+X74PYuzzi?=
 =?us-ascii?Q?MAwciVbg6BngqA/6SzDODe9qLB94vqm9slhcMG5+LHN2hYa2ITByxudtImK7?=
 =?us-ascii?Q?z/ga35nCUnEwQ9jp2ZndXMpMLLzitIpnC5mw9jlW?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9e490e-330f-48fd-5895-08db8af61242
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 20:56:07.7273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /khQycRHeZnlAPvS7GR2Y4kZsMkwtdlWCJTIVfnTq+VKnjiOP++B2wMwlXJapxden2y+YUuIX8boZyvkRIdSAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 20:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184736

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..6e5d0dd4dc 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


