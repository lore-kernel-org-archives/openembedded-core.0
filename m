Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B9FC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:06:09 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.130])
 by mx.groups.io with SMTP id smtpd.web10.49556.1742209556295276925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uE8gL3Ca;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.71.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4TzFGDY1XDX5sOlif1pOLya0gNiBYM9w9/FNw9GV6nlrE7o2/JFZFH50PkeB7wtk4/bGSOBwodlDUSpVmWh+qgxXmN5QRSb/7hbgi5b/wQMYaaSVdMjAqdtO3FQgEplRPY9gFoKuqFq3xILm7JAbAkgjCGqg7ozmQ3WSZWoaW8g4pdy4xTj29MEDKKFnJnQIAEm1rAbrmTTYfFrwp8+GU6qHkdp2mSk0ThBtnol7Su0ixxeBzeIsQph5uTS2EDZ0t7s8Hl9yYqwiqlLt6fzkOBRb0/e48t4Afc4DGeqwbkVREiRwiWlB9Eif0ujxavtN4iD1rQ7GfD1+MHYevIAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9Ie1od0/2Pjj1+UPEJEIr3BV/WSK4khWYnxWPGWKOk=;
 b=WtT0IUe3OAzNQQaCNUh4gAeNSv1T+SMBGCq+n+xZlfzUvT5UpOcmefavjOkL56ODp3tD0/rHE/4uAI04QjBhFguR60HUh4Cm/m8ki8Wi44ID+84qE5LzkYCIpbfE/HDTyuuMVHKX1lLP+iDT7eUwCFF04/f2u9KqHJ2kOT6dS9IyEsEFniO6oHVF3XxGkTD9rXf3Y2vM2ytZ8LBiNjKk261LtXF5bFykM5O/dmB8D5Spr5Q9QewbiU/7r5gT2rAkeZn6apsX9Ksa1RTZaaOSAgZoLIxPKJxvmN1gLImOOncdKXrLMOmGreaavsSpUz3mbWqRVCHXzEIlLyRtGkYcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9Ie1od0/2Pjj1+UPEJEIr3BV/WSK4khWYnxWPGWKOk=;
 b=uE8gL3CazOcVpvHd3s2PCU7wc5bdIueExNeYdJHBODkrGQNwrhOlhqfTdap/TPfNYzBTbIsF0X0vgKwTdac1CI2q1ntI4YuJ9f+2WX38SpNHbxFGOpwQxzDZSlLZSz8XZjIWt83Cteb3HSSwtifA/KLVmekemLVr2AGAESft+5QEdW2HMGtnDkwM+3lRq5zuNqTKNIp2xEHcDhjV2287L057jZRGNE821yJAiBBF2njCJ0fQlGaW+o7e7HPzuEgd+Iituu2nefPbxI6ywK1mq6BNNUuSVhyXZ/RWim7tzWPgTwszyvROMYJYZma+b/L7dKLVI/aLsCMjKd9arMygcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8485.eurprd06.prod.outlook.com (2603:10a6:10:36f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:05:54 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:05:54 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Qi.Chen@windriver.com,
	raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] Add PREFERRED_RPROVIDER_dbus-x11 variable
Date: Mon, 17 Mar 2025 11:05:19 +0000
Message-ID: <20250317110519.1562513-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317110519.1562513-1-niko.mauno@vaisala.com>
References: <20250317110519.1562513-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00007A87.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::614) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 801e67cd-638c-4e86-9ab1-08dd6543afac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xeas1UPXSdpyFvHz2nMIKpmFnQN3gfwM8H/AA35lLo5ptOK8HvhBcxigl4H+?=
 =?us-ascii?Q?G9fH/meRvKdKB3OzGVTZMOnSi8TyvxGr0NvfdaMlekG6RC4fUAQxY2g72+Fj?=
 =?us-ascii?Q?KS3t6bRI3vvu5NQ4DCDlBoCm6VmPcebXAu24r9a9ZAFabqeMa4uWZ3Tcs2f3?=
 =?us-ascii?Q?ax+REzwvnqTMYVNkdozPKiqjuytWEjwDVNQdYZX25kkjAUSqBdRG7wAcc6s4?=
 =?us-ascii?Q?gQjKPydYMB65+yJhehsLtNB+dHtYFyeqMX/EeaSxzHtY2aahbaooVqJQ4m83?=
 =?us-ascii?Q?2WYzukCx7aZzP9eY/r3xGiFq9DDAsv706CEUNNtMeopooVOTu9NtwplEubd1?=
 =?us-ascii?Q?BV8ft+7fOxYaxeaX8GrjV1JnT7r8G02ELf+6fyku02lXNNeO1MFLqD4qSRu9?=
 =?us-ascii?Q?aLNhuRH7rZC8M37JJxWlQ/2wKyDGmPDZ0MFcEtC6ysoy7GDttZu5UtvLsjxz?=
 =?us-ascii?Q?+U71V5hcDx4SSDioIvlDRXGI7lSr/f9OY57YY+8caLySW5qJkEmqnv3+9msj?=
 =?us-ascii?Q?gn9jE+Biq8TRqEDsZlxtXh2af72VAfI0In+qDo9Z62JgJ1dEsv3chf1GtQoA?=
 =?us-ascii?Q?WKY84116Ew/iWqE/dMmXK4RqnR2fawpqqOGd5eyu5RjF7OWzZ2Sbl28emw6W?=
 =?us-ascii?Q?uKaYUs0oFCP1xW3jS27eOM9TXbx+2uPbagOdD+RO2Y+yIDh8knJ7/H87rnR6?=
 =?us-ascii?Q?qDgRSsBjZsgtHHuLZfTWBNblESC0f+cCitn+3V4p89XRc61K4boc43FYG0v7?=
 =?us-ascii?Q?dsJYrNE2bFtDoeq9Wgg7jd3P/0EpSSRgmiHg2yaeYVuPgskyxr8rMHirsbw/?=
 =?us-ascii?Q?nAS3DVod8R53N2XWaSjdqNu9ZXiqnJoYRBFuB+unghuisFNsQnnvqE1wWBL9?=
 =?us-ascii?Q?5LbijJkD6EOd8/nBZkEASo712+Q9eDJ5pcbreyebV/HbdFXYqWHxV2qo6cUi?=
 =?us-ascii?Q?XpFSL1O2TeiI4tTjed7GE3DTJ0dCG+rH/6S9wjw5/6+0ozbrDiUJVeFpniHx?=
 =?us-ascii?Q?33T4csLvPdwwlcyvI+DFe8+OLCrEOqHQhWWN6ppVxof6IQsroYuwTg+QRdGG?=
 =?us-ascii?Q?pqQ4VDNs2+ZV/5ToZTM/ojeVgBy1HQzQ8H6b53deKtY9gmHUGEb2CtOnkKgH?=
 =?us-ascii?Q?P/oorzfaL4v7fatag/VCM9TGwmBIRq9RNYGq9W1BNqfAMtFvfM9o2+vjHc6z?=
 =?us-ascii?Q?ykZBOcl08FedtJ+I6dYqd2AyiOcJxBVfx8ljDLB3N7golbQ+/w3o1XLIXoTu?=
 =?us-ascii?Q?6nJhoqsyUIvd7tsWX+dO/wv2H9ACKAG6vFQRhZBD9hO9KQW39EEQiXYzzKh7?=
 =?us-ascii?Q?+51AR7ZK8Iy7K3Vq6nrzdPornabWKf7O2YkGLonia05OGRNp2iPizL4U4t69?=
 =?us-ascii?Q?rhEn9JlYEkybDFexCL2dkQdoDcGIRizzqDYM4PQrVSPgqmVKSQfV2bSniZma?=
 =?us-ascii?Q?6x2414dKeml3CaxuajjVpxOdmExoJK1G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jqp6BJTsSy7HxHSmAy8jiKgmhPslJP46YwmkSMmF+kwfx/UbirHl4Hb6HwkI?=
 =?us-ascii?Q?UPMRY4qxBTQtckwaHMiUphxPCj74KV+bwYWeiDyDHHng5iyvTIFOUHkaGr2B?=
 =?us-ascii?Q?s6FiOcDv9NSAUUUdtlYNdiVRV3jEvP81rHf0qw7oufWAuettyLlp+17Lw7N4?=
 =?us-ascii?Q?1th6nltVpUJCqwaxq+bxacUV8PiGxm3H4qL/tZf9DnhaA38IrAoeL0lmJ+d0?=
 =?us-ascii?Q?yDWtWIpOQVtsXqkDT9vvbNmagzNhBbHLliCIKiN0TxE8o07ZDWmDVg/tcq8i?=
 =?us-ascii?Q?n3GM9zkHARJ2NN4x+Ckg/kE3LgGIYSM2b4rqCL/TX/aA3hAC7qWvxd4G3qFK?=
 =?us-ascii?Q?YYNl3pXCFtqi/HHafhgDMmohKE5Da6te14IJ0OUPESixKDvqYfp9Hq1KBYwj?=
 =?us-ascii?Q?8x+Q0gjsaEMWjT+dGYHpVQ1IB8YjNQ6fngaC2HDc2HKRmOstvEbVmz7LM5gg?=
 =?us-ascii?Q?ajlo7g84sZWAlipAyYeNfD2bG5oTqCL/fIx2h5PGDa/zFVfGLePFFWZUtmet?=
 =?us-ascii?Q?nmehqnEmQhWSJgR87DRT3wKkkwiyQtZwN7grNeUKOVV6wtoFNPAXXji+txHc?=
 =?us-ascii?Q?AbvKaHOkeWGJx/NIL4nznmXdUwrY1rqqcNVmRjwWSmV0MuldlgYxojzPRpub?=
 =?us-ascii?Q?i5Q/jooi7onMPPfQCf6HnAsOsomTtkz/YLotXrRgHU7SqA35gbQn4O6/QPxw?=
 =?us-ascii?Q?b1J6Ool0P0bn3wqGMYdVXb/hqGfWt/N25HZzkoQrga0xeBXRUuPN5l/oZAkm?=
 =?us-ascii?Q?saxpanErjBR8pP6onlkkHgR5S2df4K0qdgmQvQGUkqiofkp5t4WyLRN4BP9E?=
 =?us-ascii?Q?wDsUaXWThMun3QGATfLlOkaw7eVPBNCfPeQvw2aJIduny/jbz5VptfHen+Au?=
 =?us-ascii?Q?4QH8DBhDV2x7TuZXeWThJN1XkGByODAIcbdU1j4tpC8mRnHmukDLvaLZNGoo?=
 =?us-ascii?Q?+O0A63Zf9qMciBaRHpyFl4t/k0AY/qZ/hgG4tyMjiiAF4h/PeqXgdxXsPKk+?=
 =?us-ascii?Q?5NLmWbYWc4EBbF2Q2n+zoT3aYV2KRdcdCOfJR12WCw45rWsDPnuL+J0c0Tq8?=
 =?us-ascii?Q?4fWRDpgR2rKjG/A88WlH5+c8eIbYauTcqViHW+jL7C3hOrOhSNn4lPaSOBto?=
 =?us-ascii?Q?lkH4A0VAcyw6Aksc6ZaukzOFDCfy82KFu4EeRyhqVj7JCGInGRaFeHU1VYbe?=
 =?us-ascii?Q?ZlVOvGX8S9zyniVWd8/puGdRB4FxdxPsKsL5O7gXNAcuBrbEbTKSusOhZZM+?=
 =?us-ascii?Q?8jOQkBK7ivJpT9OrlqcW5jTFkRZPIPTodzMiOWBdKGgZdvk6UgAT1dQ42IoP?=
 =?us-ascii?Q?1q0R/kwb+rTg08f0CJJ0Y6Fplq7Vcs5mxKdAGhUONeEYKrtO4LyORdgTFwSc?=
 =?us-ascii?Q?Q4DfSZq2DYoRowMOZ3YuonBJY9RcxiL5XSgYCn3GsFGTWF1XaRgwdtFQ53q5?=
 =?us-ascii?Q?gojvP6z9CbrvXzm2wYo3TRlgn5NU4BLvRvdLsIh5Eh53aqeZuYNuADNgaLr+?=
 =?us-ascii?Q?LSQIMa/I+kufYFkonzLzrnX1KjuDKit5WFXWGjSEnWgjGIgnSktoEBqDCnXD?=
 =?us-ascii?Q?taKROCB867uMlj/25fn30m5ZEKsxCjgK/A9P8ERiTlnxYBD3aN82pZ9yK7kl?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801e67cd-638c-4e86-9ab1-08dd6543afac
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:05:54.2358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gu8KokAcvcVFM4o6koW0c54J9mCdMPb7iHv5IMxcnkZm3RD42o3xe4l8hviBgjszqhb8xBoCk3rOOmkGXEmaJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8485
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213072

Use new PREFERRED_RPROVIDER_dbus-x11 variable to determine dbus-x11
provider. This facilitates using the new VIRTUAL-RUNTIME_dbus variable
for selecting preferred D-Bus implementation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/distro/include/default-providers.inc           | 1 +
 meta/recipes-core/dbus/dbus-glib_0.112.bb                | 3 ++-
 meta/recipes-core/dbus/dbus_1.16.2.bb                    | 9 ++++-----
 .../packagegroups/packagegroup-core-x11.bb               | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index cebd0400f4..5c4ff3094c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -60,6 +60,7 @@ PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconfig"
 PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconfig"
 PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-native"
 PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
+PREFERRED_RPROVIDER_dbus-x11 ?=3D "${VIRTUAL-RUNTIME_dbus}"
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
=20
diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/=
dbus/dbus-glib_0.112.bb
index 4acf435694..e0912e5d1e 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -33,7 +33,8 @@ FILES:${PN}-bash-completion +=3D "${libexecdir}/dbus-bash=
-completion-helper"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
=20
-RDEPENDS:${PN}-tests +=3D "dbus-x11"
+RDEPENDS:${PN}-tests:class-target +=3D "${PREFERRED_RPROVIDER_dbus-x11}"
+RDEPENDS:${PN}-tests:class-native +=3D "dbus"
 FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 0160f403a1..ac9d73da9a 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -67,12 +67,11 @@ CONFFILES:${PN} =3D "${sysconfdir}/dbus-1/system.conf $=
{sysconfdir}/dbus-1/session
=20
 DEBIANNAME:${PN} =3D "dbus-1"
=20
-OLDPKGNAME =3D "dbus-x11"
-OLDPKGNAME:class-nativesdk =3D ""
-
 # for compatibility
-RPROVIDES:${PN} =3D "${OLDPKGNAME}"
-RREPLACES:${PN} +=3D "${OLDPKGNAME}"
+RPROVIDES:${PN}:class-target =3D "dbus-x11"
+RPROVIDES:${PN}:class-native =3D "dbus-x11"
+RREPLACES:${PN}:class-target +=3D "dbus-x11"
+RREPLACES:${PN}:class-native +=3D "dbus-x11"
=20
 FILES:${PN} =3D "${bindir}/dbus-daemon* \
                ${bindir}/dbus-cleanup-sockets \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b=
/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 91db7ed33b..26cb588999 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -31,5 +31,5 @@ RDEPENDS:${PN}-utils =3D "\
     xmodmap \
     xdpyinfo \
     xinput-calibrator=C2=A0\
-    dbus-x11 \
+    ${PREFERRED_RPROVIDER_dbus-x11} \
     "
--=20
2.39.5


