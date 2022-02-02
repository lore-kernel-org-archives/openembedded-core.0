Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5D8C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:58:32 +0000 (UTC)
Received: from forward101p.mail.yandex.net (forward101p.mail.yandex.net
 [77.88.28.101])
 by mx.groups.io with SMTP id smtpd.web10.64691.1643810309419269181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=Y3Hpgr5/;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.101, mailfrom: pavel@zhukoff.net)
Received: from iva7-ce0ba32ecdb6.qloud-c.yandex.net
 (iva7-ce0ba32ecdb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2e91:0:640:ce0b:a32e])
	by forward101p.mail.yandex.net (Yandex) with ESMTP id 3B0BE59CCEF4;
	Wed,  2 Feb 2022 16:58:25 +0300 (MSK)
Received: from iva1-dcde80888020.qloud-c.yandex.net
 (iva1-dcde80888020.qloud-c.yandex.net [2a02:6b8:c0c:7695:0:640:dcde:8088])
	by iva7-ce0ba32ecdb6.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 wnP4JnWHL2-wOcOjwWG;
	Wed, 02 Feb 2022 16:58:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1643810305;
	bh=ZeTZtFMt+J7XDZvGm0vuT+PFM1Ptf5YvT/I2BGAW6rU=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=Y3Hpgr5/yQ7OltS4gBv82N7FjcoBV7zBMfTo1GBaBYYUP+X37N1biHU7BQh3jH+m7
	 JAxpz78Nn/CkLbTjOQVdr7n7Ukv9n+jt2sL6hHg+aDGIve0qJ5pX7jOc90uc5ezZe6
	 jjv/NaAuux7gnxORLZhDcmwwpC47n6mk42xvyIFo=
Authentication-Results: iva7-ce0ba32ecdb6.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva1-dcde80888020.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id cFvC42II9x-wNH42Stq;
	Wed, 02 Feb 2022 16:58:24 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] systemd: allow to create directory whose path contains
 symlink
Date: Wed,  2 Feb 2022 14:57:29 +0100
Message-Id: <20220202135727.6708-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:58:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161209

Systemd version 250 has a regression which blocks mountd service from
creating subdirectories if path contains symlink. This blocks bind
mounts under /var/run, /lib for example.

Bug-Url: https://github.com/systemd/systemd/issues/22334

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 ...reate-directory-whose-path-contains-.patch | 130 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.3.bb    |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-mkdir-allow-to=
-create-directory-whose-path-contains-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-mkdir-allow-to-create=
-directory-whose-path-contains-.patch b/meta/recipes-core/systemd/systemd=
/0001-mkdir-allow-to-create-directory-whose-path-contains-.patch
new file mode 100644
index 0000000000..003db430b7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-mkdir-allow-to-create-direct=
ory-whose-path-contains-.patch
@@ -0,0 +1,130 @@
+From b060c53503339c45808efeb4294a03105a2999a5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 2 Feb 2022 14:05:45 +0900
+Subject: [PATCH] mkdir: allow to create directory whose path contains sy=
mlink
+Cc: pavel@zhukoff.net
+
+Upstream-Status: Backport
+Upstream-Url: https://github.com/systemd/systemd/pull/22359
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+
+core/mount: fail early if directory cannot be created
+
+Prompted by #22334.
+
+mkdir: CHASE_NONEXISTENT cannot used in chase_symlinks_and_stat()
+
+mkdir: allow to create directory whose path contains symlink
+
+Fixes a regression caused by 3008a6f21c1c42efe852d69798a2fdd63fe657ec.
+
+Before the commit, when `mkdir_parents_internal()` is called from `mkdir=
_p()`,
+it uses `_mkdir()` as `flag` is zero. But after the commit, `mkdir_safe_=
internal()`
+is always used. Hence, if the path contains a symlink, it fails with -EN=
OTDIR.
+
+To fix the issue, this makes `mkdir_p()` calls `mkdir_parents_internal()=
` with
+MKDIR_FOLLOW_SYMLINK flag.
+
+Fixes #22334.
+
+test: add a test for mkdir_p()
+---
+ src/basic/mkdir.c     |  4 ++--
+ src/core/mount.c      |  4 +++-
+ src/test/meson.build  |  2 ++
+ src/test/test-mkdir.c | 30 ++++++++++++++++++++++++++++++
+ 4 files changed, 37 insertions(+), 3 deletions(-)
+ create mode 100644 src/test/test-mkdir.c
+
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 6e2b94d024..51a0d74e87 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -42,7 +42,7 @@ int mkdir_safe_internal(
+         if ((flags & MKDIR_FOLLOW_SYMLINK) && S_ISLNK(st.st_mode)) {
+                 _cleanup_free_ char *p =3D NULL;
+=20
+-                r =3D chase_symlinks_and_stat(path, NULL, CHASE_NONEXIS=
TENT, &p, &st, NULL);
++                r =3D chase_symlinks_and_stat(path, NULL, 0, &p, &st, N=
ULL);
+                 if (r < 0)
+                         return r;
+                 if (r =3D=3D 0)
+@@ -162,7 +162,7 @@ int mkdir_p_internal(const char *prefix, const char =
*path, mode_t mode, uid_t ui
+=20
+         assert(_mkdirat !=3D mkdirat);
+=20
+-        r =3D mkdir_parents_internal(prefix, path, mode, uid, gid, flag=
s, _mkdirat);
++        r =3D mkdir_parents_internal(prefix, path, mode, uid, gid, flag=
s | MKDIR_FOLLOW_SYMLINK, _mkdirat);
+         if (r < 0)
+                 return r;
+=20
+diff --git a/src/core/mount.c b/src/core/mount.c
+index 0170406351..c650b5abe2 100644
+--- a/src/core/mount.c
++++ b/src/core/mount.c
+@@ -1027,8 +1027,10 @@ static void mount_enter_mounting(Mount *m) {
+                 r =3D mkdir_p_label(p->what, m->directory_mode);
+                 /* mkdir_p_label() can return -EEXIST if the target pat=
h exists and is not a directory - which is
+                  * totally OK, in case the user wants us to overmount a=
 non-directory inode. */
+-                if (r < 0 && r !=3D -EEXIST)
++                if (r < 0 && r !=3D -EEXIST) {
+                         log_unit_error_errno(UNIT(m), r, "Failed to mak=
e bind mount source '%s': %m", p->what);
++                        goto fail;
++                }
+         }
+=20
+         if (p) {
+diff --git a/src/test/meson.build b/src/test/meson.build
+index 9a1c481f22..7aa1d9c6ea 100644
+--- a/src/test/meson.build
++++ b/src/test/meson.build
+@@ -193,6 +193,8 @@ tests +=3D [
+=20
+         [['src/test/test-macro.c']],
+=20
++        [['src/test/test-mkdir.c']],
++
+         [['src/test/test-json.c']],
+=20
+         [['src/test/test-modhex.c']],
+diff --git a/src/test/test-mkdir.c b/src/test/test-mkdir.c
+new file mode 100644
+index 0000000000..c715d5f096
+--- /dev/null
++++ b/src/test/test-mkdir.c
+@@ -0,0 +1,30 @@
++/* SPDX-License-Identifier: LGPL-2.1-or-later */
++
++#include <unistd.h>
++
++#include "mkdir.h"
++#include "path-util.h"
++#include "rm-rf.h"
++#include "tests.h"
++#include "tmpfile-util.h"
++
++TEST(mkdir_p) {
++        _cleanup_(rm_rf_physical_and_freep) char *tmp =3D NULL;
++        _cleanup_free_ char *p =3D NULL;
++
++        assert_se(mkdtemp_malloc("/tmp/test-mkdir-XXXXXX", &tmp) >=3D 0=
);
++
++        assert_se(p =3D path_join(tmp, "run"));
++        assert_se(mkdir_p(p, 0755) >=3D 0);
++
++        p =3D mfree(p);
++        assert_se(p =3D path_join(tmp, "var/run"));
++        assert_se(mkdir_parents(p, 0755) >=3D 0);
++        assert_se(symlink("../run", p) >=3D 0);
++
++        p =3D mfree(p);
++        assert_se(p =3D path_join(tmp, "var/run/hoge/foo/baz"));
++        assert_se(mkdir_p(p, 0755) >=3D 0);
++}
++
++DEFINE_TEST_MAIN(LOG_DEBUG);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-co=
re/systemd/systemd_250.3.bb
index de16a4d78d..57987218a1 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -25,6 +25,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-sla=
sh.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
+           file://0001-mkdir-allow-to-create-directory-whose-path-contai=
ns-.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


