Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98DAD4335C
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 02:10:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3849.1731031821936857506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 18:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1042fee24e=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A81pZO2013268
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Nov 2024 02:10:21 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5g515-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 02:10:20 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 18:10:19 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 18:10:18 -0800
From: Bin Lan <bin.lan.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] doc/examples/Makefile.am: adds library search paths and linker rpath-link
Date: Fri, 8 Nov 2024 10:10:18 +0800
Message-ID: <20241108021018.1236970-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CiqhpBW-fKyZ1ywt1fiFsGZ1RZZ7RdvX
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672d730c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=MmHy8NYH6_vG9Ivu7dIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CiqhpBW-fKyZ1ywt1fiFsGZ1RZZ7RdvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_01,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 02:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206853

There is the following error when building doc/examples/cmake-multiple-shared-libraries:
/usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
/usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_add_fd_to_tracker'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_ctor'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_init'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_register_queue_release'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_synchronize_rcu'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register_thread'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_prune_release_queue'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_push'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_before_fork'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_lock_fd_tracker'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_trace_clock'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_has_sys_membarrier'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_unlock_fd_tracker'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_exit'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_get_cpu_sym'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_delete_fd_from_tracker'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_reader'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_gp'
/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
collect2: error: ld returned 1 exit status

This change set adds library search paths and linker rpath-link are set
for both the standard and cmake examples.

Upstream-Status: Not applicable
Backport patch: https://github.com/lttng/lttng-ust/commit/5d10459b6b5182fcbc98240d9dace026c87a5037

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 .../0001-Makefile.am-update-rpath-link.patch  | 70 +++++++++++++++++--
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
index 6aca8f85fa..cdf5cb70d8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
@@ -14,20 +14,80 @@ Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/61]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
+
+doc/examples/Makefile.am: adds library search paths and linker rpath-link
+    
+There is the following error when building doc/examples/cmake-multiple-shared-libraries:
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
+    
+This change set adds library search paths and linker rpath-link are set
+for both the standard and cmake examples.
+    
+Upstream-Status: Not applicable
+Backport patch: https://github.com/lttng/lttng-ust/commit/5d10459b6b5182fcbc98240d9dace026c87a5037
+    
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+
 ---
- doc/examples/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ doc/examples/Makefile.am | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index 57782cc..d46caa6 100644
+index aebf63bd..79766ec0 100644
 --- a/doc/examples/Makefile.am
 +++ b/doc/examples/Makefile.am
-@@ -167,7 +167,7 @@ all-local:
+@@ -169,7 +169,10 @@ all-local:
  				CFLAGS='$(CFLAGS)' \
  				AM_CFLAGS='$(AM_CFLAGS)' \
  				LDFLAGS="$(LDFLAGS)" \
 -				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
-+				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/:$(PWD)/../../src/lib/lttng-ust-tracepoint/.libs:$(PWD)/../../src/lib/lttng-ust-common/.libs/"' \
++				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
++				-Wl,-rpath="$(abs_top_builddir)/src/lib/lttng-ust/.libs/" \
++				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/" \
++				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/"' \
  				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
  				AM_V_P="$(AM_V_P)" \
  				AM_V_at="$(AM_V_at)" \
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
-- 
2.34.1


