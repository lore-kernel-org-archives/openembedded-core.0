Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D80C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 23:04:28 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.159.1659740659478422603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 16:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FyABeHK5;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id p4so1717534qkm.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=cb//k/7erf+6N7ADIN8MsLkm7SoTdsh0LCBPV2qUqMs=;
        b=FyABeHK5bdZu4iI8z+bFoVwcy0Ihaa0pA30wCVYwJ8LINFcHrjcqD1cN3cJ4KgE+9a
         zZjlTxtGiBy1hlkRl8SGRiguB+snA62mj7whsG2JQtw8H4TMktcRlNLb3WjAbFpOECOR
         KnYEdPlXP+Au9CT5EoAUwp1vsLxSu1DbAHk5gqlyzNyCAqgPmgaV+ovehI58HKoqxNzq
         0oRuP07Pi349QSFvLvY0C3gpEMKguEF9KHDsRA6NsTODk+P8BUmvhPvg3LFVIjbl/WzS
         pKcowQMLxqfY+7kvSjQGkS1RqjpCwwg+7leLIq1F8xXn5yv5KRVCbCVGcFXhyJuDpheT
         6f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=cb//k/7erf+6N7ADIN8MsLkm7SoTdsh0LCBPV2qUqMs=;
        b=SofwMKjDrYDCL9hIA4MNaJq0jnniLv4U7qXM5JjgaMlUbGj1FkqjmuEVwK/vMf1fww
         1VhvNlYca8atFiVPrqs+NnxNJ5MZVA30+UR1cSMF8YBp/9Jrd00sAa0RROixTu5OxOX/
         wGt1Am2+u+KHvx6P/NjMTZ+O//i4JAqrJMsHf67cdfnPPUzV5wrlA/6JBHyZdbzBnNAf
         Fb5kKL3aRuoDT4VDBGJ6l7lWmG06WZpdT++0GLEG6EL41xNgKHKczFV7tV67P6m2G8Dm
         JCKgWPt20ApyTw+E1c9mf5Ro+Ms7qNcbdHARWtxEFXNM0IKkYeeCHFB1pey6VypKbBv4
         QRHQ==
X-Gm-Message-State: ACgBeo00R1syeDMI6eSwUY6FdltOpBlps4c0Tqb6AzHu4ApwzwagntSm
	9Yg3tKnpgN9z2qUjx/XR+dt/6sYzIp1q9w==
X-Google-Smtp-Source: 
 AA6agR4Q7wcHnHZOxGuIztCiZPJh+vAv6OQb7Tm3IgWA5dUf6kDNL/X1/R8DX5WFDJhYZ76gkMkpiw==
X-Received: by 2002:a05:620a:4146:b0:6b8:983a:7eea with SMTP id
 k6-20020a05620a414600b006b8983a7eeamr6464560qko.699.1659740658275;
        Fri, 05 Aug 2022 16:04:18 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 s8-20020a05620a0bc800b006b5c061844fsm3675609qki.49.2022.08.05.16.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 16:04:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][v2] lttng-modules: fix build against mips and v5.19 kernel
Date: Fri,  5 Aug 2022 19:04:15 -0400
Message-Id: <20220805230416.56607-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 23:04:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168968

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building against a v5.19 mips kernel, the following errors
were triggered:

  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:105:42: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
  |   105 |         TP_PROTO(struct compact_control *cc,
  |       |                  ~~~~~~~~~~~~~~~~~~~~~~~~^~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:779:68: note: in definition of macro 'LTTNG_TRACEPOINT_EVENT_CLASS_CODE'
  |   779 | static inline size_t __event_get_align__##_name(void *__tp_locvar, _proto)    \
  |       |                                                                    ^~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:106:50: note: in expansion of macro 'PARAMS'
  |   106 |         LTTNG_TRACEPOINT_EVENT_CLASS_CODE(_name, PARAMS(_proto), PARAMS(_args), , , \
  |       |                                                  ^~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:41:9: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_CLASS'
  |    41 |         LTTNG_TRACEPOINT_EVENT_CLASS(map,                               \
  |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:42:30: note: in expansion of macro 'PARAMS'
  |    42 |                              PARAMS(proto),                             \
  |       |                              ^~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:101:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
  |   101 | LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
  |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:105:9: note: in expansion of macro 'TP_PROTO'
  |   105 |         TP_PROTO(struct compact_control *cc,
  |       |         ^~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:112:57: error: invalid use of undefined type 'struct compact_control'

...

  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:108:25: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
  |   108 |         TP_PROTO(struct compact_control *cc,
  |       |                         ^~~~~~~~~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:159:43: note: in definition of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
  |   159 | void __event_template_proto___##_template(_proto);
  |       |                                           ^~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:45:61: note: in expansion of macro 'PARAMS'
  |    45 |         LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
  |       |                                                             ^~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:104:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
  |   104 | LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
  |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:108:9: note: in expansion of macro 'TP_PROTO'
  |   108 |         TP_PROTO(struct compact_control *cc,
  |       |         ^~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:159:6: error: conflicting types for '__event_template_proto___compaction_migratepages'; have 'void(struct compact_control *, unsigned int)'
  |   159 | void __event_template_proto___##_template(_proto);
  |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:45:9: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
  |    45 |         LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
  |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The root cause appears to be that this particular mips kernel does not
have CONFIG_COMPACTION avaiable, and hence we end up with the struct
declaration within this tracepoint, and then conflicting types.

While putting the conditional around only compaction_migratepages seemed
sufficient to get the build working, it doesn't look like any of the
tracepoints should be valid, so we extend it to all definitions.

Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-August/030246.html]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: rebased to latest master to take into account another merged lttng
patch.

Anyone that was trying v1 would have seen this, and has probably already
resolved it, but I wanted to send v2 for completeness sake.

Bruce

 ...tracepoints-condtional-on-CONFIG_COM.patch | 103 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch
new file mode 100644
index 0000000000..305ca7cb8b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch
@@ -0,0 +1,103 @@
+From 417bb00022c813c6dc11bfa652d74f3687df7626 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Wed, 3 Aug 2022 14:55:56 -0400
+Subject: [PATCH] compaction: make tracepoints condtional on CONFIG_COMPACTION
+
+When building against a v5.19 mips kernel, the following errors
+were triggered:
+
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:105:42: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
+  |   105 |         TP_PROTO(struct compact_control *cc,
+  |       |                  ~~~~~~~~~~~~~~~~~~~~~~~~^~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:779:68: note: in definition of macro 'LTTNG_TRACEPOINT_EVENT_CLASS_CODE'
+  |   779 | static inline size_t __event_get_align__##_name(void *__tp_locvar, _proto)    \
+  |       |                                                                    ^~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:106:50: note: in expansion of macro 'PARAMS'
+  |   106 |         LTTNG_TRACEPOINT_EVENT_CLASS_CODE(_name, PARAMS(_proto), PARAMS(_args), , , \
+  |       |                                                  ^~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:41:9: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_CLASS'
+  |    41 |         LTTNG_TRACEPOINT_EVENT_CLASS(map,                               \
+  |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:42:30: note: in expansion of macro 'PARAMS'
+  |    42 |                              PARAMS(proto),                             \
+  |       |                              ^~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:101:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
+  |   101 | LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
+  |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:105:9: note: in expansion of macro 'TP_PROTO'
+  |   105 |         TP_PROTO(struct compact_control *cc,
+  |       |         ^~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:112:57: error: invalid use of undefined type 'struct compact_control'
+
+...
+
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:108:25: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
+  |   108 |         TP_PROTO(struct compact_control *cc,
+  |       |                         ^~~~~~~~~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:159:43: note: in definition of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
+  |   159 | void __event_template_proto___##_template(_proto);
+  |       |                                           ^~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:45:61: note: in expansion of macro 'PARAMS'
+  |    45 |         LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
+  |       |                                                             ^~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:104:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
+  |   104 | LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
+  |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:108:9: note: in expansion of macro 'TP_PROTO'
+  |   108 |         TP_PROTO(struct compact_control *cc,
+  |       |         ^~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:159:6: error: conflicting types for '__event_template_proto___compaction_migratepages'; have 'void(struct compact_control *, unsigned int)'
+  |   159 | void __event_template_proto___##_template(_proto);
+  |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
+  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:45:9: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
+  |    45 |         LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
+  |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The root cause appears to be that this particular mips kernel does not
+have CONFIG_COMPACTION avaiable, and hence we end up with the struct
+declaration within this tracepoint, and then conflicting types.
+
+While putting the conditional around only compaction_migratepages seemed
+sufficient to get the build working, it doesn't look like any of the
+tracepoints should be valid, so we extend it to all definitions.
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-August/030246.html]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/instrumentation/events/compaction.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
+index ecae39a..155804a 100644
+--- a/include/instrumentation/events/compaction.h
++++ b/include/instrumentation/events/compaction.h
+@@ -9,6 +9,8 @@
+ #include <linux/types.h>
+ #include <lttng/kernel-version.h>
+ 
++#ifdef CONFIG_COMPACTION
++
+ #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0)
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(compaction_isolate_template,
+@@ -97,6 +99,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
+ 
+ #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
+ 
++
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
+ 
+@@ -182,6 +185,8 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
+ )
+ #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,16,0)) */
+ 
++#endif /* CONFIG_COMPACTION */
++
+ #endif /* LTTNG_TRACE_COMPACTION_H */
+ 
+ /* This part must be outside protection */
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index fea0e383c9..a81a0e580f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
            file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
            file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
+           file://0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.19.1


