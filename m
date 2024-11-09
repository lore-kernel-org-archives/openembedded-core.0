Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2372FD5E144
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 08:09:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13120.1731139788590153845
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 00:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1043b988fe=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A98038x007239
	for <openembedded-core@lists.openembedded.org>; Sat, 9 Nov 2024 00:09:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g8hgmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 00:09:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 9 Nov 2024 00:09:47 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 9 Nov 2024 00:09:46 -0800
From: Bin Lan <bin.lan.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-ust: backport patch to fix cmake-multiple-shared-libraries build error
Date: Sat, 9 Nov 2024 16:09:45 +0800
Message-ID: <20241109080945.1586080-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Uw62ocWviq3r_jULzLauGWy4iFpi8i_s
X-Proofpoint-GUID: Uw62ocWviq3r_jULzLauGWy4iFpi8i_s
X-Authority-Analysis: v=2.4 cv=Jsajr94C c=1 sm=1 tr=0 ts=672f18cb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8
 a=GWfQyvAXmN3mebG5HuYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=E2cWBXyb0kjxxB1PlMdk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-09_07,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411090067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 08:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206902

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


