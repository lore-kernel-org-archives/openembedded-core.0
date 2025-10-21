Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D2CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:10:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.85])
 by mx.groups.io with SMTP id smtpd.web11.18567.1761066610560243713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=nQsf/RWT;
 spf=pass (domain: navimatix.de, ip: 52.101.84.85, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPhX4isQmB59LMG/Nt/VudnTcI+R9M6EzSrdK5x+hKKshjqTVtXmH+TNWVi2l+GYrGRW0QYl3CgKtN0QGMVrq7a5UCPHrXVCvEVoOMlEQsMNAXQrVnAyURyKP37LX8djvr+HzzzLA3L0KAGKprgw0zqqOGQHinALSG0VftkjQMY/PhotYPCyKWalTmyJ5MgKdbKcdFuMtqPx9FRN8c92K+HYh0E8bPojy6gRPbwCFgFXvJZ9rzEkI8OCCKiviblI7h5Yivo/EdITPvZioII351Uavk8TIIKLtwIp2Ws7qGdnKKDia9Kds8nNXicohDBoCqQ3lyqKaHuUZs7QwHpeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y11Gz4zFGLbUv4cyuVftxPy+n2/qwpYljO26J38COz0=;
 b=knTxj2BleK64q4lLTMBFNoKurbdcu3QaWexdhGn4Wf8Bwnwxzb9+gIb96Xtu7fk/FhPNbcNMhul0HT8kr/EEmTFBSYVIHcYbpOuB7NsmNOuzTqEjt0M6GA/m2xrY8Q470owgm4Lu/4Rn8SY06Z1Ztkxh2Qot3jk9VGsqhTArBlCeYrnPlzRIsDryVcbmUlD5f0Vbe7Fe7FU/mfQif8tC1JQ/TQQUXIOUW1A1crX7M2Tm3+OkTVBYeBd+j/q+FPlFzW+YtCgs2QimBVuYEDMgyOQBpMKvFzoIJ/dBeOLZgXWtOoDMpAqPW9Nwj+7P7o15iD4/omC655wlAdZgIyWDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y11Gz4zFGLbUv4cyuVftxPy+n2/qwpYljO26J38COz0=;
 b=nQsf/RWTlNAT0InO4YAUBgvljZ/oV4B7K4Wfgve1xkfFNtTWZdNVMVv8yG2WxxOwZ5iEKlnuElxG/GF5YRgZ+jhJZ/r+Y9nLoWfv13EwMdTKOoL9AhUUcxnO2c53RPGCu9bhevdaWJRNIjqpnhwqPlCIwXzKz6FMAwE+e52bvI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM7PR01MB6641.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 17:08:24 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9228.015; Tue, 21 Oct 2025 17:08:24 +0000
Date: Tue, 21 Oct 2025 19:08:22 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] gtk4: update 4.18.6 -> 4.20.2
Message-ID: <39074fba3e5a332212bab55f1cc6bcd8f925dee4.1761066338.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM7PR01MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb7c2c1-269c-4f51-ea42-08de10c471a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K96z1ohyUaeGUdbcD8Fq2NEcCqWUQ8JfBvW84VSJJ8voLS15o7Mu9Zpq6ofy?=
 =?us-ascii?Q?fGeu4dyT8wr4QOTgSws7bp0uR3TeWkX2dxqEI7lwhVk2q0/XI+pGb28HUhbn?=
 =?us-ascii?Q?zVJ7n323VkvuSuCib9AKp2YGRwrRdo+wWqfLEwPU9Ky29sgi3Ox6hKxB9N8P?=
 =?us-ascii?Q?fuJnJ74j5aejypTxhgrMsdKOWQ1MRhMaAoA0uTtlW3uA7k420ap4FgVvOZF9?=
 =?us-ascii?Q?XmQiSTkocjUnpdtY6NG2Z9U36SJ/HQ2F05Nr0BSXJcJ52dBgDBL6hSGYX4fV?=
 =?us-ascii?Q?KBxEWdj6DBs99uVX8ul4kiQG22fg+UCG/t+rfwaKG8JlIoAIDGFaGRjV/6ui?=
 =?us-ascii?Q?udO40kwacrQjN5mQ2UojuIIiwqdZkr9uGkwUDuOkDGcFbW9SANrgGLCQTrXB?=
 =?us-ascii?Q?uHND2lm2qB4pTKj0zcD2Of4Gn9ir3d5giS3cxTD9Df1+3d75sBkIPgLTEH7T?=
 =?us-ascii?Q?cfSegFUKuahEi0jCRABJ+CQiwpqig7vDMCzB3yVd8YeyTlgNrRDgaBaqYIMV?=
 =?us-ascii?Q?e5lxSHflj9lhQX778/kjVJGWCqDz0/5OcndK1LNv0OZNNR2jhCDWedaBF2/d?=
 =?us-ascii?Q?6TeybLET8eCfEuej0bxX4l6x+b//TIhTNK52cRbj1QZk7G+D17S2pn9AD8Io?=
 =?us-ascii?Q?Xr6R18b9snoAgajc+M92bxra/L/JpAGp/J0va68vJWT030GLtVmNpwu1sKLi?=
 =?us-ascii?Q?TQ66VVoY06LTfkQGUEqhBeLPxi2lkQ1Y0m9En1N8szUkAXHaK69z1DqyGzYu?=
 =?us-ascii?Q?TFli6fN/fW0mfR8C1ipZDqEultSzwPtWwrotj+/iV1fEZkefZsuy4I8QFggU?=
 =?us-ascii?Q?GPOTWwwZCpaEr5wNKQFcWeuREsCwcxUO0oHqrHAEkcHinf3OIf0F6+E9Ld7R?=
 =?us-ascii?Q?225AYGCGJ0q/7eRWXepsL+iUiJOZ5QBrkYTbcGuvwhXeexTvzm9jvbYiyUwo?=
 =?us-ascii?Q?NGniOYwMf2oEqbJmA+HyseQJ+bcHUlhBic+sKEu4fsrjmKjPpWU0S+hOw7Uu?=
 =?us-ascii?Q?bUxH8Ny9w6Ve7eVWSX+esjvkeh6k7C1jJj3FTOLrVVTP3+nfZ1PD7CrghiJy?=
 =?us-ascii?Q?6Qq0hgLfafwub3VCmD86DwvPY4/N9oc/sYGa6a/93mMSocVpwaO3wvqwtLuD?=
 =?us-ascii?Q?5np9yzCOCUGlZzijnE7w6+IaF0vun5di6MjEayatrRWUNA7Fzlvgji7YZ59D?=
 =?us-ascii?Q?gG1lQMXvBqiGpiLMiqSEB42j+M4NxRrBb2vRq8BHCss65Wiuo6y1lHa5u7Qf?=
 =?us-ascii?Q?wQPHt2uPDmWxh/XP3j801QRDU1EWg7dONsna6YHe9ruOGkftwweyQ6/96PGw?=
 =?us-ascii?Q?DpfO/RAtWeJ9evMyYvxcrEx14aR533gI7tzyjqZHrVUWVFfYaVRjqehHgi6P?=
 =?us-ascii?Q?PEdjUnyJLHKKDPOVy9KRE+txC93kRsAEggcOD8ddJqSxDorgNwz2tU5fkTRq?=
 =?us-ascii?Q?rc9phf0I8GX/mRbEOapx4NAFMdPEpESf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GgYThVSjMjn5e8rzrcw27EVDVl461+FpPqjnSDXVy6zAiSxW40osRKj+lseA?=
 =?us-ascii?Q?hz50Da9xEgE0aBf6Mu4HxgcQ3G00bRnUIbtwEGxmFMs5hi6MMBrLZjVu4M6F?=
 =?us-ascii?Q?HCHTHf0HPJaDBbSGs6svR/zrUAsGRxI6HuQnXXsh+yzjCpRhqssOUiJpyIdy?=
 =?us-ascii?Q?AV15O8Tde4+bLwgcbTF2pAXzYcpMQ7HBX6EAKvLfK/04fGuQj7oXemEC/T+q?=
 =?us-ascii?Q?ueLqar2F8/Do7S4A/40f34GmQBAWrurl3zZwlFTk5G1Tqmu05OJgWwPSE0AI?=
 =?us-ascii?Q?DzV1gYUB9INd9smgjqxoEbWEP3ua9QV8QqxtFbhRQ/9J3SMjnohNbP6EtiDM?=
 =?us-ascii?Q?lJ1SmPhtZZFFnvzb2JHrWVbB/IA3p5e6vn/n8InTGkmRWiyFv4tPGdxobWbQ?=
 =?us-ascii?Q?qZf1ZJy1c54ACRdtph7Fz1JZCYLampUjSPqTX26wW5c2xboxAT+2E0mwEvn8?=
 =?us-ascii?Q?82iTY1hV/kht9Pl7zOmgaxk4d2mBxYMArZOHexsGlkzX4gJP31P1LEIaJdY5?=
 =?us-ascii?Q?c6UcDwupRxqBtzPha197u/SP2hWXRpJATidAtg03SrjlZhafmaj9C572IpkI?=
 =?us-ascii?Q?gGDCp5HbCphgU7kcUSQMWJS0d8shQqOa12BOsKZkNo+AHkMrzV/ssyBT+Yf2?=
 =?us-ascii?Q?abnP92ndpDrLR8ZApi9HWeuDnmc/cUoon0qDkQH91ocmEVAz9I52mxnZNkfC?=
 =?us-ascii?Q?54XDlgxbhLOz5XXjp1DHCa93pTB/Qn/gLVoWzAQPhN6jkT6tbEZpAs5fwvNz?=
 =?us-ascii?Q?gKe9r/dmmy46KD2TtUpiXC3lewGtYupYoq1P0RZ59buNNrrGSCtBGQxrD9KC?=
 =?us-ascii?Q?oZXfKLyFYFlE53FBB4blZqeMlXx1PEGYsKyqIrPdGqD5FBt0XhPBivU9R8+i?=
 =?us-ascii?Q?tZe8kazoOfyg6JA6lYxDknYccTJku3R6PERsB5gHIHRTYPyFCOg9cDFlM47N?=
 =?us-ascii?Q?x334d8VxZtSLX3oSLUImyBLi6pXIMc2EFloY86eSM7NtHfwwhplewOSYLo0l?=
 =?us-ascii?Q?ASBzq4n4VeE4fLZLcCPa8YICPDaB5msslcDw1gJ9j1Q6xUmqym/U9e3Q+hID?=
 =?us-ascii?Q?2nTedWpj665qLheHPhZVBi10EMz7dlifeZ+iFqlWkB7ub2Y2DOFj2Q8Etaqr?=
 =?us-ascii?Q?eY11qjE3jybDwLCxZRfu1t9Tbm/n4YQ3m/pbdrWJgfqM07SPUH7ZIjLtTWOQ?=
 =?us-ascii?Q?z4GxwMn9bN5t0LkaHvgixBH7S+GM18F80pmC3Cdzps4jU0TLvE1klH5gWS7a?=
 =?us-ascii?Q?v0KN9X384Sv2Ziy5uuQoPjLVbd7/zYMvs+YEMVSeNB+FnXX5RTUwQUrMLr/V?=
 =?us-ascii?Q?4SDDCHRIATtz1UjcRsrBWLRXgGAc5pLCIQqRnob0dJ1Xm6m92I2bzS4TLR7B?=
 =?us-ascii?Q?iXiUD6ECaL1qFBpssvFUSIKN8tmk/hELdTAWJ38xsGiuqbWjOKdGbFXfjx8h?=
 =?us-ascii?Q?4km5yu7ki5y7tee0F8rRPlOfW9e44Awr6q/tJfTROMIAciX5f9ENWvRMEkwC?=
 =?us-ascii?Q?IdDIqI0zE0Yo9r+s70b6PFQQmMDdRD8U6LD8O0hJhLtp/RY1VDlyaxIBj2ZV?=
 =?us-ascii?Q?kHSpBtve/M1hpVFKpinQ/OkHruE1+2hEuV3f6x4bwArVHOjg9B+IcJ/4ieIY?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb7c2c1-269c-4f51-ea42-08de10c471a3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:08:24.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sl+pcD5o/C2dKAa0u2uwrK1w3M7Ji/pH2XlIjOJHALNQNmoz7xpP93oTpoueReKU96zfhtVKO6/NIw5MwcwzYBUzOcGgHHxp/B41OI0aPP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 17:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225156

From: Markus Volk <f_l_k@t-online.de>

Changelog: [https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.2/NEWS]

- add bash-completion to FILES to avoid an installed-vs-shipped issue
- remove gtk4-printbackend-cups package
- update download URL from ftp.gnome.org to download.gnome.org

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb}         | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb} (89%)

Changes since v1:

  - Fixed author email

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.20.2.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
index 2d24468dcc..ee6a84d7c2 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
@@ -37,8 +37,8 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz=
"
=20
-SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03=
cc7becefffd0fa"
+SRC_URI =3D "https://download.gnome.org/sources/gtk/${MAJ_VER}/gtk-${PV}.t=
ar.xz"
+SRC_URI[sha256sum] =3D "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f9=
0e010e10bddc5c"
=20
 S =3D "${UNPACKDIR}/gtk-${PV}"
=20
@@ -69,7 +69,7 @@ PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DI=
STRO_FEATURES', 'x11', d)
 PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-spi2=
-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxre=
nder libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3Df=
alse,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudprovi=
ders=3Ddisabled,libcloudproviders"
-PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,cu=
ps,cups gtk4-printbackend-cups"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,cu=
ps,cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
@@ -84,6 +84,7 @@ CFLAGS +=3D "-Wno-error=3Dint-conversion"
 LIBV =3D "4.0.0"
=20
 FILES:${PN}:append =3D " \
+    ${datadir}/bash-completion \
     ${datadir}/glib-2.0/schemas/ \
     ${datadir}/gtk-4.0/emoji/ \
     ${datadir}/metainfo/ \
@@ -121,15 +122,9 @@ RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland", =
"wayland-protocols", "", d)}"
=20
-PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
 python populate_packages:prepend () {
     import os.path
=20
-    gtk_libdir =3D d.expand('${libdir}/gtk-4.0/${LIBV}')
-    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
-
-    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$',=
 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
-
     if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
 }
--=20
2.51.0


