Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25811CA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 02:45:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3685.1757299498783801797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 19:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M/HZGwIQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13463a1697=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5881fBCp2766837
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Sep 2025 19:44:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iRWv0jLjrB6KEt4yMU8z
	yLpLAlMs0yOdc+T1ZSf+VxM=; b=M/HZGwIQFhg5cEZ8YD1oaCovT6Dzd6cw7u79
	hWcySAw3B3iwedOcH0RwUKembIDY68jpmgJjmlIgdr6ovQHRYYIiUuZL2or1leTo
	65m5H7ZvvAR4gMCxl/8A/8teCpUbTsHKG6O7drEcUvfOw145UiK8CvfcA7Ba26vG
	nnLPvJl41en/IJ98bTmjcqwajNvXGPAo4Wg8im2tJSc9UNhG4eJrwlOIuq8lqwIW
	LPJzl87EnlbK0NJecwLcnznPmFVjNctoaLc0nXG/CanOeH1kneSA/UxRSMbzris3
	jmcED+66yZMPvBtqMk2TrpgEcG1LNFpqf6krBvWgyevRVulTpA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg12qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 19:44:57 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 19:44:57 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 7 Sep 2025 19:44:56 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] systemtap: Fix task_work_cancel build
Date: Mon, 8 Sep 2025 10:44:55 +0800
Message-ID: <20250908024455.634404-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zew5DkHeTsgQfRmynfeeYI_Oor1375MW
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68be432a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=iJkqILuDta0ArLN7-O4A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAyNSBTYWx0ZWRfX7Mg4WeFZpWKN
 z9i+g6/VDe3kQpYzsY2+waE5dUZ6PgV4F2+ysU72KIWqsvQUNXrIMx6A2boY2JEDp952N+4QzF5
 5lr5JtExGwKw3ZYXEJ6w0bgU5xgiND3GScZ8HLX2I+fGPNn5lg9CE/VRrqbNfwDNrC79HnfLQKh
 ggcQlfsO/WBI2NaBN3KP6txNTOiciCSFPPQFN0zlY9djIQqAQRnrb0XR4HaAnE0/Wjkp5lzTNpq
 LQusVkV9uVUjHp510dRqrNlx6uq2w0UELFUdVqN5Opinh4MJWRXm0c9U7RYXGCsUCct3qN9srm2
 3nJAddkyxZg2J+OlcuCAcvqdAF/pBjdy/9bII2N6UZbJ4uENEcUHfc4tklWB8Y=
X-Proofpoint-ORIG-GUID: zew5DkHeTsgQfRmynfeeYI_Oor1375MW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 02:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223057

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Backport a patch to fix:
 107 |         twork = task_work_cancel(task, func);
      |                                        ^~~~
      |                                        |
      |                                        task_work_func_t {aka void (*)(struct callback_head *)}
/work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/work/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share/systemtap/runtime/stp_task_work.c:107:40: note: expected 'struct callback_head *' but argument is of type 'task_work_func_t' {aka 'void (*)(struct callback_head *)'}
/work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/work/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share/systemtap/runtime/stp_task_work.c:13:26: error: incompatible types when assigning to type 'struct callback_head *' from type 'bool' {aka '_Bool'}
   13 | #define task_work_cancel (* (task_work_cancel_fn)kallsyms_task_work_cancel)
      |                          ^
/work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/work/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share/systemtap/runtime/stp_task_work.c:107:17: note: in expansion of macro 'task_work_cancel'
  107 |         twork = task_work_cancel(task, func);
      |                 ^~~~~~~~~~~~~~~~

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...sk_work-compatible-with-6.11-kernels.patch | 103 ++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch
new file mode 100644
index 0000000000..62a8dafa9b
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch
@@ -0,0 +1,103 @@
+From 317669e7b44bc2688253f5ab9641c308f30566bc Mon Sep 17 00:00:00 2001
+From: Martin Cermak <mcermak@redhat.com>
+Date: Wed, 24 Jul 2024 16:47:42 +0200
+Subject: [PATCH] Make stp_task_work compatible with 6.11 kernels
+
+Update systemtap runtime so that it works with kernel commit
+68cbd415dd4b task_work:
+
+s/task_work_cancel()/task_work_cancel_func()/
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=a64dc4e2e0195ca80c6509df511a42459b40e9af]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ buildrun.cxx                                  |  1 +
+ .../linux/autoconf-task_work_cancel_func.c    |  3 +++
+ runtime/linux/runtime.h                       |  2 +-
+ runtime/stp_task_work.c                       | 21 ++++++++++++++-----
+ 4 files changed, 21 insertions(+), 6 deletions(-)
+ create mode 100644 runtime/linux/autoconf-task_work_cancel_func.c
+
+diff --git a/buildrun.cxx b/buildrun.cxx
+index 816842072..4c528b1b1 100644
+--- a/buildrun.cxx
++++ b/buildrun.cxx
+@@ -396,6 +396,7 @@ compile_pass (systemtap_session& s)
+   output_exportconf(s, o2, "__module_text_address", "STAPCONF_MODULE_TEXT_ADDRESS");
+   output_exportconf(s, o2, "add_timer_on", "STAPCONF_ADD_TIMER_ON");
+   output_autoconf(s, o, cs, "autoconf-514-panic.c", "STAPCONF_514_PANIC", NULL);
++  output_autoconf(s, o, cs, "autoconf-task_work_cancel_func.c", "STAPCONF_TASK_WORK_CANCEL_FUNC", NULL);
+   
+   output_dual_exportconf(s, o2, "probe_kernel_read", "probe_kernel_write", "STAPCONF_PROBE_KERNEL");
+   output_autoconf(s, o, cs, "autoconf-hw_breakpoint_context.c",
+diff --git a/runtime/linux/autoconf-task_work_cancel_func.c b/runtime/linux/autoconf-task_work_cancel_func.c
+new file mode 100644
+index 000000000..0d460de6c
+--- /dev/null
++++ b/runtime/linux/autoconf-task_work_cancel_func.c
+@@ -0,0 +1,3 @@
++#include <linux/task_work.h>
++
++void* c = & task_work_cancel_func;
+diff --git a/runtime/linux/runtime.h b/runtime/linux/runtime.h
+index a5840794a..acb32d584 100644
+--- a/runtime/linux/runtime.h
++++ b/runtime/linux/runtime.h
+@@ -246,7 +246,7 @@ static void *kallsyms_uprobe_get_swbp_addr;
+ static void *kallsyms_task_work_add;
+ #endif
+ #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
+-static void *kallsyms_task_work_cancel;
++static void *kallsyms_task_work_cancel_fn;
+ #endif
+ 
+ #if !defined(STAPCONF_TRY_TO_WAKE_UP_EXPORTED) && !defined(STAPCONF_WAKE_UP_STATE_EXPORTED)
+diff --git a/runtime/stp_task_work.c b/runtime/stp_task_work.c
+index 0dd3095b6..4818fecbf 100644
+--- a/runtime/stp_task_work.c
++++ b/runtime/stp_task_work.c
+@@ -3,14 +3,25 @@
+ 
+ #include "linux/task_work_compatibility.h"
+ 
++// Handle kernel commit 68cbd415dd4b9c5b9df69f0f091879e56bf5907a
++// task_work: s/task_work_cancel()/task_work_cancel_func()/
++#if defined(STAPCONF_TASK_WORK_CANCEL_FUNC)
++#define TASK_WORK_CANCEL_FN task_work_cancel_func
++#else
++#define TASK_WORK_CANCEL_FN task_work_cancel
++#endif
++
++#define STRINGIFY(x) #x
++#define TOSTRING(x) STRINGIFY(x)
++
+ #if !defined(STAPCONF_TASK_WORK_ADD_EXPORTED)
+ // First typedef from the original decls, then #define as typecasted calls.
+ typedef typeof(&task_work_add) task_work_add_fn;
+ #define task_work_add(a,b,c) ibt_wrapper(int, (* (task_work_add_fn)kallsyms_task_work_add)((a), (b), (c)))
+ #endif
+ #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
+-typedef typeof(&task_work_cancel) task_work_cancel_fn;
+-#define task_work_cancel(a,b) ibt_wrapper(struct callback_head *, (* (task_work_cancel_fn)kallsyms_task_work_cancel)((a), (b)))
++typedef typeof(&TASK_WORK_CANCEL_FN) task_work_cancel_fn;
++#define task_work_cancel(a,b) ibt_wrapper(struct callback_head *, (* (task_work_cancel_fn)kallsyms_task_work_cancel_fn)((a), (b)))
+ #endif
+ 
+ /* To avoid a crash when a task_work callback gets called after the
+@@ -35,9 +46,9 @@ stp_task_work_init(void)
+         }
+ #endif
+ #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
+-        kallsyms_task_work_cancel = (void *)kallsyms_lookup_name("task_work_cancel");
+-        if (kallsyms_task_work_cancel == NULL) {
+-		_stp_error("Can't resolve task_work_cancel!");
++        kallsyms_task_work_cancel_fn = (void *)kallsyms_lookup_name(TOSTRING(TASK_WORK_CANCEL_FN));
++        if (kallsyms_task_work_cancel_fn == NULL) {
++                _stp_error("Can't resolve %s!", TOSTRING(TASK_WORK_CANCEL_FN));
+ 		return -ENOENT;
+         }
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 68f5c76428..c2874516f4 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -9,6 +9,7 @@ require systemtap_git.inc
 SRC_URI += " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
+           file://0001-Make-stp_task_work-compatible-with-6.11-kernels.patch \
            "
 
 DEPENDS = "elfutils"
-- 
2.34.1


