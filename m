Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B921C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:10:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16054.1785849017098071005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XTQwW3Sl;
 spf=pass (domain: est.tech, ip: 52.101.65.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiPCF9X9FUcUISV8o0IhGk0nrFMPamufONgoXprFeJQ6M1JaRl+1KIuFhBA0Gl3x6NAzp9AjoIdbTz6z+cWvBPQD80fL2ksKqGxl/9vdJOWfsIUWjO1G5IE2POLjkfiM5EpRnQ06CnmdZm9NFlJOAGiCz4NNwr0gch39/cXD4ivh7TdOO491pKbthXJpNqln5zGFU1l0c7bZQsPDEZGYzqihEGSZYCJbng8rC5wW5BOra7M9DtBV1XAVKIyA/lBPz7dq+iHvAlkwV5hsSjaXTXwuqYpaMryPeq4Mmb4fjlOts1XrVXGSM3ikXDt5KQ88ubbXWZpNg2TYm4Lvm0OHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vOyCjU3zEzGASnkq+Z3MrW8PhfSlNtYThcK9H0zqPA=;
 b=O19R4+9N9hinkTYzWXpaM3jihawhchDFgk16yjAFyf7Org/BhiIPMf84xrgqN4HCR+iibCj7IpnHyapoZG3xEDKomydDiqa9Zl3Hd8U5M82aW/qoLt8Nd7xmm7N1jQx5qASVtoB2ZTW4mYOgc0A3AJGidev1nNkHB1yq1Vrp6cp2ZQ+bASYeZBDr/4hAiSkXxZoSYnOnP7m6U/OJcMqAyIyEXguIIj5zmnVlYld1VtfXLqW2skurwsAlTa9ywBQr0gHW5dnuQJ1K2oql6Co54byRhimQ+1wiAyMNsEnyDYhVKUdtM8uwOO46W6qWfO3ewNwhCvdj969p+EtbLrDYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vOyCjU3zEzGASnkq+Z3MrW8PhfSlNtYThcK9H0zqPA=;
 b=XTQwW3SlWa2nY/bvsxQ5uMMdzfvwkrPV1vnl8BKmdvkMEmLkkceTIaHzFQW+swtFmizKtKqIbBMmBBbwHk5FYr1AtRTTPl+1PhWeKX9bFzq4pb3GOzskf1ALqqHpeD7rVA8AVL548/ngrSzthc1yjYEeR0bQjFEdR1ZS00l5h6PkVsX+P8tBZTxaQg3McORaG4wU6Gb0Ci8zftPAWbVkqlp4TLHaG9Hehe0641GQKUDpdW8eaXbWqx0nmVPimH7UtB2R9MQD7HB2Yg8oMZFgoul+8VBLLN/77mxZIu9x26p7w7Uc2ancg3S1Hcz0HLdSw9ccwZ3q2U8wFRTD3tiQyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFB2DB17625.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:10:14 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:10:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 3/4] libssh2: fix CVE-2026-66034
Date: Tue,  4 Aug 2026 15:09:45 +0200
Message-ID: <20260804130946.3539-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804130946.3539-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
 <20260804130946.3539-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFB2DB17625:EE_
X-MS-Office365-Filtering-Correlation-Id: 461aebde-a723-4643-833f-08def229b7e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|12006099003|22082099003|18002099003|4143699003|11063799006|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	/vmRxPMBpXYEawLgCdeNT3JSuss+ai7dn9JwmyJTkKHC4QiKqMwbjVlp4wETlhDriaPYqxNUm69kSrKewHqi7aL3d6iF2rqwvfEVxLSeEEmItz5m2B8YuEgEhzirRqlE/0qI+/grghl+sBBmXQdN3uem6zmC37Ye1rV21LevXBbR77YDInqlnj1iyXR32DVUlDGoKIbZWREMOVryKm1nd38rlBjSInm/qX9WSQ61Iry6rKt11pZTp4ozMa4ul+VXvGkJ7wU9NszZfeEjSclj/p+6Ji6qjvkr41WAwriBPtbwKk7Rxsz/XLn4zoRf7FubdyK9MJarEl5eQ3K5wO8oxvLt+tCqRBUba7mdT8p/Nv1kqaKVNy7sW7wVbxtbW4pVpsb15z4jDrHoGee7D/egmxa4FGspdQehSIWB3M4gcsjKI9H/JzZ0Dh/XRB696wx/2bHiBIkM4HWc0w2sjEaBirJ4u3n0gBABKIcOxeTpg92Deeei/Ffo4N0OP/6BO6s3YYPnjr3Parp7TLrtjV/hokETE951x+LMIK/bDau7i1rxkOcLWPEBFRd2X7y883oTjYO842Yjx7W3lXWFJ1Z5oiRoC5O+TcztsvDoP97bdDqwBiGOTWG58SCLFMKNn8q5eP2n2a4Uucum7OhNZAPVnZihh740d3zMZPAPlETaxZg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(12006099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NfnTU3+Ws519ulYq2C9B+iSBrEnRPSn6xd+AanEJ1tfb9hccVeLL8AfLWb3s?=
 =?us-ascii?Q?7kHoJ2Q4WuuN3r4ASyCo67Ja7g0K640HeeoI7uhTbiicy5rKsY+rvszfjS8o?=
 =?us-ascii?Q?c2OVYcAHNQ4z3Kuac2RXD0zxoGGNeCDrqdLq+KAYJ5BGXvvzarLIAJaKh7Fp?=
 =?us-ascii?Q?ZPrySqFsYmX53w/ykVUx0b3oFn9ZcmKcAH/rfQpA9hOr/oTqD5szTEril6mx?=
 =?us-ascii?Q?zgVlgzbmgBUrZNusfLd1AWVhRBEioKdKrQyUoctDeV3DGsxFJfELNBnbKZBx?=
 =?us-ascii?Q?X2L5eoXbZ7ouPsqHhfdDCLI9OpqA3WnaTzRH94zRbgMXP+Q0OMNT4rbxNLVy?=
 =?us-ascii?Q?g7a0e95kIokwZV17a8Q5y4QSEGoStz281N7dn4Ka8DoQ/tye48Jh8cSw6U8x?=
 =?us-ascii?Q?0yM6EOZU0tN1z4deJ4dITkheXem5j4ie5x0u/AVI6c3yzGrh/rNq/ghzVNjv?=
 =?us-ascii?Q?kbT7UspZPuX4s2Jxw0XuMEbuS4WH9FyxwGaJBlKDluoRQEzTFAsD/WKqiTs7?=
 =?us-ascii?Q?v+qziz8EM9X/gXaZn+sRXxjvZFYMuPBM1ZvVb+FR76IZ/9QLJlGiw6c05rxS?=
 =?us-ascii?Q?0YOb9p/U+wofKwVLQ2x0lk+UUOb2W4seNNCSk7qIiSq+gVi6kkopYLxYGNfK?=
 =?us-ascii?Q?xK1X8Tw9sr/A+eaIBEgtGc/1qXX6EL0HtmJdPM2NrknBEnYe10U42BvF5ZEv?=
 =?us-ascii?Q?lt+jYuVpwcy33/nnPODW/C7pDiARnvKJffX2sZEOjr3IPIUZdru1gM4EY4Ra?=
 =?us-ascii?Q?cGC7uo8tY/YFsmXk9as6GxW6JXceRpbhbXCUkrEtRb2PYzGIkA6QFh/vswgK?=
 =?us-ascii?Q?F9SivD/h0X5tKN5nI1erbaMTsu9he3ptlIzCUQoHV2ns2eiprpV+MRY6dBXW?=
 =?us-ascii?Q?YT9i68XbOoOpeTFaLOwWWVd/wp6CoZe52l3xRRsdfJsbqeuIEOhQKKN060Jh?=
 =?us-ascii?Q?Ub98IVRCD0YJm4qkL4JqhoHRfbcNEfeHRtBbPy4VFmVmblTpIXd3itP7s2vq?=
 =?us-ascii?Q?0xo6usAuwuRVquN2siV3AZ48S24wCPLBpISsIyhHKywhRd0UIu+Xcoyy3ONY?=
 =?us-ascii?Q?fm5/euInMl4CNsgN77w1ZUNbHGdZBG/Zcw3dE2BR3NR7sqwui1AAS+z5RaOY?=
 =?us-ascii?Q?f9qI6W71m4wFCl7FlfJH+maxDMA88kBCyOW7ZUaZvk5AHO68OP3GJBXlHkU7?=
 =?us-ascii?Q?0cMOPkVxyTdlsryTLVeIy00s9MY2yVRK78ViiBSYRbNyoTh/dUQaFEeGwMVM?=
 =?us-ascii?Q?J9uijz7Zh86/0UQwzk9wW13WJcvv6TT4vgDYwldps8VDUM/fEBf+zaM3Sd0S?=
 =?us-ascii?Q?jY58jDuOUWn3x+pKMoJ/4YS3pW1+NYskw/kxNP6HXiXo7GXGu7SghldgetsK?=
 =?us-ascii?Q?WxFmV9m8ZXPFo+PmJ2NlzUPD1fr3emMd6Pb4m1Dc7TlIyVg2UYX1Qu/wl2Lx?=
 =?us-ascii?Q?Xt9fq0RYFXdaZRXxejn3nLH21lG2K1sPe8TSAM6jNoEWY1zscgdUGGOO0U5f?=
 =?us-ascii?Q?co05oDj9ylacL3TJmNS1azFfexKH/iBSbw54RrwZt7cyBaGGjFOgAEYAFuLE?=
 =?us-ascii?Q?x8UoSRLr/Zp6ehkyI/lK+9sn37oi/gWw0+Mpq5B/qrf9BNMF+9ZT70q7vYQM?=
 =?us-ascii?Q?sKlFkYN547tYsx05HiDJBP6tysMsHZu7mAEw5kOMaG/OLK8xGn9tobmrwZDS?=
 =?us-ascii?Q?baRmlE7EcoV3pv75uTyfIwwRK2z2/chAXt8/l3FYhOrb5UACCFjVvesmilnP?=
 =?us-ascii?Q?0PsgDk4UZZr/4LCp7BODUdTrZ00ChXc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 461aebde-a723-4643-833f-08def229b7e6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:10:12.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1xXKUrvppxAdcyktkjDsqJyDgiFXJgeElear2ShGYoTVvCkm4XBS1fqg1i1gf6AdjtaouseyZDOZ4QoieooluK5/KUvLj4OZ3u6iVfnReI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFB2DB17625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242756

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66034
https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804=
cd898d9

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
new file mode 100644
index 0000000000..906356baf2
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
@@ -0,0 +1,40 @@
+From 16720054e0b3f02e36f31dd04add534d73d4a18d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+
+Backport adaptations:
+- The upstream fix uses ssh2_err() which is not available in libssh2
+  1.11.1. Replace with the equivalent _libssh2_error() call.
+
+CVE: CVE-2026-66034
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a13bb=
6c773f0d55ad1628cede57e99804cd898d9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..f3776d2d 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey=
, unsigned long *num_keys,
+                 }
+=20
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_=
SMALL,
++                                       "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs =3D 1;
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index a87c013017..999c3db55a 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-55199.patch \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

