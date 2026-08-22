Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8618CC5DF9D
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:32:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7570.1787409121804302606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LOIqdYuN;
 spf=pass (domain: est.tech, ip: 40.107.130.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+g84y5/Z7jGxw3fEvTlMAX3zYkG3bmeYvNMCBAP90St7SAf3c0uUE4bJo/4onee5VoGqTiyALAaJ7wu9Q3OQQv6fk9TXezUeQOh0eRGQ1094qQEmukIWVl/C0GONPJL5bvSLzPo0fW+oNWM5f1bshWthUXEq8S0JpuCm0m6TtlNm44QLiwegocGex9RjWVgn/yKsRTDCfvGB2h+Sxu/Dh0NrKw8VVJ4eAVaADDTtfqV/TvKxYA7IxOMuj/ZrpB4XOTRXkiPyymuoyPb2WTNvAWO6yJZBkmBjK6gVCqyQqafjnXkm15vJgQ/21l2cTy5ZSc1ekTkpjtexbCIEULY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6S4oaJoIOxK1j3hnKU0qJ2qjHZJupUXYOXs0gd+tG4=;
 b=u51GEkMi00SL7oifOFPaAmZcKH5tYpkELbF6Qr3iju56vARHv5MbYJo7m9UUl5AGVUrznpMyPzvUauOOzyAoNcbbdbFTDJmb/qQHTKr+bdvdZocu6bT9vNidTbS0cshKmotxsUWOaI+x3raVTbSy/5ytvqZUqfLdQFUd0iPHV4CoYiULIEpIw1ZrluSss4akIVhBPsVhPfQDmuhCG2foJOPZ/GFhMdG5n5lfXrp6nN/5feQh/dPMTUQnOYQ/WXuKQccOLiNplxIYc1lWefcLiokW6iN0uQ0EHBfG/S8PgODJ0KipZzORiGt+kS0WxCK6VvvjpqVyl+M1x3tfdTkRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6S4oaJoIOxK1j3hnKU0qJ2qjHZJupUXYOXs0gd+tG4=;
 b=LOIqdYuNAivr3xnDm+jQOStQMc03j969D4cO+QS8ANaqqkwXL7ggRYafH//mZnA9+27GsOskQ9NXsWdFMr07yPfpCdY3z9S+CkF4ewE1w55Rtuv9XlnT3vavUcF2HG/FDB5nJZ1SdDdXxbJtxeRLuT0402DpjCFm874PJ+6TVt7GLVFis2l9kJBCTQq38oKdY86gkVPk06O/ICVpoNn9IGw3Rz8P3pkWQ5EeoOU43mAEEtxrebOrtBIMtqgGR0r8TPKNdPomNmcuqm/vJyZlaUahM8Okqjzjh8JK5T/rmlgw1rVupmCk3imvSj+H8Vx7WRI/uOobmwrpJMujHiM1NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0917.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 14:32:03 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 14:32:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC v3 5/6] u-boot: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 16:31:54 +0200
Message-ID: <20260822143155.39273-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822143155.39273-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822143155.39273-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: fc45e6d4-d73b-43fb-d2d8-08df005a2246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|11063799006|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	yy+nJaVbFX6kRlwiQZC4gOgtV25EDLtKDwnp611YKxZDMDB93pwVatN7+/Gocs6QDCD752MJ6KK+DV23V2/qMQ+mAIFEi25COu2P9XUZlyIsH7RYOcRv+2Ixcj9yWN/yVktXDJiRvsbksSMG1akH2mFdmsTT8I5f2Rg4TalltDIrLwD21DPS2/M/hEDiGJgO41YdklWfNq45LycvPDHZ58QABF5oxpnm4hxu+fOO25lgBP3woGxRaTzriR+FQ0ZJvKuT3UiEHygBGI1CP9pZWdJNWIUgbXXPjtOCxtasqCuVh5j6m+o5WqK5kWBQ65nfRhxrGeUDe9jThP71vX6FO+QM/puylUeC6/+5npUqNBjqpqpLmJNEIHlurK8ZDLaszArE7EqN/01gMgP7pjfVoPkMH73ZpXudr2Oc5kIOdgtyFoM9JDDkiBOwA1lwTuItlK0K1LvTVm7Edy2CZgsjYsWp9nxmG4PZBZEsHGpU2W7+MfMjKf+YcXAf+l5KrmN4g32s4ISRDkYPsx6nQJZKkBwxTGN2aQ3z2+SCTZnelfQVY9JROboiDv3qAK29ztzYaFsh2fmpdtOC6SlThmJrj51hkM1hkvrmZLb5Pca9Iswqa7/A1+4iQfio+Qz00eEyQOh9gBZXMM53i7Uw4Dqa8obWNH/nX49C8IF7ZIpvjP8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aFv/VSX+lRxjiHZDhWsnzPEyfos4NMEj/kRklZ/INdQvEg/JIYVebytb8zKz?=
 =?us-ascii?Q?SDsJr2KfJLzoCXhJscuSqcxPG47+gn8uA7k7SCjHrEg9xh3WVl5ImGr+6bTq?=
 =?us-ascii?Q?qXWLCL9oJ9Zlq3WEOhQN9h6FqDpNMfffVL7b2lWxJ5NqJmGHzU+aL1caIyGK?=
 =?us-ascii?Q?/8KXG/t66MtTjmam4EGUrvvGHQ4iJL3r+q3vujNo08PckM1y0qXrdSJisF2b?=
 =?us-ascii?Q?gPphxFXlrW8fkq7dfT+JXyoZZyPTk8Tw2utd+pgyuqyWgIhj4k6CcYnkTuAy?=
 =?us-ascii?Q?L0o1VS7hQAulqsw43Isuwoa06iuhH1lg0lF8KPSYZGraZJjh8+WPSaXjswcb?=
 =?us-ascii?Q?0xT3nvxWLD77iOLdaNrLkdlogwheHjWDoTkEBJ5Xax3N+qCsD11HlBcH706I?=
 =?us-ascii?Q?O6lQ1+0mT9cmPyIs+EQjrEBsUcnP8hR84RjG/WAj1R6wiXuLY+FgNIPPfh1B?=
 =?us-ascii?Q?wezWf8ggwE3aNzfDChK5+KrKBt1NV5fSss60WkT8jsMCFfQUMJMGWGNAi27t?=
 =?us-ascii?Q?sdAmWjxBLggUQArWwKmRVQ2suETk1bDyaubojSOeIJ1XZSYnY7gbyND0v06d?=
 =?us-ascii?Q?1EmzZULgoFbNENlIc0FI7zZysAaHxk2+8IZoOJgH8s/2solz377Boq6ggoJD?=
 =?us-ascii?Q?A0dXdHdyWl84OA+eSZIeFdQmqmgdo1zNpF04TRjbpN0jL0ZoKem6/xXw2wy9?=
 =?us-ascii?Q?wcJ3FQbxv+RHSuF/Yh7eD//Nzeu29N2tqkduaMw2pLRgoKVp4veu8qA0Sb7h?=
 =?us-ascii?Q?hWEUxrEetnTLHn89jneMKfMjdBG+ckKSxdAcRQ+RIMPUEk4VEY4muPbTqqiB?=
 =?us-ascii?Q?9kyGG0JWU5awwSKT3kkwQeerl7H6zfCyOHk4OMf6+ybvbjNtZCicOJshmXls?=
 =?us-ascii?Q?hK7kNoEABocDki03OdqK6ai17BZMUc/E6fQGu1epOxDj85tFI9mxDRzE23UL?=
 =?us-ascii?Q?EVMJ/FLXb3+n4A5nfCGGHsfPUPMJ7e5IRDs8hZWV+MPT69hO58oydcPcFLKY?=
 =?us-ascii?Q?rFQZo0HXYcr5iUVqAGw9x1ZaufzdauX5MyjAHslDqcgPEib6lPaQ7xquWYBb?=
 =?us-ascii?Q?XKyFqf7JhBx73SgJY/aa0RqyzVKA9kmhvMi/pq5s2Ku2zhxSAEH71Zqps5ol?=
 =?us-ascii?Q?gye5cC6opmtXYAr8xO+Kt90Xq0gmACn3nP/neK9jonSY1FzxE3uaU8nLMsKr?=
 =?us-ascii?Q?s8VeXP9blKR7AAz+Flrkmud5gKjAXzueo8xjxQ/A+xNF+i73oRBxLBtxGwWU?=
 =?us-ascii?Q?bxlExScLdQLiOopQSiCBIaV2TALkZvv529lbmCvxijDwLUQYu1VJv9+OKtjK?=
 =?us-ascii?Q?R+GJ4SbP0bSXALAyr2z+LBvW89F3IJUwWM7k5hffdbcY9+FvGk6YMf/+w7Zd?=
 =?us-ascii?Q?DT2sWNQsxazRavUQkuTQ7mRVQNOgMx5Oz3weNsXNTis2m6RL3zSAsA2VeXTz?=
 =?us-ascii?Q?BniM+Q2ILzeEorLJ68e9P6nYruALL2FdlyLey++y80K/3/lTD7rcJZXb8+zP?=
 =?us-ascii?Q?0iIXOCvPoKcBzwjgyr4V3WvBVKA1HaUrsMITws0PkYec54+PuenZEJCzcosQ?=
 =?us-ascii?Q?1BvgKfKCaEmeyQPfrEgp5g2RiI4jvDhPxYMmiWszaQRCV8eppiEpZK7kfdVC?=
 =?us-ascii?Q?4eSIMqrJVmpiBteytCU2rTHiF3NaTfLCVUWBanzt1WDjVjT06v0psX1p6h6X?=
 =?us-ascii?Q?EKJCZ8nPUSlsqnarRXrpO+M5RktDeLW2q7gSRn6pDJe0X5fDTIX2qhoVkcy9?=
 =?us-ascii?Q?fwtqoEHGGBI+dSiX7VH9uLlS27u6F4jd6N8gSY4Pzk6RCbC7KzCGiMeQrzKH?=
X-MS-Exchange-AntiSpam-MessageData-1: 8XiCTtw5ptw6IWwQyR9fvakxudBSAhwW5O0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fc45e6d4-d73b-43fb-d2d8-08df005a2246
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:32:03.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3Osskf9QnbIEOryw7oKtSbedoVhbx/07xt4+L4RzI3Uyk/7bTHOaHje6dVSn7c7b2eDXgXn8SlTOq5mchvELixHrFzKsLaP2jshnnFZz+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243981

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
index 0000000000..c5119acb7c
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
+@@ -207,13 +251,44 @@ static int rsa_pem_get_priv_key(const char *keydir, =
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

