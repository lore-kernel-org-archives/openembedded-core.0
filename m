Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E48C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:32:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22415.1784809945151165189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=p893dERB;
 spf=pass (domain: est.tech, ip: 52.101.66.45, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxzBfGar4AGCemVnK0aAFX3zIGbKbw89qVhejuTic1IOxZe1ZQw9VrCjJKeqIr4uu208JdU0B5ZCKu+ASeL3VZp35WzRM3R9BpBWXLVtD2cT/GL89uk1ISQarthMiM0wbwiRnJrzSCdnoqUDHJaaFmSwN+mknPnEGfNVEjsvCYmgtpy8+9opZfk5th8a1X6/GoVMkeLhVz52nz0CLO9T07J1lfRLTvhVriBaXDIQIvJU1AasVv0xyqTEltChuH6C7nKJAbE4tbR4GzxZtimNg4DbqMhGVjd30/w4pmxnqpHhXAKShby4XG2a0GIr0tBgXcmtCSKacqz9a0ACj/Ph4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eIH9PD++iGjJPi522OafJTKd2bmq/A8qqiwoZ0zC2A=;
 b=XZc0mC5wg5MoyEXIc3RMOJrU4EHcXsNjmzWNXv70tjabqExqVcdUC26lRaskykmrhaXf2F6kSvjtBEkVUPdXlZADNW+YaJa9LUKrjJKkMC22Mzy7j+lryLNKIfixRLR1KIr1MVwS6Xk7D27P64PMaSCBe8Ah9NNnNaRQ7cUMCMf2515IyM3QJfaJKuT2YGjEczZEC7b4mc97NFjCcV+xe9DV8DdGXA5FRXPDXPRtjx5FGIN3fdMNI3YzrboO0wGU0ww7BGHFN6DNl7j3RN/AU29AbpB7DpLjdYpXY8Tw6UYDdGB/Eej03HElLhIjq0vzUtUlc48xEXm1UjZg+waryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eIH9PD++iGjJPi522OafJTKd2bmq/A8qqiwoZ0zC2A=;
 b=p893dERB6xZVQAqw80WptL7OFg3LVitXzfLjK0+fHK340KTLucc3+xk5FNO9nNEmd8aCKkx1PusfkzZW6zOAnoW+SL7WTe31OmChvoI0+p4MkEs4oSWgl9gnII1DTHZRt/44Xg9/+pswIXmXRMbCKR4+zJG+74wDoZA7x1Frf9VNft+sIOTL+suY3ttQjsJ6b7z0cguyD3FUuJ09G/H57ZphxRL5vPRmjmy27GlOByqwZZlK4aFbo75IwrbGP8NmEDW9DMrLJVOqnIxA7xrV9OjSkb/QvcTEEdzMD6NHd7K2UgN/aopgSz8qHFyBN8mPnuT6Bgv+yrieCfJahOxn5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PA1P189MB3603.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:500::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 12:32:22 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 12:32:22 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][wrynose][PATCH 2/2] libgcrypt: fix CVE-2026-41990
Date: Thu, 23 Jul 2026 14:31:55 +0200
Message-ID: <20260723123155.795532-3-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723123155.795532-1-leonid.iziumtsev@est.tech>
References: <20260723123155.795532-1-leonid.iziumtsev@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::7) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PA1P189MB3603:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e52033b-6c6c-4fcc-48b8-08dee8b671d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|13003099007|10067099003|18002099003|22082099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	K7dA2OaPdlpXe4Nfq9TpnIUjXnWU2en4uM2fuzFgvSoL0w7iTh8Ltj9ClnZBoYOq/EUXn/PqJgh5ekwpu1dd4rHxPR1+zwdLg5/iSHNRy3QgGHCIRrlEDWdiNVHL/WhLDptpFDJWlrueLisJAY5AG5cbs6hXRewH/bu3/kSiKL0Z/jHAn9zHllZiwezpKhbF15zjKJR9FSWnNi0Wa4erVbxOvd0YrfDqUtNku3qjvdvfdZyuvf2see9Mih4zCFvqA7A8SHSZceRgGju31sYFmUksYL0JNdJnVmYccO1Y4ENc0APuAKZjOOVAX1jV7Xg0q3hOPthhZi9E56VKsvsnD5wy9vYgEPME1ofM64lJRapT0NoHlkSln53Z4FCRNYOnGzBwVrVkWrrgdurMvRwpiPJeZmOopStqDIWq2C0E7tfQGCtkkfWWDyv/Q7BHJErOHoYnJoHax086D70r7sa9Q3e5igpCAGqklA6uzSb1efWafxTHZmKiUUcM2sZZH7dqS20D9trLBHoasxstq20MqwuTq+Y6M31Z393ykP8OvvJlUZ3FrUVF0JRNRrI8XeKPTsQnfxecosWbLB0+OtfuQL4l083ork99Rg3M/bW6laqsY7SHD5oNHRCl2GV/mcNY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(13003099007)(10067099003)(18002099003)(22082099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k6PJ0iINZE1LzfGjfp9ZJmN5jnZEIN4hF9YqngBq6+SBdk2A5oF2pNDYyesi?=
 =?us-ascii?Q?FOEI5YBuU6tBH6GrmYWNtlqczgseDKlSJ5QEwDqv71Bt4m14H0cf76UEEQN4?=
 =?us-ascii?Q?kpQXb954aCors9kZ/h8H3lKK5TdllkmNnV44p4/eG42uyGezNoLsuF/BmwmB?=
 =?us-ascii?Q?WvEQnY9wg+Z7bu7YPppW5vqoyCvjO9FSpzIfbCtKj4yZ1nkgac9nSITViPiQ?=
 =?us-ascii?Q?6xkuI69mqmZx/nO96BXHbpAoNBSCR4CVK8jXNHMjx0673LbENU9OOLCzyRk1?=
 =?us-ascii?Q?647mk8PLEGyY3dmuskhigDrXyaeAqtAFx7LESsDDwF7Ey48amIA3YNvy1ph1?=
 =?us-ascii?Q?dtRHpcnfodXEa03X0D0B0C/AhHFnT8MVr8JWM6/TVbsWP5yJ3RGtEv0NgnrA?=
 =?us-ascii?Q?TJI+x5KR3iFp4TaHdBwYPTdrck8P3ugnqo9TKK+Yny3kZVRN5oAhJFbCw9+B?=
 =?us-ascii?Q?YcUVxhWOutY379eicFnNjXwivauh6Icyu4yp0rZH1DXsD1dAQs/OoXLiBRtb?=
 =?us-ascii?Q?852pPPiy6JhYKqhawH8SGOVfotu5dHJQjvow9lBHM4ZRrIZUNUF+2iMNVZ8l?=
 =?us-ascii?Q?cQBEJJh0Ua1FfGd6+Q8Pdme8Y+qkZMP9cJn/AwwpRroozXcM5QWGEJwXJMz9?=
 =?us-ascii?Q?h4h026i+Ujzef3SwHPeJ2hMAZabz2Q1kZhWly0fGwxrJWMVALARVv/n2tjGZ?=
 =?us-ascii?Q?9B/vuBJ1iERadvVub4fnapaPw8YOnJfq/Gdk+wXBwhJ5RnKfMrG/ItFufrhl?=
 =?us-ascii?Q?mPZEWPVdUKIVQJHCVXCiU8DFzkcTNYhIVsuW+CGmKAg3o2iNwUPqGmGgYxj7?=
 =?us-ascii?Q?lmPT80enf0WO91RqMxVirm5B8nttvY4k+6ByITkmB16I5Q4by4kH6Ao+S1jh?=
 =?us-ascii?Q?eiAdMtF/P3pUvrOHKGXc7vdmkBXn31gPkU7r5vxRE68LS+uU/1bNPX9A5WWD?=
 =?us-ascii?Q?PmhyubgpnDzz46RcIDVIfE3hLvVfoMqXh69FT7S078EJD/B0M9acJY6a/HcP?=
 =?us-ascii?Q?gQw9RKVAcPA0D2YSVY5J8ZqfpWfjMUzW7AV4HlgY1dz4m8ioTSg3W17kstK+?=
 =?us-ascii?Q?O/Z6KsySiJAc3xBVkClfqWH/OgdDU9Guhfz3YWZ67hR+0kZWLMYTt3Ex7+JN?=
 =?us-ascii?Q?eqaD37XAiLFGOHEmHH2hPqCQOrJUdGMPrdUkz2Q6FkgUcYpr+cOOye+kHJWa?=
 =?us-ascii?Q?GEGg6hM56GHctBC3CxGRlLe7p8q4oLCNDR1SGTyNxdG2wm1jmvgPevnKM3Lk?=
 =?us-ascii?Q?5jJo3e2INGDllXudjOrVVWBM6QUgLC7oE/zK5ZBF7M46tUmQs42j7M7AUvs3?=
 =?us-ascii?Q?R84CViMFJVBiZyCfFvKOigBANBNWpxFnhUBmxOpIQSedqS865q8qWThw4qQp?=
 =?us-ascii?Q?+v+Cysi2ZXwxBMrz7+C8Uekfvs2HHb6CpqPD78G1Ay8coqc9Oon3+jxuOWCi?=
 =?us-ascii?Q?SUT6P+rVLTQkqo/vYfzuRuu5Wh/w8vzN6nWWfDQ4s/G1KYpJNUrZIa9SFcDA?=
 =?us-ascii?Q?A8f2MinRIEaTq/OrfjsM1Imf8fBkj0tx7iE+OCZuBKXjIz8HjGT6JZORi5NI?=
 =?us-ascii?Q?EdrIpeFrN6T+QG17IWyw3mFoTYwiE42PC2SGYbAihG9MQzss1dDZyTEwQ68T?=
 =?us-ascii?Q?3WpoKIihPrdjCuSCQZmMPsrrX3drXfGZKMRGawik1NNrW80FhuMjJjFIfFiT?=
 =?us-ascii?Q?ZqdppDVEY1XayHoVxw1UjvgGvZuIc0UfLrPmVsMD65IIl1OQIY4Ak5yy2TqS?=
 =?us-ascii?Q?pd4p/M8INp4Jg+E0ejFOh9Titk/+Mu4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e52033b-6c6c-4fcc-48b8-08dee8b671d4
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:32:22.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxJJNLBefyLlF2g6iujAGkK5N6GzMqiVfDPnVhO6cVo4kMTaDuIkLPGbbJwyD/wJ8SMck9xX2fpytuIinydO8y2Ve0bKJzltIjXt8iVzMX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241829

Backport patch to fix CVE-2026-41990.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-41990
  https://osv.dev/list?q=3DCVE-2026-41990

Upstream fix:
  https://github.com/gpg/libgcrypt/commit/905e00f046a71e5670517779afaf85a35=
4952832

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 ++++++++++++++++++
 .../libgcrypt/libgcrypt_1.12.1.bb             |   1 +
 2 files changed, 317 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.pat=
ch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch b/me=
ta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
new file mode 100644
index 0000000000..a4f1809227
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
@@ -0,0 +1,316 @@
+From 024391fc505ebf9c47e51953d7d85995ba179576 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 13 Apr 2026 11:51:46 +0900
+Subject: [PATCH] cipher:dilithium: Check the label length by caller.
+
+* cipher/dilithium.h (dilithium_keypair, dilithium_sign)
+(dilithium_verify): Return gpg_err_code_t.
+* cipher/dilithium.c (dilithium_keypair): Return gpg_err_code_t.
+(dilithium_sign, dilithium_verify): Ditto.  Check CTXLEN.
+* cipher/pubkey-dilithium.c (mldsa_generate): Follow the change.
+(mldsa_sign, mldsa_verify): Likewise.
+
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+GnuPG-bug-id: 8208
+Co-authored-by: Thai Duong <thai@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+CVE: CVE-2026-41990
+Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/905e00f=
046a71e5670517779afaf85a354952832]
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ cipher/dilithium.c        | 101 ++++++++++++++++++++++++++++----------
+ cipher/dilithium.h        |  20 ++++----
+ cipher/pubkey-dilithium.c |  34 +++++--------
+ 3 files changed, 99 insertions(+), 56 deletions(-)
+
+diff --git a/cipher/dilithium.c b/cipher/dilithium.c
+index 955feb2a..212c4afe 100644
+--- a/cipher/dilithium.c
++++ b/cipher/dilithium.c
+@@ -82,6 +82,7 @@
+ #include "gcrypt-int.h"
+ #include "const-time.h"
+=20
++/* With glue code, we only use the "_internal" API of Dilithium.  */
+ #define DILITHIUM_INTERNAL_API_ONLY 1
+=20
+ #include "dilithium.h"
+@@ -120,23 +121,33 @@ static int crypto_sign_verify_internal_5 (const uint=
8_t *sig, size_t siglen,
+                                           const uint8_t *pre, size_t prel=
en,
+                                           const uint8_t *pk);
+=20
+-int
++gpg_err_code_t
+ dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
+                    const uint8_t seed[SEEDBYTES])
+ {
++  int r;
++
+   switch (algo)
+     {
+     case GCRY_MLDSA44:
+-      return crypto_sign_keypair_internal_2 (pk, sk, seed);
++      r =3D crypto_sign_keypair_internal_2 (pk, sk, seed);
++      break;
+     case GCRY_MLDSA65:
+     default:
+-      return crypto_sign_keypair_internal_3 (pk, sk, seed);
++      r =3D crypto_sign_keypair_internal_3 (pk, sk, seed);
++      break;
+     case GCRY_MLDSA87:
+-      return crypto_sign_keypair_internal_5 (pk, sk, seed);
++      r =3D crypto_sign_keypair_internal_5 (pk, sk, seed);
++      break;
+     }
++
++  if (r < 0)
++    return GPG_ERR_INTERNAL;
++
++  return 0;
+ }
+=20
+-int
++gpg_err_code_t
+ dilithium_sign (int algo, uint8_t *sig, size_t siglen,
+                 const uint8_t *m, size_t mlen,
+                 const uint8_t *ctx, size_t ctxlen,
+@@ -145,9 +156,17 @@ dilithium_sign (int algo, uint8_t *sig, size_t siglen=
,
+   size_t i;
+   uint8_t pre[257];
+   size_t prelen;
++  int r;
+=20
+-  if (ctx =3D=3D NULL && ctxlen =3D=3D -1)
+-    prelen =3D 0;
++  if (ctx =3D=3D NULL)
++    {
++      if (ctxlen =3D=3D -1)
++        prelen =3D 0;
++      else
++        return GPG_ERR_INV_DATA;
++    }
++  else if (ctxlen > 255)
++    return GPG_ERR_INV_DATA;
+   else
+     {
+       /* Prepare pre =3D (0, ctxlen, ctx) */
+@@ -158,28 +177,44 @@ dilithium_sign (int algo, uint8_t *sig, size_t sigle=
n,
+       prelen =3D 2 + ctxlen;
+     }
+=20
++  /*
++   * Note that the second argument of the upstream routine is the
++   * pointer to output length of signature.  It assumes the first
++   * argument (pointer to output signature) should have correct (or
++   * more) length, beforehand.
++   *
++   * Before calling the routine, we should check the length.
++   */
+   switch (algo)
+     {
+     case GCRY_MLDSA44:
+       if (siglen !=3D CRYPTO_BYTES_2)
+-        return -1;
+-      return crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
+-                                               pre, prelen, rnd, sk);
++        return GPG_ERR_INV_DATA;
++      r =3D crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
++                                            pre, prelen, rnd, sk);
++      break;
+     case GCRY_MLDSA65:
+     default:
+       if (siglen !=3D CRYPTO_BYTES_3)
+-        return -1;
+-      return crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
+-                                               pre, prelen, rnd, sk);
++        return GPG_ERR_INV_DATA;
++      r =3D crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
++                                            pre, prelen, rnd, sk);
++      break;
+     case GCRY_MLDSA87:
+       if (siglen !=3D CRYPTO_BYTES_5)
+-        return -1;
+-      return crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
+-                                               pre, prelen, rnd, sk);
++        return GPG_ERR_INV_DATA;
++      r =3D crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
++                                            pre, prelen, rnd, sk);
++      break;
+     }
++
++  if (r < 0)
++    return GPG_ERR_INTERNAL;
++
++  return 0;
+ }
+=20
+-int
++gpg_err_code_t
+ dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
+                   const uint8_t *m, size_t mlen,
+                   const uint8_t *ctx, size_t ctxlen,
+@@ -188,9 +223,17 @@ dilithium_verify (int algo, const uint8_t *sig, size_=
t siglen,
+   size_t i;
+   uint8_t pre[257];
+   size_t prelen;
++  int r;
+=20
+-  if (ctx =3D=3D NULL && ctxlen =3D=3D -1)
+-    prelen =3D 0;
++  if (ctx =3D=3D NULL)
++    {
++      if (ctxlen =3D=3D -1)
++        prelen =3D 0;
++      else
++        return GPG_ERR_INV_DATA;
++    }
++  else if (ctxlen > 255)
++    return GPG_ERR_INV_DATA;
+   else
+     {
+       /* Prepare pre =3D (0, ctxlen, ctx) */
+@@ -204,16 +247,24 @@ dilithium_verify (int algo, const uint8_t *sig, size=
_t siglen,
+   switch (algo)
+     {
+     case GCRY_MLDSA44:
+-      return crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
+-                                            pre, prelen, pk);
++      r =3D crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
++                                         pre, prelen, pk);
++      break;
+     case GCRY_MLDSA65:
+     default:
+-      return crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
+-                                            pre, prelen, pk);
++      r =3D crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
++                                         pre, prelen, pk);
++      break;
+     case GCRY_MLDSA87:
+-      return crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
+-                                            pre, prelen, pk);
++      r =3D crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
++                                         pre, prelen, pk);
++      break;
+     }
++
++  if (r < 0)
++    return GPG_ERR_BAD_SIGNATURE;
++
++  return 0;
+ }
+=20
+ typedef struct {
+diff --git a/cipher/dilithium.h b/cipher/dilithium.h
+index 88a48094..dc18f158 100644
+--- a/cipher/dilithium.h
++++ b/cipher/dilithium.h
+@@ -64,16 +64,16 @@
+ #define DILITHIUM_SIGN_STACK_BURN (161 * 1024)
+ #define DILITHIUM_VERIFY_STACK_BURN (122 * 1024)
+=20
+-int dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
+-                       const uint8_t seed[SEEDBYTES]);
+-int dilithium_sign (int algo, uint8_t *sig, size_t siglen,
+-                    const uint8_t *m, size_t mlen,
+-                    const uint8_t *ctx, size_t ctxlen,
+-                    const uint8_t *sk, const uint8_t rnd[RNDBYTES]);
+-int dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
+-                      const uint8_t *m, size_t mlen,
+-                      const uint8_t *ctx, size_t ctxlen,
+-                      const uint8_t *pk);
++gpg_err_code_t dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
++                                  const uint8_t seed[SEEDBYTES]);
++gpg_err_code_t dilithium_sign (int algo, uint8_t *sig, size_t siglen,
++                               const uint8_t *m, size_t mlen,
++                               const uint8_t *ctx, size_t ctxlen,
++                               const uint8_t *sk, const uint8_t rnd[RNDBY=
TES]);
++gpg_err_code_t dilithium_verify (int algo, const uint8_t *sig, size_t sig=
len,
++                                 const uint8_t *m, size_t mlen,
++                                 const uint8_t *ctx, size_t ctxlen,
++                                 const uint8_t *pk);
+ #endif
+=20
+ #if defined(DILITHIUM_MODE)
+diff --git a/cipher/pubkey-dilithium.c b/cipher/pubkey-dilithium.c
+index 03958bb0..8c3f650e 100644
+--- a/cipher/pubkey-dilithium.c
++++ b/cipher/pubkey-dilithium.c
+@@ -170,7 +170,7 @@ mldsa_generate (const gcry_sexp_t genparms, gcry_sexp_=
t *r_skey)
+       memcpy (seed, seed_supplied, SEEDBYTES);
+     }
+=20
+-  dilithium_keypair (info->algo, pk, sk, seed);
++  rc =3D dilithium_keypair (info->algo, pk, sk, seed);
+   _gcry_burn_stack (DILITHIUM_KEYPAIR_STACK_BURN);
+=20
+   if (!rc)
+@@ -206,7 +206,6 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gc=
ry_sexp_t keyparms)
+   size_t data_len;
+   const unsigned char *sk;
+   const struct mldsa_info *info =3D mldsa_get_info (keyparms);
+-  int r;
+=20
+   if (!info)
+     return GPG_ERR_PUBKEY_ALGO;
+@@ -258,17 +257,14 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, =
gcry_sexp_t keyparms)
+   else
+     randombytes (rnd, RNDBYTES);
+   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
+-    r =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
+-                        NULL, -1, sk, rnd);
++    rc =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len=
,
++                         NULL, -1, sk, rnd);
+   else
+-    r =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
+-                        ctx.label, ctx.labellen, sk, rnd);
++    rc =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len=
,
++                         ctx.label, ctx.labellen, sk, rnd);
+   _gcry_burn_stack (DILITHIUM_SIGN_STACK_BURN);
+-  if (r < 0)
+-    {
+-      rc =3D GPG_ERR_INTERNAL;
+-      goto leave;
+-    }
++  if (rc)
++    goto leave;
+=20
+   rc =3D sexp_build (r_sig, NULL, "(sig-val(%s(s%b)))", info->name,
+                    info->sig_len, sig);
+@@ -300,7 +296,6 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, g=
cry_sexp_t keyparms)
+   size_t data_len;
+   const unsigned char *pk;
+   const struct mldsa_info *info =3D mldsa_get_info (keyparms);
+-  int r;
+=20
+   if (!info)
+     return GPG_ERR_PUBKEY_ALGO;
+@@ -350,17 +345,14 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data,=
 gcry_sexp_t keyparms)
+     }
+=20
+   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
+-    r =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_le=
n,
+-                          NULL, -1, pk);
++    rc =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_l=
en,
++                           NULL, -1, pk);
+   else
+-    r =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_le=
n,
+-                          ctx.label, ctx.labellen, pk);
++    rc =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_l=
en,
++                           ctx.label, ctx.labellen, pk);
+   _gcry_burn_stack (DILITHIUM_VERIFY_STACK_BURN);
+-  if (r < 0)
+-    {
+-      rc =3D GPG_ERR_BAD_SIGNATURE;
+-      goto leave;
+-    }
++  if (rc)
++    goto leave;
+=20
+ leave:
+   _gcry_pk_util_free_encoding_ctx (&ctx);
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.1.bb
index 55872a5c23..d7f8563ae6 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.ta=
r.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            file://CVE-2026-41989.patch \
+           file://CVE-2026-41990.patch \
            "
 SRC_URI[sha256sum] =3D "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d0=
3a91a79832aa3c"
=20
--=20
2.53.0


