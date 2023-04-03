Return-Path: <thomas.de_schampheleire@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949D2C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 14:37:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.105])
 by mx.groups.io with SMTP id smtpd.web11.72234.1680532648934453557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 07:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nokia.com header.s=selector2 header.b=YcENAhRg;
 spf=pass (domain: nokia.com, ip: 40.107.22.105, mailfrom: thomas.de_schampheleire@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzJfFfJE3GnlNi3RZZY4yOmzklCzO/DtEhpQa+dH4NEVS0PnLEGJkgGBGl2qDw+6Wus4AbqwkI1aXFNIyuEvZqc8mVG1q8xHE308oefF6L5D/DycrwxMqGqXY5eQQ0rP4QwPcLo9Xr+dq0+FUF7lC2g469D2OUWN1Chw5T2sE1lbkKBZm3/vB7BZy3xMRq/lilL4bpZadh/oqnNuWg8GVZu6mgeX9X673vdCNYWbYCa35+G9FbXQl/omktgQuY6VYYsMUeywf+pi6WvMc1GE2tnrKD/PszIkjfhW0peY1unWcsSkSSSNkwunLbUJDnUe0+4WxvNRHBJ8NV9XVWcJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwStPBKKwjdZUVpbv7HcuAbRB7h6hua8tnbKt17wjyE=;
 b=DbivikG7800Q2fy8ypm+/95L6wXO87Is3p12OA2hch/cfHNQc5YK50EEzNE04Z4OJq0Iy9D777LUa7DQJSRDEPXmJ6Wbc4u6VRJsXHjYOwwDpl1lJ12dceqBOoVUIHAmVg9tD+qSe4TzPk0ktBBf0iL8IZhHlNqH5n2/t4AkvLGvruZJBjZCO47DvG5Fe+C4rywPed+J0BMdspv85vEvR6pKy1z696UadyX5M9ot/WGnMYgQqxHHJbM07y6OM/DPBT+ZNYorTC2+75OuZNH5Ol7SDvLOv8GlRyTg54I1nQKXyELJNUUkWjelFAYdW6A4sMcgY3E5SOZnwBZa1fZEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwStPBKKwjdZUVpbv7HcuAbRB7h6hua8tnbKt17wjyE=;
 b=YcENAhRgfzaQgWNU5peHs4tMbN0W+KYLEDE85c7qx147KMOws4rQDBGoQuymSxRZs6FB0lWfaryMYT3sBP6c0RYLC4LbvmwGSFQKzsQPz8tTyYHeTsOHl6DSieiC2GnLczG4n9k/sKIDvvfUs6ZZmDT8zbSEqfnkjQervDrJpioqeyr4oh0Q6+2YOuW/sLAaTRqX2n27ksvqnJ5ZRNyPYCs7ik4DT2sr4MXtoGqsjyvFBZriQE4PFQHOkGZA5DS1h4uOBh4YomJcHW8vlvAWzqkvY/Og10Fcxk1SJgpZa1UL7hp/i760PBZy4RgwKLWGmwaAoo1sEEsbZk+wV+lDBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from VI1PR0702MB3711.eurprd07.prod.outlook.com (2603:10a6:803:5::28)
 by AM7PR07MB6562.eurprd07.prod.outlook.com (2603:10a6:20b:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:37:25 +0000
Received: from VI1PR0702MB3711.eurprd07.prod.outlook.com
 ([fe80::1489:951:b252:d571]) by VI1PR0702MB3711.eurprd07.prod.outlook.com
 ([fe80::1489:951:b252:d571%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:37:25 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: openembedded-core@lists.openembedded.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PATCH 1/2] qemu: retain default trace backend if 'ust' is not enabled
Date: Mon,  3 Apr 2023 16:37:29 +0200
Message-ID: <20230403143730.26123-1-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::28) To VI1PR0702MB3711.eurprd07.prod.outlook.com
 (2603:10a6:803:5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0702MB3711:EE_|AM7PR07MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8a52df-f88e-4d6a-e2d8-08db3450f141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R8gHDQRXmLDMsI81WKU7T2aMHipaQEfTCsXE3wk3OHia9kg/YTJOR0MA3DXo5o0a12qDlHkSh7avUzdEVF/3xTY5fw+lByOMmFObSQR5mRg6bf2QFY3DYbluUC8ijcpNMwYao1bD2FAMyYPIUECjpE1+5e6FBoKv0riANqN+Cpy8GrjSLDri+4prjOER8FOEsMzkiTCB16np4MQV3ml4ZYk80mzVj07A8uxXV6vrOo/MBNUtML74JoagqKAQxj2XC+bn3HqijRVLWhx0NH1zlqtUl1ZUlRypUYzh6BBbBXLaPfl84p8OxyfXR8DrH3i+KW6ACQuP5W8k5jGO48EyOMdaUkC7fj3+gP/yjDR+pXVT7eavdqWvHQ/FEZnONeqj0LCfOJo3LxD6jVQ7k2Tnz1VAHg8DvkhfsUfWgDb94al4yecWe+oAW/gocdPKgDktYF7Iv2GqX3csPLB1ufIu7mNJ136+zjhm7oI6OxWpTOLEBNx1I1PSQmh9sXpGW6icBK5cNRQumBknvOWW7CFJiFbFe4RCG1fIUoMCG8SF9CBoRFlrz3gsXJKbpkAOcjHe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0702MB3711.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199021)(2906002)(38100700002)(5660300002)(82960400001)(8936002)(66476007)(66556008)(66946007)(41300700001)(4326008)(6916009)(8676002)(36756003)(1076003)(316002)(83380400001)(2616005)(86362001)(478600001)(186003)(6512007)(107886003)(6506007)(26005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z841c+TJG1gx/yGzP3NKUB1nUciuEMwcNseyT0DPJP81/VPooY+F8wtox1Va?=
 =?us-ascii?Q?Q1yzOfoQmM3oOs05IIAQOk/0HwCfKGTZ8isT5Zhm6Z/0ocfTWE7B/aehgWht?=
 =?us-ascii?Q?P6Vyw8YXSSF/IUCi2fb10ReXacotbAW8LpwC3osgVhRqqNNObRA7V4nV/PJK?=
 =?us-ascii?Q?kVz17YEEKr/NksA8JpZF5s1pzSJE92Mxp3lgoa2b52EswXHVGGPsF41XTUDz?=
 =?us-ascii?Q?cpvupi37cl1RVa1Ab6OUfh7edQPY/tdxgoPt5+vP/3GBEmqTy10WSFeJfHa3?=
 =?us-ascii?Q?Cz7/dZ0Bsl6hwk3EJENESdeK6ELL1H6pdj6B+UQG8h+oew34PHxDCxOQZyRB?=
 =?us-ascii?Q?XOeksFzwS50QPEFHnaqbNy6zqlM/Bs4CNSk2GxgdLG974vSSuQsEn2dyO7pq?=
 =?us-ascii?Q?EEgFynhrS6z9vUuTVPqaoNF3uiWYESe8t3uFpTgFmPZn0DL9JEXBbX3Qu1mI?=
 =?us-ascii?Q?PRNj+pRBT5dFm8M7EHs1NxQK3HnxK/WLtU7Yz5l3+uP8ikaIGthtG/fdt0zK?=
 =?us-ascii?Q?P66qJl7jj95z9+nteiEescX/TjpGjhrgInCN533UWaNgYk4EGCAM+wEVf6Ny?=
 =?us-ascii?Q?WzxKke6au1vRTCJ/YPnJmc7k9AoFA1bn7zMepxI5vXIwKhS/kdlCJwkfFm5e?=
 =?us-ascii?Q?FRPzV/8hZIgql0or3dgKs0tPsCNkIMzYZ1lAhnVUzvaPVQMgCRsBJazmxh5L?=
 =?us-ascii?Q?p0mn3MggY9mhzV0HjasHri297B2d9sQZ5s6vlZ6q1fOtm0tznMYMUSmH8QO6?=
 =?us-ascii?Q?roWE1vM7YfhbGw9YgTxzeAAJkDoW+818VirvNjeXczKjOfL3ZzjnrYrVDlVA?=
 =?us-ascii?Q?kSAnp2HLWSmcRX9BS7LrIKIc1ZrS6ETP4jeYsdKNUWYTSJxlFMKYCKhrHz15?=
 =?us-ascii?Q?+ZbmpI1m6pBFzuLkQ8EhtKZ9mE/6Pj8QuCIBjhTqaSnM9FXTDvZZIxvb5E/E?=
 =?us-ascii?Q?GMC5B6o8/oVWNPtov0hAKvzfavGBXa5ESOmZugdBgz6VJPjPyfQIdFaF799x?=
 =?us-ascii?Q?122f+CWohN+31AUC9fi2yWouw19/KC3vO9qMoOcl5CCkJD3H2ZXxwFUfiALY?=
 =?us-ascii?Q?chZ9BVvu5v0yfKpeKi5pvP4l90N69SjdJnRF22hsS9YO8yWgP9e8EJfd4rrA?=
 =?us-ascii?Q?lUBadtgGyweWe2a8oXGvpFxQwpEwN/mBLHUQvqVidI3rbCgR2cEGld4ub8TB?=
 =?us-ascii?Q?mxzrGNipLAeLg8uSnATAMZf0H+zPVF6RQ0MXH9lQVe+zJ6eEzSwB38eY4tso?=
 =?us-ascii?Q?rRTXVx6Yrh5jUE254MVpSI5t5fT/su3pFNtE+hBjpDIr7RuQlAGrC3Wj32WZ?=
 =?us-ascii?Q?bwey10dfH6nzqCko7kXU/xejDgowrSZokJYqQfN1iui7835mey+evgT22/FQ?=
 =?us-ascii?Q?boCFbiUOj8hJUOKkhSD+UoWLZaCCP8AuAjkvhjxWxBGkhVuOyfIoTaCZrAu4?=
 =?us-ascii?Q?lYgJcTSXzfuSiZrPLa2iHN45CLxt7DciSeRQLLd/bsuxrzg9+WUeOQ3EzexR?=
 =?us-ascii?Q?XmSXEx03bS30IHxilddEIlGYT7Zx+ohphjnyffq6Fbbi1GAz5NBdV2QC+6vu?=
 =?us-ascii?Q?SYWIwv3Yg7xsTCY196wD4EIjQhJoVSto8L4y0ZIJxKg7gnv/ncGxW+/v0NGO?=
 =?us-ascii?Q?TGI8tAk608hLTr6YABl7NWU=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8a52df-f88e-4d6a-e2d8-08db3450f141
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0702MB3711.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:37:25.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZV6AY11b0h9q7GGBASkk4PlZDVDiewHQAd48N8EMU4qJpTS915c9Y1REOJ5YihXLUWI1zUUWEsLY9I50MlRaeOkX1KP6zI5evUB7gvQJZ8aaEbyiURKaAtt7nZhOceD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6562
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 14:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179635

The qemu build system enables the 'log' trace backend by default, if no
explicit choice was made with '--enable-trace-backend=3DCHOICE'.

However, the qemu recipe uses the following PACKAGECONFIG line:
    PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-bac=
kend=3Dnop,lttng-ust,"

which means that the 'nop' trace backend will be explicitly selected if the
'ust' feature is not enabled. The 'nop' backend removes almost all trace
points at compile time, and thus basically means 'disable tracing'.

To retain the default trace backend if 'ust' is not enabled, the above
PACKAGECONFIG line should either explicitly fall back to the 'log' backend,
or not provide any value for the 'disabled' case. This commit chooses the
latter to not make any assumption about the upstream default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index b41055fe5d..ae99a9e87b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -207,7 +207,7 @@ PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-=
libudev,eudev"
 PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
-PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-backen=
d=3Dnop,lttng-ust,"
+PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
 PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
--=20
2.39.2


