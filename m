Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A80C4321E
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 01:37:38 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.59225.1640828257192748060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BU1bZXS025267
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BU1bU84016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:35 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Dec 2021 17:37:30 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Dec 2021 17:37:30 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/5] valgrind: ptests
Date: Wed, 29 Dec 2021 17:37:25 -0800
Message-ID: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 01:37:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160054

Tested on khem's glibc upgrade branch:
   https://git.yoctoproject.org/poky-contrib/log/?h=kraj/poky-next
and poky master (
   9b99eb9e36 tzdata: Remove no longer relevant RCONFLICTS:${PN}

Summary:

Work-around a glibc upgrade error in a way that also works for glibc-2.34 on master.
Fix up some ptest warnings and temporarily skip the boost_thread test for arm64.


Results:

On the branch currently known as master, the ptest summary is:

qemux86-64:

=== Test Summary ===
TOTAL: 730
PASSED: 711
FAILED: 0
SKIPPED: 19
DURATION: 1052
END: /usr/lib/valgrind/ptest
2021-12-29T23:12
STOP: ptest-runner
TOTAL: 1 FAIL: 0


qemuarm64:

TOTAL: 415
PASSED: 395
FAILED: 0
SKIPPED: 20
DURATION: 4521
END: /usr/lib/valgrind/ptest
2021-12-30T00:33
STOP: ptest-runner
TOTAL: 1 FAIL: 0

and the output from running: ptest-runner valgrind has no superfluous warnings:

root@qemuarm64:~# ptest-runner -l  
Available ptests:                      
strace  /usr/lib/strace/ptest/run-ptest       
valgrind        /usr/lib/valgrind/ptest/run-ptest
root@qemuarm64:~# ptest-runner valgrind
START: ptest-runner                            
2021-12-29T23:18                             
BEGIN: /usr/lib/valgrind/ptest       
Hide valgrind tests that are non-deterministic
Reported at https://bugs.kde.org/show_bug.cgi?id=430321
Aarch64: Hide valgrind tests that result in defunct process and then out of memory
Run non-deterministic tests using taskset to limit them to a single core.
PASS: gdbserver_tests/mcblocklistsearch          
PASS: gdbserver_tests/mcbreak 
...
PASS: none/tests/vgprintf
PASS: none/tests/vgprintf_nvalgrind

...checking makefile consistency
...checking header files and include directives
Restore non-deterministic tests
Aarch64: Restore valgrind tests that result in defunct process and then out of memory
Restore valgrind tests that are non-deterministc
Failed test details...
=== Test Summary ===
TOTAL: 415
PASSED: 395
FAILED: 0
SKIPPED: 20
DURATION: 4521
END: /usr/lib/valgrind/ptest
2021-12-30T00:33
STOP: ptest-runner
TOTAL: 1 FAIL: 0


../Randy


Randy MacLeod (5):
  valgrind: Add util-linux-taskset ptest dependency
  valgrind: backport rseq work-around
  valgrind: remove duplicate and skipped tests from remove-for-aarch64
  valgrind: skip boost_thread for aarch64 ptests
  valgrind: make run-ptest better

 ...plement-linux-rseq-syscall-as-ENOSYS.patch | 198 ++++++++++++++++++
 .../valgrind/valgrind/remove-for-aarch64      |   9 +-
 .../valgrind/valgrind/run-ptest               |  23 +-
 .../valgrind/valgrind_3.18.1.bb               |   4 +-
 4 files changed, 216 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch

-- 
2.31.1


