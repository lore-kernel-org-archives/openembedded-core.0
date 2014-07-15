Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1142570292
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954775"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:33 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:50 +0300
Message-Id: <1405411250-10594-7-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
References: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH 7/9] user-session-units: use user-session-launch to spawn weston
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
X-List-Received-Date: Tue, 15 Jul 2014 08:01:50 -0000

Make use of the pam setup made by user-session-launch
and spawn weston in the same pam environment.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../0001-Add-TTY_NUM-as-parameter.patch            |  39 ++++++
 .../0001-launcher.c-fork-weston.patch              |  56 +++++++++
 .../0001-set-tty-from-user-params.patch            | 132 +++++++++++++++++++++
 .../user-session-units/user-session-units_9.bb     |  10 +-
 4 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/user-session-units/user-session-units/0001-Add-TTY_NUM-as-parameter.patch
 create mode 100644 meta/recipes-support/user-session-units/user-session-units/0001-launcher.c-fork-weston.patch
 create mode 100644 meta/recipes-support/user-session-units/user-session-units/0001-set-tty-from-user-params.patch

diff --git a/meta/recipes-support/user-session-units/user-session-units/0001-Add-TTY_NUM-as-parameter.patch b/meta/recipes-support/user-session-units/user-session-units/0001-Add-TTY_NUM-as-parameter.patch
new file mode 100644
index 0000000..412b326
--- /dev/null
+++ b/meta/recipes-support/user-session-units/user-session-units/0001-Add-TTY_NUM-as-parameter.patch
@@ -0,0 +1,39 @@
+From 2bf6da4b283f3a04f1e1660028e54e88eca8f289 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 4 Jul 2014 20:15:11 +0300
+Subject: [PATCH] Add @TTY_NUM@ as parameter
+
+Add @TTY_NUM@ as parameter so we can
+replace it from Makefile.am/configure.ac,
+or directly from our recipe.
+
+Upstream-Status: Pending
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ units/system/user-session-launch@.service.in | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/units/system/user-session-launch@.service.in b/units/system/user-session-launch@.service.in
+index 77ec07c..bea084d 100644
+--- a/units/system/user-session-launch@.service.in
++++ b/units/system/user-session-launch@.service.in
+@@ -2,9 +2,14 @@
+ Description=User Session Launcher
+ After=systemd-user-sessions.service systemd-logind.service
+ Requires=systemd-logind.service
++Conflicts=getty@tty1.service
+ 
+ [Service]
+-ExecStart=/usr/bin/user-session-launch %i
++ExecStart=/usr/bin/user-session-launch %i @TTY_NUM@
++Environment=XDG_RUNTIME_DIR=/run/user/1000
++StandardInput=tty
++StandardError=journal
++TTYPath=/dev/tty@TTY_NUM@
+ 
+ [Install]
+ WantedBy=graphical.target
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/user-session-units/user-session-units/0001-launcher.c-fork-weston.patch b/meta/recipes-support/user-session-units/user-session-units/0001-launcher.c-fork-weston.patch
new file mode 100644
index 0000000..e46fcd2
--- /dev/null
+++ b/meta/recipes-support/user-session-units/user-session-units/0001-launcher.c-fork-weston.patch
@@ -0,0 +1,56 @@
+From e2cf9efc092978cb7e9369c7aa949e769ad3f360 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 4 Jul 2014 18:19:06 +0300
+Subject: [PATCH] launcher.c: fork weston
+
+Fork weston; this way we can inherit pam setup.
+
+Upstream-Status: Pending
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ src/launcher.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/launcher.c b/src/launcher.c
+index 635958f..31d40fd 100644
+--- a/src/launcher.c
++++ b/src/launcher.c
+@@ -43,6 +43,18 @@ static void handle_sig(int signal)
+ 	exit(EXIT_SUCCESS);
+ }
+ 
++static void launch_weston() {
++        char * child_argv[6];
++        child_argv[0] = "/bin/sh";
++        child_argv[1] = "-l";
++        child_argv[2] = "-c";
++        child_argv[3] = "/usr/bin/weston \"$@\"";
++        child_argv[4] = "weston";
++        child_argv[5] = NULL;
++        execv(child_argv[0], child_argv);
++        fprintf(stderr, "failed to execv!\n");
++}
++
+ int main(int argc, char **argv)
+ {
+ 	int fd;
+@@ -188,6 +200,15 @@ int main(int argc, char **argv)
+ 	if (setresuid(pw->pw_uid, pw->pw_uid, pw->pw_uid) != 0)
+ 		perror("setresuid");
+ 
++        pid_t child;
++        child = fork();
++
++        if (child == -1)
++                fprintf(stderr, "could not spawn child for weston!\n");
++
++        if (child == 0)
++                launch_weston();
++
+ 	pause();
+ 
+ 	/* unreachable */
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/user-session-units/user-session-units/0001-set-tty-from-user-params.patch b/meta/recipes-support/user-session-units/user-session-units/0001-set-tty-from-user-params.patch
new file mode 100644
index 0000000..f10a972
--- /dev/null
+++ b/meta/recipes-support/user-session-units/user-session-units/0001-set-tty-from-user-params.patch
@@ -0,0 +1,132 @@
+From a2f37c23f9d5227fc7f5dc1572446d9c47d94c58 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 4 Jul 2014 19:15:00 +0300
+Subject: [PATCH] set tty from user params
+
+Avoid tty number hardcoding; let the user
+choose it.
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ src/launcher.c | 24 +++++++++++++++++++++---
+ src/pam.c      | 14 +++++++-------
+ src/pam.h      |  2 +-
+ 3 files changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/src/launcher.c b/src/launcher.c
+index 31d40fd..70fd06b 100644
+--- a/src/launcher.c
++++ b/src/launcher.c
+@@ -55,6 +55,19 @@ static void launch_weston() {
+         fprintf(stderr, "failed to execv!\n");
+ }
+ 
++static int is_valid_tty_number(char *tty) {
++        if (tty != NULL && tty[0] != '\0' && \
++            (tty[0] >= '1' && tty[0] <= '9'))
++                if (tty[1] != '\0' || \
++                    (tty[1] >= '1' && tty[1] <= '9'))
++                        return 1;
++                else
++                        return 0;
++        else
++                return 0;
++        return 1;
++}
++
+ int main(int argc, char **argv)
+ {
+ 	int fd;
+@@ -68,6 +81,7 @@ int main(int argc, char **argv)
+ 	long long int struid;
+ 	char *endptr;
+ 	struct passwd *pw;
++        char *tty_num = NULL;
+ 
+ 	sigemptyset(&sa.sa_mask);
+ 	sa.sa_flags = SA_RESTART;
+@@ -82,11 +96,15 @@ int main(int argc, char **argv)
+ 		goto fail;
+ 	}
+ 
+-	if (argc != 2) {
+-		fprintf(stderr, "One argument of form SEAT-UID required.\n");
++	if (argc != 3) {
++		fprintf(stderr, "One argument of form SEAT-UID required and one for tty number.\n");
+ 		goto fail;
+ 	}
+ 
++        tty_num = argv[2];
++        if (!is_valid_tty_number(tty_num))
++                fprintf(stderr, "the tty number is not a valid number; e.g. [1..64].\n");
++
+ 	seat = strtok(argv[1], sep);
+ 	if (!seat || !strstr(seat, "seat")) {
+ 		fprintf(stderr, "SEAT name is invalid.\n");
+@@ -183,7 +201,7 @@ int main(int argc, char **argv)
+ 	for (; *s; s++) {
+ 		if (strcmp(seat, *s) == 0) {
+ 			/* The requested seat is available */
+-			setup_pam_session(seat, user);
++			setup_pam_session(seat, user, tty_num);
+ 		}
+ 		free(*s);
+ 	}
+diff --git a/src/pam.c b/src/pam.c
+index a9c699b..10c3dc7 100644
+--- a/src/pam.c
++++ b/src/pam.c
+@@ -83,18 +83,19 @@ pam_conversation_fn(int msg_count,
+  * pam_systemd.so may guess the variables correctly, but set them beforehand
+  * just to be sure.
+  */
+-void setup_pam_session(char *seat, char *user)
++void setup_pam_session(char *seat, char *user, char *tty_num)
+ {
+ 	int err;
++        char tty[10];
+ 
+ 	pc.conv = pam_conversation_fn;
+ 	pc.appdata_ptr = NULL;
+ 
+-	err = pam_start("login", user, &pc, &ph);
++        snprintf(tty, sizeof tty, "tty%s", tty_num);
++        fprintf(stderr, "setup pam session on tty%s\n", tty);
+ 
+-	/* FIXME: do not hardcode the tty here; should check
+-	 * first to see if it's already taken. */
+-	err = pam_set_item(ph, PAM_TTY, "tty1");
++	err = pam_start("login", user, &pc, &ph);
++	err = pam_set_item(ph, PAM_TTY, tty);
+ 	if (err != PAM_SUCCESS) {
+ 		printf("pam_set_item PAM_TTY returned %d: %s\n", err, pam_strerror(ph, err));
+ 		exit(EXIT_FAILURE);
+@@ -106,8 +107,7 @@ void setup_pam_session(char *seat, char *user)
+ 		exit(EXIT_FAILURE);
+ 	}
+ 
+-	/* FIXME: this variable should correspond to PAM_TTY */
+-	err = pam_misc_setenv(ph, "XDG_VTNR", "1", 0);
++	err = pam_misc_setenv(ph, "XDG_VTNR", tty_num, 0);
+ 	if (err != PAM_SUCCESS) {
+ 		printf("pam_misc_setenv XDG_VTNR returned %d: %s\n", err, pam_strerror(ph, err));
+ 		exit(EXIT_FAILURE);
+diff --git a/src/pam.h b/src/pam.h
+index d6f53b0..e192c3a 100644
+--- a/src/pam.h
++++ b/src/pam.h
+@@ -12,7 +12,7 @@
+ #ifndef __PAM_H__
+ #define __PAM_H__
+ 
+-void setup_pam_session(char *seat, char *user);
++void setup_pam_session(char *seat, char *user, char *tty_num);
+ void close_pam_session(void);
+ 
+ #endif /* __PAM_H_ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/user-session-units/user-session-units_9.bb b/meta/recipes-support/user-session-units/user-session-units_9.bb
index ad2f683..4c9fdc4 100644
--- a/meta/recipes-support/user-session-units/user-session-units_9.bb
+++ b/meta/recipes-support/user-session-units/user-session-units_9.bb
@@ -4,7 +4,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://foo-projects.org/~sofar/${BPN}/${BPN}-${PV}.tar.gz \
-           file://0001-systemd-login-lib-was-merged-into-libsystemd.patch "
+           file://0001-systemd-login-lib-was-merged-into-libsystemd.patch \
+           file://0001-launcher.c-fork-weston.patch \
+           file://0001-set-tty-from-user-params.patch \
+           file://0001-Add-TTY_NUM-as-parameter.patch "
 
 SRC_URI[md5sum] = "30d26fec6e3e221072c59554c93ecde0"
 SRC_URI[sha256sum] = "edfc0df890981708e1a09e8488bb91384b6739d76867d3fe2417b03265361717"
@@ -23,3 +26,8 @@ EXTRA_OECONF = "ac_cv_prog_E_PROG= \
  ac_cv_prog_MYTH_PROG="
 
 FILES_${PN} = "${systemd_unitdir}/ ${libdir}/systemd/user/ ${bindir}/"
+
+
+do_configure_prepend() {
+    sed -i -e 's/@TTY_NUM@/1/' ${S}/units/system/user-session-launch@.service.in
+}
\ No newline at end of file
-- 
1.9.1


