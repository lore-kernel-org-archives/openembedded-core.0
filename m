Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A5FD74951
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 04:01:06 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9941.1766116865711631623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 20:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=V6LGFZdS;
 spf=pass (domain: nskint.co.jp, ip: 40.107.74.84, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1shjyxtgC1+8S8Fglkt/69tbk3t8Un0RDB/SFKU5SYp08DIDPlBb9Om4jVl3+Fr0bJZAHqn3D4eaZCSHCzd4yitTtwtwrwoRzTlTakAm8B3095f8vYca9cBhQ5jEcrY4g/7x/30LoF4JTbkLH3Njfbhb8RWq1HntQH/tsH+zerY82CEClyE2Zc1eF+Ksz6RQpvBOQsdaujpknjwJCJ+0KqaVtH1xo0AMSkX7AAFcTiq1JkVH59LY0Ec1UP1H6v6AC+49Whf/SGBPtC3oxJhEZNnWUpGXfUlt5ZuzYLLfE9ZTjkOeqeQINTifRRcAxyXHyLaHDxhmg4fTWpvm+VHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAJ1LQDdR/MfW93gZiQ+vFyUE1cjkNwhIqW1t/C+jJE=;
 b=KpN5btnKWhnqfXJArGF7/LG6vh3s1B069xd7yQGFxWdouKOrhVmj98n2cbOtvI0Eo2OSr2qCekEWn5Bg9okCfthGIcOlVFsvqqQhlf1+SaDkYacCYs7KApNtJiXxaS127BMqNpOMbU49yN6lWGmUhaLfqhf3l8JB8RGA30FEqUkiI/yvI1yhWgsXCjgNyp+owheT1ObjQvONTxV4CLAno4U/z+bs87h9vySrF0SHyl7jM58kUBJ2qbWMpQ/gOKOJPPuA8tetAnBYvHoaXEvAssjUYtbcEcP2XygXUPmNuGlj4WzXxgSqR2nHa9nP6OS6iPu2HvZ3K9TGNgJN63DlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAJ1LQDdR/MfW93gZiQ+vFyUE1cjkNwhIqW1t/C+jJE=;
 b=V6LGFZdSC5hdHB+E3oP8zLP5jyEQVOtpPcSKw0lJ1wKLk4hvYAYCW2tc5ViXhvGDEDc9qQnRg6yb8nDDwBFcMc2A9EjnSb3oHI3YBfPsdAI/MbFBuHsDeK14sDvXf5aq0tggAe3dcPYGhEL4GaKBeAqaKYUQFLO9U64HxLx+b9c=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by OSCP286MB5228.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:34f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 04:01:00 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a%5]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 04:01:00 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda
	<ikeda@nskint.co.jp>, Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: [PATCH] libtheora: set CVE_PRODUCT
Thread-Topic: [PATCH] libtheora: set CVE_PRODUCT
Thread-Index: Adxwm3RV7PLHzcUFTp6yQbLT2jCIAw==
Date: Fri, 19 Dec 2025 04:01:00 +0000
Message-ID: 
 <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|OSCP286MB5228:EE_
x-ms-office365-filtering-correlation-id: c60d119c-c6ad-4818-0055-08de3eb338cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?aY5XSSiQrYFILunBq11VBeT4HgJEOF7V8YDqBUOn9ABhIEATjFax0oxOpYbN?=
 =?us-ascii?Q?phRAkOrfOKsx1ml2CP0MxdDCe+ACr/1PR3SflSnmGKhQGoSG488N9O9M8t+5?=
 =?us-ascii?Q?dwG3yOLyGfWNKGwYkAFJFJT0wj9UwlBOjCRTzeHU/bKJNWJgluRmmS+IuhDB?=
 =?us-ascii?Q?mc6u+inR+GoYgd3XxxxIK4r2lspQjlfk0FqkXnPfFHvbHhSSqJ2cGIbDU9Yk?=
 =?us-ascii?Q?Pdq41tHEUJOruMzSOXr+1FDwzItSX0gTrQijTN4zb0AgIpBvL+UMIUQcKQXT?=
 =?us-ascii?Q?Lsr8+C8dTFp+TDbtnprjWi6J+ucxVHo2VgZDxNYh2n72LjBmbJ4ZXF9PlVvK?=
 =?us-ascii?Q?KMs4u+7jos2fLyxHCB+FtX2bjqimpVJhIESQSBf/SVW/PcQkqi+krlOeoV26?=
 =?us-ascii?Q?5Vo+UvGTtTTLEfCMDguU/RSLQzlZpFAwJM7ZmlIzL6ILfviijONPuVaRHE8R?=
 =?us-ascii?Q?JyCX+puppQlFs721BTvmnr+fLLO5UTfZAoMI8TImOjKAR/0bV8rfXzkneMhc?=
 =?us-ascii?Q?IwxyA9bOkRhYthE5Ub1GpMq1R968FhPdOHnn5H/5gjF2n+48QFFl//Lte7Jc?=
 =?us-ascii?Q?4I22FXr/qH9VU8ij7SIhSoQBGIvUMGH/JKk5HXziS9M7/6Xr6KR8vnFEx9nU?=
 =?us-ascii?Q?3LEpHjL/mtY2skIAcTMSk/m83OGbI2L17+za+FrGclA+d2M+z1K3VX1C8idG?=
 =?us-ascii?Q?Pbd/I9M/Ym1pIeh5S+5tuQjfwzCt/5Jibqi0OahuPK0hHAFEEO4WwrYma1S9?=
 =?us-ascii?Q?wtK8bAwQkEvEJxT6a8gJr0KZt5FkyQcTi2MQvlO71PawCbSJCC3T8kQjMUw8?=
 =?us-ascii?Q?w3/yUiOY5W29MS/tie9WdJmGvykV43Ojj00nxFR7F/EbmO+99/6jwLLv+12c?=
 =?us-ascii?Q?7wJ3dvSTcrJTPgHxUJRGjTjHvqEOX+36RcNE1Zk+WPESdxKhhvwZ3/ZUA8Kz?=
 =?us-ascii?Q?SDiqZEdLMFX2ugKVmVb/AmK/DPck545X+jwNcB0xT1jUWdDSHPFB+bwHNfto?=
 =?us-ascii?Q?LUndGEweVaIp5VruXD/663b/psr5N2hgCWvIdvXDKjg3GvuDlfU6CMtjX9sI?=
 =?us-ascii?Q?4sV8BOO6QrZjrKBdWoE8b4qlq+TQHIUWmO/H0pzQ3N1NmIa7XDmurbFen+FI?=
 =?us-ascii?Q?EXo14F6rkZr/xfSTTVExTPjavnrZSWwqQcjkVf8qB/sU14Ftt9EaoHIGpUOl?=
 =?us-ascii?Q?1n9Vswk/W33CoqMFEk9knmVY20BHm+RwgHcVousvY9KCsd6OmS/lSpL5vVOF?=
 =?us-ascii?Q?QaH2GZWod5RWU8EW7heq95sTM6jX7l6fPDrJ967KDz+lzIYS5Js1OzcWk/+a?=
 =?us-ascii?Q?Yj5wxUMLEMV3BCLI5iUd1kQ3xgBGrmOajMza9pid8V6aCBO2J2MDhgHidLk+?=
 =?us-ascii?Q?MnpPWYHEO9hDOKosR4sRsPG3qtKH9pls2pIgtU0kMcBwmXS58s21lh30ihWq?=
 =?us-ascii?Q?4UpPDSY5MTdy/LyVh4LrU6QiVY/3KGl66uGbkfWdbf3Q90GAyQNc7tQQxPHA?=
 =?us-ascii?Q?7aTqmbQkalC6fKP5IBwaTkRDVUNbXmhnA7Tm?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5HVdKOtu8cD3hu0NnYWgigLcJLrP7fdU7tw4/zt3iDuA/rUSYRlQDq6pdpYP?=
 =?us-ascii?Q?zMu/Mp7E/NIhi2QS7YBYzZT6PQMYbZWP5WVVYJrbBFzbJJvwlm5I5+zK8HPK?=
 =?us-ascii?Q?9Ntucl8mL3rqMajiHMKrmp3oi8aKJRC7vTgpa6AaLHrsgc190fnL+xJtSbvb?=
 =?us-ascii?Q?aRWBXHsKWOIqBVsNIpEKhQ5yOGOI9/NGNqo1atapWkzmGawe9gvvtQs8Yfh+?=
 =?us-ascii?Q?GZaCv9HCQgVCdltwLghUsEwsgLIL1bvwa3DhzXl2benKrhsfb3nb97YLTTAP?=
 =?us-ascii?Q?12XvoA4Zftmdtye2TJiOJZh/O245H0RugnyJQQ68BABXTnIGn4NfbxnFWEIh?=
 =?us-ascii?Q?26WlVDKrlG5d0l/uZHa9vKpYMP50yVmQjb4zeaEvZ0AbW5nCN/W/8zNO8nmR?=
 =?us-ascii?Q?qJbAoXY0l7fseZCp11Pg2WdM4AQSTaefHxAYgf7zC/jcFpjKMsVmYXNLt5i9?=
 =?us-ascii?Q?x72dQnjuMwLjlmdhmxEYZyRDOre1ms+u7BpkrVSsl1ECGushneVNh3Pn2Px7?=
 =?us-ascii?Q?erMZErBgYHCgR1SOXnoDc2FznJ9iPo59lzeYBwNdCy8X8FhZHUPrvSXhrU50?=
 =?us-ascii?Q?Z8wWbT05JW9xmWkUIwXjVAeCRSLZkS70va3o/bRA7wGyf5GOSZhgLcxrFebW?=
 =?us-ascii?Q?2zX1O94Z55sFkgmp4T3BJG3+E0PCjLhj0ClifhPDdwoC6GeouMw93y5y3fsC?=
 =?us-ascii?Q?v4sqCXwvon6hqugsd1aUki9NDB3Zo52MMVr5W8HWaYSUtEhFeS+RzstWLlEt?=
 =?us-ascii?Q?EVo+cSB7A9LpbiWSd3iiAvqqU7LKBrzwgjaEfBUACSBCR4l2ERJugPi/e9xo?=
 =?us-ascii?Q?zSlhp/g9+KKv0JB40MZYMHQ8OgW1R7xEaY1fZiRQGTnxuqALyDuiQnqvw52A?=
 =?us-ascii?Q?qsvHB2NDMXPwIQy+bpzE+jkMj+2h0zKoH5MASOhR1Oe+GhaEUUPOtKcWW5te?=
 =?us-ascii?Q?iG0JGIo9JCDyAYPnc7Hj+SNY7YBc6GMHJRVJV8eHX6AtUH4OykRCKoqnbFdO?=
 =?us-ascii?Q?Hu/D69haIKyyUGmCdER+m3v4xqj5erivm6UWah4xOurgY0vRUiQbxCVXdz+s?=
 =?us-ascii?Q?G+1j7OkqvfwoNezTlZxS5dpcit3q2aZDdaCjO8/MxKBZ/MjMtuj+aOE6bOMu?=
 =?us-ascii?Q?EFYEvlPUwzeg/rsLTzLpuvmnNnqpZny1tBLz5Ovw7KVbzFynuoILsz9oh7oP?=
 =?us-ascii?Q?6BrOFdQX7CND7EUbI0wDIGKizUNVO0BS6NF4R+Fiehkui52YXSU7o5kZm9FB?=
 =?us-ascii?Q?fjqDGI/uXXIeTZg+L8IZEXt0zdkkhYxzFugYYp28Dc11rYveY+uZQTJ6qn/d?=
 =?us-ascii?Q?rGrY9rdJem8bSOvu1QXQi7fVPa22dZucuGv3OvuwDM1cNKGoguEbl6+wdedD?=
 =?us-ascii?Q?+vXoHzivhnvbAQR/UqLPPnvmpiBJCI0xTBI57D/I734nI1kbYs4rq2DQJroU?=
 =?us-ascii?Q?nYPzuvnaD2wyCMARYCV5gCAT53589V87bjlGFBQefV/h9OwiUp68ggk6x8UL?=
 =?us-ascii?Q?sBMLoojnUlqp2gj5mZ1+yTQ71irRK5YO61rmP+DKN860oCAl8h1gQc5GFYOb?=
 =?us-ascii?Q?GY+GmV48+fH4NALARLPnZuJcxxnt6STWI7XDJwlP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c60d119c-c6ad-4818-0055-08de3eb338cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 04:01:00.5986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DouA9ymR6RyOWpK6gd55ppRg2owMTreMs6J3FTn3YkEaS2k/B+uD8jJFOKcbGcWxDl9MjeoGQW0ULTMPUMsHQoGL3gGX0Gs6Du73Ptb8T/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228198

In the NVD database, the product name of libtheora is theora.
This was set to ensure that cve-check works correctly.

Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
---
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/re=
cipes-multimedia/libtheora/libtheora_1.2.0.bb
index 04de8507fb..bacaf3aee6 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e42323844fa0950=
2b34eb1d1fece7b5f54da41fe

 UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"

+CVE_PRODUCT =3D "theora"
+
 inherit autotools pkgconfig

 EXTRA_OECONF =3D "--disable-examples --disable-doc"
--=20
2.34.1

