Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C400E67A81
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 07:05:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12869.1772521518008076065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 23:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ODQgO3Su;
 spf=pass (domain: siemens.com, ip: 52.101.72.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj7/f53c5YH28spQPOrTJA7niZIEqEeV5xbLzgg7HdLovm3hXrp9FI08T6Oc7NgBGmp52KQoGXu1j844l8fXDJ1ICo5GC85oznXRCPfcPnnaYfAEUpTLjmtp08uRNQOrAdmG0tb3ebbn6uNHdxoKTHsaCPWGac+36GVa62XFb8KNUCx2xXqt2HMnw1pV/6tk/as0ymaSOCWMvId+ddbeU05R0ihNMoMWmvoqiB+JKe+n3qlx8YE+YHL3AcwKDX+8l0Q9zB6o+p72ikRnxmq4wbTEQTKHtNEuDPpOn0gTVjZ7b+EYVR+r3wfjVHXs5iGdp8AIZ5mAbfT+ycnwfWbFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ80uo5OCy23cc3aIGzE8atqfap1nO1EK2LiI4RwPQg=;
 b=JAoYtPvVbjLAacFxDwn+8KPxcAExNub8gVFFt2KWkyylBYxckcE+TXSNcr/b/MvZ2UJZkWRbpKMONeR1+HulfA0zSeoJyfpo7OFFC2h28u5cFdgLHslCNO5YFJzyHGsQN4UcDtm/jsIQm2QQCl9rLbcYhJXqegeaChuEBsP/DBgxK9UGrXpv3ai9AOfGVQFjVZeeQAXgVmjnkd9UmTnj2mObmjIYYtGIvmS1q77EG36HxA3OSvRSY4VkXUvPh/sXgcfzkkb29hV+cuPlEaQ5QV74SalvQuRlp+H+NelQ5dkN5NZHnp9aGn0UN7QvJ8klKZyU/2Kffit9csHwgA8ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ80uo5OCy23cc3aIGzE8atqfap1nO1EK2LiI4RwPQg=;
 b=ODQgO3Suxcd3OCOusv1VVq7TQhUPNiDXi+rKGjBqvzSE7f1dBAzNGief8ZPU6I4B23+CBuqHyixDtkXWSEuSKCIafAViSoe6fG8bupBNIlQuAzvfz3+VGM6RUHHz1xPxQLcRjwx7Tj4PirkSzsndQjuL1pHZWvqApslL2qyn17pVgq+aopHFmU/rYKQMDCZbR2X3krpts2eR1VfvyIA8+gYnFJv3VtBM0QKrvG1aT3BUadiGOGgf850ddMwYyrmzFrokcTNgsEX/ghCDw23HeyADo/ccQZfwRzHuturUZE/le3aBdlwef9VNPntv7oF3NDXdnOSPQA6Ou86GYvQwuw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:523::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 07:05:12 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 07:05:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 07/19] openssl: upgrade 3.5.5 -> 3.6.1
Thread-Topic: [OE-core] [PATCH 07/19] openssl: upgrade 3.5.5 -> 3.6.1
Thread-Index: AQHcqtsKjZ9H2Q4tTkmXTITrOFTnqLWcYguw
Date: Tue, 3 Mar 2026 07:05:12 +0000
Message-ID: 
 <AS1PR10MB56974F259389E8F040610854FD7FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-7-hongxu.jia@windriver.com>
In-Reply-To: <20260303065640.2541884-7-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=97839bcd-db5a-48a2-8c4b-25d58a8302ae;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-03T07:03:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6000:EE_
x-ms-office365-filtering-correlation-id: 8d354063-ff9b-431d-7ace-08de78f336d5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 QzmQXDZUH1DoKZyAVXWRW5YnYei1y3hqtkDAnjeAJCqzzqkifUFKw0+/KGYdKB20L3sKR4Jhq87m4/UuU8ErD5GVbz7rRxOyf+zfmB9XM774lR5YUZ9+DVB9Oa3ibWgwUbRH4ysHPnBQ11nfTRmabB11yGciNBefsy2tcI4dbGtojW7oAK+FthRbJpzxMbauUhPds+bvAFiG2n4b2kyY+0/4QeQ14WzD83vWenPVUjmInoHQMFlKHI8Z/DXOS4J5bPcGmYKQ6dZN/GJd8Ex8aezthcS/BaK49tc58FLZnP9RxU5wr+prPPn2yQWyyUYFJ2DlyHRhdWQhR2br6kaN/lUHSznRqelhEXJQA7BTPJNuo1ckvFzqs/gSPDMHeE9kCKzP9EBjsRZS7Di77ZFkKp/lpZmlgaDC1eLpyThWyhnJPLX/VJpjA1Yyxi9PztnZbcjOU3gUZluqkSalJ4x/u3vvsYqYmy0SPQgip7Ox/zC3vUc+w/SK6DEcwcpCFcseg17XeryZ4TcrpZUeYfVeJmOAMjr0ykVkErJ6tyXdelN5RGm3Gdb7cJVebbEjI7Rb06tvLoMoOLQNyeWznsTrpPiah9ADh5YrwuyGY/dlF8jqruMcO3U47FYbM1AhBImMlP93+ZhbbtbigpNRLbmKn4TM0fDP3pelE1KMdXfD6xvjdnKKa+UIQNSQCsvTfHUATFbk8YVTRx3njmtc8YGaAhh9yPDfXuFTKAlqvLBezsNrGSkOscHDd3DkJgDfzU/ULhHZ1tIF/vLRigEMfDvIZ387ZcNydpooCKa4oXCgwU8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EAZjxSd3rGyVYzB+ppMcH2Bwxs+t7tPMR5YAOEMARAUX0NZlqU2OIhaTWNvN?=
 =?us-ascii?Q?w2Aub2m8vJrIAst0+Zkd+or6ntWmR25KeFDgehMioz2rWMSxpwVcs1K7sL7P?=
 =?us-ascii?Q?1Hwzrxdy5AILpvACQUpFMP0a9NazycofEkzKYh8dxCZU2zANNmCI8kdILF6c?=
 =?us-ascii?Q?D9K3kJGhDc9WADkzazOe/5FYM4DFEmKsEqdvDbVhGjPV2ApydXXskO+I6kMe?=
 =?us-ascii?Q?agy1BeWl5PQ2HiMRULe6YkAE11A7GZwLxFLwowmEOedue15e0/PbgHoT5uLf?=
 =?us-ascii?Q?yyDHsoybqz6Ec7Bbjh4we64zaTJWSP9hJvNCZPDATVSvqktiBuSRw7WOQVjD?=
 =?us-ascii?Q?7aCiVHRFGjfbR07Hn2yjON/hNvKrJBxnEjwiW0hsLeNP6fgTNKFy+fXzD0yP?=
 =?us-ascii?Q?bd6bK7L8HEA2K84618XI4wugUtfVyOcFImAABL5rB7niVTuDQmzkO9HxQ1En?=
 =?us-ascii?Q?qY9iDEZiWZ64yG0JO7jYM3TJaWgYD9Kz/HRvVStiKaw2usqwKuDALD7Uzccc?=
 =?us-ascii?Q?bTpklVITUx5WrpSUFDXvi0tT5Fg2ST7YsWW4JTqnQts39hwDJOL7EZfrilIc?=
 =?us-ascii?Q?VaIii+WvBVoj1rs53BjT9nmdbZhX3LFWtTxf7RbGNoEz09ylXsXBqSA9dMbU?=
 =?us-ascii?Q?nuzolhjxYiM0Gpx61rQDItZ9f9KoS0UWhuRFxH/SLzQun8j2wRg6IuVVTQqU?=
 =?us-ascii?Q?WxHRE4f0Cl1cERt4gaEXe135Il9vGYvxC66Bl6hZy6MTQLh2UHwlp6OZZWzw?=
 =?us-ascii?Q?RDsXELmTkKsBuTqDn5cdFL5XRUzwgre7iEDHUqrhdnoR4DjSx2coKarms32a?=
 =?us-ascii?Q?psHg7B5hNTYwHROwlp2ufMhI+IIHs6LoU6SkCDHvKYJAEhzdRd7Jc7FdilWM?=
 =?us-ascii?Q?UHIKaya4MMLWA5uy/cLVZVrjvtwMJ0ctg9FqY4WtVubE8qac1rrMUCDAEFst?=
 =?us-ascii?Q?+EeQYX4Wp/ARK0uMCfMYs5/GkPvbcmMceyf4DRCcImR7uLjivC+hedcyRoRM?=
 =?us-ascii?Q?/gjKU605OHbXP1X+tmr+pAu7I9RVRNI8U9vK0vXLpAYarcFwvZROvBk/RoXz?=
 =?us-ascii?Q?28uDfjqM/2Z+gfh3eZ+i2suFkUTiujzTaCgqt829FrVDlYmcFVmd4MAnCTS+?=
 =?us-ascii?Q?pgcLjwtzVwtgf96doIGVqNSx+NuuqGo3SQMVlU78ZGFPbmGTiLKbl19SEYGz?=
 =?us-ascii?Q?8DwYELTHpz4c/GVh6Wtq3bq6qpnrjFAILQXfEFPmCPOvlGmA5t1xLEVMFRyT?=
 =?us-ascii?Q?njhoDPAiGwE5W3KbnJ1vTBbBsACou8/8H+8sCF3nOKpAj5TH9p6whvaC4pyE?=
 =?us-ascii?Q?GI0W8B+PUjIK+dO9mqMYJMl9wvenlOVZqouFk7ydXeVkVqm3Z1+XMaTrH6dR?=
 =?us-ascii?Q?k9pR10gOrt6vqq2jXbH2u7YWo2rsPAmjnd2PwpAcrnMLtn/kKnDplSMgG7YG?=
 =?us-ascii?Q?a69MGDmI00N4hjz88YGai/DWzr7XSQneoqrrwzysEH0SYNWQ8jik7GdY0mlr?=
 =?us-ascii?Q?c0kUguDj3lPHAmMVAWEVHRlefuP7V9t56jkWmEqOYOOrMYQnvvwKz5CCZkkR?=
 =?us-ascii?Q?ygzegaNl8DDD8Jv1nTQdy3KiUP0TMYDbUeYowqnWJn77vW0h/fEJn2c9RDTg?=
 =?us-ascii?Q?acag0UldFdJi3s0ERO+5ccPugQtH+XKIVo72m4RNTvftXSaELHPLNhqorcrb?=
 =?us-ascii?Q?NGczYrCgufNc/HbZyFjm7j6ISmtae9s8aQ+353DfmU8DbPL3MZGCfCp3CB1D?=
 =?us-ascii?Q?cHvsmwoxGg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d354063-ff9b-431d-7ace-08de78f336d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:05:12.5447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0M6YNaLdLEUF/j0POIgreTq6MesFRikOHIJ8LcgmAweKOVwUxrUSM5jJBeYkfyNsV5mPgjIIF8njtdjLspy1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 07:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232258

This should not be taken until Wrynose is branched-of.
We want 3.5.x which is LTS.

Also the most relevant release notes for the commit message are those from =
3.6.0.
Patches from 3.6.1 are already in 3.5.5...

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of hongxu via
> lists.openembedded.org
> Sent: Tuesday, March 3, 2026 7:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 07/19] openssl: upgrade 3.5.5 -> 3.6.1
>=20
> Release note [1]:
>=20
> OpenSSL 3.6.1 is a security patch release. The most severe CVE fixed in t=
his
> release is High.
>=20
> This release incorporates the following bug fixes and mitigations:
>=20
>     Fixed Improper validation of PBMAC1 parameters in PKCS#12 MAC verific=
ation.
>     (CVE-2025-11187)
>=20
>     Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing.
>     (CVE-2025-15467)
>=20
>     Fixed NULL dereference in SSL_CIPHER_find() function on unknown ciphe=
r ID.
>     (CVE-2025-15468)
>=20
>     Fixed openssl dgst one-shot codepath silently truncates inputs >16 Mi=
B.
>     (CVE-2025-15469)
>=20
>     Fixed TLS 1.3 CompressedCertificate excessive memory allocation.
>     (CVE-2025-66199)
>=20
>     Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes.
>     (CVE-2025-68160)
>=20
>     Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB
>     function calls.
>     (CVE-2025-69418)
>=20
>     Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversi=
on.
>     (CVE-2025-69419)
>=20
>     Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response()
>     function.
>     (CVE-2025-69420)
>=20
>     Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() functi=
on.
>     (CVE-2025-69421)
>=20
>     Fixed Missing ASN1_TYPE validation in PKCS#12 parsing.
>     (CVE-2026-22795)
>=20
>     Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes()
>     function.
>     (CVE-2026-22796)
>=20
>     Fixed a regression in X509_V_FLAG_CRL_CHECK_ALL flag handling by
>     restoring its pre-3.6.0 behaviour.
>=20
>     Fixed a regression in handling stapled OCSP responses causing handsha=
ke
>     failures for OpenSSL 3.6.0 servers with various client implementation=
s.
>=20
> [1] https://github.com/openssl/openssl/releases/tag/openssl-3.6.1
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ke-history-reporting-when-test-fails.patch | 25 ++++++++-----------
>  ...1-Configure-do-not-tweak-mips-cflags.patch |  6 ++---
>  ...sysroot-and-debug-prefix-map-from-co.patch |  7 +++---
>  .../0001-extend-check_cwm-test-timeout.patch  |  4 +--
>  .../{openssl_3.5.5.bb =3D> openssl_3.6.1.bb}    |  2 +-
>  5 files changed, 20 insertions(+), 24 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb =3D>
> openssl_3.6.1.bb} (99%)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handsha=
ke-
> history-reporting-when-test-fails.patch b/meta/recipes-
> connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-=
test-
> fails.patch
> index a74c79303f..5104a3cc00 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-hist=
ory-
> reporting-when-test-fails.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-hist=
ory-
> reporting-when-test-fails.patch
> @@ -1,4 +1,4 @@
> -From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
> +From cda360c014be3c6bfbec23045ae0cb784908cf59 Mon Sep 17 00:00:00 2001
>  From: William Lyu <William.Lyu@windriver.com>
>  Date: Fri, 20 Oct 2023 16:22:37 -0400
>  Subject: [PATCH] Added handshake history reporting when test fails
> @@ -13,10 +13,10 @@ Signed-off-by: William Lyu <William.Lyu@windriver.com=
>
>   3 files changed, 217 insertions(+), 33 deletions(-)
>=20
>  diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
> -index f611b3a..5703b48 100644
> +index 5e56060..f9bb035 100644
>  --- a/test/helpers/handshake.c
>  +++ b/test/helpers/handshake.c
> -@@ -25,6 +25,102 @@
> +@@ -26,6 +26,102 @@
>   #include <netinet/sctp.h>
>   #endif
>=20
> @@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
>   HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
>   {
>       HANDSHAKE_RESULT *ret;
> -@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L
> *client,
> +@@ -828,15 +924,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L
> *client,
>           SSL_set_post_handshake_auth(client, 1);
>   }
>=20
> @@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
>   /* An SSL object and associated read-write buffers. */
>   typedef struct peer_st {
>       SSL *ssl;
> -@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
> +@@ -1181,16 +1268,6 @@ static void do_shutdown_step(PEER *peer)
>       }
>   }
>=20
> @@ -152,7 +152,7 @@ index f611b3a..5703b48 100644
>   static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
>   {
>       switch (test_ctx->handshake_mode) {
> -@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX
> *test_ctx, PEER *peer,
> +@@ -1268,19 +1345,6 @@ static void do_connect_step(const SSL_TEST_CTX
> *test_ctx, PEER *peer,
>       }
>   }
>=20
> @@ -172,7 +172,7 @@ index f611b3a..5703b48 100644
>   /*
>    * Determine the handshake outcome.
>    * last_status: the status of the peer to have acted last.
> -@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> +@@ -1645,6 +1709,10 @@ static HANDSHAKE_RESULT
> *do_handshake_internal(
>=20
>       start =3D time(NULL);
>=20
> @@ -183,7 +183,7 @@ index f611b3a..5703b48 100644
>       /*
>        * Half-duplex handshake loop.
>        * Client and server speak to each other synchronously in the same =
process.
> -@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> +@@ -1666,6 +1734,10 @@ static HANDSHAKE_RESULT
> *do_handshake_internal(
>                   0 /* server went last */);
>           }
>=20
> @@ -195,7 +195,7 @@ index f611b3a..5703b48 100644
>           case HANDSHAKE_SUCCESS:
>               client_turn_count =3D 0;
>  diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
> -index 78b03f9..b9967c2 100644
> +index 7cf654f..b4459d7 100644
>  --- a/test/helpers/handshake.h
>  +++ b/test/helpers/handshake.h
>  @@ -1,5 +1,5 @@
> @@ -300,7 +300,7 @@ index 78b03f9..b9967c2 100644
>  +
>   #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
>  diff --git a/test/ssl_test.c b/test/ssl_test.c
> -index ea60851..9d6b093 100644
> +index 27b4415..64a13c0 100644
>  --- a/test/ssl_test.c
>  +++ b/test/ssl_test.c
>  @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx =3D NULL;
> @@ -360,7 +360,4 @@ index ea60851..9d6b093 100644
>  +
>       return ret;
>   }
> -
> ---
> -2.25.1
> -
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-=
not-
> tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-
> Configure-do-not-tweak-mips-cflags.patch
> index cf5ff356ee..d1526cb69a 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-mips-
> cflags.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-
> mips-cflags.patch
> @@ -1,4 +1,4 @@
> -From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
> +From 8db9b88edbfbf40d56f330110efdc5cade6f183e Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Tue, 30 May 2023 09:11:27 -0700
>  Subject: [PATCH] Configure: do not tweak mips cflags
> @@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>   1 file changed, 10 deletions(-)
>=20
>  diff --git a/Configure b/Configure
> -index fff97bd..5ee54c1 100755
> +index 6cc03bf..2bcb075 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1552,16 +1552,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help
> 2>&1` =3D~ m/-mno-cygwin/m)
> +@@ -1573,16 +1573,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help
> 2>&1` =3D~ m/-mno-cygwin/m)
>           push @{$config{shared_ldflag}}, "-mno-cygwin";
>           }
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-str=
ip-sysroot-
> and-debug-prefix-map-from-co.patch b/meta/recipes-
> connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefi=
x-map-
> from-co.patch
> index dadc034c91..f70b14ab84 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-
> debug-prefix-map-from-co.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-
> debug-prefix-map-from-co.patch
> @@ -1,4 +1,4 @@
> -From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
> +From 31f71d1f2def3def2b44ec905cc9bcc7d8d2b454 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
>  Date: Tue, 6 Nov 2018 14:50:47 +0100
>  Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from comp=
iler
> @@ -28,14 +28,13 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  Update to fix buildpaths qa issue for '-ffile-prefix-map'.
>=20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
>   crypto/build.info                 |  2 +-
>   2 files changed, 16 insertions(+), 2 deletions(-)
>=20
>  diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Mak=
efile.tmpl
> -index 09303c4..011bda1 100644
> +index 71b069e..ad82899 100644
>  --- a/Configurations/unix-Makefile.tmpl
>  +++ b/Configurations/unix-Makefile.tmpl
>  @@ -513,13 +513,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
> @@ -68,7 +67,7 @@ index 09303c4..011bda1 100644
>=20
>   # For x86 assembler: Set PROCESSOR to 386 if you want to support
>  diff --git a/crypto/build.info b/crypto/build.info
> -index aee5c46..95c9577 100644
> +index 872684c..96d37c6 100644
>  --- a/crypto/build.info
>  +++ b/crypto/build.info
>  @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_=
cwm-
> test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-exten=
d-
> check_cwm-test-timeout.patch
> index f6eb28069a..6bf768cf94 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-tes=
t-
> timeout.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-tes=
t-
> timeout.patch
> @@ -1,4 +1,4 @@
> -From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
> +From 1f2bfacaefde4fbf6020946333df45cdd84bfac8 Mon Sep 17 00:00:00 2001
>  From: Gyorgy Sarvari <skandigraun@gmail.com>
>  Date: Thu, 23 Oct 2025 11:24:36 +0200
>  Subject: [PATCH] extend check_cwm test timeout
> @@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>   1 file changed, 5 insertions(+)
>=20
>  diff --git a/test/radix/main.c b/test/radix/main.c
> -index 4a1e886a71..39f8c61ef9 100644
> +index 0f3dc11..d925639 100644
>  --- a/test/radix/main.c
>  +++ b/test/radix/main.c
>  @@ -25,6 +25,11 @@ static int test_script(int idx)
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/re=
cipes-
> connectivity/openssl/openssl_3.6.1.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.6.1.bb
> index 7799647415..849bfe0874 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>=20
> -SRC_URI[sha256sum] =3D
> "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
> +SRC_URI[sha256sum] =3D
> "b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e"
>=20
>  inherit lib_package multilib_header multilib_script ptest perlnative man=
pages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> --
> 2.34.1


