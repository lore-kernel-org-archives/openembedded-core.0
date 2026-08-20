Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4590DC5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165.1787249429774855731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tZg0VhT1;
 spf=pass (domain: est.tech, ip: 40.107.159.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU9EPa5y5cQhEaW2TnhCN4o9M2p8hcA7kjOPFtXt0+Al9+5taszv5mUS5VjwRRNqiJ6RylqKpbBCY4k+62hTrqu7oMOtRoDkgC2N0xL/TU6I8KnF3ZeHRfEBGOdRSz6Wf8IrsrQF57fp45LoX5lUkAREpR2iMxhy2XJO1pcNRjlLnD1DjQj8eqm2EFcGOMYmJFvZSJQENTXUbWOOFgqyUrytWprYqwH6NnB4KadjihLZU466HcZ/W3DOI+hHR7tURUQaw9J8dZTomPEtM0S5WNwixb1ylEjTPVaNuAn5/u65hDa/0qkJBhF97M5rypIXYwV28U4gPNvTanxYD02kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Qo8/RD7RL5P5q8DsEKwlj9xZDgePlHnVrOKmcJN4/M=;
 b=x78P8/YRKTvh785x/df7l/au23wka3fTdVukeRskwWtSx9UuxoR5iKbclXQ1a1fZRjczxXgiePsmlCW1++NWg+vDcO+4sBO3bx+lE43VhYxJBe0eXKG7TTmp9kMYk0PZjh14e3ceU1oUDJSiltE+57KhjAwgMzPTnmI0AqQnH8cNjh/VsGf9+X0kfMmjrMGbyGyMyE/xV4jz3ranP7Mt1L4GNwCfUirtE4I+TduuEhqGnHsUU6crjwU8BjcyzgCKKvuFmegikCEUGfYoc5JEQaiXCwIsdjwW5RmUvQiT5Gx79ajQiITsF484kOFOYO2N87a14ldLu/Es81WYwfDR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Qo8/RD7RL5P5q8DsEKwlj9xZDgePlHnVrOKmcJN4/M=;
 b=tZg0VhT1/g7J4VrT9/nZ2czBbUJNL97g1ktjHN7B6mVldQ5h5gcc/RhmwOJFSpvTfi6XiqIu1RdufKHGmjG+p+vTk5Mm2rl/Vcvks5QrCt+TEWIuWjCDe5Cy32qQIXOisCNYetb/PGUJ1LndSe0u2KQ1CSXqFKG+STke+o6j3OUyPvmx0gIQSR22Z3Gi1U78ytkWgGw3wli1rBxRHFOisSHdiXyMcz5pQ95THAtBHIzCP161J/43Behs40esIJ4q8QPr+XDEub1Lvt/dGxUdIwTuT2SPeUnEXzxw+Z5ndiZ6fI9F3siVctydMKTP1Sd8c0erCgj++nG8lhKuL0/BDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:27 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 1/6] openssl: upgrade 3.5.7 -> 4.0.1
Date: Thu, 20 Aug 2026 20:10:17 +0200
Message-ID: <20260820181022.44434-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0168.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::23) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: 350586c8-51ab-4f7f-6345-08defee64ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|12006099003|25016099003|3023799007|29003799003|11063799006|22082099003|18002099003|17002099007|4143699003;
X-Microsoft-Antispam-Message-Info: 
	+mVZsSyujye0cLdN+G5GRewUcmFYsdWaJ6b6pCKSxDS71UE/6zgiuhYFG4ucHrvpFC34ZfYJaZRstbSOyXc5uWF4iTljzFQABrB/16uj3eBe1DtPmLLNRfGoetT2BdkgG0vt6jUsIqjDjwwx8PZV6fHoyzwHxmoleqhAKXln/+KnYZ2v2ZLleyE5umO/GnbkXlUTEnUgJlPf7F6erKRJ105u1oEpGOeNAFCaDPTUh8H3xohsWO5pN924LJWd+/QkC2KN5uR7mWuZiEyfOgSGOmvKX/RU3jpjb3/f2zVr2ag/Rbq9d9NxheR/My+ik5eA8wXQ0gxN6NEbVI+1HHtN3gRDhiFq+wNutaOH9DwYTOIXY12rrib0S2RpLy5VDsGHrdG9GMnywJV5jbluvWKBmlMQk/v2FCA3Tb3O+JFOlx2NnvcBJeRKDnGKRrKOPoTnIsG46RnX3bhI03SAMwNUi40gjIfQZI4o6bxeNY9uLySRjmIA7bJdBGhi6sx5k04sBXYYxWQ05mEvQjJl/yVrcj//bZPjMAk3ipB9RHhPCBkEZkd/Zh0KyZFu46RQPGNz57ZNg/yUo45rODDnLo6dKd/7swKW2UJrCSIT/vwGlfSRezMxmxh+ZSqkCNFp9HYN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(12006099003)(25016099003)(3023799007)(29003799003)(11063799006)(22082099003)(18002099003)(17002099007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QMFCFO4j9870qVD6lKosvi8v9sr3jjSRyAnlmz4EHxT88jQUazbKrdIzEqLr?=
 =?us-ascii?Q?ClbSNsCDEQwTNZKrl8ajsM+G+bMKOXZy0hudBdTF+w53wRa+ICyKiViwtdNg?=
 =?us-ascii?Q?7LY7PCImsso1Sru9FQXJJ0UTTD6+9wr27pmm/RrXySLOdRmgqi6RJuWv8BmK?=
 =?us-ascii?Q?x2htRfNW8gpvrQ9tkS6i7LY/yOb+0KqScsI6vP5KBubIAsGLoHJtGoN3pjiz?=
 =?us-ascii?Q?NpPd32ow3O6/fnes0P8hESKkpCzijoVNs4Dey7e5QVIJfmqnz6TTz6syxsVr?=
 =?us-ascii?Q?4QNhkjBxJv13APBwd701LVgLU4NJFCgz6GC95Zj7MLGxY7jdZI8bIR+orMBr?=
 =?us-ascii?Q?wEY3DarxZMLvzQZlyxIeqxyZfoVr+JhD7JBHWhU88CFBc7rjZp9idf/QU8Ri?=
 =?us-ascii?Q?cogiGXPsHv/jMU9oWPSBbzfhkUUnWjTJNKZosaqF+hMC86Yckaxg6aoF6N7W?=
 =?us-ascii?Q?qWuYt2jJ+BchhnNsU/3F5P5djZ0kseSEy6DUYARuRXhol2D7QocZqL2T2wR9?=
 =?us-ascii?Q?0VQdWC33ks3IEXuuDV1dN0x8CQRJoc2YRV2u6JwZ+eNwoGgpdy9ILFwcA/Xf?=
 =?us-ascii?Q?582gGq9f9BVWpotYZxm465HqNNlSRyckgqMlGzaFlEDCpaply0UMesQvmNpx?=
 =?us-ascii?Q?grKKU433MUg3ekBjW8ZKm9L2bwBygY6mvFsM+baM4cyHb7y4eCrE6AloHz/p?=
 =?us-ascii?Q?bGO7/YKh1QJeZD5A5nJwRrjRDxpaCkxP1MbbKE+2ujlCKxgf9sVBvric2oqa?=
 =?us-ascii?Q?TaAnbhld+tEnNv8Pkp7OjjilSiJKS7z70424QSAAMe5VH19A6YiXhHBvr2+N?=
 =?us-ascii?Q?q9cRX8mhodNqXxIQ0wOs95Bvjng2S48k8iacoQEhxbJq47qafGWSFUFVKVzb?=
 =?us-ascii?Q?YpSoSJB5OJ+rrxGVsTrpFX2/PN+1mBNNy+fMnVeN1/HCixhlCZNLUkUB7j+v?=
 =?us-ascii?Q?1wlluqljS2oHVZ3oU0HmQBCcWms+NyS7cfiicwjaPNQ5SmUMze84IHrt9okR?=
 =?us-ascii?Q?yc6Nq5IHQiyNsNM+7Mqjx/PzzzvCbSJzXdqp17mH+Tjp5bcIq2XCbe+zbN4I?=
 =?us-ascii?Q?HO3LCSI5ZbY4oEHH+3XzHApX554mNcbU5fYDiwn4IDLSQvQB4+P7a0KTEU0/?=
 =?us-ascii?Q?OFxMHsw9RrUHgATxexhokNjgDAGkHkz9/oAmvWpNnXN/CbOWZEU5WysIYOT7?=
 =?us-ascii?Q?osGDhkpdpu+ol+qNkiavmBHTvU9vhMiLam6hY7bH/5qiEd2SSmyuIZexop4k?=
 =?us-ascii?Q?olEqlMG7JHjzTtWW851SXusrAzwMTMSLX7aCM5x3lBXabrQ5SSHWPfmlrSE9?=
 =?us-ascii?Q?YsDFQ/cqf7fYUujxuBdLH00/yFXrlHgn5xgELl8l3Lu3RbSfsPXPc9eacvGO?=
 =?us-ascii?Q?qIrNeSVRIn8jlIVGkErPlR+JygRCIym2OsrXXQ0UH3A+uNHH6LTgEdJyh3Ks?=
 =?us-ascii?Q?BTX2bBcMgshccZJ4rI8Ks6TeB3BU5Ed0KekNmh8IXThwc4OOKsvZElTqJq6t?=
 =?us-ascii?Q?EdE2sj5mLx+L9qFKIk7Y2ogiql9cv0oOOVHkpy8LmyuimuMsUzucHV+i6boc?=
 =?us-ascii?Q?6U94ujRjLA622gLRlQEy6ITzO6+hYCYFWONwA1NKw1BdxshKZI6QGjM/hdeb?=
 =?us-ascii?Q?GGphhC0M+TwdlmRomKiYT2B0b5ncfF14S5tTbDoej+tjolNZl+wJ57uuyCAO?=
 =?us-ascii?Q?8G7LZJJ0lVoK3ZojhwsKiRZ/g7LOa1+GNoocnwg+9W7ZMsWIibSbqNYS2iTb?=
 =?us-ascii?Q?UTWbIo/ajpv809xzBImDvgLMW/s1LCMiTorzHU1ZtsnNltwsQP4ZQzD/kt2U?=
X-MS-Exchange-AntiSpam-MessageData-1: i8Q8asDrX/YqZDt6Y6YhTR66DBDxsEhgdts=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 350586c8-51ab-4f7f-6345-08defee64ff3
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:27.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3a0Kzr0sl0YJjYc+kR2ZkiCZIdW37mMoPGeBmb3IR7v7LaJ3Mr00fCQicAp43+4cxK30UamIs4wV4GFz9UTxL0eZL0u2nYHJNUjZahkmONA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243875

Upgrade OpenSSL from 3.5.7 to 4.0.1. This is a major version upgrade.

Changelog: https://github.com/openssl/openssl/blob/openssl-4.0.1/CHANGES.md

New CVE fixes not already in 3.5.7:
  * CVE-2026-28386: Fixed OOB read in AES-CFB-128 on x86-64 with AVX-512
  * CVE-2026-35188: Fixed double-free when checking OCSP stapled response
  * CVE-2026-42765: Fixed NULL deref in cert verification with OCSP
  * CVE-2026-42771: Fixed OOB read in X509_VERIFY_PARAM_set1_email()

Major breaking changes in 4.0.0:
  * Removed support for engines. The ENGINE API is fully removed.
  * Removed support for SSLv3. SSLv3 has been deprecated since 2015.
  * Removed support for the SSLv2 Client Hello.
  * Removed per-version TLS method functions (SSLv3_method(),
    TLSv1_method(), TLSv1_1_method(), TLSv1_2_method()).
  * Removed c_rehash script tool. Use 'openssl rehash' instead.
  * ASN1_STRING has been made opaque.
  * Numerous API function signatures changed to include const qualifiers.
  * libcrypto no longer cleans up globally allocated data via atexit().
  * Added AKID verification checks when X509_V_FLAG_X509_STRICT is set.
  * Support of deprecated elliptic curves in TLS disabled at compile-time
    by default.

Recipe changes:
  * Drop 0001-Added-handshake-history-reporting-when-test-fails.patch
    (merged upstream via PR #22481).
  * Refresh remaining patches against the new version.
  * Remove ENGINE API artifacts: engines package, dasync.so/ossltest.so
    ptest installation, ENGINESDIR references, OPENSSL_ENGINES wrapper
    variable, and cryptodev-linux PACKAGECONFIG.

Tested: ptest on qemux86-64:
  Files=3D362, Tests=3D4310, Result: PASS
  Passed: 338, Skipped: 24 (fips, lms, rc5, tfo, compression,
  sslversions, sslkeylogfile, external tests - all expected)
  Failed: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ke-history-reporting-when-test-fails.patch | 366 ------------------
 ...1-Configure-do-not-tweak-mips-cflags.patch |   6 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |  11 +-
 .../0001-extend-check_cwm-test-timeout.patch  |   4 +-
 .../{openssl_3.5.7.bb =3D> openssl_4.0.1.bb}    |  23 +-
 5 files changed, 16 insertions(+), 394 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-ha=
ndshake-history-reporting-when-test-fails.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb =3D> openssl_4.=
0.1.bb} (88%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake=
-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openss=
l/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
deleted file mode 100644
index a74c79303f..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-histor=
y-reporting-when-test-fails.patch
+++ /dev/null
@@ -1,366 +0,0 @@
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
-From: William Lyu <William.Lyu@windriver.com>
-Date: Fri, 20 Oct 2023 16:22:37 -0400
-Subject: [PATCH] Added handshake history reporting when test fails
-
-Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
-
-Signed-off-by: William Lyu <William.Lyu@windriver.com>
----
- test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------
- test/helpers/handshake.h |  70 +++++++++++++++++++-
- test/ssl_test.c          |  44 +++++++++++++
- 3 files changed, 217 insertions(+), 33 deletions(-)
-
-diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index f611b3a..5703b48 100644
---- a/test/helpers/handshake.c
-+++ b/test/helpers/handshake.c
-@@ -25,6 +25,102 @@
- #include <netinet/sctp.h>
- #endif
-=20
-+/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
-+/* Maps string names to various enumeration type */
-+typedef struct {
-+    const char *name;
-+    int value;
-+} enum_name_map;
-+
-+static const enum_name_map connect_phase_names[] =3D {
-+    {"Handshake", HANDSHAKE},
-+    {"RenegAppData", RENEG_APPLICATION_DATA},
-+    {"RenegSetup", RENEG_SETUP},
-+    {"RenegHandshake", RENEG_HANDSHAKE},
-+    {"AppData", APPLICATION_DATA},
-+    {"Shutdown", SHUTDOWN},
-+    {"ConnectionDone", CONNECTION_DONE}
-+};
-+
-+static const enum_name_map peer_status_names[] =3D {
-+    {"PeerSuccess", PEER_SUCCESS},
-+    {"PeerRetry", PEER_RETRY},
-+    {"PeerError", PEER_ERROR},
-+    {"PeerWaiting", PEER_WAITING},
-+    {"PeerTestFail", PEER_TEST_FAILURE}
-+};
-+
-+static const enum_name_map handshake_status_names[] =3D {
-+    {"HandshakeSuccess", HANDSHAKE_SUCCESS},
-+    {"ClientError", CLIENT_ERROR},
-+    {"ServerError", SERVER_ERROR},
-+    {"InternalError", INTERNAL_ERROR},
-+    {"HandshakeRetry", HANDSHAKE_RETRY}
-+};
-+
-+/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
-+static const char *enum_name(const enum_name_map *enums, size_t num_enums=
,
-+                             int value)
-+{
-+    size_t i;
-+    for (i =3D 0; i < num_enums; i++) {
-+        if (enums[i].value =3D=3D value) {
-+            return enums[i].name;
-+        }
-+    }
-+    return "InvalidValue";
-+}
-+
-+const char *handshake_connect_phase_name(connect_phase_t phase)
-+{
-+    return enum_name(connect_phase_names, OSSL_NELEM(connect_phase_names)=
,
-+                     (int)phase);
-+}
-+
-+const char *handshake_status_name(handshake_status_t handshake_status)
-+{
-+    return enum_name(handshake_status_names, OSSL_NELEM(handshake_status_=
names),
-+                     (int)handshake_status);
-+}
-+
-+const char *handshake_peer_status_name(peer_status_t peer_status)
-+{
-+    return enum_name(peer_status_names, OSSL_NELEM(peer_status_names),
-+                     (int)peer_status);
-+}
-+
-+static void save_loop_history(HANDSHAKE_HISTORY *history,
-+                              connect_phase_t phase,
-+                              handshake_status_t handshake_status,
-+                              peer_status_t server_status,
-+                              peer_status_t client_status,
-+                              int client_turn_count,
-+                              int is_client_turn)
-+{
-+    HANDSHAKE_HISTORY_ENTRY *new_entry =3D NULL;
-+
-+    /*
-+     * Create a new history entry for a handshake loop with statuses give=
n in
-+     * the arguments. Potentially evicting the oldest entry when the
-+     * ring buffer is full.
-+     */
-+    ++(history->last_idx);
-+    history->last_idx &=3D MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
-+
-+    new_entry =3D &((history->entries)[history->last_idx]);
-+    new_entry->phase =3D phase;
-+    new_entry->handshake_status =3D handshake_status;
-+    new_entry->server_status =3D server_status;
-+    new_entry->client_status =3D client_status;
-+    new_entry->client_turn_count =3D client_turn_count;
-+    new_entry->is_client_turn =3D is_client_turn;
-+
-+    /* Evict the oldest handshake loop entry when the ring buffer is full=
. */
-+    if (history->entry_count < MAX_HANDSHAKE_HISTORY_ENTRY) {
-+        ++(history->entry_count);
-+    }
-+}
-+
- HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
- {
-     HANDSHAKE_RESULT *ret;
-@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL =
*client,
-         SSL_set_post_handshake_auth(client, 1);
- }
-=20
--/* The status for each connection phase. */
--typedef enum {
--    PEER_SUCCESS,
--    PEER_RETRY,
--    PEER_ERROR,
--    PEER_WAITING,
--    PEER_TEST_FAILURE
--} peer_status_t;
--
- /* An SSL object and associated read-write buffers. */
- typedef struct peer_st {
-     SSL *ssl;
-@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
-     }
- }
-=20
--typedef enum {
--    HANDSHAKE,
--    RENEG_APPLICATION_DATA,
--    RENEG_SETUP,
--    RENEG_HANDSHAKE,
--    APPLICATION_DATA,
--    SHUTDOWN,
--    CONNECTION_DONE
--} connect_phase_t;
--
- static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
- {
-     switch (test_ctx->handshake_mode) {
-@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *tes=
t_ctx, PEER *peer,
-     }
- }
-=20
--typedef enum {
--    /* Both parties succeeded. */
--    HANDSHAKE_SUCCESS,
--    /* Client errored. */
--    CLIENT_ERROR,
--    /* Server errored. */
--    SERVER_ERROR,
--    /* Peers are in inconsistent state. */
--    INTERNAL_ERROR,
--    /* One or both peers not done. */
--    HANDSHAKE_RETRY
--} handshake_status_t;
--
- /*
-  * Determine the handshake outcome.
-  * last_status: the status of the peer to have acted last.
-@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
-=20
-     start =3D time(NULL);
-=20
-+    save_loop_history(&(ret->history),
-+                      phase, status, server.status, client.status,
-+                      client_turn_count, client_turn);
-+
-     /*
-      * Half-duplex handshake loop.
-      * Client and server speak to each other synchronously in the same pr=
ocess.
-@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
-                 0 /* server went last */);
-         }
-=20
-+        save_loop_history(&(ret->history),
-+                          phase, status, server.status, client.status,
-+                          client_turn_count, client_turn);
-+
-         switch (status) {
-         case HANDSHAKE_SUCCESS:
-             client_turn_count =3D 0;
-diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
-index 78b03f9..b9967c2 100644
---- a/test/helpers/handshake.h
-+++ b/test/helpers/handshake.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright 2016-2021 The OpenSSL Project Authors. All Rights Reserved.
-+ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.
-  *
-  * Licensed under the Apache License 2.0 (the "License").  You may not us=
e
-  * this file except in compliance with the License.  You can obtain a cop=
y
-@@ -12,6 +12,11 @@
-=20
- #include "ssl_test_ctx.h"
-=20
-+#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4
-+#define MAX_HANDSHAKE_HISTORY_ENTRY (1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT=
)
-+#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \
-+    ((1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT) - 1)
-+
- typedef struct ctx_data_st {
-     unsigned char *npn_protocols;
-     size_t npn_protocols_len;
-@@ -22,6 +27,63 @@ typedef struct ctx_data_st {
-     char *session_ticket_app_data;
- } CTX_DATA;
-=20
-+typedef enum {
-+    HANDSHAKE,
-+    RENEG_APPLICATION_DATA,
-+    RENEG_SETUP,
-+    RENEG_HANDSHAKE,
-+    APPLICATION_DATA,
-+    SHUTDOWN,
-+    CONNECTION_DONE
-+} connect_phase_t;
-+
-+/* The status for each connection phase. */
-+typedef enum {
-+    PEER_SUCCESS,
-+    PEER_RETRY,
-+    PEER_ERROR,
-+    PEER_WAITING,
-+    PEER_TEST_FAILURE
-+} peer_status_t;
-+
-+typedef enum {
-+    /* Both parties succeeded. */
-+    HANDSHAKE_SUCCESS,
-+    /* Client errored. */
-+    CLIENT_ERROR,
-+    /* Server errored. */
-+    SERVER_ERROR,
-+    /* Peers are in inconsistent state. */
-+    INTERNAL_ERROR,
-+    /* One or both peers not done. */
-+    HANDSHAKE_RETRY
-+} handshake_status_t;
-+
-+/* Stores the various status information in a handshake loop. */
-+typedef struct handshake_history_entry_st {
-+    connect_phase_t phase;
-+    handshake_status_t handshake_status;
-+    peer_status_t server_status;
-+    peer_status_t client_status;
-+    int client_turn_count;
-+    int is_client_turn;
-+} HANDSHAKE_HISTORY_ENTRY;
-+
-+typedef struct handshake_history_st {
-+    /* Implemented using ring buffer. */
-+    /*
-+     * The valid entries are |entries[last_idx]|, |entries[last_idx-1]|,
-+     * ..., etc., going up to |entry_count| number of entries. Note that =
when
-+     * the index into the array |entries| becomes < 0, we wrap around to
-+     * the end of |entries|.
-+     */
-+    HANDSHAKE_HISTORY_ENTRY entries[MAX_HANDSHAKE_HISTORY_ENTRY];
-+    /* The number of valid entries in |entries| array. */
-+    size_t entry_count;
-+    /* The index of the last valid entry in the |entries| array. */
-+    size_t last_idx;
-+} HANDSHAKE_HISTORY;
-+
- typedef struct handshake_result {
-     ssl_test_result_t result;
-     /* These alerts are in the 2-byte format returned by the info_callbac=
k. */
-@@ -77,6 +139,8 @@ typedef struct handshake_result {
-     char *cipher;
-     /* session ticket application data */
-     char *result_session_ticket_app_data;
-+    /* handshake loop history */
-+    HANDSHAKE_HISTORY history;
- } HANDSHAKE_RESULT;
-=20
- HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
-@@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx=
, SSL_CTX *server2_ctx,
-     CTX_DATA *server2_ctx_data,
-     CTX_DATA *client_ctx_data);
-=20
-+const char *handshake_connect_phase_name(connect_phase_t phase);
-+const char *handshake_status_name(handshake_status_t handshake_status);
-+const char *handshake_peer_status_name(peer_status_t peer_status);
-+
- #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
-diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea60851..9d6b093 100644
---- a/test/ssl_test.c
-+++ b/test/ssl_test.c
-@@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx =3D NULL;
- /* Currently the section names are of the form test-<number>, e.g. test-1=
5. */
- #define MAX_TESTCASE_NAME_LENGTH 100
-=20
-+static void print_handshake_history(const HANDSHAKE_HISTORY *history)
-+{
-+    size_t first_idx;
-+    size_t i;
-+    size_t cur_idx;
-+    const HANDSHAKE_HISTORY_ENTRY *cur_entry;
-+    const char header_template[] =3D "|%14s|%16s|%16s|%16s|%17s|%14s|";
-+    const char body_template[]   =3D "|%14s|%16s|%16s|%16s|%17d|%14s|";
-+
-+    TEST_info("The following is the server/client state "
-+              "in the most recent %d handshake loops.",
-+              MAX_HANDSHAKE_HISTORY_ENTRY);
-+
-+    TEST_note("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D"
-+              "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D");
-+    TEST_note(header_template,
-+              "phase", "handshake status", "server status",
-+              "client status", "client turn count", "is client turn");
-+    TEST_note("+--------------+----------------+----------------"
-+              "+----------------+-----------------+--------------+");
-+
-+    first_idx =3D (history->last_idx - history->entry_count + 1) &
-+                MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
-+    for (i =3D 0; i < history->entry_count; ++i) {
-+        cur_idx =3D (first_idx + i) & MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MAS=
K;
-+        cur_entry =3D &(history->entries)[cur_idx];
-+        TEST_note(body_template,
-+                  handshake_connect_phase_name(cur_entry->phase),
-+                  handshake_status_name(cur_entry->handshake_status),
-+                  handshake_peer_status_name(cur_entry->server_status),
-+                  handshake_peer_status_name(cur_entry->client_status),
-+                  cur_entry->client_turn_count,
-+                  cur_entry->is_client_turn ? "true" : "false");
-+    }
-+    TEST_note("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D"
-+              "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D");
-+}
-+
- static const char *print_alert(int alert)
- {
-     return alert ? SSL_alert_desc_string_long(alert) : "no alert";
-@@ -388,6 +426,12 @@ static int check_test(HANDSHAKE_RESULT *result, SSL_T=
EST_CTX *test_ctx)
-         ret &=3D check_client_sign_type(result, test_ctx);
-         ret &=3D check_client_ca_names(result, test_ctx);
-     }
-+
-+    /* Print handshake loop history if any check fails. */
-+    if (!ret) {
-+        print_handshake_history(&(result->history));
-+    }
-+
-     return ret;
- }
-
---
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-no=
t-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-=
Configure-do-not-tweak-mips-cflags.patch
index cd8906df67..77bfe4e4e5 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch
@@ -1,4 +1,4 @@
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
+From b5cee0cb0f14a78056ef7722a34b361491f1fdda Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
=20
 diff --git a/Configure b/Configure
-index fff97bd..5ee54c1 100755
+index c05a30b..db8adee 100755
 --- a/Configure
 +++ b/Configure
-@@ -1557,16 +1557,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --target-=
help 2>&1` =3D~ m/-mno-cygwin/m)
+@@ -1575,16 +1575,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --target-=
help 2>&1` =3D~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
 =20
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip=
-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/ope=
nssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patc=
h
index bfbfedbd67..1d9e7539f6 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
+From 6df53bfebcf8ca65910a18220a6576fb110918a5 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compil=
er
@@ -28,17 +28,16 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Update to fix buildpaths qa issue for '-ffile-prefix-map'.
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 16 insertions(+), 2 deletions(-)
=20
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makef=
ile.tmpl
-index 09303c4..011bda1 100644
+index eff66e5..bc48f51 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -514,13 +514,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || ()=
,
+@@ -503,13 +503,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || ()=
,
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
 =20
@@ -68,10 +67,10 @@ index 09303c4..011bda1 100644
 =20
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
 diff --git a/crypto/build.info b/crypto/build.info
-index aee5c46..95c9577 100644
+index 8e4a885..95b0902 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
+@@ -114,7 +114,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
 =20
  DEPEND[info.o]=3Dbuildinf.h
  DEPEND[cversion.o]=3Dbuildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cw=
m-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-exten=
d-check_cwm-test-timeout.patch
index f6eb28069a..76bc05d5f9 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch
@@ -1,4 +1,4 @@
-From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
+From 14856dbd767621ce6f162680c00557b54af0effb Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 23 Oct 2025 11:24:36 +0200
 Subject: [PATCH] extend check_cwm test timeout
@@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
  1 file changed, 5 insertions(+)
=20
 diff --git a/test/radix/main.c b/test/radix/main.c
-index 4a1e886a71..39f8c61ef9 100644
+index 0f3dc11..d925639 100644
 --- a/test/radix/main.c
 +++ b/test/radix/main.c
 @@ -25,6 +25,11 @@ static int test_script(int idx)
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/reci=
pes-connectivity/openssl/openssl_4.0.1.bb
similarity index 88%
rename from meta/recipes-connectivity/openssl/openssl_3.5.7.bb
rename to meta/recipes-connectivity/openssl/openssl_4.0.1.bb
index b95c734f1d..45498ca5ec 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.=
tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-c=
o.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://0001-Added-handshake-history-reporting-when-test-fails.p=
atch \
            file://0001-extend-check_cwm-test-timeout.patch \
            "
=20
@@ -19,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a=
24aa31aeac98e8"
+SRC_URI[sha256sum] =3D "2db3f3a0d6ea4b59e1f094ace2c8cd536dffb87cdc39084c5a=
fa1e6f7f37dd09"
=20
 inherit lib_package multilib_header multilib_script ptest perlnative manpa=
ges
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
@@ -33,7 +32,6 @@ PACKAGECONFIG ?=3D ""
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
=20
-PACKAGECONFIG[cryptodev-linux] =3D "enable-devcryptoeng,disable-devcryptoe=
ng,cryptodev-linux,,cryptodev-module"
 PACKAGECONFIG[legacy] =3D ",no-legacy"
 PACKAGECONFIG[tls1] =3D ",no-tls1"
 PACKAGECONFIG[tls1_1] =3D ",no-tls1_1"
@@ -57,8 +55,8 @@ EXTRA_OECONF:append:class-native =3D " --with-rand-seed=
=3Dos,devrandom"
 EXTRA_OECONF:append:class-nativesdk =3D " --with-rand-seed=3Dos,devrandom"
=20
 # Relying on hardcoded built-in paths causes openssl-native to not be relo=
cateable from sstate.
-EXTRA_OEMAKE:append:task-compile:class-native =3D ' OPENSSLDIR=3D"/not/bui=
ltin" ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
-EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D ' OPENSSLDIR=3D"/not/=
builtin" ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
+EXTRA_OEMAKE:append:task-compile:class-native =3D ' OPENSSLDIR=3D"/not/bui=
ltin" MODULESDIR=3D"/not/builtin"'
+EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D ' OPENSSLDIR=3D"/not/=
builtin" MODULESDIR=3D"/not/builtin"'
=20
 #| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lo=
ck_free'
 EXTRA_OECONF:append:toolchain-clang:x86 =3D " -latomic"
@@ -204,12 +202,10 @@ do_install:append:class-native () {
 	    OPENSSL_CONF=3D\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
 	    SSL_CERT_DIR=3D\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
 	    SSL_CERT_FILE=3D\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
-	    OPENSSL_ENGINES=3D\${OPENSSL_ENGINES:-${libdir}/engines-3} \
 	    OPENSSL_MODULES=3D\${OPENSSL_MODULES:-${libdir}/ossl-modules}
=20
-	# Setting ENGINESDIR and MODULESDIR to invalid paths prevents host contam=
ination,
+	# Setting MODULESDIR to invalid paths prevents host contamination,
 	# but also breaks the generated libcrypto.pc file. Post-Fix it manually h=
ere.
-	sed -i 's|^enginesdir=3D\($.libdir.\)/.*|enginesdir=3D\1/engines-3|' ${D}=
${libdir}/pkgconfig/libcrypto.pc
 	sed -i 's|^modulesdir=3D\($.libdir.\)/.*|modulesdir=3D\1/ossl-modules|' $=
{D}${libdir}/pkgconfig/libcrypto.pc
 }
=20
@@ -252,10 +248,6 @@ do_install_ptest() {
=20
 	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm ${D}${PTE=
ST_PATH}/util/wrap.pl
=20
-	install -d ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines/
-	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines/
-	ln -s ${libdir}/engines-3/loader_attic.so ${D}${PTEST_PATH}/engines/
 	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }
=20
@@ -270,16 +262,13 @@ pkg_postinst_ontarget:${PN}-ossl-module-fips () {
 # file to be installed for both the openssl-bin package and the libcrypto
 # package since the openssl-bin package depends on the libcrypto package.
=20
-PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN=
}-ossl-module-legacy ${PN}-ossl-module-fips"
+PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-misc ${PN}-ossl-module-=
legacy ${PN}-ossl-module-fips"
=20
 FILES:libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl =3D "${libdir}/libssl${SOLIBS}"
 FILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf* \
                       ${libdir}/ssl-3/openssl.cnf* \
                       "
-FILES:${PN}-engines =3D "${libdir}/engines-3"
-# ${prefix} comes from what we pass into --prefix at configure time (which=
 is used for INSTALLTOP)
-FILES:${PN}-engines:append:mingw32:class-nativesdk =3D " ${prefix}${libdir=
}/engines-3"
 FILES:${PN}-misc =3D "${libdir}/ssl-3/misc ${bindir}/c_rehash"
 FILES:${PN}-ossl-module-legacy =3D "${libdir}/ossl-modules/legacy.so"
 FILES:${PN}-ossl-module-fips =3D "${libdir}/ossl-modules/fips.so"
@@ -290,7 +279,7 @@ CONFFILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.c=
nf"
=20
 RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc =3D "perl"
-RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed openssl-=
engines"
+RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
 RRECOMMENDS:${PN}-ptest +=3D "${PN}-ossl-module-legacy"
=20
 RDEPENDS:${PN}-bin +=3D "openssl-conf"

