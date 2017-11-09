Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7E878513
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:59:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d28so3148150pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yo+zF2CrZ40v5BOdyWtSblI6LjyITppZDIqaufsLv+0=;
	b=EUx6ZCPxkikjlI4FyB9JriRmyR/vL46uILVagmfRX9BQg+O1v6CrlwBhUqwmJ2C4ou
	Zq8e9veZKHbs7uLwtN9wzbKZmKRk8LcNy++iUBB6M6Kk44mqwMwfGQ0+7CCy4qbQPqEe
	nnddjH8iIJcgyQWBfz/2C1Mec+VDKbZZgrklAZGyQP8YI7qm9VGasImigTFL96r8eubl
	sz0ZibYqqCF3RE6Px+cV0d115ECjoDFLUZiN/Du1Kmmlu6CKvOMAIOvMHz+b5Ji8xdsX
	TBcJrLNPrYCrWXf0bzY4cl3uX3Lj0qCkQNtGWRl8BPCIn6aXR73GdDEp2ptBMozEh+rp
	qkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yo+zF2CrZ40v5BOdyWtSblI6LjyITppZDIqaufsLv+0=;
	b=P2df6bzo+O/dRp5TYiUjJJeNYf4SatEjWkfkOatsyzkbAInq2d/zBDlro9tMMxJLru
	ebjt35tHcIMFVE3IA0gZWulOUnFnKsFls8Rocss3Dfskq1EhcK1Gb+R8txE/vQV0QaZV
	eKf/pPV+OoC2druBFgrkmKooNCTce78cDFqP/lS/rO2NbPeOLAxMsUu3GwaDemKFXNcI
	CJEoo3Xz3wDbCkDOayCgobdvsaLsXOTgknFfLYap17pEAe46nr7mFzpmu/w16S98Yyi/
	GCr30m7BE+ghNgpvSONWpJGUDvPb2K7sXeaNvR3hcoiChbGI+8wWj+LUSVUWJ0kiGqJB
	FyZg==
X-Gm-Message-State: AJaThX7fDKvOrYVCTR+ikHq8WFNBYU1/9R4dIiPgmHlHCWKZhufP7uSf
	mklfqpBegSoo6v2MPgZdovaRVw==
X-Google-Smtp-Source: ABhQp+TjSI0CIiXtTdieez6aCsmpiPti+8A8YCFNib1ywWO06zVWAmNNoDumfs28KOY/mn2a7h+d9A==
X-Received: by 10.99.121.197 with SMTP id u188mr2344431pgc.416.1510192745276; 
	Wed, 08 Nov 2017 17:59:05 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	w17sm10156709pfa.70.2017.11.08.17.59.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 17:59:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 17:58:50 -0800
Message-Id: <0329390219aeeadf8204b2220c87a6373d0d42bf.1510192517.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510192517.git.raj.khem@gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] systemd: Fix build with musl/mips64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Nov 2017 01:59:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-uintmax_t-for-handling-rlim_t.patch   | 89 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch
new file mode 100644
index 0000000000..779dc78fd3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch
@@ -0,0 +1,89 @@
+From b2d4171c6e521cf1e70331fb769234d63a4a6d44 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Oct 2017 13:00:41 -0700
+Subject: [PATCH] Use uintmax_t for handling rlim_t
+
+PRIu{32,64} is not right format to represent rlim_t type
+therefore use %ju and typecast the rlim_t variables to
+uintmax_t.
+
+Fixes portablility errors like
+
+execute.c:3446:36: error: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'rlim_t {aka long long unsigned int}' [-Werror=format=]
+|                          fprintf(f, "%s%s: " RLIM_FMT "\n",
+|                                     ^~~~~~~~
+|                                  prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
+|                                                               ~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/7199]
+
+ src/basic/format-util.h | 8 --------
+ src/basic/rlimit-util.c | 8 ++++----
+ src/core/execute.c      | 8 ++++----
+ 3 files changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/src/basic/format-util.h b/src/basic/format-util.h
+index ae42a8f89..144249cd6 100644
+--- a/src/basic/format-util.h
++++ b/src/basic/format-util.h
+@@ -60,14 +60,6 @@
+ #  define PRI_TIMEX "li"
+ #endif
+ 
+-#if SIZEOF_RLIM_T == 8
+-#  define RLIM_FMT "%" PRIu64
+-#elif SIZEOF_RLIM_T == 4
+-#  define RLIM_FMT "%" PRIu32
+-#else
+-#  error Unknown rlim_t size
+-#endif
+-
+ #if SIZEOF_DEV_T == 8
+ #  define DEV_FMT "%" PRIu64
+ #elif SIZEOF_DEV_T == 4
+diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
+index ca834df62..41fcebb74 100644
+--- a/src/basic/rlimit-util.c
++++ b/src/basic/rlimit-util.c
+@@ -284,13 +284,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+         if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
+                 s = strdup("infinity");
+         else if (rl->rlim_cur >= RLIM_INFINITY)
+-                (void) asprintf(&s, "infinity:" RLIM_FMT, rl->rlim_max);
++                (void) asprintf(&s, "infinity:%ju", (uintmax_t)rl->rlim_max);
+         else if (rl->rlim_max >= RLIM_INFINITY)
+-                (void) asprintf(&s, RLIM_FMT ":infinity", rl->rlim_cur);
++                (void) asprintf(&s, "%ju:infinity", (uintmax_t)rl->rlim_cur);
+         else if (rl->rlim_cur == rl->rlim_max)
+-                (void) asprintf(&s, RLIM_FMT, rl->rlim_cur);
++                (void) asprintf(&s, "%ju", (uintmax_t)rl->rlim_cur);
+         else
+-                (void) asprintf(&s, RLIM_FMT ":" RLIM_FMT, rl->rlim_cur, rl->rlim_max);
++                (void) asprintf(&s, "%ju:%ju", (uintmax_t)rl->rlim_cur, (uintmax_t)rl->rlim_max);
+ 
+         if (!s)
+                 return -ENOMEM;
+diff --git a/src/core/execute.c b/src/core/execute.c
+index d72e5bf08..d38946002 100644
+--- a/src/core/execute.c
++++ b/src/core/execute.c
+@@ -3443,10 +3443,10 @@ void exec_context_dump(ExecContext *c, FILE* f, const char *prefix) {
+ 
+         for (i = 0; i < RLIM_NLIMITS; i++)
+                 if (c->rlimit[i]) {
+-                        fprintf(f, "%s%s: " RLIM_FMT "\n",
+-                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
+-                        fprintf(f, "%s%sSoft: " RLIM_FMT "\n",
+-                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_cur);
++                        fprintf(f, "%s%s: %ju\n",
++                                prefix, rlimit_to_string(i), (uintmax_t)c->rlimit[i]->rlim_max);
++                        fprintf(f, "%s%sSoft: %ju\n",
++                                prefix, rlimit_to_string(i), (uintmax_t)c->rlimit[i]->rlim_cur);
+                 }
+ 
+         if (c->ioprio_set) {
+-- 
+2.14.3
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index bcb683f10a..6b8745b93f 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
            file://0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
            file://0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
+           file://0001-Use-uintmax_t-for-handling-rlim_t.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.15.0


