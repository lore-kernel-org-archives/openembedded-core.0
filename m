Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C03C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 16:25:40 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web11.143313.1673799930160511808
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 08:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=jE2r7DSm;
 spf=pass (domain: nxp.com, ip: 40.107.8.82, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1wgwX5pXGt7UT3AlBBIO2+EomNkgWf8mEoXTjHXedHt0S2qQpxiBs8saEMJhhpBOqwOIV4gx+AURRPrNAK2a+Ub5kfmyOI+rvrGSx9QvA/MHjmfnA/Mj+RcAZSVW7tvqssOcx0TUold8snyodqzs3Kt6EO+jeakYFXcXTnQNxhHQba901b1YFefiokm/2Iw0DK4Mage7svsBUxRGKcLgRKtZJ/ox0H3KTq1h3f9Yysj7e49+ondM/pw/Qmpwny54QZpoi0Q8hW9L8J7mCGqRseJnIvDY3VOVqCY2pL9Ct6ty9LMn2QhGxWgOQvgayVyzg6mGuOCd4cV48/EuA47QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOF6V3+Y6/73Il3qM/tA8Qe6gkVaLF2wdGoc4Cnowys=;
 b=k9EMnSRHbBAwawSsXPedN1sZ0m74OAm/OrD+7EYbwJnikdffSXWHyEqGULDpXRAGTBL9usstoOorhXjxPJTCjIo/PFleOLUK3MOQgkYCTb9OwqZMTCP9YhX90L0GZUIGJE/zsFAjLoBVBP4kx3kO3N+fQKF/sdJGxPIdlo3nCQrcsNQEczOL1poW8p7LfO96S0MRmcaQI/Vh3JeumDdE8RY9I0SRp0fSbCnVbqfwd/qQbllr3wYYwkjFNZoZTGNNhIP6L9q2lP0iiewsBPt+uyl9n7aHlYQqQwtYp1y5wclEyY6dvxfxwpIMhQ4PwmQsfEajP4RlSseD9rdMbKgRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOF6V3+Y6/73Il3qM/tA8Qe6gkVaLF2wdGoc4Cnowys=;
 b=jE2r7DSmb57VnxxSQvLd/iRnwe4Lv6+5mfuipK57HW6gkCaF/zMpAsdwM+oBG9SGHsePWYnl/uP6lQcjbPG2zP8dsLFcLqAPmJgpwkP/DPSSGDekSTySwQNIFZbJrea5HNoCeI0/32i2j3nA35QHphazR5jspGKV3ppKDUfeQjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Sun, 15 Jan
 2023 16:25:26 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d%6]) with mapi id 15.20.5986.021; Sun, 15 Jan 2023
 16:25:26 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core][PATCH v3] gstreamer1.0-plugins-good: Fix libsoup runtime dependency
Date: Sun, 15 Jan 2023 10:25:11 -0600
Message-ID: <20230115162511.2244846-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::33) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 90eba904-7c52-46e1-508a-08daf7151c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NV2+iez7ZwqBFj0BNQlSXwykzZZiKJAuMQM4Q3rCi2QqslS344iWWEKPvrSoQc+dVhGeBv345o4Fno1FXgzjgasVg6dmWAJMxMejVoY2ZQgYuV/pVSBwZHPtxndQqRISVIts+u2rwx3LcYFqf9rlBxZ/HVLTH64xIPmgPyESjHMIt2RPVs8qWFK44XjepIaqpeAladEWZ7SsNHRr52HCboYHjDfzimI1A9BY/oMBxM53wpkXKRbVP9BZ4HAGIHTzvtqPT16evBKBMuFSZp3ZDBENkrw5VpzlCVKtBJOUpQLu6Px53AYjQVvStAbdPQSpqPmjATBbJA+NgD1Wocg3vjOIOqMaZa8M4uEJkAlooEvrprfw6l3MqidxrWmP85Kamjzf5wU3pJQRpCu1ha08Ttiau5I9i7lnxjiduij6S8bJTMpw+lgCSZiZmsaN9m4h8oNQSkYnsYPHe/dqW2qGKuATvkFIvrAWkUHh+MRny5oDLBj6s2p/k9/4FOmIbin7zRx4lqHstFveToF/ZLsO+15Y18G3OaTjVT6UZXnm0YQdwMZssWRISCylPLN4kJXjLFFXE4f5cMYIGXOmhr8cDi9nHMUCY1yBoWvO5ZM6V5qI84meB47r2zLbWrHdDdJR0Br/wqh6TYcmmRNrmLty4DRsLI3cmiKartk3zDGY4lxvSyi0ST0UwyaKs6CthgFLSRNMwBwmRYzxBOkOh8oB7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(66556008)(66946007)(41300700001)(2616005)(66476007)(186003)(26005)(6512007)(8676002)(4326008)(6916009)(36756003)(86362001)(83380400001)(5660300002)(38350700002)(8936002)(6666004)(478600001)(52116002)(6506007)(1076003)(316002)(38100700002)(2906002)(6486002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PZVW6+sQP70P6GclBanlLe3esYUY4V+9cJ7sJK0PR7jnZL7pCHbKoTNmkqPz?=
 =?us-ascii?Q?kJiqqyuZVq+VmckA1Bb/mCbSccRrLTIKcouYEeqO1TBcPcHb2E51UgRRUGUT?=
 =?us-ascii?Q?8bqLTpiF53VfCSfBPsLFzUhjNa63TumXLboXnCKRW0b+fPxO3cDvpnwGxSeq?=
 =?us-ascii?Q?dkFX8kKiT0pzEhLnSbmSh20BjQHpOjAtZZVKyAB2KRsnPI6ax8CtWLmAG2/G?=
 =?us-ascii?Q?VkFRP+ZjKLJMqT1XLr9cOVvJWaWF7EENvSC6hj+G3Sj2wSlvqSB7cFxHYDZg?=
 =?us-ascii?Q?uBek6qi4JL2GSXWsfATlrrrF80pjr2puGolguq2GvoGoDuHnbKck9yLb3VIe?=
 =?us-ascii?Q?Pl5ZMD7JTvEwWkji0psFBt24GaX9xkAq9zeGDLc1UcTaHNcMvpIJ8VI7V5pi?=
 =?us-ascii?Q?0QHqjbp1EJd/pbufZm7I5EezXf9x9rHMYt7cwf7XY4NZ7IkEz48Zm+tjt4li?=
 =?us-ascii?Q?nzHpaBzjUuVMoDtGGokmutAFmei9FWNBe9ozcZYmaGxnBICuMd52hQMAeOcG?=
 =?us-ascii?Q?eXo0yqu/cz/+vSVPkzGHWSj0a9crog22yDvyBmKm2+DxfrI5uFSGDPBFOHxv?=
 =?us-ascii?Q?BgUzQJKTzZoa/IHf/u2IYX0K/VxAGPrshxVyuMP1Wzc4CiSbqAY+McBxXlIi?=
 =?us-ascii?Q?jos0pfk6D6M70+KjYZqfPOM+mx+TiTh4Aj3mE063XHLnQQEVOg6sUb0WmGOM?=
 =?us-ascii?Q?zCdISC438R5dFs5C3awVtciLK8FUpuOp2dxjKK2d/3fXXr8o1bphoiGIGsVa?=
 =?us-ascii?Q?BYF3f/JSeBgTZcRznk0GPbDap2CF+ZVTv5BRcn91j5S5mF7q8myA2U8AIY2/?=
 =?us-ascii?Q?zYQ/lGiG1K3GMMclkTAg1uWcwh5M0FoEa4x1ydEnCL5QoflmXZkh2eD12+az?=
 =?us-ascii?Q?OFJwb1fJDtqimhw7xKYvpTsa33494fCob8k82fqS9QGTcrzBFwH0tqvuFVkz?=
 =?us-ascii?Q?a8jeQhR21j6+kt8kS9GEhsyHQDhAa9nmytgqt7NqayFeaauv90ZqQqyZ0GdV?=
 =?us-ascii?Q?KgxTukKPYdW7kloU3bn39dRaSU7Hdzradxh56wtx0KWqdDIMjW4mrY1CqaUK?=
 =?us-ascii?Q?v9FiG5RTRiiDNfvRN8NLBUfnxaYH44R8S+qH+Is2bKVMviAJmoOv92nTi3Ei?=
 =?us-ascii?Q?ik6yCpMjoC2Q26eooz6HYSdL0E8KwEv7/wN2CG8DBJaAeGObc76MHSrSQ+uY?=
 =?us-ascii?Q?LwS9X0ELU+uNgbVAf4hwMXtrYpcOi9IeZqpWgiv8sWleqY2ErjSGQdGBa40v?=
 =?us-ascii?Q?uYwnxr3S74ksLumHGQJucKCMJHvZwVtryconmpbZYonS6kkzqBZMJTDlW2Zv?=
 =?us-ascii?Q?H9++pI6KIXb/RFzBrksIm0XBJFqN0AaU5Gb6KSN06mHjnSPgU84CWEYyEfu/?=
 =?us-ascii?Q?VPPZtP8ZLgQRO+3pfPNe8FH4UvmzAHTnSUXdgQOZrOiUZsTx0so0uSPziuKe?=
 =?us-ascii?Q?5uW7b0Oz9Cv16uZh3lG25RZsplOsIieMpi7V+WWPvJSloiyxv1Dn6bFORBss?=
 =?us-ascii?Q?AdL4Ec7yrwS4b/X67EHtftw5MYSnmsmtsJCjN+9J2956/aY0vbKrfvvY1Zrq?=
 =?us-ascii?Q?voa9MAHbYT/h+cil3jBU7c9huHJGOCWNQcbWsmkpK5CX21a6iz61cIkKHxkP?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eba904-7c52-46e1-508a-08daf7151c30
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 16:25:26.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lpr2WjoVutPDb/8LhhSfDCy/14NKQaTmIC46MBOzNkbOCl7ymGm8Jgbb/JUxckiK2/GQwZ9lsTwO/KApMjhCkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 16:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175889

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
index f7ade89ef8..0bd953743e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
 DEPENDS +=3D "gstreamer1.0-plugins-base libcap zlib"
 RPROVIDES:${PN}-pulseaudio +=3D "${PN}-pulse"
 RPROVIDES:${PN}-soup +=3D "${PN}-souphttpsrc"
+RDEPENDS:${PN}-soup +=3D "${MLPREFIX}${@bb.utils.contains('PACKAGECONFIG',=
 'soup2', 'libsoup-2.4', 'libsoup', d)}"
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
+PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,speex"
 PACKAGECONFIG[rpi]        =3D "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisable=
d,userland"
 PACKAGECONFIG[taglib]     =3D "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,tagl=
ib"
--=20
2.25.1


