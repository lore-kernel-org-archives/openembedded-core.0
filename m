Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEE2C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157.1787249440652542094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mtzSQtXa;
 spf=pass (domain: est.tech, ip: 40.107.159.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgo8oJVKxbrYqE+zCmb/TI1y7hGlae9JCFrYtJdJl5hoUlGV7P/nDet2JIvIcObOIgFIjNf5jQ8v/ZurnyMbIS4D+ZofevrHEHxF10/wN3LyDEmG0trnPI2Kj3ge3eL1lo3ZwHdUnLjL0IYrps1G2HQw50zGSIYgm9HMoUW+FjsqMbI3hw3wRL8SzMxc0WzujKM1dlPfw0tIFoa1aSdI+QnZe4xNL+/xFvdzKMFdtBGW6JRMklVnK48jidcXu9jdDbt2U2KDlF5wkeUnUVe6zufERT5YMcE373Jpy6KIWwsFjDUNc95z+PUiq0vTsEvuoe6nss/DoclQQIvGossjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAvuJNl/dSn1WUGlZSB7ku2l3/9u6n2BjR+vEXwU4ME=;
 b=seuzcs7evqG7TTgZliuWxOf25/doo3CXt0sBGtBbs4pl6kxBYUV2uAZ+4ghrxqagcPAsAPCTKeIAMT/q5On8nHhSJqwUIa2zzEBCmzDs8lUqS2/Z2xWi9PQYClVw+KIA4I5qJQv5B+X9agnV6Y/RHSqHh2+wgxDs7XuK4239H7PpsWuyG4FOhlrtKzGAENn+PijwzFMZaabwnYbWhXdoQOKXtQlvYw//irBN81aZobwzs9EqVjX5Iq787NKmzIoOTtmQ8c4cf+LA3OaibgQejsm2N/ebbVgdnJBWT6R5QjonHX/WOQEQYmumcUR6hobbJo4I9604bpIUg2U43uSCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAvuJNl/dSn1WUGlZSB7ku2l3/9u6n2BjR+vEXwU4ME=;
 b=mtzSQtXa7DkeR/ITh7FMm+vwCaMDvIjZ9VgnhF28855pDcitcqZI6EOxiuCAFlnbemqLY6QUBXwNdaEPSzLNFquiMNKAZMDncVYF11RwW5GfNPweylyTcbDLDjPMzQlMEnkj680JJ2sG9iWDxMFaXljPwi/uiqJrTUO9ZD4bqCyH6I3cJSNSv9yi86cxKewOh/IMMFdX8zq3Rnq+JLjNwEDBLRyMLblulox/p1ZB04BIUbA3YcrWY7xZSlnN1KieOlp+TPPhB55O/GjKLc5xWimtESx3vLosplpvJbRLm/SGCio0VKTIUbd5kzd2ltsufRDNLuRaC3cklZhYF6Ek0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:37 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 5/6] u-boot: fix build with OpenSSL 4.0
Date: Thu, 20 Aug 2026 20:10:21 +0200
Message-ID: <20260820181022.44434-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::23) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: ee646da0-8a29-42ce-3936-08defee6561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|3023799007|11063799006|22082099003|18002099003|13003099007|4143699003;
X-Microsoft-Antispam-Message-Info: 
	AwFNwu/phsbLVFfX/Bbe5uo0FIjwfaz05OQHJQOgmRONoyICs3siUOIwenPNQsHbJkoErFRzDZ/zTWbyFDQpZ6Fbi5o8oCIMeUKSuHIeRAOWseYKF6aVs3mMtt6bleovcCLZcItBTu13vi+rLI3XvR3WfBvtG86nxk9uxbXVa12a7UhZGV33s94nEjglkqF6qh6MxCPASU5ODTEVrzQhpoHwEYpazp/nC92kUSf1dZ9mhxfOIO8O9qIX+gj64HGqQMCH/24bFyyNAHwgcqKu/yjxMUNaJtApk+ITuOZKCLX3fKxrjmTzU6fvq+LGwUlPSgBTpTLI6C+392hDYDVIoLKcR/1QGLH0oNnS8wGY9ZrAFxJRJnA+LFYsBuQBdFRmAHp/nZhmGpRSkMXBFFktZ7Jwo6qwD1WWbqC5MIrAi8FGRxLJ352hlMV0gqsxstxuNyG8L9amLKv5tVj6jQH9z/FMLDlzu5Bvwq13Aj+Dg57BR/yu0Q+0GfoSkycxdUKw48KVIIB7wEc/juyRXVFp6+Ay0ILMGKrs7pmpOA7s1d6RW6M5DeCOfvAndCE8Vw6b+imX7MOqdhBlO71qqkj+RhNKKwDUJXuzL2ElZVins7rUmFFVCPzkZz/8xfGgGSG5V4mTfOokMBJ1Q/3j6/gBG9slyrNyNO6qoPCXorVu8Do=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(22082099003)(18002099003)(13003099007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/6PSR+jXwluEmYV/2mDfuHKUxedOct0QnQ5ovLsd4k2jFosJchT8j/cBBRIF?=
 =?us-ascii?Q?153qWy5MhZHHYoFtPnCxNNQ1XmQ2ehJOEnnoUtfFCOpGC3mZGsJY7RHwYonr?=
 =?us-ascii?Q?SdCZrFyp10zDeJ6hZ4cEgPnDOnrU8OcvDwSuNEJOGawFwRcxzWOGQmrp7DSX?=
 =?us-ascii?Q?XPxIY2ws4lbDmkIirK10D+JSfYMpxt9MGVIx4xjYgPX50PorDUVjR9NBOD1T?=
 =?us-ascii?Q?nqC6CpuaeVLVtQghVqAf7GvTpA8+fIS7/PVp/Zeq68LGgYlhmDc1tH7qsIcZ?=
 =?us-ascii?Q?cxEUXRJ9PXxg+Sj+e0H1AtBHrI9jUsRTWZbz1MbPAfTHvu09YM6X166F1kNl?=
 =?us-ascii?Q?40JaScUXoCoXbIzx0iCtLgYVR+8l5fMo8uMBxStxHQu69AqNabJPC4lZDvKo?=
 =?us-ascii?Q?L6GGkI7VWwVjjd9KE4lPxOSQYcrXf+C7GGi87k53QjXd8bnRKxUgOyMZLnwW?=
 =?us-ascii?Q?MWXHYZ7jy80UucQ40AYsnqJlmBUuGuCHFZZOr8MtntM67XgQwntcYu84OJcL?=
 =?us-ascii?Q?GEG4ty7arwzReYD0aQz24TZwx6qDUtX63cypTna3MNLPAkkl/0lkmc+Wg/3O?=
 =?us-ascii?Q?ABxNxKQgRviiue2Mq41CgytN5K3SJDTxQ6C+pQ6f9vIDYA1azGHI1sS2NQXs?=
 =?us-ascii?Q?/QdqRLn7u5je8oPo2BPdA9UkQa7aT8xQIoJK2Q9KjBsZXz98m6/GOK5H1shN?=
 =?us-ascii?Q?y12di9BkFtCke9Sbc/ZcAnKWZMpwbxWs2k6WdmSpAxU8TpYLw8ZdXGHuKRx1?=
 =?us-ascii?Q?Ipm028kB9RgfNCOi5pIPutwGh2/qrHTV9aO1L/u1GxoKz8QcACGBC5Ztgr21?=
 =?us-ascii?Q?Yox5NSV797Hfl+MGhDE8DJKE9+CFL65ZyQGH3gx8sQU3ouFi3viXVEWpXXAM?=
 =?us-ascii?Q?EqZ7XpWeSjAGRRxCz84WshjjqbkyRevZU3csyn4c3Pa4YQRdf38p2VnE6DPc?=
 =?us-ascii?Q?t2BuREzXOp4zhDW8Khn8Y3J8xd5L0HlTJyQB8hj/np2emWnRddeimW3ucltF?=
 =?us-ascii?Q?z93ODJI9v2pIOCexr/9ewEu6XdgzD1Zrl0tTAhLw8ew1pwae36YXcQJm8ay9?=
 =?us-ascii?Q?6wiilKLiPjPdFk2yET2mv0hJB9uLqCy0loUe0HhB2umnQ//5gEQSuJXrvu+w?=
 =?us-ascii?Q?QjbQ8OVr6EPGHQSvtPetRjHLfQpWImaxulfBA9Mz3ORpzmUVBLOeY/2YLS7K?=
 =?us-ascii?Q?V0IarO0vQ6qdwKgtK4claxIaHlVSTOCZF467lr5IGe9kDlV83rNNNNpI71v0?=
 =?us-ascii?Q?o+TAA1/l3vencEYUrLqT6XmP3LlzIDIR26hhgBiGV1Mn4m8mHBNhSkoatAEX?=
 =?us-ascii?Q?cGboJNiw2uo4EC0+u1DoucJlvlQUBn4dhJ3qIJtdBdiEq21/KyLMaee+42dd?=
 =?us-ascii?Q?FCSHJdPfTSGOfAdnXmsAsAK6wPlkit7kjUnkgLtOTuDBgLdWdsbUUPa2P97s?=
 =?us-ascii?Q?2VUq/5wrReau+iwBVDYgoUMtL5Vww5mT+rbUIqsvg1WSsfFaMwsH92zYQvCh?=
 =?us-ascii?Q?TcLFK7ZQqbfqZyx/rv8nWnHccO2g6Kz4CHf9GVJCI8ANt1aKoUioinfix2FU?=
 =?us-ascii?Q?E5fa5yLrFycCh0R5rl9QYGGLy38Wn2sc06F1OC6VNTaAnfDLstRWYTEjpedm?=
 =?us-ascii?Q?xd8KgnKYuU6f3n0QC0kp2dQsOhCB9sYDaDpxgRgkvHECzZnYYy95H/Fb2kXL?=
 =?us-ascii?Q?S3zHPIZ8A0jbVuJZLw1sVf4fx0P7/0Cd9E7v0GXevtm5888Oc5r5FCoEmFIb?=
 =?us-ascii?Q?QT9hoVGaQHqFvTxXkXy8BNqHLCAcI+YV+0ZRuV+nbv4pGsRAwfbFnOX1Vf7n?=
X-MS-Exchange-AntiSpam-MessageData-1: LxEHHgod0kxZb/Y6Ip5AmRSy7fcvzQ8psjE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ee646da0-8a29-42ce-3936-08defee6561d
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:37.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKc6RCFO/Mhn2CqwGih2BGMag0Uxa0F4uI+c8yze/6dE7pmAAh14oX93183xKxG0o5OP4zs7ym5enQfWt3Ch7zvSeP8LTxYBzb2+G1+iMSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243879

OpenSSL 4.0 removed the ENGINE API entirely. u-boot uses
ENGINE_get_id, ENGINE_load_public_key, ENGINE_finish, ENGINE_free
in lib/rsa/rsa-sign.c which causes link failures on all platforms
that build u-boot (including riscv64).

Backport the Provider API support patch from upstream u-boot which
adds OpenSSL Provider support while maintaining backward compatibility
with older OpenSSL versions that still have ENGINE.

Add the patch to u-boot-common.inc so it applies to both u-boot
and u-boot-tools recipes.

Upstream-Status: Submitted [https://github.com/u-boot/u-boot/pull/918]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Add-support-for-OpenSSL-Provider-API.patch | 300 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Add-support-for-Open=
SSL-Provider-API.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Pro=
vider-API.patch b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSS=
L-Provider-API.patch
new file mode 100644
index 0000000000..5012e3c33d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-A=
PI.patch
@@ -0,0 +1,300 @@
+From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
+From: Eddie Kovsky <ewk@edkovsky.org>
+Date: Mon, 23 Feb 2026 09:43:22 -0700
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D=
 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://github.com/u-boot/u-boot/pull/918]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/aes/aes-encrypt.c |   4 +-
+ lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 100 insertions(+), 6 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index 90e1407b4f09..4fc4ce232478 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+=20
+ #if OPENSSL_VERSION_NUMBER >=3D 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 0e38c9e802fd..f456f3c58e65 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >=3D 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond =3D (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() =3D=3D 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e =3D ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+=20
+ static int rsa_err(const char *msg)
+ {
+@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, co=
nst char *name, EVP_PKEY **
+  *
+  * @keydir:	Key prefix
+  * @name	Name of key
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL=
)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir=
, const char *name,
+=20
+ 	return 0;
+ }
++#endif
+=20
+ /**
+  * rsa_get_pub_key() - read a public key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine=
)
+  * @name	Name of key file (will have a .crt extension)
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL=
)
+  */
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+=20
+@@ -207,13 +251,44 @@ static int rsa_pem_get_priv_key(const char *keydir, =
const char *name,
+ 		return -ENOENT;
+ 	}
+=20
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key =3D NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++
++	store =3D OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info =3D OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) =3D=3D OSSL_STORE_INFO_PKEY) {
++			private_key =3D OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp =3D private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+ 		return -EPROTO;
+ 	}
+ 	fclose(f);
+-
++#endif
+ 	return 0;
+ }
+=20
+@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, co=
nst char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL=
)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydi=
r, const char *name,
+=20
+ 	return 0;
+ }
++#endif
+=20
+ /**
+  * rsa_get_priv_key() - read a private key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine=
)
+  * @name	Name of key
+- * @engine	Engine to use for signing
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL=
)
+  */
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+=20
+@@ -325,6 +404,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+=20
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
+ 		ENGINE_free(e);
+ 	}
+ }
++#endif
+=20
+ static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding=
_algo,
+ 			     struct checksum_algo *checksum_algo,
+@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+=20
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret =3D rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+=20
+ 	ret =3D rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+=20
+ 	EVP_PKEY_free(pkey);
++
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+=20
+ 	return ret;
+=20
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+=20
+@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info=
, void *keydest)
+ 	ENGINE *e =3D NULL;
+=20
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret =3D rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret =3D rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info,=
 void *keydest)
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+=20
+ 	if (ret)
+ 		return ret;
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index d82d42cbce..7fce65191b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,7 @@ SRCREV =3D "ece349ade2973e220f524ce59e59711cc919263f"
=20
 SRC_URI =3D "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV} \
            file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit=
y.patch \
+           file://0001-Add-support-for-OpenSSL-Provider-API.patch \
            "
=20
 B =3D "${WORKDIR}/build"

