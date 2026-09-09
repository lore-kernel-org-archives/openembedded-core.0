Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939F2C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:37:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6416.1788939434350194813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=p6SrL7b7;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.30, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nj39bqKZMAmI7s5XKi6yal97cHnte2c0hdj6KajOg38lGGVB5C2Gvu4cEP/TFNiVwWDxa6X6bDBmU8BzKUQVf2EJ4ADclvb0WRxBSV7ZHacwfkbxnjYLYxc/071noaqRaqwiXiRl+Ymulr2onHeX7cyFe6hkLgKhxIHemrd+UNOtBkueuSy44o8DdsuBr7os5vHsGsik3o0YG3pLm3UOTOBKlV4JBKK8krRcPwLfFjU3IIQTL7uOKLGg5Ndch65odLHifFp/H4Wa4bzl9KfAZsRxMqCu7LsVYaD3o9yNm4UDUGZCcjxMkxs+89ppc/zSxTHa/ugZULRVX52r+kLc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkl9Zkga0VwCgmjhxwYSQOrf0Y5QaqU80wr1iLQDTnc=;
 b=CIaSgPKl++AZHONStFheQfLNesb4gexNtNUDlPiejKYOe57/c6Bmztv7wajowqeRnu7bTIOBovfesc9l3+kdXOzAgbeeax+e6rmstwOr0jO794ir0Mhxn/skEJdhTlEs62psdHWPLUChPkI3cGgrS3jdyqNLR4R1FA3Io9ryUW/3xjbSa37uIW8RhI8ZqtT2SZSaXE8A8rr27ie1WyViQJJwyB/xPQx01175FXb8orp9FPsUi8TyU5w0SlNK6SH/OedYw/BLd3XIbksyTKC4puUXTzH/NjTduIJOmCjCwOmB9PlyC2PAD3jwBiUbP/wWaHZ3WO3zreeKoz5SYhS/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkl9Zkga0VwCgmjhxwYSQOrf0Y5QaqU80wr1iLQDTnc=;
 b=p6SrL7b7TaPp1yPUBNzskvm0gr6EopMXmJ59HOamQ2RlYhM8bgtNN+NJX08P+KndXsvb+36++/teMuUnFux1mYcazmdvUe7oHKbHAvAmH6Y7qPcL6RFJGq3WeXv1sg49XAzrmNT7HaMLEJfrri5HYsoTJX44ozqmjBhNDchhebc6UH/D3DBrCyTm4u9Osk8uSz0lBraqRPo4gy3GTlCCD+aAorF1TJmz+4ooqP2UnRwROXnxwBvyZr8FImglk7Z2fpBtXg1Z+Ffzmke4UnKiKslP6kfYTWLENLwbicOu6fq64te9UmuRAgilLdGuGoogass0YbHRBmtVPPGAvB2N/w==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by OSKPR07MB10303.eurprd07.prod.outlook.com
 (2603:10a6:e10:99::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 07:37:09 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 07:37:09 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH v2] gnutls: fix CVE-2026-5419
Thread-Topic: [wrynose][PATCH v2] gnutls: fix CVE-2026-5419
Thread-Index: AQHdQC4FUWY4Qec7O0qfz49yp9GI8Q==
Date: Wed, 9 Sep 2026 07:37:09 +0000
Message-ID: <20260909073704.15560-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|OSKPR07MB10303:EE_
x-ms-office365-filtering-correlation-id: 5cbfac2d-9d91-4c99-1a50-08df0e4527e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|13003099007|38070700021|10067099003|56012099006|5023799004|11063799006|18002099003|12006099003;
x-microsoft-antispam-message-info: 
 wIk14IMkF9NUvpoCI3lSBAw89D/O0PYM7X3p22oxJKLvHmDQlhDDTZzJcwkPeVMuVP4eY7aZU9uyk7EpoyXspVumW8cJZg6aLKDsrjxhF0DuWi/7jelRrDQPaT/wPqYTEexVKk4xKmsnzeYitwxnLkbfz5HHOKfVg6v0C5VNVP3XhB8D9+WavV/CvH2886RWq00VRcLVk5c70SX9uE9lhq87j3vGwIm/fKt8voQA1yaQt9ITUuCWprstfePuhA6jMqa0prbgqNvc5CmLeEMJpP4feJy3pc6NLwmFZuVcFYAEcF3dA4dTRC+NpDGWutyT1Hm3XSKsHUxG9kbvMR+6qLvSOEu+CDzUN1RcjPerDsI/1as7Wzgv0yGVFNDZC64AI6Xo5Z6+bJ8eoVshqPHdwqUMwZXNnrC9gjoWnrbfc4c4MHw+UvNlxiVaJ0HRzIgF535ijQv2FZ4xdjqIZ7uYp23gmO2ogjZ8JMY2GZ0W1uiVeLMWTx1oKOrMcTSE3zbayeeu+6Vdlmt/bxx/eUjO9YdLI7Ixvosg1ltghEc+2Cq1vAWvZkGBhnjI8KDPmdvYgtUT21BOoex3w0aN81KCGdWWShUCgfpcyzFGC1FoNejwhKvkyyFQRvoaADMEtOw5qOTC3hTMAhtqs91Zgai80Bg+WlhWFm+510+o0R97YIJo8uE/g1yVkNXw5abqdYAzbTQDEb8JjoPs4yfTqZykexMaYjULPqBA43ATIp4Xfqo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(13003099007)(38070700021)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?d7OjLRRQuXIkDN0IVNZiQT61S6uKayRjwIO7ZO4+UTAVwZrstO9g8SuqHK?=
 =?iso-8859-1?Q?dTAlRz8E2VRd9xBHUj5sq2OBB/psStU8owLBtCDJ7rgvT4O0zdzEgWQtTY?=
 =?iso-8859-1?Q?VgwJQSu666B4qm7Gw5cH0kkdKg6M3YCs+fSrnVwQHjiipwQA+7SsVsmaN3?=
 =?iso-8859-1?Q?pqa8SGipQXvF2TroP87V6hDnUZGyHkjg2ihx4J6eWSeoplFa4qu68tbsBY?=
 =?iso-8859-1?Q?6rFMqyCamkmztvScW34A5foeNRhcCF32TGs4okbYjOgP98tIXy+l2fqRPA?=
 =?iso-8859-1?Q?+azmsz12LYxXwJ7NlbkHAnzGyPgpC145FkDQQ1Cw+zhgrWJE+ssSJlMQ+g?=
 =?iso-8859-1?Q?NOdfV2juw2o0IAWQDiRb2psA5clJGQ1cRu9BG5oNiJkDjHEg14DchRs8er?=
 =?iso-8859-1?Q?PhAN3IYFemCkTpPe67gPTvxiMNGwL6s1lFJMTXHq7zbagYOYdVBKXZVp+g?=
 =?iso-8859-1?Q?sDbVbCya0rPYoZ4Ep8TTBTNDSqCNn39i61pnWJK8mRy83SKIwpl0cyx6Pi?=
 =?iso-8859-1?Q?W3zB7aXP4eO+kj6HyWBWSwIre1Ix/4wAf1+79lWy7m6eY1qM5XvzzPfsmD?=
 =?iso-8859-1?Q?UFjWRIFsTExLoqFGdiJvj5HQk7C2tgLEqhCdxfFMU9FrwqiK87Ai3HZOUF?=
 =?iso-8859-1?Q?Luc1n37MNMJ/Us5h5QxQKNH8qfpmSac1GQTeWOfYR8y2kYnNqi7iEgr0Ug?=
 =?iso-8859-1?Q?bpZdGnx7DfQikDofutNtFnKOhwCiRUwCwiTsg1A8iIisoxECXyqiuuycgA?=
 =?iso-8859-1?Q?W2a7B+PBDZf7PKpaBnIvxlcvL+T5mm6NwGTJInjX0BFaUQNDnBewtICEuK?=
 =?iso-8859-1?Q?DV/cAtParNweo8WkGX74EH12wg2xNYYJXu7UrfDsNueO59UAugfKTTUsOQ?=
 =?iso-8859-1?Q?+fyGhK4c3AmFs9pQZiX44ppoOyiert21YvJn0Wk7Pcv+z2pQPHbXzHvGKK?=
 =?iso-8859-1?Q?HEPiesAOPcPBWEF9Lymot2YUwuhP4u4IFej1/g7BhToxvxenEFQLbTyANs?=
 =?iso-8859-1?Q?eIz0IvRTOYEiRhvprEIQf6EUeGPIKmkLg/SRb8MO/o0Dsl3cN+DROk3D+4?=
 =?iso-8859-1?Q?/Y58Q6jT04jiWkgV5XdqM9/kxDElJwSuEctfQ8dqCoMroIFK75GNX/PI+x?=
 =?iso-8859-1?Q?Zvyr05siY0Ud3w/7welIzCeZTY0AfgTQsI/jiU6tPkBwEoBXndrwyGKEpe?=
 =?iso-8859-1?Q?A74VOGM76WTlMKfv9RfzNDIfDkeI0bS3O8UeRvlvkDieX6FHy4YFc7PDiI?=
 =?iso-8859-1?Q?7k5y8Rn7iN30SdAU2m09k5pOeL6xWZtR3Ve1bYuXZdNCFSYPWgf0+UZZ+8?=
 =?iso-8859-1?Q?MoK4kq5+v++XHL9aH7g1By1pRRBni9z8GWdowiSRsQR3S0tHwKPgHLKcWi?=
 =?iso-8859-1?Q?A149aSVoVQOIzDWuZQU4HZQM2wp/DUdJLp+k7SggIjZag/rv+fBcHQHuYm?=
 =?iso-8859-1?Q?mrZBJOQDt0EyxZ/y47Hom5UwYuRXoECsREb8WKDmkbI9mFOhvImRthZ87B?=
 =?iso-8859-1?Q?U/6d17DzXOAHD2Z/YoaxroFJLdLWwkx3Xt30f59IS3u/RvB/CJR4Rzq3Vb?=
 =?iso-8859-1?Q?uGJy0fH2upogH7oweYRzQYVZRwEO5UmcgxNstAo609T+wXXD//IijUbA4A?=
 =?iso-8859-1?Q?Zqep+U2QVeao5wqxhvtxpQC+EHXUh3OFldbarQ/+7ouzePpbMZtJnbD6gt?=
 =?iso-8859-1?Q?vIaHAffn9vGWuMo24nllZeMH3PoVPbBkQx7VkNberPv4OBbx3RYdNDLU9N?=
 =?iso-8859-1?Q?6Cm12Zg1ycwiK31RVhpRXRhhqbAcH+2VmdEOXglcJyAUoHB7zqxBGF81St?=
 =?iso-8859-1?Q?LM5M9XRhgQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbfac2d-9d91-4c99-1a50-08df0e4527e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 07:37:09.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IH1tAkfF4nbBwgprUtbp1vUrENelpFydUBacaqLbwYPkWXK2Gyf60ed5R0Hc02Q27BgT8+CyajmRLGcE8jgtlMYLtTplXGpngAx3XKNFWqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR07MB10303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245448

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
v2:=0A=
 - delete unneeded spaces from function _gnutls_pkcs7_unpad=0A=
=0A=
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
++unsigned int _gnutls_pkcs7_unpad(const uint8_t *block, unsigned int block=
_size)=0A=
++{=0A=
++	uint8_t padding =3D block[block_size - 1];=0A=
++	volatile unsigned int mask =3D ~0;=0A=
++	volatile unsigned int count =3D 0;=0A=
++=0A=
++	/* Count consecutive PADDING bytes from the end, in a=0A=
++	 * constant-time manner.=0A=
++	 */=0A=
++	for (size_t i =3D block_size; i > 0; i--) {=0A=
++		volatile unsigned int mask2;=0A=
++=0A=
++		mask2 =3D -(unsigned int)(block[i - 1] =3D=3D padding);=0A=
++		mask2 &=3D -(unsigned int)(count < padding);=0A=
++=0A=
++		/* MASK is initially ~0 and will be flipped to 0 upon first=0A=
++		 * non-padding bytes.=0A=
++		 */=0A=
++		mask &=3D mask2;=0A=
++		count +=3D 1 & mask;=0A=
++	}=0A=
++=0A=
++	/* PADDING =3D=3D 0 is effectively excluded here, given COUNT=0A=
++	 * will never be 0.=0A=
++	 */=0A=
++	mask =3D -(unsigned int)(count <=3D block_size);=0A=
++	mask &=3D -(unsigned int)(count =3D=3D padding);=0A=
++	return count & mask;=0A=
++}=0A=
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

