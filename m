Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D60EC25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.712.1659653891894122406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o27jJBGC;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id u8so710533qvv.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AMK2CKZjNfUmsxeRU6ob5foDhHmbVRgV4D3BJSb0wB0=;
        b=o27jJBGCEu+RZlO7g3NwpQdk2WFP4JssoD881v7/VnAORJ7hGaXgZPYFrRfK76/mjh
         P5t/qo/gIoyqnrnMIRCmE4+3q26hOCudSDqLRiG0KRuP6NQx3KpAo600q8hrCbX/B7fr
         VYkUe+oXCLidTryxt0csjw8zAgyPjuqiwVh57Dpm96yr4ZngitkFqAuFehyu4CPtP5D9
         ocl8/E8Y7qMriHt8Q+M6O4oKtsBurAJ/YoJBHSPmYp59ZGZm0RSMJ7lu2VFv6Mez+X9e
         lJbDsUhcjlswUggBlV8AF6zYntSxNdzaPZZBW60knMRi2X7nHLTRUrDF6PS8UU/ue0gl
         tlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AMK2CKZjNfUmsxeRU6ob5foDhHmbVRgV4D3BJSb0wB0=;
        b=Oqzpd72Dx6pcV6V+5yNLxdt00bS3AhPkAWHHsuiGty9KgxowIoxYFZjOoBPw7fCVGc
         Pvqv8vlHsBqyEuX5fhGAHH28r57GGaMTT/5DAcASA1xwtk9q1g9rWpkeDgf/pCb5XncF
         GB0x/qKp4edBcdfvxhTFa+0MjPoJ7aazWzrI6nRj2IAthrG3tZyfv9NYomG4VMuAeQB8
         gK5kwGruxu/YJmH96WEdQC/M3IOyn9W1iq4OeK424zceQVjc6EUIp2MRrW7jENtbp942
         jif02vb4wbLRKHm2QE6FgSkuQ593XbvWCLqDNnWrwbPz2sajP1SQOZRgTLPGHSMKa8Ga
         1NWQ==
X-Gm-Message-State: ACgBeo36D0XB26Z4kUktc5cXSFl2du7JO2u/mPVMPKk83/tvQ4lskEbC
	ufrN6pRfpWmGREeiyk7hcJh+IvZYnwkppg==
X-Google-Smtp-Source: 
 AA6agR6MB16SAeTicrjkh5AzyaWfZmhNIzKeutrZ16M7860ZKvZeyR/M3ByGPeOCrd/N6V0KKW56dQ==
X-Received: by 2002:ad4:5ceb:0:b0:477:49fa:88ed with SMTP id
 iv11-20020ad45ceb000000b0047749fa88edmr3305379qvb.89.1659653890747;
        Thu, 04 Aug 2022 15:58:10 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/13] lttng-modules: fix build against mips and v5.19 kernel
Date: Thu,  4 Aug 2022 18:57:46 -0400
Message-Id: 
 <6a198a09bd019599b9f09d0f05c06908c36243fe.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168873

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
index ea2ec3c380..34040ee25d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
            file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
            file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
+           file://0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.19.1


