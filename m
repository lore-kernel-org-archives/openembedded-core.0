Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD6AC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:15:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.8888.1652973314761478173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F42hw+hM;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id 11so2741287qtp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zKVRNP6DjJIECA+Tgq2sDccKsJejgiIpOZqMGZVyTgE=;
        b=F42hw+hMRKQ2AumsqxTO3UjYvcDGkboCX26FWM6mMe/Up9/NqITgNKNfXzpSpkLRNr
         j4bHlxkgJF04uBS8GKDFBblj1Bw18ALmhZelMMkru6kBBqj7doyb+PpKHKMgwVI9PXIK
         tJNdN3LpzdG0HJNSrwSNoB/mVEbAzt0NxF/D4aEAB+wuAsUTpd/HbhLivjbdPftmt+SW
         A6AO2UkPPDaiDCAmTseXkmKmmKSWs6dxJjWLdgTf/6jYSyIy/Rnzzwsc5QLvEdNnMHpE
         Td1WeNKK+NeqD4WyPJfTra+1Xp59HJW7TO8FW2ENrdYaJawTrrKQNr3EK7K6vtHJtqc1
         IF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zKVRNP6DjJIECA+Tgq2sDccKsJejgiIpOZqMGZVyTgE=;
        b=YuoNglciyEXQzF6brckNBZVc3sdEaiSP/29aSYPsDiQwy85LPB/ibC9cIZN7s1AIco
         p9r1L/6pt8WdzJOIiR19squ1u2zNtk2hUj+C4+CpFIjaStXMihSYvJXNi1dmZZEp2UFr
         VJpKj8uv1GbID3ztUw2zgZ2TKen9v8sXoM1/fOvr1XxRX8KDPb67edpTjylgjC2Yfepf
         OSkS/fFMAXpIIExNRp3QsyM7h8pAO/dwRo1VJOr+UONYEgB5iI3slP8HaupRZK/Lseat
         xaQWVYs4QNBQpnkRiVkVL0TYo4FckToyY5em38fcPqXFZbDA+dugQ4AEUZ1zWMOPfNTR
         8/nw==
X-Gm-Message-State: AOAM533/CmEk0uLa2idHw5JpiCkBWtvsmIKgjSaj4fUq2LMq9HiJvCkC
	nT3rgAJaRrCGTBhZKL7ZN2cckKCDMqJM1Q==
X-Google-Smtp-Source: 
 ABdhPJwrPNXtE4VR7I4Z5V1LS19Y9gR72KK8SZXl9w+CdUQ1+M4Fdlmap+OxwiS1piMRJ5Vlh9DUqw==
X-Received: by 2002:a05:622a:110f:b0:2f3:c9f1:ada4 with SMTP id
 e15-20020a05622a110f00b002f3c9f1ada4mr4255251qty.197.1652973313724;
        Thu, 19 May 2022 08:15:13 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 he17-20020a05622a601100b002f39b99f6c3sm1354898qtb.93.2022.05.19.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:15:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] lttng-modules: fix build against 5.18-rc7+
Date: Thu, 19 May 2022 11:15:05 -0400
Message-Id: 
 <b982f36796617300aa27c3868fb911879de615c0.1652973084.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1652973084.git.bruce.ashfield@gmail.com>
References: <cover.1652973084.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165900

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

Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-May/030185.html]
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...x-__trace_sched_switch_state-5.18-rc.patch | 88 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch
new file mode 100644
index 0000000000..1f6e8a3c34
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch
@@ -0,0 +1,88 @@
+From fbcc510cab67b918a6103c3b1903b1b69f28d399 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Thu, 19 May 2022 10:46:19 -0400
+Subject: [PATCH] sched/tracing: fix __trace_sched_switch_state (5.18-rc7+)
+
+The commit [fix: sched/tracing: Don't re-read p->state when emitting
+sched_switch event (v5.18)] was correct, but the kernel changed their
+mind with the following commit:
+
+   commit 9c2136be0878c88c53dea26943ce40bb03ad8d8d
+   Author: Delyan Kratunov <delyank@fb.com>
+   Date:   Wed May 11 18:28:36 2022 +0000
+
+       sched/tracing: Append prev_state to tp args instead
+
+       Commit fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting
+       sched_switch event, 2022-01-20) added a new prev_state argument to the
+       sched_switch tracepoint, before the prev task_struct pointer.
+
+       This reordering of arguments broke BPF programs that use the raw
+       tracepoint (e.g. tp_btf programs). The type of the second argument has
+       changed and existing programs that assume a task_struct* argument
+       (e.g. for bpf_task_storage access) will now fail to verify.
+
+       If we instead append the new argument to the end, all existing programs
+       would continue to work and can conditionally extract the prev_state
+       argument on supported kernel versions.
+
+       Fixes: fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting sched_switch event, 2022-01-20)
+       Signed-off-by: Delyan Kratunov <delyank@fb.com>
+       Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
+       Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+       Link: https://lkml.kernel.org/r/c8a6930dfdd58a4a5755fc01732675472979732b.camel@fb.com
+
+By reordering the parameters (again) we can get back up and building.
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-May/030185.html]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/instrumentation/events/sched.h | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
+index 339bec9..f9e9c38 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -23,8 +23,9 @@
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
+ 
+ static inline long __trace_sched_switch_state(bool preempt,
+-		unsigned int prev_state,
+-		struct task_struct *p)
++		struct task_struct *p,
++		struct task_struct *n,
++		unsigned int prev_state )
+ {
+         unsigned int state;
+ 
+@@ -356,20 +357,20 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_wakeup_template, sched_wakeup_new,
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
+ 		ctf_integer(pid_t, prev_tid, prev->pid)
+ 		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
+ #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
+-		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
++		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev, next, prev_state))
+ #else
+-		ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
++		ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev, next, prev_state))
+ #endif
+ 		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
+ 		ctf_integer(pid_t, next_tid, next->pid)
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index 2b00534e53..96b6491a4b 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
            file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
+           file://0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch \
           "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.19.1


