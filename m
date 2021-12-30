Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D04C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 01:37:38 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.59364.1640828257192225122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BU1baHg025271
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BU1bU87016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:35 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Dec 2021 17:37:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 17:37:30 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Dec 2021 17:37:30 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] valgrind: remove duplicate and skipped tests from
 remove-for-aarch64
Date: Wed, 29 Dec 2021 17:37:28 -0800
Message-ID: <20211230013730.129852-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
References: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 01:37:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160053

The valgrind ptest script warns about tests such as:
   mv: cannot stat 'drd/tests/bar_bad_xml.vgtest': No such file or directory

Since these tests were either in both remove-for-* lists or
were not installed since they fail everywhere as noted in:
   85a0d61025 valgrind: fix the remaining ptest failures
   984ffe3ab4 valgrind: Disable leak_cpp_interior test
remove them from the remove-for-aarch64 list

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 440e8bec31..ef48458c3b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -32,7 +32,6 @@ drd/tests/annotate_trace_memory
 drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
 drd/tests/bar_bad
-drd/tests/bar_bad_xml
 drd/tests/bar_trivial
 drd/tests/bug-235681
 drd/tests/bug322621
@@ -66,7 +65,6 @@ drd/tests/pth_barrier2
 drd/tests/pth_barrier3
 drd/tests/pth_barrier_race
 drd/tests/pth_barrier_reinit
-drd/tests/pth_barrier_thr_cr
 drd/tests/pth_broadcast
 drd/tests/pth_cancel_locked
 drd/tests/pth_cleanup_handler
@@ -109,7 +107,6 @@ drd/tests/tc05_simple_race
 drd/tests/tc06_two_races
 drd/tests/tc07_hbl1
 drd/tests/tc08_hbl2
-drd/tests/tc09_bad_unlock
 drd/tests/tc10_rec_lock
 drd/tests/tc11_XCHG
 drd/tests/tc12_rwl_trivial
@@ -174,7 +171,6 @@ helgrind/tests/tc21_pthonce
 helgrind/tests/tc22_exit_w_lock
 helgrind/tests/tc23_bogus_condwait
 helgrind/tests/tc24_nonzero_sem
-helgrind/tests/tls_threads
 memcheck/tests/accounting
 memcheck/tests/addressable
 memcheck/tests/arm64-linux/scalar
@@ -194,13 +190,11 @@ memcheck/tests/dw4
 memcheck/tests/err_disable4
 memcheck/tests/err_disable_arange1
 memcheck/tests/leak-autofreepool-5
-memcheck/tests/leak_cpp_interior
 memcheck/tests/linux/lsframe1
 memcheck/tests/linux/lsframe2
 memcheck/tests/linux/with-space
 memcheck/tests/origin5-bz2
 memcheck/tests/origin6-fp
-memcheck/tests/overlap
 memcheck/tests/partial_load_dflt
 memcheck/tests/pdb-realloc2
 memcheck/tests/sh-mem
@@ -208,7 +202,6 @@ memcheck/tests/sh-mem-random
 memcheck/tests/sigaltstack
 memcheck/tests/sigkill
 memcheck/tests/signal2
-memcheck/tests/supp_unknown
 memcheck/tests/threadname
 memcheck/tests/threadname_xml
 memcheck/tests/unit_oset
@@ -236,5 +229,4 @@ memcheck/tests/wrapmallocstatic
 memcheck/tests/writev1
 memcheck/tests/xml1
 memcheck/tests/linux/stack_changes
-gdbserver_tests/hginfo
 memcheck/tests/linux/timerfd-syscall
-- 
2.31.1


