Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928CEC677F1
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 22:52:18 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.44])
 by mx.groups.io with SMTP id smtpd.web10.103845.1673650334479937897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 14:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=BTApIc4X;
 spf=pass (domain: nxp.com, ip: 40.107.15.44, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/KMOWsWoBbnsZ/xKwHRMgJovyEnFfVMwwUpaEYlI1EiXgU2FIiVjcrn4Jb8HzeUCBMt25vfUgAsjk1LSFPBnF9GVPUG2SaSgc0QmzD0l76oJ6mmVdLmgqIN6pnNMw1HOIZ4xt18qMpUznYDg78QogN38ibZ0VM9CSd8F1y+dlUh1X1felBKg926+tJziIqSft48YlgG7JNvVtgV5owmbdNFxFxnouMWkx6BE9j6TxeYbbIl5JPV1kY/piQDDe+R3G6/BZJjgt4pmI3swtpj54vPHYaxgnfR/HOtRcV4dbgUOrVzYTdmdXUylv/kx8DL0OQL2zHzxzwZ161v/vipcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB0MNnPfHK2/PJTn8BD26e8FGOBQ64DH3cv2HAtfLTg=;
 b=apaLOZ71c+PdkJgTABSI+9oIBXdMH/EP11RPOaRwLQ3M873oPSNrYBOvQ/pG020ScFgO80B2XCZ2cfLi3rZer/F8H0wFdXbN424wSywqkMtXDtepzB13dGGOxKEwJpsprBd9FmSkbiQuc/877763bqoraOMKL4qD5UccbfEaf8CqGKciavchmIezEakcedZhpPvsQltomdj0pd9/JXIllLok7HOaJSjSYp9odqn459Fg03yNd/bdMMOpeXDAuNCyMn8fxqGhR12xBRA5LH8j6Uzqy+eELkxpGR2Hur0LDeKQ9cZLBtTV81cXHKdh3jwcvVmr5GFCqQhiDie6WvEmOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB0MNnPfHK2/PJTn8BD26e8FGOBQ64DH3cv2HAtfLTg=;
 b=BTApIc4XfcDeuatpFzIjjANP0u4zX32P9y8KKGC4ZC4/LxX65USuxlSkgtmpSNljKNIspz1FOwCklH+gtimvNUu4LrOQQj/6JmiydQ2GQDwUdT4Sa5Cr9dUk17la/INdafhpeswx44lijjjkiTMzDh2J6uEhhetQfrZTOBTHDiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AM9PR04MB8777.eurprd04.prod.outlook.com (2603:10a6:20b:408::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 22:52:11 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d%7]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 22:52:11 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] gstreamer1.0-plugins-good: Fix libsoup runtime dependency
Date: Fri, 13 Jan 2023 16:51:55 -0600
Message-ID: <20230113225155.1730922-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::47) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AM9PR04MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 2769fb25-c8a8-4e42-adb6-08daf5b8ce1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vfmq8xq83qCofb42h+MFK2fwHCxWHd6b39PCZ2MnTp3Q7meNSh6YxjH4e6P7YmRUf6CT2cU5dEQMlx3VCaS7KI+UJJNenHpzibGalq23aQFx1Z0p65JZqT3AiuoZBjRP/3Ol+s8AAPkLrd1FObUwCBAt9+HQkOhPKTILAeuwMuowRAlMne7Iti3mIW3bXWHcgfv64PC4QtC2Pn4WHMsgN084bA8Yz58yzyIMloUOR9lLs5Q+zWZMIGkW0nqX2n0Sz53t8R3LWDGas5nmAI4LBvrUfwplEEuGXUi2FFM3nCry2qC+fFVcmB8du16i16ZqSh3rnWvNTCO/0hm+I4J98JO3vr34zkTrlqf+aonW4BFS2f02DmrbzpRgSp4ru4Li676/XVNmIbDOgShmWPeorZutlgkarZQQ3/NiX3U5pG1vqyQTwBg2D+q7zVDHlW/sxsLMJOTCI+sOIw+dzoF17uA1YfQK5lKFIuWZA+Y4/JV7sFe8Rn3R4Fg72yrXhyQPvXHq7O0CjdTy1wzIJhflwxaEd+0j9aT1qv+QihlJylTU4MHhhR+BAordj5soz6kPiGlo1zw7Laf+TGt6Q/cFp3606nGfoo21gSG8c4dgiTaMcT7NqkXZ9FCP+GSnazLkiZcH7lVX450K4Pwruq1Bkr+7Qr97Ncvj2D/9UEL4NvR4DQO+sLs75l9FO+mArMRpGc7a6MfT/fKAR8NWpRo4Kw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(44832011)(8936002)(5660300002)(41300700001)(4326008)(66946007)(66556008)(6916009)(316002)(8676002)(66476007)(2906002)(6486002)(478600001)(52116002)(38100700002)(38350700002)(26005)(6512007)(6506007)(6666004)(36756003)(186003)(1076003)(86362001)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ll0YuwD1zDcpACRezCQwTWAOpOUn+nN7wCedt6kLoUk0OEitDFxIoXc/OAhd?=
 =?us-ascii?Q?H7DvAcJVW8p1x1po1IcFRGtKqBinlo6fd+hSX2y2zrI0Xh+NLKz/ZvnyPBlq?=
 =?us-ascii?Q?0hSOwSQh04srkNCQ7Ts+nogUlVaCWMjxLlp7+VWFTDTuR6KBZ7JUlAc34ske?=
 =?us-ascii?Q?SPqJg/4TjG/khOKTU9VrmbEsGI66Oeysj6erny/lcP9WAarxYbZOfhL31bIa?=
 =?us-ascii?Q?YmHbhs91x8MSg0mQLbzApY0iF8DlJD5/Ndx4Cj0MA8aXLp+1/o7Ld20vsryJ?=
 =?us-ascii?Q?WlMTsIEaJVFuZMqkpCuL6zowd94CldkRnDSHd8m7Nwqhsi/xHnNyEtRKhPkf?=
 =?us-ascii?Q?pUb0eQofWW4L7tWeR7hL38NJhLD4UKptmi2yczC3BYiyiagII9CQ5aozqDau?=
 =?us-ascii?Q?qhqIM9+QmTQUwB9LOO+Xp7L2PJ9t8J+G3Px8nAQg4Bj2usYSmmNNkadspcOW?=
 =?us-ascii?Q?UW50uRrkUOBTRGBPqJPnK6I2NTd8ZV6YUBeow1Zecdy1BMePI7LW3BSpBOiZ?=
 =?us-ascii?Q?FrjHEGPh4rzfaI9+CVAwRQ6WhDZlLst/eAKQsn+CcftMfMvaof0WniYg6qZM?=
 =?us-ascii?Q?abhiFTvzWY7PodjERfCc5CdWvSTFUoYwhF2GHnE0SpqlAEX9/kkdVvobzn5A?=
 =?us-ascii?Q?UlCssm9B8+FIFNXfs9JKmcvq0MUl4qFrhutiYpdatyEUF4t4sz/WIn2uCBqf?=
 =?us-ascii?Q?jRUjxlYsD2e5ZZ97a289hmsfNLsN29qb5Ko7lGCcvK3kg5aFK3jUiaboUddz?=
 =?us-ascii?Q?P1Jv8WWcyATw7woHfz65FaIniQX5r6fMuLbIXLUYiQiLyVY0ZIHkYvWPETQ0?=
 =?us-ascii?Q?mfYDhxRu4Hss4/txglhrc5p45QIRoEDqkGXx/uq4QtXKDeZ1pdR1Rc6dZg2v?=
 =?us-ascii?Q?pPjPUXJv7vZ0+LBgzLZZC52kNYDxxqdzWeUAW0QT5tAHLrUQpB6foJrNC7Rj?=
 =?us-ascii?Q?tI1ttpiYbX1klIhbXxUkzoioQawlbgu+CQrv4wryLTNOXBjv19NRGrsgBuvG?=
 =?us-ascii?Q?8NaUvBoaAs5e56NLNqdLOGqDcX0bH1++F8HOIzqL7TsarSXNvnyHJKs4lRJb?=
 =?us-ascii?Q?YNvVYJte+hgVPo2gTDDVcYmPlBBfCmwlNubN9CvzdmwN/u03SM6Ccc1CXUos?=
 =?us-ascii?Q?QXvia1jmyHzTbPf9FQdNtuHH9IVSO5kbq+W0+hbCGS4ZpWR+aWk/XDh+wpH3?=
 =?us-ascii?Q?+miWCRZUtLNJjDMnG1UhHmYPlcv4OyZpMrzsq9XHfXQ7OknyL/BwMLjrD1Hf?=
 =?us-ascii?Q?f6YmR3ZRSsAxidRc5QZO4+CmCZCg9kQUHMWFpuVFl2P1dbG9IWPGGJobTdna?=
 =?us-ascii?Q?FzsOgnSNmGPq/QiDwd5W/+BgZ+7bvryZ4qWS+VaA2WqRfsrcQ0de/ZpescE+?=
 =?us-ascii?Q?vKcsJfy1i2VlfwgNCLSqkqloyLwYbNfOMxBD5LXaiy49aXqCLweEWw+YdyQ4?=
 =?us-ascii?Q?GuOB4vpFf38eKakdrCUrF4nQ0GJbpSkMMgSOJlMsOZB8ogb8lmUMvjWo6fCA?=
 =?us-ascii?Q?SO+QctJYWjo+M60DNmbQCwLlncxrDtQuOruk+eYTyRvbIvz7tl3t7o8kfYwv?=
 =?us-ascii?Q?V0hEQuCq+1yLv3GqO/5Dx8lz9hoL9VZszgqWq/Qr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2769fb25-c8a8-4e42-adb6-08daf5b8ce1d
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 22:52:10.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VR5K2dc7OISC8DGNibE2uJmARbbXOKbCWA9+OE5nYX/ptSZ2yAq77l2aXJVjEuEo+gsKtdppF4m/UicILVhZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 22:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175847

The runtime dependency on libsoup set via PACKAGECONFIG does not work.
The problem is the dependency is placed on the main package, but the
soup package has no dependency on the main package.

I considered modifying the call to do_split_packages from
gstreamer1.0-plugins-packaging.inc, changing extra_depends from '' to
None:

```
    extra_depends  -- extra runtime dependencies (RDEPENDS) to be set for
                      all packages. The default value of None causes a
                      dependency on the main package (${PN}) - if you do
                      not want this, pass '' for this parameter.
```

However, the problem with this solution is that it does add the runtime
dependency to _all_ such split packages.

So, fix the problem with an explicit runtime dependency.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.5.bb      | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.=
5.bb
index f7ade89ef8..ed48c57311 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
 DEPENDS +=3D "gstreamer1.0-plugins-base libcap zlib"
 RPROVIDES:${PN}-pulseaudio +=3D "${PN}-pulse"
 RPROVIDES:${PN}-soup +=3D "${PN}-souphttpsrc"
+RDEPENDS:${PN}-soup +=3D "${@bb.utils.contains('PACKAGECONFIG', 'soup2', '=
libsoup-2.4', 'libsoup', d)}"
=20
 PACKAGECONFIG_SOUP ?=3D "soup3"
=20
@@ -52,13 +53,8 @@ PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,=
-Dv4l2-libv4l2=3Ddisabled,v4l-
 PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mpg1=
23"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,pulsea=
udio"
 PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase qtd=
eclarative qtbase-native ${QT5WAYLANDDEPENDS}"
-# Starting with version 1.20, the GStreamer soup plugin loads libsoup with=
 dlopen()
-# instead of linking to it. And instead of using the default libsoup C hea=
ders, it
-# uses its own stub header. Consequently, objdump will not show the libsou=
p .so as
-# a dependency, and libsoup won't be added to an image. Fix this by settin=
g libsoup
-# as RDEPEND.
-PACKAGECONFIG[soup2] =3D "-Dsoup=3Denabled,,libsoup-2.4,libsoup-2.4,,soup3=
"
-PACKAGECONFIG[soup3] =3D "-Dsoup=3Denabled,,libsoup,libsoup,,soup2"
+PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,,,,soup3"
+PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,,,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,speex"
 PACKAGECONFIG[rpi]        =3D "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisable=
d,userland"
 PACKAGECONFIG[taglib]     =3D "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,tagl=
ib"
--=20
2.25.1


