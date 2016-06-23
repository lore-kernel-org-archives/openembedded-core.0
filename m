Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 467C073197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:16:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N8GUMT006300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 01:16:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 23 Jun 2016 01:16:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 16:16:29 +0800
Message-ID: <888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466669684.git.Qi.Chen@windriver.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] systemd: upgrade to 230
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
X-List-Received-Date: Thu, 23 Jun 2016 08:16:31 -0000
Content-Type: text/plain

Patches are rebased or removed for the latest version.

'python' is added to RDEPENDS of systemd-ptest.

systemd-bootchart is now seprated from systemd, thus removing the
related configuration items.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc              |   4 +-
 .../systemd/0003-define-exp10-if-missing.patch     |  15 ++-
 ...4-Make-root-s-home-directory-configurable.patch |  62 +++++------
 ...0015-systemd-user-avoid-using-system-auth.patch |  13 +--
 ...-remove-userspace-firmware-loading-suppor.patch |  68 +++++-------
 .../systemd/0018-make-test-dir-configurable.patch  |  32 +++---
 ...ild-sys-fix-build-with-libgrcypt-disabled.patch | 122 ---------------------
 .../systemd/{systemd_229.bb => systemd_230.bb}     |   5 +-
 8 files changed, 90 insertions(+), 231 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch
 rename meta/recipes-core/systemd/{systemd_229.bb => systemd_230.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8247130..f800f42 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,11 +14,11 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "714c62b46379abb7558c544665522aca91691e10"
+SRCREV = "3a74d4fc90cb322a4784a3515bef7118c8f8c5ba"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
 
-PV = "229+git${SRCPV}"
+PV = "230+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
index f183261..e62d580 100644
--- a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
+++ b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
@@ -1,6 +1,3 @@
-From 699893a05edac5194f9670529bacfaeb67252edb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2015 00:42:49 +0000
 Subject: [PATCH 03/36] define exp10 if missing
 
 Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
@@ -11,23 +8,25 @@ Upstream-Status: Pending
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/basic/missing.h | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index f3d3236..ee7e7ea 100644
+index 651e414..fafa233 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -1169,3 +1169,8 @@ static inline key_serial_t request_key(const char *type, const char *description
- #endif
+@@ -1013,4 +1013,9 @@ typedef int32_t key_serial_t;
  
  #endif
-+
+ 
 +#ifdef __UCLIBC__
 +/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
 +#define exp10(x) (exp((x) * log(10)))
 +#endif /* __UCLIBC__ */
++
+ #include "missing_syscall.h"
 -- 
-1.8.3.1
+2.8.3
 
diff --git a/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
index 4a576aa..2eea0ff 100644
--- a/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
@@ -1,6 +1,3 @@
-From 786883cfa13e21f060ee6da6cabb94845f4349a0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2015 05:18:20 +0000
 Subject: [PATCH 14/36] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
@@ -14,6 +11,7 @@ https://github.com/systemd/systemd/issues/541
 
 Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile.am                       | 2 ++
  configure.ac                      | 7 +++++++
@@ -26,10 +24,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 20 insertions(+), 11 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index b3f3343..a99e8eb 100644
+index 305099a..88c1250 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -202,6 +202,7 @@ AM_CPPFLAGS = \
+@@ -206,6 +206,7 @@ AM_CPPFLAGS = \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
@@ -37,7 +35,7 @@ index b3f3343..a99e8eb 100644
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/basic \
-@@ -5713,6 +5714,7 @@ EXTRA_DIST += \
+@@ -5863,6 +5864,7 @@ EXTRA_DIST += \
  substitutions = \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -46,10 +44,10 @@ index b3f3343..a99e8eb 100644
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
 diff --git a/configure.ac b/configure.ac
-index c5ab9d0..16c83bb 100644
+index 329861a..01764f5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1470,6 +1470,11 @@ AC_ARG_WITH([rootlibdir],
+@@ -1478,6 +1478,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
  AX_NORMALIZE_PATH([with_rootlibdir])
  
@@ -61,7 +59,7 @@ index c5ab9d0..16c83bb 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1553,6 +1558,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1562,6 +1567,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
@@ -69,19 +67,19 @@ index c5ab9d0..16c83bb 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1643,6 +1649,7 @@ AC_MSG_RESULT([
-         includedir:              ${includedir}
-         lib dir:                 ${libdir}
-         rootlib dir:             ${with_rootlibdir}
-+        root home dir:           ${with_roothomedir}
-         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
-         Build Python:            ${PYTHON}
+@@ -1653,6 +1659,7 @@ AC_MSG_RESULT([
+         includedir:                        ${includedir}
+         lib dir:                           ${libdir}
+         rootlib dir:                       ${with_rootlibdir}
++        root home dir:                     ${with_roothomedir}
+         SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
+         SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
+         Build Python:                      ${PYTHON}
 diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index 19155bc..55672b3 100644
+index f65ca3e..da1101a 100644
 --- a/src/basic/user-util.c
 +++ b/src/basic/user-util.c
-@@ -122,7 +122,7 @@ int get_user_creds(
+@@ -123,7 +123,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -90,7 +88,7 @@ index 19155bc..55672b3 100644
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -353,7 +353,7 @@ int get_home_dir(char **_h) {
+@@ -354,7 +354,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -100,10 +98,10 @@ index 19155bc..55672b3 100644
                          return -ENOMEM;
  
 diff --git a/src/core/namespace.c b/src/core/namespace.c
-index b573f00..0f70b14 100644
+index 203d122..45c0d11 100644
 --- a/src/core/namespace.c
 +++ b/src/core/namespace.c
-@@ -409,7 +409,7 @@ int setup_namespace(
+@@ -415,7 +415,7 @@ int setup_namespace(
                          home_dir = strjoina("-", home_dir);
                          run_user_dir = prefix_roota(root_directory, "/run/user");
                          run_user_dir = strjoina("-", run_user_dir);
@@ -113,24 +111,24 @@ index b573f00..0f70b14 100644
  
                          r = append_mounts(&m, STRV_MAKE(home_dir, run_user_dir, root_dir),
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 65e65ec..12f0ee8 100644
+index 8ec0584..51df00b 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2564,7 +2564,7 @@ static int inner_child(
+@@ -2739,7 +2739,7 @@ static int inner_child(
          if (envp[n_env])
-                 n_env ++;
+                 n_env++;
  
 -        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
 +        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
              (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
              (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
                  return log_oom();
-@@ -2647,7 +2647,7 @@ static int inner_child(
- #endif /* HAVE_EXECVPE */
+@@ -2816,7 +2816,7 @@ static int inner_child(
          else {
                  if (!arg_chdir)
--                        chdir(home ?: "/root");
-+                        chdir(home ?: ROOTHOMEDIR);
+                         /* If we cannot change the directory, we'll end up in /, that is expected. */
+-                        (void) chdir(home ?: "/root");
++                        (void) chdir(home ?: ROOTHOMEDIR);
  
                  execle("/bin/bash", "-bash", NULL, env_use);
                  execle("/bin/sh", "-sh", NULL, env_use);
@@ -150,10 +148,10 @@ index a345ec2..3caae7d 100644
  ExecStopPost=-@SYSTEMCTL@ poweroff
  Type=idle
 diff --git a/units/emergency.service.in b/units/emergency.service.in
-index fb390ea..5623a57 100644
+index 0de16f2..4826062 100644
 --- a/units/emergency.service.in
 +++ b/units/emergency.service.in
-@@ -14,8 +14,8 @@ Conflicts=rescue.service
+@@ -15,8 +15,8 @@ Conflicts=syslog.socket
  Before=shutdown.target
  
  [Service]
@@ -180,5 +178,5 @@ index 92553f6..590ae17 100644
  ExecStartPre=-/bin/echo -e 'Welcome to rescue mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
 -- 
-1.8.3.1
+2.8.3
 
diff --git a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
index a351237..f7a5b19 100644
--- a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
@@ -1,6 +1,3 @@
-From f70a1a9605cd3adac450c49a5a69da6e9acda517 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:26:25 +0000
 Subject: [PATCH 15/36] systemd-user: avoid using system-auth
 
 In OE, we don't provide system-auth, instead, we use common-* files.
@@ -10,15 +7,16 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/login/systemd-user.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/login/systemd-user.m4 b/src/login/systemd-user.m4
-index 7933508..16b73d2 100644
+index f188a8e..862d8d7 100644
 --- a/src/login/systemd-user.m4
 +++ b/src/login/systemd-user.m4
-@@ -2,10 +2,10 @@
+@@ -2,11 +2,11 @@
  #
  # Used by systemd --user instances.
  
@@ -29,8 +27,9 @@ index 7933508..16b73d2 100644
  session  required pam_selinux.so close
  session  required pam_selinux.so nottys open
  )m4_dnl
+ session  required pam_loginuid.so
 -session  include system-auth
-+session  include common-session
++session  include common-account
 -- 
-1.8.3.1
+2.8.3
 
diff --git a/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 8e6289d..642625f 100644
--- a/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,6 +1,3 @@
-From 9a3a4e16b36e762291cd1574ec71d7954f8b5363 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2015 05:33:32 +0000
 Subject: [PATCH 17/36] Revert "udev: remove userspace firmware loading
  support"
 
@@ -13,21 +10,21 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am                      |  12 +++
- README                           |   6 +-
+ README                           |   4 +-
  TODO                             |   1 +
  configure.ac                     |  22 ++++++
  src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
  src/udev/udev-builtin.c          |   3 +
  src/udev/udev.h                  |   6 ++
  src/udev/udevd.c                 |  13 ++++
- 8 files changed, 214 insertions(+), 3 deletions(-)
+ 8 files changed, 213 insertions(+), 2 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
 diff --git a/Makefile.am b/Makefile.am
-index a99e8eb..b5c6ba7 100644
+index 305099a..e774976 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3573,6 +3573,18 @@ libudev_core_la_LIBADD = \
+@@ -3706,6 +3706,18 @@ libudev_core_la_LIBADD = \
  	$(BLKID_LIBS) \
  	$(KMOD_LIBS)
  
@@ -47,17 +44,10 @@ index a99e8eb..b5c6ba7 100644
  libudev_core_la_SOURCES += \
  	src/udev/udev-builtin-kmod.c
 diff --git a/README b/README
-index 41fb07a..10230ac 100644
+index ca8993c..87f3297 100644
 --- a/README
 +++ b/README
-@@ -50,14 +50,14 @@ REQUIREMENTS:
-           CONFIG_PROC_FS
-           CONFIG_FHANDLE (libudev, mount and bind mount handling)
- 
--        udev will fail to work with the legacy sysfs layout:
-+        Udev will fail to work with the legacy layout:
-           CONFIG_SYSFS_DEPRECATED=n
- 
+@@ -56,8 +56,8 @@ REQUIREMENTS:
          Legacy hotplug slows down the system and confuses udev:
            CONFIG_UEVENT_HELPER_PATH=""
  
@@ -69,11 +59,11 @@ index 41fb07a..10230ac 100644
  
          Some udev rules and virtualization detection relies on it:
 diff --git a/TODO b/TODO
-index 92cc8cc..25f6849 100644
+index fac9ccf..2645582 100644
 --- a/TODO
 +++ b/TODO
-@@ -628,6 +628,7 @@ Features:
- * rename "userspace" to "core-os"
+@@ -642,6 +642,7 @@ Features:
+ * initialize the hostname from the fs label of /, if /etc/hostname does not exist?
  
  * udev:
 +  - remove src/udev/udev-builtin-firmware.c (CONFIG_FW_LOADER_USER_HELPER=n)
@@ -81,10 +71,10 @@ index 92cc8cc..25f6849 100644
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
 diff --git a/configure.ac b/configure.ac
-index 16c83bb..36d20b5 100644
+index 329861a..af85405 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1353,6 +1353,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
+@@ -1361,6 +1361,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
  AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
  
  # ------------------------------------------------------------------------------
@@ -103,23 +93,23 @@ index 16c83bb..36d20b5 100644
 +done
 +IFS=$OLD_IFS
 +AC_SUBST(FIRMWARE_PATH)
-+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
++AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is availabe]) ])
 +AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
 +
 +# ------------------------------------------------------------------------------
  have_manpages=no
  AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable manpages]))
  AC_PATH_PROG([XSLTPROC], [xsltproc])
-@@ -1653,6 +1672,9 @@ AC_MSG_RESULT([
-         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
-         Build Python:            ${PYTHON}
-+        Installation Python:     ${PYTHON_BINARY}
-+        sphinx binary:           ${SPHINX_BUILD}
-+        firmware path:           ${FIRMWARE_PATH}
-         PAM modules dir:         ${with_pamlibdir}
-         PAM configuration dir:   ${with_pamconfdir}
-         D-Bus policy dir:        ${with_dbuspolicydir}
+@@ -1656,6 +1675,9 @@ AC_MSG_RESULT([
+         SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
+         SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
+         Build Python:                      ${PYTHON}
++        Installation Python:               ${PYTHON_BINARY}
++        sphinx binary:                     ${SPHINX_BUILD}
++        firmware path:                     ${FIRMWARE_PATH}
+         PAM modules dir:                   ${with_pamlibdir}
+         PAM configuration dir:             ${with_pamconfdir}
+         D-Bus policy dir:                  ${with_dbuspolicydir}
 diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
 new file mode 100644
 index 0000000..bd8c2fb
@@ -295,10 +285,10 @@ index e6b36f1..cd9947e 100644
          [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
          [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
 diff --git a/src/udev/udev.h b/src/udev/udev.h
-index 1f9c812..fa35a88 100644
+index 8433e8d..d32366d 100644
 --- a/src/udev/udev.h
 +++ b/src/udev/udev.h
-@@ -147,6 +147,9 @@ enum udev_builtin_cmd {
+@@ -148,6 +148,9 @@ enum udev_builtin_cmd {
          UDEV_BUILTIN_BLKID,
  #endif
          UDEV_BUILTIN_BTRFS,
@@ -308,7 +298,7 @@ index 1f9c812..fa35a88 100644
          UDEV_BUILTIN_HWDB,
          UDEV_BUILTIN_INPUT_ID,
          UDEV_BUILTIN_KEYBOARD,
-@@ -175,6 +178,9 @@ struct udev_builtin {
+@@ -176,6 +179,9 @@ struct udev_builtin {
  extern const struct udev_builtin udev_builtin_blkid;
  #endif
  extern const struct udev_builtin udev_builtin_btrfs;
@@ -319,7 +309,7 @@ index 1f9c812..fa35a88 100644
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index bb92f16..84024ac 100644
+index e9dd2f4..0abc28e 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
 @@ -125,6 +125,9 @@ struct event {
@@ -332,7 +322,7 @@ index bb92f16..84024ac 100644
  };
  
  static inline struct event *node_to_event(struct udev_list_node *node) {
-@@ -613,6 +616,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
+@@ -614,6 +617,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
          event->devnum = udev_device_get_devnum(dev);
          event->is_block = streq("block", udev_device_get_subsystem(dev));
          event->ifindex = udev_device_get_ifindex(dev);
@@ -343,7 +333,7 @@ index bb92f16..84024ac 100644
  
          log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
               udev_device_get_action(dev), udev_device_get_subsystem(dev));
-@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
+@@ -699,6 +706,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
                          return true;
                  }
  
@@ -357,5 +347,5 @@ index bb92f16..84024ac 100644
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
 -- 
-1.8.3.1
+2.8.3
 
diff --git a/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch b/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
index 5f3f2e8..5d13e4a 100644
--- a/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
@@ -1,6 +1,3 @@
-From 569cd3cf9806a02226d26c4104dbe44262f93d33 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Fri, 22 Jan 2016 16:44:11 +0800
 Subject: [PATCH 18/36] make test dir configurable
 
 Upstream-Status: Pending
@@ -9,16 +6,17 @@ test maybe be run on target in cross-compile environment, and test dir
 is not the compilation dir, so make it configurable
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  Makefile.am  | 2 +-
  configure.ac | 7 +++++++
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index b5c6ba7..d3cd961 100644
+index a94636a..dbd3386 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -203,7 +203,7 @@ AM_CPPFLAGS = \
+@@ -207,7 +207,7 @@ AM_CPPFLAGS = \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
  	-DROOTHOMEDIR=\"$(roothomedir)\" \
@@ -28,10 +26,10 @@ index b5c6ba7..d3cd961 100644
  	-I $(top_builddir)/src/basic \
  	-I $(top_srcdir)/src/basic \
 diff --git a/configure.ac b/configure.ac
-index 36d20b5..d96dc5a 100644
+index 45aae8a..c53fae2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1494,6 +1494,11 @@ AC_ARG_WITH([roothomedir],
+@@ -1518,6 +1518,11 @@ AC_ARG_WITH([roothomedir],
          [],
          [with_roothomedir=/root])
  
@@ -43,7 +41,7 @@ index 36d20b5..d96dc5a 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1578,6 +1583,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
+@@ -1603,6 +1608,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
  AC_SUBST([roothomedir], [$with_roothomedir])
@@ -51,14 +49,14 @@ index 36d20b5..d96dc5a 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1669,6 +1675,7 @@ AC_MSG_RESULT([
-         lib dir:                 ${libdir}
-         rootlib dir:             ${with_rootlibdir}
-         root home dir:           ${with_roothomedir}
-+        test dir:                ${with_testdir}
-         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
-         Build Python:            ${PYTHON}
+@@ -1695,6 +1701,7 @@ AC_MSG_RESULT([
+         lib dir:                           ${libdir}
+         rootlib dir:                       ${with_rootlibdir}
+         root home dir:                     ${with_roothomedir}
++        test dir:                          ${with_testdir}
+         SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
+         SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
+         Build Python:                      ${PYTHON}
 -- 
-1.8.3.1
+2.8.3
 
diff --git a/meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch b/meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch
deleted file mode 100644
index 1ae3d66..0000000
--- a/meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From b68f10bf1f7519e012da5e35fab3a57da7dc46d4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Sun, 27 Mar 2016 17:33:54 -0400
-Subject: [PATCH] build-sys: fix build with libgrcypt disabled
-
-- Move gcrypt.h include inside grcrypt-util.h.
-- Allow gcrypt-util.[ch] to be compiled even without gcrypt.
-This allows the logic in files using gcrypt to be simplified.
-
-- Fix compilation of systemd-resolve without gcrypt.
-systemd-resolved already supported that.
-
-Upstream-Status: Backport [ https://github.com/systemd/systemd/pull/2905 ]
-
-Fixes [YOCTO #9219]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- Makefile.am                |  8 ++++----
- src/resolve/resolve-tool.c |  3 +--
- src/shared/gcrypt-util.c   |  4 +++-
- src/shared/gcrypt-util.h   | 14 ++++++++++++++
- 4 files changed, 22 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 2b72a53..95eaa9a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4262,7 +4262,9 @@ libsystemd_journal_internal_la_SOURCES = \
- 	src/journal/mmap-cache.h \
- 	src/journal/compress.c \
- 	src/journal/audit-type.h \
--	src/journal/audit-type.c
-+	src/journal/audit-type.c \
-+	src/shared/gcrypt-util.h \
-+	src/shared/gcrypt-util.c
- 
- nodist_libsystemd_journal_internal_la_SOURCES = \
- 	src/journal/audit_type-to-name.h
-@@ -4294,9 +4296,7 @@ libsystemd_journal_internal_la_SOURCES += \
- 	src/journal/journal-authenticate.c \
- 	src/journal/journal-authenticate.h \
- 	src/journal/fsprg.c \
--	src/journal/fsprg.h \
--	src/shared/gcrypt-util.c \
--	src/shared/gcrypt-util.h
-+	src/journal/fsprg.h
- 
- libsystemd_journal_internal_la_LIBADD += \
- 	$(GCRYPT_LIBS)
-diff --git a/src/resolve/resolve-tool.c b/src/resolve/resolve-tool.c
-index 009cc73..14ee01c 100644
---- a/src/resolve/resolve-tool.c
-+++ b/src/resolve/resolve-tool.c
-@@ -17,7 +17,6 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
--#include <gcrypt.h>
- #include <getopt.h>
- #include <net/if.h>
- 
-@@ -863,7 +862,7 @@ static int resolve_openpgp(sd_bus *bus, const char *address) {
-         }
-         domain++;
- 
--        r = string_hashsum(address, domain - 1 - address, GCRY_MD_SHA224, &hashed);
-+        r = string_hashsum_sha224(address, domain - 1 - address, &hashed);
-         if (r < 0)
-                 return log_error_errno(r, "Hashing failed: %m");
- 
-diff --git a/src/shared/gcrypt-util.c b/src/shared/gcrypt-util.c
-index 4ff9452..39b544b 100644
---- a/src/shared/gcrypt-util.c
-+++ b/src/shared/gcrypt-util.c
-@@ -19,10 +19,11 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
-+#ifdef HAVE_GCRYPT
- #include <gcrypt.h>
- 
--#include "hexdecoct.h"
- #include "gcrypt-util.h"
-+#include "hexdecoct.h"
- 
- void initialize_libgcrypt(bool secmem) {
-         const char *p;
-@@ -67,3 +68,4 @@ int string_hashsum(const char *s, size_t len, int md_algorithm, char **out) {
-         *out = enc;
-         return 0;
- }
-+#endif
-diff --git a/src/shared/gcrypt-util.h b/src/shared/gcrypt-util.h
-index c7652c2..cf33b3c 100644
---- a/src/shared/gcrypt-util.h
-+++ b/src/shared/gcrypt-util.h
-@@ -19,7 +19,21 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
-+#include <errno.h>
- #include <stdbool.h>
-+#include <stddef.h>
-+
-+#ifdef HAVE_GCRYPT
-+#include <gcrypt.h>
- 
- void initialize_libgcrypt(bool secmem);
- int string_hashsum(const char *s, size_t len, int md_algorithm, char **out);
-+#endif
-+
-+static inline int string_hashsum_sha224(const char *s, size_t len, char **out) {
-+#ifdef HAVE_GCRYPT
-+        return string_hashsum(s, len, GCRY_MD_SHA224, out);
-+#else
-+        return -EOPNOTSUPP;
-+#endif
-+}
--- 
-2.4.0
-
diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_230.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_229.bb
rename to meta/recipes-core/systemd/systemd_230.bb
index 4b726f3..9afdfa8 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -35,7 +35,6 @@ SRC_URI += " \
            file://0020-check-for-uchar.h-in-configure.patch \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
-           file://0023-build-sys-fix-build-with-libgrcypt-disabled.patch \
            file://udev-re-enable-mount-propagation-for-udevd.patch \
 "
 SRC_URI_append_libc-uclibc = "\
@@ -57,7 +56,6 @@ PACKAGECONFIG ??= "xz \
                    machined \
                    backlight \
                    quotacheck \
-                   bootchart \
                    hostnamed \
                    ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers', '', d)} \
                    hibernate \
@@ -91,7 +89,6 @@ PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
 PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"
 PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
-PACKAGECONFIG[bootchart] = "--enable-bootchart,--disable-bootchart"
 PACKAGECONFIG[hostnamed] = "--enable-hostnamed,--disable-hostnamed"
 PACKAGECONFIG[myhostname] = "--enable-myhostname,--disable-myhostname"
 PACKAGECONFIG[rfkill] = "--enable-rfkill,--disable-rfkill"
@@ -314,7 +311,7 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-RDEPENDS_${PN}-ptest += "gawk make perl bash xz \
+RDEPENDS_${PN}-ptest += "gawk make perl bash xz python\
                          tzdata tzdata-americas tzdata-asia \
                          tzdata-europe tzdata-africa tzdata-antarctica \
                          tzdata-arctic tzdata-atlantic tzdata-australia \
-- 
1.9.1


