Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6FFC531D4
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:19:02 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24553.1784816333231494625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 07:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=A5Gd+Jzm;
 spf=pass (domain: est.tech, ip: 52.101.83.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAaBRtII6275dgZt5VnMeuYipAjbnDqsWy6fPrDTErf5HggrPPL2D+rNu+bDg2bH3CFpXdX9G8WI5YOK+8Y5MvF5vActu7IKyfkN0JouXH6m87bItbaCqo0Jxsj8uEbYQO08bKRebd+/3UmLJtRyjZJPcaAYg0LeNHBJz3VheEQv5NTYN8d//H8+uLkKnmyzA0vSdM1IRzIwGD+ZILssQBByAzL4Ajzb+JIe9miCx5iwaIYN9+x0C9K9KsBCuPcCzAkpaoDoDiGPUehBpv9ADIHqrPlj/0BDRfzPZn6FyYUnamj5UrwEto7Ps9/sKlQdBszqPs42jiao4Hl9R0oCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UP4XEPqpKmeQwKNryMvxtTZT6l90PEZsWSnnXh7aQ4=;
 b=bwsnhswHkjl6FZFiB6ERmw83siZAbg+gIEWQjGApefGdpdKMR35i9zt9VM3OyRKkJe9blD2JjLvcdOe5HhnKRTloAFsnI3oKHuWWc8gTDqiwNMdlIQm0I+UlVLLEAiN7dNEumXoiUJAEs08rc2J/kOFP/NZSbwDpLQ9aBmVsEDkLtFu4V6oMwhf+VyzVDsiuxP3wT3IbHJaQE73ai3Utwc178a4QEGwUZishmZafekPFXZfWz5zsKwKoaCo0IO2cWxgvGXxUKNRsEGFL2G4kMS/QZq1bGuHpkEAjNIvcmE03Z+Cvt+w7HVNzUiBROWaaQOutqrJtGokJlc5de7kGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UP4XEPqpKmeQwKNryMvxtTZT6l90PEZsWSnnXh7aQ4=;
 b=A5Gd+Jzm3d16JWs828S5EihNvY3uJu2pPNEjuwD6FkGev66tXp1NVA7CHz+ilUJeDm0ymL287e8BYTqJmH+jJGQJosl9jmBBp2bvIN0WFWWut/3ZPngH+UKH4Bkzg7xfF+ou4eqzVkioEN+dUtdZr6FCsZXw9tRR9nWD0/q3OEgbe5Kkfs5fL88KFNI6mTK+7D4Jeae6UUYM5u2i/zuI4FYcooki6zOyJB3ydBs8ocMZ+LRuUfdQlcXk5w7Uj59DrnSlmCPmxMnYtyXnhLUwEsLk5p47a2k2kfUsGGTGbN++OXHR70Ts8VRz7Q93Vr4V3GjVDNHUA2SSSD6g3flD/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VE1P189MB1006.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 14:18:45 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 14:18:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] libseccomp: upgrade 2.6.0 -> 2.6.1
Date: Thu, 23 Jul 2026 16:18:39 +0200
Message-ID: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0407.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VE1P189MB1006:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1c8b54-3f6a-42ad-d0f5-08dee8c54e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+7SWowBhrouC727uFHbt6ASadNOyORfTYFm5MsJy/KccMv1q1eM+hIuGsHpHsp6M45U9ckb7cpCLcCNcKoLezOwtODrVvnG579c5a0nOxkgQJMx5lgy5VhAGCSfse0V7nyfc3xX78BHUq3MNkvccskz/aMPlNp4iw37QO3Y6Eeu/16ll30h7wp4l5dX2k94mL2SGLRIh6bUUIu0Xcl5Lam9+KdldbOSxWi9U7w0w1IsyLrX8BPaPwXxkBYJ4QLVgeH3kgkQt5HlWMsJuoEA/3Jh2JmpDudbM4ORM8vMSJe4ZOafaoHF2U7mwPT2KpbmT809xK8jAeIhirk7PCnRlZfYR+dhd8QbzON9TEJ0UwY3baasFHNJNPdPmDW3oe0MPhJ2wxhsgDgmxGOIEiB71TIZzk0TNnq1hUVXdr6gdvf1tubJfhjCayhcUpO4B8gI2b3AjGVs/ps+jng9eZn1KQO0RNXDo4mqt+NBG8/y2HVbiJzF6Q0kh2RBg7DCkGBPiA9oZJffumyqLtqzgIZzXUj/XafAp0yN3YJhv3+3CffX1TYQnrtdduc8xvy9pRMi+BgUMZZKc9kSsi265negiI1zyT9tpYx0zjWblojpV0ZB53D6d/EdYD4DCEyB4ROkwLhdIYRSSKzu7w3oE7VRSsJPRyhJ1AcN2bI6gwWhwRos=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OYznQdlpqgNtxkSM2d+Up9ePZZciixBRl/0QFdsA//U4jtrQor0u9COX4YD1?=
 =?us-ascii?Q?SF4bQMcN7jAwPAhqhBfZY3pW6/Y7rKbt5lsl8VpGy+NRO4pfWPJOVAPuTSfA?=
 =?us-ascii?Q?jBQZpDg6CnYPJS/UN0ZhswHFEu4duHY30xCQGBOJY9ASTnv2jJ6rOTFtw/+q?=
 =?us-ascii?Q?5c8x5azbvTmRE7dHUYdaDWFO2Xc6fK24Ua27QsJ3WNcphNDdNmRFbBBiO4pq?=
 =?us-ascii?Q?x5OYaTW1atWFIvTdCBjrSVHozOz770MHNip3QrURZLc5CgeNplWxtUhOG19b?=
 =?us-ascii?Q?25+7vWlDOyvRFU+JXlLt7TXOauy5FXht+/2y2v/h2q6SgEoImUQLqWGDKDfY?=
 =?us-ascii?Q?svo+/JkBxjmWpk9O+aPdmv0Pb4dfhewobLZSUxsTI37IB3M6mK7iGc2lI83G?=
 =?us-ascii?Q?ma6DR/9cVPZxB/trrINZvfnlmYNmApgzb22Jqdfm7RJ/0A5JObFEsmYpBD3a?=
 =?us-ascii?Q?xEYGDhLk7QTYl0HoEylsya1GECdXzOsOVCL3dEHRY5w1I6Tf1kEjE5+kFXhy?=
 =?us-ascii?Q?u24LOQUtypORyKZGfe4bWVwJUzGy0SPHosD2N58qR3Oq1cZTyLQ+bIeCEWib?=
 =?us-ascii?Q?F9NU8+K0NUTHPnhnlCS8Zm8w4CzDI09zpAJHcxDBOEw0NM3plDU22Sg4MhEI?=
 =?us-ascii?Q?TXYyFJvyeoDANwqHnX3Lq/3ut05kPvjlPSEBRkr9tnP5Y0aHfFefDZYpdyTN?=
 =?us-ascii?Q?YqZJfM1QA4kLdJruPNngNkhX37cdst2v+K1m9iZq0psgjYZv670UmWMXeKC7?=
 =?us-ascii?Q?g1N5ua8WeioU6YlQfjw7Z8B5lh+l8zArSFhMtJOsUXvCa67Ag70zo7eUoPxz?=
 =?us-ascii?Q?HEk6qjL7GzjJ0j6ApIsB2soMusxMz51xKBpb7ID+eWOEpBejK9/98v4SwLpo?=
 =?us-ascii?Q?eEfMO62mrCap/SjDmeVrtL/NZRohhx2ISuWHKSaodFJ8j4I3bAyBvkjp2SiP?=
 =?us-ascii?Q?lpqALaDwpSlDtmrhBld59f5go30ywVdynZIznCelHW9Pmy2e93VufLn8j3SN?=
 =?us-ascii?Q?lYM0Lp3PsjSApLdT7HXVfjYjX4fYmUsevL0UN4Kn5f4JWV1KGplsRGbtJXbI?=
 =?us-ascii?Q?9o+7OezcwQ5ch+Q1l+EIzPymVOdEZuD64n9A2/eiFTMNrUgefI5aSg4x1y6S?=
 =?us-ascii?Q?0b2CxNLpbTKEmFtoY6lrFJcMGHW+rODgRbMA6cu/QpgwskBqcZx7tvDu1d+l?=
 =?us-ascii?Q?zx5IoTrQz/NGzX+6B8vaUeOySS51wAfsYjeFgHHBQmLKivIAb7zN0SZMd/0W?=
 =?us-ascii?Q?TD5hqD+9mJVffN8KkVb220q9rYZUiSKkRIul6XwixN1c5KEMEJn681nBMPip?=
 =?us-ascii?Q?iM9hODlO2IvKisLoXZx/cQK+2ur/JIsPUOsWrfamiH9uQiuVKWC8znozh4E3?=
 =?us-ascii?Q?6O8qVhER6fBetY8/sN4GjjbGmL5y4V51mZKTKjhcj6RerbrmhEVAuCgOszyR?=
 =?us-ascii?Q?atTzkBrcz7ZiF1ZMK/puC4CJeCYYGdrwODyUgHlFaTx/fSwJ3amvwI+tcOwc?=
 =?us-ascii?Q?z1TFYj9MueBfcqJ1SntUAGxjkZ8VaoiXkDBBRodb58H7pifGr4ZSun87HizD?=
 =?us-ascii?Q?Sr53ehKPlMhZGFYI89TrCPBY07L9mvz3+b3KS79ktBJpl5sGPgLEQi1SWVUB?=
 =?us-ascii?Q?yQ93PYIHl9E6FcDWnv+pFSrM3W9965zDD4ZT7mczulmTCmAHDuJkSntnq4zq?=
 =?us-ascii?Q?stqWGFyfoHcozci3DaR60mU9z0qQU84AmiQK59+UXs7/34j+8Up6+rN+LPs2?=
 =?us-ascii?Q?bsWD47kF5/cQBA/z213FDI2cAZI41+w=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1c8b54-3f6a-42ad-d0f5-08dee8c54e53
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:18:45.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPgn5nQz5PVa4UUfyD5cFiN4BYiXUhOBgn+jQ4J5yuZju9sGtjbYn09Ll8omLeLr570usi7tL+6SERHkEdwer8p4qDD2TBv7afSIMKZB5uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 14:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241848

Changelog:
https://github.com/seccomp/libseccomp/blob/v2.6.1/CHANGELOG

git log --oneline v2.6.0..v2.6.1:
2f0f3b0e9121 tests: remove the fuzzer from test 62-sim-arch_transactions
7c3f80d95bcc doc: mention EINVAL in seccomp_transaction_start(3)
84005ecc603f hash: fix strict aliasing UB in MurMur hash implementation
dd759e8c4f56 api: fix seccomp_export_bpf_mem out-of-bounds read
8e31cd254be3 github: bump codeql version to @v3
38c524f982d4 gh: bump ubuntu 24.04
311cb32bcc4a tests: Skip tests 60 and 61 on x32
2d0ed0cbcc3b db: propagate notify_used when merging filter collections
7bf87a67bc87 db: Fix tab/space issue with previous commit
1e6797415029 doc: Add seccomp_transaction_start.3 to Makefile.am
c144002c9361 python: fix in-source python builds
4c21f22c31d1 doc: fix a missing CHANGELOG entry from v2.6.0
24033394ad69 tests: Fix shebang for python3
6abe14d1645e python: Fix shebang in setup.py
bcb9d0b35fa1 syscalls: fix s390 at Linux v6.18
792976a12e38 arch: Ignore comment lines in arch-syscall-validate
fea23415b090 syscalls: update syscall table to Linux v7.1.0-rc4
700b140cdd63 db: fix a copy-n-paste typo in _db_tree_add()
2d9db17cc0da bpf: properly reset/clear the bpf_program on error in _bpf_app=
end_blk()
8d1f8a977177 helper: only clear memory on zrealloc() if the buffer grows
dc9fcd66d0c2 bpf: protect against addition overflows when building the filt=
er
4121c0e04116 docs: update the CREDITS file
a81cc2de8ee7 doc: CHANGELOG entry for libseccomp v2.6.1

Drop 0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch [included=
 in dd759e8c4f5685b526638fba9ec4fc24c37c9aec]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...mp_export_bpf_mem-out-of-bounds-read.patch | 37 -------------------
 ...ibseccomp_2.6.0.bb =3D> libseccomp_2.6.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/libseccomp/files/0001-api-fix-secc=
omp_export_bpf_mem-out-of-bounds-read.patch
 rename meta/recipes-support/libseccomp/{libseccomp_2.6.0.bb =3D> libseccom=
p_2.6.1.bb} (94%)

diff --git a/meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_exp=
ort_bpf_mem-out-of-bounds-read.patch b/meta/recipes-support/libseccomp/file=
s/0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch
deleted file mode 100644
index 0d2910846c..0000000000
--- a/meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_export_bpf=
_mem-out-of-bounds-read.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 83a56d74482ef6b6cc9311b14bf9ea23573f5d4e Mon Sep 17 00:00:00 2001
-From: Alyssa Ross <hi@alyssa.is>
-Date: Thu, 13 Feb 2025 12:05:17 +0100
-Subject: [PATCH] api: fix seccomp_export_bpf_mem out-of-bounds read
-
-*len is the length of the destination buffer, but program->blks is
-probably not anywhere near that long.  It's already been checked above
-that BPF_PGM_SIZE(program) is less than or equal to *len, so that's
-the correct value to use here to avoid either reading or writing too
-much.
-
-I noticed this because tests/11-basic-basic_errors started failing on
-musl after e797591 ("all: add seccomp_precompute() functionality").
-
-Upstream-Status: Backport [https://github.com/seccomp/libseccomp/commit/dd=
759e8c4f5685b526638fba9ec4fc24c37c9aec]
-Signed-off-by: Alyssa Ross <hi@alyssa.is>
-Acked-by: Tom Hromatka <tom.hromatka@oracle.com>
-Signed-off-by: Paul Moore <paul@paul-moore.com>
-(imported from commit e8dbc6b555fb936bdfb8ab86f9a45fda96a8b7a2)
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/api.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/api.c b/src/api.c
-index adccef3..65a277a 100644
---- a/src/api.c
-+++ b/src/api.c
-@@ -786,7 +786,7 @@ API int seccomp_export_bpf_mem(const scmp_filter_ctx c=
tx, void *buf,
- 		if (BPF_PGM_SIZE(program) > *len)
- 			rc =3D _rc_filter(-ERANGE);
- 		else
--			memcpy(buf, program->blks, *len);
-+			memcpy(buf, program->blks, BPF_PGM_SIZE(program));
- 	}
- 	*len =3D BPF_PGM_SIZE(program);
-=20
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/rec=
ipes-support/libseccomp/libseccomp_2.6.1.bb
similarity index 94%
rename from meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
index 44260e3032..5db0381ae9 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c13b3376cea0ce=
68d2d2da0a1b3a72c"
=20
 DEPENDS +=3D "gperf-native"
=20
-SRCREV =3D "c7c0caed1d04292500ed4b9bb386566053eb9775"
+SRCREV =3D "a81cc2de8ee7a33633defc88bb8a2d986b421613"
=20
 SRC_URI =3D "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.6;=
protocol=3Dhttps;tag=3Dv${PV} \
-           file://0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.p=
atch \
            file://run-ptest \
            "
=20

