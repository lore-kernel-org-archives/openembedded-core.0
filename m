Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B241C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 12:56:05 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com (CWXP265CU009.outbound.protection.outlook.com [52.101.100.80])
 by mx.groups.io with SMTP id smtpd.web11.75014.1746534895480772385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 05:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@carallon.com header.s=selector1 header.b=gMBZb5Jn;
 spf=pass (domain: carallon.com, ip: 52.101.100.80, mailfrom: benjamin.shirley-quirk@carallon.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AY2F63bHo5HUV3aQGaXPwR2L7c8D0sbBRhMnmzlUjiGAA+NkyCLANiUhoxm5bpAnZUv82aoFPtwNnjGJzrUttSx83n9aCdLg7KI5PmWgEnDjwjyhgaLylbVkJ8sQAEBUWFczVMfPp3xB9CrXEzICf3iYnnjWXutqT0gypKsB6On6dfm1swzf8Ck/n3GkHxZQeRorugNDuENYDdvhRic3U5iJGaUbL8D4m/0pFJaKMvnfx74diHJthxLx+3LAsHRucmvRfDwaUSgWXWOqhFoT+I1YmVZBnsDWCujiVmWn0maEtyOoJVD01aiTxyWcbqHZhDVYwg+LmMVPx7+1Q0wL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAfTice6PSQlyS/ipsX6JK7qeSZYB1ZkizIZ0GmYuZs=;
 b=GVee07Rv09AIgspN69oqXkd0Ih2tZLvfYh6JwSXE5bNBCc5Of8tCgW/W4hJ4SZKQtTnUpa8Z4OrMAOzKM6O3NG+zo1uEmhkGMa8Uq0PfKMM9zWgZXAoc3rBQr5REUChaB1xJNeKOSmXAm4mtskz9f+xEN8m1EaKryiuJZ97Yu06kuijhPtsYkxj3gbgBYWFwlYRXEWMh9c+GWWXl8Z5kJH2xD2tuXjtDZzaboSy0vxrQg2zxdX2gXfSmiuyfyhyILV55hFFDtlVpfHA9FsJBFlN7/e6AHSzxp2FaY3P8/hHwvDO2JcEbuxxaxgNK6ZV3P7aD3axIy68fR1quiLjGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=carallon.com; dmarc=pass action=none header.from=carallon.com;
 dkim=pass header.d=carallon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=carallon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAfTice6PSQlyS/ipsX6JK7qeSZYB1ZkizIZ0GmYuZs=;
 b=gMBZb5JnasSX8DM+0w8uRgFsGXuSygEeQjY/O0y6CsCgRl5Y8jXnC3w4lbt1WdQbopC2Uh774Gn8bOG9S3EVxPRsS3HoG1R4LvByTA2DdivMp87s7MN9zgj364AxtyV4P+93oEbrX2w+PRcKxvBUQdIf17NJWrcsu1ZrOuSw4Y8=
Received: from LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:175::6)
 by CWXP265MB1782.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 12:34:49 +0000
Received: from LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM
 ([fe80::79bc:95c8:66ba:6cc8]) by LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM
 ([fe80::79bc:95c8:66ba:6cc8%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 12:34:49 +0000
From: Benjamin Shirley-Quirk <benjamin.shirley-quirk@carallon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel-yocto: sort patches by filename
Thread-Topic: [PATCH] kernel-yocto: sort patches by filename 
Thread-Index: AQHbvaJbb9XopCwoN0GZGWKteTpAug==
Date: Tue, 6 May 2025 12:34:48 +0000
Message-ID: 
 <LO0P265MB29537DEB8276706CFBB05913AA8E2@LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=carallon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB2953:EE_|CWXP265MB1782:EE_
x-ms-office365-filtering-correlation-id: 0c0e7729-5302-4843-cc5a-08dd8c9a641e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?4DbPgJ5zrl49xHRUWu/gQuTNjd0XxvAi1uSUG5AXzs0VkpDTNJnp4tT/EB?=
 =?iso-8859-1?Q?FiLeWU0DFQmPe/iz8YY55NlcKsyVVSGhiJwoLjNRC75CFkwPNvzwAZRGe2?=
 =?iso-8859-1?Q?TDBxBFCHMpffz+Z5mQGKMYgNw/AwVF7BMKw6Y9o3CWlfA2yK6CnMP4crnQ?=
 =?iso-8859-1?Q?jkZzbZfimnTVZnKWT/okeeSOxbbElfmZKJnlv/RYVxd1Xf43AyDwrKt/8a?=
 =?iso-8859-1?Q?7VtMQvNpoMq9juVTyIaV3PcR50BKc1AnMGNHYYbY3ROpIT1aqqSALaJ/cd?=
 =?iso-8859-1?Q?gN1n4cwD6/xecN+RP6wEyU+rZ3VqvXQhtaJ69wEtTo5No9GgxM1NlUSAaU?=
 =?iso-8859-1?Q?wVdeV+mYtN3Ortrv18exLTNI8loLahO9W0nbbITmm0+cmasYN4Pik8DtFz?=
 =?iso-8859-1?Q?YEkmpcCxjMG1UyzvKtUbr4lcHPmELwetFUbDvkZ0EWE+dPLiZ+8JBzA5TI?=
 =?iso-8859-1?Q?lUes/pDmk8AfxEcTzfh7JJcZt3VEDAzpg7QDTv5WiB+V8xzv2vE2BtuOd/?=
 =?iso-8859-1?Q?hJnDvVWmMHWDEtNENRQB1csY/fvuF0SXqtpH6mBV82MBFff6lo6yuCwSoC?=
 =?iso-8859-1?Q?lDSD2Tsk1mF9koQ8zxFDLqAUSWS1o+824B34eiK/92LFm6nijOMKEkk3a1?=
 =?iso-8859-1?Q?KF1nbud0UmRnDmN+SpQmhfh3w+DLQcsg7C+jMI0MIH8AUK2/pVJgvbb+IR?=
 =?iso-8859-1?Q?Rse0YyX6x2NHQ26szmrG7nJoLXinxZneticparxxCUuUVJGMMJwJo07kTS?=
 =?iso-8859-1?Q?zmjY7zQXTD19XYfVQSmfFj0i5U/pBFlSdrCGrCn2lWdxAnlFuJljJjL17r?=
 =?iso-8859-1?Q?/oxJgFnC+MROKIWm88sIZmNiykZhvSbtE4eic6HgTSVrrqIXqLCij6lF5B?=
 =?iso-8859-1?Q?TKYx8XAjNM9N6A5tF9ZBs3ASGOtBxjPb1LbrKBPPVPQ2pAVcAh3GnB4z4m?=
 =?iso-8859-1?Q?Ed2cXLIkWmEAckRTyUtX+B5och0lFgeLBKb6Bx2v5TNx0I66e2+KzePF+/?=
 =?iso-8859-1?Q?NIzC9mR95JzbMnh7qeP7ybMkxXyXyJ72a2UxeXTJ9c+DrwQ6q2AlhgzfyE?=
 =?iso-8859-1?Q?aQAhgR4/+lY8s8gB/mwNmYtvMvliTRuaztBU5vyebSFTP1xeke17YC70wV?=
 =?iso-8859-1?Q?7CHqVx9T+9frTTGsm7vgbgv/uZWKVuWPVstbR3CH2hXGB+Xrn8m1apJnir?=
 =?iso-8859-1?Q?L2Z5yTNZ+vNuv8hrhqTBoUr4QRJTixy8Rt5/B1T+aW53rVtNXmA/69YwZs?=
 =?iso-8859-1?Q?RcM3nfryuhZRZMMiLGN5wLe1Pxpc1t5FNrlQmpPfT7+jp/TVFAryHdjSrG?=
 =?iso-8859-1?Q?YUjtqWmjdPQb922ji5iLmuRxiZRbLGtXv53xvuF0YTUv3yz0KdeykNil5k?=
 =?iso-8859-1?Q?aSv42al1iNQBGlZuqwCogeevBfZ92p6sCCAAKWze5xByPYJQ/I0dtgk3F/?=
 =?iso-8859-1?Q?y3TEFeRKpmML2M5AvncAQx+eFRc7XahEekQZFvuLR/HnnCHSc4E/Ip3FxY?=
 =?iso-8859-1?Q?w/z2LhFHPB54oSGXyP7jsfoCw7WN72YRrJQmHkfLvzAg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(8096899003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ZbT8kRl1Wv5qbcLxZoALhCVflKtnxmwhVRJCoyixW4KdrsCWj9Ay4jzJs3?=
 =?iso-8859-1?Q?On5tFyqn2zjcab0mzF+oknNCEDUWUMg2e+gVKG930PyxY/6airUa2hfOm3?=
 =?iso-8859-1?Q?UwDa5SH0v2GzAHGriguZ4rXEJ9mC+fgvA0NhxsM8fAzE2MvuOPPxV9cbAU?=
 =?iso-8859-1?Q?+KXgRCTBQEEGhInO/huMDSAxEPZaDDFqf0jhtJDn5sCic+aslIKy1XYuTS?=
 =?iso-8859-1?Q?wr+YF1tZAuKTEg7hSrd4qe5w7KUD3CRdeeMTLG4rGdr63YEobnhuMXdmau?=
 =?iso-8859-1?Q?SEf8nMsmKM99ei+mpjYc4HAITzX1m/e0GLxIVZtHpfJGnlROTZDZbDc77a?=
 =?iso-8859-1?Q?tl8Vn6GOkbeXgfSkFFzCWD6e2nOSp0OBj84XBEhIufclyu1HSnzVs1YZnd?=
 =?iso-8859-1?Q?1a5TyaaFoN8vtu8++88XedEs7pXHTOCyHr4QW2xb3MCHxBxIS6VxH+D2iC?=
 =?iso-8859-1?Q?kAetM5rHWQaC48iyAsrl82LbAx9gAY1ZylgOGeWVFHLnluoIa5KyDfgneo?=
 =?iso-8859-1?Q?xGcL0XOgiQcCz7YTLUxCVfSqGR83E1eqVeHaagssKopGSOyiEs7+AO3aOc?=
 =?iso-8859-1?Q?px4ALeoygiAKbxrtRcYG2ODowoDqfDpvgElBnzv28Gqpad90a0axLhqK3d?=
 =?iso-8859-1?Q?koXyJXY964fGXPA0gitXI6cphgdgmCzO9NVmiWLWVK2YfO5erX681r+qjj?=
 =?iso-8859-1?Q?eZ3FiSx4bavHzNTpRuTJcqzmlnjNcAkqAuDrdPjwZ1BVzhvUH4nh/dMBZj?=
 =?iso-8859-1?Q?n0q+Yun6kNunj+P7MmW6E9GEoirKQ9AhkWArlTe2Ke9GrADgsh1mHfI0AP?=
 =?iso-8859-1?Q?3XOUJfi6x2YKmLKFAj4gGKDKVb7xq5hkyx07FaDOL4z8hvvgn3NsLedb21?=
 =?iso-8859-1?Q?ZwM5TUm6/6kD05jdCglGocMCF0fToHsa3WNmQWsVms35VlH4q5c/LcigN1?=
 =?iso-8859-1?Q?ALHEhONBNY7t+6hGLgLNLkNKm3RdH+FAzASu9dGZgegBWpNVo368Bb9SXg?=
 =?iso-8859-1?Q?gaLY/Lb5qzMVaPTbj9Cv9FrimvAd1qoCA8x5HkjjRPtEFnBf/wQ1dzZDWO?=
 =?iso-8859-1?Q?z3sXrGDvzvKrvbM4ddEAc6WDOqkz3uDVaRr93zFNhskwCNPCbNOPkty7fL?=
 =?iso-8859-1?Q?WYF0glPZaNTu7l1eq0D6go1cV4kgPGpJqkgWACrI9s1pJ1CIOByABF6vqk?=
 =?iso-8859-1?Q?VwBoGaKSA88nfE0NNyxYMXTLu0t+Erixe/q+XPojswbSBq2JLJHt4ZHbD+?=
 =?iso-8859-1?Q?8YpsAgaSG10O7sWIDm78933xI3DltlsSYNoWS/U01cDIEn3BWxxc8lB8dv?=
 =?iso-8859-1?Q?RvctimUl8dZHD9cSSUaRv9QGZ1jd7F4sQT1j17YqtrTVRjQMeQayc3RsxS?=
 =?iso-8859-1?Q?iyx4bmTq5nkLB4kjUV8os1VuXCwhAJOP2ZGdow8GUTp+0AoCcvrXqtYND2?=
 =?iso-8859-1?Q?lHY4OpfstZWtIbjG845gIYSTHkyJTZnH4t6axbR7VvD4+rjPuQYIU3j/VJ?=
 =?iso-8859-1?Q?qMh1b7trJc3yEPDKEm/10o2oXXCecsMa16Heb1826moRZCHuo94rov7Kl+?=
 =?iso-8859-1?Q?rfplIX+mua85ocrTU/FJWBJCe1Wlo+X+iMZkCyszLtA/YLEU0HQjZ1B4zX?=
 =?iso-8859-1?Q?i76P1j8PfdLgQxNU9n3L2TAijs8QpwtrRJ/C/aIcckyXxIEuFD8Yhi5hzH?=
 =?iso-8859-1?Q?PDzn7ia8rvdllfoWxLsuRnWqPFle7n0dvVlP+fyc4x+6Nu1iH9lE94DKfR?=
 =?iso-8859-1?Q?B4Qw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: carallon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0e7729-5302-4843-cc5a-08dd8c9a641e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 12:34:48.8621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5677293e-6dd8-433d-8f8c-03a0fd233eed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6BYA9YZDtahji4ONnPuW/+ovAiZMV2xf9SPA7iV758HIt+OmuonkdvvIIM9Uy+xO+rCdF1GifEQHOTKh2cCfgzkjWNU/RLMFYbp2xBEv9I90AuE5VCooeXxYedoTARTy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1782
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_LO0P265MB29537DEB8276706CFBB05913AA8E2LO0P265MB2953GBRP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 12:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216043

--_000_LO0P265MB29537DEB8276706CFBB05913AA8E2LO0P265MB2953GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Currently patches are applied in the order in which they appear in SRC_URI.
As a result, patches split across multiple recipes are applied according to
recipe parse order, not patch order, which can cause them to fail.

This commit allows kernel patches split across multiple recipes to be appli=
ed
in a deterministic and controllable order: sorted alphabetically by
filename.

Signed-off-by: Benjamin Shirley-Quirk <benjamin.shirley-quirk@carallon.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass
index cef6b9ec3f..766098db28 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -46,7 +46,8 @@ def find_patches(d,subdir):
             # properly
             if not patchdir:
                 patch_list.append(local)
-
+    # sort patch_list so that they will be applied in filename-order
+    patch_list.sort(key=3Dos.path.basename)
     return patch_list

 # returns all the elements from the src uri that are .scc files


--_000_LO0P265MB29537DEB8276706CFBB05913AA8E2LO0P265MB2953GBRP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Currently patches are applied in the order in which they appear in SRC_URI.=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
As a result, patches split across multiple recipes are applied according to=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
recipe parse order, not patch order, which can cause them to fail.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This commit allows kernel patches split across multiple recipes to be appli=
ed</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
in a deterministic and controllable order: sorted alphabetically by</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
filename.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Signed-off-by: Benjamin Shirley-Quirk &lt;benjamin.shirley-quirk@carallon.c=
om&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;meta/classes-recipe/kernel-yocto.bbclass | 3 ++-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;1 file changed, 2 insertions(+), 1 deletion(-)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
index cef6b9ec3f..766098db28 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
--- a/meta/classes-recipe/kernel-yocto.bbclass</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+++ b/meta/classes-recipe/kernel-yocto.bbclass</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
@@ -46,7 +46,8 @@ def find_patches(d,subdir):</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# properly</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not patchdir:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;patch_list.ap=
pend(local)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;# sort patch_list so that they will be applied in filename-o=
rder</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;patch_list.sort(key=3Dos.path.basename)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;return patch_list</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;# returns all the elements from the src uri that are .scc files</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_LO0P265MB29537DEB8276706CFBB05913AA8E2LO0P265MB2953GBRP_--

