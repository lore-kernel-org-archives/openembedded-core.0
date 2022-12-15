Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FAEC46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.143551.1671132072200312332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jMqyqdLm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so108602pjo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnNzPWvRzX/fqhuu0FRrDh4UjSinyJlwvDgtBlVYy8M=;
        b=jMqyqdLmArRhTf0HVtkcXCFvZ0lg7CDQH7kych+rQ/UOqYDEmkQlcMUT0SDqSXulX4
         SsV/c1fT0mjL4d0HYF7DcPVTkS8UdRRiEgZ9MoMlhzFbB2b0cvYdxUvfIy4z5JcVHdAE
         79RnMLmaK3KfWdPPQFdlC7wkA3qxo3EB4TN5GiUNbIRYwuTWm49rTzdgmLF16S6f/dVU
         POZdrft/ZW8xr9ZbAdg2oYDYErH2Yv46IlllernKZyRPQGxYD7HMlw/fWDGLdmCVcg5D
         8QEK6QNWkNo59VLTDWR8FINQPDrb5nQvBtUelF4iLeVI4nJYoe73HNopDutyLl1ws3tN
         m4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnNzPWvRzX/fqhuu0FRrDh4UjSinyJlwvDgtBlVYy8M=;
        b=vI7BkLBddH3aWuP67G1b6iyqu/1Cg52I+eS30zE3QssmK5Zk3wwAJWpRoVdrUbf3V4
         ifurS+/bvQknmfTepX0i+sykysaKfQ56H2qN9TRQAhIpc+EhLTnF9A4WNJYMejGvSEyi
         xTTqDvt+jIfueGG7+4zzMYK4OVBGOWmNedMRXmwUaoPR3a67KaZU+YnLPuMIo0B9N4Di
         f23BBtdhcwnk+z0IGByw8D5skqjIWFY/Zs+0ZkOwhOVhlX9n7YvU97jyscp6ehlREZ39
         6VkYNWRZF+Bl5Mx9QOjxMXtrHf/AgFemDNAX1m6v/ZTpD69OApohCejoHSMy4NDIYKY4
         /CBw==
X-Gm-Message-State: ANoB5plILm8bI/UQArpuA2YjCy5JlS0Y1VEoMLVQDwGeFe2hIROJvOFp
	nGss0A1NTgrtpDuv4DSWJayTbmDHfMbCocRWgdA=
X-Google-Smtp-Source: AA0mqf7j3P8K9F4paA8ALmKpVpDss4mRZZmNHwIiOcmyh3yzAVgbcKor1PaH0cOBRS7dQqxnZUnGjQ==
X-Received: by 2002:a17:903:120c:b0:186:8d78:740c with SMTP id l12-20020a170903120c00b001868d78740cmr46190727plh.6.1671132077672;
        Thu, 15 Dec 2022 11:21:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/30] valgrind: remove most hidden tests for arm64
Date: Thu, 15 Dec 2022 09:20:33 -1000
Message-Id: <1a829e1b0caec9b49cfec0cbad46b777feb00b2d.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174601

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

An earlier version of valgrind fixed the defunct processes bug, so those
tests that were skipped specifically for arm can pass now in master,
kirkstone, honister, hardknott, and dunfell.

Detailed test result with remove-for-aarch64 skipped on qemuarm64:

    Commit           Pass   Fail    Skip
    master           624    9       21
    kirkstone        618    10      20
    honister         616    10      19
    hardknott        609    13      18
    dunfell          598    16      17
    zeus             Out of memory: Killed (with many defunct processes)

There are now only 12 skipped by remove-for-aarch64 because 9 fail on
qemuarm64 and 3 more fail on raspberry pi. These are tracked by:
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=14960

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cbeb9418c43ec834868aa65b774dc09e983d26d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../valgrind/valgrind/remove-for-aarch64      | 227 +-----------------
 1 file changed, 3 insertions(+), 224 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 887bfd2766..a9809e5d8c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,211 +1,6 @@
 gdbserver_tests/hgtls
-cachegrind/tests/ann1
-callgrind/tests/simwork1
-callgrind/tests/simwork2
-callgrind/tests/simwork3
-callgrind/tests/simwork-both
-callgrind/tests/simwork-cache
-callgrind/tests/threads
-callgrind/tests/threads-use
-drd/tests/annotate_barrier
-drd/tests/annotate_barrier_xml
-drd/tests/annotate_hbefore
-drd/tests/annotate_hb_err
-drd/tests/annotate_hb_race
-drd/tests/annotate_ignore_read
-drd/tests/annotate_ignore_rw
-drd/tests/annotate_ignore_rw2
-drd/tests/annotate_ignore_write
-drd/tests/annotate_ignore_write2
-drd/tests/annotate_order_1
-drd/tests/annotate_order_2
-drd/tests/annotate_order_3
-drd/tests/annotate_publish_hg
-drd/tests/annotate_rwlock
-drd/tests/annotate_rwlock_hg
-drd/tests/annotate_sem
-drd/tests/annotate_smart_pointer
-drd/tests/annotate_smart_pointer2
-drd/tests/annotate_spinlock
-drd/tests/annotate_static
-drd/tests/annotate_trace_memory
-drd/tests/annotate_trace_memory_xml
-drd/tests/atomic_var
-drd/tests/bar_bad
-drd/tests/bar_trivial
-drd/tests/boost_thread
-drd/tests/bug-235681
-drd/tests/bug322621
-drd/tests/circular_buffer
-drd/tests/concurrent_close
-drd/tests/custom_alloc
-drd/tests/custom_alloc_fiw
-drd/tests/dlopen
-drd/tests/fork-parallel
-drd/tests/fork-serial
-drd/tests/fp_race
-drd/tests/fp_race2
-drd/tests/fp_race_xml
-drd/tests/free_is_write
-drd/tests/free_is_write2
-drd/tests/hg01_all_ok
-drd/tests/hg02_deadlock
-drd/tests/hg03_inherit
-drd/tests/hg04_race
-drd/tests/hg05_race2
-drd/tests/hg06_readshared
-drd/tests/hold_lock_1
-drd/tests/hold_lock_2
-drd/tests/linuxthreads_det
-drd/tests/matinv
-drd/tests/memory_allocation
-drd/tests/monitor_example
-drd/tests/new_delete
-drd/tests/pth_barrier
-drd/tests/pth_barrier2
-drd/tests/pth_barrier3
-drd/tests/pth_barrier_race
-drd/tests/pth_barrier_reinit
-drd/tests/pth_broadcast
-drd/tests/pth_cancel_locked
-drd/tests/pth_cleanup_handler
-drd/tests/pth_cond_race
-drd/tests/pth_cond_race2
-drd/tests/pth_detached2
-drd/tests/pth_detached3
-drd/tests/pth_detached_sem
-drd/tests/pth_inconsistent_cond_wait
-drd/tests/pth_mutex_reinit
-drd/tests/pth_once
-drd/tests/pth_process_shared_mutex
-drd/tests/pth_spinlock
-drd/tests/pth_uninitialized_cond
-drd/tests/read_and_free_race
-drd/tests/recursive_mutex
-drd/tests/rwlock_race
-drd/tests/rwlock_test
-drd/tests/rwlock_type_checking
-drd/tests/sem_as_mutex
-drd/tests/sem_as_mutex2
-drd/tests/sem_as_mutex3
-drd/tests/sem_open
-drd/tests/sem_open2
-drd/tests/sem_open3
-drd/tests/sem_open_traced
-drd/tests/sem_wait
-drd/tests/sigalrm
-drd/tests/sigaltstack
-drd/tests/std_atomic
-drd/tests/std_string
-drd/tests/std_thread
-drd/tests/std_thread2
-drd/tests/str_tester
-drd/tests/tc01_simple_race
-drd/tests/tc02_simple_tls
-drd/tests/tc03_re_excl
-drd/tests/tc04_free_lock
-drd/tests/tc05_simple_race
-drd/tests/tc06_two_races
-drd/tests/tc07_hbl1
-drd/tests/tc08_hbl2
-drd/tests/tc10_rec_lock
-drd/tests/tc11_XCHG
-drd/tests/tc12_rwl_trivial
-drd/tests/tc13_laog1
-drd/tests/tc15_laog_lockdel
-drd/tests/tc16_byterace
-drd/tests/tc17_sembar
-drd/tests/tc18_semabuse
-drd/tests/tc19_shadowmem
-drd/tests/tc21_pthonce
-drd/tests/tc22_exit_w_lock
-drd/tests/tc23_bogus_condwait
-helgrind/tests/annotate_rwlock
-helgrind/tests/annotate_smart_pointer
-helgrind/tests/bar_bad
-helgrind/tests/bar_trivial
-helgrind/tests/bug322621
-helgrind/tests/cond_init_destroy
-helgrind/tests/cond_timedwait_invalid
-helgrind/tests/cond_timedwait_test
-helgrind/tests/free_is_write
-helgrind/tests/hg01_all_ok
-helgrind/tests/hg03_inherit
-helgrind/tests/hg04_race
-helgrind/tests/hg05_race2
-helgrind/tests/hg06_readshared
-helgrind/tests/locked_vs_unlocked1_fwd
-helgrind/tests/locked_vs_unlocked1_rev
-helgrind/tests/locked_vs_unlocked2
-helgrind/tests/locked_vs_unlocked3
-helgrind/tests/pth_barrier1
-helgrind/tests/pth_barrier2
-helgrind/tests/pth_barrier3
-helgrind/tests/pth_destroy_cond
-helgrind/tests/rwlock_race
-helgrind/tests/rwlock_test
-helgrind/tests/shmem_abits
-helgrind/tests/stackteardown
-helgrind/tests/t2t_laog
-helgrind/tests/tc01_simple_race
-helgrind/tests/tc02_simple_tls
-helgrind/tests/tc03_re_excl
-helgrind/tests/tc04_free_lock
-helgrind/tests/tc05_simple_race
-helgrind/tests/tc06_two_races
-helgrind/tests/tc06_two_races_xml
-helgrind/tests/tc07_hbl1
-helgrind/tests/tc08_hbl2
-helgrind/tests/tc09_bad_unlock
-helgrind/tests/tc10_rec_lock
-helgrind/tests/tc11_XCHG
-helgrind/tests/tc12_rwl_trivial
-helgrind/tests/tc13_laog1
-helgrind/tests/tc14_laog_dinphils
-helgrind/tests/tc15_laog_lockdel
-helgrind/tests/tc16_byterace
-helgrind/tests/tc17_sembar
-helgrind/tests/tc18_semabuse
-helgrind/tests/tc19_shadowmem
-helgrind/tests/tc20_verifywrap
-helgrind/tests/tc21_pthonce
-helgrind/tests/tc22_exit_w_lock
-helgrind/tests/tc23_bogus_condwait
-helgrind/tests/tc24_nonzero_sem
-memcheck/tests/accounting
-memcheck/tests/addressable
-memcheck/tests/arm64-linux/scalar
-memcheck/tests/atomic_incs
-memcheck/tests/badaddrvalue
-memcheck/tests/badfree
-memcheck/tests/badfree-2trace
-memcheck/tests/badfree3
-memcheck/tests/badjump
-memcheck/tests/badjump2
-memcheck/tests/badloop
-memcheck/tests/badpoll
-memcheck/tests/badrw
-memcheck/tests/big_blocks_freed_list
-memcheck/tests/brk2
 memcheck/tests/dw4
-memcheck/tests/err_disable4
-memcheck/tests/err_disable_arange1
-memcheck/tests/leak-autofreepool-5
-memcheck/tests/linux/lsframe1
-memcheck/tests/linux/lsframe2
-memcheck/tests/linux/with-space
-memcheck/tests/origin5-bz2
-memcheck/tests/origin6-fp
-memcheck/tests/partial_load_dflt
-memcheck/tests/pdb-realloc2
-memcheck/tests/sh-mem
-memcheck/tests/sh-mem-random
-memcheck/tests/sigaltstack
-memcheck/tests/sigkill
-memcheck/tests/signal2
-memcheck/tests/threadname
-memcheck/tests/threadname_xml
-memcheck/tests/unit_oset
+memcheck/tests/leak_cpp_interior
 memcheck/tests/varinfo1
 memcheck/tests/varinfo2
 memcheck/tests/varinfo3
@@ -213,21 +8,5 @@ memcheck/tests/varinfo4
 memcheck/tests/varinfo5
 memcheck/tests/varinfo6
 memcheck/tests/varinforestrict
-memcheck/tests/vcpu_bz2
-memcheck/tests/vcpu_fbench
-memcheck/tests/vcpu_fnfns
-memcheck/tests/wcs
-memcheck/tests/wrap1
-memcheck/tests/wrap2
-memcheck/tests/wrap3
-memcheck/tests/wrap4
-memcheck/tests/wrap5
-memcheck/tests/wrap6
-memcheck/tests/wrap7
-memcheck/tests/wrap8
-memcheck/tests/wrapmalloc
-memcheck/tests/wrapmallocstatic
-memcheck/tests/writev1
-memcheck/tests/xml1
-memcheck/tests/linux/stack_changes
-memcheck/tests/linux/timerfd-syscall
+helgrind/tests/hg05_race2
+helgrind/tests/tc20_verifywrap
-- 
2.25.1


