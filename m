Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D44CA0FFD
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.6639.1756330221677336142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VFTDsxHD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-770522b34d1so1070483b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330221; x=1756935021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZvo6+8YVOOxpJp0pbBAbE89BpkiHqFla65pt8+lOqk=;
        b=VFTDsxHDrfefHljyIq9FBxs4iRT3FbAoU2Rlo4w8YFci3/JmRNn84X1Rk5YNjKqyUF
         +DaTG2dYehr7LECjK/Tb+HgvtYdlsleNA0xYOXzIS0aR45KRVyePY3h4LoSIGyzl63Ui
         Ly/g44IIMKPUF3cBSp7zW9hO/CMWXtbCkJ0y9cFf1pozq9nNBdXh43ZcgjLo/h+jkg0d
         82o83sdSBlD3X1l1wiF/rpJXQOVF/NG4RJZVOV8AsEluMrco3V+iWDuwXFJKQLquVy2S
         i1RlNVBDhekBNGPnUTqJL+FCCdbfpSqA8oEO/J9G0CHIMtSd0ZnETjymadzRgPAlUV46
         lVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330221; x=1756935021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZvo6+8YVOOxpJp0pbBAbE89BpkiHqFla65pt8+lOqk=;
        b=B1+/g+PZb0oAiIlAabV9csAjodBs3za2LeuQQaVnv9Q+KA9AzPUxnqg7bq9C0sFwRL
         i3FFHsBmM71jbmYwkQB/Ckur/lwwKN1CcubUDDzvUEQzp+CSzw97B3ytiztzX+d81AxI
         XWZT8QmoYcZH8JhLQfJGaXdF+N0q7dUoywHVVudkaxYayrZUv+qYfn61eQc93eGW4HpN
         yrDJzodqwjLdmv2qDDVUfFuUiV/j9kL+i5y/N9Okh3Eh/z9rGnbs+ui+pLJZlGEfbCYx
         7vAWFI4hrnqUe4f3iU9Dpz8ihR3o68AShUHJ4gi6bZNsSVBiffi2KETJcG3uZMQ1kzqB
         QWJg==
X-Gm-Message-State: AOJu0Ywf7/DAEGah4fz7K2oS6RUHOPRAjj613HpKjZpqf8J/+Ravp59+
	w2ncOi7amICBsTIZZ9vT3D87DPj3c9wfja8aBy3yf5AHLJipPpLP3h0PAWxYkITaskltjkEPI1z
	tczQt
X-Gm-Gg: ASbGncv2sjMfAtHpuZh05dVIfvtg7Swh+OTuv0OxNheFIBuYK90Z808gTEO1YRuHz0/
	EvhId4ojNAzsX4tbjdv2UQ35j3htP3Z1AV8NHhwQUEIJCcO9iI1RusoSWb7BuANBf1NVW74O5d2
	h5547NjiDBarFeWBeGXLgN2Gw+BJRo4yf4uObIewrwcYcOwsTseZ75BrNhYsuvnEd6XXa3TgG2o
	REGNCLhScj0ScLg6x46NcK2yBjS9CAPGpWtTM8yz0DXFkGgl4EWzYdUKvJn9DHTUZFzAIFWyChL
	tob+YO9hpAZ1RWDJYN4RVMZAIB7NpM4zLo4tLQA4m9L1giBMXquCCtSur6HpA9YJvNiq4w5VL2z
	WQaPNG2eus9v8+g==
X-Google-Smtp-Source: AGHT+IGF5SHw2aHbdAqPUxn5S+EKmp+jXuld+REJx8xXXwGztaHoo1WalBMeXWZeMUN7HfHgez4v5g==
X-Received: by 2002:a17:902:cecc:b0:237:f757:9ad8 with SMTP id d9443c01a7336-248753ada89mr84250145ad.1.1756330220754;
        Wed, 27 Aug 2025 14:30:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/33] git: fix build with gcc-15 on host
Date: Wed, 27 Aug 2025 14:29:22 -0700
Message-ID: <a534cf958f9c7d05af795def43ee5ba09fb34ca2.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222523

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


