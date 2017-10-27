Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 39B697197E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 20:18:08 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n89so5678249pfk.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ccmb/ORfw+qMemKHqs+98nNFTDjnsJjM1uFj6OXqGXU=;
	b=ofodGWch/wT83pmilF8NUeX40VeDpAsNiy24IhLmc5/K9gwSynQt3eR890V6Pqo6fP
	S8YppigrMcdPVKIZnoDyMSFq08TzJ+USgW1Owy2qUAUhzq1QmsxBJ0GhYYdPkFTyBkTR
	jI3VD+L3/HY/iLDu2b0WqvLQ0krpy7ppEyQhsYTSR+MXkYtj9J5QqFG77u/uCoEOpHwv
	HN4uXjIFyDrcYXsw4K3wAEq4sCzOFOpyZ1RKjlIeM7DFs81Y8szcBHHiBWpshoLDVA/q
	f8NqBDUHI8VLtIgOeL0atgQyOlDPnc6dlKlNPIGRK8pOPytytaZ3ERpV+p2+TLE+2ee4
	GTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ccmb/ORfw+qMemKHqs+98nNFTDjnsJjM1uFj6OXqGXU=;
	b=Q8UhsCfTHWrgJ6F6Op8UUxCUL5XHZ3RLKLJcQpfumuLlv/Ke/WIqnrq9vdXI+6+jUo
	UhMDQGGs2+bKLO8zmJzRQypjR79ya02EtTWmpRqGLoCac0tsnZtOS89eE+EuAR63EFMp
	CcpIue+bVr0t3LdDEeqzDEnyB2zqKifmbMGB9c9oy8njforTHGLsGrZSc2F1opnZd53B
	7KWtwSITIEjlTmZKYe83kiibQ19fKwvNkMstJnpIycqx1a3EohEI98GiyXU0VEln6vn7
	r7YnFy0xSDTPpgY1Y32FYXXgm4owk569xyVVmRLxfXBh8jic4/y+yxpIgUFFSNZHx0QV
	PkVg==
X-Gm-Message-State: AMCzsaX1bJlHH/eBijb0cd5pIV/IUnIpfdNEl+++wUXcoH+/TIB54bVR
	jlIDC0+Q3DCDhwM3ktBS7c5IUA==
X-Google-Smtp-Source: ABhQp+R+ZYWBM9yvfCnxl2Kz8nb6pMWR74+j1Gfj3b1oTR0eRIz26gOmW4YWr0WcsWaajo2V+3DO5w==
X-Received: by 10.99.97.139 with SMTP id v133mr1178535pgb.300.1509135490154;
	Fri, 27 Oct 2017 13:18:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	a78sm15942834pfl.122.2017.10.27.13.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Oct 2017 13:18:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:18:00 -0700
Message-Id: <20171027201800.21721-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171027201800.21721-1-raj.khem@gmail.com>
References: <20171027201800.21721-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd: Fix build with musl/mips64
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
X-List-Received-Date: Fri, 27 Oct 2017 20:18:09 -0000

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
index 3867986765..e2e42d61b6 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -40,6 +40,7 @@ SRC_URI += " \
            file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
            file://0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
            file://0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
+           file://0001-Use-uintmax_t-for-handling-rlim_t.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.14.3


