Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A02C61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:37:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13866.1788529034387961701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=GJvHiPql;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.20, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRvzxB2fbZ/eGoxLOqYpMiRIx/ebs06fCHIryvZFDR5xSFL21Gia3mdQXNo+bKGTYgMWgAJgbXc+RlYKKE2IHQxfGSBsS/++8/vUrJgl6Hv4/gAsE+w4R0lfpAFpohvBcCinj3o8AZG78xmjIgttb8uI6g49QjRapnRDz18nGeNPJZLiQTl2Q6qRTQPJibwLT5LjYk/T9pgw6Owzmed3nIZHyjKhkoB7DGa81FUqQuXyVdCH9NG+AbYqrNRuLo1BkuhvMDVQ1qoO0CEydtZNRys6rcZnvy39SEKu+gM2vsTkEGMTBFDZDav8pR/3x1ClYNiX2ZyEES0PmN8YsggHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rclo7pEna3ldC9QwLFxuvqyQGuKZ4fAgQkWlgtHexag=;
 b=OGmAxwb9q7nCgnvFxjBSBxiWOwzJ9aEHTl3hwlaUYBrnsuXmHn1CAP87mLlIGhYHPDF9X9fQIslmGSmeLDj6uSKUECdjiuT1TnmL7wExNZD42NM8ysf1x2gC6bpx8Tp/DBKtMozj1qZ1e+XqSti0QNQxs/98orbcMTgJo2pz19EsoWQqrBXVN9j+E3eKcAEiPc1pp/es5NiPzEeO65gOdz9QfyZy4Jb4/ZyascX3aaS2BxJaqFCvpNvwR5qSU8Kkdas8Tm91tRks1VRx/BMX92IIBJVVZds5au4BveNg4vWN8lkCdmEka4zb/vvULZSQruw3uAYPl2GxywSxXHhHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rclo7pEna3ldC9QwLFxuvqyQGuKZ4fAgQkWlgtHexag=;
 b=GJvHiPqlvgeFn5tfg64S3dSuDWk2P+E36zq/4t6+ANxOQXHyYDcvsV931mYY9qqsXt++0ymRqNT/hNpgeowylSvFwhMz5pEO5/+DGznRff7DzPC51tRM2ycQy7Nkk0cdu7BhtLbvsPWpqlZmkVQVTSS12GhumRC12ZCFJi8KuX82hp7cNj5n9ZMROhmn7bdHbBWkQu7QAbi1dFa2bVPcg+9bz5w7/QoCU8zO4RIEmK+HkvYp/KMhPuiCD8PV9IsCpQ/wuwwz/FvzaCWz7Tdnx7ylD2eb93QGoLs1Wj0PvlBlLoX1pQ07eTjs9BFUBYXnI16STmk9sQ0G/0ldF93kiQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by GV1PR07MB10192.eurprd07.prod.outlook.com
 (2603:10a6:150:203::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:37:07 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:37:07 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH] gnutls: fix CVE-2026-5419
Thread-Topic: [scarthgap][PATCH] gnutls: fix CVE-2026-5419
Thread-Index: AQHdPHJ6OPqfkeeV70e/0/PsJvmROA==
Date: Fri, 4 Sep 2026 13:37:07 +0000
Message-ID: <20260904133659.46539-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|GV1PR07MB10192:EE_
x-ms-office365-filtering-correlation-id: 60f45231-1b32-4d13-bff6-08df0a899d19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|13003099007|38070700021|10067099003|56012099006|5023799004|11063799006|18002099003|12006099003;
x-microsoft-antispam-message-info: 
 7Z6ZIzLOftG2alsCOk+KyzO7qBKqN1/jUOGOPwnm9nBwu+VM34yTfHgw41OF4yd/BMstm4CyTScD0fZsXOzuIE3ooCAC3sXr3IYy1kx81a3Rz8r5FnzcCrZWrOtJdmiPn7OpQX1xPuayk0yNJzCkvQPJKcNZYR3hTOZ73DGV4SCW70l3fFMuViChRhTnfZOEm6RmYxvR7MzKaCnqwB1i3NxizLPNY4F1H7EiXqkWLtdmell8FzxwdVKlNLorKg08pLgYXLz5x8HOr8mURP6TOiPDCYKSsgj6Inp2O0V19EuIme8qWkg7PQ6ZDiP0gdLIrT56ntVwVR2zl6/zviUiC02UVkiKIb9crFdnLX7FOky1Oi9spE5wml3Ow0RNsA2LItUGzHx1rWuLwOjYdmyH9XoWUqS3pfqs5X/jHfWEHQ9PlTwWU6cFBUveGhuKLd7tujAraM8blWbs5T13CC1kLe8F9XZhHSsZlhsZ2b+j1k9XWNb+rnFu+r+Yj++IuS/JUPxZgL2WmepT6qVKrGmAEq/vLOMkbNMiuTIJk9ttmNRwJhyrL+dfkFjmveEPRsxu1798epNiRs5No3zvsxHFD45n/cOhYztBnZGCX+D1TxhH25hfPk1StURGD6pmbVBsRkjzBzg+AhyQj8K28UvuYKcaasJZhCLEQ42/ccca70OtSGKEfOOp0tGAEbBNn36A+sD7j4JFAUEqQQH95PIqGecn04CC/1zh3zwmFjmZGls=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(13003099007)(38070700021)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rxBX15UnGhdDGHbIHZAg+5pmcgNYMHjla6L9WtExDMp8NXJhuoLoeOFUe8?=
 =?iso-8859-1?Q?MEQ4pZEyj97pysMG8XwiTVIhfoA+c95om4/rimANt2XM9eOvqs+7lkVgNB?=
 =?iso-8859-1?Q?CngBDxLtfq11A2VJ/TUe6++TtXImVEs4ZoQoeNHawjTXaak2AvdU7/Vq4d?=
 =?iso-8859-1?Q?DnnHDa1lYN0eqBxS/TTziWVlwA2AQaNu3v0kl4vYD2oSJZFYvdI1pWL8BD?=
 =?iso-8859-1?Q?+Yv8F//InO6yxtGPv+mrdh5bQ1ayronP05Rb16QEFiMJhZGjtyemNA4q3G?=
 =?iso-8859-1?Q?7pER0a2qYikO3dp0/cpNR8jxEXrr28bv0j5NeAdbXRglH6Qshc3E85CMhw?=
 =?iso-8859-1?Q?eHlpvNiPq2uoE0AjcAdGn7a0ZQcboysF+o8ZxzR8gTxn1Nt0WzQOMCUdGd?=
 =?iso-8859-1?Q?pSt5YMtC+g9ZoBCjymCAoOio/4lwKjWhaDi39cesF2gkBF65CdNFzg7nhO?=
 =?iso-8859-1?Q?jtfzDs93iyFbm42JE+xeDXivuE5kDoFGa8U4KACUx9HFEjG+BIikBmPOSn?=
 =?iso-8859-1?Q?m3wmrM09wv2KDrz/LRAwSZRQfDylhLRL8LOyRSzUql8Kin1NoH6mGFWWC5?=
 =?iso-8859-1?Q?KQbAO5mabSvFuqJnhJ563gdxoBc1+aCcKxkZQ9JfHZ/34PgzIlQhp69odT?=
 =?iso-8859-1?Q?AGLfrqRYmvSRDfm/r6r8lS4HTxJTCJ0wRzSxC6wzNkmCYP2hKO5NS4e8r+?=
 =?iso-8859-1?Q?/zoNtzCpp2WoASnqokkZjtKZUSOipnXA17s1IytxS51VDA6fun42MyYXfc?=
 =?iso-8859-1?Q?5s5gYIq/qY9ViwEEq/1vDmBzfbpQPK+vZzvXAcMuSocyxIcWHIyz3YpyJ/?=
 =?iso-8859-1?Q?/13qTKg0PCNjWxW98IoSCNsx9NPBm9Sguu1QBWUyVZ4mtxVE8rhNpkkvJ5?=
 =?iso-8859-1?Q?fWNzJeg1p2Dn1U+gjWqeZzB/8BcYSVzdkUWWKMyQihZ/R9r3RKmT56LmBH?=
 =?iso-8859-1?Q?dHGCMZVp+Xa2R10lsHnkVauSCC/TcbdtXovQoT/C6ix66ZrzuW9sHO0YuV?=
 =?iso-8859-1?Q?WMiaVNCD6PpkdbEpzAzs2cKO0FX+25FFr4uJP0833EhzrHV1DEk5AgSmDi?=
 =?iso-8859-1?Q?R7Ot/fVHdEi5utkQTWMnH+J33HLoU2lsttwFdy+VL0dcdFOL3qPWDT6742?=
 =?iso-8859-1?Q?6pMmIyBL1qI20RZVpoPRW/Tkukyyq+UhTJkGf0lB9iJrXPnkcRCtix3g7k?=
 =?iso-8859-1?Q?Jnb6rn/k1PZbJum4W0nbBM7fvHZJGLFRDSZtvXzvYyMyzutA5klJy6rCXK?=
 =?iso-8859-1?Q?z99frbUnv+dWy1ylDJM+zUhBlN7B6w5MQzBaet6QOcAsDDFOHVwLBgRJ+R?=
 =?iso-8859-1?Q?ROwbEyjhCGLS+0GWyWd6lAm0zge8CGW+rbWXuvoBSoCqTe7YKmng9NUwgK?=
 =?iso-8859-1?Q?8HtiKo2UQYlbkE0WhW3o7cRATZsVlqx57alAriKzsJuqdY/pQiNegh+nVD?=
 =?iso-8859-1?Q?pfUXACOT/K12/2KnDy71n91JsdKet5YyFElXHCOunGikNoSmiNN30GPA46?=
 =?iso-8859-1?Q?QxszYzBYuhdE9l8mnkIV1/atdMn54Cbv+vuP+fRbMxhUGMQFeq8vzyL3uN?=
 =?iso-8859-1?Q?7sd3I0bfEs58R3B984Rg7J6RTzt1osX1+nHFwq5/Y/wkuzxeFCPy20UUz7?=
 =?iso-8859-1?Q?HMOxTCXaAxFDEQeIGPRCmvi39B0MYtQiXZDwBtnmrBuuIAWZD59j+MHn76?=
 =?iso-8859-1?Q?Lrpjkli2RS+U4qk7Qs5+SHsF0QLTacaDpQzUSVWLEQtkcNB+q/NL3j28gW?=
 =?iso-8859-1?Q?zEr2nMbmqoiPzRzp3f8P1Prum46thJBzj/z3pEFnh3uVm6/DM5bSJrXIKR?=
 =?iso-8859-1?Q?df0odElXyw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f45231-1b32-4d13-bff6-08df0a899d19
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 13:37:07.2200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU9+LhIDvq4u3eBE8ltWexBNFxq6M5fXIurs3MQyAY9jV1O7TwDL2Fm1b2WRTNFh6PR/+aKlnfaUCJM3DYy4gcuNH19Dsn1hwiPOJxG1+TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB10192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245108

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

