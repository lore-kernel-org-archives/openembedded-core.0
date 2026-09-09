Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A24C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:36:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12251.1788960945495230684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=WrLaXSjn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.72.32, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRxrlpwWtRruFuQ9IKF4gNtdS4qRAw1FhccwN00+QwwYjfZZGDiNoSbiA6buGRS2yeG3GF8w8P32DZRUq+47zyTqVOZ71E5+zKA3h93hM5aM1mg3+Zv8eXTqNYkuGKcR4bC4oj4hsS50aD4Z2GB5u6MOh01T//6bGU8a2Sys1jBCZ481ivMZYtzbpTTGOxD9/nPVeXNKh2gR+yptjiB6ryWHnnMCrN+kG4mKMtNQxl+7Isj5Wa80ZJV0qCF2vJOyVHNd4S5x7cB/ICgiEbsKUfYdePKztJGAL0WWQOhgzoKEOxAiPTNG+XvkQdSIAqdSsZIyZkIxb07eJS2DetWQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7hDcpMCZVX4fXQoy3Q5eoYENCNZZpfXwvMebD2eS3o=;
 b=Ikmf5W7GnVsO209aiOZOL4lRsM+aGY2IwiW/OZDxnRaDue1pjSQMcXW7GnB3dKPqkoLrCN4U/TUiV+uG6v9Z6Y6Oa2kmv8cTX/wLD0nKC4zWpGC8+suGLj3HimInzjgw4yhYVaBOP2+rh1TlcjJ97RJY9/Zh7i2rtG6DoMZu3gUUIPWXzqNDGHDE3IAWOu5/JVLc3Yaq7D8FGxYCdICHu7F7ER7COR5Xqx2OVJn0UosEcc9BvRD6yDGcTLBoTOeW+ZuuVSuBdg+30XimkulLpkqmoQUJjMoHsoCIdsH38oo3A4Q6fn5cDswQYahoaIFLfzHVb9socVdXfucobIVHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7hDcpMCZVX4fXQoy3Q5eoYENCNZZpfXwvMebD2eS3o=;
 b=WrLaXSjnJCyq4FG5uN9lDb1SPLtiP2KBxi36l8uRzc+wPGGOCcOLRcl+W9mpYQKsqJXDoUK3d3c64qeVrsDWJcUEyGaXtcpOqMSnZyag+YZbdM6lXWoiSCPeeaezUok2GuR1Fsng42oJb+bpKDE40vHM/tE3ypanUaPgEfigKQmAjNZKio93SgBDmz8UEu+2CC+0P+l3cF7ClTzJhwcckcw6o2q02nP0oTrfrO7bkSeAAF4HuZu4sKaGnEErF/4815SEwkgfo5zgedbeR9A/zlM9iCayuCZ/3IeVW6EmwOtWHzXuyfjV1yoxPNvr61/1xyzicK0lzj6jYtj0NK2bnA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:35:42 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:35:42 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 4/5] gnutls: fix CVE-2026-42015
Thread-Topic: [wrynose][PATCH 4/5] gnutls: fix CVE-2026-42015
Thread-Index: AQHdQGAcV31BucPHgk6MVLh+JOfPrw==
Date: Wed, 9 Sep 2026 13:35:42 +0000
Message-ID: <20260909133510.3286-4-jakub.szczudlo@nokia.com>
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
x-ms-office365-filtering-correlation-id: 3d6f8f63-54cd-4991-2870-08df0e773ea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|12006099003|13003099007;
x-microsoft-antispam-message-info: 
 pjjJkP5ja5IXWAThBZJeauHa/fLoGpXZJuGaApGJFWaKs0nVa2Kuo4WtvfGTauhQNiy5HTdkgTX03dDVB4tL8d8U2uuuJs5JDXGLa2t9//rq1xM5y3MzC9fG6NjbAMRtOVjoYBfdEUR52rHWvsAXejw+5bSxmpwtK9smGVKAANCsddMzzY9PzNg+pnwBNtVmPXetmuuCcc07uH/0pXRU4PltvbhhIbRgLVFAvCbxRginA9sMigGQ+3fAUtkUXubPv0CencFnXXk/WsvVc49ki9DilBp1AxV5YZeZtWqiWES54waUeYkigAyJu1lwuUZ1ffkK2WIX3Ll5/zVN6lCvqgfXrkwMBD2hRrDfe2fSfYJkA2W1YZd+vlYA6R1zUm28Og1gbu4ErogeaRskHfRTIUeChy1lxYorQ9ClPOswDK1AZGKpfwhblU6rELK4O/4Ly4nlMYPT/2OuJsmikNryfE3weB+VJ6XRDxaOssJ2vPwtW6Sm/2oHzT2v2FlbmHyDjJiRIH2KUsD4SXItMbYY3+1mr2nU+zgVYObbtX2b4PxlXDmLBfwWgwYP73V7RErGNb8/yLsMyukRROnePvmgzEoVZJTWxeGNtGSst1Ej1jBynfA111ovDY/JOMeJS8TCFsdQTFBTuNlJb8pbomWBaHoBsSN22fEPJTXdwiKH22hz11Mzkw94xo/6IZSA1s0pfnOfsemgfQfv5WQRXN1SAH+uIH7PsKwEqHxgWfsXWT8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?uHP1xVi/A/LyV4ebBNWMyLXJmaIds8a7W7aQemD8pAQtmsJHLEnuViTXAr?=
 =?iso-8859-1?Q?6F9mj0PnOk6Iffgi6gAumRZYKDH7F2eN2BgQgbSE1/vokojHiAeZQUhiQn?=
 =?iso-8859-1?Q?34sO9DtcyhKJPaw4wKMzLmo8VFRPe+7q5EKP6TUqfH/Iz2pUtMOmsJKEBt?=
 =?iso-8859-1?Q?6wwx2UHVXxjwFiA+B6mO1tkJ5nznUc+57WrQXmpW+I/4+hijZ9LfFltm4+?=
 =?iso-8859-1?Q?7EIvdqSJZTMaiaCnfMfJeGC/ZEstDtunbyD6sP8EbfhmT0pzmWRt6tZOYs?=
 =?iso-8859-1?Q?Y3ZipzEOgXsc0bIamN1i+bq5ZjM6MNi9x4Yq/NgxN0/0Isa4HWwqVD2GiQ?=
 =?iso-8859-1?Q?XoUQFWhzcSgRdpXoxYRh4wGlrfUhTwUic/HKmkyDAvBYoCmNbUCNZJCcVN?=
 =?iso-8859-1?Q?PQYvzqf2mET9ryOn4qt2c6qyL6ur/LeElMHmO04CSKoSBwPBc9BDBaQvSb?=
 =?iso-8859-1?Q?FtW0oMB4H+gl2YoDCD45FKl6WYVmbVjOd4WWnmKxizZcJvca40XcsME+o7?=
 =?iso-8859-1?Q?rDinnQCDIgCWN2XnYZMqzQEJA8kPt72gh69N8rlYQSuYso9ll7Evlwg9FT?=
 =?iso-8859-1?Q?scEWr1Vme78V0ieoi1e18SKD1CvZOUgTlDumxocZUskML7xq73xGRnDhhr?=
 =?iso-8859-1?Q?oODYLviOFUz7ZlaN1NyaDj0EOL1sIF9kT7tVT6Zg/vvkpP9VTSUcDR1HES?=
 =?iso-8859-1?Q?IQ5m9RdDKLAovyOHigOy3d8HEyr5ggTqQ24223E54kvj8ItKBegvZiXjfg?=
 =?iso-8859-1?Q?+W8MD3DT7JaWvqGJz7IQf+hRrN+gG3MUZgNp6B207dqNEs0f4YCyXjQwsL?=
 =?iso-8859-1?Q?5kkzHh6BNSP6KrJALVWDYqNgMBWehzWjxAWpfvHLGFdjklLkDeWPyClI34?=
 =?iso-8859-1?Q?yG3goxaobvcoAEiw9SShcw/nrrP5LZiovW/cxhMWYH1jNPKY4K2Axmpzr/?=
 =?iso-8859-1?Q?zl2IVUY453QHWWo4of2CvlW7WGF3k+qJ3tTed8Kl4GPZrLMcGtkP+1Lu+y?=
 =?iso-8859-1?Q?Dy8kWULDiTsziUOpKEw04PU4AA1J/L32puXjMfL1Z7mTv7ku3q5IWvWUIC?=
 =?iso-8859-1?Q?v1JEP98Z2LjQLTZ/wEn5NMOzT3hKQ9lHOURFoaKtR68TOU8894VV0NXWld?=
 =?iso-8859-1?Q?2ZlWyyDrv8zcbk15wQXqp9rftCpDk4tz/b9gdBA0G8UGy20OpYIfy9WSpn?=
 =?iso-8859-1?Q?1rksioW1tUQz5bXOcGhoGbGUB/WH0NN9xlWyzX9RCCxJ7bS/1n2cxy1w1Q?=
 =?iso-8859-1?Q?ftIWgOB90zqaf7WWx8yUW9vS8f7CreJHrRWabItyB3mqMUhHCI8CvJi35b?=
 =?iso-8859-1?Q?mp1iHjQ5a3VLh+1rXZqB37IYxAoa1AEh7f3c6Je8XqNewzMTIGEU/m2HB+?=
 =?iso-8859-1?Q?egSvfxOoSK36vhcHMpORHGQJfH3DgeBEU/qywyWlynNp+wrtSnJHW38puU?=
 =?iso-8859-1?Q?Zapj95YKuIuU5/dF1Su9Kh6wP55P+yGQWHrOMQulMjOTsxG1ATqDwZtagn?=
 =?iso-8859-1?Q?3ndrBjhN2naf3dRfvV3KoaOet0TDHnTK3J1PaoVvWwD8NMhuTFI4me3jVC?=
 =?iso-8859-1?Q?FzTmv4lX22q/Hwd9eEI+uBpKEnbxVcpPrOPoxfLXlRr841DQGDVnuinyMu?=
 =?iso-8859-1?Q?mh7tywT6w6SCLxK1Gz/hM7dpmW2kC8kwa/828VtKB6Kmlmvq7Ksf0lVLJl?=
 =?iso-8859-1?Q?VHZ8AiS8z99ELwfx6CT8r/v2Lp5NtU44+ADEC4XOSGB3d1rTHGajTxmG9X?=
 =?iso-8859-1?Q?dj5VJg+iRNcfhv37jbWbTihwoDO7Eo05g7iQDfG5nIyP9N2QJ/O2cLOTHr?=
 =?iso-8859-1?Q?jzKE6RxFAA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6f8f63-54cd-4991-2870-08df0e773ea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:35:42.4679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkcBvGN8bPuMvqmVc3E1b+OE/FiOhwshnf+G29CrXQumVmrcBk1RloclSW5GzrQg6xuiEWjlhbtYp6jILGRaLEN0FQ31h7qzH+23k3PH4xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245466

Backport patch to fix CVE-2026-42015.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-42015=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab=
8f2b2c3ca=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-42015.patch        | 43 +++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +=0A=
 2 files changed, 44 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-42015.patch=0A=
new file mode 100644=0A=
index 0000000000..1a2065371d=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch=0A=
@@ -0,0 +1,43 @@=0A=
+From a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Mon, 20 Apr 2026 22:42:20 +0200=0A=
+Subject: [PATCH] x509/pkcs12_bag: fix off-by-one in bag element bounds che=
ck=0A=
+=0A=
+Appending elements to a PKCS#12 bag had a bounds check that=0A=
+prevented adding the 32nd element.=0A=
+On the other hand, it is possible to import one that already has 32.=0A=
+Subsequent appending then led to writing past the 32-element array,=0A=
+smashing its length.=0A=
+=0A=
+Tighten the check to reject any bag with 32 or more elements.=0A=
+=0A=
+We'll treat this vulnerability as a Low due to how contrived=0A=
+the requirements are: for the code to be vulnerable,=0A=
+it needs to append to an imported untrusted unencrypted PKCS#12 structure.=
=0A=
+=0A=
+Reported-by: Zou Dikai=0A=
+Fixes: #1840=0A=
+Fixes: CVE-2026-42015=0A=
+Fixes: GNUTLS-SA-2026-04-29-11=0A=
+CVSS: 6.1 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:H=0A=
+Severity: Low=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+=0A=
+CVE: CVE-2026-42015=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a3e7c=
50d3e1761e5ef1d4b225507cab8f2b2c3ca]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+diff --git a/lib/x509/pkcs12_bag.c b/lib/x509/pkcs12_bag.c=0A=
+index 911aeff..3822861 100644=0A=
+--- a/lib/x509/pkcs12_bag.c=0A=
++++ b/lib/x509/pkcs12_bag.c=0A=
+@@ -375,7 +375,7 @@ int gnutls_pkcs12_bag_set_data(gnutls_pkcs12_bag_t bag=
,=0A=
+ 		return GNUTLS_E_INVALID_REQUEST;=0A=
+ 	}=0A=
+ =0A=
+-	if (bag->bag_elements =3D=3D MAX_BAG_ELEMENTS - 1) {=0A=
++	if (bag->bag_elements >=3D MAX_BAG_ELEMENTS - 1) {=0A=
+ 		gnutls_assert();=0A=
+ 		/* bag is full */=0A=
+ 		return GNUTLS_E_MEMORY_ERROR;=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb=0A=
index b8f653d210..58acf4f1f5 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
@@ -43,6 +43,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42013-pre1.patch \=0A=
            file://CVE-2026-42013.patch \=0A=
            file://CVE-2026-42014.patch \=0A=
+           file://CVE-2026-42015.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"=0A=
-- =0A=
2.34.1=0A=
=0A=

