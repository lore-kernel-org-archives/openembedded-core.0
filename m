Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C66CA0EFF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:14:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.6831.1755774839599516677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 04:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GGD0USLg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so6316075e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755774838; x=1756379638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iENRiQNrM79qvkY7wAvzH6BuLlc1Uhs6XSMiRioDLAI=;
        b=GGD0USLgoN2x8QW0RJXB9SiZlrct1BxGIcmqYK1pbK9UgCFd3DvUlmtTsYqWSCEqdE
         yWBvwAw05KOOdjeWjfQclBQmJCToi1Wn8j5F4+8g75VeF/DH7UF1CPZ3e7mUhQJ5eOjG
         xGsiELnhH2ArC2D3uBAE9l29N1u0sXCKvAjE0oCvRf1v+iAIRwr3zADuPVuHeF2p2jMz
         ue5oTtLai8904aYwEWomySV9oKqpTCPm1FplMuUkXcuP6xsbtLwxk0Jif75EEjswFhId
         6233K2upMY1YwNR+i014+TgmCXUIhVaBnmyEe/9s4bD/IVjxkwsRxv4D8I1Un4pxJu0y
         xsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755774838; x=1756379638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iENRiQNrM79qvkY7wAvzH6BuLlc1Uhs6XSMiRioDLAI=;
        b=CawvWgfEa9lyY5wrgAQBnWGgIfo+MbtjkcVKLyYz9rSWjfW2EzWIgSA/qPa3xpu+LI
         fL+1v238YRxUXTlKRrFom4WlxHw/sdd1PLSyCl3h6QMmUDcEW8X0k1S4V3OtzB1uFO6G
         weUFBK/yGZzAi0CBrDviQ22ZgW7rqV2SDn6OU27ZJfiqfYWpLmKZ/oNaIpnz5JYLcUSL
         rGHdnsXqOW5Um5tCtiGuAy2KkJwDIa7/SuyBy/2QqITjohyy1QSJ0F7vMroFIkmoym2t
         NPJlsdMzfEqiE/UYbaEfvkxQZ5av9IJhGLODtGzxdZtAeM6JIpYBWIT7+e6dwVgRd2Rq
         nq4w==
X-Gm-Message-State: AOJu0Yw9PuThPafeJrG+yHfCTEhmm2uot7ucrpnj5KgKmL3OP4sU5v4j
	5NSycazC2FJV7U6G2QeNSrSVAEy8JmAwAH6sEKCtCjmAX2bXx3QbnY3YIoeNjw==
X-Gm-Gg: ASbGncvEsEqWiz0GG3wWBfkfyMAA+ikM52NxSO4kOEINygyUFUMtgEIQ9QAHTAOYPH6
	rnJkdn2ncHaQmOnHYoAli0hRLiKXc99Gs7pZzkway7BfIsIV/NySSqps9WJtkZyTFyMECM/ww8N
	DDzq2z4uy+G5bSCPepc9djJ5rWuT2nmUMHqH5rT+XToUDQKSYsQ3OhLIMdxt/Pta1/Hqroi67Li
	/wSXsSbve1hpif93bmn0GH0ROyvmF4gyymq7FOwyu31O7skpLV3bUCKuqETH2MutjlmmpJKI7vJ
	U83IFTlH4kd7kbjEI4ez+mpGvoTXULfIhpZJlER4XN5eDp/Dtl5fNrKwwmvzE+9Jw1lFHbgEFTp
	OBuEGiVwlbgr12mto5nkFu2ye5xW10Fklg49FoqbsUh4nK1OsVKPnWp6M
X-Google-Smtp-Source: AGHT+IH2CKonpVZGSUwARAsT584IxfWWgcMoyBZj06mNXVCShSVni6oP/Y3YGGPt7Lo3xjiJZOPHWQ==
X-Received: by 2002:a05:600c:1d1c:b0:458:a992:6f1e with SMTP id 5b1f17b1804b1-45b4d7dc73amr22347755e9.5.1755774837825;
        Thu, 21 Aug 2025 04:13:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4db2aa09sm23953195e9.9.2025.08.21.04.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:13:57 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 3/3] git: fix build with gcc-15 on host
Date: Thu, 21 Aug 2025 12:58:40 +0200
Message-ID: <20250821105840.3045170-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821105840.3045170-1-martin.jansa@gmail.com>
References: <20250821105840.3045170-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222229

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ndex-pack-rename-struct-thread_local.patch | 67 +++++++++++++++++++
 .../git/0001-reflog-rename-unreachable.patch  | 40 +++++++++++
 meta/recipes-devtools/git/git_2.44.4.bb       |  2 +
 3 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/0001-index-pack-rename-struct-thread_local.patch
 create mode 100644 meta/recipes-devtools/git/git/0001-reflog-rename-unreachable.patch

diff --git a/meta/recipes-devtools/git/git/0001-index-pack-rename-struct-thread_local.patch b/meta/recipes-devtools/git/git/0001-index-pack-rename-struct-thread_local.patch
new file mode 100644
index 0000000000..b3b490064f
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0001-index-pack-rename-struct-thread_local.patch
@@ -0,0 +1,67 @@
+From e8b3bcf49120309b207b7afc25c4aa81b866ac45 Mon Sep 17 00:00:00 2001
+From: "brian m. carlson" <sandals@crustytoothpaste.net>
+Date: Sun, 17 Nov 2024 01:31:48 +0000
+Subject: [PATCH] index-pack: rename struct thread_local
+
+"thread_local" is a keyword in C23.  To make sure that our code compiles
+on a wide variety of C versions, rename struct thread_local to "struct
+thread_local_data" to avoid a conflict.
+
+Signed-off-by: brian m. carlson <sandals@crustytoothpaste.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [v2.48.0 e8b3bcf49120309b207b7afc25c4aa81b866ac45]                                                                                                                                                                  
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ builtin/index-pack.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/builtin/index-pack.c b/builtin/index-pack.c
+index e228c56ff2..74675dbd6c 100644
+--- a/builtin/index-pack.c
++++ b/builtin/index-pack.c
+@@ -94,7 +94,7 @@ static LIST_HEAD(done_head);
+ static size_t base_cache_used;
+ static size_t base_cache_limit;
+ 
+-struct thread_local {
++struct thread_local_data {
+ 	pthread_t thread;
+ 	int pack_fd;
+ };
+@@ -117,7 +117,7 @@ static struct object_entry *objects;
+ static struct object_stat *obj_stat;
+ static struct ofs_delta_entry *ofs_deltas;
+ static struct ref_delta_entry *ref_deltas;
+-static struct thread_local nothread_data;
++static struct thread_local_data nothread_data;
+ static int nr_objects;
+ static int nr_ofs_deltas;
+ static int nr_ref_deltas;
+@@ -148,7 +148,7 @@ static uint32_t input_crc32;
+ static int input_fd, output_fd;
+ static const char *curr_pack;
+ 
+-static struct thread_local *thread_data;
++static struct thread_local_data *thread_data;
+ static int nr_dispatched;
+ static int threads_active;
+ 
+@@ -390,7 +390,7 @@ static NORETURN void bad_object(off_t offset, const char *format, ...)
+ 	    (uintmax_t)offset, buf);
+ }
+ 
+-static inline struct thread_local *get_thread_data(void)
++static inline struct thread_local_data *get_thread_data(void)
+ {
+ 	if (HAVE_THREADS) {
+ 		if (threads_active)
+@@ -401,7 +401,7 @@ static inline struct thread_local *get_thread_data(void)
+ 	return &nothread_data;
+ }
+ 
+-static void set_thread_data(struct thread_local *data)
++static void set_thread_data(struct thread_local_data *data)
+ {
+ 	if (threads_active)
+ 		pthread_setspecific(key, data);
diff --git a/meta/recipes-devtools/git/git/0001-reflog-rename-unreachable.patch b/meta/recipes-devtools/git/git/0001-reflog-rename-unreachable.patch
new file mode 100644
index 0000000000..a44fe91dd3
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0001-reflog-rename-unreachable.patch
@@ -0,0 +1,40 @@
+From 639cd8db63b07c958062bde4d3823dadbf469b0b Mon Sep 17 00:00:00 2001
+From: "brian m. carlson" <sandals@crustytoothpaste.net>
+Date: Sun, 17 Nov 2024 01:31:49 +0000
+Subject: [PATCH] reflog: rename unreachable
+
+In C23, "unreachable" is a macro that invokes undefined behavior if it
+is invoked.  To make sure that our code compiles on a variety of C
+versions, rename unreachable to "is_unreachable".
+
+Signed-off-by: brian m. carlson <sandals@crustytoothpaste.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [v2.48.0 639cd8db63b07c958062bde4d3823dadbf469b0b]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ reflog.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/reflog.c b/reflog.c
+index 875ac1aa66..aeab78c9b7 100644
+--- a/reflog.c
++++ b/reflog.c
+@@ -210,7 +210,7 @@ static void mark_reachable(struct expire_reflog_policy_cb *cb)
+ 	cb->mark_list = leftover;
+ }
+ 
+-static int unreachable(struct expire_reflog_policy_cb *cb, struct commit *commit, struct object_id *oid)
++static int is_unreachable(struct expire_reflog_policy_cb *cb, struct commit *commit, struct object_id *oid)
+ {
+ 	/*
+ 	 * We may or may not have the commit yet - if not, look it
+@@ -265,7 +265,7 @@ int should_expire_reflog_ent(struct object_id *ooid, struct object_id *noid,
+ 			return 1;
+ 		case UE_NORMAL:
+ 		case UE_HEAD:
+-			if (unreachable(cb, old_commit, ooid) || unreachable(cb, new_commit, noid))
++			if (is_unreachable(cb, old_commit, ooid) || is_unreachable(cb, new_commit, noid))
+ 				return 1;
+ 			break;
+ 		}
diff --git a/meta/recipes-devtools/git/git_2.44.4.bb b/meta/recipes-devtools/git/git_2.44.4.bb
index 66936417e1..3c94667382 100644
--- a/meta/recipes-devtools/git/git_2.44.4.bb
+++ b/meta/recipes-devtools/git/git_2.44.4.bb
@@ -11,6 +11,8 @@ PROVIDES:append:class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           file://0001-reflog-rename-unreachable.patch \
+           file://0001-index-pack-rename-struct-thread_local.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \

