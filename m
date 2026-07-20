Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43801C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:26:39 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7781.1784550392338451992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U3i9Eph0;
 spf=pass (domain: est.tech, ip: 52.101.70.24, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4t/AKdb1Gk/3LOa1vMRMtzKWlhqIJS8WFfs0n/BCN+yZnk15q2UTElWNk3fQSY1v6mpUWar+yLK8SYiRQuhYi0XbMcjj7Zb5AjCcfQ9y8Be4nFtJ5Cl5pThhwTBqtrNexyyW35dLfNsy62ZTXJTnxlVfJ+avfKLTHDWNWMNzGnqxRimzJxRUxuDYxroQoOgAsS57rIrhOcqCrXhjvnFbhd/qq6kguVSuyflZ4sHXdYt7TvrmLjl2jpCdswnMWiLH8slQ0NHwYp/tgRHAvbqS9j33cuduiV7foS8ck3btjhTMRwo9ICDK8MUWD/i3IKEwzPubrU4eFmNU0zV/dTlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmyPXyRmFC2iSBAORIBqXvncQlpsE78iFUSUUu+dqNM=;
 b=xfFvpDb2oNwnsZXFs3I4YJJzzXVNPwCB10VA4Uq2hI25gmluESMKrer9ACUl/RxxKaXom0pdAtwR6OEYlCj0XWQTdS06iAihtNUm9CsyI6mbtbeQiN9qILsHKNJ/61wwzZjOkkJVXUvcmM6slXutNv+yBM5Ro/2goxPJU8FEwkjE6jhySClYH0AvR1MN0KjgnIYnH/bpQ+sOEcNJnS0bLgxvfKHjM+vOhNnRYjznt7jYTTlxHUIo18Dqqg0A7LMXTTPQ9E6Z9wuH4vzKAwpeN72ZhEIOkpqVmQ/1Q98lJi3Zdycot90E1mKhmo48a1XVEYo8w1Z+pq1Zx+lEmn256Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmyPXyRmFC2iSBAORIBqXvncQlpsE78iFUSUUu+dqNM=;
 b=U3i9Eph0vmrqfpRz2GBHRMTGNV7x+tCCwjGz4EYh2jKlvEXCUnMJGyolY9+pb8W5gZqBzaJzrIvbNngK2iEytGMYdGkOphLCcVm2wuTaZyY9FhestZui6gmO7N3UmFisAfvVn38BYbcuwV2fDSyiKYQT4TZEwKLaB0XEAidLhx/zQ6LRX2aveVvIqGfaBzcssPf9FkoCapW29GJb/pZsCu4FgdXHkYgvINPxTL6VErKoDob4tweaQpJ+8Eehs4y1oxe3c7SUPKuZDvxLNR/vlXup5somnp67gGZrM2wSwblI7nx+Ih3Yd3F5Eba+wdrNeKIRT/hthi6JNIPZN8SjBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by FRWP189MB3439.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 12:26:27 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 12:26:26 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to avoid inode overflow failures
Date: Mon, 20 Jul 2026 14:26:19 +0200
Message-ID: <20260720122619.34696-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::27) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|FRWP189MB3439:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f884a4c-518e-4198-fdfb-08dee65a1e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cycb8k7JzVySkBPgUPI6ydrKKvXTsOibJ54N+i/siGCw04DMpSqVwRNR0Y2KKovikJwo/EOBjcALtBcEhTuyf4gzMBF1DsZ1sOIuiEyc2uZWQmy8+/zWXYsL/7zPvdnYpodL3xrEs7cReGrZl0YXtyxM8k2yma8KDEqmO3vw/74qBvbf6+9mwSCykcAAOJLhFDrLUcO88lr9B3yZCW39wljJVb0x1f44AabuK19yCWmvmNdAO0nqzSG+bUjCSfoidgAMbvsNI+Bd3pXJvslfyeqweA7chGLu5wfX923+9FYVZ9Ptw5R54/JKUlJyJA2W/wdq3b+LzEn3YFAw8PugzvNcb/vkj/pMuMKKCCjR3uTqJ7rixZklRj3Gl2nzH1TdeqoQhEdxEE3aLX++E2HFFRRm6+GlH7RYEzy1GWH8LdvQCqYwi5/PIuSP1yk8pGIQIG6pH4jZY5vEv3632yfovg/xLj2HkJOAgSijcShaiH29shkoEfzGNsd4Mo8SVxdXGgo4XoZuqMlL4bLwDcgs9LGDiQgxSPvsj5ir424dcezfqu01IxhcqdHwBdTj7dlr2J8M1HwbiQKf8fsE/FcXQ2JChAk7MkQohCH050nFTEM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NNYD8v2nx7LP2+n5VhLiJ9WUXEeopC3XuiWwoHXQVuK6+Qkmon0Pyfbsoe/T?=
 =?us-ascii?Q?NezojEJwd9oB9F7WKoa7KHod5susMfgud53kCmolWUFwJviToPITHc2EwaPY?=
 =?us-ascii?Q?LkycxMXqjAen36+hUfj6fiFUE6qRgdOwz4bbB5VFyK18oPHNHzzVQDaMuOIx?=
 =?us-ascii?Q?oT6Aijf0StUg4tht5niSyy96w8TnlR8UIk0O7gcM+vJiUmyrxno3Sq9NC1DZ?=
 =?us-ascii?Q?2Cq0dM6nZtvCsJ2Wp0X7UD7FFuPYmIwt/rjf3W3brCQ5RNCPxpijntoOkof/?=
 =?us-ascii?Q?qi5p7gfEqLVAJdiqc6txGLVV+iIXvAivX+Lfks8H5X3TKDLsNKVtbpUTCX31?=
 =?us-ascii?Q?vnEt8hTfRlYV5/JOdhOkou7SUfH3Ir/ojxC3CJn4QfdVVEeaLuu5LQd7+Idi?=
 =?us-ascii?Q?4v1g0EjFVR9Z8oSjwxletxR1GMr4voX1D8yiNTSmfsbERgfc0GVxhGeaScgd?=
 =?us-ascii?Q?t+rPjO3H30FDSck9LaakzuqTD5ApfK6hLipAjjREDWsQNz72FP7f9QpBJCLM?=
 =?us-ascii?Q?kSGPzdXnRV5V9vcdwTGbXr9TGfR2smrqsIJrTUOuzz7W3UWId4oVGTUGCMa6?=
 =?us-ascii?Q?ayIPPwKZDtRtCXmwC3ay0wYmE+Zip0gGU5LjTHEG9TTRVJIufHy912T3u6l3?=
 =?us-ascii?Q?i4mxUkC8gmlnYzmVXFZLMuurcKTQYLdSB9tV2n6CFqV+3PSabcbjbcV+9CAw?=
 =?us-ascii?Q?bthrf0X8rMFxXcdoel57kFunuGQ4Q++IScbKgjj19JV9z52Z5WlfMhaLXfnY?=
 =?us-ascii?Q?ivCwK6EJt6BOvyPREZA9vMp1BSWaHHpLGmLp6KP6S1i8gg2ch4DQ6ufdo9zY?=
 =?us-ascii?Q?YNtohPaodkaP8MO2OOuwpUv7HAt00AaaJhxbPrhtR+OFhtVVOgxFK4w6l9/m?=
 =?us-ascii?Q?gn2uMQVhCa9sr5cqrSDoDhym8ez99LLWFEYtz1visSGVX425NJVAOyY4uOqQ?=
 =?us-ascii?Q?h3wHbFGHD8zYzgsvaYGRNQ6otxWM1KLu1BwfXU9dHSrnD0gK8Okcnb/MiR66?=
 =?us-ascii?Q?65yihUhESeSWmNJOmKDSblX1wEQ90k9GxUcUHGkkyaXlgcqnE5ONkrRrEQu5?=
 =?us-ascii?Q?i2yOG1R+lQ8G2/y4V+QgQiO5qZ/5Io2RL6GnzATFhJ6ppktFslhTeI0sO3Sk?=
 =?us-ascii?Q?aw0kpa4yt0/mRoqt8gTuX4r3Z1miZE9Wv1mXFIhmwHgK6S9I5qguTCbVNMxO?=
 =?us-ascii?Q?vr83zU6XScJlXYaogk41Slss9o7ikCrdLq2a08DzdSik7bJ4Td+nbzyEcb/I?=
 =?us-ascii?Q?CE557QIbsHkv69wk67AA9Cp8Kk6QXYbESF1lLDv8i8psTB6DcwmT1r4ZvLHd?=
 =?us-ascii?Q?3IABmbS+1R9dr2ngSqlwGf8/NV0Yf9bOxdzo8M61t7N1JUBR5DFg7M8IGAwp?=
 =?us-ascii?Q?o0TfQCch9b5X2ONaG5MwmeNnND/UAmICAOG5TlshrsdQ+slZ9JG+p5DZ3uZx?=
 =?us-ascii?Q?bbAeTa5c3AIrjbb0tB/Ns4EHlZ4NbH9A5GoEbKRkL879BZ4Y3hjKiSemJ8wq?=
 =?us-ascii?Q?Z0jOokdOF/HnhbOwQpBMSzrCKhQss+Y1nj2bAhVjqzDYVOeIQrNuKps4m+un?=
 =?us-ascii?Q?p6v6gjb0rpxH5y1PZthRQTfklsT/W2YxdgLcYxMkH8XszvvX9VCDp/hzLFvi?=
 =?us-ascii?Q?Jv/ZOSZlZkFAh9Ef+9gd6a/KQIa3lfhG1TAJgEWPZqAYKYagdxvrNCT1AkKV?=
 =?us-ascii?Q?PR0JCbgoZAtLkv1gHtu857k0PGR+WK9OL16GWu4xeCOEIkVI2sqMoAKJG2d5?=
 =?us-ascii?Q?gXnAQJvpaA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f884a4c-518e-4198-fdfb-08dee65a1e5d
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 12:26:26.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXKbl2DwizKrEjAAuA3Ebswb9VF6Hv4dvVJJztuzWILfHPOAkb/93LN8NEr3Rtc0o7b7ZJ9Yv3zkFX9Op9RMZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3439
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241390

The bsdcpio_test odc/newc format tests verify archive headers byte-by-byte
including inode and device numbers. On ext4 root filesystems (particularly
qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit
or newc 8-hex-digit field widths, causing intermittent assertion failures
in test_format_newc and test_option_c.

Run all tests from a tmpfs working directory where inode numbers always
start small, avoiding the overflow condition.

[YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16231

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../libarchive/libarchive/run-ptest              | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
index d6b4c3f934..7f61e1b173 100755
--- a/meta/recipes-extended/libarchive/libarchive/run-ptest
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -1,13 +1,24 @@
 #!/bin/sh
=20
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
+
 # The fuzz tests run 1000 randomised iterations per archive format and are
 # meant for dedicated fuzzing infrastructure, not routine ptest runs. They
 # regularly time out in the time/memory constrained autobuilder QEMU targe=
ts
 # (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.
 export SKIP_TEST_FUZZ=3D1
=20
+# The bsdcpio odc/newc format tests verify archive headers byte-by-byte
+# including inode and device numbers. On ext4 root filesystems inode numbe=
rs
+# can exceed the odc 6-octal-digit (262143) or newc 8-hex-digit (429496729=
5)
+# field widths, causing intermittent assertion failures. Run all tests fro=
m
+# a tmpfs where inode numbers start fresh and small.
+WORKDIR=3D$(mktemp -d)
+mount -t tmpfs tmpfs "$WORKDIR"
+cd "$WORKDIR"
+
 for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
-    ./$t
+    "$PTEST_DIR"/$t
     if [ $? -eq 0 ]; then
         echo "PASS: $t"
     else
@@ -15,3 +26,6 @@ for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_=
test bsdunzip_test; do
     fi
 done
=20
+cd /
+umount "$WORKDIR"
+rmdir "$WORKDIR"
--=20
2.34.1


