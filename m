Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6173FC79FAA
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:37:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6555.1788939443046327527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=Z9wPnRsl;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.69.23, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDCDRbb+coWDHjA9Y6G+xU1AfyiT16BmzjYIxCw81mguEg/Wd2nnP3lMOy9lzcdJaDT3cVbAw/9S9Cbj8xR/UXJLSM6R9CD/2abXy7dQUH2f3CHHwp6SWe7B6BvnZ6D0EENyqSl+/CzkqKpYFOm0JLPgGYWx75fyFKIgkKPLC3R+cwe5TxI9vlLOMxDFhR+I7DnGLS8R0mbGpRO04HFOlHcvMcs8k06T7mlrGGel3l6X3wsPwbtr96DCIbMWer+9/n3K8on4JgwdMBnPO2X1SkkphXI3lgDXMkvlGKoHLwZJE2d/ngAARd7DFXfRf1YIVquQuYZ2TlpFrombF7GYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faWsmshuBUKbRPzwoKWiamIQ9FQSyFmGsDQUHaIlaaE=;
 b=fyAmfKCdJ6FjqWiFiSApsq5nPYMelAOiCwsO0rIcs1duszfOZ4KBBqyUkfckFV8p0uL5nPdQbCvfIkuATPQJ6vxNH1qI+cQQd5yuJ3A0BaJQfxZbe05d3Ev8bFdoWturBvjTnao+yWMMEBz/N1oJIRDrWJEGjl+0gN1JorvtYjLxI3DddQPJJDhjb45BeXpsIzs8iYKx5KrgSFJtfLC/xiTlSqtjztylks2bw3KwpMUPVT2VdxCDuQSRy0HRfeMGgrnMR4AADex+h1UHluqen38Ev4akRuPuxGBZvd2Pw7a3f7ihME/mVL5KxmLp7Cp/DsQnYr6hvEyukUrAniEsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faWsmshuBUKbRPzwoKWiamIQ9FQSyFmGsDQUHaIlaaE=;
 b=Z9wPnRslozVYjpBbxBtwiVY9UujXKhPXNgRpXbomkBGU4yAcHvnvK3Jq0CHMZQe92kgRAABSM4mL7XUz1q8JOYc7XuXLUBbt7DPLQTf+Mf9AqsOZVmBazJkDOXT9Y5kMlgoT+AGBpu57ET5A2kGAtmvbvOlnt5ihe6tsXunS6UMj2tPgU6N5SU31BscdLpGzhjNEMRYomIedPHGH8Ghv3rN5ACoeQMfFpxOc4vjrjBOYZd/OBox978pTQBdY1Z/lHhUcFqVQA1ryAqdLjsMtPhSuBGR60qnwDr5RG5fHEMhE8/krlbn2uc3z2AY55n0nJzfH0fPfx3CE6QvjHEPlDA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by OSKPR07MB10303.eurprd07.prod.outlook.com
 (2603:10a6:e10:99::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 07:37:18 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 07:37:18 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH v2] gnutls: fix CVE-2026-5419
Thread-Topic: [scarthgap][PATCH v2] gnutls: fix CVE-2026-5419
Thread-Index: AQHdQC4K8brBsWaKrkqG6h8Cf2z3Ng==
Date: Wed, 9 Sep 2026 07:37:18 +0000
Message-ID: <20260909073715.15668-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|OSKPR07MB10303:EE_
x-ms-office365-filtering-correlation-id: d4e83b2d-558b-4dc9-19bc-08df0e452d60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|13003099007|38070700021|10067099003|56012099006|5023799004|11063799006|18002099003|12006099003;
x-microsoft-antispam-message-info: 
 J3Ef2xco5P4Ycq9dBNrsRNtLOnxmamlgW3hQeQki5I0ZHqLc4Qwx4pUXSQ7jjl0T3Axb6CRQkEzoUfS2qXRpIwUAJlMRFK61eiig8sIXKNkkYt3IGsAg75ov0Gw3XVO6FtTXg7z16YumIHgn6mM6+fCGFUeCq7dF3LPQivumCg2y7+Oz3TSDNXgbkFUUGZt31UifZYmmtjkbCp4X55FpzptpYsPNbFAKZdvT/DjFOv27ZCJCgVs+UJVqatSsGwZP1RcPvcDRPIG3dRc4fZpzt4sH85/LnhXT1JcaHN6G3tQQGyeOm43eJQgoH2DRe9xa4FhlxclXFTXnIX3X2vJBDtaSwq+Zu5+tCnkVgpEEX3iIgaCPEWaR8QbIhkj+FTYLer2WjRwZ0+PWuKaar3HdNBDapXJ9U6h4pQaVhYMh+sQ6mB0sZw1FdhYE+KJQIN9ieCnAxdRxRi2VycMa2zKbra38xUfRRnj1+12QIfE8bLx/qoMAl/qsgOuDYOS6mk3r1SshLLzEShZ7CIZEYp317X0kBV8wUt8EnsBPz93Q0MhlkBDjcbfv62MmxffiTvZNfKt3bm7wkHbuyjMfO6p3YCk8HRpj5y6VFFExbE3Ia6vc9gtCdckIFF7GoOK5qp2bgWb9Clx05IuQBGUsf5fQYz278mBBTH3erSFemfs/AeHcX9Z/JuSc7cBTk/WVlchqdDPQ5Qocc5d1kVd9FqZpwJfFzj8n76UkwyHW8Flh+js=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(13003099007)(38070700021)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GhYkKJfAxsp2NOV1QFQ/geAKPcfMB7XJJRLjSYZq9TC1OohpNlV0nL/wY9?=
 =?iso-8859-1?Q?2P5mNh4IASouduzVY8RhKEs79tS/DdAkBVOTOfOgj5LGA2qbT4vr+KiSoL?=
 =?iso-8859-1?Q?aKpENqHrW0E4kPEijGx1UIwLmPAC2SN3OIKWbNwLZebTz+dP7CnC5baE2g?=
 =?iso-8859-1?Q?p5XGck/VJIhIZPTKhxMaX3CM0F3IWQbHmNqmJN2uvwsl7mjXvR2YG9adun?=
 =?iso-8859-1?Q?9vZlTQXwovDWkZSl4Krc1A5XsXFhhuOuYc8qbTnrZErn6DZlpqpgApmsWE?=
 =?iso-8859-1?Q?YNsXP7HJZRGgN9bijl/vCco9aCvFCf5bUgPmKUNtQ6/H3sNN9wZPVtxbj+?=
 =?iso-8859-1?Q?5pg0ozCykGKb3E6yRDfdSnajfkpiGukyx03Whc1Ag5guwHIB1AazwuvSIn?=
 =?iso-8859-1?Q?WBUnXmIMaeH/NYkf8Ooj1HtJHU4zRSbmU5ONclIiZd29pbLPqZNpkoFuod?=
 =?iso-8859-1?Q?9f0ejc/x+en0s9xE8gJF0ObCYhOqI0wJ9Ecbyuk9sqvO7sQ38KD4ITpdc4?=
 =?iso-8859-1?Q?F3Fr/Hi//EdlBS7LwjT+QGWnrj0TIdjLqbJ8QQHwUHy1L3k2Hh0ggkL/4q?=
 =?iso-8859-1?Q?o/5rfRMqe6atYrpykOdqa8sPQGZq1V5IosKVgSG4bsFakp/cIHQ2rOf+xw?=
 =?iso-8859-1?Q?NGd9LAyKJg+UkX1/HEIUPvOfLzNZ2P+0p1dOfS+UB0XyisQ6s4xlTLmUzK?=
 =?iso-8859-1?Q?hDzuCcepRU7vrVzXUFO1fzYDs3r4TyM4glgLgnFpugn19o75A/StZAttie?=
 =?iso-8859-1?Q?1JKZPYGEPlKLqY5gteSvm30QoNYdh8AlUHK2agTAzEq8WmHMNu0fDH9ZMA?=
 =?iso-8859-1?Q?6L5R5TVmKtmN4vqs8A+OfwRUwr/YIUdGGuPucTDLZ+84rOfSQuhTMdWLsN?=
 =?iso-8859-1?Q?9ESBKnyaUNHTlvIhL2p5rQTtwAwwlyCx3iDN9hqriBMdIfyY0gayFySsmH?=
 =?iso-8859-1?Q?IhuWNDmB2N5m8bQcS+ZZjDhxCsJSY6fhMfvrZ+R8zuiIJOewuNJA1Q2y4d?=
 =?iso-8859-1?Q?fl+rP4XXdlj4tnoqtzdu7Ox56hM1hLNLGVBABuaLtuHcFGkz1OctGN/2F7?=
 =?iso-8859-1?Q?DrA6kMiGJ2x4DBePD2nVjlgmNtBPqKaVbbsufe+ls4coxO76D5HHgKwZ6f?=
 =?iso-8859-1?Q?4BYyiZdZRrG50VuRrkzcnMN9paxOKu14Wj4ro69LA5THFJgB9+LfSMKYMs?=
 =?iso-8859-1?Q?hWNNHV/0ikTuT2FwFTUbbU1gn0TzVr4mI6aqxYSbGOamr81xEhz24CBo8D?=
 =?iso-8859-1?Q?tyBEm7okkEGCd8vlNxo3DuEBefA6bs9eL6kH+ZH2TO/ipVKs4x5b0MYSpu?=
 =?iso-8859-1?Q?Tx0YJUwzZxmC1D4cNSNpZRkRMaHh0oKN6v1yAUWLqSq879zey22wXW4Obl?=
 =?iso-8859-1?Q?nk6qkE1vYEcy1s06no9gZByxdBFZMX6vNcwJc+0tNnKwxk+00tDwyDYnny?=
 =?iso-8859-1?Q?ZsFzF6dDJfCXKVDJAm/x2/WR829MZ4Q1EoGRBnJ4o7dR86RIlTG6BlK7Q2?=
 =?iso-8859-1?Q?Q5/tQWc4/PyIHbhpUvix0Q/rJEfAJtkwSqCREKiZFEUlMi8yNtkyv+POu2?=
 =?iso-8859-1?Q?6cPi7rHv2tzW+d/N638Yk4hBlBIVeTTzSTZEkv7SXYn0Dppr5wJL7wL3Jl?=
 =?iso-8859-1?Q?lxk7GFUS0qh0NkcD+9hSfX4ENGf00TWfwkQ4Gjp8CHw2R9AZWyyIlgL6zb?=
 =?iso-8859-1?Q?XiZY1T3BteU25w9c1y5j/poOIiI+N4BdDM12ihdgjQYdbLMgPiMkVt5hyo?=
 =?iso-8859-1?Q?b/Z0MSmplAo0CnbufRjUJ4suyYxGTphtoFDafVAHLBMe4v8AUg6dk2Jvmv?=
 =?iso-8859-1?Q?WSBUB0f9qA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e83b2d-558b-4dc9-19bc-08df0e452d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 07:37:18.5578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suAkiylHTQ/wA4siyeRO4xoHeuf7b8A/WW2fz72gYdxjNaO98vaf4v9J1Q9HKxAVdnJcy3mGlguljAL5w7xuM9uowxu59w5qCnjcNVsi5JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR07MB10303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245449

Backport patch to fix CVE-2026-5419.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-5419=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a00999=
7b081a1ab=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
v2:=0A=
 - delete unneeded spaces from function _gnutls_pkcs7_unpad=0A=
=0A=
 .../gnutls/gnutls/CVE-2026-5419.patch         | 247 ++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +=0A=
 2 files changed, 248 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch b/meta/=
recipes-support/gnutls/gnutls/CVE-2026-5419.patch=0A=
new file mode 100644=0A=
index 0000000000..79c3030773=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch=0A=
@@ -0,0 +1,247 @@=0A=
+From 0ff1cf201404afc6b227f9ddfea376866770a9d3 Mon Sep 17 00:00:00 2001=0A=
+From: Daiki Ueno <ueno@gnu.org>=0A=
+Date: Fri, 4 Sep 2026 09:16:30 +0000=0A=
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
+- Adjusted the upstream hunk to match the GnuTLS 3.8.4 code layout.=0A=
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
+index bb5c3ec..7ae0ef2 100644=0A=
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
+index b02babf..f269ff2 100644=0A=
+--- a/lib/libgnutls.map=0A=
++++ b/lib/libgnutls.map=0A=
+@@ -1551,4 +1551,6 @@ GNUTLS_PRIVATE_3_4 {=0A=
+ 	_gnutls_pathbuf_append;=0A=
+ 	_gnutls_pathbuf_truncate;=0A=
+ 	_gnutls_pathbuf_deinit;=0A=
++	# needed by tests/pkcs7-pad=0A=
++	_gnutls_pkcs7_unpad;=0A=
+ } GNUTLS_3_4;=0A=
+diff --git a/tests/Makefile.am b/tests/Makefile.am=0A=
+index f227e92..32c5335 100644=0A=
+--- a/tests/Makefile.am=0A=
++++ b/tests/Makefile.am=0A=
+@@ -238,7 +238,7 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast set_=
pkcs12_cred cert certuniquei=0A=
+ 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \=0A=
+ 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-fre=
e \=0A=
+ 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \=0A=
+-	 psk-importer privkey-derive dh-compute2 ecdh-compute2=0A=
++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 pkcs7-pad=0A=
+ =0A=
+ ctests +=3D tls-channel-binding=0A=
+ =0A=
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index 0eabc517ce..b4be891d23 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -46,6 +46,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42009_p1.patch \=0A=
            file://CVE-2026-42009_p2.patch \=0A=
            file://CVE-2026-3833.patch \=0A=
+           file://CVE-2026-5419.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

