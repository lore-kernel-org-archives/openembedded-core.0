Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6667BC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:36:58 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12277.1788961014367293747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=nig2rNPt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.83.41, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqMht7VZ9aMMi/678hLrRw5oceGGcWZDiS7IoPq5B0i8H+Al9Ty19PbXROQ3b9zqD3si9QwwatPXqNrU2+znYONmvbf0awXeCia9O15rqesptyifoBCDjZwYka2zG9zip+Mo05vqf6fKWjgj0YxRCv3CpmmQ3pG6s9bipL23A/Agf06ntAclj+hTfGgDm6q0NCPClaIJp+ndSJ4/A5yACDNLsC+DNWA3Zlqqq5g8ykO5M0zFQGal4BwYC2YH7sMWPzWeQiplEflG7zaq8Ych5XVH6VLx6bSbjLZytxQsvCFs2/tGdGwpoO+RrbxdDXRRvOhKtWpPgT6CuFDm5F0xCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWGRZM1VJF4FPPJ2Zb3jiU+SmMu+R8m1kxBuStiQr0g=;
 b=YHybcoMpXbfxg+N2/y6hzBU0jl1007JsVrelcCMxo+ZGgy71tYQnlQnk6LDaZKkQR6pQ3ybhJJ9Sq3YAUHONoW5K4Mds0rd/bGWOUpYOM2OSiK+oCkWissVHp9zpoK8x5cy4twUNaPZ3T1xINJWdEjQ05JLg5Z9RvaSEvOT//7Xwp9epPgTHI2JIdZ9z2LVeKS2gppBR4veAdCejQRy7lAaaJ9OXTC1q9Gsb6G9IA1SPQizexQdSgvI7aKDE3UnjQCioi4jSLivD0HlyJpzogw6KjYYCmCKpL+x1/rMHE5hrYGGI9yKNx7qGDRHhTt7zZ1fQArnUvC9bZWjdWJmZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWGRZM1VJF4FPPJ2Zb3jiU+SmMu+R8m1kxBuStiQr0g=;
 b=nig2rNPtuD5HxipaKNVD6HbZ5I47fQH57NAQzHSHtzkEwjy1OnK8/Uvl2EuFysqA77MUWnzFT66LUOoCPYL0QBSLdih8lv92BkmKDPLce4790o629Mnm4hLOC2vHuc1tjjWUgoOLLGXQA9XrYhBMcvYU4vxOXkv2O2k1u/6ckYxleBof3V6BvoGHzR6X2A8QRcPht70+VJSeG+wkFFhCtsUhXaiU5zcvvWcG/FMvZDElgjqNu9dqFKbVDYTEFew/6Cp+MjN/3WHMyLvT8xt595FFHOVOpeHbmMhTdafhKb5vin6ZONWhF79Yd3iYuYuzTxcVeIPaHyvbVR7NyoCJRw==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by PA4PR07MB7583.eurprd07.prod.outlook.com
 (2603:10a6:102:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 13:36:47 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:36:47 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH 3/5] gnutls: fix CVE-2026-42014
Thread-Topic: [scarthgap][PATCH 3/5] gnutls: fix CVE-2026-42014
Thread-Index: AQHdQGBCpCeph0TAfU6c+82eenhBLw==
Date: Wed, 9 Sep 2026 13:36:46 +0000
Message-ID: <20260909133633.3691-3-jakub.szczudlo@nokia.com>
References: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|PA4PR07MB7583:EE_
x-ms-office365-filtering-correlation-id: cff3e6b9-0f2c-4878-a769-08df0e776505
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|18002099003|22082099003|12006099003|25016099003|29003799003|11063799006|56012099006|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 zstQCcxnYx/2mcQZUzli7+D98dxyphsf8sv9vXEoUHdzpcPTegO8OtlM6FSkFssZjp6CP+mwuul+Ek/IXbK0oQq3P4TG4G9zDXAlYjrQUWYYfwSl8TzYmHezSyt0XieDOKbOnR4RC1JB1T2u+Ek2GQ3WAelVKbOTd1//q/zC8Jw3Fh/d7WbiAsRyUaSWRNaBnieGANYELdhBk3wrejd4AkXQfT/ijwck1ZH42fjDbShmp4Qx2DGDT/hkaz6Lf2p1dbGswTCiLs6s6pX/nDRS8YJbjqSVy6+PvcNDV+08kuXVv/xqJIIBWFlAkZ2r5MJf4amE6oNzzxiIAYIIF8NWlNyboKFD24ym0R7CRKJcqRfrIZge24djMLDtHbQDoD51yM/ab190DMGg4AjhhHKVh5TTUES8CXpkDWfme2Din7XYjt986AMvdJFYhPddDncFcC5sVpR7ej6mDd//qs2k2zC32pAEtHwcYCDfvJiJm1JxAiaEFXeVCX1dysMKVFoi7gLrX5xlrhGTdQVQ3Zv9OyYvy1jovrhxSh6LlQmwCOX+imKPyFuCudXumGuaJ2oCQBYYYZeDfKUApSP1wp+n13cPuNOgf20f+PXu0QFRhEskwdzz0Wdz0YJa93q6XjMqfFFKt/M7a1R+VKguPT1tBWXloiWZcbLVEQpXswREt3pEq2cXUmNeaCRn40YkCeonYdFQO9ovYL6Ayqck2OsLY6VCbFIvWTOtlLa3QoitV/c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(12006099003)(25016099003)(29003799003)(11063799006)(56012099006)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?BIN53dRm0EVJ3Ba41nqJgMu26C7UZqfjIrWBiGDX9x0PQqKr+MJmYF0NCI?=
 =?iso-8859-1?Q?XMygEFFBwND+6qKAZumCz6or/A2VKzOsNyhBCvs9FBwntjVrgSS2Imt1cO?=
 =?iso-8859-1?Q?hdp8VIJhc2wvVcerB+iuHjziczBWxx7FhF241lu4sB7nC3AfmG3WMhRT4t?=
 =?iso-8859-1?Q?SDQqZTyH/8MrakuzSU8nDmDB2rrHYSKbzppSPBXURliyEBHc30iytgFVdE?=
 =?iso-8859-1?Q?CASYOxsO2bRFXgvAKsTocwJO/sffWneYEonIquR2Y2CUIT0QMoDvcRInxg?=
 =?iso-8859-1?Q?RFyaGVGy5m8+9C7gGHj7MkuAIkEfUXnsYuC2g4QmUzfSRmMl53wLO1cMfF?=
 =?iso-8859-1?Q?g36orBw2JlOSz+87Pq6dAfdU7RuECfNcs17H0Rc8degFtpr2SYKjPUwI/t?=
 =?iso-8859-1?Q?V/aPG/u0o8WxI0NbloJggeVVsAHfdwZnox+3+8sTPrUhfxdBQehekuLICl?=
 =?iso-8859-1?Q?3/+LAoWQH0Zq1oSo38Chc/scGx8CDJXCNwaINMzZKtLDjKC0o/Bx/Qgz+A?=
 =?iso-8859-1?Q?R+k0PdxCCOeI3ypvdlyKfklIkHunGQrF4TtRcZB4vwQEqkLvNASG93JlEu?=
 =?iso-8859-1?Q?3BGwO68MOlZrlQYamEMLxIAEnbsEpj8/N8CAUuS8dSM8LjuHAKRFfdw6cK?=
 =?iso-8859-1?Q?E8ajX74Psv4ye+//DlRDygtL0ZGCueMVVPNUayfWo/HW3tGbxwodFJdJzA?=
 =?iso-8859-1?Q?EmHgd+/lFRNL3whMr0gfw68WIJRQgUmR6R7gX+t90aVL5IkslsiUXBJmW3?=
 =?iso-8859-1?Q?onz7SOFhaOUJFXi5sDwNmCBYOxa7noau9I6HdtkdMbgjiiaV9WrwW3IUau?=
 =?iso-8859-1?Q?wLFjbUs+34zqLeRcdVw+W3hOjJGQRY+3fjZftrx24DI5sYnCYWnTGgpbvp?=
 =?iso-8859-1?Q?Zya/0THlxc8KzU/gSh0EopmEz7Knbn47swM/Y0wkLxDrl7s1AXmvNRuffX?=
 =?iso-8859-1?Q?6dmHbaT6v0dqmjpjrgtykDIqXk1sYFXrUAmgJjjAwayw/Qg1wfs2KvcoFD?=
 =?iso-8859-1?Q?kKyOYh1Wg5krDwHVTkcxa2+sSR7TQd3N1QpnE3ihiaStaYxE+QFLA+wUmS?=
 =?iso-8859-1?Q?kd2EGmP5Sij91j5fppjKTTFBvUPoDqRIYEtIIVfeY1yMGMfr3wyzMNFy3s?=
 =?iso-8859-1?Q?M+QuqbDCzfr2rf0Sj40jPhrbHJNZ9ZOgprF7ov21356GJFTJQqozZKqYrA?=
 =?iso-8859-1?Q?Lpywvkbkwo5gH3WlP2Ony52sfKvOBhPhrxc6ABPaKUDSe0Oj3ksgER7cRf?=
 =?iso-8859-1?Q?34+vrH5m7AiZm4M+a7iL1wlci0h0/lyb9KjOtk3OuThYMbCIJQGt/vLHmR?=
 =?iso-8859-1?Q?YB9i24BIToN6mK7ThPb7ZEzqJO3dIgvsuLUY8ay3G3L/5INKhf6txRWDFz?=
 =?iso-8859-1?Q?xO4EV2YxqcYuFFvVUizZ6aBZ7eMnAbkJNRIJJEfdTbZqCG01dGTZ3c3WUE?=
 =?iso-8859-1?Q?UoXme/bqS/ZMO5TEONPsVZxFrth7LsLQQ9zt2+a5PtY6/vcCg4nQXXaW4w?=
 =?iso-8859-1?Q?80iIxymetL0NhPU8x9OzOxCi9kCADaCvBxOojpQkhoGUy7iHZyKACjTiW/?=
 =?iso-8859-1?Q?eR422OftZZOjxBD5L5bOFTjyjnCqu4fuZS3TzL6Sz1qTb33C/3MlsXsi5f?=
 =?iso-8859-1?Q?C5Orz2OUpzD0Zey4eY59/4TiqYXHKqzKsIhdSl1NEbVB/grAYjRxOfH4na?=
 =?iso-8859-1?Q?VHts6IR252hrTpnRezfmo0gTLriuQ1MyqzIEjlBUuG2fZvFAbX61hGnlzZ?=
 =?iso-8859-1?Q?+ObzRSdn6FdGd88alIbl9+hm9DzvMrDv97egQtZIssT49mHdzmfqA7Qpka?=
 =?iso-8859-1?Q?Ay/W4Vp46A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff3e6b9-0f2c-4878-a769-08df0e776505
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:36:46.7590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFPXVrJIpZJVQ234DWHhTFigOGuMiLqYE+0d2tiqtzKsQZp17UTIxjHDSaT8tOxwCQ+N89yYO1qPEwwUc2483NRF5iM/Pg34cEifMjML6iA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245470

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
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +=0A=
 2 files changed, 61 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-42014.patch=0A=
new file mode 100644=0A=
index 0000000000..7fd0c163f8=0A=
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
+index 961e1b9..9fe571e 100644=0A=
+--- a/lib/pkcs11_write.c=0A=
++++ b/lib/pkcs11_write.c=0A=
+@@ -1267,10 +1267,9 @@ int gnutls_pkcs11_token_set_pin(const char *token_u=
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
+@@ -1291,9 +1290,11 @@ int gnutls_pkcs11_token_set_pin(const char *token_u=
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
+@@ -1325,6 +1326,7 @@ int gnutls_pkcs11_token_set_pin(const char *token_ur=
l, const char *oldpin,=0A=
+ 	ret =3D 0;=0A=
+ =0A=
+ finish:=0A=
++	p11_kit_uri_free(info);=0A=
+ 	pkcs11_close_session(&sinfo);=0A=
+ 	return ret;=0A=
+ }=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index 72bec9b354..6f1fc4d847 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -52,6 +52,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42012.patch \=0A=
            file://CVE-2026-42013-pre1.patch \=0A=
            file://CVE-2026-42013.patch \=0A=
+           file://CVE-2026-42014.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

