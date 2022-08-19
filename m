Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0A9C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:44:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.50688.1660877043895786939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PYMcWvFf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id h28so3163777pfq.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=58dZJpajNF3InL8laB0DuuK433rhBKRv2Rtvrmld8aI=;
        b=PYMcWvFfMuSywWNLMi5C/PRUVJtY3X4g5rCjDbtu3CCsWaCPETtL2xDXkaVTLbEeJx
         OVI6mfv9DndowHje+GiqJySM1y+wgc7t0otRjqOncfUgn+jGPd8RORRGgAwzFciryzLn
         zvx3Qyj5fgyjoTGZRwDlE7Yzog7ymgZTm810iNs55DdMY2xNAxYCCM3HGIVHmWeqZ7gQ
         XJn+4WFqWymWK3L0S/PYVIbuBwWKNoFEtJ9dDQcSuq+zX/sCshLfDrRc57y41Rx5P+ty
         UH/IvDBMBUc1qvp7E9kFfYwYcuE+OfTQTaOlbHCsifYwJbifA0qJWkgR1eBcCirhji8X
         Sqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=58dZJpajNF3InL8laB0DuuK433rhBKRv2Rtvrmld8aI=;
        b=a7tOZYC+Wk3K7KnLPlCfC3kyuCgRLQHG7u90LTEfxDAtkDLpxmJyhKoD1/cAKG8vnS
         o49SVguSAAxltUHQaH5FXIz+hE3MaGELwNsuW5b8TDU5TbF77dTCFDBNrA4Fq5+JTQ0N
         1Ez+pF67fI0oVa/VQO+P8mOUqJEfZLuraJewhJEI7E6fCs7m1EjXakh9RNYv/YbTKD5m
         wrAEBc9afdQY0hRmt1ikzjDOONAmzIM1hWORAebjHDM5PFPHOxEQCT0bkP4KxS7RVEmk
         x7l/FruY/5LZUEL9rfjHaXnyWUfJHC90a1iK4C1N+E6BcS1fb+6FBoMx/VixddlKCmHk
         3Cbg==
X-Gm-Message-State: ACgBeo0opLU5Uws3iJLpn2NLb7GSPuwLdPzCyqtsMff01NpF9smBEr7V
	PF5ThaHXAonXaXJ23yhXLYY5e7nwb/Uen2rP
X-Google-Smtp-Source: 
 AA6agR6B9SrxJPhsItOUgmzlPBFnO2ZrHbXNsYvcxRIKPTfaS7P4qJoPHvRWC+d6NfM0ig/stELuSA==
X-Received: by 2002:a05:6a00:32ca:b0:535:e7e4:dfb3 with SMTP id
 cl10-20020a056a0032ca00b00535e7e4dfb3mr4035124pfb.6.1660877042787;
        Thu, 18 Aug 2022 19:44:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:44:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/26] lttng-modules: replace mips compaction fix
 with upstream change
Date: Thu, 18 Aug 2022 16:42:48 -1000
Message-Id: 
 <10891d4d955f347c328cf8c099031f05f5c855a2.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169569

From: Bruce Ashfield <bruce.ashfield@gmail.com>

lttng upstream had a different solution to the compaction build isses
seen on mips.

We switch our patch for a backport of the upstream solution.

(From OE-Core rev: 459f746a198a8ae7840d783f5824fc14a44a8488)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tracepoints-condtional-on-CONFIG_COM.patch | 103 ------------------
 .../lttng-modules/0001-fix-compaction.patch   |  68 ++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   2 +-
 3 files changed, 69 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch
deleted file mode 100644
index 305ca7cb8b..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 417bb00022c813c6dc11bfa652d74f3687df7626 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Wed, 3 Aug 2022 14:55:56 -0400
-Subject: [PATCH] compaction: make tracepoints condtional on CONFIG_COMPACTION
-
-When building against a v5.19 mips kernel, the following errors
-were triggered:
-
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:105:42: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
-  |   105 |         TP_PROTO(struct compact_control *cc,
-  |       |                  ~~~~~~~~~~~~~~~~~~~~~~~~^~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:779:68: note: in definition of macro 'LTTNG_TRACEPOINT_EVENT_CLASS_CODE'
-  |   779 | static inline size_t __event_get_align__##_name(void *__tp_locvar, _proto)    \
-  |       |                                                                    ^~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:106:50: note: in expansion of macro 'PARAMS'
-  |   106 |         LTTNG_TRACEPOINT_EVENT_CLASS_CODE(_name, PARAMS(_proto), PARAMS(_args), , , \
-  |       |                                                  ^~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:41:9: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_CLASS'
-  |    41 |         LTTNG_TRACEPOINT_EVENT_CLASS(map,                               \
-  |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:42:30: note: in expansion of macro 'PARAMS'
-  |    42 |                              PARAMS(proto),                             \
-  |       |                              ^~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:101:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
-  |   101 | LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
-  |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:105:9: note: in expansion of macro 'TP_PROTO'
-  |   105 |         TP_PROTO(struct compact_control *cc,
-  |       |         ^~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:112:57: error: invalid use of undefined type 'struct compact_control'
-
-...
-
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:108:25: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
-  |   108 |         TP_PROTO(struct compact_control *cc,
-  |       |                         ^~~~~~~~~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:159:43: note: in definition of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
-  |   159 | void __event_template_proto___##_template(_proto);
-  |       |                                           ^~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:45:61: note: in expansion of macro 'PARAMS'
-  |    45 |         LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
-  |       |                                                             ^~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:104:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
-  |   104 | LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
-  |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/instrumentation/events/compaction.h:108:9: note: in expansion of macro 'TP_PROTO'
-  |   108 |         TP_PROTO(struct compact_control *cc,
-  |       |         ^~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:159:6: error: conflicting types for '__event_template_proto___compaction_migratepages'; have 'void(struct compact_control *, unsigned int)'
-  |   159 | void __event_template_proto___##_template(_proto);
-  |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
-  | lttng-modules-2.13.4/src/probes/../../include/lttng/tracepoint-event-impl.h:45:9: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
-  |    45 |         LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
-  |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The root cause appears to be that this particular mips kernel does not
-have CONFIG_COMPACTION avaiable, and hence we end up with the struct
-declaration within this tracepoint, and then conflicting types.
-
-While putting the conditional around only compaction_migratepages seemed
-sufficient to get the build working, it doesn't look like any of the
-tracepoints should be valid, so we extend it to all definitions.
-
-Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2022-August/030246.html]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- include/instrumentation/events/compaction.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
-index ecae39a..155804a 100644
---- a/include/instrumentation/events/compaction.h
-+++ b/include/instrumentation/events/compaction.h
-@@ -9,6 +9,8 @@
- #include <linux/types.h>
- #include <lttng/kernel-version.h>
- 
-+#ifdef CONFIG_COMPACTION
-+
- #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0)
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(compaction_isolate_template,
-@@ -97,6 +99,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
- 
- #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
- 
-+
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
- LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
- 
-@@ -182,6 +185,8 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
- )
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,16,0)) */
- 
-+#endif /* CONFIG_COMPACTION */
-+
- #endif /* LTTNG_TRACE_COMPACTION_H */
- 
- /* This part must be outside protection */
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
new file mode 100644
index 0000000000..21e27ffc5e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
@@ -0,0 +1,68 @@
+From 8e42c4821fb5f5cb816b6ddf73d9a13ba3298a63 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 10 Aug 2022 11:07:14 -0400
+Subject: [PATCH] fix: tie compaction probe build to CONFIG_COMPACTION
+
+The definition of 'struct compact_control' in 'mm/internal.h' depends on
+CONFIG_COMPACTION being defined. Only build the compaction probe when
+this configuration option is enabled.
+
+Thanks to Bruce Ashfield <bruce.ashfield@gmail.com> for reporting this
+issue.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/8660]
+
+Change-Id: I81e77aa9c1bf10452c152d432fe5224df0db42c9
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ src/probes/Kbuild | 34 ++++++++++++++++++----------------
+ 1 file changed, 18 insertions(+), 16 deletions(-)
+
+diff --git a/src/probes/Kbuild b/src/probes/Kbuild
+index 2908cf75..3e556b8e 100644
+--- a/src/probes/Kbuild
++++ b/src/probes/Kbuild
+@@ -167,22 +167,24 @@ ifneq ($(CONFIG_BTRFS_FS),)
+   endif # $(wildcard $(btrfs_dep))
+ endif # CONFIG_BTRFS_FS
+ 
+-# A dependency on internal header 'mm/internal.h' was introduced in v5.18
+-compaction_dep = $(srctree)/mm/internal.h
+-compaction_dep_wildcard = $(wildcard $(compaction_dep))
+-compaction_dep_check = $(shell \
+-if [ \( $(VERSION) -ge 6 \
+-   -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
+-   -z "$(compaction_dep_wildcard)" ] ; then \
+-  echo "warn" ; \
+-else \
+-  echo "ok" ; \
+-fi ;)
+-ifeq ($(compaction_dep_check),ok)
+-  obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
+-else
+-  $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
+-endif # $(wildcard $(compaction_dep))
++ifneq ($(CONFIG_COMPACTION),)
++  # A dependency on internal header 'mm/internal.h' was introduced in v5.18
++  compaction_dep = $(srctree)/mm/internal.h
++  compaction_dep_wildcard = $(wildcard $(compaction_dep))
++  compaction_dep_check = $(shell \
++  if [ \( $(VERSION) -ge 6 \
++     -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
++     -z "$(compaction_dep_wildcard)" ] ; then \
++    echo "warn" ; \
++  else \
++    echo "ok" ; \
++  fi ;)
++  ifeq ($(compaction_dep_check),ok)
++    obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
++  else
++    $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
++  endif # $(wildcard $(compaction_dep))
++endif # CONFIG_COMPACTION
+ 
+ ifneq ($(CONFIG_EXT4_FS),)
+   ext4_dep = $(srctree)/fs/ext4/*.h
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index a81a0e580f..f60ab3b5f5 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
            file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
            file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
-           file://0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch \
+           file://0001-fix-compaction.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


