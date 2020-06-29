Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.14135.1593417314463860787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 00:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: wenlin.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05T7sq91025027
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 00:55:03 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 29 Jun 2020
 00:54:42 -0700
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] systemd: fix CVE-2020-13776
Date: Mon, 29 Jun 2020 00:54:41 -0700
Message-ID: <20200629075441.27702-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport from systemd.git.

(OE-Core master rev: a1b22b2263da6d11a4e0cbfa792d2bd1e56f5346)

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../systemd/systemd/CVE-2020-13776.patch      | 96 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_243.2.bb    |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch b/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
new file mode 100644
index 0000000000..7b5e3e7f7a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
@@ -0,0 +1,96 @@
+From 156a5fd297b61bce31630d7a52c15614bf784843 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Sun, 31 May 2020 18:21:09 +0200
+Subject: [PATCH 1/1] basic/user-util: always use base 10 for user/group
+ numbers
+
+We would parse numbers with base prefixes as user identifiers. For example,
+"0x2b3bfa0" would be interpreted as UID==45334432 and "01750" would be
+interpreted as UID==1000. This parsing was used also in cases where either a
+user/group name or number may be specified. This means that names like
+0x2b3bfa0 would be ambiguous: they are a valid user name according to our
+documented relaxed rules, but they would also be parsed as numeric uids.
+
+This behaviour is definitely not expected by users, since tools generally only
+accept decimal numbers (e.g. id, getent passwd), while other tools only accept
+user names and thus will interpret such strings as user names without even
+attempting to convert them to numbers (su, ssh). So let's follow suit and only
+accept numbers in decimal notation. Effectively this means that we will reject
+such strings as a username/uid/groupname/gid where strict mode is used, and try
+to look up a user/group with such a name in relaxed mode.
+
+Since the function changed is fairly low-level and fairly widely used, this
+affects multiple tools: loginctl show-user/enable-linger/disable-linger foo',
+the third argument in sysusers.d, fourth and fifth arguments in tmpfiles.d,
+etc.
+
+Fixes #15985.
+---
+ src/basic/user-util.c     |  2 +-
+ src/test/test-user-util.c | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+--- end of commit 156a5fd297b61bce31630d7a52c15614bf784843 ---
+
+
+Add definition of safe_atou32_full() from commit b934ac3d6e7dcad114776ef30ee9098693e7ab7e
+
+CVE: CVE-2020-13776
+
+Upstream-Status: Backport [https://github.com/systemd/systemd.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+
+--- git.orig/src/basic/user-util.c
++++ git/src/basic/user-util.c
+@@ -49,7 +49,7 @@ int parse_uid(const char *s, uid_t *ret)
+         assert(s);
+ 
+         assert_cc(sizeof(uid_t) == sizeof(uint32_t));
+-        r = safe_atou32(s, &uid);
++        r = safe_atou32_full(s, 10, &uid);
+         if (r < 0)
+                 return r;
+ 
+--- git.orig/src/test/test-user-util.c
++++ git/src/test/test-user-util.c
+@@ -48,9 +48,19 @@ static void test_parse_uid(void) {
+ 
+         r = parse_uid("65535", &uid);
+         assert_se(r == -ENXIO);
++        assert_se(uid == 100);
++
++        r = parse_uid("0x1234", &uid);
++        assert_se(r == -EINVAL);
++        assert_se(uid == 100);
++
++        r = parse_uid("01234", &uid);
++        assert_se(r == 0);
++        assert_se(uid == 1234);
+ 
+         r = parse_uid("asdsdas", &uid);
+         assert_se(r == -EINVAL);
++        assert_se(uid == 1234);
+ }
+ 
+ static void test_uid_ptr(void) {
+--- git.orig/src/basic/parse-util.h
++++ git/src/basic/parse-util.h
+@@ -45,9 +45,13 @@ static inline int safe_atoux16(const cha
+ 
+ int safe_atoi16(const char *s, int16_t *ret);
+ 
+-static inline int safe_atou32(const char *s, uint32_t *ret_u) {
++static inline int safe_atou32_full(const char *s, unsigned base, uint32_t *ret_u) {
+         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
+-        return safe_atou(s, (unsigned*) ret_u);
++        return safe_atou_full(s, base, (unsigned*) ret_u);
++}
++
++static inline int safe_atou32(const char *s, uint32_t *ret_u) {
++        return safe_atou32_full(s, 0, (unsigned*) ret_u);
+ }
+ 
+ static inline int safe_atoi32(const char *s, int32_t *ret_i) {
diff --git a/meta/recipes-core/systemd/systemd_243.2.bb b/meta/recipes-core/systemd/systemd_243.2.bb
index 082eb4c384..905348176c 100644
--- a/meta/recipes-core/systemd/systemd_243.2.bb
+++ b/meta/recipes-core/systemd/systemd_243.2.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch \
            file://99-default.preset \
            file://0001-Merge-branch-polkit-ref-count.patch \
+           file://CVE-2020-13776.patch \
            "
 
 # patches needed by musl
-- 
2.17.1

