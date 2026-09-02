Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B251C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5660.1788326795143817383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eRfzn4fJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so6487985e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326793; x=1788931593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gbVcnJdm4/owagy8QOaxVab6tjsTGheXxvfGDAHog18=;
        b=eRfzn4fJRAqv8BYmoxmq5qCKUVJtzfABmnci49WvibawxLYRWAgRtsAOAW6sKGqAQ2
         PnW/aIrpTpPRUGCzUzvyNlbQkRKJEcvKLK1mava0nTPTkadAeJpfi24La62OxyfQmOaE
         vW2Z2WnxSepKNSN6vEIVGHF5EH/hPVUdRp23Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326793; x=1788931593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gbVcnJdm4/owagy8QOaxVab6tjsTGheXxvfGDAHog18=;
        b=feMQQ2VMWaTpIxlqmuWTn+G9IHmksfEZdBJLsemxldpMmsMbTTm9LWVWKn9Df7tVFd
         uFofHDV80x7dYQMaLvwBU2Ek8j5g4mU2hp7FZjCqpdhP8UBod/p37+M8RWfDAsYQxUzp
         xlol0KBCtc0yEFDJ4KE/IdKwWYcff9UBT/C8OSBR9LHCm0pfA5uUeLg0iDUUVvYBOMUO
         3h2MG0c+Sj6lHFpv+smirt2EcaIAGD6A0wucJ/HkBH9rDXK8aAD7W5BMiY9LRt3Kofra
         0667KbY4qLWmDvPUO+Xf8udRHSdQyBVShqOGx+DotoKESsBetifVYH3vxoOM9iU0T2h5
         7EYQ==
X-Gm-Message-State: AFuF++m1UbCAvD3YPxvj4fsTdcQyNV0yZsrFDftLDLpwqgfNUuUtmuog
	ImVk3Gmg8xiADm7tvKCKDHGFZ3YB668vkItxRfMx9bzu11REcVcXmVZ3MvlLtJp/SWCRl6gtOBE
	ZHjSVGiQ=
X-Gm-Gg: AR+sD10sKv/gJnsrzfp00KIHixyMLanrK+z+hrciv2PswBCgp45BivooqqKLl/obV4Y
	ff0VBtSl6uzUz/fq8tburm4aFJ9XOVmIzPgEjw0Lskw2/bm+EGgtUrdavaM4ejGXKi9FcT5V3Lz
	WW6Tgu0nwJ8iT3DlzNEUI/Jm6FeBWDAp2QRK4elpB5FRIqOKrfa3txA5dzSVPvHiVMQxdLgGgNU
	QWJn166hWYeFOc3raI8hQQHB9eqkirOF0ePCuLstabdkj7bRVX1GCtZR29BBHHXxt5+OUHXwKbA
	TUvF3mWxe/Ifp0jdlPMQdB/y00Kmw/EhK6Z2FPgAjgBRpN7CerKISFfri1N9SH92DYVbiwcmY/Q
	qoMS8Plvmz3AdO5LNFptaWXodV0NXiMy/GBps79Q+js/IXxBwm6p3rb1PJKBgg3nQG0VkCd8ARR
	iBa6EioaFfaFh4DbsgFYoX32LGLckDJNYFb88Fz/jdjVkjuD4KFiM2hiqIl72cGlaUR4doN1VGG
	A0CX6LILWeN7ncTEA==
X-Received: by 2002:a05:600c:1986:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49ce5812c8amr29271195e9.9.1788326793250;
        Tue, 01 Sep 2026 22:26:33 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/27] systemd: Fix CVE-2026-29111
Date: Wed,  2 Sep 2026 07:25:20 +0200
Message-ID: <b229b0b6c4004c6588e684d790343df249cedd57.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244854

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport patches from upstream systemd to fix CVE-2026-29111, where
systemd (as PID 1) hits an assert and freezes execution when an
unprivileged IPC API call is made with spurious data.

Pick patches from [1], [2], [3] and [4] as referenced in [5].

Note: As scarthgap is using 255 version picked fixes from 257

[1] https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d7e12085feb2a6
[2] https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e43bd1dce01d69
[3] https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759b474f56562412
[4] https://github.com/systemd/systemd/commit/54588d2dedff54bfb6036670820650e4ea74628f
[5] https://security-tracker.debian.org/tracker/CVE-2026-29111

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../systemd/systemd/CVE-2026-29111-01.patch   | 170 ++++++++++++++++++
 .../systemd/systemd/CVE-2026-29111-02.patch   |  85 +++++++++
 .../systemd/systemd/CVE-2026-29111-03.patch   | 106 +++++++++++
 .../systemd/systemd/CVE-2026-29111-04.patch   |  35 ++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
 5 files changed, 400 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
new file mode 100644
index 00000000000..4f6ef76aa98
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
@@ -0,0 +1,170 @@
+From 284fd279f9e9c199982aea51aee59a02e90a2eda Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 19 May 2025 12:58:52 +0200
+Subject: [PATCH 1/4] path-util: add flavour of path_startswith() that leaves a
+ leading slash in place
+
+(cherry picked from commit ee19edbb9f3455db3f750089082f3e5a925e3a0c)
+
+Note: The test uses assert_se(streq_ptr()) instead of the upstream
+ASSERT_STREQ() macro because ASSERT_STREQ was introduced in systemd v256
+and is not available in v255.
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d7e12085feb2a6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/basic/fs-util.c       |  2 +-
+ src/basic/mkdir.c         |  2 +-
+ src/basic/path-util.c     | 39 ++++++++++++++++++++++++++++-----------
+ src/basic/path-util.h     | 10 ++++++++--
+ src/test/test-path-util.c | 16 ++++++++++++++++
+ 5 files changed, 54 insertions(+), 15 deletions(-)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 5bc7d2f95b..4633a5cd72 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) {
+                 assert(*slash == '/');
+                 *slash = '\0';
+ 
+-                if (path_startswith_full(stop, p, /* accept_dot_dot= */ false))
++                if (path_startswith_full(stop, p, /* flags= */ 0))
+                         return 0;
+ 
+                 if (rmdir(p) < 0 && errno != ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index c770e5ed32..7bc73361a5 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const char *path, mode_t mode, ui
+         assert(_mkdirat != mkdirat);
+ 
+         if (prefix) {
+-                p = path_startswith_full(path, prefix, /* accept_dot_dot= */ false);
++                p = path_startswith_full(path, prefix, /* flags= */ 0);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index 6810bf66aa..e73f5d708e 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -403,8 +403,8 @@ char* path_simplify_full(char *path, PathSimplifyFlags flags) {
+         return path;
+ }
+ 
+-char* path_startswith_full(const char *path, const char *prefix, bool accept_dot_dot) {
+-        assert(path);
++char* path_startswith_full(const char *original_path, const char *prefix, PathStartWithFlags flags) {
++        assert(original_path);
+         assert(prefix);
+ 
+         /* Returns a pointer to the start of the first component after the parts matched by
+@@ -417,28 +417,45 @@ char* path_startswith_full(const char *path, const char *prefix, bool accept_dot
+          * Returns NULL otherwise.
+          */
+ 
++        const char *path = original_path;
++
+         if ((path[0] == '/') != (prefix[0] == '/'))
+                 return NULL;
+ 
+         for (;;) {
+                 const char *p, *q;
+-                int r, k;
++                int m, n;
+ 
+-                r = path_find_first_component(&path, accept_dot_dot, &p);
+-                if (r < 0)
++                m = path_find_first_component(&path, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                if (m < 0)
+                         return NULL;
+ 
+-                k = path_find_first_component(&prefix, accept_dot_dot, &q);
+-                if (k < 0)
++                n = path_find_first_component(&prefix, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                if (n < 0)
+                         return NULL;
+ 
+-                if (k == 0)
+-                        return (char*) (p ?: path);
++                if (n == 0) {
++                        if (!p)
++                                p = path;
++
++                        if (FLAGS_SET(flags, PATH_STARTSWITH_RETURN_LEADING_SLASH)) {
++
++                                if (p <= original_path)
++                                        return NULL;
++
++                                p--;
++
++                                if (*p != '/')
++                                        return NULL;
++                        }
++
++                        return (char*) p;
++                }
+ 
+-                if (r != k)
++                if (m != n)
+                         return NULL;
+ 
+-                if (!strneq(p, q, r))
++                if (!strneq(p, q, m))
+                         return NULL;
+         }
+ }
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index 6d943e967f..e0ec05f4db 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -53,9 +53,15 @@ int safe_getcwd(char **ret);
+ int path_make_absolute_cwd(const char *p, char **ret);
+ int path_make_relative(const char *from, const char *to, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, char **ret);
+-char* path_startswith_full(const char *path, const char *prefix, bool accept_dot_dot) _pure_;
++
++typedef enum PathStartWithFlags {
++        PATH_STARTSWITH_ACCEPT_DOT_DOT       = 1U << 0,
++        PATH_STARTSWITH_RETURN_LEADING_SLASH = 1U << 1,
++} PathStartWithFlags;
++
++char* path_startswith_full(const char *path, const char *prefix, PathStartWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix) {
+-        return path_startswith_full(path, prefix, true);
++        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_DOT_DOT);
+ }
+ 
+ int path_compare(const char *a, const char *b) _pure_;
+diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
+index f5a425689a..71056b08c1 100644
+--- a/src/test/test-path-util.c
++++ b/src/test/test-path-util.c
+@@ -754,6 +754,22 @@ TEST(path_startswith) {
+         test_path_startswith_one("/foo/bar/barfoo/", "/fo", NULL, NULL);
+ }
+ 
++static void test_path_startswith_return_leading_slash_one(const char *path, const char *prefix, const char *expected) {
++        const char *p;
++
++        log_debug("/* %s(%s, %s) */", __func__, path, prefix);
++
++        p = path_startswith_full(path, prefix, PATH_STARTSWITH_RETURN_LEADING_SLASH);
++        assert_se(streq_ptr(p, expected));
++}
++
++TEST(path_startswith_return_leading_slash) {
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/", "/foo/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo", "/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo/bar", NULL);
++        test_path_startswith_return_leading_slash_one("/foo/bar/", "/foo/bar", "/");
++}
++
+ static void test_prefix_root_one(const char *r, const char *p, const char *expected) {
+         _cleanup_free_ char *s = NULL;
+         const char *t;
+-- 
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
new file mode 100644
index 00000000000..9ab94000e65
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
@@ -0,0 +1,85 @@
+From ed86ee8a7cc82fe1c68e3fb17be71c9c8e62ca87 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 23 May 2025 06:45:40 +0200
+Subject: [PATCH 2/4] path-util: invert PATH_STARTSWITH_ACCEPT_DOT_DOT flag
+
+As requested: https://github.com/systemd/systemd/pull/37572#pullrequestreview-2861928094
+
+(cherry picked from commit ceed11e465f1c8efff1931412a85924d9de7c08d)
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e43bd1dce01d69]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/basic/fs-util.c   | 2 +-
+ src/basic/mkdir.c     | 2 +-
+ src/basic/path-util.c | 4 ++--
+ src/basic/path-util.h | 4 ++--
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 4633a5cd72..21cd6ddcde 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) {
+                 assert(*slash == '/');
+                 *slash = '\0';
+ 
+-                if (path_startswith_full(stop, p, /* flags= */ 0))
++                if (path_startswith_full(stop, p, PATH_STARTSWITH_REFUSE_DOT_DOT))
+                         return 0;
+ 
+                 if (rmdir(p) < 0 && errno != ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 7bc73361a5..8f14c47214 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const char *path, mode_t mode, ui
+         assert(_mkdirat != mkdirat);
+ 
+         if (prefix) {
+-                p = path_startswith_full(path, prefix, /* flags= */ 0);
++                p = path_startswith_full(path, prefix, PATH_STARTSWITH_REFUSE_DOT_DOT);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index e73f5d708e..a65a5c32f6 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -426,11 +426,11 @@ char* path_startswith_full(const char *original_path, const char *prefix, PathSt
+                 const char *p, *q;
+                 int m, n;
+ 
+-                m = path_find_first_component(&path, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                m = path_find_first_component(&path, !FLAGS_SET(flags, PATH_STARTSWITH_REFUSE_DOT_DOT), &p);
+                 if (m < 0)
+                         return NULL;
+ 
+-                n = path_find_first_component(&prefix, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                n = path_find_first_component(&prefix, !FLAGS_SET(flags, PATH_STARTSWITH_REFUSE_DOT_DOT), &q);
+                 if (n < 0)
+                         return NULL;
+ 
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index e0ec05f4db..11a1078df9 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -55,13 +55,13 @@ int path_make_relative(const char *from, const char *to, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, char **ret);
+ 
+ typedef enum PathStartWithFlags {
+-        PATH_STARTSWITH_ACCEPT_DOT_DOT       = 1U << 0,
++        PATH_STARTSWITH_REFUSE_DOT_DOT       = 1U << 0,
+         PATH_STARTSWITH_RETURN_LEADING_SLASH = 1U << 1,
+ } PathStartWithFlags;
+ 
+ char* path_startswith_full(const char *path, const char *prefix, PathStartWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix) {
+-        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_DOT_DOT);
++        return path_startswith_full(path, prefix, 0);
+ }
+ 
+ int path_compare(const char *a, const char *b) _pure_;
+-- 
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
new file mode 100644
index 00000000000..8b9b4d4075c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
@@ -0,0 +1,106 @@
+From 7a1749753b4853866f90ef25d48192e4d1563543 Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:00 +0100
+Subject: [PATCH 3/4] core/cgroup: avoid one unnecessary strjoina()
+
+(cherry picked from commit 42aee39107fbdd7db1ccd402a2151822b2805e9f)
+(cherry picked from commit 80acea4ef80a4bb78560ed970c34952299b890d6)
+(cherry picked from commit b5fd14693057e5f2c9b4a49603be64ec3608ff6c)
+
+Note: This backport uses u->cgroup_path directly instead of the upstream
+CGroupRuntime *crt / crt->cgroup_path pattern because the CGroupRuntime
+struct was introduced in systemd v256 (commit 1d9cc876). In v255, the
+cgroup_path is still a direct member of the Unit struct.
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759b474f56562412]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/cgroup.c | 27 +++++++++++++--------------
+ 1 file changed, 13 insertions(+), 14 deletions(-)
+
+diff --git a/src/core/cgroup.c b/src/core/cgroup.c
+index d398655b0a..e5e7f032c2 100644
+--- a/src/core/cgroup.c
++++ b/src/core/cgroup.c
+@@ -2568,12 +2568,13 @@ static int unit_update_cgroup(
+         return 0;
+ }
+ 
+-static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const char *suffix_path) {
++static int unit_attach_pid_to_cgroup_via_bus(Unit *u, const char *cgroup_path, pid_t pid) {
+         _cleanup_(sd_bus_error_free) sd_bus_error error = SD_BUS_ERROR_NULL;
+-        char *pp;
+         int r;
+ 
+         assert(u);
++        assert(cgroup_path);
++        assert(pid_is_valid(pid));
+ 
+         if (MANAGER_IS_SYSTEM(u->manager))
+                 return -EINVAL;
+@@ -2581,17 +2582,13 @@ static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const char *suf
+         if (!u->manager->system_bus)
+                 return -EIO;
+ 
+-        if (!u->cgroup_path)
+-                return -EINVAL;
+-
+         /* Determine this unit's cgroup path relative to our cgroup root */
+-        pp = path_startswith(u->cgroup_path, u->manager->cgroup_root);
++        const char *pp = path_startswith_full(cgroup_path,
++                                              u->manager->cgroup_root,
++                                              PATH_STARTSWITH_RETURN_LEADING_SLASH|PATH_STARTSWITH_REFUSE_DOT_DOT);
+         if (!pp)
+                 return -EINVAL;
+ 
+-        pp = strjoina("/", pp, suffix_path);
+-        path_simplify(pp);
+-
+         r = bus_call_method(u->manager->system_bus,
+                             bus_systemd_mgr,
+                             "AttachProcessesToUnit",
+@@ -2630,8 +2627,10 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+                 return r;
+ 
+         if (isempty(suffix_path))
+-                p = u->cgroup_path;
++                p = empty_to_root(u->cgroup_path);
+         else {
++                assert(path_is_absolute(suffix_path));
++
+                 joined = path_join(u->cgroup_path, suffix_path);
+                 if (!joined)
+                         return -ENOMEM;
+@@ -2649,7 +2648,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+                  * before we use it */
+                 r = pidref_verify(pid);
+                 if (r < 0) {
+-                        log_unit_info_errno(u, r, "PID " PID_FMT " vanished before we could move it to target cgroup '%s', skipping: %m", pid->pid, empty_to_root(p));
++                        log_unit_info_errno(u, r, "PID " PID_FMT " vanished before we could move it to target cgroup '%s', skipping: %m", pid->pid, p);
+                         continue;
+                 }
+ 
+@@ -2660,7 +2659,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+ 
+                         log_unit_full_errno(u, again ? LOG_DEBUG : LOG_INFO,  r,
+                                             "Couldn't move process "PID_FMT" to%s requested cgroup '%s': %m",
+-                                            pid->pid, again ? " directly" : "", empty_to_root(p));
++                                            pid->pid, again ? " directly" : "", p);
+ 
+                         if (again) {
+                                 int z;
+@@ -2670,9 +2669,9 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+                                  * Since it's more privileged it might be able to move the process across the
+                                  * leaves of a subtree whose top node is not owned by us. */
+ 
+-                                z = unit_attach_pid_to_cgroup_via_bus(u, pid->pid, suffix_path);
++                                z = unit_attach_pid_to_cgroup_via_bus(u, p, pid->pid);
+                                 if (z < 0)
+-                                        log_unit_info_errno(u, z, "Couldn't move process "PID_FMT" to requested cgroup '%s' (directly or via the system bus): %m", pid->pid, empty_to_root(p));
++                                        log_unit_info_errno(u, z, "Couldn't move process "PID_FMT" to requested cgroup '%s' (directly or via the system bus): %m", pid->pid, p);
+                                 else {
+                                         if (ret >= 0)
+                                                 ret++; /* Count successful additions */
+-- 
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
new file mode 100644
index 00000000000..ebf2ba9d5b2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
@@ -0,0 +1,35 @@
+From 0d2c41d0f024088a275ac0c02d50205c800dec8a Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:34 +0100
+Subject: [PATCH 4/4] core: validate input cgroup path more prudently
+
+(cherry picked from commit efa6ba2ab625aaa160ac435a09e6482fc63bdbe8)
+(cherry picked from commit 3cee294fe8cf4fa0eff933ab21416d099942cabd)
+(cherry picked from commit 1d22f706bd04f45f8422e17fbde3f56ece17758a)
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/54588d2dedff54bfb6036670820650e4ea74628f]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/dbus-manager.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/core/dbus-manager.c b/src/core/dbus-manager.c
+index c7372ca033..cb84ba9866 100644
+--- a/src/core/dbus-manager.c
++++ b/src/core/dbus-manager.c
+@@ -646,6 +646,12 @@ static int method_get_unit_by_control_group(sd_bus_message *message, void *userd
+         if (r < 0)
+                 return r;
+ 
++        if (!path_is_absolute(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Control group path is not absolute: %s", cgroup);
++
++        if (!path_is_normalized(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Control group path is not normalized: %s", cgroup);
++
+         u = manager_get_unit_by_cgroup(m, cgroup);
+         if (!u)
+                 return sd_bus_error_setf(error, BUS_ERROR_NO_SUCH_UNIT,
+-- 
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index 9c5f8af240a..e5a0fd91700 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,10 @@ SRC_URI += " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://CVE-2026-29111-01.patch \
+           file://CVE-2026-29111-02.patch \
+           file://CVE-2026-29111-03.patch \
+           file://CVE-2026-29111-04.patch \
            "
 
 # patches needed by musl

