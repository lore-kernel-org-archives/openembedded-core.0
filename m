Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABA8C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:35:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12384.1788960942524651097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=Pau9P/Sh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.66.44, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwq+zSRH+OFs0KsSmOJU00HPl3CwTkyaQtHv8jPGPWxoEqwjMZiE/ae4o6r1orGJMpEDSLZeXhy0OntoufRw6slVquO0K8AHDfje3nSrwzAc5pw/ythYyeigh1uwhkXfxrxglIk/BRMon1E7M9KxW+TNdz5aetVUPKThtclqDyRL9xKwLoKk9LrPB9+ncSB2DoAT/1L+xV/9kFEP0wYeDGtG7eJPpOo7GQ1zwrPwt0d2sIMnZen9WViWVQv1c9oMIPRv/0QcTelIK0rjoUIsZaFcN8LFZdoB+Q9OtDfbqNdBHssdkkPokAosD55oO1fvqv1k5biUV3kERi1/8cuBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jILRlPW0mmQGlCDVIvCq2bhEZhj0N9kJKspCP5U6BY0=;
 b=yGUsOW4ntAoWqcscLd4/oN7wTO9MZahQ4+DnpWiOj4ZirC87gIGj2wN/xfXma5gQ7Rkf0ZsavPl6p66Dc5AI9C0FTaRux7WkFKIhps9BGcyIj2edupHPywToF/XKxxvAFSqutWS/Vm7d6ZJxM7KM4qQsjwGmSEsEY2lmfLRpBkAMQ7GiFrBYH31mkmWHjkmUsMOfz0d6Zb1MnDpAEjn1VcUWLPrx+b6gvqcR2QQWkpLO3aMMl6f6AAHO8cket718vVTzP3AlViCsUpl835GaXACfs3LLtPB8aOVIyEMkK0S1/B2Xx2SvQI7X2pkk0859zQBemovJ2pZZHShMfsfr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jILRlPW0mmQGlCDVIvCq2bhEZhj0N9kJKspCP5U6BY0=;
 b=Pau9P/Sh7q2Zh/Nqq/qj5EWQPywnhkLoJ9irqVzCjAkFNndriQB2aecvuE0fPqTYsL+TT50o+GtAc9PMIeVg2cphE0b6CR8IjZ8DXKUyzrzBKiRo5lagHltqdYsDjIy4VxkK57xgoOzoww/Y9Nmzio3uNGRy4XRkeLWT3TKYXUgjXeOlgWciENjOApnJ6QI7hYqg0858c6ta9MZ5fkLwYxhTNvngIySP7eNVndEam/erS026/yWDskAQoB6Yox0/lKnWqUR0Do1VHOLT4Y0pALHXTq3GvQkm0v4bM6y8QHVOnCPAE7E7gsHeU0KsxmQ6wzSevRH6Jxgf+lKqvXzFXQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:35:38 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:35:38 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 3/5] gnutls: fix CVE-2026-42014
Thread-Topic: [wrynose][PATCH 3/5] gnutls: fix CVE-2026-42014
Thread-Index: AQHdQGAZUH1mouyWIkOcyqVFmZOkJg==
Date: Wed, 9 Sep 2026 13:35:38 +0000
Message-ID: <20260909133510.3286-3-jakub.szczudlo@nokia.com>
References: <20260909133510.3286-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260909133510.3286-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|VI0PR07MB12084:EE_
x-ms-office365-filtering-correlation-id: 2ef7fdc4-606d-4d42-cf4b-08df0e773c3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|29003799003|25016099003|12006099003|13003099007;
x-microsoft-antispam-message-info: 
 7sUN3olCfuzLP0xVrSiQREoUsdnioerC+M56dvxHhu+RB5NaCiLNKQ8ibDhDawyK6GJIt48VvO8gjhLK2XCMXBoPuR77sEurISxrhb5DoTzD1/SKF/8J91kBGNiol4ji/l9yqMey6nxG39wDXFxloKt9XNsUCpL2MzkyK4T4SM8eVSbkeKURnp30j8CiF226TuG3mmMpV6toL85ldjuThDjIEL8990jLcTlM+/4DLMZtOG7HDaut/ryL0noMslgQPod1u4jx3I+Bc3C6Nk+peSzQ9yn99tKaKsMwOdLV+JW4JfwYzDhF5R4xgAhHeuZqZ8bIpRfBokcKx7luKcPqVvtYQH+H458v7rdccH5Vs3YF3GJJQcY4AWWGG4irzLeyS2lQrlwv8vw9KPvxaNzKwINTo2ZPAI6oiyORuxbfiHWvTYCNKV5XDdZyTegL7gp7AlJ3yypRAjfAmcZpx5nOFLdpTzId+BNXrBqy1TXvQMPaDcC+PwcrWG9Z4nWdLeNfywiFRIsGuijSpvr7t5eeQFae/N/UPS+VCaVISHgG2nQ+qUBZLd5kRngWT7uN759t5V4ZoILZroukkenCxsRoXFIyuoYI71RQpDiw5p2ko2aoiIjoo3j7HD67oAHP/LPJWyWMm9Omxmpwn0Cs4OaWH/z91jjbUg/wYO+/mAlJmFo1FWN92pX7s7+IkBNt9xFtYu+a7jlNeRMFmWntSG16uuuNmk8qnTtPQr6EWW89CF4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(29003799003)(25016099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CVp2pfmsQQkHDpXwgSa3JAgC6KkDE6vqldOm0UEahVF3OwSYiNi0qFTXiP?=
 =?iso-8859-1?Q?IMBZ7MiLxVcr60bFd/JFdkrqTNavb6em6FEazuuJf8Rgz7RGmcCOaizprs?=
 =?iso-8859-1?Q?ZF+6/R9lApK/1TyVI+R0EfcwUrKHp1sEphGbKx3jIt86bcjyt6SdcV0TcL?=
 =?iso-8859-1?Q?/9r607AWY20WVJAQJRsKWYgDfl+Z/YI5pICoM8QGtEAL3yDOA2sM7g9qSR?=
 =?iso-8859-1?Q?omM76EWZCI6P9izJyMENyseHY0a5knNzEmSEls0+Q4LwwmKv6fz2tzwcCs?=
 =?iso-8859-1?Q?qxhfOlWroPc8eauxqnEVuLjjCFdnetiensFnlY682MikD6BT3ucLE04U9S?=
 =?iso-8859-1?Q?9iKNjX5c4ySWF6I7L9YzO4pJWPc1yLe3Bhg32EPluiz5Nnq7R17FO6oMLx?=
 =?iso-8859-1?Q?53CJGPu2QvmE6r/sL792vAqO7WOpMICk2A0pPmfE3kz8qwWY3yS6ZTxdvZ?=
 =?iso-8859-1?Q?FONifDvHGDqjsodF+3pn2zYhoMm/FO2p60yQhLLOi5iSDCIs17JP308t34?=
 =?iso-8859-1?Q?QlEQyRt9Gc6MDt1uflfBNLluCI7lPn277NGE7muKkb5EK142oBCb07fJ5W?=
 =?iso-8859-1?Q?py9heAL+Cojf2GBDBNAgas2RKNVULBoYqouApQZwYg5sSMUGzgORZuaC2Q?=
 =?iso-8859-1?Q?my9CON0EWwqT3XzhkoGLgDMr8lFaIQz08UxFXnoFQhzm0tt/6Ic3NP/h4n?=
 =?iso-8859-1?Q?T1nUklhbqoNnR5akzWxDU5FlbFmGhaLy6p39Y/53uyAEcmiaG8qy/uv+7g?=
 =?iso-8859-1?Q?1Fgw1WTk0hGDSlnoxpDVUkP3+MgBKTyTaFseDpKs6vO7yFuwpi9k9JjMSG?=
 =?iso-8859-1?Q?ZgeOjsrpC9c0+Gw569m2LjmHkkSA7LOduzEQwHXP+XPlruOPKKBSbNLKb4?=
 =?iso-8859-1?Q?Tud8G0dWunDwGNqNFnbVjtAMVVDTv9xntf9WcW1EOsYKWtDQViUwUO0qXd?=
 =?iso-8859-1?Q?4YaXh7FOsWRRPusVhCvYfzWlj3SgUUsBMSlphvQFW6eSonsX5Z/GBLPs46?=
 =?iso-8859-1?Q?dvpfeBZuvs8MEXeP3gQCzkUtHH82SoF8Ml3qqfPZBR6a7aWvMRIuvBza6r?=
 =?iso-8859-1?Q?PjlFgtLy6QggkJBpPkpYRvxDMA6oMIIYWZC3xk/RHlLOFsBvGRCmRRKdZ5?=
 =?iso-8859-1?Q?e+3HSnOxLtZcMROzNi/p4/6D0sIZNZAU4K5ipSD+qULLc1akJQopInr8u3?=
 =?iso-8859-1?Q?oIfdrlFnno1TxpSh/gPJb0nFvbcKsZDFIvlWUUwe9nAn4yVZ8cH/SlrFwd?=
 =?iso-8859-1?Q?4D3gsX8/tQUzpvLKm0G8DdwrSbOnUtuJo0NoTWbEZi4llUzOlohjKVvIVD?=
 =?iso-8859-1?Q?jt/Hm6/eBP54LXkJb1WUasCpi6g1PFlxh/nfp03Cw0aa8Cm7R+xjHvNPHf?=
 =?iso-8859-1?Q?D012whv2qQAvC32RT/hcpNHhamJ+Cfs3xFW6FjTUP4yPhNwy6tx2uNQbO8?=
 =?iso-8859-1?Q?BhJbc1yGh7FxCfWDkfWyXSVxv1GTQ9LDTeI7T0lQ22NeoP8fHS1fUmu0K7?=
 =?iso-8859-1?Q?rX0NvMDEVnQV8qPV7NVqJLGH11Dp83kAKzd+Apxv0mXQocKvWwA/aTXoc8?=
 =?iso-8859-1?Q?kVUn2p1N/sjMD125s3GgCztRNvKwUMhXt8WhS3Lg95sx11cWk//ler7F1l?=
 =?iso-8859-1?Q?9wgPnFQMC9HiMJKOAQDyq2+t9I4qbtSN05VIGkg0C/uXpRCQcGHEK5FCV8?=
 =?iso-8859-1?Q?YICCf4aJ479jjUo9a3sFT9wj6M6RlyyU+EBfMmrgXhIIG40gXhZ8VQRZFR?=
 =?iso-8859-1?Q?o2HDbrXwxf9EyBRLI1SB0BpjTPije9DJToQOWwbu0gLehyUKqb81uRI7BV?=
 =?iso-8859-1?Q?QWZUeE+U8Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef7fdc4-606d-4d42-cf4b-08df0e773c3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:35:38.4278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3iej9WSmokACUseVHV7dlZmq+nx1sqoyXkRZDj3dX1jW5Qlym+vljigDzK0NSpz+tMKCn60AZUkXUhC4Owf3Att6WiBMZBY4TmI3x6VhbrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245465

Backport patch to fix CVE-2026-42014.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-42014=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b382=
7f5cef701=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-42014.patch        | 60 +++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +=0A=
 2 files changed, 61 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-42014.patch=0A=
new file mode 100644=0A=
index 0000000000..776733829a=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch=0A=
@@ -0,0 +1,60 @@=0A=
+From 3957f136e2ed23caf176a594b54b3827f5cef701 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Wed, 18 Mar 2026 18:19:06 +0100=0A=
+Subject: [PATCH] pkcs11_write: fix UAF and leak in gnutls_pkcs11_token_set=
_pin=0A=
+=0A=
+Changing Security Officer PIN with gnutls_pkcs11_token_set_pin() with=0A=
+oldpin =3D=3D NULL for a token that lacks a protected authentication path=
=0A=
+led to a use-after-free.=0A=
+=0A=
+Reported-by: Luigino Camastra and Joshua Rogers of AISLE Research Team=0A=
+Fixes: #1766=0A=
+Fixes: #1809=0A=
+Fixes: CVE-2026-42014=0A=
+Fixes: GNUTLS-SA-2026-04-29-9=0A=
+CVSS: 4.0 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+=0A=
+CVE: CVE-2026-42014=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/3957f=
136e2ed23caf176a594b54b3827f5cef701]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c=0A=
+index 64b85a2..1dff578 100644=0A=
+--- a/lib/pkcs11_write.c=0A=
++++ b/lib/pkcs11_write.c=0A=
+@@ -1266,10 +1266,9 @@ int gnutls_pkcs11_token_set_pin(const char *token_u=
rl, const char *oldpin,=0A=
+ 		ses_flags =3D SESSION_WRITE | SESSION_LOGIN;=0A=
+ =0A=
+ 	ret =3D pkcs11_open_session(&sinfo, NULL, info, ses_flags);=0A=
+-	p11_kit_uri_free(info);=0A=
+-=0A=
+ 	if (ret < 0) {=0A=
+ 		gnutls_assert();=0A=
++		p11_kit_uri_free(info);=0A=
+ 		return ret;=0A=
+ 	}=0A=
+ =0A=
+@@ -1290,9 +1289,11 @@ int gnutls_pkcs11_token_set_pin(const char *token_u=
rl, const char *oldpin,=0A=
+ 		oldpin_size =3D L(oldpin);=0A=
+ =0A=
+ 		if (!(sinfo.tinfo.flags & CKF_PROTECTED_AUTHENTICATION_PATH)) {=0A=
+-			if (newpin =3D=3D NULL)=0A=
+-				return gnutls_assert_val(=0A=
++			if (newpin =3D=3D NULL) {=0A=
++				ret =3D gnutls_assert_val(=0A=
+ 					GNUTLS_E_INVALID_REQUEST);=0A=
++				goto finish;=0A=
++			}=0A=
+ =0A=
+ 			if (oldpin =3D=3D NULL) {=0A=
+ 				struct pin_info_st pin_info;=0A=
+@@ -1324,6 +1325,7 @@ int gnutls_pkcs11_token_set_pin(const char *token_ur=
l, const char *oldpin,=0A=
+ 	ret =3D 0;=0A=
+ =0A=
+ finish:=0A=
++	p11_kit_uri_free(info);=0A=
+ 	pkcs11_close_session(&sinfo);=0A=
+ 	return ret;=0A=
+ }=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb=0A=
index 2f671c4886..b8f653d210 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
@@ -42,6 +42,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42012.patch \=0A=
            file://CVE-2026-42013-pre1.patch \=0A=
            file://CVE-2026-42013.patch \=0A=
+           file://CVE-2026-42014.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"=0A=
-- =0A=
2.34.1=0A=
=0A=

