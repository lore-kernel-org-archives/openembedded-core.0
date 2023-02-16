Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60900C6379F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:35:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.5823.1676536556587193536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v4kAfUz2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536554; i=@fujitsu.com;
	bh=m8ETITwcPLwGjUejNH59Rs38uvWFiTc1c17auwKo6+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v4kAfUz24aDVC1nWBmDE62cHlW/6Rhg+t84/zft9fCY2kEg87jSPfX9mRg0Ig7r2l
	 U0mq7YAtSbVahmeLNiWC24zvJbGDdopLKqWW2hwNRtQGnpUdrf7TUTfu72JFpviURr
	 nNMYpcZKisfmMOIyxkcV8B3DD8MGe+pZjOT32mWk+AW3Vtd9j9M5+D3tH/StiQGzPu
	 YSpSt0BjXgALEpnEma/mDEyIHVOUagA+E3Sc8pASA4a1zTq1tDPfvzl1LIry5WYbsf
	 vSA12br6H9F+5ErwGsJhPoP+AUnd61iiPq1i/yNXjUptLVERVakcFqhfjoSk+HsWhf
	 XERysbvgi7VWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSffVq7f
  JBo8+ylvc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnnZn9hLejWrNi7bitrA+MCpS5GLg4hgceM
  Em273rFAONeZJI5sf8cI4exllJi7YCpzFyMnB5uAlMSN+//Zuhg5OEQE9CSu/hMFCTMLqEi8+
  N3DDmILC9hIHLn4jhWkhEVAVaLruhxImFfASWLVyR1sILaEgILElIfvwSZyCjhLbD10GKxVCK
  jmw7Mp7BD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhNi1OLylKLdI31kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQIDN6WYuW8H49fev3qHGCU5mJREeYt13yYL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCd/hIoJ1iUmp5akZaZA4wimLQEB4+SCK/gFaA0b3FBYm5xZjpE6hSjopQ4bzdInwBIIqM0D6
  4NFrmXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzWgPTgBBPZl4J3PRXQIuZgBYvYAZbXJK
  IkJJqYCq8c1V1ze3HzN25B/o5Gl33eDirZd5IsGOtyLx85t2NM71Npm9N8oKffOifLanEsGnb
  bC0f5fjmt6VsK51SXC8FL3ba9lfrCs++kzkVPotPrOBzZdtw4c/D96eWev16p7LhRpu2Jmdpj
  nNmEXNB25en/a6XzCbYHS43Ejo2LSLz03HrM03z/nO+iDzhPJkhR8lz2iNmaTudjJzFPE6HF/
  cb5s1x3sQg6PjRNbH63wK+rUeqIgMfzE47/naFSa1rofn/Tdo8e3cp/13RuzGCj+sdQ18Ci9G
  DXFOzqECbuKkbjrdYNC7bs2Jbq4kD49r+oxfX3Tos+Wer0pZWS/fSzNPfxENmTZ+SZ5d/8orb
  HiWW4oxEQy3mouJEAIkdVSBXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1676536554!90618!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3083 invoked from network); 16 Feb 2023 08:35:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:35:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 14F7A1000E7
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:54 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 07F241000DB
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:35:52 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] liburcu: upgrade 0.13.2 -> 0.14.0
Date: Thu, 16 Feb 2023 16:35:40 +0800
Message-ID: <1676536540-14583-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676536540-14583-1-git-send-email-wangmy@fujitsu.com>
References: <1676536540-14583-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177277

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Fix: urcu-bp: only teardown call-rcu worker in destructor
  * Fix: rculfhash: urcu_die() takes positive error value
  * Fix: call_rcu: teardown default call_rcu worker on application exit
  * Fix: join worker thread in call_rcu_data_free
  * Docs: clarify grace period polling API
  * Document grace period polling in rcu-api.md
  * Implement poll rcu stress test in rcutorture
  * urcu-memb,mb,signal: Implement grace period polling
  * Fix: auto-resize hash table destroy deadlock
  * Fix building on MSYS2
  * rculfhash: Include rculfhash-internal.h from local directory
  * Remove "Darwin" from "should also work on list"
  * Merge branch 'adah1972-improve-md'
  * Add semicolons at the end of function prototypes
  * Wrap a file name in backticks
  * Wrap command-line options in backticks
  * Fix a wrong format
  * Wrap URLs in angle brackets
  * Fix Markdown issues
  * Fix: Always check pthread_create for failures
  * Disable signals in URCU background threads
  * Fix: futex.h: include headers outside extern C
  * Fix: add missing unused attribute to _rcu_dereference
  * Fix: change method used by _rcu_dereference to strip type constness
  * Fix: remove type constness in URCU_FORCE_CAST's C++ version
  * Move extern "C" down in include/urcu/urcu-bp.h
  * fix: ifdef linux specific cpu count compat
  * Add unit tests for possible_cpus_array_len
  * fix: sysconf(_SC_NPROCESSORS_CONF) can be less than max cpu id
  * Fix: revise obsolete command in README.md
  * Fix: workqueue: remove unused variable "ret"
  * Fix: urcu-qsbr: futex wait: handle spurious futex wakeups
  * Fix: urcu: futex wait: handle spurious futex wakeups
  * Fix: urcu-wait: futex wait: handle spurious futex wakeups
  * Fix: defer_rcu: futex wait: handle spurious futex wakeups
  * Fix: call_rcu: futex wait: handle spurious futex wakeups
  * Fix: workqueue: futex wait: handle spurious futex wakeups
  * Fix: Use %lu rather than %ld to print count
  * Update ABI definition files
  * Bump version current and age
  * alpha: allocate membarrier system call number
  * Bump version to 0.14.0-pre
  * Improved test framework
  * rculfhash: introduce cds_lfht_node_init_deleted
  * Fix: changelog: v0.13.0 was released in 2021
  * cleanup: i386 arch detection
  * fix: properly detect 'cmpxchg' on x86-32
  * fix: use urcu-tls compat with c++ compiler
  * Fix typo
  * fix: remove autoconf features default value in help message
  * fix: add missing pkgconfig file for memb flavour lib
  * Cleanup: Tests: Remove useless pre-C99 compatibility code from tap.h
  * Document C99 and C++11 requirement in README.md
  * Always use '__thread' for Thread local storage except on MSVC
  * Fix: powerpc32: transparent unions alter calling convention
  * fix: don't use C++ thread_local on MacOs
  * wfcqueue API: implement overloaded wrappers with templates
  * wfcqueue: combine C++ API cds_wfcq_head_cast with overloading
  * wfstack C++ API: implement overloaded wrappers with templates
  * lfstack C++ API: implement overloaded wrappers with templates
  * wfstack: combine C++ API cds_wfs_stack_cast with overloading
  * lfstack: combine C++ API cds_lfs_stack_cast with overloading
  * fix: test_build tap plan
  * Test C++ build of list head init
  * Fix order of initializers in CDS_LIST_HEAD_INIT
  * unit tests: test wfcqueue, wfstack, lfstack empty check functions in C++
  * wfcqueue: implement C++ API based on function overloading
  * wfstack: implement C++ API based on function overloading
  * lfstack: implement C++ API based on function overloading
  * Fix tap.h: remove extra semicolon in pass/fail macros
  * Add C++ build tests
  * Build and run regression and unit tests as C++ programs
  * Add --enable-Werror configure switch
  * Add `urcu_posix_assert()` as `assert()` replacement
  * Rename `urcu_assert()` to `urcu_assert_debug()`
  * cleanup: spelling fixes in comments
  * Make temporary variable in _rcu_dereference non-const
  * (tls-ie2) Fix: x86 and s390: uatomic __hp() macro C++ support
  * Fix: x86 and s390: uatomic __hp() macro clang support
  * Fix: x86 and s390 uatomic: __hp() macro warning with gcc 11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburcu/{liburcu_0.13.2.bb => liburcu_0.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.13.2.bb => liburcu_0.14.0.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.13.2.bb b/meta/recipes-support/liburcu/liburcu_0.14.0.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.13.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.14.0.bb
index 6ecf2e21c0..f03c990632 100644
--- a/meta/recipes-support/liburcu/liburcu_0.13.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.14.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "1213fd9f1b0b74da7de2bb74335b76098db9738fec5d3cdc07c0c524f34fc032"
+SRC_URI[sha256sum] = "ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.34.1


