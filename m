Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3952C19F2A
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 17:51:25 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.1470.1660153875735542747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 10:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxAOGIpj;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id b7so11540545qvq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=L1MaaW0Wb/omAh970Ixh0/JwsvLZVm+IAf551CyFIPg=;
        b=XxAOGIpj0KxCV9wmeoLCcYAUu8lhu6ex85JbiZUiEM3lWo115IwfscgvAuVlf72rFi
         uj2frLTO1GPmWFnJHZeyqoCsH61X2TWTJSkSX1XLyp7PCuqGK4bDmO0WdL8Mf66ryUVD
         7Wri8VCHOt7UoVf4Y0GPnYyej9YygwGoXGWYLTNR9B+5PrH33QuJTdLCBC8I+Djm4GGw
         bUeB9Pg+TbNG0a2FRQwopttVKlpgHZ6BWNimTgCK2T+LFRKes1wxbosJo+rW/0G25cZ4
         B8srCmjVrJQnpNmO0sLLbixwgAwalCY6MLnUKYbJVcxrRJTysFYN94oFu5Rz/bPDdj3d
         XEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=L1MaaW0Wb/omAh970Ixh0/JwsvLZVm+IAf551CyFIPg=;
        b=Fb8BwLkIs8MhfUlvWTnapVbcxmcYcRCF27nOzoOrLi2jwx4gbH2cpXES9X41NCeBQ2
         a3N1cmaEz1Omi7GDDw0RGrRzEbWX8lMQF8lINS5ADzjfRNHeqEBJN5ZLOGO4M2/Z+J1c
         QGLc6ZicJao/iqF0nvU9rW9W1/01hcf4KdoXCSreImnwDB1147MZFC+7YIP2YxBX6kwE
         4DVUaDvl+OslNpH3gkp5Bp/sZxSBpgfh7smn4jgyVrljGl9rW/9PyqnApXB5BYUgcVkg
         UZh1PdOjmGR2ou1GR0OfzWvUyX/qYw06vWmrGnIeMKeusNBB7XkGmnaPtO2xJxdfkSXw
         +G3w==
X-Gm-Message-State: ACgBeo3lHkVtPE423JuOGrr/YmRlOiV/BXfUbTEdLr0LbOpcMjMR+2AD
	1J0pGj9/AdFwcJF+s+WY72Fh6emr+8/7Zg==
X-Google-Smtp-Source: 
 AA6agR4nhXuzbluC5SX3cCQTg7YostNdBX8MV1KWB/vmiKEfxRaK+th2sgjaRfZoQ7OllqmtfTsThQ==
X-Received: by 2002:a05:6214:e89:b0:47b:2839:5877 with SMTP id
 hf9-20020a0562140e8900b0047b28395877mr16573137qvb.112.1660153874550;
        Wed, 10 Aug 2022 10:51:14 -0700 (PDT)
Received: from localhost.localdomain ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bj11-20020a05620a190b00b006b5df4d2c81sm249355qkb.94.2022.08.10.10.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 10:51:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: replace mips compaction fix with upstream
 change
Date: Wed, 10 Aug 2022 13:51:12 -0400
Message-Id: <20220810175112.3879638-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 17:51:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169200

From: Bruce Ashfield <bruce.ashfield@gmail.com>

lttng upstream had a different solution to the compaction build isses
seen on mips.

We switch our patch for a backport of the upstream solution.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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


