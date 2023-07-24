Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC589C04A6A
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:47:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.5608.1690231619658110944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=HZ1TeaF1;
 spf=pass (domain: welotec.com, ip: 40.107.21.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMqPLiB90dKNf9IeU0tBMv5NLLbcucPDXhgX2bBaXHDTJ1kjuHaM05WOy+LOOG50h+wrDl5luwPQCsBHrR1sRN71Jv2XNpQ6iKfJIVWcD3zRJd7XXy4b5JIKslbXi//e6ZNFnBcVH6N/tc05G/a8oL+A3J40Enb5dLgeqVaapRLv3Nkt7Lhe4L2oORFD+my2HSMtpycqFoACC6MwHSjmiRdcoatxGH/xmqzGcB/EMV5i8sQDijarna96iJXdhfOONUVuhsEPy2uT3N9ib+Hrykw5uYpT6WSCDA6Kd925bFp0dQHtiwAjTr3+QPlgNfqh9PEZrHPvLqf1cbQGsn6w/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=D3IBjai6CYXGVeJ2ZnHXTQ82wCLSeE/lX53eOfbAkrv/YzLRjmtnDR8gQQqSq3amPiXFpq7KoniLG088Sp/aZesmM10Fc3+ZX3T66rdV4krWFDohess7ns7ws3hfNA7saTkj/7YjPyYyKNmy+zKebDiZwBXNLF2QKba8NFHRqRsoVyute1j895VtctevMp5hlYjkgZKU1KNzI6Ae6ml1V02OLQmNA8SlTLqMgFVBlUn8kiXLjsUKBkNI/u6T94siHn7bHM58DKsW+Exko90IDRYuFsOCFcLlfpNbIk8zCD9QBA7gxAgpL2QWStgOdZR2voKXQfh9WEgQYapJXFStZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=HZ1TeaF1wEhetyR3qo0KF37F/Bz4QokIPSWXHyhuBHxrKcEt+1sLSeMRRguS7hOYbIcIxA/21B30qFfDJBke7Kt9KAAC9tqqYUY58/3VOHHr7IR/iYlLcclDowFLg044AYNBMUlLwjh6j7Lhp+koFsP36cmqhOhMPlfZCg1A+r4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:46:57 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:46:57 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v10][master-next 2/5] package.bbclass: add support for ACLs and xattr
Date: Mon, 24 Jul 2023 22:46:36 +0200
Message-ID: <20230724204639.353571-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204639.353571-1-p.lobacz@welotec.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: ba01c7e3-0e17-4f0d-0f26-08db8c871ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iDEMy/Zq5o0XYIiATMweqKfVph67zh9RIcmgdJaYK+mfxoJYDmFKl1rJa7LhUqnFOs34uHS6tBGE72tv/3HqLxtXY6D9AIqpkWJ9otJ4Opbt4OWReOdDgdaa5tSvC+WA506e2KFSuxCZ2kiXM0jeo/9mHfkypcwfoq0d3zHlhZAdpiaPLpLAF6GSN6BA3x3XzEWNEyTPE3tEg2zUjwyRoV9KSrUwyC/9uSjMAkLUOdrss9qfX/AX8cppMAc7BuuVVCm77eG0n68CFpcZOu/yAJluSYCkprruSSyizEbbWdUSTMNUHyShPZwPBVOkNbmiwdCJ0OU0kFRLK11JIIAzihPK0cAQg3P6uwHalKSNG6EJmbc1y/DZEDUHHcKBKJejeQapIDb7V5BXvNourx8TODj4zv64LoEAXQMHTcKe7tvfcy3i2YUXh1fMXSmi8U/ICuQteTOBU2QydWEIKcya3FsKarkBCpxW63LAx/Cf5WLODLyKsSHHYteH7eWzcA8QVEVIWqFea/+kXvxsc18YifArrBompNsjKKN/A2nZufHGzeOAca3dW8O508NU/JND8inr0gFRXGkW7qLuMBaq5ZDRFj1QgZD7bhCwbmhJ4NNny7XFFoyhTx8DyEWG88Ii
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(451199021)(186003)(26005)(1076003)(6506007)(5660300002)(36756003)(8676002)(8936002)(2906002)(2616005)(66574015)(86362001)(107886003)(38350700002)(38100700002)(52116002)(83380400001)(6486002)(6512007)(6666004)(316002)(66556008)(6916009)(4326008)(66946007)(66476007)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xf4syj3UrzJd8hHB8g3l0lvB8Xb7kKZs7eXMh6psceC1p2VZXvNVsMHd63ie?=
 =?us-ascii?Q?13vsj5Tc/yNfbhSKeuRHo64BYgra6WjxW0Aj8+giVz6K8XPWmLeR32yeTVk2?=
 =?us-ascii?Q?l1z7QtbuOhBuu0O2Q0UrpYE9kQlW0WnSF6NclTR4K1iohll7jYlSMVHH1rFp?=
 =?us-ascii?Q?v0sDw+yh5LZLfEnncNBI1aTRhbNphh3YliWMf4T/Ut/2OsPXn/W2ND3FPLZP?=
 =?us-ascii?Q?vdKufIG97zJ7Bvs6DpxyJoeMkbkDMipSfA4PgdJUo8H2jvvUGfIWbJOraPJC?=
 =?us-ascii?Q?cWXyXN+S+JcMk2nbxfKKW+XRLhp01Er3y/QgSYBlcWY377jrFK2VaVcRrg3x?=
 =?us-ascii?Q?zOaEk7rSwTADCzj026BKEXhihfTdizt9+/aqWYLjUvR+NC/FYyf4ap8iDT2h?=
 =?us-ascii?Q?AtlIwodhiWlBACWvwXrPyCLnCyVcWKh6FOE92Mp08vDC0mdOnASoaBPSWuHu?=
 =?us-ascii?Q?rizdWQ2JTXu8WcNsJTjYoYINypAYUQB3+BXSTVmeZkAv4YA2r7W3grLtr3yq?=
 =?us-ascii?Q?Ip7giNgyBtKXMfkAx+K2znI0oU5HmX1EkczUdrnnsIVJnHRDg+cVSaURurXa?=
 =?us-ascii?Q?19Mj42OLarO8g/JWGBZlDDF/3pGSTthksZD9vBdTy2M5zJe7plNzD/3AUtHU?=
 =?us-ascii?Q?Xhx3hM8WsEigjWoucPoDysdjEdGpfD7Pg5M8OmdliYuF8oaYf0D59S01iosg?=
 =?us-ascii?Q?jLRpdbmhvk+zmgNfTPbWElJieIfbFTHQb7hcuIKX+Gxn8aWEGi4VBHrvPzFI?=
 =?us-ascii?Q?4LFu1RZhLle+qTaruKtkDY2pISXthjQzzfRyUZBu9neqRythUZrbu/vzoOmx?=
 =?us-ascii?Q?VTSYt0IDWfD/hEuigU3EyGvsabTZ04996iYBH3DFRL1VKxdcRlOsoenuYJkR?=
 =?us-ascii?Q?dw2cSufTmGu/sWoDG7+w9xWmVUxJjdBKX4L/ApyBXiuZtKGYaPNpcjXA8SgE?=
 =?us-ascii?Q?naTgDhicp+ug12Md3x75cxYUmNgb1m7x1eiA3YUQizMGZ+Y8sOXURJauolrx?=
 =?us-ascii?Q?UREhRTXYwNWkEnbjdkrU5h+wSvr/FuCSm9FpZdmYgQ2dNDWxL29JHdreUhbj?=
 =?us-ascii?Q?94bVMT1X+9WTUuCYgsT2X9DhW626StK1av1ZzuVM6WsLad/0LZ4uudBvQ96d?=
 =?us-ascii?Q?tKkxj1CE+kDTqM+qtQwoDorfgfF9xDKv6ZeGUq9mbW/ro7GwVLY5CsOxX1PB?=
 =?us-ascii?Q?Lmplwv1Y0ttuoHUg3wSh2QOeqlgAOXH9uh6a4DYIGtcG1hZSzRGkUvb0nusi?=
 =?us-ascii?Q?itoo/8Mt81yfmSWPFx2I5iaJeQZroYvgOlXQbjnZRhSl+j/lURsfCKip5rCZ?=
 =?us-ascii?Q?2XJUecNHVyUJ9xg8n10uwQZXnHdLgsodsfwaUy7/QSgVDwcfy9GG9nXyRTTU?=
 =?us-ascii?Q?vakWIe4tKb4iolIgSonFceeXLoo/Cj0jLwS5g9H46TvvsZjOadSkS2hfVSSq?=
 =?us-ascii?Q?Vpc0VrLVrDrYx5kddqgWdmszGfC3oYqNoKEbIpbqczMGX9QSe3zJkvh6m6jK?=
 =?us-ascii?Q?OL5p3OvZ7XiRas9qcHHsvlZ70OQRVGEP9Ogc/Qz3LKSP037YgrVk9Id1KpRv?=
 =?us-ascii?Q?hcF6xMOpMSrOZoNDF4EbE0avIyWGtPPzDxb87mlO?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba01c7e3-0e17-4f0d-0f26-08db8c871ec3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:46:56.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CagfXGWlUxiaQhFV7EFWCE5BVmV6N6bsxY0sOxZDtsyWMp/Aduo2lnAjjSQ0RHksq15jBCb1x96JnxWnxSkfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184814

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


