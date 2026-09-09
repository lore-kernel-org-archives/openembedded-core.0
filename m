Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB4CC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:37:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12282.1788961020485860967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=L3/ripEt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.72.65, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG+5sOZHzjnH1XWMomiyiw+3qPsep1VIKjR4V/91Z4ZC3k2aRzpsw3uS0Z09XdeGamSAswCsURvis52Zts7Cr0v0AAq7oTy93JGc9M0Po/TFQi1UMChMlJvZciDGnAe1Gdy4kr+Acl2VplGbo0YKycSP9C01b89a8ueK/fZD+xiGmSI0fMAiwXpk50TphReZ1D58K4wKsxyNBvZXTSWQ0GoyegExj5oYqlvM/Gzcq2fvZ27A28UxH0I84979UvNyjqRfc0v65jkIDqmf2PCoC5029PJ5aMhsr0u3wIuEMeUdzbOWhZ5e3ELXnxYe8dEMQfFfFr3KfCYRkjd5urxhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TrjlAoOpN0c/v+g59xptpVjzGpQ5TPsBsi6knwb/no=;
 b=v1E/mSZJC2K+KWGO15q5r9QRnMkoFvAW6DHD0EIkuGSTiATNlQoA2eulbNz78Q3/3LVUHVCR85KsRfILv279oySzgM6YROOI0i/BE2zgkQ33SKOu5E3cLzEzbzrQHTh7/AAOY5YwLqnLrPBIF+jgBGGHD/y62TUh5pnSnyNRWI94ZBG/+xwEZqaG7kK0RXC9+Ssg56AHSI9rT075A97y760awHv5syjQHUDtRQJIkyWc5SIKJbAOtxzvZHl8wVvvA9N+9M4RHeBUBRx6FV5RR0FpSs6mh7j4fxegxloRJU3BtBTdGl2mqhqjuYC2jGIA17hfVPaj5H1WR1KdZoiVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TrjlAoOpN0c/v+g59xptpVjzGpQ5TPsBsi6knwb/no=;
 b=L3/ripEtoOJx9QsLpNFGDHXxn/fjPVbljSdgR51oUacAroCwAy+GSnQS7UayY/AaE5KG1Ky6QTjSTKSxTzPnN+Tn+Z1pDPy6EUitSP09bXrdA7BK4zqADrtKGqZFoA0D6A0T6ERZhsMuWPxy1anA8bycVTnpKQwjdQvrnPKUMQ9ZViTD7f1O7zGUEF7QGFU0QqG/n6N00yTmlDhbHUkjonhxPPvqzJzrWGxHh7Vdz9Nk8ZNHq8nJ+i0ge/A0Xnibtf/ez+Qawt/osKH/ghRWiWvy8eP4wAlmtVSRBCHJs2ZzkSGpWOK+vVCo4bU+BU4MxFDvbJR0LYpxD1pyyIhVew==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:36:55 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:36:54 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH 5/5] gnutls: fix CVE-2026-5260
Thread-Topic: [scarthgap][PATCH 5/5] gnutls: fix CVE-2026-5260
Thread-Index: AQHdQGBHzdCdGkdpYUqPQhQp7IQZEg==
Date: Wed, 9 Sep 2026 13:36:54 +0000
Message-ID: <20260909133633.3691-5-jakub.szczudlo@nokia.com>
References: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|VI0PR07MB12084:EE_
x-ms-office365-filtering-correlation-id: 0c0c0ac1-0a90-4d93-4226-08df0e7769d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|29003799003|6133799003|25016099003|12006099003|13003099007;
x-microsoft-antispam-message-info: 
 xPEjfxZAeraFvYTx2cx3jusZcwlkOxPt8Ju4rexDgpLLkTdpD0XGXnxeGbTPuslkpiGhOL2Aowf8kKMsdUXAZfR6HmpDWByUHyrUSR+SLD7kviumj1FJCY1e0IyQ8s+UpzThRCttlY6ebHSCSHZ+yJysC0jZNaaoNHK+iXpRf2AOZ/KZ1TGYUrH0g7ZpvACfDkEH4Bext7YU23rVEwE/DiONHx2UVaJCMuxYHs8kAiWiRI9i7jVroOHgp2OFJK/MA5MX4mmUeR0/57k+hBS3zW0wsOqVEnGeGefo0rM+RSY+lo3HuDAMqzfkJW4VqWgqt4M6Ncr9mXovlkqZwqFj8gZgV2pcgLyDsJdK4yob3QWSBD8tegKKUueJdYLTxUsvBd8AFP5xKFFFjx6SHybHkL5TfVySPVM/GCKmgADNoZb0f66Kos3rQFrop/BpDGIPqcFIouPuTe3M9Pk7zY/O5/iVqsoXmnM0VLNHrg4WdEtzvZNKB8xX8PoaIig2ROzsAFwXGJRXkxXHitR2kgSkku34PzTh5JHiUuPfGL6iQWCeWxxRosHMFsYmoR7LeH5U5ZatD+ZrOElC00hlzVQfUAFozXxlqmM2wL1W1177hNS8TgYfzEVj3PX2qcSotsLO0eoab+UH5TRB/DAo4lhixnQIpZ0LAqXdzNb7zKxmOJBUeHOnwterAZ4qFWmiYKsV38sVSeuYuY9+lc1rv3D311g7p1+Kwv+j++5LLkthgnk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(29003799003)(6133799003)(25016099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4VE8yfmmaRbB6MMV0l7Ke8hb3zToaYUfngcA2wwW7ipqhHjrwsffy67PeH?=
 =?iso-8859-1?Q?NHJlrIKyZk3effuBQZg5N6NrkwRBLTvi7oqIwHP9Bh0gJ1VK7XIZJYYpa6?=
 =?iso-8859-1?Q?sUTTCk9tHiFHC4+ZQnP64gDQkLCwPN4iZ3UAJoPQNm1IKWvj7kW9VVnmm1?=
 =?iso-8859-1?Q?AIe1erBGEn14mElrOOqui0G4+Zo2qkmmPJmaDbIAF2A0uVnPxFzK9kaVNG?=
 =?iso-8859-1?Q?9uUiUkyp/ODBHRdIg2AXhA4BP33BJv9R9UnM8c5LbEaschgq765NCff4oD?=
 =?iso-8859-1?Q?WjJp5mrY22P3qjF1GRT7F4cVDcudJBlbaYLs37oSdBkPK0G87/vfoJjJYD?=
 =?iso-8859-1?Q?C7Q+iLSYdwkzmXYhREyW0vpbiNQXJfLCQ7W3SE3F+zynIegg1eVK8NZFST?=
 =?iso-8859-1?Q?Ai/EC7Nkns+CTZBnCqD5wSBlNynlJpSetFitE10Uyi7jLbudQqURpzuGpH?=
 =?iso-8859-1?Q?XM4s8lgqozywRhEpdU2oC2oWcV2+tCAMved9sEGQ7vj+f5igOW5sYYlhkP?=
 =?iso-8859-1?Q?q2seTn10nBpBLnmOfqVJH8FWp3NUAu6HQi8jXBdnnRM9pDWWGm4yLeI+BF?=
 =?iso-8859-1?Q?vLgVg2XWkK3IxsMtZsaLJIi1mnedALFzoHbXIC02JTbaQ79rxLUApBwfh/?=
 =?iso-8859-1?Q?JdPPxFMFBG9nBoJiadmQwUSoc5r47MEscA1WXlUYndbbjpLy4zW1TvEdz8?=
 =?iso-8859-1?Q?6brj2E7DvuUqje6+S7N1hMES7VT+lxxDNv8cAl89KctmgCPiLDOe8Whl4w?=
 =?iso-8859-1?Q?QLisJT7tNlYngFmdyJyq8dGM7vVH28cPuRYq1Ygmf0XXdfkJTLWDMEusIy?=
 =?iso-8859-1?Q?AwJ36N4iz2lB8rOPGwg81Ic8tQF74jinxymcaVwwVlS53wE4FmFcX5NZcr?=
 =?iso-8859-1?Q?i28x7y3X72uHYjOa4K8phFo58IBGSgJzbjQSW/o/P2zYBdyKhXvGhUY2mP?=
 =?iso-8859-1?Q?zK/cVl2+TLQWAAiase/ID++f9AgtNB0i96rZven3JDrmPeHzXOIsqNqBx2?=
 =?iso-8859-1?Q?lLaFKu0+5zVF5SLfPcbHMmbhhvJSaWJrS+ZeQ24gF5uTkyqDEfJ7/QjCri?=
 =?iso-8859-1?Q?ipknmfUOmd7jmgGnKpUs5Rw2afiKzxIKxn+Mwc3QpIn2r9C4Df4HqJ/7oQ?=
 =?iso-8859-1?Q?jBYlB3pVaENlHQSiFb5AVpbnC8WRcR6iwc8/ZRkbHL99yCqeHLuz7X5z/2?=
 =?iso-8859-1?Q?z8FD6QTTCdtx8Jf1dX6/oz68TsjL0des6GEpvtTzV0TIUEw+nkyfQ9PsUb?=
 =?iso-8859-1?Q?Yt/LxjQLmxaaL81nl5u/51UBwxh2RxUDYgyJaci2/4eWfIywdHFTUZvedp?=
 =?iso-8859-1?Q?a7LIRAo168Z+h2xN/ht/85Tv3Kpgivb2K+d4jtB3ZOfPCCP7ZZQwRXXqAu?=
 =?iso-8859-1?Q?LDX1vK7IjPnnKnv9PnpnIVKnfb80OA4gEeuKUbznA6LFkWKCnhsVkD6VKw?=
 =?iso-8859-1?Q?1W+EtVNqKoyBefyFHROm2ogrPxzhOcixPMx5DVvmXqnY6ZLBFYcFJ5fEFH?=
 =?iso-8859-1?Q?P2ByxJZToDjxVjQLV9ly6LrlrS5l10n3WDbc8iLiBGQj1WzHsRn1POLQAE?=
 =?iso-8859-1?Q?hO1f+sOxTo9Pkf79PvS0GjXXnMCHVjnrplgUXvgKsMDrco5wkVNAd0NHRD?=
 =?iso-8859-1?Q?IUOhzfebOS/oU3CCYawY5dYbelImpRYQr+qbS4iG7n3QsrRTxPAKDHFeQH?=
 =?iso-8859-1?Q?00ZveDqLXbF2humZbklf8lq037z3QF7RfDC0d/KH//TbkoJZ2T9+GXzsn8?=
 =?iso-8859-1?Q?3Tb5CCk+AP+03RMq+UljQn+Ct8YpxfkkfrKr7+7ZsnCsmgg9VVpHtyMRpj?=
 =?iso-8859-1?Q?ht+mDjfS2Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0c0ac1-0a90-4d93-4226-08df0e7769d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:36:54.8652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 936ZDm6NoUWwRnps+w2ePZ0zMRZXzc0GEAF4kNeSqIGi0nsOAjlOILXgAobrlC5pFUg1RJMyPCa4kcvfdMtIbq0ITynGhrJQxxu/H1Vpiok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245472

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
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +=0A=
 3 files changed, 104 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.pat=
ch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.pat=
ch=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch=0A=
new file mode 100644=0A=
index 0000000000..f7e6f978b1=0A=
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
+index b5ecc09..24c1649 100644=0A=
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
+index 399fb4d..7a99d87 100644=0A=
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
index 0000000000..fd94c64b6c=0A=
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
+index 5093a6d..369b034 100644=0A=
+--- a/lib/pkcs11_privkey.c=0A=
++++ b/lib/pkcs11_privkey.c=0A=
+@@ -826,7 +826,7 @@ int _gnutls_pkcs11_privkey_decrypt_data2(gnutls_pkcs11=
_privkey_t key,=0A=
+ 	if (ret !=3D 0)=0A=
+ 		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);=0A=
+ =0A=
+-	buffer =3D gnutls_malloc(siglen);=0A=
++	buffer =3D gnutls_malloc(MAX((size_t)siglen, plaintext_size));=0A=
+ 	if (!buffer) {=0A=
+ 		gnutls_assert();=0A=
+ 		return GNUTLS_E_MEMORY_ERROR;=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index 38ad19633c..5ec370f0f0 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -54,6 +54,8 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42013.patch \=0A=
            file://CVE-2026-42014.patch \=0A=
            file://CVE-2026-42015.patch \=0A=
+           file://CVE-2026-5260_p1.patch \=0A=
+           file://CVE-2026-5260_p2.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

