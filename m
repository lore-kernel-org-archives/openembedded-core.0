Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77180C00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:44:05 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.50685.1660877039527976635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gj+3tlh0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id d71so2685727pgc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=PyU5sVpiYpV6cdj17o0SnUD77Eh6kH9nKr/wgAQ+omU=;
        b=gj+3tlh0hMjWmEPvau/3AWhSMcddv4jX4tZEfuMmX6aq20eYN0mpSRX73krlSaOI4a
         IX9enu5e64Kx92CmByy6+dnqO/2J+kZfswwEKCiNFbzReHdZitLkLDL8PP5TexWI4Ter
         c5Ms9rvjEU76EMxmZfmWjkhy3SFRm+5uByKWxVGyaWgchYbh3huLHCw4UHlLM0g+5w0B
         fAfu8BtKAVd0ZK+Lk5QvX1tVZM/dLmrcJa8Jg4vvJOJfldO2ggiZUt0y2irmq2scizrU
         Pp1wgTzvcM+0+05shn1cl84TyG7FaNFmOcy3bHkTo6Owm+jkN+zpgrrV4RhCkWQBol2i
         AFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=PyU5sVpiYpV6cdj17o0SnUD77Eh6kH9nKr/wgAQ+omU=;
        b=rNPxhqDhKHkOsck4S2WIcgu23OuuO5MkdIWkRSuuhc9wMJKtlUFCVhwTtfUr9qwcav
         TmOxPLQXOwZ2gZVGUoluNKtrVac6OJaisowYQ7tNh00Ejb65INgdyOtxOn4eM2Cf/9iY
         dnMvmY+ZAONFbt/IlEgPtYuCm9zoetJqodzppvgZNibBsc8CCX2hbzEmrmiq5BJ+HI7D
         PdxrMvq2CLx2EL6DEUFJwmANkJ+V1WWpoSCNm7ziSN6tVJxvejTA+xzB21+VBAbXcGvj
         bfoc2COdV973JTxX2aERXl/GD0/+2B4XY01PzbLx1kVCM34k2CrDLBS20xwUK6OQl+14
         /j5g==
X-Gm-Message-State: ACgBeo2tJUyesoBs8sRubZBh+naADpXgF3kQy7OhzemelEsGl1xAiGZb
	B+89xRqTMIZqIieSam9LrXMYmBcWEvlNYe4c
X-Google-Smtp-Source: 
 AA6agR53BH00FdLhrigFb0CsuSnj8UGhejATA3RKFs1J5475MBlsEUegMEmu+fDDUsE3BxUk5i6boA==
X-Received: by 2002:a62:bd03:0:b0:536:150c:a1c0 with SMTP id
 a3-20020a62bd03000000b00536150ca1c0mr214582pff.19.1660877040511;
        Thu, 18 Aug 2022 19:44:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/26] lttng-modules: fix build against mips and
 v5.19 kernel
Date: Thu, 18 Aug 2022 16:42:47 -1000
Message-Id: 
 <86c10960e27efaa2958abcb0ca5cb2d6eea0480f.1660876844.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/169568

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


