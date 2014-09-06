Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3A855713CF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 03:26:40 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id z60so12627899qgd.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 20:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=BVquDn7Ui7+Xpc00ATM1vp/DWgc9O8NNhaLONF1Pd/4=;
	b=TbG0fdskZ1Xwik6/na92sRqlD0J7+jnjwvJMQm/NEo1BwQJJBWGVO+MYMl0Z/cxApd
	HuuEuWKoYsaxHLtyG08rGpj3PL7UceD+1sVvf+UElcSb3qnY9CdU9Va9/2YrUfXWktgT
	V3gMF7L/5Zl9O99v7n/Ffh88Nf378goJhII5sGZK9cBADT3Q2BqfXCi+Nnobx6LQ+aSz
	r2Iys4pzOpDhNBJPBIOuj8mPXeVF2qrHBCOfYIVmCa0lT6D1Q60O4Rr5gQjoLvI+yUXP
	3liNSyRf/0gOgmz/jz+9jzIHozccKAQMzq3la9cRzYqukSywvbRY0MygdMIgoxHe8wE0
	jJig==
MIME-Version: 1.0
X-Received: by 10.224.103.65 with SMTP id j1mr24971314qao.17.1409974001001;
	Fri, 05 Sep 2014 20:26:41 -0700 (PDT)
Received: by 10.96.147.37 with HTTP; Fri, 5 Sep 2014 20:26:40 -0700 (PDT)
Date: Fri, 5 Sep 2014 21:26:40 -0600
Message-ID: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Sat, 06 Sep 2014 03:26:47 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

systemd avoids using nss lookups for the root user, so
naturally it assumes that root's home directory is /root.
In OE that's not the case, and it can lead to long delays when
shutting down due to user shutdown unit failures.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...1-Make-root-s-home-directory-configurable.patch | 176 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |   3 +-
 2 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644
meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
new file mode 100644
index 0000000..3bed8fe
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
@@ -0,0 +1,176 @@
+From 00138d820fc0dfce6e5fee03d1edda66db34aa80 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Fri, 5 Sep 2014 06:28:58 -0600
+Subject: [PATCH] Make root's home directory configurable.
+
+OpenEmbedded has a configurable home directory for root. Allow
+systemd to be built using its idea of what root's home directory
+should be.
+---
+ Makefile.am                       | 2 ++
+ configure.ac                      | 7 +++++++
+ src/core/unit-printf.c            | 2 +-
+ src/nspawn/nspawn.c               | 4 ++--
+ src/shared/util.c                 | 4 ++--
+ units/console-shell.service.m4.in | 4 ++--
+ units/emergency.service.in        | 4 ++--
+ units/rescue.service.m4.in        | 4 ++--
+ 8 files changed, 20 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4028112..5d18f5c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -191,6 +191,7 @@ AM_CPPFLAGS = \
+ -DKEXEC=\"$(KEXEC)\" \
+ -DLIBDIR=\"$(libdir)\" \
+ -DROOTLIBDIR=\"$(rootlibdir)\" \
++ -DROOTHOMEDIR=\"$(roothomedir)\" \
+ -DTEST_DIR=\"$(abs_top_srcdir)/test\" \
+ -I $(top_srcdir)/src \
+ -I $(top_builddir)/src/shared \
+@@ -5584,6 +5585,7 @@ EXTRA_DIST += \
+ substitutions = \
+        '|rootlibexecdir=$(rootlibexecdir)|' \
+        '|rootbindir=$(rootbindir)|' \
++       '|roothomedir=$(roothomedir)|' \
+        '|bindir=$(bindir)|' \
+        '|SYSTEMCTL=$(rootbindir)/systemctl|' \
+        '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
+diff --git a/configure.ac b/configure.ac
+index 18b7198..365bc73 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1272,6 +1272,11 @@ AC_ARG_WITH([rootlibdir],
+         [],
+         [with_rootlibdir=${libdir}])
+
++AC_ARG_WITH([roothomedir],
++        AS_HELP_STRING([--with-roothomedir=DIR], [Home directory for
the root user]),
++        [],
++        [with_roothomedir=/root])
++
+ AC_ARG_WITH([pamlibdir],
+         AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
+         [],
+@@ -1317,6 +1322,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+ AC_SUBST([pamconfdir], [$with_pamconfdir])
+ AC_SUBST([rootprefix], [$with_rootprefix])
+ AC_SUBST([rootlibdir], [$with_rootlibdir])
++AC_SUBST([roothomedir], [$with_roothomedir])
+
+ AC_CONFIG_FILES([
+         Makefile po/Makefile.in
+@@ -1400,6 +1406,7 @@ AC_MSG_RESULT([
+         include_prefix:          ${INCLUDE_PREFIX}
+         lib dir:                 ${libdir}
+         rootlib dir:             ${with_rootlibdir}
++        root home dir:           ${with_roothomedir}
+         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
+         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
+         Build Python:            ${PYTHON}
+diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
+index 62599d0..852d34c 100644
+--- a/src/core/unit-printf.c
++++ b/src/core/unit-printf.c
+@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier,
void *data, void *userdata, char
+                  * best of it if we can, but fail if we can't */
+
+                 if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
+-                        n = strdup("/root");
++                        n = strdup(ROOTHOMEDIR);
+                 else
+                         return -ENOTSUP;
+
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index d01da45..3e876d5 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -3312,7 +3312,7 @@ int main(int argc, char *argv[]) {
+                         if (r < 0)
+                                 _exit(EXIT_FAILURE);
+
+-                        if ((asprintf((char**)(envp + n_env++),
"HOME=%s", home ? home: "/root") < 0) ||
++                        if ((asprintf((char**)(envp + n_env++),
"HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
+                             (asprintf((char**)(envp + n_env++),
"USER=%s", arg_user ? arg_user : "root") < 0) ||
+                             (asprintf((char**)(envp + n_env++),
"LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
+                                 log_oom();
+@@ -3402,7 +3402,7 @@ int main(int argc, char *argv[]) {
+                         } else if (argc > optind)
+                                 execvpe(argv[optind], argv + optind, env_use);
+                         else {
+-                                chdir(home ? home : "/root");
++                                chdir(home ? home : ROOTHOMEDIR);
+                                 execle("/bin/bash", "-bash", NULL, env_use);
+                                 execle("/bin/sh", "-sh", NULL, env_use);
+                         }
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 85a570a..aef6033 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -4377,7 +4377,7 @@ int get_user_creds(
+                         *gid = 0;
+
+                 if (home)
+-                        *home = "/root";
++                        *home = ROOTHOMEDIR;
+
+                 if (shell)
+                         *shell = "/bin/sh";
+@@ -5363,7 +5363,7 @@ int get_home_dir(char **_h) {
+         /* Hardcode home directory for root to avoid NSS */
+         u = getuid();
+         if (u == 0) {
+-                h = strdup("/root");
++                h = strdup(ROOTHOMEDIR);
+                 if (!h)
+                         return -ENOMEM;
+
+diff --git a/units/console-shell.service.m4.in
b/units/console-shell.service.m4.in
+index 3f4904a..e2af652 100644
+--- a/units/console-shell.service.m4.in
++++ b/units/console-shell.service.m4.in
+@@ -15,8 +15,8 @@ After=rc-local.service
+ Before=getty.target
+
+ [Service]
+-Environment=HOME=/root
+-WorkingDirectory=/root
++Environment=HOME=@roothomedir@
++WorkingDirectory=@roothomedir@
+ ExecStart=-/sbin/sulogin
+ ExecStopPost=-@SYSTEMCTL@ poweroff
+ Type=idle
+diff --git a/units/emergency.service.in b/units/emergency.service.in
+index 91fc1bb..659547e 100644
+--- a/units/emergency.service.in
++++ b/units/emergency.service.in
+@@ -13,8 +13,8 @@ Conflicts=shutdown.target
+ Before=shutdown.target
+
+ [Service]
+-Environment=HOME=/root
+-WorkingDirectory=/root
++Environment=HOME=@roothomedir@
++WorkingDirectory=@roothomedir@
+ ExecStartPre=-/bin/plymouth quit
+ ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging
in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to
reboot, "systemctl default" to try again\\nto boot into default mode.'
+ ExecStart=-/bin/sh -c "/sbin/sulogin; @SYSTEMCTL@ --fail --no-block default"
+diff --git a/units/rescue.service.m4.in b/units/rescue.service.m4.in
+index ef54369..7aad86f 100644
+--- a/units/rescue.service.m4.in
++++ b/units/rescue.service.m4.in
+@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
+ Before=shutdown.target
+
+ [Service]
+-Environment=HOME=/root
+-WorkingDirectory=/root
++Environment=HOME=@roothomedir@
++WorkingDirectory=@roothomedir@
+ ExecStartPre=-/bin/plymouth quit
+ ExecStartPre=-/bin/echo -e 'Welcome to rescue mode! Type "systemctl
default" or ^D to enter default mode.\\nType "journalctl -xb" to view
system logs. Type "systemctl reboot" to reboot.'
+ ExecStart=-/bin/sh -c "/sbin/sulogin; @SYSTEMCTL@ --fail --no-block default"
+--
+1.9.3
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb
b/meta/recipes-core/systemd/systemd_216.bb
index a7fd71e..ddffdf4 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -32,6 +32,7 @@ SRC_URI =
"git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://uclibc-get-physmem.patch \
            file://0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
\
            file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
+           file://0001-Make-root-s-home-directory-configurable.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
@@ -71,6 +72,7 @@ rootlibexecdir = "${rootprefix}/lib"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
+                 --with-roothomedir=${ROOT_HOME} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
'--enable-pam', '--disable-pam', d)} \
                  --disable-manpages \
                  --disable-coredump \
@@ -96,7 +98,6 @@ do_configure_prepend() {
  else
  cp -r ${S}/units ${S}/units.pre_sed
  fi
- sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
  sed -i '/ln --relative --help/d' ${S}/configure.ac
  sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
  sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
-- 
1.9.3

