Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21395CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:35:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16173.1781084111950522662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sCiZOYyS;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so4856381f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781084110; x=1781688910; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG28I3GMuA2j0H++hDTZ8hdrIVCY3B/zyc5n8JuAUYA=;
        b=sCiZOYyS0gI3QlVKvIGW9rKrbbqkR/tZOdapKiKOS61u5hISuS5/0iKCXYUKXLWD1L
         PXBJ/tvRzAQJaTvJAlrdVkzxAyrOwE1FW5FNiL3w6hLqSxtHYbo1+zWzr1n2DUjJ7mEF
         Xyx7fJJukULVeiNZkb/VjfU+798O8NwXqKnMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084110; x=1781688910;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rG28I3GMuA2j0H++hDTZ8hdrIVCY3B/zyc5n8JuAUYA=;
        b=PugmZxLd2EFWE6BmYnaTsZhwFw0OkGBEfH8iSboGKJs5ReN2IHgpGDtTxuAPuwS5eI
         iVUQUfoWjv8YnscHk56ZZOx4ONyyzLzl0EskUZLmgkEPO3SOl4RrWrzKkQ1zphHboeIo
         1A1jl+mMf9vXIZOPcIuPQrctykyeXBPA0Zc3yn7krVqqv+2zLKU5tvADZhhCbHnhzuzT
         Z25QnuFWtvHrCdrdyy8gnjRKguDK9nXH4Sie417JWwj+rPgRs/KA/hiCHOXc5W6cPRtD
         8zVz2wGqDGjrKhdKiNWVYKbcHimB9zbUcpQFZusMm870DdC2Bz63ur9Rq6jYX86nYDni
         vJew==
X-Forwarded-Encrypted: i=1; AFNElJ9srWsXknlwVSJ84cVJZSwjEw16JaOaB7FaT0wkbmj2pcPdt3nb7Zrra3C85MXNY3crjk5QGHizNy1ydDjixzORIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwO9Nahe1SZldB6AtUMq1Iv+2aGwAD8H1nFT7QBJ5Q7ityizmJS
	CBMWAvpjHATiVOqxpDrplimY0Vrs7hQFEgNBxyB74Jvcr6hvMF4noauFWsBhLUFhhA==
X-Gm-Gg: Acq92OGSWPqzIO8BmsxoBGGqc9DPZP+JxGg9LXVaGON7UC7QO8r7GifT75ieMIOq+28
	Y9IpgNRs7fGs8uXe9ejWapXjy5q6HWLpKUIiKgy2wZKKPQjAxu3lnsq6nZ19ObadAsbS27G3ITg
	q83V5XSdzisxPXY5OB91w2R/BqRbXyecf6V+psfB5uR9yz7/NInQyptl2M+ix/r5wU83miG6GqU
	jbHH5RgWXIfUKwxaJYkQglCu7H69a8MEJbkzJ9PziqGIyWqN6iQy8Ull+YZntTXRklFHfqd6k+8
	ZKBPyhvPgnK2pd62kJwYNDyvGLmLEg9WNhgu+D71I5dwJ863n3a8t1tPyZCaUyDn7KD+hFQHVTW
	F6fJR7nXMjY7npE1IgR+L+tNT+4BRNBLak4wUZvbuWsjfzI1NIyxweP7338MdpLB7grIOF63prN
	jS62JYVSNWfEdDIbThxk+TM0sQTzFMTZwR
X-Received: by 2002:a5d:4252:0:b0:45e:f684:7347 with SMTP id ffacd0b85a97d-460302e711fmr27449699f8f.12.1781084110176;
        Wed, 10 Jun 2026 02:35:10 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm70029560f8f.20.2026.06.10.02.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:35:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 11:35:09 +0200
Message-Id: <DJ59MG1GNWTJ.3GZAL2LXOBJ70@smile.fr>
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
Subject: Re: [OE-core][scarthgap][PATCH] systemd: Fix CVE-2026-29111
X-Mailer: aerc 0.21.0
References: <20260520095957.3092276-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520095957.3092276-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238325

 hello Hugo

when reviewing this patch, I found a couple of minor difference with the
upstream patches

patch 1:
-+        ASSERT_STREQ(p, expected);
++        assert_se(streq_ptr(p, expected));
=20

patch 3:
--- Remote (Norm)
+++ Local (Norm)
@@ -8,11 +8,10 @@
 +        assert(cgroup_path);
 +        assert(pid_is_valid(pid));
 @@ -0,0 +0,0 @@
--        CGroupRuntime *crt =3D unit_get_cgroup_runtime(u);
--        if (!crt || !crt->cgroup_path)
--                return -EOWNERDEAD;
+-        if (!u->cgroup_path)
+-                return -EINVAL;
 -
--        pp =3D path_startswith(crt->cgroup_path, u->manager->cgroup_root)=
;
+-        pp =3D path_startswith(u->cgroup_path, u->manager->cgroup_root);
 +        const char *pp =3D path_startswith_full(cgroup_path,
 +                                              u->manager->cgroup_root,
 +                                              PATH_STARTSWITH_RETURN_LEAD=
ING_SLASH|PATH_STARTSWITH_REFUSE_DOT_DOT);
@@ -20,8 +19,8 @@
 -        path_simplify(pp);
 -
 @@ -0,0 +0,0 @@
--                p =3D crt->cgroup_path;
-+                p =3D empty_to_root(crt->cgroup_path);
+-                p =3D u->cgroup_path;
++                p =3D empty_to_root(u->cgroup_path);
 +                assert(path_is_absolute(suffix_path));
 +
 @@ -0,0 +0,0 @@


I suppose that these are due to backporting to older version of systemd
but could you confirm ?

please send a V2 with the explanation attached to the patch and ping us
here

Thanks a lot


J=C3=A9r=C3=A9my


On Wed May 20, 2026 at 11:59 AM CEST, Hugo Simeliere via lists.openembedded=
.org wrote:
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patches from [1], [2], [3] and [4] as mentioned in Debian report in =
[5].
>
> [1] https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d=
7e12085feb2a6
> [2] https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e=
43bd1dce01d69
> [3] https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759=
b474f56562412
> [4] https://github.com/systemd/systemd/commit/54588d2dedff54bfb6036670820=
650e4ea74628f
> [5] https://security-tracker.debian.org/tracker/CVE-2026-29111
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  .../systemd/systemd/CVE-2026-29111-01.patch   | 168 ++++++++++++++++++
>  .../systemd/systemd/CVE-2026-29111-02.patch   |  87 +++++++++
>  .../systemd/systemd/CVE-2026-29111-03.patch   | 103 +++++++++++
>  .../systemd/systemd/CVE-2026-29111-04.patch   |  37 ++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
>  5 files changed, 399 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.p=
atch
>
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch b/=
meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
> new file mode 100644
> index 0000000000..b358f5b021
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
> @@ -0,0 +1,168 @@
> +From 284fd279f9e9c199982aea51aee59a02e90a2eda Mon Sep 17 00:00:00 2001
> +From: Lennart Poettering <lennart@poettering.net>
> +Date: Mon, 19 May 2025 12:58:52 +0200
> +Subject: [PATCH 1/4] path-util: add flavour of path_startswith() that le=
aves a
> + leading slash in place
> +
> +CVE: CVE-2026-29111
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/200=
21e7686426052e3a7505425d7e12085feb2a6]
> +
> +(cherry picked from commit ee19edbb9f3455db3f750089082f3e5a925e3a0c)
> +(cherry picked from commit 20021e7686426052e3a7505425d7e12085feb2a6)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + src/basic/fs-util.c       |  2 +-
> + src/basic/mkdir.c         |  2 +-
> + src/basic/path-util.c     | 39 ++++++++++++++++++++++++++++-----------
> + src/basic/path-util.h     | 10 ++++++++--
> + src/test/test-path-util.c | 16 ++++++++++++++++
> + 5 files changed, 54 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
> +index 5bc7d2f95b..4633a5cd72 100644
> +--- a/src/basic/fs-util.c
> ++++ b/src/basic/fs-util.c
> +@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) =
{
> +                 assert(*slash =3D=3D '/');
> +                 *slash =3D '\0';
> +=20
> +-                if (path_startswith_full(stop, p, /* accept_dot_dot=3D =
*/ false))
> ++                if (path_startswith_full(stop, p, /* flags=3D */ 0))
> +                         return 0;
> +=20
> +                 if (rmdir(p) < 0 && errno !=3D ENOENT)
> +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> +index c770e5ed32..7bc73361a5 100644
> +--- a/src/basic/mkdir.c
> ++++ b/src/basic/mkdir.c
> +@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const=
 char *path, mode_t mode, ui
> +         assert(_mkdirat !=3D mkdirat);
> +=20
> +         if (prefix) {
> +-                p =3D path_startswith_full(path, prefix, /* accept_dot_=
dot=3D */ false);
> ++                p =3D path_startswith_full(path, prefix, /* flags=3D */=
 0);
> +                 if (!p)
> +                         return -ENOTDIR;
> +         } else
> +diff --git a/src/basic/path-util.c b/src/basic/path-util.c
> +index 6810bf66aa..e73f5d708e 100644
> +--- a/src/basic/path-util.c
> ++++ b/src/basic/path-util.c
> +@@ -403,8 +403,8 @@ char* path_simplify_full(char *path, PathSimplifyFla=
gs flags) {
> +         return path;
> + }
> +=20
> +-char* path_startswith_full(const char *path, const char *prefix, bool a=
ccept_dot_dot) {
> +-        assert(path);
> ++char* path_startswith_full(const char *original_path, const char *prefi=
x, PathStartWithFlags flags) {
> ++        assert(original_path);
> +         assert(prefix);
> +=20
> +         /* Returns a pointer to the start of the first component after =
the parts matched by
> +@@ -417,28 +417,45 @@ char* path_startswith_full(const char *path, const=
 char *prefix, bool accept_dot
> +          * Returns NULL otherwise.
> +          */
> +=20
> ++        const char *path =3D original_path;
> ++
> +         if ((path[0] =3D=3D '/') !=3D (prefix[0] =3D=3D '/'))
> +                 return NULL;
> +=20
> +         for (;;) {
> +                 const char *p, *q;
> +-                int r, k;
> ++                int m, n;
> +=20
> +-                r =3D path_find_first_component(&path, accept_dot_dot, =
&p);
> +-                if (r < 0)
> ++                m =3D path_find_first_component(&path, FLAGS_SET(flags,=
 PATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
> ++                if (m < 0)
> +                         return NULL;
> +=20
> +-                k =3D path_find_first_component(&prefix, accept_dot_dot=
, &q);
> +-                if (k < 0)
> ++                n =3D path_find_first_component(&prefix, FLAGS_SET(flag=
s, PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
> ++                if (n < 0)
> +                         return NULL;
> +=20
> +-                if (k =3D=3D 0)
> +-                        return (char*) (p ?: path);
> ++                if (n =3D=3D 0) {
> ++                        if (!p)
> ++                                p =3D path;
> ++
> ++                        if (FLAGS_SET(flags, PATH_STARTSWITH_RETURN_LEA=
DING_SLASH)) {
> ++
> ++                                if (p <=3D original_path)
> ++                                        return NULL;
> ++
> ++                                p--;
> ++
> ++                                if (*p !=3D '/')
> ++                                        return NULL;
> ++                        }
> ++
> ++                        return (char*) p;
> ++                }
> +=20
> +-                if (r !=3D k)
> ++                if (m !=3D n)
> +                         return NULL;
> +=20
> +-                if (!strneq(p, q, r))
> ++                if (!strneq(p, q, m))
> +                         return NULL;
> +         }
> + }
> +diff --git a/src/basic/path-util.h b/src/basic/path-util.h
> +index 6d943e967f..e0ec05f4db 100644
> +--- a/src/basic/path-util.h
> ++++ b/src/basic/path-util.h
> +@@ -53,9 +53,15 @@ int safe_getcwd(char **ret);
> + int path_make_absolute_cwd(const char *p, char **ret);
> + int path_make_relative(const char *from, const char *to, char **ret);
> + int path_make_relative_parent(const char *from_child, const char *to, c=
har **ret);
> +-char* path_startswith_full(const char *path, const char *prefix, bool a=
ccept_dot_dot) _pure_;
> ++
> ++typedef enum PathStartWithFlags {
> ++        PATH_STARTSWITH_ACCEPT_DOT_DOT       =3D 1U << 0,
> ++        PATH_STARTSWITH_RETURN_LEADING_SLASH =3D 1U << 1,
> ++} PathStartWithFlags;
> ++
> ++char* path_startswith_full(const char *path, const char *prefix, PathSt=
artWithFlags flags) _pure_;
> + static inline char* path_startswith(const char *path, const char *prefi=
x) {
> +-        return path_startswith_full(path, prefix, true);
> ++        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEP=
T_DOT_DOT);
> + }
> +=20
> + int path_compare(const char *a, const char *b) _pure_;
> +diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
> +index f5a425689a..71056b08c1 100644
> +--- a/src/test/test-path-util.c
> ++++ b/src/test/test-path-util.c
> +@@ -754,6 +754,22 @@ TEST(path_startswith) {
> +         test_path_startswith_one("/foo/bar/barfoo/", "/fo", NULL, NULL)=
;
> + }
> +=20
> ++static void test_path_startswith_return_leading_slash_one(const char *p=
ath, const char *prefix, const char *expected) {
> ++        const char *p;
> ++
> ++        log_debug("/* %s(%s, %s) */", __func__, path, prefix);
> ++
> ++        p =3D path_startswith_full(path, prefix, PATH_STARTSWITH_RETURN=
_LEADING_SLASH);
> ++        assert_se(streq_ptr(p, expected));
> ++}
> ++
> ++TEST(path_startswith_return_leading_slash) {
> ++        test_path_startswith_return_leading_slash_one("/foo/bar", "/", =
"/foo/bar");
> ++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo=
", "/bar");
> ++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo=
/bar", NULL);
> ++        test_path_startswith_return_leading_slash_one("/foo/bar/", "/fo=
o/bar", "/");
> ++}
> ++
> + static void test_prefix_root_one(const char *r, const char *p, const ch=
ar *expected) {
> +         _cleanup_free_ char *s =3D NULL;
> +         const char *t;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch b/=
meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
> new file mode 100644
> index 0000000000..465d1e619d
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
> @@ -0,0 +1,87 @@
> +From ed86ee8a7cc82fe1c68e3fb17be71c9c8e62ca87 Mon Sep 17 00:00:00 2001
> +From: Lennart Poettering <lennart@poettering.net>
> +Date: Fri, 23 May 2025 06:45:40 +0200
> +Subject: [PATCH 2/4] path-util: invert PATH_STARTSWITH_ACCEPT_DOT_DOT fl=
ag
> +
> +As requested: https://github.com/systemd/systemd/pull/37572#pullrequestr=
eview-2861928094
> +
> +CVE: CVE-2026-29111
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7ac=
3220213690e8a8d6d2a6e81e43bd1dce01d69]
> +
> +(cherry picked from commit ceed11e465f1c8efff1931412a85924d9de7c08d)
> +(cherry picked from commit 7ac3220213690e8a8d6d2a6e81e43bd1dce01d69)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + src/basic/fs-util.c   | 2 +-
> + src/basic/mkdir.c     | 2 +-
> + src/basic/path-util.c | 4 ++--
> + src/basic/path-util.h | 4 ++--
> + 4 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
> +index 4633a5cd72..21cd6ddcde 100644
> +--- a/src/basic/fs-util.c
> ++++ b/src/basic/fs-util.c
> +@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) =
{
> +                 assert(*slash =3D=3D '/');
> +                 *slash =3D '\0';
> +=20
> +-                if (path_startswith_full(stop, p, /* flags=3D */ 0))
> ++                if (path_startswith_full(stop, p, PATH_STARTSWITH_REFUS=
E_DOT_DOT))
> +                         return 0;
> +=20
> +                 if (rmdir(p) < 0 && errno !=3D ENOENT)
> +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> +index 7bc73361a5..8f14c47214 100644
> +--- a/src/basic/mkdir.c
> ++++ b/src/basic/mkdir.c
> +@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const=
 char *path, mode_t mode, ui
> +         assert(_mkdirat !=3D mkdirat);
> +=20
> +         if (prefix) {
> +-                p =3D path_startswith_full(path, prefix, /* flags=3D */=
 0);
> ++                p =3D path_startswith_full(path, prefix, PATH_STARTSWIT=
H_REFUSE_DOT_DOT);
> +                 if (!p)
> +                         return -ENOTDIR;
> +         } else
> +diff --git a/src/basic/path-util.c b/src/basic/path-util.c
> +index e73f5d708e..a65a5c32f6 100644
> +--- a/src/basic/path-util.c
> ++++ b/src/basic/path-util.c
> +@@ -426,11 +426,11 @@ char* path_startswith_full(const char *original_pa=
th, const char *prefix, PathSt
> +                 const char *p, *q;
> +                 int m, n;
> +=20
> +-                m =3D path_find_first_component(&path, FLAGS_SET(flags,=
 PATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
> ++                m =3D path_find_first_component(&path, !FLAGS_SET(flags=
, PATH_STARTSWITH_REFUSE_DOT_DOT), &p);
> +                 if (m < 0)
> +                         return NULL;
> +=20
> +-                n =3D path_find_first_component(&prefix, FLAGS_SET(flag=
s, PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
> ++                n =3D path_find_first_component(&prefix, !FLAGS_SET(fla=
gs, PATH_STARTSWITH_REFUSE_DOT_DOT), &q);
> +                 if (n < 0)
> +                         return NULL;
> +=20
> +diff --git a/src/basic/path-util.h b/src/basic/path-util.h
> +index e0ec05f4db..11a1078df9 100644
> +--- a/src/basic/path-util.h
> ++++ b/src/basic/path-util.h
> +@@ -55,13 +55,13 @@ int path_make_relative(const char *from, const char =
*to, char **ret);
> + int path_make_relative_parent(const char *from_child, const char *to, c=
har **ret);
> +=20
> + typedef enum PathStartWithFlags {
> +-        PATH_STARTSWITH_ACCEPT_DOT_DOT       =3D 1U << 0,
> ++        PATH_STARTSWITH_REFUSE_DOT_DOT       =3D 1U << 0,
> +         PATH_STARTSWITH_RETURN_LEADING_SLASH =3D 1U << 1,
> + } PathStartWithFlags;
> +=20
> + char* path_startswith_full(const char *path, const char *prefix, PathSt=
artWithFlags flags) _pure_;
> + static inline char* path_startswith(const char *path, const char *prefi=
x) {
> +-        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEP=
T_DOT_DOT);
> ++        return path_startswith_full(path, prefix, 0);
> + }
> +=20
> + int path_compare(const char *a, const char *b) _pure_;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch b/=
meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
> new file mode 100644
> index 0000000000..d0ff3fb64c
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
> @@ -0,0 +1,103 @@
> +From 7a1749753b4853866f90ef25d48192e4d1563543 Mon Sep 17 00:00:00 2001
> +From: Mike Yuan <me@yhndnzj.com>
> +Date: Thu, 26 Feb 2026 11:06:00 +0100
> +Subject: [PATCH 3/4] core/cgroup: avoid one unnecessary strjoina()
> +
> +CVE: CVE-2026-29111
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/211=
67006574d6b83813c7596759b474f56562412]
> +
> +(cherry picked from commit 42aee39107fbdd7db1ccd402a2151822b2805e9f)
> +(cherry picked from commit 80acea4ef80a4bb78560ed970c34952299b890d6)
> +(cherry picked from commit b5fd14693057e5f2c9b4a49603be64ec3608ff6c)
> +(cherry picked from commit 21167006574d6b83813c7596759b474f56562412)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + src/core/cgroup.c | 27 +++++++++++++--------------
> + 1 file changed, 13 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/core/cgroup.c b/src/core/cgroup.c
> +index d398655b0a..e5e7f032c2 100644
> +--- a/src/core/cgroup.c
> ++++ b/src/core/cgroup.c
> +@@ -2568,12 +2568,13 @@ static int unit_update_cgroup(
> +         return 0;
> + }
> +=20
> +-static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const =
char *suffix_path) {
> ++static int unit_attach_pid_to_cgroup_via_bus(Unit *u, const char *cgrou=
p_path, pid_t pid) {
> +         _cleanup_(sd_bus_error_free) sd_bus_error error =3D SD_BUS_ERRO=
R_NULL;
> +-        char *pp;
> +         int r;
> +=20
> +         assert(u);
> ++        assert(cgroup_path);
> ++        assert(pid_is_valid(pid));
> +=20
> +         if (MANAGER_IS_SYSTEM(u->manager))
> +                 return -EINVAL;
> +@@ -2581,17 +2582,13 @@ static int unit_attach_pid_to_cgroup_via_bus(Uni=
t *u, pid_t pid, const char *suf
> +         if (!u->manager->system_bus)
> +                 return -EIO;
> +=20
> +-        if (!u->cgroup_path)
> +-                return -EINVAL;
> +-
> +         /* Determine this unit's cgroup path relative to our cgroup roo=
t */
> +-        pp =3D path_startswith(u->cgroup_path, u->manager->cgroup_root)=
;
> ++        const char *pp =3D path_startswith_full(cgroup_path,
> ++                                              u->manager->cgroup_root,
> ++                                              PATH_STARTSWITH_RETURN_LE=
ADING_SLASH|PATH_STARTSWITH_REFUSE_DOT_DOT);
> +         if (!pp)
> +                 return -EINVAL;
> +=20
> +-        pp =3D strjoina("/", pp, suffix_path);
> +-        path_simplify(pp);
> +-
> +         r =3D bus_call_method(u->manager->system_bus,
> +                             bus_systemd_mgr,
> +                             "AttachProcessesToUnit",
> +@@ -2630,8 +2627,10 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids=
, const char *suffix_path) {
> +                 return r;
> +=20
> +         if (isempty(suffix_path))
> +-                p =3D u->cgroup_path;
> ++                p =3D empty_to_root(u->cgroup_path);
> +         else {
> ++                assert(path_is_absolute(suffix_path));
> ++
> +                 joined =3D path_join(u->cgroup_path, suffix_path);
> +                 if (!joined)
> +                         return -ENOMEM;
> +@@ -2649,7 +2648,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids,=
 const char *suffix_path) {
> +                  * before we use it */
> +                 r =3D pidref_verify(pid);
> +                 if (r < 0) {
> +-                        log_unit_info_errno(u, r, "PID " PID_FMT " vani=
shed before we could move it to target cgroup '%s', skipping: %m", pid->pid=
, empty_to_root(p));
> ++                        log_unit_info_errno(u, r, "PID " PID_FMT " vani=
shed before we could move it to target cgroup '%s', skipping: %m", pid->pid=
, p);
> +                         continue;
> +                 }
> +=20
> +@@ -2660,7 +2659,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids,=
 const char *suffix_path) {
> +=20
> +                         log_unit_full_errno(u, again ? LOG_DEBUG : LOG_=
INFO,  r,
> +                                             "Couldn't move process "PID=
_FMT" to%s requested cgroup '%s': %m",
> +-                                            pid->pid, again ? " directl=
y" : "", empty_to_root(p));
> ++                                            pid->pid, again ? " directl=
y" : "", p);
> +=20
> +                         if (again) {
> +                                 int z;
> +@@ -2670,9 +2669,9 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids,=
 const char *suffix_path) {
> +                                  * Since it's more privileged it might =
be able to move the process across the
> +                                  * leaves of a subtree whose top node i=
s not owned by us. */
> +=20
> +-                                z =3D unit_attach_pid_to_cgroup_via_bus=
(u, pid->pid, suffix_path);
> ++                                z =3D unit_attach_pid_to_cgroup_via_bus=
(u, p, pid->pid);
> +                                 if (z < 0)
> +-                                        log_unit_info_errno(u, z, "Coul=
dn't move process "PID_FMT" to requested cgroup '%s' (directly or via the s=
ystem bus): %m", pid->pid, empty_to_root(p));
> ++                                        log_unit_info_errno(u, z, "Coul=
dn't move process "PID_FMT" to requested cgroup '%s' (directly or via the s=
ystem bus): %m", pid->pid, p);
> +                                 else {
> +                                         if (ret >=3D 0)
> +                                                 ret++; /* Count success=
ful additions */
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch b/=
meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
> new file mode 100644
> index 0000000000..d6c3f5ccdc
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
> @@ -0,0 +1,37 @@
> +From 0d2c41d0f024088a275ac0c02d50205c800dec8a Mon Sep 17 00:00:00 2001
> +From: Mike Yuan <me@yhndnzj.com>
> +Date: Thu, 26 Feb 2026 11:06:34 +0100
> +Subject: [PATCH 4/4] core: validate input cgroup path more prudently
> +
> +CVE: CVE-2026-29111
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/545=
88d2dedff54bfb6036670820650e4ea74628f]
> +
> +(cherry picked from commit efa6ba2ab625aaa160ac435a09e6482fc63bdbe8)
> +(cherry picked from commit 3cee294fe8cf4fa0eff933ab21416d099942cabd)
> +(cherry picked from commit 1d22f706bd04f45f8422e17fbde3f56ece17758a)
> +(cherry picked from commit 54588d2dedff54bfb6036670820650e4ea74628f)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + src/core/dbus-manager.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/core/dbus-manager.c b/src/core/dbus-manager.c
> +index c7372ca033..cb84ba9866 100644
> +--- a/src/core/dbus-manager.c
> ++++ b/src/core/dbus-manager.c
> +@@ -646,6 +646,12 @@ static int method_get_unit_by_control_group(sd_bus_=
message *message, void *userd
> +         if (r < 0)
> +                 return r;
> +=20
> ++        if (!path_is_absolute(cgroup))
> ++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_AR=
GS, "Control group path is not absolute: %s", cgroup);
> ++
> ++        if (!path_is_normalized(cgroup))
> ++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_AR=
GS, "Control group path is not normalized: %s", cgroup);
> ++
> +         u =3D manager_get_unit_by_cgroup(m, cgroup);
> +         if (!u)
> +                 return sd_bus_error_setf(error, BUS_ERROR_NO_SUCH_UNIT,
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 9c5f8af240..e5a0fd9170 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -33,6 +33,10 @@ SRC_URI +=3D " \
>             file://CVE-2026-40225-02.patch \
>             file://CVE-2026-40226-01.patch \
>             file://CVE-2026-40226-02.patch \
> +           file://CVE-2026-29111-01.patch \
> +           file://CVE-2026-29111-02.patch \
> +           file://CVE-2026-29111-03.patch \
> +           file://CVE-2026-29111-04.patch \
>             "
> =20
>  # patches needed by musl


