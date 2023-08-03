Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2340BEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 04:55:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.7661.1691038512292978251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 21:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bF/pEMsE;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68706d67ed9so373794b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691038511; x=1691643311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bXXb8wmdQkXp+x7eZ7JH85xHwsQILM6IN+UmG0Wcc4=;
        b=bF/pEMsEsWYcBFOzbpmd1lNPPEg2mTvZdHIDG3Bs5zi7GBzB9VC1oiD+av4Yh8sbBK
         gYLga+8HLLwoQQytbXeOyfEt5EGvgnyLLsZKY19sncE99J9+HLC6gZtgZLsbPQng1F0I
         E0O4ODhjeWY9of828ti7m9yWkhiLXE16qczvhBh2d5lP0ZFze60T1JB0nxDVXsRkPGI8
         QaZXlRIqPKb379pgbSuRZVZEJJhlM4IWWpGK71uutoQ2sxnZqgW/aokhQ0cZNO+eLcik
         AF/H+weyDQ2OyHCav0thQnJ909H8mP27cldhRed0bgqwTcSPckT1Pkr093GArftpf3Gj
         j0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691038511; x=1691643311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bXXb8wmdQkXp+x7eZ7JH85xHwsQILM6IN+UmG0Wcc4=;
        b=liQ3xcaYcmpkMXnkFCYzlio9hFsIjGsqZ7i9hnqEfcEJNTqUWfvKjoLCFlEa49dOm3
         FYxgDNFPNQ9LVyJPlw2q8o7qETLoMifXlLgmmPqOh0FY/NiNWEcg8pTYEvDad4CdqoAy
         Qf1hmRX+Nf0MW9OlHL1f5RTdPrs6YNVg1oN6b78KaTzPAPbKfHZvaP7El/sLyRoFRZt8
         tJuDQ3Wu/4cTZk7zPfhIyBe/0BX3CE3zUriuscgxUDydGEEa4dM8cjV7xMdvAgPu7GoL
         Er8WmnER0tSg9XOGIOVqwl8XE9jDzYn+qhrPEISR61nUgIKX33rkDODIbN/2H0WWP4kh
         KPcw==
X-Gm-Message-State: ABy/qLZeWs6RIvgpLO09gmeU/KSmc/qh6H7LFkZiBn65incC+QHJZaqR
	3fP5FWKF1twD8JHftlbIN5srztXrbRY7Wg==
X-Google-Smtp-Source: APBJJlH+ksU7qAggusOZcwsHKSM8MMsLhaSWy8ZZisxy9Z7G/01tQy1rY/TZRSYeiHt9IqjeFeqfFQ==
X-Received: by 2002:a05:6a20:1441:b0:138:1c5b:22fc with SMTP id a1-20020a056a20144100b001381c5b22fcmr21829855pzi.54.1691038511295;
        Wed, 02 Aug 2023 21:55:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902ed5200b001993a1fce7bsm13304662plb.196.2023.08.02.21.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 21:55:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Make 254 work on musl
Date: Wed,  2 Aug 2023 21:55:08 -0700
Message-ID: <20230803045508.80659-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 04:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185454

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-malloc_trim-conditional-on-glibc.patch | 39 +++++++++++++++
 ...hared-Do-not-use-malloc_info-on-musl.patch | 50 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_254.bb      |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-malloc_info-on-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch
new file mode 100644
index 00000000000..c9ec00012e8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch
@@ -0,0 +1,39 @@
+From 148645ba8b62f04c7c5ff5907378663f97880f22 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Aug 2023 12:06:27 -0700
+Subject: [PATCH 1/4] sd-event: Make malloc_trim() conditional on glibc
+
+musl does not have this API
+
+Upstream-Status: Inappropriate [musl-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libsystemd/sd-event/sd-event.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-event/sd-event.c
+index aba458185b..48c94a7672 100644
+--- a/src/libsystemd/sd-event/sd-event.c
++++ b/src/libsystemd/sd-event/sd-event.c
+@@ -1874,7 +1874,7 @@ _public_ int sd_event_add_exit(
+ }
+
+ _public_ int sd_event_trim_memory(void) {
+-        int r;
++        int r = 0;
+
+         /* A default implementation of a memory pressure callback. Simply releases our own allocation caches
+          * and glibc's. This is automatically used when people call sd_event_add_memory_pressure() with a
+@@ -1888,7 +1888,9 @@ _public_ int sd_event_trim_memory(void) {
+
+         usec_t before_timestamp = now(CLOCK_MONOTONIC);
+         hashmap_trim_pools();
++#ifdef __GLIBC__
+         r = malloc_trim(0);
++#endif
+         usec_t after_timestamp = now(CLOCK_MONOTONIC);
+
+         if (r > 0)
+--
+2.41.0
+
diff --git a/meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-malloc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-malloc_info-on-musl.patch
new file mode 100644
index 00000000000..8e386551a19
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-malloc_info-on-musl.patch
@@ -0,0 +1,50 @@
+From 9430646e72ea5d260ade300038a6d976fecf7da5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Aug 2023 12:20:40 -0700
+Subject: [PATCH 4/4] shared: Do not use malloc_info on musl
+
+Upstream-Status: Inappropriate [musl-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/bus-util.c      | 5 +++--
+ src/shared/common-signal.c | 4 ++--
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+--- a/src/shared/bus-util.c
++++ b/src/shared/bus-util.c
+@@ -617,15 +617,16 @@ static int method_dump_memory_state_by_f
+         _cleanup_close_ int fd = -EBADF;
+         size_t dump_size;
+         FILE *f;
+-        int r;
++        int r = 0;
+ 
+         assert(message);
+ 
+         f = memstream_init(&m);
+         if (!f)
+                 return -ENOMEM;
+-
++#ifdef __GLIBC__
+         r = RET_NERRNO(malloc_info(/* options= */ 0, f));
++#endif
+         if (r < 0)
+                 return r;
+ 
+--- a/src/shared/common-signal.c
++++ b/src/shared/common-signal.c
+@@ -65,12 +65,12 @@ int sigrtmin18_handler(sd_event_source *
+                         log_oom();
+                         break;
+                 }
+-
++#ifdef __GLIBC__
+                 if (malloc_info(0, f) < 0) {
+                         log_error_errno(errno, "Failed to invoke malloc_info(): %m");
+                         break;
+                 }
+-
++#endif
+                 (void) memstream_dump(LOG_INFO, &m);
+                 break;
+         }
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index 7ba4233f6a2..ea1a4f02f05 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -53,6 +53,8 @@ SRC_URI_MUSL = "\
                file://0025-include-sys-file.h-for-LOCK_EX.patch \
                file://0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch \
                file://0027-include-missing-sys-file.h-for-LOCK_EX.patch \
+               file://0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch \
+               file://0029-shared-Do-not-use-malloc_info-on-musl.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.41.0


