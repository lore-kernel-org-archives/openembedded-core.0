Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382E1CAC59F
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:25 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.33509.1758139521130224472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=caPSwzX+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7723f0924a3so336999b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139520; x=1758744320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mU6LdNi8h1I6taaDE+PNdy8Br8781H9h1fOhy2h0X/k=;
        b=caPSwzX+ph6v6ln5SCqsqwcpfeykKZ9t0kxRzMaFgdfrcVQY8Xg2unMuTMqlnmPGKU
         JdPHxBXnluxSJ0D3jr8xgeDo+IOtxNDhclLYJP9oG4n9fvxZbZI2L5OgggeQss3Ri4oZ
         JUfZFLKPa2jJjXhFLpbg0RxoGzOSFTY45v9dGxGcX+3gSQ2nkS1LMJKfKeb/tPLloRF/
         FnzqlaGj3XwXl2wJjTP/6ZZ3qOkU0SSbHttKFVzrCLoJNnznevWDoqFD7Ls+Sw2JtVXq
         jSK+WWY6XNY7UkiwkhtDX57MiDHqLpv6zMKbAYr5KFsmq+/Bls54Cop9XrBZ7VaXkdKl
         Vm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139520; x=1758744320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mU6LdNi8h1I6taaDE+PNdy8Br8781H9h1fOhy2h0X/k=;
        b=o++xYWLb4xjlWM55NR0dReza8uinXZnrTNUpMsikenevrbr15KAkjmsX3PkHTb3+Wq
         JCjiF+qym3nBZDWYsFOpIdynT3NWAicUjvCSfopvbxYDxfNqFH51XkHVbqDNHy4F6NG9
         0yexgFoDOgUM43sK+a6cfODvjLRwdCUay8kSYLZf8VGZJg+deDd7H4B1AluoSKqlAPuU
         uvGZOull3IesWP8k8z9qQz85sV7yEzEeAF/4PCRqq1oyTF1m/9GWAWD2qrD8Pfb/dwtt
         HpXqCFapEbJESp41jHDMP6NpR0qhPH2fnbh/2hnbGHQ3RHqO6f3qfeaUAgNBRWQu25Yz
         4duA==
X-Gm-Message-State: AOJu0YxHvRyo7fuxIC2ouKnj7zh6HKGUUuGIcqv1kcIhb7OFLugrBZDb
	QcGOLDWh167x9FzqEgFxv/LTaFux1O3krgEUJtbWGKB18mycLaPBeE5dH2ZVkbdatCUPzSLm47O
	Ym3tJ
X-Gm-Gg: ASbGncvFpSJ3cOgEO1ai/oAdUpeF/BX9cTcArTAuji1lHnFR8VuiSpuK1oFc9TmLt+V
	asAILuPyFDoFnYgYoJfOo2p4NtyvzufBwMAUVUYVol3iFN7gCHi0vWs4+HnWjk42JW995u45fnK
	5fKpV57vMf9+I6s22oyOsZfZVqGsbNhg0Twm9TJWXFPJ8J39sBTMtPRrbbhrxk+L5BCLpQffiXY
	OF3Icsl0JjKLzhV+st3kh1qGKqyn5rBssmZTZeCbc01yGed7esDQ0LrVRZoWKeztPdOtITBZoor
	GviA/SC1LVgzNZ/RiXlx5hS6Eah0wkYPbx2dzxxT413Ngu13Hd3oQ7kKz93SbIgkWg6K8t8FM5T
	t3L/Gp/clN/dvJqO3bM1+dVhPGSd8JeLs
X-Google-Smtp-Source: AGHT+IEZTSUz60puxGQ9thz6+L2aigqjFYyN6ZKlcoQCpamqn0Pw9to4lUa4g5f3UVv2QkLRHiqFuQ==
X-Received: by 2002:a05:6a00:230c:b0:776:1a2a:6baf with SMTP id d2e1a72fcca58-77bf96609f6mr4527011b3a.32.1758139520288;
        Wed, 17 Sep 2025 13:05:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] systemtap: Fix task_work_cancel build
Date: Wed, 17 Sep 2025 13:04:42 -0700
Message-ID: <58509b54a464cd5b692ad4ef8dd333eb9c14abfa.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223620

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


