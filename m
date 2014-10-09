Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 486B36FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 17:01:21 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id r5so557678qcx.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=W6hlZ6TOEOELxdMaYrcxe9Ubu2/dZcdsWB32qCkX+/Q=;
	b=ee3Denu0Z687fi97jPvUbMRK6R2XmSoQMnkyAIThFyJeykMGYp4SCoceEdyaFYr6+P
	s5WXJmrA/ZyArvnXL1samVrqXjbt+OgYnLov2yyw1uFVU1HzobDv2r/7UtUheFZp0ObX
	c1cdcnLpyxQAQM1nHcqr8L1zlH8JqYI3M0Lu/cytv7Qq95gJplx1+//LyT/3IUETTdoG
	XlufjUEbzVktuIH+Ey2piN1ZlNuinT8nhaA4GYyzKA6zONkEEFqyMY3N5aWvCyZvQCPW
	rSJQ8q8zmYs7K6zGtedJ3G+aE5MPbTDvRZyVVw9b/KID1twCn9vtzOudh2rsxqfCbiPa
	hJgg==
MIME-Version: 1.0
X-Received: by 10.224.47.134 with SMTP id n6mr25859785qaf.15.1412874082831;
	Thu, 09 Oct 2014 10:01:22 -0700 (PDT)
Received: by 10.96.3.67 with HTTP; Thu, 9 Oct 2014 10:01:22 -0700 (PDT)
In-Reply-To: <CACS+7ZTreU8-5jVr7SfBMP3Ogr9Q6XYd2TgQA=7-Tepf6z0PDw@mail.gmail.com>
References: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
	<CAJTo0LZDeTCp7E3ZMX6To6Ox-bOLS625d_T2QBjjuQ+RZ7==dw@mail.gmail.com>
	<CAJTo0LaP2Zu7z8Dp_1uCzkdLuBS_TgZ0xn0CXg5QtNTt3ZCAbw@mail.gmail.com>
	<CACS+7ZTreU8-5jVr7SfBMP3Ogr9Q6XYd2TgQA=7-Tepf6z0PDw@mail.gmail.com>
Date: Thu, 9 Oct 2014 11:01:22 -0600
Message-ID: <CACS+7ZTB1y0NgLc0x0nrjK40yiE=tg7FPoq7mD5PVKbJ4Ld3eg@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Oct 2014 17:01:23 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

systemd avoids using nss lookups for the root user, so
naturally it assumes that root's home directory is /root.
In OE that's not the case, and it can lead to long delays when
shutting down due to user shutdown unit failures.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...1-Make-root-s-home-directory-configurable.patch | 180 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |   3 +-
 2 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644
meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
new file mode 100644
index 0000000..c5ad291
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
@@ -0,0 +1,180 @@
+From 4dc8dee0435bb63cbe474004b0a8df0363fe94dd Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Fri, 5 Sep 2014 06:28:58 -0600
+Subject: [PATCH] Make root's home directory configurable.
+
+OpenEmbedded has a configurable home directory for root. Allow
+systemd to be built using its idea of what root's home directory
+should be.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
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
index ebf9395..598d45e 100644
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
@@ -74,6 +75,7 @@ rootlibexecdir = "${rootprefix}/lib"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
+                 --with-roothomedir=${ROOT_HOME} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
'--enable-pam', '--disable-pam', d)} \
                  --disable-manpages \
                  --disable-coredump \
@@ -99,7 +101,6 @@ do_configure_prepend() {
  else
  cp -r ${S}/units ${S}/units.pre_sed
  fi
- sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
  sed -i '/ln --relative --help/d' ${S}/configure.ac
  sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
  sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
-- 
2.1.0

