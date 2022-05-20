Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA91FC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 00:46:18 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.3287.1653007572251190137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 17:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=inol5Msw;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id h9so1443574qtx.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 17:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCnv/05lWpK8mHi8IpObPhilshIdE3CJF+/X9YrDXOE=;
        b=inol5Msw5+t29QedxbDxj7WWmBiZHrLM+0wa60P8WV/f1OVjKuhAZelcHd5fyf1tpb
         RWTxsXIuvdN2L2VzURVgu9r1ZKUBSdiyPDZ6IpbRU1/RskEkJH2ypRkOJyY/KXoP6Qcq
         DRQUZZDaF1NBisjPBNDzKdbS8E57uVSvX7gthK47fBZRssGhBHmwki+QPEDuO6bit/qw
         mntTsc5tm5Xn1h75bCcJ7OnLenn9De6M+qDtkhbRn/M1BdaF/BD2D2B2kH3tGBGwkMwX
         dItnTzCeomUeDEBP/gmHbpbfvauGtVqU/w9E0J7jsekk4dn5KYK/L2FvZpCELjKUfztv
         Iphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCnv/05lWpK8mHi8IpObPhilshIdE3CJF+/X9YrDXOE=;
        b=6RyTbN4hYRI6L0uFa/2ETrC3L9kMZ7mTsw9L4S33TFzwGqtCLjNsjGijblRXtysfuM
         LymLZ0WyJccaMr5ju/XdjVb7rQ/DUYxlLVhbEkhyaQshdY0k35tksIjTtyGdIzJYkvQu
         NjgMa/gRm9lvt8j7imjY7jh+Gw89Elh7FpBYi0jFcdmcGYtWtmhhfvEQU1jyjzaDbQYK
         WHDRcPxsunZuXg7kwjoN9sVjmLE9YaiLXHrgVrtg+WdjBBfnMmQfOFuzyAT1cgNfSzB0
         0FA22V/n4xXMsq5M54aftajZXeT/J5tT73q2vXDEXnR91risvvQOJrf1k8m/N+yIcYZL
         hAbg==
X-Gm-Message-State: AOAM5318Gmmutvta4d57vcSLWCiABtgZmipDC/rjG8mtEYvPB/k3tm/f
	TVBunNMZG9UwFrXi97IWsVM=
X-Google-Smtp-Source: 
 ABdhPJyTo6uCSgIcnQ3fw1XTZDzUN5CFjrHoxRNWX9ZCxbtB280R/xKd20xW7N2LQ1V3uhN3+jtz6g==
X-Received: by 2002:ac8:584d:0:b0:2f3:ec5e:3708 with SMTP id
 h13-20020ac8584d000000b002f3ec5e3708mr6054644qth.306.1653007571070;
        Thu, 19 May 2022 17:46:11 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 m124-20020a378a82000000b006a09515d012sm2137935qkd.50.2022.05.19.17.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 17:46:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] lttng-modules: fix build against 5.18-rc7+
Date: Thu, 19 May 2022 20:46:09 -0400
Message-Id: <20220520004609.21335-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 00:46:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165914

From: Bruce Ashfield <bruce.ashfield@gmail.com>

lttng-modules fails to build against 5.18-rc7, the details of the fix
are as follows:

   The commit [fix: sched/tracing: Don't re-read p->state when emitting
   sched_switch event (v5.18)] was correct, but the kernel changed their
   mind with the following commit:

      commit 9c2136be0878c88c53dea26943ce40bb03ad8d8d
      Author: Delyan Kratunov <delyank@fb.com>
      Date:   Wed May 11 18:28:36 2022 +0000

          sched/tracing: Append prev_state to tp args instead

          Commit fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting
          sched_switch event, 2022-01-20) added a new prev_state argument to the
          sched_switch tracepoint, before the prev task_struct pointer.

          This reordering of arguments broke BPF programs that use the raw
          tracepoint (e.g. tp_btf programs). The type of the second argument has
          changed and existing programs that assume a task_struct* argument
          (e.g. for bpf_task_storage access) will now fail to verify.

          If we instead append the new argument to the end, all existing programs
          would continue to work and can conditionally extract the prev_state
          argument on supported kernel versions.

          Fixes: fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting sched_switch event, 2022-01-20)
          Signed-off-by: Delyan Kratunov <delyank@fb.com>
          Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
          Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
          Link: https://lkml.kernel.org/r/c8a6930dfdd58a4a5755fc01732675472979732b.camel@fb.com

   By reordering the parameters (again) we can get back up and building.

Upstream-Status: Backport

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: upstream merged their fix for 5.18-rc7+, so I've updated with that
fix and spun v2.

Bruce


 ...g-Append-prev_state-to-tp-args-inste.patch | 59 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
new file mode 100644
index 0000000000..b41053b6bc
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
@@ -0,0 +1,59 @@
+From 9c5b8de32b5745f3ff31079c02da64595e101bee Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 17 May 2022 11:46:29 -0400
+Subject: [PATCH] fix: sched/tracing: Append prev_state to tp args instead
+ (v5.18)
+
+See upstream commit :
+
+  commit 9c2136be0878c88c53dea26943ce40bb03ad8d8d
+  Author: Delyan Kratunov <delyank@fb.com>
+  Date:   Wed May 11 18:28:36 2022 +0000
+
+    sched/tracing: Append prev_state to tp args instead
+
+    Commit fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting
+    sched_switch event, 2022-01-20) added a new prev_state argument to the
+    sched_switch tracepoint, before the prev task_struct pointer.
+
+    This reordering of arguments broke BPF programs that use the raw
+    tracepoint (e.g. tp_btf programs). The type of the second argument has
+    changed and existing programs that assume a task_struct* argument
+    (e.g. for bpf_task_storage access) will now fail to verify.
+
+    If we instead append the new argument to the end, all existing programs
+    would continue to work and can conditionally extract the prev_state
+    argument on supported kernel versions.
+
+
+Upstream-Status: Backport
+
+Change-Id: Ife2ec88a8bea2743562590cbd357068d7773863f
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/sched.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
+index 339bec94..c1c3df15 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -356,11 +356,11 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_wakeup_template, sched_wakeup_new,
+ LTTNG_TRACEPOINT_EVENT(sched_switch,
+ 
+ 	TP_PROTO(bool preempt,
+-		unsigned int prev_state,
+ 		struct task_struct *prev,
+-		struct task_struct *next),
++		struct task_struct *next,
++		unsigned int prev_state),
+ 
+-	TP_ARGS(preempt, prev_state, prev, next),
++	TP_ARGS(preempt, prev, next, prev_state),
+ 
+ 	TP_FIELDS(
+ 		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index 2b00534e53..a5e6b906d2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
            file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
+           file://0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch \
           "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.19.1


