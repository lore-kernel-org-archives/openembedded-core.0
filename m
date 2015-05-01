Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id CF3CD73BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 10:41:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 90E2F600F5F
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 May 2015 11:41:29 +0100
Message-Id: <1430476889-5490-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.3.6
In-Reply-To: <[OE-core][PATCH] systemd: remove unused patches>
References: <[OE-core][PATCH] systemd: remove unused patches>
Subject: [PATCH] systemd: remove unused patches
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
X-List-Received-Date: Fri, 01 May 2015 10:42:01 -0000

These patches are no longer required since 7bfc9891ff498bdde31aadd2449d3b4692dbc510

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 ...iles-avoid-creating-duplicate-acl-entries.patch | 134 ---------------
 ...ietly-ignore-ACLs-on-unsupported-filesyst.patch |  86 ----------
 ...0-Make-root-s-home-directory-configurable.patch | 181 ---------------------
 ...ix-Inappropriate-ioctl-for-device-on-ext4.patch |  37 -----
 4 files changed, 438 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
deleted file mode 100644
index 6652e28..0000000
--- a/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
-
-From 33d36e28b0a23fb7ac33435a1329d65bff1ba4ec Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Mon, 23 Feb 2015 23:19:54 -0500
-Subject: [PATCH] tmpfiles: avoid creating duplicate acl entries
-
-https://bugs.freedesktop.org/show_bug.cgi?id=89202
-https://bugs.debian.org/778656
-
-Status quo ante can be restored with:
-  getfacl -p /var/log/journal/`cat /etc/machine-id`|grep -v '^#'|sort -u|sudo setfacl --set-file=- /var/log/journal/`cat /etc/machine-id`
-
-(cherry picked from commit 1c73f3bc29111a00738569c9d40a989b161a0624)
----
- src/shared/acl-util.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++--
- src/shared/acl-util.h |  4 +++
- 2 files changed, 81 insertions(+), 2 deletions(-)
-
-diff --git a/src/shared/acl-util.c b/src/shared/acl-util.c
-index a4ff1ab..cbe09d7 100644
---- a/src/shared/acl-util.c
-+++ b/src/shared/acl-util.c
-@@ -282,6 +282,77 @@ int parse_acl(char *text, acl_t *acl_access, acl_t *acl_default, bool want_mask)
-         return 0;
- }
- 
-+static int acl_entry_equal(acl_entry_t a, acl_entry_t b) {
-+        acl_tag_t tag_a, tag_b;
-+
-+        if (acl_get_tag_type(a, &tag_a) < 0)
-+                return -errno;
-+
-+        if (acl_get_tag_type(b, &tag_b) < 0)
-+                return -errno;
-+
-+        if (tag_a != tag_b)
-+                return false;
-+
-+        switch (tag_a) {
-+        case ACL_USER_OBJ:
-+        case ACL_GROUP_OBJ:
-+        case ACL_MASK:
-+        case ACL_OTHER:
-+                /* can have only one of those */
-+                return true;
-+        case ACL_USER: {
-+                _cleanup_(acl_free_uid_tpp) uid_t *uid_a, *uid_b;
-+
-+                uid_a = acl_get_qualifier(a);
-+                if (!uid_a)
-+                        return -errno;
-+
-+                uid_b = acl_get_qualifier(b);
-+                if (!uid_b)
-+                        return -errno;
-+
-+                return *uid_a == *uid_b;
-+        }
-+        case ACL_GROUP: {
-+                _cleanup_(acl_free_gid_tpp) gid_t *gid_a, *gid_b;
-+
-+                gid_a = acl_get_qualifier(a);
-+                if (!gid_a)
-+                        return -errno;
-+
-+                gid_b = acl_get_qualifier(b);
-+                if (!gid_b)
-+                        return -errno;
-+
-+                return *gid_a == *gid_b;
-+        }
-+        default:
-+                assert_not_reached("Unknown acl tag type");
-+        }
-+}
-+
-+static int find_acl_entry(acl_t acl, acl_entry_t entry, acl_entry_t *out) {
-+        acl_entry_t i;
-+        int r;
-+
-+        for (r = acl_get_entry(acl, ACL_FIRST_ENTRY, &i);
-+             r > 0;
-+             r = acl_get_entry(acl, ACL_NEXT_ENTRY, &i)) {
-+
-+                r = acl_entry_equal(i, entry);
-+                if (r < 0)
-+                        return r;
-+                if (r > 0) {
-+                        *out = i;
-+                        return 1;
-+                }
-+        }
-+        if (r < 0)
-+                return -errno;
-+        return 0;
-+}
-+
- int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
-         _cleanup_(acl_freep) acl_t old;
-         acl_entry_t i;
-@@ -297,8 +368,12 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
- 
-                 acl_entry_t j;
- 
--                if (acl_create_entry(&old, &j) < 0)
--                        return -errno;
-+                r = find_acl_entry(old, i, &j);
-+                if (r < 0)
-+                        return r;
-+                if (r == 0)
-+                        if (acl_create_entry(&old, &j) < 0)
-+                                return -errno;
- 
-                 if (acl_copy_entry(j, i) < 0)
-                         return -errno;
-diff --git a/src/shared/acl-util.h b/src/shared/acl-util.h
-index 90e88ff..fdb9006 100644
---- a/src/shared/acl-util.h
-+++ b/src/shared/acl-util.h
-@@ -41,5 +41,9 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl);
- DEFINE_TRIVIAL_CLEANUP_FUNC(acl_t, acl_free);
- #define acl_free_charp acl_free
- DEFINE_TRIVIAL_CLEANUP_FUNC(char*, acl_free_charp);
-+#define acl_free_uid_tp acl_free
-+DEFINE_TRIVIAL_CLEANUP_FUNC(uid_t*, acl_free_uid_tp);
-+#define acl_free_gid_tp acl_free
-+DEFINE_TRIVIAL_CLEANUP_FUNC(gid_t*, acl_free_gid_tp);
- 
- #endif
--- 
-2.3.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch b/meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
deleted file mode 100644
index c195437..0000000
--- a/meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
-
-From 31d05181e3a34c5c0ff6314d8eca1c3b4bb29423 Mon Sep 17 00:00:00 2001
-From: Hans-Peter Deifel <hpd@hpdeifel.de>
-Date: Tue, 3 Mar 2015 00:35:08 +0100
-Subject: [PATCH 2/2] tmpfiles: quietly ignore ACLs on unsupported filesystems
-
-A warning is printed if ACLs cannot be retrieved for any reason other
-than -ENOSYS. For -ENOSYS, debug log is printed.
-
-(cherry picked from commit d873e8778c92014c02a9122852758b436fa95c0e)
----
- src/tmpfiles/tmpfiles.c | 36 ++++++++++++++++++++----------------
- 1 file changed, 20 insertions(+), 16 deletions(-)
-
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 88ba7e4..187997e 100644
---- a/src/tmpfiles/tmpfiles.c
-+++ b/src/tmpfiles/tmpfiles.c
-@@ -704,6 +704,9 @@ static int path_set_acl(const char *path, acl_type_t type, acl_t acl, bool modif
-         int r;
-         _cleanup_(acl_free_charpp) char *t = NULL;
- 
-+        /* Returns 0 for success, positive error if already warned,
-+         * negative error otherwise. */
-+
-         if (modify) {
-                 r = acls_for_file(path, type, acl, &dup);
-                 if (r < 0)
-@@ -731,35 +734,36 @@ static int path_set_acl(const char *path, acl_type_t type, acl_t acl, bool modif
- 
-         r = acl_set_file(path, type, dup);
-         if (r < 0)
--                return log_error_errno(-errno,
--                                       "Setting %s ACL \"%s\" on %s failed: %m",
--                                       type == ACL_TYPE_ACCESS ? "access" : "default",
--                                       strna(t), path);
-+                return -log_error_errno(errno,
-+                                        "Setting %s ACL \"%s\" on %s failed: %m",
-+                                        type == ACL_TYPE_ACCESS ? "access" : "default",
-+                                        strna(t), path);
-+
-         return 0;
- }
- #endif
- 
- static int path_set_acls(Item *item, const char *path) {
-+        int r = 0;
- #ifdef HAVE_ACL
--        int r;
--
-         assert(item);
-         assert(path);
- 
--        if (item->acl_access) {
-+        if (item->acl_access)
-                 r = path_set_acl(path, ACL_TYPE_ACCESS, item->acl_access, item->force);
--                if (r < 0)
--                        return r;
--        }
- 
--        if (item->acl_default) {
-+        if (r == 0 && item->acl_default)
-                 r = path_set_acl(path, ACL_TYPE_DEFAULT, item->acl_default, item->force);
--                if (r < 0)
--                        return r;
--        }
--#endif
- 
--        return 0;
-+        if (r > 0)
-+                return -r; /* already warned */
-+        else if (r == -ENOTSUP) {
-+                log_debug_errno(r, "ACLs not supported by file system at %s", path);
-+                return 0;
-+        } else if (r < 0)
-+                log_error_errno(r, "ACL operation on \"%s\" failed: %m", path);
-+#endif
-+        return r;
- }
- 
- static int write_one_file(Item *i, const char *path) {
--- 
-2.3.1
-
diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
deleted file mode 100644
index 41b9039..0000000
--- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 3dc731c1d270e2e143de621db9bd898299fd849d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:24:49 +0000
-Subject: [PATCH 10/11] Make root's home directory configurable
-
-OpenEmbedded has a configurable home directory for root. Allow
-systemd to be built using its idea of what root's home directory
-should be.
-
-Upstream-Status: Pending
-
-Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am                       | 2 ++
- configure.ac                      | 7 +++++++
- src/core/unit-printf.c            | 2 +-
- src/nspawn/nspawn.c               | 4 ++--
- src/shared/util.c                 | 4 ++--
- units/console-shell.service.m4.in | 4 ++--
- units/emergency.service.in        | 4 ++--
- units/rescue.service.in           | 4 ++--
- 8 files changed, 20 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0fb3f9f..4623963 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
- 	-DKEXEC=\"$(KEXEC)\" \
- 	-DLIBDIR=\"$(libdir)\" \
- 	-DROOTLIBDIR=\"$(rootlibdir)\" \
-+	-DROOTHOMEDIR=\"$(roothomedir)\" \
- 	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
- 	-I $(top_srcdir)/src \
- 	-I $(top_builddir)/src/shared \
-@@ -6342,6 +6343,7 @@ EXTRA_DIST += \
- substitutions = \
-        '|rootlibexecdir=$(rootlibexecdir)|' \
-        '|rootbindir=$(rootbindir)|' \
-+       '|roothomedir=$(roothomedir)|' \
-        '|bindir=$(bindir)|' \
-        '|SYSTEMCTL=$(rootbindir)/systemctl|' \
-        '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
-diff --git a/configure.ac b/configure.ac
-index a5b2e6e..55bb7d8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1428,6 +1428,11 @@ AC_ARG_WITH([rootlibdir],
-         [],
-         [with_rootlibdir=${libdir}])
- 
-+AC_ARG_WITH([roothomedir],
-+        AS_HELP_STRING([--with-roothomedir=DIR], [Home directory for the root user]),
-+        [],
-+        [with_roothomedir=/root])
-+
- AC_ARG_WITH([pamlibdir],
-         AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
-         [],
-@@ -1518,6 +1523,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
- AC_SUBST([pamconfdir], [$with_pamconfdir])
- AC_SUBST([rootprefix], [$with_rootprefix])
- AC_SUBST([rootlibdir], [$with_rootlibdir])
-+AC_SUBST([roothomedir], [$with_roothomedir])
- 
- AC_CONFIG_FILES([
-         Makefile po/Makefile.in
-@@ -1617,6 +1623,7 @@ AC_MSG_RESULT([
-         include_prefix:          ${INCLUDE_PREFIX}
-         lib dir:                 ${libdir}
-         rootlib dir:             ${with_rootlibdir}
-+        root home dir:           ${with_roothomedir}
-         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
-         Build Python:            ${PYTHON}
-diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
-index 97135db..14d12f1 100644
---- a/src/core/unit-printf.c
-+++ b/src/core/unit-printf.c
-@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
-                  * best of it if we can, but fail if we can't */
- 
-                 if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
--                        n = strdup("/root");
-+                        n = strdup(ROOTHOMEDIR);
-                 else
-                         return -ENOTSUP;
- 
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index b597edb..0b32673 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -4192,7 +4192,7 @@ int main(int argc, char *argv[]) {
-                         if (r < 0)
-                                 _exit(EXIT_FAILURE);
- 
--                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
-+                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
-                             (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
-                             (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
-                                 log_oom();
-@@ -4266,7 +4266,7 @@ int main(int argc, char *argv[]) {
-                                 execvp(argv[optind], argv + optind);
- #endif /* HAVE_EXECVPE */
-                         else {
--                                chdir(home ? home : "/root");
-+                                chdir(home ? home : ROOTHOMEDIR);
-                                 execle("/bin/bash", "-bash", NULL, env_use);
-                                 execle("/bin/sh", "-sh", NULL, env_use);
-                         }
-diff --git a/src/shared/util.c b/src/shared/util.c
-index cbbe3b1..a0e3cc5 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
-@@ -4609,7 +4609,7 @@ int get_user_creds(
-                         *gid = 0;
- 
-                 if (home)
--                        *home = "/root";
-+                        *home = ROOTHOMEDIR;
- 
-                 if (shell)
-                         *shell = "/bin/sh";
-@@ -5611,7 +5611,7 @@ int get_home_dir(char **_h) {
-         /* Hardcode home directory for root to avoid NSS */
-         u = getuid();
-         if (u == 0) {
--                h = strdup("/root");
-+                h = strdup(ROOTHOMEDIR);
-                 if (!h)
-                         return -ENOMEM;
- 
-diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
-index 5c80722..efde5f0 100644
---- a/units/console-shell.service.m4.in
-+++ b/units/console-shell.service.m4.in
-@@ -15,8 +15,8 @@ After=rc-local.service
- Before=getty.target
- 
- [Service]
--Environment=HOME=/root
--WorkingDirectory=/root
-+Environment=HOME=@roothomedir@
-+WorkingDirectory=@roothomedir@
- ExecStart=-@SULOGIN@
- ExecStopPost=-@SYSTEMCTL@ poweroff
- Type=idle
-diff --git a/units/emergency.service.in b/units/emergency.service.in
-index 2695d7b..7f47b73 100644
---- a/units/emergency.service.in
-+++ b/units/emergency.service.in
-@@ -14,8 +14,8 @@ Conflicts=rescue.service
- Before=shutdown.target
- 
- [Service]
--Environment=HOME=/root
--WorkingDirectory=/root
-+Environment=HOME=@roothomedir@
-+WorkingDirectory=@roothomedir@
- ExecStartPre=-/bin/plymouth quit
- ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
- ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
-diff --git a/units/rescue.service.in b/units/rescue.service.in
-index de73fee..47f3593 100644
---- a/units/rescue.service.in
-+++ b/units/rescue.service.in
-@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
- Before=shutdown.target
- 
- [Service]
--Environment=HOME=/root
--WorkingDirectory=/root
-+Environment=HOME=@roothomedir@
-+WorkingDirectory=@roothomedir@
- ExecStartPre=-/bin/plymouth quit
- ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
- ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
--- 
-2.1.4
-
diff --git a/meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch b/meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
deleted file mode 100644
index a49d626..0000000
--- a/meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 65eae3b76243d2dfd869f8c43b787575f7b4b994 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
-Date: Sun, 1 Mar 2015 21:13:10 -0300
-Subject: [PATCH] journal: fix Inappropriate ioctl for device on ext4
-
-Logs constantly show
-
-systemd-journald[395]: Failed to set file attributes: Inappropriate ioctl for device
-
-This is because ext4 does not support FS_NOCOW_FL.
-
-[zj: fold into one conditional as suggested on the ML and
-     fix (preexisting) r/errno confusion in error message.]
-
-Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
----
- src/journal/journal-file.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
-index 9c9a548..0e33a0f 100644
---- a/src/journal/journal-file.c
-+++ b/src/journal/journal-file.c
-@@ -2609,8 +2609,8 @@ int journal_file_open(
-                  * shouldn't be too bad, given that we do our own
-                  * checksumming). */
-                 r = chattr_fd(f->fd, true, FS_NOCOW_FL);
--                if (r < 0)
--                        log_warning_errno(errno, "Failed to set file attributes: %m");
-+                if (r < 0 && r != -ENOTTY)
-+                        log_warning_errno(r, "Failed to set file attributes: %m");
- 
-                 /* Let's attach the creation time to the journal file,
-                  * so that the vacuuming code knows the age of this
--- 
-1.9.3
-
-- 
2.1.0


