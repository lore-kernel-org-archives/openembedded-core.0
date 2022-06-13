Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FCCC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:23:07 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.6492.1655130179457989654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cafiiTAW;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.42,
 mailfrom: steve@sakoman.com)
Received: by mail-qv1-f42.google.com with SMTP id 43so4426644qvb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1bYMPpaBEP+k0G4HODdLTBu9s0ql6QFIR18J7SHz4uY=;
        b=cafiiTAW0gx7YH8k74emcPHwKAuRHKb0XJz4Lx/NgVOBSscL43dtoABsXJIOQI2mfX
         ZeWtgt9e4KbBCI6/P0YRfHcnBCGZeX12Ffaj3/v5RDrnvJFpUMbk0xIE0m56Rdf/UBRK
         rw6UXj3efjS+e8gt9EKPZHx4u1HBILF1tZJ93nDqthBdvnVOizYP7B9LhvlO0CAsxPV9
         Xj2X/Qc3rK7Gct9dc6mxeXIXGlwWjcCoWTyKKXJi+IxmoswMsVOdEcvoDVLP8nV3dQsd
         2ZZ9oCPc4iRoWcG1EQr3j5wVbmLgIpbEUdeMzzrnXQAqfDbouzeB6QwzicpQGbqF8J+R
         bKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1bYMPpaBEP+k0G4HODdLTBu9s0ql6QFIR18J7SHz4uY=;
        b=k0d+sDAb5POW9DQcDy19/6fhTh8ZT9OUc/4mX7lpsvrwUZ+B8oGwYCG6TBFiPlnE4E
         E2Lhcbow+WPx4dnsB66FctFeJxNRtMLXgBkFo6CqwW+zw9JIBSJYJAeD12obJgMcf1+F
         3YPj6KFMP1A72ccjasPQWG2buJl7pxGNQDKPoRoswTmyuaG8635m8E8kg5C5h6i2OlEZ
         bv3wFeDAINk+ISpZw+0N0O3Rb0hEqfac8sD0f4QyZ0rXBseJ/xciWR5iaTFJsIejM1Na
         14KfI7C3cwMtiEGIfYAS/h9JJQv1aApqE5/i1w0nh33Ige4NLWQXMQzFlIRM1xpDXzn5
         gTkQ==
X-Gm-Message-State: AJIora9jAzJBwj1IeE86Bejw+NL8xHgKBgSzQZNLSD3d4dOOgbDlVdyu
	SigHo1fSzGYf4//92QPICBGA4ClGfo/+yq6r
X-Google-Smtp-Source: 
 ABdhPJyLkk2FEQ2Y6gbd3UU7UnoPxZRu/HqUMGHcUh7djC6joeFAnMt53+624OpkQ9eoreSaZDhbyg==
X-Received: by 2002:a17:903:2287:b0:164:83cf:bb15 with SMTP id
 b7-20020a170903228700b0016483cfbb15mr58486525plh.49.1655130162436;
        Mon, 13 Jun 2022 07:22:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/20] lttng-modules: fix build against 5.18-rc7+
Date: Mon, 13 Jun 2022 04:21:47 -1000
Message-Id: 
 <6c689e1b6f5501b0db8b24552fe4eae033fee289.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:23:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166865

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb69e5cfb043a15354beb2d613772aa0233d12ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
2.25.1


