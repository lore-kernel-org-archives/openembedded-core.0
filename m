Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A6AFF8848
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:25 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32005.1777064238487342681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iQZFr/9x;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso82273955e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064237; x=1777669037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZt/gCKC0bM8ZKdePXlfhuBpQeVYHndU2BNr5j3B4W8=;
        b=iQZFr/9xH4G2yB6TfUVr8eqB1TK2d5KsDS553GZN4RLSK1S0KSbH5LFWQCBROdQ38x
         mTsU6iaqF2NT/QJtEWiEOVuUXWQE71s/2J+jfATET8DrSuWuddaNZAl1bZqrdKksuuaK
         9Rb3SYI2A/DmKrcyMBTYckcyVQ3f3b2+1i7iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064237; x=1777669037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZt/gCKC0bM8ZKdePXlfhuBpQeVYHndU2BNr5j3B4W8=;
        b=tRr0ju1wAqx3WUmtLKIMBJY2kY2avrjZPJyT7L7OOFuWgJj0PrkOR3aKK5rP7xcDY5
         ONckmPzelozxhjy83B4LyS4yHY2A/3REfa+CNQxm518PFekRADUtC8LgB4b8AHexWK8a
         a5eGrvImJkmqUa3uxKzELp/pbNEjNdesf6PSMwnWIjh6WqxmKYeIEbWTX7jw4E02HRD3
         WuulLEHEZHdRNejLTH4YpIhB6CxCWS6T9nVOJ45kCeGc7Vpxqc0h6NevocxRQw8Fl7Cb
         vrnthZdxeTu0XticVMBRWWEl2ux/5rOfWdSHil/NF/4zzzIepSa7WrLjE6gQjdbcjaGv
         nAfQ==
X-Gm-Message-State: AOJu0Yw9uRkf0LGgyem4Y3j7lkCLO5vJVx1lW91JeuOEqWkr29Ae2DsG
	9schHCgpIv+x7pXh+4eYlY8p++UR5u2A8fjPj+CVz1XtZ3vYTZtS8IRSX4RX3KGpHYuPBaTY15V
	SWjRRrUocI9G6
X-Gm-Gg: AeBDietYN5zqHJ0EZ5U4iy/lt48KOswMQqE/rvhaPkr1ZVkxzK3VuUf3LQDYtw/fE+E
	gh5nO0la/4fFGcKuzg314f6H0ttcsh7iws4I402BltacQtcPLyECWu/Oj165WeEqYVpwZGeN3SJ
	s9kfd/k+HIRbZMna+eBFfrsI06DL8PQS/iVZWQidorPNRPsFGh82g4ec1YbGqu1mr9evCR/WsD/
	ZcTFlYBKv7tZ4WdCeYqJGZUobBu3UzlQ9UnnPVi/BTMlCKOg8ZsxzBrDyworIqSOfDQZ9/HqtUF
	kdfTO9HZFkqfYEV0EvnNpfJ758eEtGe8Wqssg2sqDRkq2+LBiKEPQLLufeb+GmnQApzvM8Muh10
	Lp/4djViFAqKFfH8X8BX6SEMEqemQJRwSKY4aGDLAyw1o2n2EJkfdIQEx59egx61a7hM9wxHkel
	Lv5EgQhx28PVf2eniVIsXFWolnBKcC8nuP8b6CzXAwB3rfVCuRJT3W4TYgaRsl4/UYcBX58tS/K
	ztPyouS0T75hqHtUPMVixNJuBn/R3Nn9rABow==
X-Received: by 2002:a05:600c:1f83:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488fb787afemr469139255e9.24.1777064233713;
        Fri, 24 Apr 2026 13:57:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 64/66] lttng-ust: upgrade 2.13.8 -> 2.13.10
Date: Fri, 24 Apr 2026 22:56:03 +0200
Message-ID: <90f529115ed175652d2ab8c538d1c213550056f8.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235939

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for lttng-ust: 2.13.8 -> 2.13.10
============================================================

2026-02-13 lttng-ust 2.13.10
	* Fix: ustctl: sigbus handling: statement with no effect

2025-04-14 (National Gardening Day) lttng-ust 2.13.9
	* Fix: Use UATOMIC_HAS_ATOMIC_{BYTE,SHORT} for counter atomics
	* Fix: lttng-ust-tp regex warnings
	* lttng-ust-java: Load lttng-ust-context-jni before other JNI libraries
	* doc/examples: set minimal CMake version to 3.5.0
	* Fix: Update get_mempolicy check to handle EPERM
	* Fix: Correct numa_available return code checks
	* Fix: test_benchmark: do not match CPU(s) scaling MHz:
	* Tests: Fix abi conflict test when building with clang
	* Fix: Build examples when rpath is stripped from in-build-tree libs
	* ust-fd: Add close_range declaration
	* docs: Correct GitHub URLs in lttng-ust.3
	* fix: handle EINTR correctly in get_cpu_mask_from_sysfs

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ------------------
 ...-common-link-with-liburcu-explicitly.patch |   3 +-
 ...Makefile.am-Add-install-lib-to-setup.patch |   3 +-
 ...tng-ust_2.13.8.bb => lttng-ust_2.13.10.bb} |   3 +-
 4 files changed, 3 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.8.bb => lttng-ust_2.13.10.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
deleted file mode 100644
index 6da675fa312..00000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 5d10459b6b5182fcbc98240d9dace026c87a5037 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 5 Aug 2024 15:41:34 -0400
-Subject: [PATCH] Fix: Build examples when rpath is stripped from in-build-tree
- libs
-
-Observed issue
-==============
-
-Certain tool chains[1, 2] emit warnings or errors when building the
-example applications.
-
-```
-make[3]: Entering directory
-'/home/xxx/src/efficios/lttng/master/src/lttng-ust/doc/examples/easy-ust'
-CC       sample.o
-CC       tp.o
-CCLD     sample
-
-/usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
-/usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_add_fd_to_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_ctor'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_init'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_register_queue_release'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_synchronize_rcu'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register_thread'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_prune_release_queue'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_push'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_before_fork'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_lock_fd_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_trace_clock'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_has_sys_membarrier'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_unlock_fd_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_exit'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_get_cpu_sym'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_delete_fd_from_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_reader'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_gp'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
-collect2: error: ld returned 1 exit status
-```
-
-=== Reproducer ===
-
-The easiest way to consistently reproduce this type of build failure
-is to perform the following steps:
-
-```
-./configure
-make -j$(nproc)
-find . -iname '*.so' -exec chrpath -d {} \;
-make -C doc/examples clean
-make -j$(nproc)
-```
-
-As the examples are not built with libtool, finding the libraries to
-link against depends on the shared objects having an rpath.
-
-E.g.
-
-```
-$ chrpath src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0
-src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0: RUNPATH=/home/xxx/src/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-common/.libs:/home/xxx/src/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-tracepoint/.libs:/home/xxx/src/efficios/lttng/master/usr/lib
-```
-
-The current examples build with `-Wl,-rpath`  for `liblttng-ust`, but
-not the dependencies of `liblttng-ust` (which would normally be found
-via it's own rpath). If the `rpath` is stripped from
-`liblttng-ust.so`, or if the tool chain ignores `rpath` explicitly,
-then the build with fail.
-
-In the case of a yocto build environment as in GitHub#61[1], the
-following commands reproduced the warnings and the errors seen in the
-above test case.
-
-```
-git clone git://git.yoctoproject.org/poky && cd poky/
-. oe-init-build-env
-echo "PACKAGECONFIG:pn-lttng-ust = 'examples'" >>conf/local.conf
-bitbake lttng-ust
-```
-
-=== Solution ===
-
-Explicitly add library search paths and set linker rpath-link are set
-for both the standard and cmake examples. Similar changes were
-proposed for each of those parts respectively in GitHub#61[1] and GitHub#63[2].
-
-=== Known issues ===
-
-While the `rpath-link` for the second order library dependencies will
-allow the builds to complete, the examples will not work at
-runtime even when using `rpath`. From `man ld.so`, the rpaths in an
-executable or shared object are only considered for direct
-dependencies. Therefore, without setting `LD_LIBRARY_PATH` or
-installing the libraries test applications will fail as follows:
-
-```
-$ ./doc/examples/easy-ust/sample
-./doc/examples/easy-ust/sample: error while loading shared libraries: liblttng-ust-common.so.1: cannot open shared object file: No such file or directory
-```
-
-References
-==========
-
-[1]: https://github.com/lttng/lttng-ust/pull/61
-[2]: https://github.com/lttng/lttng-ust/pull/63
-
-Change-Id: I273ccddd0d0b7a1b57b9e09ddf48d8b5b41e6f8e
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-ust/commit/5d10459b6b5182fcbc98240d9dace026c87a5037]
-Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
-
----
- doc/examples/Makefile.am | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index aebf63bd..79766ec0 100644
---- a/doc/examples/Makefile.am
-+++ b/doc/examples/Makefile.am
-@@ -169,7 +169,10 @@ all-local:
- 				CFLAGS='$(CFLAGS)' \
- 				AM_CFLAGS='$(AM_CFLAGS)' \
- 				LDFLAGS="$(LDFLAGS)" \
--				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
-+				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
-+				-Wl,-rpath="$(abs_top_builddir)/src/lib/lttng-ust/.libs/" \
-+				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/" \
-+				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/"' \
- 				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
- 				AM_V_P="$(AM_V_P)" \
- 				AM_V_at="$(AM_V_at)" \
-@@ -222,10 +225,14 @@ all-local:
- 					CXX="$(CXX)" \
- 					$(CMAKE) \
- 					-DCMAKE_INCLUDE_PATH="$(abs_top_srcdir)/include;$(abs_top_builddir)/include" \
--					-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/src/lib/lttng-ust/.libs" \
-+					-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/src/lib/lttng-ust/.libs;$(abs_top_builddir)/src/lib/lttng-ust-common/.libs;$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs" \
- 					-DCMAKE_C_FLAGS="$(AM_CFLAGS) $(CPPFLAGS) $(CFLAGS)" \
- 					-DCMAKE_CXX_FLAGS="$(AM_CXXFLAGS) $(CXXFLAGS) $(CPPFLAGS)" \
--					-DCMAKE_EXE_LINKER_FLAGS="$(AM_LDFLAGS) $(LDFLAGS)" \
-+					-DCMAKE_EXE_LINKER_FLAGS="$(AM_LDFLAGS) $(LDFLAGS) \
-+					-L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
-+					-Wl,-rpath=$(abs_top_builddir)/src/lib/lttng-ust/.libs/ \
-+					-Wl,-rpath-link=$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/ \
-+					-Wl,-rpath-link=$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/" \
- 					.. && \
- 				$(MAKE) \
- 			) || exit 1; \
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
index e85dbdb4398..2d1c6135a58 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 27402453f25fbdb5a9fb1a1b88d1c4d9852187d2 Mon Sep 17 00:00:00 2001
+From 0755d1c25e1fd1d8f7baa863ed6a9b931c2d0095 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 5 Sep 2021 10:44:19 +0200
 Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
@@ -7,7 +7,6 @@ Otherwise linking errors are seen on x86-32.
 
 Upstream-Status: Submitted [by email to lttng-dev, Francis, Jonathan]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  src/lib/lttng-ust-common/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index 7c49583e0dc..f9b1d198a12 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From f65efd963e52de51d35e2e03fb773f33dd64f565 Mon Sep 17 00:00:00 2001
+From 74bb718d64a120af79bf1068d1c6ad9e568fc58f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 20 Feb 2024 12:19:06 +0000
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
@@ -9,7 +9,6 @@ building.
 Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/59]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  src/python-lttngust/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.10.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.10.bb
index bf2524bdc0d..56f3d93724d 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.10.bb
@@ -31,10 +31,9 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
-           file://0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch \
            "
 
-SRC_URI[sha256sum] = "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937"
+SRC_URI[sha256sum] = "c997d4efa02ed18b4976a0a280ff1c7fb2fc9d6ef2f86a0f5ccb44294a9d6045"
 
 CVE_PRODUCT = "ust"
 

