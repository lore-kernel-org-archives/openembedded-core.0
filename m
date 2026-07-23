Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731A6C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:32:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26382.1784820728759597580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=B+nfmCk8;
 spf=pass (domain: est.tech, ip: 40.107.159.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbFkr2wrJ0VVPRPNpoL26/hNQtT9VPoqJuWoNr3xbv7qvnYRVXhdj4sGhrzGTIoklUhJ30gwEXjC34zAX0mxRReXZO1FHZ8ttcyPaFL0hqHKisSUWyLmc75xeMOgaV+7vaFxv+WuLB3B6wYbN69NarBI4R+LQyxP+YB0kKdojHlkpDV0sLs4ue1oolP938uMABYn0UvQyj7LqP/n7PJaioBLRoszWdpo1X8m51ehAr8eVqFTiYqHH4WHvtv998jYuWY+7cJkecTCJrHmdqppIdyU79Q/0X0iHuDYl34rr6FcOG/2AN6CsMdD8jtdy5wb+1Brtot3RbSx1357FHYG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZIyFXQbDGek9AMnrFajKJHJKPqEDjzyIWaK1OOXSFI=;
 b=CQZhXyCW99WJTzSrJy3rdmioB/yaWHaqRM4a7flB2tx71E7mILvG4AMxeNmAi+0z+2nCv6Lqw2LoEFv0VZgEHSkgGRyltbqxkHmeJyAG7ZmAu2NvF2mt0SPsSNQjqIl7g/kp/cjeMI3pLrZo+Y5OD/gONGqnGZyNkxmXkJEE6UcolR9Ze5OaYooBVkxcSYgXW32z3ZPbcozpmB3oeSo87yJ4CCZiEa2RRzdRLyB3byihZ+Gh344AL/by8cVsaaJK1/Y4CVXYlfW6PMhWeQEc6wUIAdxDgnozxRI+2psWSV5WnFmUV6ZhfPefOhQYesBwQqPvarGy9nBODL3aZx+jxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZIyFXQbDGek9AMnrFajKJHJKPqEDjzyIWaK1OOXSFI=;
 b=B+nfmCk8+ZEpGTbgjdb3uY0sHlYGR6SYLF7xHp4WQABrvmXQJfA4jCQb54kqklD6Ul6G+5/V/XhV3/ixhaurA/yJ0E5yzfJoOTWKwN1lvopJ3x+H7WyNG4sO8m44A2LTxvpxNrfSYljchOrwXECkx4ImW3sr9QDQYsnODFkmWqtAQlvie7GNA+RgNoO582U9b8S7CEkbu6pq8tRXtKc7i8FnlNiZ61Si8L4BnoJkOhhi/uB8QJb9noB1TuTvOg7qsoZYtrIXcoqbkg4WgPHqghreOuvI2wTGAtonLktG7gQiwoK+E9i16MMr1rPIV4H/AmSNMAfQ83QtyzLOdNPkeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB2426.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:416::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 15:32:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 15:32:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] libseccomp: upgrade 2.6.0 -> 2.6.1
Date: Thu, 23 Jul 2026 17:31:58 +0200
Message-ID: <20260723153158.18314-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
References: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0004.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB2426:EE_
X-MS-Office365-Filtering-Correlation-Id: fb710c94-3ec6-4c69-902f-08dee8cf8c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+9IT4sEU3pq9c5CitukN/++eyRueXy9ync7oolFOfvqgq5D2uBkz8sS+8Sb3BtWqJYXJt+zdWvbxX+EiBPnb53KAnbJrlqqind1HzybrLQlk7AuU1XxnKjMFhEstZqa0hRlgRpZrvz8T5yDlL2UNQLGJB1ybdQdqoIo49QTAynnTgT1R5b3GHZIjUcgGwlR7WxHGENQIdErI2ykg9NGd9rmKhX4j++LXZaOHxc8YkjhPZA43SYrTbbdoKprZwJ4bMGRrjKyY23GIGbHwZ4SEJJZL+IRbXEJvS0bbuen+iQ0/47HrHB1PrJ1BSbtoI3wN56KOrYV1YRC7GK5Y/Vl9PNpHungylQWAoP5ughP2RhWCUYlE8HqXYem/W/fFF3trtCPTFahe/1JUotoBqgEcINO7yFVhprRGOpdfX/CrGJjDqIuu5tviI9IBCRXhTl1ZyeFtaH6ZQ5O0IqG9dpvlXSz0h25gg6Hk+WAf+ZDcG93meve0Jo6L8FjAu5HovyIKa9Ibpfz/JvcLXJ8odWPB3s6jEXrQcRTViytPgySrxzhDoD8E9bhlasNyEDpDxJKyDDLtiFgSxwIwlzlAunrCsPwS47RK8qiHTLWokDFt6N2dfHEnDgI6kwG/qBxWX1EWAUjtpEVs1UbNFMLqORVKqckbYhy6xkUS9BfPPPkEFBA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bwu6RbtyM1iWI9EPMG9D8RW9294X6AT9YT9DCDg6jdd8oQCWhRsYnauKI4Hn?=
 =?us-ascii?Q?PdwufQo0GGepyXZtN4clyhdWuffUQdg7+ye2DGExZa1UEJvIYsD93hcXU4Jm?=
 =?us-ascii?Q?w+Xzn9UIseA0sb3E5H33k8t7c2VRIsAJHJPttGv/iOaM+ZTrOHpJ2N28fgic?=
 =?us-ascii?Q?acPR8CW9mJiRGycG1oAThT8PnuAUBKmcZztrRuQzbzEVrpbD7e1F84AH92Kn?=
 =?us-ascii?Q?SSNe8LDJkVjb3JkkhBO3l+4TQfKxXdoO8EPLHpXP7VZDnH6v4UuHeNBLK5AL?=
 =?us-ascii?Q?QnAZ8kI7iWhdL8ULqOefwec3qf3ZY3gjE0fPDLE3UIoXFkko0YT/Dxbj5MvQ?=
 =?us-ascii?Q?+wuKGvrlDcenUGbAbJ3XzlnJVwLk9GcYY7Bgl6Upwyq6xBak95jVDkqcv5rm?=
 =?us-ascii?Q?OY4NdTopQ/eStdqRgMx61ZiHkczzAHG3ndbg0Q9DWaATNQiZbpJxTQ5P/aXv?=
 =?us-ascii?Q?XJNkBSgCbQD+kCX3qMKzyxqjIpmvWHkOaHpUZ1aayOBXgbpLOctSUzuAZUXj?=
 =?us-ascii?Q?hXYEVrpnEzb0w7sJdLFG0BRMnal1nszPOqsfUM1Cwg1MgVvLxRmFVn4LYg7b?=
 =?us-ascii?Q?q2LMJWp+V3ahYXthHkzD3jKvoXqWgY2csJMXDwj5dntOc6z+H4qJEPWlIbRt?=
 =?us-ascii?Q?bobE5SpPOgWYmx9fvCP0ngmi5AbAaPANxaiG0+JUfXrCmKilFFEFuxeuQ+oh?=
 =?us-ascii?Q?7cUKF2AvN/Yd/q0lKk7V1LPaOLMtxfbuUyRvHW/CoCGJbusWIfg5fuXP0YGP?=
 =?us-ascii?Q?p1wEnuizwsrNjq2RR6RePCwAtL96DDZz/CsLAI+OuXneu3kOFDvlEAW7Tuh4?=
 =?us-ascii?Q?3k7HuoyrJpwqOQMyMFe9arMjUmqW588b6XTTKouxFhxKRJq1+lLqsjVrsq1e?=
 =?us-ascii?Q?WoizJZMmChttRsje8LZe2G5Ymqav+JOeCqGAUsOsECS03HCi9Z84gNV08B2F?=
 =?us-ascii?Q?8u1izNuuAEaIbOH/7nJQ0NTYbXRko7kwxuaz5PFQhExpyuDiIs7xls77RJBS?=
 =?us-ascii?Q?/c+7w37OjgDd5D5HtVX2klmdE5/FTzkgVDZv9nr+a6gLez1WK8kjNTc7lknr?=
 =?us-ascii?Q?7Fyl/AClGt0GQtqPz1zFDFzNERxW5wbmhnMQXEA/1VN9IcQmXWw/l+j1nuv5?=
 =?us-ascii?Q?UL9LhbVoaxQiZ9NVvJD85hSIulFVO4N8iEQW7+iUo4gdmJ59wwrmTFiUObix?=
 =?us-ascii?Q?5zmdVzPlF9jAqC6p1DretIyAeIUuqhcR3/JI2eM+au1EjpftnAOjJ3yrSB75?=
 =?us-ascii?Q?MwH9zPKLVqCCidsZiqOwlR3i2JogFgwZqx3L73hN1lnhrdiuBtZz9hA/dtmC?=
 =?us-ascii?Q?COiUyOLesTWbl8b4plAeF8QPDLirQbtoHdjHM8wrP1QUhJ9f28akVklTRva0?=
 =?us-ascii?Q?4fSvjzSM+F4xbIYWIP8r9i/cYa7EvrT5qApw94HHs2PQ1tRG1I13IpGQSoG9?=
 =?us-ascii?Q?wpXjT83/LK8orvKekHZMFaTwNqVoCo5xlrq9WqDXFK2whWjb11Xbq83F8Oxm?=
 =?us-ascii?Q?OgEdpP01IYv/fPbw/R7SWoEJv28C/hGQhmQgQ7Zspgv8wLTuCHx6PphlZhAv?=
 =?us-ascii?Q?6qScxj2iKNv40px4O66MOHLkoc/iIwSx2NwRYNIsFB7jqFYl85R5XvIjBs40?=
 =?us-ascii?Q?ZU/p5EVx/pgy5J4rMpBv+SmFIPS3N8InPifEExGixtEKqzgQCRCxHRbQOTFd?=
 =?us-ascii?Q?1tolK3u5D80PUwXJno7CpmMJEe33pJFkyDNpW2X9WeGCth1PpPyrELT2qGMh?=
 =?us-ascii?Q?be8cP7cakaxF6mzLToAI18Fmy5YkFk0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fb710c94-3ec6-4c69-902f-08dee8cf8c27
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:32:04.1819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBAq8jxEtkERa8S00Y+Yt4KscJiVcNyNvxxMWDg4Dgdr/jiL/kbWSLkybzjBuVSlSoynAkVCfWd/jka5Sdvw9kanrLkwn6c54fl9pQFkXkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241858

Changelog:
https://github.com/seccomp/libseccomp/blob/v2.6.1/CHANGELOG

git log --oneline v2.6.0..v2.6.1:
2f0f3b0e9121 tests: remove the fuzzer from test 62-sim-arch_transactions
7c3f80d95bcc doc: mention EINVAL in seccomp_transaction_start(3)
84005ecc603f hash: fix strict aliasing UB in MurMur hash implementation
dd759e8c4f56 api: fix seccomp_export_bpf_mem out-of-bounds read
8e31cd254be3 github: bump codeql version to v3
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

Note: GitHub-style username tag removed from upstream log entry to
avoid unintended notifications on mirrored repos.

Drop 0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch [included=
 in dd759e8c4f5685b526638fba9ec4fc24c37c9aec]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
- Removed GitHub-style username tag from upstream log entry to avoid
  unintended notifications on mirrored repos.
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

