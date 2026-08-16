Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDF3C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 17:07:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13514.1786900067066568225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 10:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oGw4XE/Y;
 spf=pass (domain: est.tech, ip: 52.101.65.9, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3FrKaWcDb+aViL/O82wIL6LhAz2dKYWV5I+UXfpz/cMN4gPUVy1aPrEr+xdRsi78vMR/VUw/MSjFxBEyBjB6M4UHmXRXh0FeBwRUELRCs0QezgM6sBU1gkBziJmWT4/ra6IM9cUohZkVGga/AMCojlkq1jFkRoymSMk44ZQ045UtXJPw6NJosbxI0gwC7SmoLXIfy2v6kJwoSCaUqXyzIkjCTi2fodrXQs0I67O4VgokzvAW1TEdfiDArxwCi4ewftY+k5ggDfqIDKTYP4WRAFC2ZA8vpJnAQ8uAXa6YN2QdKQQl8rOA+0WHY/In1W5pWfHwYN+9AcP3D3RyzGm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQTKUIYW/+H8UGmR3cksANtc0aKABm6GXASJkVJwGdw=;
 b=O1YF5y+mIuo5GeKEyni487ynNCuLQXpgyFOmrghie//Bjqvjx7KNRJMxMmtmA33kzoNlD++nCPkO1s/z3UBHuJ0D88rUYN67Kp8RxTPJa3JouXrHfK7brw1rH2QIBGBwaMc/qO7qPlPHzAd2J/vXh0B5IiUwzCcuHoNuEqufhclLCV0WeEG3IDBeqOROVzFPoxjPvEV3cbOXfb1Kg1kCMKzQhgRpHiU/DLWSKXB6omZr+2mLgNUFy86fiyMLTVICW9SsVI4gqVpB2yGFrmPRWCPdHBlHkK+JahinHb2GP5vyg6ketae0wHOXV3hV3OX3NNgFEyrf40zJhaW1VAc9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQTKUIYW/+H8UGmR3cksANtc0aKABm6GXASJkVJwGdw=;
 b=oGw4XE/YIEvOrApgdlXW4E/GQOV1J2oWxnoTsmqkhelfkuNSMJhYGQ9NKUGYioPQHKS3+Ah2DQDE3gyeWlnMiZF+8jMarW8F9mKhvG9rroYRIUnJ88MJLivLz7UWamEfjs7v3UCCWvrJ+ZUZQo4M6Rg/9h21PcmTMoktZcNOrWvIjFtjKJwZzjzciVrRqYbTku/VWqJlBhNATTRtbU3UdhrssTuHkoS//JD/7ruEbXZtxBR75f1E2fiCA7XHfKQAAAmGTqqXpB6j0MVj2NlSdLkCRzOLTrjFg9rTzMF1GspaX59M6jBzwcjdMvZwRtTTAxrXdCaj/8adjRBJfvhJCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3363.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 16 Aug
 2026 17:07:43 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Sun, 16 Aug 2026
 17:07:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] glibc: stable 2.43 branch updates
Date: Sun, 16 Aug 2026 19:07:37 +0200
Message-ID: <20260816170737.42198-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3363:EE_
X-MS-Office365-Filtering-Correlation-Id: b5492bc9-089b-4af4-45ee-08defbb8e2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|376014|56012099006|10067099003|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	/DSBXuW0DThx08Fwn01mCX0mu/YFr2jG2xq4/g90Iun0Ua9s9ALgT/ZXgDXGaHVwz9Lifm6u03RYzbx2zomVbmBroHUCqG79dcL6Alfb8jZeX0MPaTAdO9Vys4q+3pGvqA0YdA9QPtUfvlGTWH2CYDrbbrUw6Hb3yvFrgtddosGIVhz4ZnH/N+bwSsC/3trKuequsitGJwJgdQ76NXGD7xQaoZzr96fcMx+SdPhM2yr5FwQOre2tcfJ6PIkNzWJiv314v4J4l8+iMxDeqaXgDMHzt3theDWRB0yu6xz9zevPxelPbX7wmiZmA0hJa4rxjGtIjHN5Ykeitp34N+Cm5O+gW+SXTWqJO/Q5yJ87pNVHJeU0gu6QqnhD1VNHYLTtJqR0ZemYSOqDO8DR+UrnCc8IIVE8hd3MPZrU0FjQxtWC5AdE/orRksi/9LHSr4MeHruMZ5k/upzaU9V776fNtqehaalkBdzzWnag/uwsZyXm4qWc656FuIYMnjzAt2K6k1lN7ZNfJyLZ62bdVgWoKq2y30kTywUeof8HuWNwKQANen1FVNMRYBtkWPSN2TA+cF2ehYHWCiGsjS6/v7LPLaRYEURp/Tn51mwvaniyODbY/p4v9zfMROmo8AwpetBSNjiMpfpcQnL6MYdj+XX8jhidXGj2HgWyXi6OdBCa6+I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XfaGu0nMddYDcEOqTr/F5kgsaObF9vh3mRgmXAdpXUv3Vo+T3X0HxJ4xJN2f?=
 =?us-ascii?Q?fY6hAdfVUIPgzz0MKP4jnXXOHL4icSjStYTbGxIsj82fMA/0CvRDqxM3Mf23?=
 =?us-ascii?Q?5JXcnehp2ctPX1aDnvKsTLrdwpGFg5lCWuJpItyKrxOIdPMP/q1YgU+oyCOo?=
 =?us-ascii?Q?yluA2L2nwI57xb/rtN08/0mzK/XD1PWgPHUln0dPDSKHnPeOx6GKFWaa4l8b?=
 =?us-ascii?Q?KOz/Ubig0w6nb5aLfZGFCPv4jSnSA2u6R8KsA0LOR524IbtmOhZluRTQePjR?=
 =?us-ascii?Q?sOQ1769h1Ncer2NxuAa1V7xVgPEWWoSPBgnonnLb04y2zcCocD7j8PV1pxQL?=
 =?us-ascii?Q?VX71IT1BFBkTMJ+XExDNO2R8rdYvFHWtOXMxw8caZcgI1w/gVxxHu5XWlyXn?=
 =?us-ascii?Q?ucKSh515ZJYWQEWnlnt12XHtvTLuHyrdwY9e2d3a+H6sLRqsUpbw5IhkDpUq?=
 =?us-ascii?Q?A6anY5ndMk6NkaOv8B0NVQjkzl8tbikJh0ch4sy9x5Ofn5RMTwVS+Hr61YpA?=
 =?us-ascii?Q?e79MpIolhJBKba45zV8g/3efhPg/v06FGkPNxC6vXnY9Xj08s+VWryGK2WuE?=
 =?us-ascii?Q?8ZNOM3LmkBX+vWjDo3q+N0vsVxFOcqBccLsTTEHYbTJOGDmLqtnCn6O0XL1c?=
 =?us-ascii?Q?CM3BHbkE/Oyq5vSQatmRf0MlIxrxcRRQS51aeuxBtTKYyCT3QtrJRsR0d58X?=
 =?us-ascii?Q?CXT8fQVab1HPBHhM7CZN1FcZe0SUsF8p/WLppBv8CPoLDMOPEm+fL9kQWEzi?=
 =?us-ascii?Q?W8HFP+4WT5iDc9P6y4lro85D+m60T5r+lkSzD+SMf8+QpNmIxhxwyVf+BeeX?=
 =?us-ascii?Q?qT01/Lq2ql5i8cPAKjSs4BkR91Zl0MDIBR4/zhauvvNwzs4BzoCRIDQdJFha?=
 =?us-ascii?Q?wJDkoLshxS597OCJoDPb68ab7alTwm9sCVX+uOvnyzIMQbn7tMeLTt7ztPV7?=
 =?us-ascii?Q?bXG12AKwz0AIi2lOrUwFn+s6x8LOK3Fw4PtlsXAs3Xnk7Gk+T0CHM8cVWlLO?=
 =?us-ascii?Q?qo28vGnjaSSBgg0fiB+VXBTNPlqYngP/j8L44K/ojlD3NEzuVGYXJd+I0kZh?=
 =?us-ascii?Q?AQk4hzYK6Pw+yxWthcVa7/axMez9i9tMvgnuOxD00fuqxgd0eGEQ+5ejbAw5?=
 =?us-ascii?Q?P2uYWrrQYaD4SgZFDkbPG/71LX6G2ICu+DLeFw3X5kzt2hVNoSO4C75kzJx6?=
 =?us-ascii?Q?DPCWzFFqMx3kn8RuXwt8yA69JbXz/CllZi0PxjTe6OphLaP2tO+TKCL8FtQo?=
 =?us-ascii?Q?lHqFmgwu9ktwRYfdxrvJmDzNXzYHm2H6oZaFxYxDCFeEzW94DDg8CqvxXv4y?=
 =?us-ascii?Q?wWuJCrHRTD3lemQGxss0tWeWgZc8+dI+sbv+d5I6JGx/R3W5vEVqbqaZQiIH?=
 =?us-ascii?Q?NOldVggJ4L/oZAJwBvCmvyXKwnyxkc60OiZtSa8ekEW36G6XeBXJ4afZdOyO?=
 =?us-ascii?Q?auZXO8Ik8q9Atxjfbvrp2idnhtILfP5Y2qKxEA4ZJfiSwItYW35IOYGo6Jjq?=
 =?us-ascii?Q?1icTP5mUcHEyPirj0EFjie7KoKLYGG6cmuCPQxW2b9B5b8ZHvwYJsyahtpB4?=
 =?us-ascii?Q?bQ86IgDxhvGLSP94sCiqoVZqO9oIFyXo05ehWH5k7dSeupeVemDZcO9v+ZKq?=
 =?us-ascii?Q?WPlHbg3uldqg4Gt82zGCfcrPzye2gB9wcfoBquYt4B52nn/KlfgGigL73ET5?=
 =?us-ascii?Q?PE9d1pwDz3JXhQl73n/P2tslLHMSKqHN4rrb7pY+vmBe3n3+/uM0XSkqecsS?=
 =?us-ascii?Q?sq1pVy0FwKcyU7JEv8c9RHWp3ZXXqZTM+VMcQ14i5Y/0Kqa2nxubGybb8kvz?=
X-MS-Exchange-AntiSpam-MessageData-1: LsLdDBaquKqLXwYOEsXV89/tEv797oxAxI4=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b5492bc9-089b-4af4-45ee-08defbb8e2ac
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 17:07:42.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxiULKpJq1hZcgnqWoPou/Og/mdE+jkD08XSG91RN7aMAPldhLgkvggpBn3W06lbooT9b5kZ7vTAQ8uHGcKet8cQCYxFCf8KEUQZe+PhFEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 17:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243541

$ git log --oneline e9517114acc77c0b8af9da6700107df16882b701..7d26579873791=
748c20d874adb66e877412175dd
7d26579873 malloc: Show hugetlb tunable default in --list-tunables
8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPACE =
errors (BZ 34090, CVE-2026-6368)
bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]
1c9988e525 rtld: cache cpuid results on the stack for intel
dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091, =
CVE-2026-6791)
8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf
c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf
1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug 3=
4289)
349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use
fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)
a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, BZ=
 15792)
fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
22f3d24a6b Hurd: restore some SIOC ioctls
a13ebdbc7e Hurd: comment ioctls which cannot currently compile
446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines
ced45fd472 Hurd: comment PF_LINK/AF_LINK defines
89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cache =
[BZ #34210]
18b97b03b7 Rename __unused fields to __glibc_reserved.
a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64 (=
BZ 34183)
4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]

Testing Results (make check on x86-64 host):
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 7262   | 7267   | +5   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 3      | 3      |  0   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 41     | 41     |  0   |
+--------------+--------+--------+------+

Changes in failed testcases:
(no changes, same 3 environment-specific failures in both runs)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index af3db54cee..22a3d4d141 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.43/master"
 PV =3D "2.43+git"
-SRCREV_glibc ?=3D "e9517114acc77c0b8af9da6700107df16882b701"
+SRCREV_glibc ?=3D "7d26579873791748c20d874adb66e877412175dd"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glib=
c/glibc_2.43.bb
index b84c55ca17..2ffff0b62b 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -19,6 +19,7 @@ easier access for another. 'ASLR bypass itself is not a v=
ulnerability.'"
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-15281 CVE-2026-0861 CVE-2026-091=
5 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
+    CVE-2026-5435 CVE-2026-6238 CVE-2026-6368 CVE-2026-6791 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"
=20

