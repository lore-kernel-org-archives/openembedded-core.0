Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC36C3DA40
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:04:55 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.77])
 by mx.groups.io with SMTP id smtpd.web10.4464.1689188688089454094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=FVhWeqI9;
 spf=pass (domain: welotec.com, ip: 40.107.103.77, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj0tMts+ClXrq9D0wjpG+cH0oQv6IuQ0FTiCHZhc0OzZX5/n0t0GtThklltfjWd0iuwM7mFHHROFKLHGa2MJrX02MM0iI8n5Y2lkHXDuTb6v5Gm2W/Qksru4NGGGXkCEWAz1wVAdULg1p8VWIIdTzkEmZiRj/gsFcZS0cEmAeS0C3H6NJ79DCw2GoIdqYKG5zd8CtGzjlIUpqSQlX3jGJY4dZmAbtVW/Bl5MIxjMp+19ldakH8Au6d5u8OughVYvAkQ5I/dqfnLnJYrO5VFrMyqYmJNhTqpT5vO8jz5syMj7gki8lAPxJfRAKIySMdCmhPyQPg6uUBi7gCMQasNw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=Wv7jI5sqMqekXbDjmp0LYLc4TLEM72IP4iWCyeqwf3YS+lIKy+HoI9fdnvL6Mtp5NmZKRXIxYIIPeGBwkTxk4O91u4syMTejpnqkFmwwh0JvG4lHkvdaNgixyF9F/LxAhGQNsxXa6kw3ZtgZk5p2aDC1zfyQq7LWo22S/OPK/6eHmpkiLWQajJE/OBkwBgJpKos0QCG/EebG2W6GjuU+Eghh93BcMprGzsizttW5QpyuXFMZ3gjQQTowktPnA0DwA2WBT+glD0xzTkTVPcKv06MRFyTaYSKNedA9zAjUvljGmTMoiewEpEWyJLxigDqtgXvF2ujLbQy11WUJjLy91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=FVhWeqI9uRN0KG6VQPJ1Gd3F5VqLXLNZ/0gJlnchZp6tBzGGDcNejlImi0CRrSWgp4Hi692KZjkJ0CndZR75yOxOft7h67hTaCzZPbVuJyxOgec1593HWNOf9dsqrJCAwaDNC6Hj4WjASS/X5KWpUqpqSCSGMiTPKfmG5JEcwfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 19:04:40 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 19:04:40 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v5 2/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 21:04:25 +0200
Message-ID: <20230712190428.379909-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712190428.379909-1-p.lobacz@welotec.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::16) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dc3cc2-74e8-467c-0085-08db830ad79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x3nqRbkt27NG9hqRmq+eDpANxhFfsa6M+C811fko6WG3IZ4GPW9Q9mVbmo1vJ29B5s8KbBWMcXbKuTVOSoxNQxcXPWg1h1FRkacfkgdl0DuaWMnQK91TjG4NIizQosLObFT/ucEqTyKTQafDVEH6q5ImOnclRuJr7BQuVOfKOJA5Et3/7IDdKHclvuPReQwec8kTyjcjKyZakjU6qCnWmEPSTEAgoLzqLOUpmig05i/a6FR2v/ZjGISg+mUWdg+PtLnD6edmD2I05FDsRC1k6PJ+RWsMA6bwRYMpGID48xMs1RZ3RVrMAcH1C9urd/L57qy1ZcmMy1yNTywTS429sj5Oc7xCxoMTdy85+3hxMAwr8e1cb0/vQSf7aTCFvyFWgdZdY7JcqWSD3327Ub22naMurAGCDiXq3lD1HUmfyQZ01sOWN3CXmZsRPR3ptFfLV+2t6AwgWPtNXl8tXGvTNtTw6w/5+xPJAjY0zO2StFRD/zGCV5mIWP7Kg+WQa4zAPnUUCKGnWxUWwHM5LTaajGNJ3DVPUQ9GeBqmmSpV04qJutwUVHD+oR23eZbW18mBi5caKlq31k2IWQ808adoSdSkkztggZSjD+1P1ZJTRlE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(451199021)(8936002)(8676002)(38100700002)(38350700002)(66574015)(2616005)(41300700001)(2906002)(316002)(5660300002)(4326008)(66476007)(6916009)(66556008)(66946007)(6486002)(6666004)(6512007)(52116002)(966005)(83380400001)(36756003)(478600001)(6506007)(107886003)(1076003)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MpqpaG/3FHPNZs5pj5oDDiHofVdtInSAoptFX/DNB9wncnQUFM3DCj8UPN5w?=
 =?us-ascii?Q?DH3ZpBjsiSshE3BTWw+VsUTQ9kMZK+o87V3iZrNNlomXCPnBqQM1Sk4nwmBH?=
 =?us-ascii?Q?aLRZiir5dUq3RHfdKztKgGTOfVVzhPdKtyCpIHtW8GmO2TIZdTB0DsWyAViL?=
 =?us-ascii?Q?8g5PluTnenp6EQnef0v3tmh4sX/dMExh/BORg8k8QE41VutoG7En0gTuKSX1?=
 =?us-ascii?Q?C+jUf3tSOuKYgTio5jIFhK43iA1Ws8529UrUOVv83gI0wNVcA3iY8YUtj+R7?=
 =?us-ascii?Q?N9VTXzXhTKvubJMZt5uPFo0Ks9e64iRBc/EYJFLFomoM1+sqOCYmM+F6mv87?=
 =?us-ascii?Q?/fp9O2xxK6u3d8EgvJqz3COJtvMLnNyi07GHAC7mLYVPm69tgcPU1tJHKJ4k?=
 =?us-ascii?Q?LTku3uprP4gy/HvbGchkh+4RW811R7yHQcj61kphTIKBMYgm3QNW/FF/Iswl?=
 =?us-ascii?Q?C4XhRqNELCgLB5e9/1biFX9W1oY1ddxDZg67xVmqVYwhxgk+/yk6R5SOXzKK?=
 =?us-ascii?Q?aJtCGSIPQBx5IJRR9zmd79NvGm0Cb57G2CNmRjaUy9j1Ziym/2YRzWtjRbkU?=
 =?us-ascii?Q?TjrP5+hv67tJlKg52BNk/uY1D/DOg2i62xcgog4ljnuGf0EQ/giqszRc9hzj?=
 =?us-ascii?Q?wwrKfTRpwb/psEkZiIkorHG4y8TIaaz76qTDuKh4zbT0aleliXKQkoEaAru5?=
 =?us-ascii?Q?p19jVj+xm8yWIk5F1v7cXhjdpj9eb+l7JGT882CjXMzJiclSUdkYIuk4tRkz?=
 =?us-ascii?Q?/7TOjm7j/0v01wvDmLCtnoTagrv/kHNGQuxnONLnpmVyKnWom1k+Ehggc8Yp?=
 =?us-ascii?Q?IKYSVq+JF92LYOejAzRXKSFZ1cUALDi5Vr1oN1hCwuBIkWeDtTnKIOqosVs5?=
 =?us-ascii?Q?oBtQFpedsSz4vo1WtYz4RggG8PQwU93zHKtEcBsclgxMO5bcLtpdkLi9skyV?=
 =?us-ascii?Q?FZr3ktWsO5+Xizx3RkPgrIUFfU03AUV9lCRDde2CnGUhEWiBbFQuDF0geJz3?=
 =?us-ascii?Q?iyngHe672PaEOLv8n6UlKaamN51fc8nljFP0ZKe+4dEah54vMrGngmEMKNWN?=
 =?us-ascii?Q?Xrh6BrFlpIKeRid/VEND1jL8tI7a0G+uWqnnCGXranJwS/UhhHQmgV0cYAtQ?=
 =?us-ascii?Q?MPOveMvKnimhmhCMeMF98JPtcqDRzT2AEQ/qjPN68cqXhkaNKjMsYMFV/ArO?=
 =?us-ascii?Q?u4PLZXkem+j/fig5+bZEI6y+qvyAhjFVkJZgY+fpVKn7b1FKgpHWHlevvzVN?=
 =?us-ascii?Q?q4oB4n3wzCHOHqeJLfL1TCbK65pCdGPpniLbGLJtDLik/YUmsTwgPorM37/V?=
 =?us-ascii?Q?f7JjMFPgPuLbL5JAkgLmeW4sqKEgzfEZZq9nNUpk1R2cYIcwif4SVZFFjUww?=
 =?us-ascii?Q?hYLDgu1Zk9dPWUI5AYm/rUCD2q3nCqJjCDhhOeZeAJ0rucS8NAKNT7Z2flBh?=
 =?us-ascii?Q?/LVWAU2dgHtyZ3v+NPdlSI8U4G7Ph1tmPECUBc3CnNns2pGbECvhaVul5dxx?=
 =?us-ascii?Q?Uq+g+2SAIscLGITz43tfpxa3jAhHGrGxu0XtwxrpknngH+qM1n0PnwLeD3f1?=
 =?us-ascii?Q?tc/io/dAkHweGdERjmwUtAlklH4ZIAGoSZ8TYm4t?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dc3cc2-74e8-467c-0085-08db830ad79e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 19:04:39.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J00QMIviCYjcdhlhCLWO1tf4cvZM9/+rUgH7z76hLa666sOdyAXlFD3TziTUPNkhjzmSODdYkTHpPdtFJ313Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184215

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


