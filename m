Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB718C3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 15:53:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.22662.1746201192202522290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 08:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G3ALuMK8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso14000145e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746201190; x=1746805990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q11oC8rUky4cRutO2d/jpcHYIdIlof0s6uDZDEb7s0=;
        b=G3ALuMK85DJgKbdFvZRt1Zi6H11T+u+S8mFpO8QV5DG2r4bGEvp2KupodJRiYHwPh3
         g4tblOkxihtgIHvJ2hoAhwukl5X8lI5k+fkO8kPPQRp34p57VT/ym+cHDGzgvL2f1hPg
         U2yfAjeBCHcAV3yaqgbO5sRxHZ9po4wqP4ZpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201190; x=1746805990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q11oC8rUky4cRutO2d/jpcHYIdIlof0s6uDZDEb7s0=;
        b=kWR10fgPSg5mys1Pvvw9sNe6Gmo6vafmqVCGI1eGHBbFu+wEE4R4hUW9vluKXJAOXI
         nxEmHUrt3y6jT429wrDxbp2960lxZo8m1CpOggvrfg1BONnI4Qj9iqt+iLsY7KCA0n4a
         sTCQy2lACm2r4A4bLpg9OwnjV1DYyk91SRtiIXB3AIw+LiJ0eXdjK7Ilf1lkw+KFyDWC
         18X+vsE2A5zFo5I5rMlAkECQMw2h0u3zHtqIJoB2+mBLQAExnjTFWLVmBfumgpe3b+y9
         afCXQCsRNlQ3N1vgF1MyZSVV8hpiX8xXTgU2M57LD5pD352feXzLPbpp9lnC2gpjDb4t
         OXrw==
X-Gm-Message-State: AOJu0YyibWQvxJs6A+u8H7jMkNXo/AXXsoSFE7yu+VIhCxd9vtyCiybE
	g5BvZU7E+DleAFBTyt8P0Y3tW1OsZu9QhoDzLHtWWV8Nird88J7PXJuKp6hklzmzvm6Nf+xEQ2q
	H
X-Gm-Gg: ASbGncv6sNJ5pw5xOo8HJusEzJdNQe4AMyl4D4JyZkkug9cl5xPwS6O6Uhu8EzKjwZe
	3GPa+u798IKwVCxPzHc8oicxhW6CHXZQNDnuHuHLhRM02SyKLguCF9/a1CTLFtixfe5dXhIyBsz
	fO7ZxsTVj/wsRVMq8fELKPukJpWCVp9p+f/LHxqtZEduKuGW50i1LX5SGVXKyaCA/N2He5AQ8V+
	KpRzU3b9vbfRV1G02gHxj/GoOmLEOVnpwZesPDIAXtyCwp1BoM/627KQ9MQYARZwQz5+WczPf3y
	yl/oBy7v9p/9S5SewBBP05H9G/vqYpBkqmrl9HFVGTfpwxeD3n6KeyQ8LVUlI1cqN/+R
X-Google-Smtp-Source: AGHT+IEWaPwqpdHQ2r9G24CgN5KPAllAQ/Nf5+QErJ987adapEyMeum7Dol0TQi5uIkuCXnbC9jhCA==
X-Received: by 2002:a05:600c:4f8f:b0:440:6a68:826a with SMTP id 5b1f17b1804b1-441bb89e812mr28620995e9.13.1746201189807;
        Fri, 02 May 2025 08:53:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8904:24d:3b00:200b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a5fsm96877785e9.20.2025.05.02.08.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:53:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-ust: upgrade 2.13.8 -> 2.13.9
Date: Fri,  2 May 2025 16:53:07 +0100
Message-ID: <20250502155308.3999939-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 15:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215909

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ------------------
 ...-common-link-with-liburcu-explicitly.patch |   3 +-
 ...Makefile.am-Add-install-lib-to-setup.patch |   3 +-
 ...ttng-ust_2.13.8.bb => lttng-ust_2.13.9.bb} |   3 +-
 4 files changed, 3 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.8.bb => lttng-ust_2.13.9.bb} (92%)

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
index e85dbdb4398..ceb240680bd 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 27402453f25fbdb5a9fb1a1b88d1c4d9852187d2 Mon Sep 17 00:00:00 2001
+From 1b6bbf14de8fdfe60e446c93969e29bc2cf5f2dc Mon Sep 17 00:00:00 2001
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
index 7c49583e0dc..7bbe5c216ed 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From f65efd963e52de51d35e2e03fb773f33dd64f565 Mon Sep 17 00:00:00 2001
+From 30660997d220602202d8dc7264e49095a1581947 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
index bf2524bdc0d..dd7657e0cc1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
@@ -31,10 +31,9 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
-           file://0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch \
            "
 
-SRC_URI[sha256sum] = "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937"
+SRC_URI[sha256sum] = "2ad6d69a54a1d924c18a4aa7a233db104e3cc332bcdd240e196bf7adbed3f712"
 
 CVE_PRODUCT = "ust"
 

