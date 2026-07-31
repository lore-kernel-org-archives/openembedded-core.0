Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC15C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 11:59:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4845.1785499186592305054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 04:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dEkyfyMO;
 spf=pass (domain: est.tech, ip: 52.101.72.32, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYYZShfTG6VfLHMKUJkUnrGwUi1mW28IkEN+eGmQ7qec+Q0SuueI3y6TXv3Oomcvq1dRasGRrfBLyazQ9bXznxR11+fiB2YlW9hn83XI0ScGn+5c7rL1uE6hM6L6DjS8/DbCHR2i5bps8tojJllFPFONSvFdZma65g/+zM4m6Pfa1NFdMzAumFujxRPseSZuwV4BAi7ggb6mJ9mtLXg0wujwc4kSx5/DHOC8NKdNfzYplzDgRTu7/JL1kuZn8Dbppyx19jo2Y70UbfjZJqc8CAzynDqahaIU5jddNBu8jPfhC3YeILCJPXeLyKFA0HkP4pyiurWuXfhAdX9nD3AW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx7B0Lnfp/A3/YsyBCQSb1SZII00H/B0F8jB+fob+2g=;
 b=eIJYxvKBSWX3IQn22RTX/tuLrGCL9mzCUvqx1mw4+Am/1g+nBHDjI00E2+I2kKHJxnLrZbw0+eMlgrspJHJazg/L9/3vb9tX2Juf2N5vk10mv89X90lmcEKqEtTb8dce799tq0qm81L0Fhsq74b49SRX6xfJQvEg0b+nTCN911fjYnUb7wQnWV5BhtpHduwYzGq88GcgZml+WyFWyQHdRc/anEGgXWGfEFtw2vLUiYX8hZHzhsnqG2ffo4gpiihVK6sQxVvairYAh13UphCf4XVM/dOt7R1l9X5q/avHE1OzKTeKn2eMl8GG0TxrAL01sgvDoBbB65O7Z43vqf+3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx7B0Lnfp/A3/YsyBCQSb1SZII00H/B0F8jB+fob+2g=;
 b=dEkyfyMOJPLcCPp5vdvqyObDzecSnb+3Vhz0h61bt2Kg0mMn7J+1UnBykb5r9YDCCeFTVclMSB1ml7j1VOwPTEqlvHfDqq+oED7o9uRc5I/OsreQ6RIkWzDBDVlEzAwog52bnw9LhUiINcJXqXz62SCmuBxJznnWlVmpax3AAzCH3vYrW0ZB7rRHHYvzSBBRr82+j6GbMHv1ffCY8Zti5SVdmK0jt1GlJCspDBUIyZSLMZGl5Xw/vwS37m945JMrHF1j0q2AC+TksL24hfEzFA7eAuEqyVJGV/6eooCEVFPBM4vqUndhKLCtFQoJDhc5XL3dUOQA1DV33muusU+TCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DU4P189MB3374.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Fri, 31 Jul
 2026 11:59:44 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.010; Fri, 31 Jul 2026
 11:59:44 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][PATCH 2/2] coreutils: fix CVE-2026-56392
Date: Fri, 31 Jul 2026 13:56:35 +0200
Message-ID: <20260731115649.1402336-3-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731115649.1402336-1-leonid.iziumtsev@est.tech>
References: <20260731115649.1402336-1-leonid.iziumtsev@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::15) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|DU4P189MB3374:EE_
X-MS-Office365-Filtering-Correlation-Id: c04799b9-4e49-4588-dafd-08deeefb35b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kYZuze2UUIqqQ5u4XzJcVmdiixaJdvpzA1qvwWEiEiclNkIzA0JRvUtTZacwyIktuBW+Z1ZtJl44eJ2SlXfCEiWDAlVutvPldBI7cBnABl2v6CSq0Rd7BhIHAh6Vi5+DZwJI8eS/XfmyvanB5icACjfyKek+oYLnDCB6vbePSYkHgnkvpY0KN2k4R5hCcVoVw09izTInXVnvEoAgXPPIQxvNLRqx/lGKFPcWKyrMPOeg2rLVnB7S9xvDeYTaS4rR5u6BgiJ1vQUUOsdabPWCDYoc4MT7vBPclLAbGjVtsmdegv17idxrnKvq4STum3kTww8hqmtHwU+zz/Jpx2/rWI8RvqWzcafYf8O1I82e5+q7Yvh2+RTQbAd8UrETF4pPv1XYp2fEuX81oz5dv8go0EnUg+gWj5lpIFvWI2fxEFsGHl87ZaS/k4I54qWl/L1oauzxA4MYnmiEhNvjTRdSlz/+HUlfWD62Q78+df1gKSiE1wF+Iki0tHBTR+o9ELMEHFi3HzZnGKJf4nD9D1lUCs89vzkQGzw3YE8sl92CWA43mSvytcMr97COIi8PdfgUyqPDn4nvoYD8F1s7ZVJCeD+NnOYLAL7ozMNqdEq2IeYJ2eh2VrCEyaX9DZ9w/GHHltDr/6pzvLac2WQ18qF674TFYRbtRRkvPpbww9OsRsE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UAoJpFe16cJQcD1RZ6W+mfZG+6XKL1LS2ncxAh3mg7fYedeSS3lNKzEx2vXH?=
 =?us-ascii?Q?sPp2uM3QvKeTvh084T+BWBqpzsESnD0IHpWIRzRfkoG0RGZeVG2tF3YDJKlr?=
 =?us-ascii?Q?9M+J89pPdj8GIaAtJZtus/ryGhglgZiM5owtnSUV2MafJWRWbBtL4Qa0vaX/?=
 =?us-ascii?Q?XLiyw9o0glQi65OsT1lPt2hY5xFOFi4G0HS6j7elNiFkNU7EUydwiXlKe3Bn?=
 =?us-ascii?Q?m3RLAvAKManNt6IhYMt7bRsCLE/CrlNE4c5AkRa6IIZnU4I7iFtaXHYWQYuE?=
 =?us-ascii?Q?GU6vM70BLoEb/9Lo4BDicgjyvaX/fHbLGPYMB2bB5GGEGkPpdWk94OZZBHB5?=
 =?us-ascii?Q?UZCKPzC//TTugEz0A3LcGSk50oZjTkLXQGzX9tuR+xojLeTZTwC514fuNd38?=
 =?us-ascii?Q?c0GCJlE13QUmSifsdMgUsk111pegY0bo2guq6Wkg0QjpVcC6iHGFLREqBXfU?=
 =?us-ascii?Q?dOn+b9JXhoEYbBHZWQFffVWMJJSVm7TPjhvFGpDkKMBH/O/pZqlyByJ/24G0?=
 =?us-ascii?Q?mMFqJbYbIIpeK/GDWtGWDGIRLqTnX/QN/h4OmfwPU+y5qNandtiLUrLTN5oT?=
 =?us-ascii?Q?CZ5RgZ8HkvMSzT6xFWNlqY+O1Z/0u/ZIG+CVZwvwoQKW45hMOmyULW8f/Sxp?=
 =?us-ascii?Q?08g5MddgRKID3J8irx1tux9VYjkD6NBeJjK0MlOHNYYOm0INiZGZnga+8Jp5?=
 =?us-ascii?Q?VlPN6GFfHGV0NHiw03o3fC9lHSPnBAxQ9UtO15bwyRS7Mp/3YMwc3HDYjtlJ?=
 =?us-ascii?Q?RPwMz4XsJn77VhgKKBy7ezAivjppmRqKNlCvEzF+bbDye/7m0feG5p2jB0kv?=
 =?us-ascii?Q?YXpQcUh2HyvJOxFbh6AbyuIGfHqX9bCHA54YNURMVXuoTyPfOR3RLdsXxJNf?=
 =?us-ascii?Q?iopK7/MrVpye5RekGRgjgMavg0Z5RSxe/XzDAMvJKKVCtQqPjtvj1X1BURb2?=
 =?us-ascii?Q?VdBs8JdkMKBViZjK7YWhF+LXU5plyja7EyZFrZqOc3JmhYC2rkAjWvHjU0Cf?=
 =?us-ascii?Q?Xf6mTM0maDddmTqVUZ48Rw0ci3boIRKq8AlMNqZ+gt66I+Wxb5VmG3XwvpNA?=
 =?us-ascii?Q?cAKH+WdBLg0TVC2C2QTRe5HqKdQ7jSunE/RxDhaM7jm4Jx7R71jvdr08pxVp?=
 =?us-ascii?Q?JtktjL1UVVekCDY8UATTrMocFIQ8sIBtHfYqo0I1J6hyrCuOfZSU+l6u+FBq?=
 =?us-ascii?Q?2BwjqGKDwvAxgFgh8EdITd6rDeKCJ0LBUDJMVOfGjWcy5hR0tk0X0346+k52?=
 =?us-ascii?Q?bHLFw7kTcaz785Hxdg2XZeuEYsmhrrRIKQBWlY/St2zobwPC0n4vLX4UBgnI?=
 =?us-ascii?Q?BuSXilZcn8joLLqi+usLxNetuTTlgSvNbR78f+TBqSNxyNd3YrKICJRlQ31v?=
 =?us-ascii?Q?oDzjppoYW1GrgE5WkghF6kKUzqleKN7QgpauSQqmH5HzvcMKy1mjo/oFqDx2?=
 =?us-ascii?Q?IY42PzFuGftcUjiLPehTazKTVwKJaeF6bw+FUC6N0pw1pPX2ddXrOxUtI4EL?=
 =?us-ascii?Q?huoPJn+X+u8zVAaIAw5OEJwx674ntlHuuuZu2jRQjuJ8TvCUHnjjblWgSpNi?=
 =?us-ascii?Q?T2gP044HVBwHp0KY4M5/DkO6LBLlCA6FLLdK1eX6yd8X+JpUgSyUJm7qJvpA?=
 =?us-ascii?Q?n0hXqhLqqes6aBv0QflluHe7zCBwFjGP+XzFpU5R1pHjxutIH3kYknFbbtPL?=
 =?us-ascii?Q?gwj3+z06+ALdxK2836L9t3jytCJxzpurfEP7D3aglIvMGXnmBtQFpcd7SwWs?=
 =?us-ascii?Q?Ja9Ctez0Lh1nXKFUAuzbJgDCAlhuvh9hG1ntG0l3MtuzbVxrwPSRSy3b0yHo?=
X-MS-Exchange-AntiSpam-MessageData-1: 5SDb8C/v4wjOWugN5kj32TnvKliENTT+Y5g=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c04799b9-4e49-4588-dafd-08deeefb35b8
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:59:43.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osybi2fEUsD4OIzdm4ZqoZa4BocpjkkMo+FpLeeK0ZZZ/0/1PM7wkefAPX3RUDq6vqLdp2iy8GxoSUIDom2knYMoNKOY1bB7dUcfRowOkF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3374
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 11:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242433

Backport patch to fix CVE-2026-56392.

Reference:
  https://nvd.nist.gov/vuln/detail/CVE-2026-56392

Upstream fix:
  https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Db60a159fdc5b=
fcf9988d3a4cb6f53abe8ad5d35d

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../coreutils/coreutils/CVE-2026-56392.patch  | 65 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.11.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56392.pa=
tch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch b/m=
eta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch
new file mode 100644
index 0000000000..8468b4d288
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch
@@ -0,0 +1,65 @@
+From aa3f6d91fdddcc45c5bb656168f7d20808991fe0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
+Date: Tue, 28 Apr 2026 20:33:10 +0100
+Subject: [PATCH] unexpand: fix heap overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/unexpand.c (unexpand): Use xinmalloc() to gracefully
+handle overflow.  Also use the runtime locale specific MB_CUR_MAX
+rather than the worst case MB_LEN_MAX.
+* tests/unexpand/mb.sh: Add a test case that fails in a default
+glibc build with either MB_CUR_MAX or MB_LEN_MAX.
+* NEWS: Mention the bug fix.
+Reported by Micha=C5=82 Majchrowicz.
+
+CVE: CVE-2026-56392
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutil=
s.git/commit/?id=3Db60a159fdc5bfcf9988d3a4cb6f53abe8ad5d35d]
+
+Backport Changes:
+- The NEWS file has not been updated.
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ src/unexpand.c       | 2 +-
+ tests/unexpand/mb.sh | 8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/unexpand.c b/src/unexpand.c
+index 4fbf9d3..761c8ea 100644
+--- a/src/unexpand.c
++++ b/src/unexpand.c
+@@ -131,7 +131,7 @@ unexpand (void)
+   /* The worst case is a non-blank character, then one blank, then a
+      tab stop, then MAX_COLUMN_WIDTH - 1 blanks, then a non-blank; so
+      allocate MAX_COLUMN_WIDTH bytes to store the blanks.  */
+-  pending_blank =3D ximalloc (max_column_width * sizeof (char) * MB_LEN_M=
AX);
++  pending_blank =3D xinmalloc (max_column_width, MB_CUR_MAX);
+=20
+   while (true)
+     {
+diff --git a/tests/unexpand/mb.sh b/tests/unexpand/mb.sh
+index 76a2679..076a1c1 100755
+--- a/tests/unexpand/mb.sh
++++ b/tests/unexpand/mb.sh
+@@ -17,6 +17,7 @@
+=20
+ . "${srcdir=3D.}/tests/init.sh"; path_prepend_ ./src
+ print_ver_ unexpand printf
++getlimits_
+=20
+ test "$LOCALE_FR_UTF8" !=3D none || skip_ "French UTF-8 locale not availa=
ble"
+ export LC_ALL=3D"$LOCALE_FR_UTF8"
+@@ -161,4 +162,11 @@ EOF
+ unexpand -a ./in ./in > out || fail=3D1
+ compare exp out > /dev/null 2>&1 || fail=3D1
+=20
++# Ensure overflow is handed gracefully
++# coreutils v9.11 induced a buffer overflow with mb_mul=3D4 (or 16).
++for mb_mul in 4 6; do
++  printf '   \n' | unexpand -t $(expr $SIZE_MAX / $mb_mul + 1) 2>err; ret=
=3D$?
++  test "$ret" =3D 1 || test "$ret" =3D 0 || { cat err; fail=3D1; }
++done
++
+ Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils_9.11.bb b/meta/recipes-c=
ore/coreutils/coreutils_9.11.bb
index 3e4f5fc7dc..63f7810e88 100644
--- a/meta/recipes-core/coreutils/coreutils_9.11.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.11.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
            file://CVE-2026-56391.patch \
+           file://CVE-2026-56392.patch \
            "
 SRC_URI[sha256sum] =3D "394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135=
a49521d57c3cc3"
=20

