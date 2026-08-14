Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD1EC5DF6A
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:18:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6789.1786684729259054226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mI6CUqeR;
 spf=pass (domain: est.tech, ip: 52.101.83.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3LJF1aBIe/dmAnZiYaZlJ8aXSrLLLB2lvbcAzdK3v+po/IJHwH12knJDkJxCaQrF9XXVRVn8HJ8X3+VSLY+CKcE4TskUndZqZWxu6rNI+nPuDdDJuCR0HTxNQL8SS+ehkHXfc2bYSVUeKzzkgvJQvWYm1rSsDkCeU0TP/lMktYJv7dSpazZaoFS/d3dQXJNh9LfZxo+cX8zSVHcj4selUwo18jtfGAcJtVNKqbPJmtHgT+N8PXv8wMDUMBBlB5NoIA3v9ghw62Gmed1VdRxAHXqIL+VZjQ72f2G5KKQJpg2YTwU2R2DS77qzZYPYq9TCZo7agRVz7S997fVxRSZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRZAlaW5vXqIoZXAwgwI8x70r6QaZL+0Fbf2MjKBYB4=;
 b=MbIymdvP8v4nCYs2XyPYn4IGXI+4jz9nV5oI+CZ5GaymfaJkEAzIYUScLzWAhYKE1pdQAkYX37jsNDn+28ql7j7GLs6xAWQm+so2Q2RSAkh++j8Y5We7n0rOR1Dyp2woeXYr/C7Nz09XZai08ixjITHQyyMqUz7aXPjDUFclsEjlfITr8XjST+xg4xFehmKeMhrlZKyojGOuws8FtiuD37r785m7wm4coblvC6sEMZ0GfSJ0JnlMmZAybRs3jwlQ8rhNmTHCjMdwxjxftszGZxDnAAlVXChkSkaDYcmCGksM+NW/fv28QD3TXkQYtxXrGfd4A6RKZjJdp2g3sDD+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRZAlaW5vXqIoZXAwgwI8x70r6QaZL+0Fbf2MjKBYB4=;
 b=mI6CUqeROsn4+9fIdrMbNDMfKezU708FOhmaDeM7TIs7IUCrwc5dMsXlrkqc71TqdFWUJoqX0W4decuGiX5Pjs5j0vQGFpVRQjLDODR9mtT0j7LX3oVenaFzi92uN7K0DfxkB9zkDQlf1NUyOOhUlMjVr0PnhtkKSZNB0dswjj0Ap/buC09e+rx6BtZEP4z9cEGC3vr+TlQfg8NPRGfewplzXgMX2G1lOFCuZi2yXuVcSzz3qH5Tu7xIWytv8O1uWeuby4coEhnjEMC5jG9fsHjPY9NflKQsNxS4Zyhl4dVjSNyaRmBzeYyylGhzAUm7D+dDa+6NKaYojRQP/MnBkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3385.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:18:46 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:18:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 6/7] u-boot-tools: fix build with OpenSSL 4.0
Date: Fri, 14 Aug 2026 07:18:28 +0200
Message-ID: <20260814051829.35088-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0081.eurprd04.prod.outlook.com
 (2603:10a6:10:232::26) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3385:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cef7abc-ba3c-49ab-2b3e-08def9c38408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|22082099003|18002099003|11063799006|56012099006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	nAF43jGBE5myMsUoarwfGy6No401eXJwKHR7Yul4sur/AoNOvr/vfQcQuHDwT62sV/aSH9bHgfTA24b9AZlG8/nTHbVqCjS7wVsKJTXBwqCscPMY9tt9/9P3w327En5fg9+VO9LBw2WaTa6DnlKLlT6AHoWPn0uZp9x2i1elLTryN1BGxiuzfITevawwpc8D+CVvAk/U/TvOhHkLc79XytSpO8kOPIpJPUGIu/OGpm8eSsQAVdK6iV8fLnyxwnWj9RmOCPHrrluvJO2JBBZg6vUksoJ8keXN3xw9/cTTzi3WFCGTTXVtULczZyR0ejPWDEUzaf4TTLYhw0VXoeknhX4amgrM9yp3P8MdZGBf7461Rn+Kuhj2N1mZzy1dMoh0gyM3QIibtV7mFpsCxkhiOow2r+2o6dhvnPRmQFl8tb4rI+V8wfk1kaIL9gW8mJPEiYR3fyotrHjzLNOaeldNgdZTUNuzYGkDW5qwkjMjQZZrUxc7JjorvM+PP04cwsojLD1mM9ol4TACnOGgdmscz+3aossBcDuUlslhtonAHuS/Nf1RZ99gHQ3977AFJInwTziK+cyA0acBj9TckfgDvNgQ7XQ+6hc+in5BiC67RxEhQdOKWOG5VsnmfprwaHfMnXy5ajCmL0gyMkpDb4hzkdU4QGQ2COEssEpFbgl7osY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b4XaTUkWc+plQfNq8jazPqWuzSvJB25FjkS9mVUm98yEQb+Pb8Rh/LL0OrjE?=
 =?us-ascii?Q?t5QuwV8oIvgw0Oxzah13xYEdl7FA2SPMGALy/gCQNs2/FZDyHdj/BLKFvdTL?=
 =?us-ascii?Q?wqAG/PQ19+IBUEKOSHEqiG2jw1arPHwwZFnXmGk2QwjlHEk9l1yy0t0kt1V1?=
 =?us-ascii?Q?hQ3zWk4Gac8h4VVMjpu6gWRD9SULNqzu7nOgC4yCYcgxDMkD8f7yipcfCuSO?=
 =?us-ascii?Q?YaKdpqirMxZl2Nd/Q4J5yVGvQL6m+vYOT+EhUkw5dxcioqoT53iPTV01DkJ6?=
 =?us-ascii?Q?Quk/eyuBbnG90HJyIwU5cxtRJW/+i5Y5eGvoHU/7kSY2CRvQXmYSy66I3u7r?=
 =?us-ascii?Q?U5YlTX2PXL9o5Sbc5qQV5ZRCINDJpJtw7XITQYkcn647x2CpL6OLghxKycOK?=
 =?us-ascii?Q?21YeVEZXuf8vwUPgxlCKYpGRrhwuXRvSQqv6zmP8qXhodn2KiVjuYKxJZX0a?=
 =?us-ascii?Q?7HDhbcVXlIMoJ+0ljdspPTot1AjF4xtYz0AjGxY4zuMtWhunSNZZH2Fb6f4e?=
 =?us-ascii?Q?DJfWZf7zD/oeJXDTOJ3d+AlpzmGrUv3HWReY/8Zp/Z5XZ7petg+wQpX7oFyc?=
 =?us-ascii?Q?ZDp3kJUnxZcz6pKse9aE3KUSt8IpcnE38X+oIAlzQvEUldo+a+nZEoA+zeGu?=
 =?us-ascii?Q?uP1XAU4L8XSUcbvwxOGLOb8AO9B9Ip22BMRbh0XxF1fJUUNwoBI/3KewXoaa?=
 =?us-ascii?Q?3uAHJAI6C8gam0Pqm+B1QNDSMA3+cXl96+W+rJb3YKxZk6M0W2VZyGz6GNxb?=
 =?us-ascii?Q?kW/YgYddDrTGPEISeL1Oc2pZL0TLPBALqtS27QgMsYxyhvmR4aPFD8eEY9e5?=
 =?us-ascii?Q?OGGk87P2LpP62c3mtleGQTmsLpVYet2ec0CX4/pbD065XsCQMHytdQm3np0+?=
 =?us-ascii?Q?cuOPHsSXtaP7WBJjqRs4k7QhgbesWkJu4wONtEzCD6900uCjvqY63ojfKjyp?=
 =?us-ascii?Q?qThMRl9oRapKgTMNjkT/KRtFAJnUIMwExCCGK0LhdMNDLKszTc3OpyVgQRr7?=
 =?us-ascii?Q?nmFVUyvXJ7A0mkGjDxXIxPbZJ5UmDMGK+JVcQIXFIIkb+fU23dbK/Amtt2dH?=
 =?us-ascii?Q?b/byhSfgVxp67X0n2eGvnECX5i5ovJznQbVe2OxFHovwTtVbdBMSrDYhUGiD?=
 =?us-ascii?Q?CNGoaRdtHg/k9oyBty9uKoPoH7dkz/uydFwtfygpaJ8sCUIYdjOGbRbTIzV9?=
 =?us-ascii?Q?IkEMXiFf98krlUq+2zlsde33vL5kEINI+Vzv8xzqcJrPwBj72RN1JD9vRlcb?=
 =?us-ascii?Q?hHcnocIb9zLqrlHcfDE44Y1/2AF51ueZ9/BM/QXxT84qdc0ARxb1UbQAvTur?=
 =?us-ascii?Q?cRinrldRL81h9Yz+DK+BhbRvkTHE2SCo5vYW2dKoX+6qxGvgV/6gyce26eav?=
 =?us-ascii?Q?32FEWgdd6oh7rDTKXvkzu8TtFqSTOhOwj9HFcY7kGQDgQoED8LM+VhDlSdUu?=
 =?us-ascii?Q?VN4qXTUd91mFrgwoYRXToPr5hYPmXI1EpaDq6WNH20y1m+R+Ou2MGOhvQHPZ?=
 =?us-ascii?Q?k5xij4di4vK1ijm3OQX5CIFEhJJBu8P0oOWjNzJ2CMMT2MTqxCPlf/w3U7/F?=
 =?us-ascii?Q?9yh6YO0gByVSX/WYjDz/EXwmWE/znrRdPPwe5RrynncC++i78YoJ/zAywTHb?=
 =?us-ascii?Q?elIpSyO1V+85bHp7EheNDvnHtahZVJJHRqM71nwy5zK0x6ZT+GtO/R2jIpnO?=
 =?us-ascii?Q?EA2EuwP1hZpSC8HvwbVECBCMrIYRkXtEDP2pv6a8h6WqqLF1rQ42jI/hLvee?=
 =?us-ascii?Q?XeU5rZfB9STS321lAQ1Wvg1t/XEpq3VHA8BYbfnrBgFnYLXQ40UT6tABagoP?=
X-MS-Exchange-AntiSpam-MessageData-1: 5AnuWjt6kdFa2hZ0J8VDiCSlaITJGDt44Yw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cef7abc-ba3c-49ab-2b3e-08def9c38408
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:18:46.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10CPCVSWZGNRiZHbovYtbdVBIRW9wGr+FK8z6HuC4KIbmDY+O2AKs7D8p2Z3nLQQ/NOnXlS9ffXfeeeDmwH9ZMxXl1lCPvbt/1hPeZbyyR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243402

OpenSSL 4.0 removed the ENGINE API entirely. u-boot-tools uses
ENGINE_get_id, ENGINE_load_public_key, ENGINE_finish, ENGINE_free
in lib/rsa/rsa-sign.c which causes link failures.

Backport the Provider API support patch from upstream u-boot which
adds OpenSSL Provider support while maintaining backward compatibility
with older OpenSSL versions that still have ENGINE.

Upstream-Status: Backport [https://github.com/u-boot/u-boot/pull/918]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Add-support-for-OpenSSL-Provider-API.patch | 300 ++++++++++++++++++
 .../u-boot/u-boot-tools_2026.07.bb            |   4 +-
 2 files changed, 303 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Add-support-for-Open=
SSL-Provider-API.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Pro=
vider-API.patch b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSS=
L-Provider-API.patch
new file mode 100644
index 0000000000..2136afe2f4
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
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/pull/918]
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes=
-bsp/u-boot/u-boot-tools_2026.07.bb
index 9e7a178310..17c4b1e128 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot-tools.inc
=20
-SRC_URI +=3D "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support=
.patch"
+SRC_URI +=3D "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support=
.patch \
+            file://0001-Add-support-for-OpenSSL-Provider-API.patch \
+           "

