Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609C1C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 10:36:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23123.1647426985259104056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 03:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 161191476;
	Wed, 16 Mar 2022 03:36:24 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.23.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60D943F73D;
	Wed, 16 Mar 2022 03:36:23 -0700 (PDT)
From: Richard Neill <richard.neill@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: diego.sueiro@arm.com
Subject: [OC-core] [PATCH] systemd: Update 250.3 -> 250.4
Date: Wed, 16 Mar 2022 10:37:24 +0000
Message-Id: <20220316103724.1689027-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 10:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163329

The following security and bug-fix patches are included as part of the 25=
0.4
update:

c6603da3ad boot: Properly check status code of console_key_read
2198c08d07 core: really skip automatic restart when a JOB_STOP job is pen=
ding
367041af81 pid1: set SYSTEMD_NSS_DYNAMIC_BYPASS=3D1 env var for dbus-daem=
on
160eeab224 virt: Fix Xen Dom0 detection logic to no longer report as VM
514a4c051c network: bridge: fix endian of vlan protocol
4dbc210124 resolve: fix possible memleak
d82bd80cf4 resolve: fix potential memleak and use-after-free
dcba78244e util: another set of CVE-2021-4034 assert()s
74dfb51f70 sd-dhcp6-client: fix sending prefix delegation request during =
rebind
df59c65a23 mkdir: allow to create directory whose path contains symlink
ae95ca27be sd-dhcp-lease: fix memleak
2b04d3b3fc sd-dhcp-lease: fix reading unaligned memory
1ef56ad928 network: xfrm: refuse zero interface ID
7dc0f80588 sd-dhcp-lease: fix a memory leak in dhcp_lease_parse_search_do=
mains
426807c54b sd-dhcp-lease: fix an infinite loop found by the fuzzer
0456e3aaaa oomd: fix race with path unavailability when killing cgroups

As the following two patches:

0001-mkdir-allow-to-create-directory-whose-path-contains-.patch
0001-src-fundamental-list-fundamental_source_paths-using-.patch

have been merged in 250.4 or replaced, remove them.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 ...md-boot_250.3.bb =3D> systemd-boot_250.4.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   6 +-
 ...reate-directory-whose-path-contains-.patch | 130 ------------------
 ...list-fundamental_source_paths-using-.patch |  28 ----
 .../{systemd_250.3.bb =3D> systemd_250.4.bb}    |   1 -
 5 files changed, 2 insertions(+), 163 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_250.3.bb =3D> systemd-boo=
t_250.4.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-mkdir-allow-to=
-create-directory-whose-path-contains-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-src-fundamenta=
l-list-fundamental_source_paths-using-.patch
 rename meta/recipes-core/systemd/{systemd_250.3.bb =3D> systemd_250.4.bb=
} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.3.bb b/meta/recip=
es-core/systemd/systemd-boot_250.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_250.3.bb
rename to meta/recipes-core/systemd/systemd-boot_250.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index e69738add5..ac454b8afd 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"

-SRCREV =3D "1b003bbc806198dbdd57b405d968f30565495e70"
+SRCREV =3D "c3aead556847dd2694d559620123b65ff16afe8c"
 SRCBRANCH =3D "v250-stable"
-SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
-           file://0001-src-fundamental-list-fundamental_source_paths-usi=
ng-.patch \
-           "
+SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH}"

 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-mkdir-allow-to-create=
-directory-whose-path-contains-.patch b/meta/recipes-core/systemd/systemd=
/0001-mkdir-allow-to-create-directory-whose-path-contains-.patch
deleted file mode 100644
index 003db430b7..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-mkdir-allow-to-create-direct=
ory-whose-path-contains-.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From b060c53503339c45808efeb4294a03105a2999a5 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Wed, 2 Feb 2022 14:05:45 +0900
-Subject: [PATCH] mkdir: allow to create directory whose path contains sy=
mlink
-Cc: pavel@zhukoff.net
-
-Upstream-Status: Backport
-Upstream-Url: https://github.com/systemd/systemd/pull/22359
-
-Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
-
-
-core/mount: fail early if directory cannot be created
-
-Prompted by #22334.
-
-mkdir: CHASE_NONEXISTENT cannot used in chase_symlinks_and_stat()
-
-mkdir: allow to create directory whose path contains symlink
-
-Fixes a regression caused by 3008a6f21c1c42efe852d69798a2fdd63fe657ec.
-
-Before the commit, when `mkdir_parents_internal()` is called from `mkdir=
_p()`,
-it uses `_mkdir()` as `flag` is zero. But after the commit, `mkdir_safe_=
internal()`
-is always used. Hence, if the path contains a symlink, it fails with -EN=
OTDIR.
-
-To fix the issue, this makes `mkdir_p()` calls `mkdir_parents_internal()=
` with
-MKDIR_FOLLOW_SYMLINK flag.
-
-Fixes #22334.
-
-test: add a test for mkdir_p()
----
- src/basic/mkdir.c     |  4 ++--
- src/core/mount.c      |  4 +++-
- src/test/meson.build  |  2 ++
- src/test/test-mkdir.c | 30 ++++++++++++++++++++++++++++++
- 4 files changed, 37 insertions(+), 3 deletions(-)
- create mode 100644 src/test/test-mkdir.c
-
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 6e2b94d024..51a0d74e87 100644
---- a/src/basic/mkdir.c
-+++ b/src/basic/mkdir.c
-@@ -42,7 +42,7 @@ int mkdir_safe_internal(
-         if ((flags & MKDIR_FOLLOW_SYMLINK) && S_ISLNK(st.st_mode)) {
-                 _cleanup_free_ char *p =3D NULL;
-
--                r =3D chase_symlinks_and_stat(path, NULL, CHASE_NONEXIS=
TENT, &p, &st, NULL);
-+                r =3D chase_symlinks_and_stat(path, NULL, 0, &p, &st, N=
ULL);
-                 if (r < 0)
-                         return r;
-                 if (r =3D=3D 0)
-@@ -162,7 +162,7 @@ int mkdir_p_internal(const char *prefix, const char =
*path, mode_t mode, uid_t ui
-
-         assert(_mkdirat !=3D mkdirat);
-
--        r =3D mkdir_parents_internal(prefix, path, mode, uid, gid, flag=
s, _mkdirat);
-+        r =3D mkdir_parents_internal(prefix, path, mode, uid, gid, flag=
s | MKDIR_FOLLOW_SYMLINK, _mkdirat);
-         if (r < 0)
-                 return r;
-
-diff --git a/src/core/mount.c b/src/core/mount.c
-index 0170406351..c650b5abe2 100644
---- a/src/core/mount.c
-+++ b/src/core/mount.c
-@@ -1027,8 +1027,10 @@ static void mount_enter_mounting(Mount *m) {
-                 r =3D mkdir_p_label(p->what, m->directory_mode);
-                 /* mkdir_p_label() can return -EEXIST if the target pat=
h exists and is not a directory - which is
-                  * totally OK, in case the user wants us to overmount a=
 non-directory inode. */
--                if (r < 0 && r !=3D -EEXIST)
-+                if (r < 0 && r !=3D -EEXIST) {
-                         log_unit_error_errno(UNIT(m), r, "Failed to mak=
e bind mount source '%s': %m", p->what);
-+                        goto fail;
-+                }
-         }
-
-         if (p) {
-diff --git a/src/test/meson.build b/src/test/meson.build
-index 9a1c481f22..7aa1d9c6ea 100644
---- a/src/test/meson.build
-+++ b/src/test/meson.build
-@@ -193,6 +193,8 @@ tests +=3D [
-
-         [['src/test/test-macro.c']],
-
-+        [['src/test/test-mkdir.c']],
-+
-         [['src/test/test-json.c']],
-
-         [['src/test/test-modhex.c']],
-diff --git a/src/test/test-mkdir.c b/src/test/test-mkdir.c
-new file mode 100644
-index 0000000000..c715d5f096
---- /dev/null
-+++ b/src/test/test-mkdir.c
-@@ -0,0 +1,30 @@
-+/* SPDX-License-Identifier: LGPL-2.1-or-later */
-+
-+#include <unistd.h>
-+
-+#include "mkdir.h"
-+#include "path-util.h"
-+#include "rm-rf.h"
-+#include "tests.h"
-+#include "tmpfile-util.h"
-+
-+TEST(mkdir_p) {
-+        _cleanup_(rm_rf_physical_and_freep) char *tmp =3D NULL;
-+        _cleanup_free_ char *p =3D NULL;
-+
-+        assert_se(mkdtemp_malloc("/tmp/test-mkdir-XXXXXX", &tmp) >=3D 0=
);
-+
-+        assert_se(p =3D path_join(tmp, "run"));
-+        assert_se(mkdir_p(p, 0755) >=3D 0);
-+
-+        p =3D mfree(p);
-+        assert_se(p =3D path_join(tmp, "var/run"));
-+        assert_se(mkdir_parents(p, 0755) >=3D 0);
-+        assert_se(symlink("../run", p) >=3D 0);
-+
-+        p =3D mfree(p);
-+        assert_se(p =3D path_join(tmp, "var/run/hoge/foo/baz"));
-+        assert_se(mkdir_p(p, 0755) >=3D 0);
-+}
-+
-+DEFINE_TEST_MAIN(LOG_DEBUG);
---
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-src-fundamental-list-=
fundamental_source_paths-using-.patch b/meta/recipes-core/systemd/systemd=
/0001-src-fundamental-list-fundamental_source_paths-using-.patch
deleted file mode 100644
index 1d0887490c..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-src-fundamental-list-fundame=
ntal_source_paths-using-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8e882df78ede98c15a3f2567fabebfde1d774b02 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 7 Jan 2022 21:20:15 +0100
-Subject: [PATCH] src/fundamental: list fundamental_source_paths using re=
lative
- paths
-
-Otherwise, the compiler takes the full path to the source file
-and writes it into the binary output, breaking reproducibility.
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/2204=
7]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/fundamental/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/fundamental/meson.build b/src/fundamental/meson.build
-index 287f0fe36a..954bdf150b 100644
---- a/src/fundamental/meson.build
-+++ b/src/fundamental/meson.build
-@@ -20,7 +20,7 @@ sources =3D '''
- # for sd-boot
- fundamental_source_paths =3D []
- foreach source : sources
--        fundamental_source_paths +=3D meson.current_source_dir() / sour=
ce
-+        fundamental_source_paths +=3D '../../fundamental/' + source
- endforeach
-
- # for libbasic
diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-co=
re/systemd/systemd_250.4.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_250.3.bb
rename to meta/recipes-core/systemd/systemd_250.4.bb
index 31c5c55c3f..2b346113b5 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.4.bb
@@ -25,7 +25,6 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-sla=
sh.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
-           file://0001-mkdir-allow-to-create-directory-whose-path-contai=
ns-.patch \
            file://0029-network-enable-KeepConfiguration-when-running-on-=
net.patch \
            "

--
2.25.1


