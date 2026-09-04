Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF317C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:37:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13870.1788529043620003550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=K01/w6ap;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.61, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T39ByuDL1PNvVRVvDq79acM8WHk3AsHQ00+Dy7jYGXqVT+HonH7AzvyNAiEueuw9UqcAjA2UvakFpvg+I/nm/vcSa3Dpi969ZAQgsK6PsLT3+8+ZqBVYwPViH7nZEcxkE2BRA7Jx8O7wge9et8RIwGXm3qzTGt9tKFImjk/Kl75+mS+CAmxDa9Ohq/CzzPlZzbMgcTf3Dt2Ma/QKlTX0dZRqW44D1cpqfra7h0dS003MsFhNr2SmjBFoGW30OWMrHBGiIVnHf1leTuILncvP5gzyqS/0YWXBsahpSc8WuJP3ySooQCYpvZDOOZhpfKKPWgSBYAgaWjqMxerJIm6TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIp0S80ril9zneGiw8xGSEcCjzxKv6NLpLq1fPAGfXI=;
 b=iuIiIA02zRIovQOGHy1fxRI8G1qXbFMpsG6YNd47lrtPS9BO8grUxGbSZU/P2djZ69HYcb86ihYSvRuC4uPaxIT10wgz83u0dYu4wABZEbRoHJHNaGeQOhNvSNyHFNXLpXRcUg9S3/dE5fjunh66D3HXjnofBhCTxXcpzOgqhQLBJzUt/G3N6EaI5XXOnK+wFmmhl/nKavAe8tVl/Y9YUJwFVIcvTcwX+dZ+5sCpp4i4elxm1+kh82LdhTdsziwe2+LH1cpk0mEDWEcAUgrInHoIgc0Ut2BttKfnt+sTfIGLjrYa8Au1Ki+mcznFp4qWjDPu5/8KzlmIGXdioE2eKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIp0S80ril9zneGiw8xGSEcCjzxKv6NLpLq1fPAGfXI=;
 b=K01/w6apakD99w3pBYPZO04dnnlrLpEBt6Juf1jNVJuwIrTn7OlB1NyVH4XxGj8TN4evN1zKpQTcwUvTHkkGDl1BkL7Fb0xCE7rTfexMzrv+ch59fun2gLz5Wi533eevUSxoi/uxj2I/OdIf3N7e4Xfofee3NJhBXnH98egLq2E4bgrB2c/0b1OBMVYLPQt5xVMepVdjrWuNa6fEBf/B/p2UVQiMZT/To1Kc7KYJkCwOWi08gn6Q9X4cDoBH75xiGHm1ZlocWBkzmcWBe3SaXhnQHwa+bhBv+rOFzXvHdUDEPF08s4btFB7VyxLJxKpGvhUHbVybezkU0IIIt4Jtaw==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by GV1PR07MB10192.eurprd07.prod.outlook.com
 (2603:10a6:150:203::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:37:19 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:37:19 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH] gnutls: fix CVE-2026-5419
Thread-Topic: [wrynose][PATCH] gnutls: fix CVE-2026-5419
Thread-Index: AQHdPHKB4JjrufrypEK8MWqeqBgCLg==
Date: Fri, 4 Sep 2026 13:37:19 +0000
Message-ID: <20260904133715.46685-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|GV1PR07MB10192:EE_
x-ms-office365-filtering-correlation-id: 93267164-abf6-40df-228e-08df0a89a459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|13003099007|38070700021|10067099003|56012099006|5023799004|11063799006|18002099003|12006099003;
x-microsoft-antispam-message-info: 
 ZxzzDTuF1UHdDh6HTl7P/58ZLw4n+EXiBh/KfPsV6zoosBkekgNql2ZQTdLr8PC3AjCmC+skUoSFJOJBHUyMNHI/+RJVEjcZiK+d1zVHsDb3Cxv/1A3890xwW3g2FDRQ6dPvnIo3VgBenWFDf6r86vQYk+CXtI/C+Fo/HQCV/vHl16wK4pGB6Rhi9UwPF3/wTt3EbLhjs3rnPMPOyqBwkvmHvYv2C+03/2E0qvMHy/J8u7z+xoEiqHnz3nNCGInkjzSdPFul3vkHX5V2zgiDvq/Lyn/LUDu/flO9p+Vcr5f03VKKHJMhdrjfTu2gdx0PUkKr8BRl0YxqRwaPgcMldYR+El18JO5OdF1S91Rw71ZGCCppOvrit5CVyoc8UIgJsjW3jwTEMGuedk9rijCQHRuXNjJhdd3vzxJ+X77W2DnSogxkGVnmVGaMDxzXVxxnk8CTBqVLoPCISy02ERPDYYBi1jIfy9DHI8xiHF7VcWh2O9und8rFaXcIpLMwABjpX7i0jqBtngGHKSendyCSc/eJNg6B4fZ8RO9CWfxQFlXnrNeoUzmP1SgVNxR9myLH/YTy0W5FpV83U5gwr73OedDVJAk+FmPhvK3t1EYaZEo5IgsqQdTjvPHlBAkingUnklYNcyDbeM0+BfeiUTuBrPGg/TN2NLV3+v0ExRDQ6RBEUqCq7vIYp1o+RM2KqNx/+s7kFCg4T6C+zFYFLXKD64KjOIabuF23aOnAPVWb5j8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(13003099007)(38070700021)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NcwFdCpJgiFvGIgiSJ/iuBzAtG4Pv5mnUQzM8Wt5OWISNSGYMwU51ViVAn?=
 =?iso-8859-1?Q?15FxFDAw3w7dBAvmGrbDPAYFggJ0A5aZozVB99Tk4uNlcBSWgJJSrr6ZNs?=
 =?iso-8859-1?Q?wNKu4QBhhjyh7UAXagc92WYYxuwSHxCziZlqmg5QP9kwRneDWCGMYoKFun?=
 =?iso-8859-1?Q?MykdckCq3jCFwk5jEjXb1DFgdEhY0M1A4El6vI4+m+0jZ8/4TytWfhUO3Y?=
 =?iso-8859-1?Q?qBOS0elf2DBBMdUN/Xg1lOMs1hZsyT3Klv80m7spylIAq0ol7tuZKOavRQ?=
 =?iso-8859-1?Q?WYCqRrrMYYpFPmfKdxnJ6EKANWb01LTkrAg0X/h25xIixwdZ0fgATJwxHo?=
 =?iso-8859-1?Q?B8Xhq8utUUBMaPC0LTsEVhZlHGZ2WeqYQ46sSlwfsx+AFZJKj8xXHouJv8?=
 =?iso-8859-1?Q?Wk9iEJmMqFEdG0PJpkUYMwSgWt4vmOLx1MlwvJEw9Smh6/qkVDKB0oWy32?=
 =?iso-8859-1?Q?WTXYD6jXbm4+HtZ1mDwwyvEGmjcQoUHCNd3Rz5vXxWnIqjU4rpqErVx22m?=
 =?iso-8859-1?Q?YKyW6nqE/sGGZzOmxYtJwwKIqz179rALjjtdvpRDBgSZWJVgjvaP67tgQa?=
 =?iso-8859-1?Q?vJGXhsGe1vl/AEYWIa9+EF0XMonEfXTjCA1rvsAlCvrGdAWBuOnrVmNku2?=
 =?iso-8859-1?Q?mPghvCKtJ1qRzRR+kkZUJ9cU1BogIE5e7F5/KS+VrcqdFuXVxaQx7iopZB?=
 =?iso-8859-1?Q?AVOD6SuPYOrlHcrxOiffjImE03X3CFHl/KlapxlhFabh2cmn3KgVWWjq0j?=
 =?iso-8859-1?Q?ucotBi0+GoD/KYp6t7IjcQ9v08WNmXJxj2tGV+4HVuM4KFFoIYffNbI3Lf?=
 =?iso-8859-1?Q?5cKNK9zqESv1Lkf+gpQWNnDE6cOwqhYfEAHDbOsJPmVYWByN5Gpbf5X4EQ?=
 =?iso-8859-1?Q?lGuAW+fmqp8QGahpm2MvpuOc9tNU8MYXp7J5LQZ4Q3jo2WXOLY3eQ4kvvE?=
 =?iso-8859-1?Q?hK6GSiAnp2WUIdE/V+2sVVc8Ton7a0P5gL5a9hsiyhPr7tHnWLq0h2f1/t?=
 =?iso-8859-1?Q?gbCLL6GE3l8VIBqjCxyJheXpYKG6kts57mtTwR8B9w5wr3p51+YKDIMBtR?=
 =?iso-8859-1?Q?gKc+KaHHgZv1r0TMSbKIdXy/e7oT+ztqdjFSZAcsREBKVYpgrnkkPklHLc?=
 =?iso-8859-1?Q?XiV2ZlJEEyqNo/Ba3vTdnrPKLolEL9UPvGXns00UdC644NT30GI0pYHy3Z?=
 =?iso-8859-1?Q?kzQHPsQ0icEEjDCp8tVn+lhU35lTOYFwTsY463nBjhAiF4wU4XG7LGuOLg?=
 =?iso-8859-1?Q?y4xaixPdmI7iy0PCJ1C68u9PYqg078x6E1nrxoq2Va9Ye4xdN7Tqh41GYf?=
 =?iso-8859-1?Q?tKqtOoFnTNFQt1PlUzGmLiDIkW4CDP7AW24dHy7u0gNnUYzuxTzv4XfXmN?=
 =?iso-8859-1?Q?4W949vSbGs1xyoUuxrf+v5FeQiQeNDH6RWobeoiawclbDvWMRzc0II6ysm?=
 =?iso-8859-1?Q?8d3oLP1d11U2rbsTMW3aa9dZ9pz930MLvttxJjC9bFYjD9R7WKfLO56Oyw?=
 =?iso-8859-1?Q?gyRErSR0YB4nFwazEaHFndOg4wT+43eMNK5H7095j72PSNfM+J6K4J0Z7N?=
 =?iso-8859-1?Q?2FcuvJu0QUyc6403PIwTMSDjDXovB0qqflite7rDfxe/61GnImPI0Fkc19?=
 =?iso-8859-1?Q?JCnLWFh5qPLXF218/Kt3OmeyNVjAGPkr96ktx2RgPByn9BrDF7EWy4sFRK?=
 =?iso-8859-1?Q?2DBXHXp/uBdFpvORquozJvWzqsoDH5tLqLGZ06P5RSt7o7wyQD2gpzCOnD?=
 =?iso-8859-1?Q?lLZVoRfcFTj9TlEhAuBSBjmfVrAR/CyzZOly6aozKg7jrBJHQfoYBtUG0z?=
 =?iso-8859-1?Q?Q17A9WYfdA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93267164-abf6-40df-228e-08df0a89a459
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 13:37:19.3540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C73k0v97jv+lGkBL/Yk+IwXM4GBWppJVcDJV8eKjpVlHwRWPTM0gx9GvGW/HVeYQWvhvPjv9FEoE9lfc6J2w/Jl9GUauLXUW1JZ/kWeX4Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB10192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245109

Backport patch to fix CVE-2026-5419.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-5419=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a00999=
7b081a1ab=0A=
=0A=
Tested with ptes=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-5419.patch         | 247 ++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +=0A=
 2 files changed, 248 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch b/meta/=
recipes-support/gnutls/gnutls/CVE-2026-5419.patch=0A=
new file mode 100644=0A=
index 0000000000..f75aff35db=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch=0A=
@@ -0,0 +1,247 @@=0A=
+From 2f3732538d7d8e1ae255ca68c20efc61a1d5b3e2 Mon Sep 17 00:00:00 2001=0A=
+From: Daiki Ueno <ueno@gnu.org>=0A=
+Date: Fri, 4 Sep 2026 09:17:32 +0000=0A=
+Subject: [PATCH] gnutls_cipher_decrypt3: make PKCS#7 unpadding branch free=
=0A=
+=0A=
+This tries to make the logic of PKCS#7 padding removal constant-time,=0A=
+by removing potential branching operations.=0A=
+=0A=
+CVE: CVE-2026-5419=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1e627=
aa5ad95c6dc0518d94e9a009997b081a1ab]=0A=
+=0A=
+Backport Changes:=0A=
+- Adjusted the upstream hunk to match the GnuTLS 3.8.12 code layout.=0A=
+- Drop .gitignore from the backport.=0A=
+=0A=
+Reported-by: Doria Tang of Stony Brook University=0A=
+Fixes: #1815=0A=
+Fixes: CVE-2026-5419=0A=
+Fixes: GNUTLS-SA-2026-04-29-13=0A=
+CVSS: 3.7 Low CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N=0A=
+Signed-off-by: Daiki Ueno <ueno@gnu.org>=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+=0A=
+---=0A=
+ lib/crypto-api.c  |  53 ++++++++++++++++------=0A=
+ lib/libgnutls.map |   2 +=0A=
+ tests/Makefile.am |   2 +-=0A=
+ tests/pkcs7-pad.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++=0A=
+ 4 files changed, 152 insertions(+), 14 deletions(-)=0A=
+ create mode 100644 tests/pkcs7-pad.c=0A=
+=0A=
+diff --git a/lib/crypto-api.c b/lib/crypto-api.c=0A=
+index 01539d5..7749fcd 100644=0A=
+--- a/lib/crypto-api.c=0A=
++++ b/lib/crypto-api.c=0A=
+@@ -497,6 +497,38 @@ error:=0A=
+ 	}=0A=
+ 	return ret;=0A=
+ }=0A=
++/* If succeeds, returns the number of padding bytes to be removed;=0A=
++ * zero otherwise.=0A=
++ */=0A=
++ unsigned int _gnutls_pkcs7_unpad(const uint8_t *block, unsigned int bloc=
k_size)=0A=
++ {=0A=
++	 uint8_t padding =3D block[block_size - 1];=0A=
++	 volatile unsigned int mask =3D ~0;=0A=
++	 volatile unsigned int count =3D 0;=0A=
++ =0A=
++	 /* Count consecutive PADDING bytes from the end, in a=0A=
++	  * constant-time manner.=0A=
++	  */=0A=
++	 for (size_t i =3D block_size; i > 0; i--) {=0A=
++		 volatile unsigned int mask2;=0A=
++ =0A=
++		 mask2 =3D -(unsigned int)(block[i - 1] =3D=3D padding);=0A=
++		 mask2 &=3D -(unsigned int)(count < padding);=0A=
++ =0A=
++		 /* MASK is initially ~0 and will be flipped to 0 upon first=0A=
++		  * non-padding bytes.=0A=
++		  */=0A=
++		 mask &=3D mask2;=0A=
++		 count +=3D 1 & mask;=0A=
++	 }=0A=
++ =0A=
++	 /* PADDING =3D=3D 0 is effectively excluded here, given COUNT=0A=
++	  * will never be 0.=0A=
++	  */=0A=
++	 mask =3D -(unsigned int)(count <=3D block_size);=0A=
++	 mask &=3D -(unsigned int)(count =3D=3D padding);=0A=
++	 return count & mask;=0A=
++ }=0A=
+ =0A=
+ /**=0A=
+  * gnutls_cipher_decrypt3:=0A=
+@@ -532,22 +564,17 @@ int gnutls_cipher_decrypt3(gnutls_cipher_hd_t handle=
, const void *ctext,=0A=
+ 	if (_gnutls_cipher_type(h->ctx_enc.e) =3D=3D CIPHER_BLOCK &&=0A=
+ 	    (flags & GNUTLS_CIPHER_PADDING_PKCS7)) {=0A=
+ 		uint8_t *p =3D ptext;=0A=
+-		uint8_t padding =3D p[*ptext_len - 1];=0A=
+-		if (!padding ||=0A=
+-		    padding > _gnutls_cipher_get_block_size(h->ctx_enc.e)) {=0A=
+-			return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);=0A=
+-		}=0A=
+-		/* Check that the prior bytes are all PADDING */=0A=
+-		for (size_t i =3D *ptext_len - padding; i < *ptext_len; i++) {=0A=
+-			if (padding !=3D p[*ptext_len - 1]) {=0A=
+-				return gnutls_assert_val(=0A=
+-					GNUTLS_E_DECRYPTION_FAILED);=0A=
+-			}=0A=
+-		}=0A=
++		size_t block_size =3D _gnutls_cipher_get_block_size(h->ctx_enc.e);=0A=
++		uint8_t *block =3D &p[*ptext_len - block_size];=0A=
++		unsigned int padding =3D _gnutls_pkcs7_unpad(block, block_size);=0A=
++		volatile unsigned int mask;=0A=
++=0A=
++		mask =3D -(unsigned int)(padding =3D=3D 0);=0A=
++		ret =3D GNUTLS_E_DECRYPTION_FAILED & mask;=0A=
+ 		*ptext_len -=3D padding;=0A=
+ 	}=0A=
+ =0A=
+-	return 0;=0A=
++	return ret;=0A=
+ }=0A=
+ =0A=
+ /**=0A=
+diff --git a/lib/libgnutls.map b/lib/libgnutls.map=0A=
+index 955704e..5cc12c8 100644=0A=
+--- a/lib/libgnutls.map=0A=
++++ b/lib/libgnutls.map=0A=
+@@ -1574,4 +1574,6 @@ GNUTLS_PRIVATE_3_4 {=0A=
+ 	_gnutls_pathbuf_append;=0A=
+ 	_gnutls_pathbuf_truncate;=0A=
+ 	_gnutls_pathbuf_deinit;=0A=
++	# needed by tests/pkcs7-pad=0A=
++	_gnutls_pkcs7_unpad;=0A=
+ } GNUTLS_3_4;=0A=
+diff --git a/tests/Makefile.am b/tests/Makefile.am=0A=
+index ab2685c..1304d2f 100644=0A=
+--- a/tests/Makefile.am=0A=
++++ b/tests/Makefile.am=0A=
+@@ -241,7 +241,7 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast set_=
pkcs12_cred cert certuniquei=0A=
+ 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \=0A=
+ 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-fre=
e \=0A=
+ 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \=0A=
+-	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \=0A=
++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 pkcs7-pad \=0A=
+ 	 mini-dtls-fragments=0A=
+ =0A=
+ ctests +=3D tls-channel-binding=0A=
+diff --git a/tests/pkcs7-pad.c b/tests/pkcs7-pad.c=0A=
+new file mode 100644=0A=
+index 0000000..d4c3798=0A=
+--- /dev/null=0A=
++++ b/tests/pkcs7-pad.c=0A=
+@@ -0,0 +1,109 @@=0A=
++/*=0A=
++ * Copyright (C) 2026 Red Hat, Inc.=0A=
++ *=0A=
++ * This file is part of GnuTLS.=0A=
++ *=0A=
++ * GnuTLS is free software; you can redistribute it and/or modify it=0A=
++ * under the terms of the GNU General Public License as published by=0A=
++ * the Free Software Foundation; either version 3 of the License, or=0A=
++ * (at your option) any later version.=0A=
++ *=0A=
++ * GnuTLS is distributed in the hope that it will be useful, but=0A=
++ * WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU=0A=
++ * General Public License for more details.=0A=
++ *=0A=
++ * You should have received a copy of the GNU General Public License=0A=
++ * along with GnuTLS.  If not, see <https://www.gnu.org/licenses/>.=0A=
++ */=0A=
++=0A=
++/* Test that _gnutls_pkcs7_unpad is branch-free, using valgrind */=0A=
++=0A=
++#ifdef HAVE_CONFIG_H=0A=
++#include "config.h"=0A=
++#endif=0A=
++=0A=
++#include <stdint.h>=0A=
++#include <string.h>=0A=
++=0A=
++#ifdef HAVE_VALGRIND_MEMCHECK_H=0A=
++#include <valgrind/memcheck.h>=0A=
++#endif=0A=
++=0A=
++#include "utils.h"=0A=
++=0A=
++static inline void _gnutls_memory_mark_undefined(void *addr, size_t size)=
=0A=
++{=0A=
++#ifdef HAVE_VALGRIND_MEMCHECK_H=0A=
++	if (RUNNING_ON_VALGRIND)=0A=
++		VALGRIND_MAKE_MEM_UNDEFINED(addr, size);=0A=
++#endif=0A=
++}=0A=
++=0A=
++static inline void _gnutls_memory_mark_defined(void *addr, size_t size)=
=0A=
++{=0A=
++#ifdef HAVE_VALGRIND_MEMCHECK_H=0A=
++	if (RUNNING_ON_VALGRIND)=0A=
++		VALGRIND_MAKE_MEM_DEFINED(addr, size);=0A=
++#endif=0A=
++}=0A=
++=0A=
++extern unsigned int _gnutls_pkcs7_unpad(const uint8_t *block,=0A=
++					unsigned int block_size);=0A=
++=0A=
++static unsigned int wrap_pkcs7_unpad(uint8_t *block, unsigned int block_s=
ize)=0A=
++{=0A=
++	unsigned int padding;=0A=
++=0A=
++	_gnutls_memory_mark_undefined(block, block_size);=0A=
++=0A=
++	padding =3D _gnutls_pkcs7_unpad(block, block_size);=0A=
++=0A=
++	_gnutls_memory_mark_defined(block, block_size);=0A=
++	_gnutls_memory_mark_defined(&padding, sizeof(padding));=0A=
++=0A=
++	return padding;=0A=
++}=0A=
++=0A=
++#define PAD 5=0A=
++=0A=
++void doit(void)=0A=
++{=0A=
++	uint8_t block[16];=0A=
++	unsigned int padding;=0A=
++=0A=
++	memset(block, 0xFF, sizeof(block));=0A=
++	memset(&block[sizeof(block) - PAD], PAD, PAD);=0A=
++=0A=
++	padding =3D wrap_pkcs7_unpad(block, sizeof(block));=0A=
++	if (padding !=3D PAD)=0A=
++		fail("padding should be %d\n", PAD);=0A=
++=0A=
++	/* The last padding byte exceeds the block size */=0A=
++	block[sizeof(block) - 1] =3D sizeof(block) + 1;=0A=
++	padding =3D wrap_pkcs7_unpad(block, sizeof(block));=0A=
++	if (padding !=3D 0)=0A=
++		fail("padding should be 0\n");=0A=
++	block[sizeof(block) - 1] =3D PAD;=0A=
++=0A=
++	/* The last padding byte is zero */=0A=
++	block[sizeof(block) - 1] =3D 0;=0A=
++	padding =3D wrap_pkcs7_unpad(block, sizeof(block));=0A=
++	if (padding !=3D 0)=0A=
++		fail("padding should be 0\n");=0A=
++	block[sizeof(block) - 1] =3D PAD;=0A=
++=0A=
++	/* The first padding byte is invalid */=0A=
++	block[sizeof(block) - PAD] =3D PAD + 1;=0A=
++	padding =3D wrap_pkcs7_unpad(block, sizeof(block));=0A=
++	if (padding !=3D 0)=0A=
++		fail("padding should be 0\n");=0A=
++	block[sizeof(block) - PAD] =3D PAD;=0A=
++=0A=
++	/* The byte before the first padding equals to PAD */=0A=
++	block[sizeof(block) - PAD - 1] =3D PAD;=0A=
++	padding =3D wrap_pkcs7_unpad(block, sizeof(block));=0A=
++	if (padding !=3D PAD)=0A=
++		fail("padding should be %d\n", PAD);=0A=
++	block[sizeof(block) - PAD - 1] =3D 0xFF;=0A=
++}=0A=
+-- =0A=
+2.43.0=0A=
+=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb=0A=
index 3ad011742e..daabe22de3 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
@@ -37,6 +37,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42009_p1.patch \=0A=
            file://CVE-2026-42009_p2.patch \=0A=
            file://CVE-2026-3833.patch \=0A=
+           file://CVE-2026-5419.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"=0A=
-- =0A=
2.34.1=0A=
=0A=

