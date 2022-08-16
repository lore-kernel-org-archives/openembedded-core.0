Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE83C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 09:15:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.13491.1660641346179842681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 02:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VZd5OyQJ;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660641347; x=1692177347;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TQjnYGxw3ulhJSKZYX6t7O/nTV9MNVTr8UvLomAfTec=;
  b=VZd5OyQJk6ik85VI8rBhSfjmmSAbggHgAqTl9BX4AONME1SwmVZHtDqK
   Tw676tChoKe43GK+FYn6Tcwcq/jkMstPhiaMNe770ghLMnJ6TyVoSZBLs
   d8mQBkXpnbM9TLzzMVsUxaTJFY8bgrQmcHy/UabXnIsuJbXvCwONOQwfD
   w+tQLOaQOAAfPe9rALmD46hjBe5k8/oCvmuGmwBiAz3BkgZXtDHJPTgYD
   iiHA0y2J9Cp2Ypl4pVIV+82xyJIyWcFo6mqI1bTECz2ZJNZMOlE5Ou3qi
   blqL3xTF/1ko3fLbBzCrAUwSTACWcnxtqBgBejIAbqos7mBoQTJMQdpgL
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="318162485"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200";
   d="scan'208";a="318162485"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:15:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200";
   d="scan'208";a="667029171"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:15:46 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 2/3] lttng-modules: fix build against mips and
 v5.19 kernel
Date: Tue, 16 Aug 2022 17:35:33 +0800
Message-Id: <20220816093534.3337469-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816093534.3337469-1-naveen.kumar.saini@intel.com>
References: <20220816093534.3337469-1-naveen.kumar.saini@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 09:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169431

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

(From OE-Core rev: e25f7b5ca83d3f025ef2235f2ebd8233013eb406)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
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
2.25.1


