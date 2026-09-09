Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B2C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:35:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12389.1788960949536539934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=KN18YrlU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.66.41, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4H6u7+eVqFdGOw9N45QbIJOdhZdSbLXwVw1LIIzpYk3j6c8ywfEi3CyvsIe9l7i7gXRPOJOzkfo2azwJ0sLQUUK4Db/SSkFa+7hnn/pzPkxj14AUah/LqQIr0VDFYLf5/i9Bo5xhZ6XmU/AiyiqiHb/nUwjtiFrNokPK1+GB67LKTPv5ujqeToejWpdSeMK3BCEf9KuBRqtgNZjlITgS1Gs25GPLxy+88K9791Wlo4xHMlv0r3H2V7uPem0SQzqw/dMkFROEX2PmPWz7ludm6rw6arfYgEv62vPHc6ozzU398zjk8Ezp7mEhqhCSknkVgXikYid1ZQC9ncZwJ/oIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQVHSLCqUvnq6GZy5txjfpTkTJ7rK76zgPOR9Df9/8o=;
 b=ZjR5OsYTQR09uSy7eJ5eYindARXPmmJfIu5LYSbKWMIYxziRIOuV1P+eQN52jVJbe/lvpBh7rhALiWoz+zQDQN8675aATGjc5XHKcHcI0DRCf4bDlJas4uOmyvRl5Y0KtmgP717HyjFuHrbd2RoMEuBP2AJvySRqcNE55katIXyZGh2Z06miB2lZORw2gHtRMJ7/JFtzJjkiG+yBYeINRyZnIvF9h+ENJ+yTCTDZVr7X9+CXa7VGFa07vqYTc19vvTPTjNIZshirX6ryXJrtzd0aBI8V8GRLnUYHXZ1z7TelJ77ble5U8MPUcBUe4reZqpz6unn4HSwO7NY81z5YHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQVHSLCqUvnq6GZy5txjfpTkTJ7rK76zgPOR9Df9/8o=;
 b=KN18YrlUvulFJHowDgSMFUhX/QKje4EzqIFHRanIWrMz3y6ZVPMRmgV+UPI4coJhnqS5x0s1qUksbJOLJFz1zeW8m9xdxqFyYtiYzvQCsUdakIsqX+ucDdNvGooVS4krAHlekODw+LNSFv2IVuQuvROyO0zInr3akzQ8p1mzJcvvU00r9R1lUABfs/BqL5gjtb/mIn59J1akXF0gqB9Wst8uYaIFNr81NOd2+KfFWsVWoypEhh5cxgnudSK8E4X40w0+xfplvIR3CduQZHiD+5IYn33uIM5amMfVnLAgKOaHGTpkYL3xjmi/0l9xmcRY0WcAhPdwknUtvip7pQeJcA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:35:46 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:35:46 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 5/5] gnutls: fix CVE-2026-5260
Thread-Topic: [wrynose][PATCH 5/5] gnutls: fix CVE-2026-5260
Thread-Index: AQHdQGAewG9d1OXuQUCaA5nskjTGRA==
Date: Wed, 9 Sep 2026 13:35:46 +0000
Message-ID: <20260909133510.3286-5-jakub.szczudlo@nokia.com>
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
x-ms-office365-filtering-correlation-id: 72e007a0-f0a0-45d4-2b98-08df0e7740dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|29003799003|6133799003|25016099003|12006099003|13003099007;
x-microsoft-antispam-message-info: 
 o6YlJw/XcCOfjhSgZHAobF4dRfuB9pp/sXovYkbL0BGE0nuJLO3wEatGl1f2aZkjuvovmBkR60Ddq/0/w1C/gxRsLawFJRKWiVlRzQnCySkh/SSiaBFyS4FLY2nFuD3n8xMSRTbDoFI9tcXIsR8ztTVpwazsvSa5yr/u+Q9c/17MaAQX5Em33LjX8gTC3q5cD/0wONcCEpby2da0dWxJPGL26RAt4vLr6XdB/DywdeGga8v74612MR5kVxUe98kISNF8VH55SQodnpDfWy/G7JGFptEPfKMgw0Ev6eSlZTv0s2eH2wX7jxrJatELb4sdqM0r0q7H9+IXdvgG39I0PqBTMcoEskJN1hi7sQXIbeLQC/6nYO4u7VuacW08O+oiFaBwa3jHO1dkjEmbmsi00tB2ht1K12m7qhfE6N6Tbo7ewWb48+2gYjhWmGjIq3KrjRs92gsrpTMNPvQ1L5UJyik+tS5+KesKGpmoyRR8e4NEfa1fi1f+yw5RRNNb7T7R8OocDY+3XDIGegSd5oNBSXRq2hCGIXDTma0w37plNzBK7r2fb8tk8lFr+I16DjiZPEBHW7eKsNpkkMmirIv3/ye04DZtA2LpRBC3nyE4gzo/obv05EOId0tu3siTsUYGueni7xMKgEfnazKt16PnyGjRf0f5TVBOWU5n7fJW9JEMPBlnPs63zN3yGC/lKXgKUI5my40vOjkx1MpshzH+s911U0PpHg1S7xCmcJP8e60=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(29003799003)(6133799003)(25016099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kbFvDZQa5IwKSvM4+bG41NipzlVtOTG6aDnxPjxgIVwZPeBPf/pCIVX5Js?=
 =?iso-8859-1?Q?pVhZhQ+PhNPCHM8JTJlzb2/RdVZpEW1clHY/IZZldFyniRMkhS8fTPm9o8?=
 =?iso-8859-1?Q?OmlIIeZRsvDvz5Bz3ARAhHLJPuTfqHRSLgzqAzUjmwH9JEFwqiLmcDflCi?=
 =?iso-8859-1?Q?Kviaft39rErE4E0An8q4+rDetAmWrbhF6x3MVDqL/hbwbI4Ad5rpwzXh+Y?=
 =?iso-8859-1?Q?LZXOodB3TAu5j0JX8YJxeZT4ioog7pt/KtY0HLw79hTmBa6u04YobBotLV?=
 =?iso-8859-1?Q?z6WhOmTz1nTnrTJ4+9lLyXAP3KevWQGVCr3ZEeZh/53NvhSQ6JXAIRjXim?=
 =?iso-8859-1?Q?Vfw+lta+qShYyXZpguQSKOs62Gf5VtEUTyCPnk/iZeYok/w+iQpY0SWcGU?=
 =?iso-8859-1?Q?iN5EsXnFVjwEMWcXAonRvjX899OreYff3jLF0rb7fef96OSBTjQKx8Ia89?=
 =?iso-8859-1?Q?1oJk1oaYN6N29VCSgi7fpZXziO7ZgYRC8wtxYt7miVajkzdxWYzE0PrPgC?=
 =?iso-8859-1?Q?FG088iGzQeNH1dB469OYfQrQxfPj8mkBg3+gk9y3L5jYBvm/EHjgWu1F1J?=
 =?iso-8859-1?Q?8DHCZHV8mtC1tEgKUcWySyboYHEAhbhRZ5n7Jmgr92jbRR0gnYYj87tNJC?=
 =?iso-8859-1?Q?i2j7wTNO+CI6ztv6ok1OSGrEyJYMXqcvOg9cqc13aE8NbNepPZJRvQJFVY?=
 =?iso-8859-1?Q?ZLbCNKq2DwokuL0zjCTRFWuQaOX46si/ImBYbzaYXSVWVH5mClsfwySQpy?=
 =?iso-8859-1?Q?EreBJiWZkiRcvi8V3xtvqT6WWv8KBzdqSJmXt7Tj/ZTC7ujMMXHX0Q3FjL?=
 =?iso-8859-1?Q?dXDM956joZPMmjeniZMvUi4kr20YPe6UMJsRmsVBL4mVYkWwaTUdG5TTSX?=
 =?iso-8859-1?Q?O1jDw6bJ5GWasoqXWbD9zlT4ioz3KaVa8ZZ7in5z4D0m7oMki+OYqnNDa2?=
 =?iso-8859-1?Q?fuN6wqTRchuWg3Jj5rqkwy3v9vIbrVV1/T1it+DWSG8ZNnT7xnJfzDxykO?=
 =?iso-8859-1?Q?kZoebIJ/t/IqrzUauN1yc3L7Quj71KDdcT3diRx+Ky6aMoAnhUOUJzvJyj?=
 =?iso-8859-1?Q?HuR0KMOaWglht4pN1I5IXr1J8cNpi+8AA83CTNjuJxz4DGZqDyHf80U8BY?=
 =?iso-8859-1?Q?yXlTzfSqE5HuSeymq1NklXx4D3V0cEqu/oJuMyDalPIOwrUwhrC/IkR+z9?=
 =?iso-8859-1?Q?vGwJpqPS1bENYd67xVEwHNSumbQ589LdSt27XH+LeElQCGdE5tIAMWSX3K?=
 =?iso-8859-1?Q?pDCcj5A+E41c4sdigCdjesrXzX79Jr2Vs3m/nVAEZIb2WbpnSHAfEGczHl?=
 =?iso-8859-1?Q?EA3WYR8E5Ar3yMgRpQXC6eX0NrH+wX7/syVM6OjBe3WFD9cLKDZlZc5IW+?=
 =?iso-8859-1?Q?tr886kDUriRkrcvu/jolHGSWsbMVTmqwOm7pWZjYOHbapft8FPMuOtWrRg?=
 =?iso-8859-1?Q?H3IUpI84DgrErJbAuD3+0yciOuJdH3qifz1jsj3v9rYg7H5GqtOWao1kCV?=
 =?iso-8859-1?Q?EYGduFtrp4/YQVKMWr8A7FCeXq8uXnH2H1qJ28qLQHbUVmQxgOwfkTbHYj?=
 =?iso-8859-1?Q?1Cx+41NCKXg1dl0rWTCWArGFbpjCvOHPS+0+bPj1054JXR1IMRh9elufgy?=
 =?iso-8859-1?Q?tW0NnLsa0flavLZuMQUt/hKpI/z3AjmN1CJ7lLZIIANVC5VPqifT3AkzGk?=
 =?iso-8859-1?Q?mgr0PTdl3ALj8mJePK8U4Q6IcjB+uy1KpXk0nJZsVzMjKbiM6rzAp+aE9n?=
 =?iso-8859-1?Q?f6JEbSa49q7z3Wdz9ZQvTg/LDrs9SjvTS+P/6mhClP4HrHZsCn5yvsSttr?=
 =?iso-8859-1?Q?Dc8IZnYedw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e007a0-f0a0-45d4-2b98-08df0e7740dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:35:46.1401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13Z5rSV+8nV2WJKXOYUB2zer6cz2YE+cMB2KOH2DRUywfM45mir/JJKwE8/zQeOIl274roKfGN3l5CcjVXgot0q9PSFmUNxSBNdI9woPup4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245467

Backport patch to fix CVE-2026-5260.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-5260=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/77228f2d1ac207d2f894e5a168fbb47=
e5378e42f=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/cf6bdc5e4df49e5583d3fb4d2296779=
785f10683=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-5260_p1.patch      | 69 +++++++++++++++++++=0A=
 .../gnutls/gnutls/CVE-2026-5260_p2.patch      | 33 +++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  2 +=0A=
 3 files changed, 104 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.pat=
ch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.pat=
ch=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch=0A=
new file mode 100644=0A=
index 0000000000..c5ab814031=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch=0A=
@@ -0,0 +1,69 @@=0A=
+From 77228f2d1ac207d2f894e5a168fbb47e5378e42f Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Mon, 30 Mar 2026 17:31:07 +0200=0A=
+Subject: [PATCH] lib/auth/rsa: check that ciphertext matches the modulus s=
ize=0A=
+=0A=
+A client sending extremely short premaster secret as part of an=0A=
+RSA key exchange could've theoretically triggered a short heap overread=0A=
+to nowhere when the RSA key was backed with a PKCS#11 token.=0A=
+With this fix, the internal decryption function will not be called=0A=
+with an mismatching plaintext length specified, avoiding the overread.=0A=
+=0A=
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>=0A=
+Fixes: #1814=0A=
+Fixes: CVE-2026-5260=0A=
+Fixes: GNUTLS-SA-2026-04-29-10=0A=
+CVSS: 5.9 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+=0A=
+CVE: CVE-2026-5260=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/77228=
f2d1ac207d2f894e5a168fbb47e5378e42f]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+diff --git a/lib/auth/rsa.c b/lib/auth/rsa.c=0A=
+index 4d18132..496c378 100644=0A=
+--- a/lib/auth/rsa.c=0A=
++++ b/lib/auth/rsa.c=0A=
+@@ -158,6 +158,7 @@ static int proc_rsa_client_kx(gnutls_session_t session=
, uint8_t *data,=0A=
+ 	int ret, dsize;=0A=
+ 	ssize_t data_size =3D _data_size;=0A=
+ 	volatile uint8_t ver_maj, ver_min;=0A=
++	unsigned int key_bits;=0A=
+ =0A=
+ #ifdef ENABLE_SSL3=0A=
+ 	if (get_num_version(session) =3D=3D GNUTLS_SSL3) {=0A=
+@@ -180,6 +181,10 @@ static int proc_rsa_client_kx(gnutls_session_t sessio=
n, uint8_t *data,=0A=
+ 		}=0A=
+ 		ciphertext.size =3D dsize;=0A=
+ 	}=0A=
++	gnutls_privkey_get_pk_algorithm(session->internals.selected_key,=0A=
++					&key_bits);=0A=
++	if (ciphertext.size !=3D (key_bits + 7) / 8)=0A=
++		return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);=0A=
+ =0A=
+ 	ver_maj =3D _gnutls_get_adv_version_major(session);=0A=
+ 	ver_min =3D _gnutls_get_adv_version_minor(session);=0A=
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c=0A=
+index cc92b4a..dba4011 100644=0A=
+--- a/lib/auth/rsa_psk.c=0A=
++++ b/lib/auth/rsa_psk.c=0A=
+@@ -257,6 +257,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_sessi=
on_t session,=0A=
+ 	ssize_t data_size =3D _data_size;=0A=
+ 	gnutls_psk_server_credentials_t cred;=0A=
+ 	volatile uint8_t ver_maj, ver_min;=0A=
++	unsigned int rsa_key_bits;=0A=
+ =0A=
+ 	cred =3D (gnutls_psk_server_credentials_t)_gnutls_get_cred(=0A=
+ 		session, GNUTLS_CRD_PSK);=0A=
+@@ -313,6 +314,10 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_sess=
ion_t session,=0A=
+ 		return GNUTLS_E_UNEXPECTED_PACKET_LENGTH;=0A=
+ 	}=0A=
+ 	ciphertext.size =3D dsize;=0A=
++	gnutls_privkey_get_pk_algorithm(session->internals.selected_key,=0A=
++					&rsa_key_bits);=0A=
++	if (ciphertext.size !=3D (rsa_key_bits + 7) / 8)=0A=
++		return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);=0A=
+ =0A=
+ 	ver_maj =3D _gnutls_get_adv_version_major(session);=0A=
+ 	ver_min =3D _gnutls_get_adv_version_minor(session);=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch=0A=
new file mode 100644=0A=
index 0000000000..67154164c5=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch=0A=
@@ -0,0 +1,33 @@=0A=
+From cf6bdc5e4df49e5583d3fb4d2296779785f10683 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Mon, 30 Mar 2026 17:46:40 +0200=0A=
+Subject: [PATCH] lib/pkcs11_privkey: guard against overreading on short=0A=
+ ciphertexts=0A=
+=0A=
+This is an alternative fix for the callee side.=0A=
+=0A=
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>=0A=
+Fixes: #1814=0A=
+Fixes: CVE-2026-5260=0A=
+Fixes: GNUTLS-SA-2026-04-29-10=0A=
+CVSS: 5.9 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+=0A=
+CVE: CVE-2026-5260=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cf6bd=
c5e4df49e5583d3fb4d2296779785f10683]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+diff --git a/lib/pkcs11_privkey.c b/lib/pkcs11_privkey.c=0A=
+index 568474e..e133c49 100644=0A=
+--- a/lib/pkcs11_privkey.c=0A=
++++ b/lib/pkcs11_privkey.c=0A=
+@@ -838,7 +838,7 @@ int _gnutls_pkcs11_privkey_decrypt_data2(gnutls_pkcs11=
_privkey_t key,=0A=
+ 	if (ret !=3D 0)=0A=
+ 		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);=0A=
+ =0A=
+-	buffer =3D gnutls_malloc(siglen);=0A=
++	buffer =3D gnutls_malloc(MAX((size_t)siglen, plaintext_size));=0A=
+ 	if (!buffer) {=0A=
+ 		gnutls_assert();=0A=
+ 		return GNUTLS_E_MEMORY_ERROR;=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb=0A=
index 58acf4f1f5..203ecbc375 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
@@ -44,6 +44,8 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42013.patch \=0A=
            file://CVE-2026-42014.patch \=0A=
            file://CVE-2026-42015.patch \=0A=
+           file://CVE-2026-5260_p1.patch \=0A=
+           file://CVE-2026-5260_p2.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"=0A=
-- =0A=
2.34.1=0A=
=0A=

