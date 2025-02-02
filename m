Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A62C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 15:53:33 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.66372.1738511607896567310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 07:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gcyLz2xE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250202155324f06483cbd00e001b75-fzqqq9@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250202155324f06483cbd00e001b75
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Feb 2025 16:53:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/T7st5ZvBVPQ8PcPC1N6OcIXNue5ZrnpfddeoXcRdSs=;
 b=gcyLz2xE9u0PpnIxU05X5+DIWFbqowTkKp8ZBa8yQNIa6E4YhVdoY8TwK36H3hdbSmwfTP
 a2N9igCIHkdb3nI0l0wxEEt7OVUWrMjmfojmT2o8yhHiTL30t0kFkAIFE3NAkVjimvbAqTSI
 5Lw6gqrXFD18pdFaMkNboG999TwI7P3IPQLmapfRWjNrJSr1GHDvm738ZlTU8h0UFR7BJUev
 QN/ff30NsPRvFtRo4irEuvGFHUKfEadw/el/EGKsnw0gdoc0Wy5cWxKhkmmeWr51SxrXR9BY
 m+U8HY9c3gv1gVFC7lUWhDia4DEWmld8B6ktkt+TPVuAnz0D1KGFmkqQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Sun,  2 Feb 2025 16:52:31 +0100
Message-Id: <20250202155231.2086946-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 15:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210621

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-0395

git log:
662516aca8 stdlib: Test using setenv with updated environ [BZ #32588]
1432850ad8 malloc: obscure calloc use in tst-calloc
c1f7bfbe08 Hide all malloc functions from compiler [BZ #32366]
808a84a8b8 Fix underallocation of abort_msg_s struct (CVE-2025-0395)
994b129a35 x86/string: Fixup alignment of main loop in str{n}cmp-evex [BZ #32212]
61daaa7639 x86: Improve large memset perf with non-temporal stores [RHEL-29312]
2c8a7f14fa x86: Avoid integer truncation with large cache sizes (bug 32470)
2c882bf9c1 math: Exclude internal math symbols for tests [BZ #32414]
51da74a97e malloc: add indirection for malloc(-like) functions in tests [BZ #32366]
aa8768999e Pass -nostdlib -nostartfiles together with -r [BZ #31753]
350db28393 nptl: initialize cpu_id_start prior to rseq registration
9a0e174a39 nptl: initialize rseq area prior to registration

test results:
            Before After  Diff
FAIL           208   210    +2
PASS          4906  4905    -1
UNSUPPORTED    230   230     0
XFAIL           16    16     0
XPASS            4     4     0

failed test changes:
- nptl/tst-mutexpi8-static
- stdlib/tst-qsort4
+ malloc/tst-dynarray-fail-mem
+ malloc/tst-malloc_info
+ malloc/tst-malloc_info-malloc-check
+ malloc/tst-malloc_info-malloc-hugetlb2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b3b21bd07d..da9227ccca 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "dcaf51b41e259387602774829c45222d0507f90a"
+SRCREV_glibc ?= "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 2484ae1cd9..8373db2c4f 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

