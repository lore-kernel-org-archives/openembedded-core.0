Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5F1E64030
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.10683.1732226076326990523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JAXBAtl8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fbc29b3145so661984a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226075; x=1732830875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=645diNR3TXGU6KmTjhia7d3ws9h9vmr+urLdBUdSmjs=;
        b=JAXBAtl8Z4JRHagjwxA03JcYir1+cxRQ0FMnyn4K5kPOqApvPJh6jPRUPnLdpg+aEd
         NRIGprwilvMOGqA7J2Kh/m/JZcY1GDtj1LBdcfYY02E77KUxvPkdhitRyTSW6wk7TJwZ
         kaeW551MnTFtCVNMFdCYdiDMXlcyRMVb0jbm8ExOS692v5A0zMm4fqErEV0CAUSCkmbl
         m6+AK3b3KAuziw+oacefehFQolSLm1ZQ4bAiFwaKrRj9jFsZhHS9IubL0tSGDM0yl8jG
         hNi8uWBP/lX/4+2wtBsG9SP2YFVggOwpJ0EK4AzbI9+S/IcK1cBj/LFp82i6N5M+5r1n
         Ap4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226075; x=1732830875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=645diNR3TXGU6KmTjhia7d3ws9h9vmr+urLdBUdSmjs=;
        b=JuKUZdxiG3qRiOU4c/DvkG/xUv9kbgg01FKKqfUyctNDCLe6z1fugO2d/L8lsB1uhN
         I1w633dpcNZUVwkQkCEGS5D9XDP38gftMFGmJ6GltUIhsfPRFjCUh7b4MzmsDy+izL5w
         dj+fQB3aXkFH4Igoyid3o9Qr5wn1y8rlzsdwPITdejnRcwqOLG+chRGAM+EktTSi1olA
         M0HcV2K3iYtUxASvwPNVlHPnEAl/4i1zuQ2ve4Ao5ccE2PUaS9bCpDSSRzX7zTUhI+h3
         Ij3pmJv+TxwAgZOdqhGOTfUU/7VPUiP9QmMNH4/TwIEl3tg5fAY1rUcKNtrNe/NJR6ao
         USfA==
X-Gm-Message-State: AOJu0YydFbqw8flrE0J0qArLb54Y+/6HFfbAewHW+5+LRKLk/iG46MH8
	j6I1wRQuZ0Ml6TEE4DLjCKqq23a7MP8x9CktyJIXDWL/eaXBQI4PgdSj23iHRHMfubzdU021QyL
	p
X-Gm-Gg: ASbGnctrHw6E00Y6az09hRw0uJbAMS+p+pCnfPqUbN7fJca4Q3Gh7uOQoC2btN5AOe9
	ckCgRvutAxu/XEtq0yqEeHBgbO7yReq0+e9uX13o2MMsUJIqY476t3qrt20mncFr5Nt2nvsr/b/
	tzQIYnLsL7BDIPTUf9ep7zLUaNn/WOwSzDcyV/IG3ADa4L5upCjWeO0YbaBOeX0DKiZsvROB98n
	Xs3C8Aw0KcYBwb5PL9XMdJ5FeQtRf5e5C7x3nI=
X-Google-Smtp-Source: AGHT+IFXtHKukmHcnuMGZdpePDEmVoQNgm7gVzmKerjiTMFWxrDYka2bfHaO1ULXNtDYgpaJPtSSvw==
X-Received: by 2002:a05:6a20:a109:b0:1db:d6e4:d1d9 with SMTP id adf61e73a8af0-1e09d5af343mr1256256637.1.1732226075296;
        Thu, 21 Nov 2024 13:54:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/27] lttng-ust: backport patch to fix cmake-multiple-shared-libraries build error
Date: Thu, 21 Nov 2024 13:53:59 -0800
Message-Id: <7de4292f119a4f43dc739b15f0a2d966c05d9b71.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207564

From: Bin Lan <bin.lan.cn@windriver.com>

There are the following error when building doc/examples/cmake-multiple-shared-libraries:
ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
collect2: error: ld returned 1 exit status

This change set removes the old patch file 0001-Makefile.am-update-rpath-link.patch,
adds a new patch file 0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch.

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89394da1cbe98652e1d0bd59c762ff7da2d6a113)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ++++++++++++++++++
 .../0001-Makefile.am-update-rpath-link.patch  |  33 ----
 meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb |   2 +-
 3 files changed, 162 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
new file mode 100644
index 0000000000..6da675fa31
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
@@ -0,0 +1,161 @@
+From 5d10459b6b5182fcbc98240d9dace026c87a5037 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 5 Aug 2024 15:41:34 -0400
+Subject: [PATCH] Fix: Build examples when rpath is stripped from in-build-tree
+ libs
+
+Observed issue
+==============
+
+Certain tool chains[1, 2] emit warnings or errors when building the
+example applications.
+
+```
+make[3]: Entering directory
+'/home/xxx/src/efficios/lttng/master/src/lttng-ust/doc/examples/easy-ust'
+CC       sample.o
+CC       tp.o
+CCLD     sample
+
+/usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
+/usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_add_fd_to_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_ctor'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_init'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_register_queue_release'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_synchronize_rcu'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register_thread'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_prune_release_queue'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_push'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_before_fork'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_lock_fd_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_trace_clock'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_has_sys_membarrier'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_unlock_fd_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_exit'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_get_cpu_sym'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_delete_fd_from_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_reader'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_gp'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
+collect2: error: ld returned 1 exit status
+```
+
+=== Reproducer ===
+
+The easiest way to consistently reproduce this type of build failure
+is to perform the following steps:
+
+```
+./configure
+make -j$(nproc)
+find . -iname '*.so' -exec chrpath -d {} \;
+make -C doc/examples clean
+make -j$(nproc)
+```
+
+As the examples are not built with libtool, finding the libraries to
+link against depends on the shared objects having an rpath.
+
+E.g.
+
+```
+$ chrpath src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0
+src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0: RUNPATH=/home/xxx/src/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-common/.libs:/home/xxx/src/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-tracepoint/.libs:/home/xxx/src/efficios/lttng/master/usr/lib
+```
+
+The current examples build with `-Wl,-rpath`  for `liblttng-ust`, but
+not the dependencies of `liblttng-ust` (which would normally be found
+via it's own rpath). If the `rpath` is stripped from
+`liblttng-ust.so`, or if the tool chain ignores `rpath` explicitly,
+then the build with fail.
+
+In the case of a yocto build environment as in GitHub#61[1], the
+following commands reproduced the warnings and the errors seen in the
+above test case.
+
+```
+git clone git://git.yoctoproject.org/poky && cd poky/
+. oe-init-build-env
+echo "PACKAGECONFIG:pn-lttng-ust = 'examples'" >>conf/local.conf
+bitbake lttng-ust
+```
+
+=== Solution ===
+
+Explicitly add library search paths and set linker rpath-link are set
+for both the standard and cmake examples. Similar changes were
+proposed for each of those parts respectively in GitHub#61[1] and GitHub#63[2].
+
+=== Known issues ===
+
+While the `rpath-link` for the second order library dependencies will
+allow the builds to complete, the examples will not work at
+runtime even when using `rpath`. From `man ld.so`, the rpaths in an
+executable or shared object are only considered for direct
+dependencies. Therefore, without setting `LD_LIBRARY_PATH` or
+installing the libraries test applications will fail as follows:
+
+```
+$ ./doc/examples/easy-ust/sample
+./doc/examples/easy-ust/sample: error while loading shared libraries: liblttng-ust-common.so.1: cannot open shared object file: No such file or directory
+```
+
+References
+==========
+
+[1]: https://github.com/lttng/lttng-ust/pull/61
+[2]: https://github.com/lttng/lttng-ust/pull/63
+
+Change-Id: I273ccddd0d0b7a1b57b9e09ddf48d8b5b41e6f8e
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-ust/commit/5d10459b6b5182fcbc98240d9dace026c87a5037]
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+
+---
+ doc/examples/Makefile.am | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
+index aebf63bd..79766ec0 100644
+--- a/doc/examples/Makefile.am
++++ b/doc/examples/Makefile.am
+@@ -169,7 +169,10 @@ all-local:
+ 				CFLAGS='$(CFLAGS)' \
+ 				AM_CFLAGS='$(AM_CFLAGS)' \
+ 				LDFLAGS="$(LDFLAGS)" \
+-				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
++				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
++				-Wl,-rpath="$(abs_top_builddir)/src/lib/lttng-ust/.libs/" \
++				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/" \
++				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/"' \
+ 				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
+ 				AM_V_P="$(AM_V_P)" \
+ 				AM_V_at="$(AM_V_at)" \
+@@ -222,10 +225,14 @@ all-local:
+ 					CXX="$(CXX)" \
+ 					$(CMAKE) \
+ 					-DCMAKE_INCLUDE_PATH="$(abs_top_srcdir)/include;$(abs_top_builddir)/include" \
+-					-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/src/lib/lttng-ust/.libs" \
++					-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/src/lib/lttng-ust/.libs;$(abs_top_builddir)/src/lib/lttng-ust-common/.libs;$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs" \
+ 					-DCMAKE_C_FLAGS="$(AM_CFLAGS) $(CPPFLAGS) $(CFLAGS)" \
+ 					-DCMAKE_CXX_FLAGS="$(AM_CXXFLAGS) $(CXXFLAGS) $(CPPFLAGS)" \
+-					-DCMAKE_EXE_LINKER_FLAGS="$(AM_LDFLAGS) $(LDFLAGS)" \
++					-DCMAKE_EXE_LINKER_FLAGS="$(AM_LDFLAGS) $(LDFLAGS) \
++					-L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
++					-Wl,-rpath=$(abs_top_builddir)/src/lib/lttng-ust/.libs/ \
++					-Wl,-rpath-link=$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/ \
++					-Wl,-rpath-link=$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/" \
+ 					.. && \
+ 				$(MAKE) \
+ 			) || exit 1; \
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
deleted file mode 100644
index 6aca8f85fa..0000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7d053804ab3823d40ae10d90f4efc49dbfb4cb66 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 22 Sep 2021 16:33:10 +0800
-Subject: [PATCH] Makefile.am: update rpath link
-
-since commit 6339062 Move liblttng-ust to 'src/lib/',
-liblttng-ust.so/liblttng-ust-common.so/liblttng-ust-tracepoint.so
-'s location changed from one dir to multiple dirs. which make below
-error:
-ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
-ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/61]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- doc/examples/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index 57782cc..d46caa6 100644
---- a/doc/examples/Makefile.am
-+++ b/doc/examples/Makefile.am
-@@ -167,7 +167,7 @@ all-local:
- 				CFLAGS='$(CFLAGS)' \
- 				AM_CFLAGS='$(AM_CFLAGS)' \
- 				LDFLAGS="$(LDFLAGS)" \
--				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
-+				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/:$(PWD)/../../src/lib/lttng-ust-tracepoint/.libs:$(PWD)/../../src/lib/lttng-ust-common/.libs/"' \
- 				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
- 				AM_V_P="$(AM_V_P)" \
- 				AM_V_at="$(AM_V_at)" \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
index dddd3a5004..bf2524bdc0 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
@@ -31,7 +31,7 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
-           file://0001-Makefile.am-update-rpath-link.patch \
+           file://0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch \
            "
 
 SRC_URI[sha256sum] = "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937"
-- 
2.34.1


