Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C0BC5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:52:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1192.1787421126431531265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yWlMqlgE;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb3QxApBx81UJ4DFCI1OWZ37g9N8ohzGw4NVnabL8AOOE/yN2YAUcjEWydYp6bUndUtp46qFRkg5h5vKfhJaJpVc9QJqmTOlBB8E5qh6D0XDHhJpV9rxHVA9UVhTqBm1kmZQqfa0CSux1vQ9OQUwHJ0/JJdOH+In2mpDThDoLP/t/kz1CAX5DxdmnNFH4/7ydk+c8FoU/YDyAZz1K8+JEGHDrAQUkXXdcebWR5yP6h6wAW6coQ48C/HK76Tq0iea3pfvgIvmTHrfZ/AwEtg74xgU88c1m5z/lDbm96WYA1HgAaULkwQGehWDYNFyZpfxvoTZ5RvU4daMsnVovPRacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM8g/I3zMrwx6Qs9f0f97J6CzZtP7ajQdNI3kOIaRBE=;
 b=DimQTPSDVz277pKLfgb/uLJaa3NftQF376dnLoTx1lntlOZU8MMeNrUjffuP0qYOcvOIXfeAXMDuYYwoAim7q7JWU8TgIOf1s/QOhIr2ldjKL4sQftTNNIjBhTCHZGrlZgjEYm09oguVQm++sIdksm+eYvoqmArDpQys63NaIA2bE0LTh40GOA5psV49awJgR88jBuQ3kuj9N8Rqm8JR8JdfkOUXFJk6gBzcwkfcM40k8BeNwgfizaJEM7rgUpuo1iLg1vxxVUv19phlHYhyz0nwvVjF9Vj3BfWiphntIV3BfmOqvXaTDBlk4Em35HfYuTz19W2E8Xtt5JBEveN38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM8g/I3zMrwx6Qs9f0f97J6CzZtP7ajQdNI3kOIaRBE=;
 b=yWlMqlgEs+VlD973lVjesuaVl/f8HwZiIgO9CXPC3fXKy7nXjEzPjo7gCe/0o5pfDpUVgTAEZ8O1P6vxu1uCtS0nAeCIiPD8nndcAyJg3v7rcyUuYV1soDfHTe56p10lxdWYguwGs1i1UHW9+ycYK4P/occuakpf5KGII/dXIUeIIDdCmgg43RmOtDgywc4zsVnw1UQ5hfPVKBEcY9jd7KDNZaer9Fs4TL4cs1OmIuIWekVWcjk7gNAEY9Osq3DZALXhLlB4cV6JiYCPperZXXMWFy9dHhmfmWbhcBJ4AmLifUFQVU9Mlln/m8KyHE3ngy3tVuJmmKK2+Ed0+DAxhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 17:52:08 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 17:52:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v4 5/6] u-boot: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 19:51:59 +0200
Message-ID: <20260822175200.57534-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: b96c0988-ff80-4814-cb03-08df00761561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|13003099007|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RiIaUc7OqImqCboS2PQzAx0Fd/NWmR6IqzOD0GKjZlPrJI7yyEKUPEOiEsBD2WDHZ8zWAhi6lZg3vaapJp2r35rO563MLUiGVaWfzPH53HQ/aGsa9vO006qpRApYsKgRt2HYaAUb8hqEt4rAM5XeW6WPS7EkOJAGK+PRbX7ur4A8O7XO6rVLyVW54qoqsqOcdsXzV+lo/ZCK0Rkyeh99WziiOSXfqlBCObNHfm8PT4yHDS+exfUwkmZ61NrBkevuT6k/K839mydZUtAcFGCkLK13eqFVUVfYtkY0idSA+jnF9HXsN0Xn3SOjLrWvuBmbhYYICuNRBlxoYhW7brq5uquCSlcyprvqOJamrgmI274T4EzXrczh3f6ugvfdU/Ub/H9vJxNp9A264KMTDOdUbrD8+jG1IM4av5NMyapgEqkx8GiZU4f9AzAy2KjqFiPd4yD1koWN1eswSAMBULXQyAT4yIy5Oukjdq6UVcKL/by3SWVjjtO7S/60SfUEQuJMQ3REfZ8H6IK3Zpt4B7wJ3Sp6OHVQpvWuWlbaeMlj6XPYEw5EroCfO+KIFd8EtedmHqXAAGAcTU79DPlhx8o9MmpMSWS7SqQ15Wh4bjjQQTEsmINILhRYfIXzv9+5sP9jh2voDZ+rxdtTILS5kF8YAUolUtekNALymsrDdpAWdkI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TgcqNU/MPD4X2lA4Cc4NUrciq17dqd/PxKIZn5Pkhwt66JPwMpCk67oagm63?=
 =?us-ascii?Q?6A/DPAEEEsbSpw+s5h3L4r93zm9CNse+muCbjj5qcMSXpRqgYOB1dlPwMiA9?=
 =?us-ascii?Q?PRCn7xmfKy7ZNYcutUg6wnPdmiBjjTJmgN1E+7R8KvEZXIJJnJ1PY0KprYwY?=
 =?us-ascii?Q?WirKhCn0EUjHz5k8sarcF+ndIusjeYLTe4Q5s+V8OPHWjqM9MQMHHK1fcGrB?=
 =?us-ascii?Q?RX/C4OW4CLZQeTeLF9l1QVtG8le6/1F/Tq7atkH7EFgnqo8qtQtWzhmDcQ6g?=
 =?us-ascii?Q?Ce25v3OsImo4Wg5kXUsqnK9ZS7KTUPf+1qYJIpVLTJ9CbJxKw1PWlye/w1w4?=
 =?us-ascii?Q?IR9mE4jxucalQv0ai5Ymd7tw7hwNlCTFIOc1jAkc0XoavpkE/O9DEF82kB4h?=
 =?us-ascii?Q?1WU4NiwIEnRaob7MQAYBpQJCz2mOOPfeHlGaoHyijF7sqP7aECuNtHZCzC9S?=
 =?us-ascii?Q?DEsYykT8Qgakhcl/OfUUNOVHpg8piNWI9gNhSulVwtkViFc74FTly968P1EO?=
 =?us-ascii?Q?/8t5oL3kIz+Vl8D1rbcFmzQPTV88Ykf6ad1ZhuJvNUNV4GFGCkM5Sfqo8c7D?=
 =?us-ascii?Q?cl4cTPq3aEpu771cgojJjP2LFCUAAs8Zx4RX4gxLQwZewAr5lBmLm2h8T4EF?=
 =?us-ascii?Q?TeamkDYU4bKDnAvDFt3kq65dwYeJSsQPSOkwhHbSZqyrljrFPGanI4gu4LC3?=
 =?us-ascii?Q?AHdOlnjB50UFmVYcLNAAw/B09IwpNlaC30CwvBJVhi/xxztWkyEQq4Mh+l0M?=
 =?us-ascii?Q?AyTSnYtMyJPftpz518J2iQya2W9E63ogqfXMX2Uc+kgTvm8SDBLQueLAQtKp?=
 =?us-ascii?Q?aCpcUWlLCCvZRpex/ZRVtB5cKjCtcEnPQ2Ko8EBX+IAUov0ZCYy6t2y8GRy3?=
 =?us-ascii?Q?f0EpSA466zGt32t5xFJwnt43DpqkOevaZ4FJ8B+/8mUqk+qqsEUzsrYJEQqU?=
 =?us-ascii?Q?XGcJredODqA5q1v1ncJkctuxEFf6gvMwnI5WyEVhzLNOHt1DVK9KArUBNe4g?=
 =?us-ascii?Q?6EpSfBL7cg3ngzcd2ky6LgatkCKGVIA/gzqAmFXW3FWONe/bNxFGOhmGDKUr?=
 =?us-ascii?Q?zxt2oNuCrLcjIvWeJkuTqJmT8PNlMsIOtpqZRFigBK9gD3Xy7ASswy9I7oHF?=
 =?us-ascii?Q?/9I+pHa5Fo4PMBlmW6bb9CNADFtrOWjcPnbn+tlcy29LtDf8+YrrjgCZ7Nvc?=
 =?us-ascii?Q?bZe2rinL7h00Bnr+qlVjPEAdHzyELYnO/wAKOMX0rf0CRUz3eYY6vEsT7ILO?=
 =?us-ascii?Q?OU07gDJIl6iauSXuoA+xEiVmQfqeuaTiteegTZKrcwgZ3gg09ceiDafgAXFW?=
 =?us-ascii?Q?Qpv10pYK3UPhDa+62hY9cAfPPAwSulqicJLWGMphDApVD4c16OVCEdr44FE2?=
 =?us-ascii?Q?v6eE/M5Vmep5hoQ19qyQKWiQ5LJYb46EFh+Fe3NcNr4p7xexUiS/tO016uns?=
 =?us-ascii?Q?C0Gdinhc0vD5/L2VfjVaSOWp9BqGDMPPbmsCTUGxs8UgGi5dHZ0MK/phiuqW?=
 =?us-ascii?Q?ZX7kTPteqtZmpRWLGnRR/8OU7pmt9MaZv6TqpT2h6qscyqyCIIMPhNHIBXMN?=
 =?us-ascii?Q?20PDRy2CPR4w6csg29OL5R2K/mCaYfF8WUOZE8Jl/E29gPo0oBvE484P0XZt?=
 =?us-ascii?Q?v4rC/HHeL5lENfLjG2IoJSfK6sJMhfsZpG0FrZkLbp93lxn3q8NtYAH1bZnt?=
 =?us-ascii?Q?VbOAeAUigXJf5lcfSEJ5N8pKgktqOVBAj2Rm1GRPOHQqJIPmJCTNvV3Wn05E?=
 =?us-ascii?Q?F+l1uOhCIi3yxzewl8pWiLQh9CbzV+AddtX4+EFQNfsoKnOt/bsAaWNFeHmU?=
X-MS-Exchange-AntiSpam-MessageData-1: IqXychWUVy+VYfwwpxp40Lq3tBkR51Y/xrg=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b96c0988-ff80-4814-cb03-08df00761561
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 17:52:07.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdnwkBpruXuczoCnOH0BBJ4yuYM98eQoOKdxKDTQiVzeHxE9whiFHWEO9zY2EQiuC17CZrlJj4kvWkgR+K7rSrsiLTj2up/wvXPKY+57aBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243997

OpenSSL 4.0 removed the ENGINE API entirely. u-boot uses
ENGINE_get_id, ENGINE_load_public_key, ENGINE_finish, ENGINE_free
in lib/rsa/rsa-sign.c which causes link failures on all platforms
that build u-boot (including riscv64).

Backport the Provider API support patch from upstream u-boot which
adds OpenSSL Provider support while maintaining backward compatibility
with older OpenSSL versions that still have ENGINE.

Add the patch to u-boot-common.inc so it applies to both u-boot
and u-boot-tools recipes.

Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.8=
3091-1-ekovsky@redhat.com/]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Add-support-for-OpenSSL-Provider-API.patch | 340 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 2 files changed, 341 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Add-support-for-Open=
SSL-Provider-API.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Pro=
vider-API.patch b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSS=
L-Provider-API.patch
new file mode 100644
index 0000000000..346d0584d5
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-A=
PI.patch
@@ -0,0 +1,340 @@
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
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.=
83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ doc/build/gcc.rst      |   4 +-
+ lib/aes/aes-encrypt.c |   4 +-
+ lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
+ tools/docker/Dockerfile |  1 +
+ 4 files changed, 103 insertions(+), 8 deletions(-)
+
+diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
+index 1fef718ceecb..29a6a632e7e3 100644
+--- a/doc/build/gcc.rst
++++ b/doc/build/gcc.rst
+@@ -25,8 +25,8 @@ Depending on the build targets further packages maybe ne=
eded
+=20
+     sudo apt-get install bc bison build-essential coccinelle \
+       device-tree-compiler dfu-util efitools flex gdisk graphviz imagemag=
ick \
+-      libgnutls28-dev libguestfs-tools libncurses-dev \
+-      libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
++      libgnutls28-dev libguestfs-tools libncurses-dev libpython3-dev \
++      libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl pkcs11-provider =
\
+       pkg-config python3 python3-asteval python3-coverage python3-fileloc=
k \
+       python3-pkg-resources python3-pycryptodome python3-pyelftools \
+       python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
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
+@@ -207,13 +251,45 @@ static int rsa_pem_get_priv_key(const char *keydir, =
const char *name,
+ 		return -ENOENT;
+ 	}
+=20
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key =3D NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
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
+diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
+index 73bf6cdd2c52..50e98e83dc20 100644
+--- a/tools/docker/Dockerfile
++++ b/tools/docker/Dockerfile
+@@ -122,6 +122,7 @@ RUN --mount=3Dtype=3Dcache,target=3D/var/cache/apt,sha=
ring=3Dlocked \
+ 	openssl \
+ 	picocom \
+ 	parted \
++	pkcs11-provider \
+ 	pkg-config \
+ 	python-is-python3 \
+ 	python3 \
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

