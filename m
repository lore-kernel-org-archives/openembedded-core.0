Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C16FB3D1B
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:58:42 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48178.1774867014764857320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=TCg+YVe1;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.50, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtuFNnROjsy/H8CdSfBRi4zcmnBszICb3jFc7qdFmYaVXCd/Wxq5CJh/42Y45Up3kNLCqNbyrEXvNGnpag1iGP7XgVJyeITDPIMVyZCQNKjpFvKprhDkF92t5nqUQMMCk2A/YdS0Ka51f3CMD6Ze8ygzpk9INIgnO1R6UuaCyKFTCWPj8IOihtnfi+CVVQ2h6HDThcvT/kk7vXZafqvYPzBlEskoFtC+yJEzcrMeTLPsfwzKS830fQWWXD45ZST6jggLVDK+BDfw8hVcjOxKjJEUVmFew2Rq/7oDzQTJKRMEc8VNPX6pXXznCIfnZpJY9NQDw8moudx0rDch8lef4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G9uDI3UiGeqcWYsxcFRcrKu+coknh365GzTO4eE7ZU=;
 b=zAHmVRemK+XSjKJVg0Any9adgnuIr5Ny/8t6C3j9iA5jGDXX1mrlwHa4yYic7hsbFk+9L3xlCVIx9bLnuPrutycV0Dh4ErIiLhnUWMGLIJTNoA24O8FHQmErV8rYT3yWbC10dJXd/6lakJc8pCI5aOnn68LmCWasmwBq78B2jq5qpq5GtPBEvz5Qh67pOt29nNyllymSo6+ORLhlERNyPHCcRnlAeEN9wZUkOmQuLrgdYtBKAZtubEh3SoGJBmESud/HIlkgZyLymzBO3c1Ktjlbi5+3ntiTYBNHFPiv0XtRHrU2h99InPxLVeMy7eBQYmQ1+w3qLlNl3jIDxPuD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G9uDI3UiGeqcWYsxcFRcrKu+coknh365GzTO4eE7ZU=;
 b=TCg+YVe1HT4SpEK516MO7cAcZDb5U8vi7B8ahC90IVcmtlNlJH3i0O3IUkYAHLwM4w6PzNAG25eQaUjRGMMRO/0dBAh1lZoKlQLfCSHzkb0rMF7hPsvDBDx156qpJcoLZ3Qb9SPgZIvXpyXCd3krM3m2m1LfTdcPDHW9qeT39L1Y93AVcl66Pz6a3Qd1q/BUkIdCwPpvzp6kRSSp+mORLbDspw4XTj++Pt3gBvIdof7kjlZgfZZbz1P+fgyce/szHScA3LLxDbr/pfQWDHqR2Bm00vCFLV85VdQkep3JjunOkl+lIFT7zYmfA9wjHz2EXMSJTuMT02OBC4Su2rkLpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN4P287MB4618.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:22:17 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:22:17 +0000
From: Suresh H A <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: sureshha <suresh.ha@bmwtechworks.in>
Subject: [OE-core][whinlatter][PATCH] systemd: backport patch to fix journal-file issue
Date: Mon, 30 Mar 2026 15:51:54 +0530
Message-ID: <20260330102154.991029-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: ME0PR01CA0036.ausprd01.prod.outlook.com
 (2603:10c6:220:210::28) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN4P287MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: c6bca1b7-0a73-49b8-5663-08de8e4637f5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|55112099003|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	IiAaLmrz6/7lZF4U5SogHSubSukmh2X/IllBevUwqz9rTUnijoyJ/ECZeXo7zDnVnAHfwIk1Z3+P/X8FKGb4euKr9hQOkZoUJ+QsM21B/FZlXFJESRil+nLP7Si+qslohOjSKccj+tGlkbAOvmVTOKNiJNDo1khF1IcDZXq9+WwbaVvTZb0WxhY0cgO8hgjlN9Fbnwd7jj8/lBqzXzdTdClB+3cg0JsvpjCH222LtGUXns4kWwhJOvxy32aiuEBobKquXB+lUt5NbFlyLbOhPWv8d9I0cluAP4yoe7Ljf4UpxtsV3l8dn7vj50OBad/88X1kUZEUY/TXfEFa+N4xn88dcyIQKxWXilHUGYD/aUkhnft9Of9lLqK/oNafzJ4DerqpZlA+fCS/CfQLHPuva8ZheucCBIwhIMzs5UDqHZaN90qd/b06zwWxA0wvWhatT/T7O517MEEuI89dSwLBdKcDi3315gd21TdXg5GDGnME969frJhJxGBf39KVkXDnQHa12iFpGCapxEbcrOUTX+n1qGlrsRr7fUBqsNBRkr5bqC/tJt5XeDKEK9urnOeIr7eK48FSD0it7QBkZjzXZxIfHqZmKVN6GMSV4u5iEmvCoVKINYtl4lA5/QttkB5s879NqwqkZozTU/roCbYSOWgJIQyEvUlyfhwnTysbq29VJG7F5zD8YHiIoO2cWjEn6T2QI4jU9eyCsLRMFrLImHjH2zqmGJQXgQlhZRjAAEl58t2nZabR8onj5CkZeBygACTxKVLz+ijN4GCvq8+ynam6k0XYWM2d+zWazuqeCIQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(55112099003)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6bhwWTfrekpiLoOy8UcEbPXsaNu0H8j6tZ4+fvfcFFek4fuxOCr4JSQ2rO5x?=
 =?us-ascii?Q?RPeKuar253x5NsD/HfdG3bLn9BqnS4W5YCnSr64XXzz6yEFo1yjM5H6GemtP?=
 =?us-ascii?Q?PZERvZXHctWg3R2xFS7vzHw5u/EAxYlGz3NLVe1hRqLp3TgnOtPHy3je+bWc?=
 =?us-ascii?Q?wSSle49C5yQ84PcgqKw1biKVs/kfGyzINEMec/mRSFI2zAUzvS1YPRGRaCI5?=
 =?us-ascii?Q?GAFXohGV4BK53lHBnf+0ahzgqt08+eU3m1uiaJfenIV1XyG5uHzeaQR/Gzxz?=
 =?us-ascii?Q?mfCQPU9OKw5bMDocCTwkc3wyIusBEilHTZb6gWa5EzEZO4nPBHpiGnyndz8G?=
 =?us-ascii?Q?JFMBCPLkK4RGQDs8eNSsLwJCDTKTdq4fHOolmtqx9QM/XNtEyAzgNFgZ5W4v?=
 =?us-ascii?Q?QVHuv/71VAdvRwJhYGfmjvdCmowx1/oY4VhpaDhkSAjmEeXz2ob4R3YKiewA?=
 =?us-ascii?Q?shWWYVHXKKv1nC4bvKQJ7mPP+hM4KuR4J5iLvRriF9HKwn8UQX1Qg214rehD?=
 =?us-ascii?Q?9LegjrK6iFZHbzNiIHw5SVSfbX2x43zbhbOosbE55eJRfmTc/+kTJzfxcn50?=
 =?us-ascii?Q?XmWgXPyFSfREVIFqmFNJGfWXpZEGpZXSq4VQUcKIwQ/pfCJ79vyoGpy1FhoF?=
 =?us-ascii?Q?psq7l+1buuK4GcHZAtNJlGDNOuxQcZ96M1rr8fZY/dS7TR6Q+v/I7WrtcNmT?=
 =?us-ascii?Q?NuDOSwWzZIpTN4pGhUHJW11Bfck2SNOnrPjJemNu8MMQLRppQPcRzCmaS2Vy?=
 =?us-ascii?Q?3thBWJ2otYb+eGpCSsDOYKqgEi6hq/7G8StdMdcOXmDSuHfRWWr3OoH9YOL1?=
 =?us-ascii?Q?p3VhNrsRXohk1N4vB0wLsIIneoUvr+M+YDJCgbY15zwQK5sDFBR8fnpJWdf8?=
 =?us-ascii?Q?cKPDxnGiLd100AWjlcrmMyhfUBC8WHaC11rAgpVIquIZII6rqcT2Qz12HtyE?=
 =?us-ascii?Q?xuqJFhH+gVtLgDD1MYa4vI5AMNy4CCusrG7hlr/lm3Bwdn9GrrTIJ8FP5vwL?=
 =?us-ascii?Q?c6xw9yLmJvsIbWWxFAONAR1c80JM75IIopnNeMqSPTzhG4rTeGO5mwZEy/15?=
 =?us-ascii?Q?+B7PIkyxXDyNlkh9Lw/rxjjFZTTkZJo9989KX2ubWNQ933CDh/2SGX552035?=
 =?us-ascii?Q?u6CUI3ESkpK+f9peWfLkZfkNeAlO0qnC74tvGR3NbY5S9ZUjVKb+GHbbp1CX?=
 =?us-ascii?Q?uW4ividqrrbMOL8YrPQt35Gm1bABDMgxUTOGcgRy5UfbAPRKBsXQ2iHVzRlU?=
 =?us-ascii?Q?/D8puofHzFhAggdQTEgsDxox7OBTttSTgGx6i3+1f/TnE47gbLb8ttqjWn6k?=
 =?us-ascii?Q?yAvVN9Hxo1vPZN3bvgHAWMALgHnme8m0gnOFvMDEqvPJ/bMYy0IKpXLyV2UB?=
 =?us-ascii?Q?jrH1SStR2KEiYUNDnhtgjYaApYfVsWs+6A9ebzSqUQnrX1GMEsE01ZvyYUgG?=
 =?us-ascii?Q?9BFs+CXppfV3sSxoDjFTc60XjSt5TUoPyl3VZQ9Fn24FkXaTWK8Sf9jpf9KW?=
 =?us-ascii?Q?gTkLOaiqY9O1IOGS2tXyiEaMnrgcRaMyRZTndeyBBTPeywQ2s3gQdJRJIUrM?=
 =?us-ascii?Q?RoOgwqfbD8ukDad/AV+Xb4I0l+YdFNqonaW7muWT7qo9AE8KBSPjihvOJ4yL?=
 =?us-ascii?Q?WeACp4YU5NGkXcU8tPIqSgj0hDJmqfpI81ywjngWQZlrX62F0bRRoSFVcXB9?=
 =?us-ascii?Q?q9FElRyggLCkiu8mwAl44kp0awk4zn+9mfCzL4rjWz8TgH+VU6PBreykTTkk?=
 =?us-ascii?Q?riQ2CuwpJuQMTQ08m2HmPDOLDs24zI8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bca1b7-0a73-49b8-5663-08de8e4637f5
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:22:17.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pLtSguDScZWcxnuaIWB0CPjw4DwZUyYiYVcT7/LXaOTgjeZeUiuXAzd2MbLZzyma2pnwSZbuNub1dFA85wN7QpK6zpKRcTOTLMGpX4AFuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4618
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234226

From: sureshha <suresh.ha@bmwtechworks.in>

Backport patch to fix systemd journal-file assertion on removed or corrupte=
d files

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.8.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-file-do-=
not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0027-journal-file-do-not-tri=
gger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/002=
7-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..e1bb556271
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0027-journal-file-do-not-trigger-as=
sertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
+From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/112cb=
c37906fb97afe0ad04164262cf62d0af5e9]
+
+Comment: Patch is refreshed as per codebase of v257
+
+Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-=
journal/journal-file.c
+index 08f3b82..633de5b 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -3305,7 +3305,9 @@ use_extra:
+
+ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t needle=
) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <=3D 0)
++                return -EBADMSG;
+
+         if (p =3D=3D needle)
+                 return TEST_FOUND;
+@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint64=
_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, uint=
64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, uin=
t64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+--
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core=
/systemd/systemd_257.8.bb
index 549eb7fb29..a53959f816 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -29,6 +29,7 @@ SRC_URI +=3D " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Do-not-create-var-log-README.patch \
+           file://0027-journal-file-do-not-trigger-assertion-on-removed-or=
-.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


