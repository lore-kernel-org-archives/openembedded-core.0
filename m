Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE7F60112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:34 +0000 (UTC)
Received: by igvg19 with SMTP id g19so41866850igv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RVQ9dKMnBkh9pLATAwvCtU9Gd1uQh7u9Ua+0DtT6S3Q=;
	b=QzFMkaRCaz43Mg5eW74wXU9+HaXHrvYkuldfKoPkwFMzPUd9Bj680Qwp/vT5RNmfw5
	4vop7PEqjBn75+HjA1RcrtmQdLzi1xnEGnqa3uq+zjRaZBWMW2u/LsjUXpP51jzmncQk
	xgaRdVUisIoaLJjWBVppCvsPKBzVeGieElpFDoxfRrWzUP1JeWpojwWdUFzHKU5cicbx
	/6J63OD0yVi1479OV7RqyYa6lSngoH5YBLxkGV2mNRMDrR2ecj0VRllXPDLT0Nl/7Eb+
	CdsD2JFAOgfwEPGfx+CfWvNIabgbl6rPtZD05GO+gOA5Z9vJMVFPkqPFBA8PS6tx+VT0
	21BA==
X-Received: by 10.50.25.227 with SMTP id f3mr4211063igg.6.1448059475425;
	Fri, 20 Nov 2015 14:44:35 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:34 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:56 -0800
Message-Id: <1448059438-24431-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 09/11] busybox: update 1.23.2 -> 1.24.1
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:35 -0000

The busybox defconfig has also been refreshed, with all new apps
and features disabled by default. Update _git recipe version too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 ---------------------
 .../busybox/busybox/0001-chown-fix-help-text.patch |  34 --
 ...ix-double-free-fatal-error-in-INET_sprint.patch |  67 ----
 meta/recipes-core/busybox/busybox/defconfig        |  23 +-
 .../{busybox_1.23.2.bb => busybox_1.24.1.bb}       |   7 +-
 meta/recipes-core/busybox/busybox_git.bb           |   8 +-
 6 files changed, 25 insertions(+), 502 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 rename meta/recipes-core/busybox/{busybox_1.23.2.bb => busybox_1.24.1.bb} (80%)

diff --git a/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch b/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
deleted file mode 100644
index 1d299ee..0000000
--- a/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
+++ /dev/null
@@ -1,388 +0,0 @@
-From 86a7f18f211af1abda5c855d2674b0fcb53de524 Mon Sep 17 00:00:00 2001
-From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Date: Thu, 2 Apr 2015 23:03:46 +0200
-Subject: [PATCH] *: Switch to POSIX utmpx API
-
-UTMP is SVID legacy, UTMPX is mandated by POSIX.
-
-Glibc and uClibc have identical layout of UTMP and UTMPX, both of these
-libc treat _PATH_UTMPX as _PATH_UTMP so from a user-perspective nothing
-changes except the names of the API entrypoints.
-
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
-Upstream-Status: Backport
-
- coreutils/who.c        |  8 ++++----
- include/libbb.h        |  2 +-
- init/halt.c            |  4 ++--
- libbb/utmp.c           | 44 ++++++++++++++++++++++----------------------
- miscutils/last.c       |  8 ++++----
- miscutils/last_fancy.c | 16 ++++++++++------
- miscutils/runlevel.c   | 12 ++++++------
- miscutils/wall.c       |  8 ++++----
- procps/uptime.c        |  6 +++---
- 9 files changed, 56 insertions(+), 52 deletions(-)
-
-diff --git a/coreutils/who.c b/coreutils/who.c
-index f955ce6..8337212 100644
---- a/coreutils/who.c
-+++ b/coreutils/who.c
-@@ -73,7 +73,7 @@ static void idle_string(char *str6, time_t t)
- int who_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int who_main(int argc UNUSED_PARAM, char **argv)
- {
--	struct utmp *ut;
-+	struct utmpx *ut;
- 	unsigned opt;
- 	int do_users = (ENABLE_USERS && (!ENABLE_WHO || applet_name[0] == 'u'));
- 	const char *fmt = "%s";
-@@ -83,8 +83,8 @@ int who_main(int argc UNUSED_PARAM, char **argv)
- 	if (opt & 2) // -H
- 		printf("USER\t\tTTY\t\tIDLE\tTIME\t\t HOST\n");
- 
--	setutent();
--	while ((ut = getutent()) != NULL) {
-+	setutxent();
-+	while ((ut = getutxent()) != NULL) {
- 		if (ut->ut_user[0]
- 		 && ((opt & 1) || ut->ut_type == USER_PROCESS)
- 		) {
-@@ -126,6 +126,6 @@ int who_main(int argc UNUSED_PARAM, char **argv)
- 	if (do_users)
- 		bb_putchar('\n');
- 	if (ENABLE_FEATURE_CLEAN_UP)
--		endutent();
-+		endutxent();
- 	return EXIT_SUCCESS;
- }
-diff --git a/include/libbb.h b/include/libbb.h
-index 26b6868..0f8363b 100644
---- a/include/libbb.h
-+++ b/include/libbb.h
-@@ -84,7 +84,7 @@
- # include <selinux/av_permissions.h>
- #endif
- #if ENABLE_FEATURE_UTMP
--# include <utmp.h>
-+# include <utmpx.h>
- #endif
- #if ENABLE_LOCALE_SUPPORT
- # include <locale.h>
-diff --git a/init/halt.c b/init/halt.c
-index 7974adb..ad12d91 100644
---- a/init/halt.c
-+++ b/init/halt.c
-@@ -74,7 +74,7 @@
- 
- static void write_wtmp(void)
- {
--	struct utmp utmp;
-+	struct utmpx utmp;
- 	struct utsname uts;
- 	/* "man utmp" says wtmp file should *not* be created automagically */
- 	/*if (access(bb_path_wtmp_file, R_OK|W_OK) == -1) {
-@@ -88,7 +88,7 @@ static void write_wtmp(void)
- 	utmp.ut_line[0] = '~'; utmp.ut_line[1] = '~'; /* = strcpy(utmp.ut_line, "~~"); */
- 	uname(&uts);
- 	safe_strncpy(utmp.ut_host, uts.release, sizeof(utmp.ut_host));
--	updwtmp(bb_path_wtmp_file, &utmp);
-+	updwtmpx(bb_path_wtmp_file, &utmp);
- }
- #else
- #define write_wtmp() ((void)0)
-diff --git a/libbb/utmp.c b/libbb/utmp.c
-index 8ad9ba2..bd07670 100644
---- a/libbb/utmp.c
-+++ b/libbb/utmp.c
-@@ -16,7 +16,7 @@ static void touch(const char *filename)
- 
- void FAST_FUNC write_new_utmp(pid_t pid, int new_type, const char *tty_name, const char *username, const char *hostname)
- {
--	struct utmp utent;
-+	struct utmpx utent;
- 	char *id;
- 	unsigned width;
- 
-@@ -45,17 +45,17 @@ void FAST_FUNC write_new_utmp(pid_t pid, int new_type, const char *tty_name, con
- 		tty_name += 3;
- 	strncpy(id, tty_name, width);
- 
--	touch(_PATH_UTMP);
--	//utmpname(_PATH_UTMP);
--	setutent();
-+	touch(_PATH_UTMPX);
-+	//utmpxname(_PATH_UTMPX);
-+	setutxent();
- 	/* Append new one (hopefully, unless we collide on ut_id) */
--	pututline(&utent);
--	endutent();
-+	pututxline(&utent);
-+	endutxent();
- 
- #if ENABLE_FEATURE_WTMP
- 	/* "man utmp" says wtmp file should *not* be created automagically */
- 	/*touch(bb_path_wtmp_file);*/
--	updwtmp(bb_path_wtmp_file, &utent);
-+	updwtmpx(bb_path_wtmp_file, &utent);
- #endif
- }
- 
-@@ -64,17 +64,17 @@ void FAST_FUNC write_new_utmp(pid_t pid, int new_type, const char *tty_name, con
-  */
- void FAST_FUNC update_utmp(pid_t pid, int new_type, const char *tty_name, const char *username, const char *hostname)
- {
--	struct utmp utent;
--	struct utmp *utp;
-+	struct utmpx utent;
-+	struct utmpx *utp;
- 
--	touch(_PATH_UTMP);
--	//utmpname(_PATH_UTMP);
--	setutent();
-+	touch(_PATH_UTMPX);
-+	//utmpxname(_PATH_UTMPX);
-+	setutxent();
- 
- 	/* Did init/getty/telnetd/sshd/... create an entry for us?
- 	 * It should be (new_type-1), but we'd also reuse
- 	 * any other potentially stale xxx_PROCESS entry */
--	while ((utp = getutent()) != NULL) {
-+	while ((utp = getutxent()) != NULL) {
- 		if (utp->ut_pid == pid
- 		// && ut->ut_line[0]
- 		 && utp->ut_id[0] /* must have nonzero id */
-@@ -88,25 +88,25 @@ void FAST_FUNC update_utmp(pid_t pid, int new_type, const char *tty_name, const
- 				/* Stale record. Nuke hostname */
- 				memset(utp->ut_host, 0, sizeof(utp->ut_host));
- 			}
--			/* NB: pututline (see later) searches for matching utent
--			 * using getutid(utent) - we must not change ut_id
-+			/* NB: pututxline (see later) searches for matching utxent
-+			 * using getutxid(utent) - we must not change ut_id
- 			 * if we want *exactly this* record to be overwritten!
- 			 */
- 			break;
- 		}
- 	}
--	//endutent(); - no need, pututline can deal with (and actually likes)
-+	//endutxent(); - no need, pututxline can deal with (and actually likes)
- 	//the situation when utmp file is positioned on found record
- 
- 	if (!utp) {
- 		if (new_type != DEAD_PROCESS)
- 			write_new_utmp(pid, new_type, tty_name, username, hostname);
- 		else
--			endutent();
-+			endutxent();
- 		return;
- 	}
- 
--	/* Make a copy. We can't use *utp, pututline's internal getutid
-+	/* Make a copy. We can't use *utp, pututxline's internal getutxid
- 	 * will overwrite it before it is used! */
- 	utent = *utp;
- 
-@@ -120,14 +120,14 @@ void FAST_FUNC update_utmp(pid_t pid, int new_type, const char *tty_name, const
- 	utent.ut_tv.tv_sec = time(NULL);
- 
- 	/* Update, or append new one */
--	//setutent();
--	pututline(&utent);
--	endutent();
-+	//setutxent();
-+	pututxline(&utent);
-+	endutxent();
- 
- #if ENABLE_FEATURE_WTMP
- 	/* "man utmp" says wtmp file should *not* be created automagically */
- 	/*touch(bb_path_wtmp_file);*/
--	updwtmp(bb_path_wtmp_file, &utent);
-+	updwtmpx(bb_path_wtmp_file, &utent);
- #endif
- }
- 
-diff --git a/miscutils/last.c b/miscutils/last.c
-index a144c7e..6d8b584 100644
---- a/miscutils/last.c
-+++ b/miscutils/last.c
-@@ -32,21 +32,21 @@
- 
- #if defined UT_LINESIZE \
- 	&& ((UT_LINESIZE != 32) || (UT_NAMESIZE != 32) || (UT_HOSTSIZE != 256))
--#error struct utmp member char[] size(s) have changed!
-+#error struct utmpx member char[] size(s) have changed!
- #elif defined __UT_LINESIZE \
- 	&& ((__UT_LINESIZE != 32) || (__UT_NAMESIZE != 64) || (__UT_HOSTSIZE != 256))
--#error struct utmp member char[] size(s) have changed!
-+#error struct utmpx member char[] size(s) have changed!
- #endif
- 
- #if EMPTY != 0 || RUN_LVL != 1 || BOOT_TIME != 2 || NEW_TIME != 3 || \
- 	OLD_TIME != 4
--#error Values for the ut_type field of struct utmp changed
-+#error Values for the ut_type field of struct utmpx changed
- #endif
- 
- int last_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int last_main(int argc UNUSED_PARAM, char **argv UNUSED_PARAM)
- {
--	struct utmp ut;
-+	struct utmpx ut;
- 	int n, file = STDIN_FILENO;
- 	time_t t_tmp;
- 	off_t pos;
-diff --git a/miscutils/last_fancy.c b/miscutils/last_fancy.c
-index 16ed9e9..8194e31 100644
---- a/miscutils/last_fancy.c
-+++ b/miscutils/last_fancy.c
-@@ -22,6 +22,10 @@
- #define HEADER_LINE_WIDE  "USER", "TTY", \
- 	INET6_ADDRSTRLEN, INET6_ADDRSTRLEN, "HOST", "LOGIN", "  TIME", ""
- 
-+#if !defined __UT_LINESIZE && defined UT_LINESIZE
-+# define __UT_LINESIZE UT_LINESIZE
-+#endif
-+
- enum {
- 	NORMAL,
- 	LOGGED,
-@@ -39,7 +43,7 @@ enum {
- 
- #define show_wide (option_mask32 & LAST_OPT_W)
- 
--static void show_entry(struct utmp *ut, int state, time_t dur_secs)
-+static void show_entry(struct utmpx *ut, int state, time_t dur_secs)
- {
- 	unsigned days, hours, mins;
- 	char duration[sizeof("(%u+02:02)") + sizeof(int)*3];
-@@ -104,7 +108,7 @@ static void show_entry(struct utmp *ut, int state, time_t dur_secs)
- 		duration_str);
- }
- 
--static int get_ut_type(struct utmp *ut)
-+static int get_ut_type(struct utmpx *ut)
- {
- 	if (ut->ut_line[0] == '~') {
- 		if (strcmp(ut->ut_user, "shutdown") == 0) {
-@@ -142,7 +146,7 @@ static int get_ut_type(struct utmp *ut)
- 	return ut->ut_type;
- }
- 
--static int is_runlevel_shutdown(struct utmp *ut)
-+static int is_runlevel_shutdown(struct utmpx *ut)
- {
- 	if (((ut->ut_pid & 255) == '0') || ((ut->ut_pid & 255) == '6')) {
- 		return 1;
-@@ -154,7 +158,7 @@ static int is_runlevel_shutdown(struct utmp *ut)
- int last_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int last_main(int argc UNUSED_PARAM, char **argv)
- {
--	struct utmp ut;
-+	struct utmpx ut;
- 	const char *filename = _PATH_WTMP;
- 	llist_t *zlist;
- 	off_t pos;
-@@ -242,9 +246,9 @@ int last_main(int argc UNUSED_PARAM, char **argv)
- 			{
- 				llist_t *el, *next;
- 				for (el = zlist; el; el = next) {
--					struct utmp *up = (struct utmp *)el->data;
-+					struct utmpx *up = (struct utmpx *)el->data;
- 					next = el->link;
--					if (strncmp(up->ut_line, ut.ut_line, UT_LINESIZE) == 0) {
-+					if (strncmp(up->ut_line, ut.ut_line, __UT_LINESIZE) == 0) {
- 						if (show) {
- 							show_entry(&ut, NORMAL, up->ut_tv.tv_sec);
- 							show = 0;
-diff --git a/miscutils/runlevel.c b/miscutils/runlevel.c
-index 76231df..8558db8 100644
---- a/miscutils/runlevel.c
-+++ b/miscutils/runlevel.c
-@@ -29,19 +29,19 @@
- int runlevel_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int runlevel_main(int argc UNUSED_PARAM, char **argv)
- {
--	struct utmp *ut;
-+	struct utmpx *ut;
- 	char prev;
- 
--	if (argv[1]) utmpname(argv[1]);
-+	if (argv[1]) utmpxname(argv[1]);
- 
--	setutent();
--	while ((ut = getutent()) != NULL) {
-+	setutxent();
-+	while ((ut = getutxent()) != NULL) {
- 		if (ut->ut_type == RUN_LVL) {
- 			prev = ut->ut_pid / 256;
- 			if (prev == 0) prev = 'N';
- 			printf("%c %c\n", prev, ut->ut_pid % 256);
- 			if (ENABLE_FEATURE_CLEAN_UP)
--				endutent();
-+				endutxent();
- 			return 0;
- 		}
- 	}
-@@ -49,6 +49,6 @@ int runlevel_main(int argc UNUSED_PARAM, char **argv)
- 	puts("unknown");
- 
- 	if (ENABLE_FEATURE_CLEAN_UP)
--		endutent();
-+		endutxent();
- 	return 1;
- }
-diff --git a/miscutils/wall.c b/miscutils/wall.c
-index bb709ee..50658f4 100644
---- a/miscutils/wall.c
-+++ b/miscutils/wall.c
-@@ -32,7 +32,7 @@
- int wall_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int wall_main(int argc UNUSED_PARAM, char **argv)
- {
--	struct utmp *ut;
-+	struct utmpx *ut;
- 	char *msg;
- 	int fd;
- 
-@@ -46,8 +46,8 @@ int wall_main(int argc UNUSED_PARAM, char **argv)
- 	msg = xmalloc_read(fd, NULL);
- 	if (ENABLE_FEATURE_CLEAN_UP && argv[1])
- 		close(fd);
--	setutent();
--	while ((ut = getutent()) != NULL) {
-+	setutxent();
-+	while ((ut = getutxent()) != NULL) {
- 		char *line;
- 		if (ut->ut_type != USER_PROCESS)
- 			continue;
-@@ -56,7 +56,7 @@ int wall_main(int argc UNUSED_PARAM, char **argv)
- 		free(line);
- 	}
- 	if (ENABLE_FEATURE_CLEAN_UP) {
--		endutent();
-+		endutxent();
- 		free(msg);
- 	}
- 	return EXIT_SUCCESS;
-diff --git a/procps/uptime.c b/procps/uptime.c
-index 778812a..149bae6 100644
---- a/procps/uptime.c
-+++ b/procps/uptime.c
-@@ -81,10 +81,10 @@ int uptime_main(int argc UNUSED_PARAM, char **argv UNUSED_PARAM)
- 
- #if ENABLE_FEATURE_UPTIME_UTMP_SUPPORT
- 	{
--		struct utmp *ut;
-+		struct utmpx *ut;
- 		unsigned users = 0;
--		while ((ut = getutent()) != NULL) {
--			if ((ut->ut_type == USER_PROCESS) && (ut->ut_name[0] != '\0'))
-+		while ((ut = getutxent()) != NULL) {
-+			if ((ut->ut_type == USER_PROCESS) && (ut->ut_user[0] != '\0'))
- 				users++;
- 		}
- 		printf(",  %u users", users);
--- 
-2.5.1
-
diff --git a/meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch b/meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
deleted file mode 100644
index 4299799..0000000
--- a/meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d291c2fdd5cb8616605c67ecbfb04274fa094242 Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Sun, 7 Jun 2015 02:32:23 +0200
-Subject: [PATCH] chown: fix help text
-
-Derived from:
-http://git.busybox.net/busybox/commit/?id=d291c2fdd5cb8616605c67ecbfb04274fa094242.
-
-Only when DESKTOP is enabled, chown has -L, -H and -P options.
-
-Upstream-Status: Backport
-
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- coreutils/chown.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/coreutils/chown.c b/coreutils/chown.c
-index cb07bbc..679c0d8 100644
---- a/coreutils/chown.c
-+++ b/coreutils/chown.c
-@@ -11,7 +11,7 @@
- /* http://www.opengroup.org/onlinepubs/007904975/utilities/chown.html */
- 
- //usage:#define chown_trivial_usage
--//usage:       "[-RhLHP"IF_DESKTOP("cvf")"]... OWNER[<.|:>[GROUP]] FILE..."
-+//usage:       "[-Rh"IF_DESKTOP("LHPcvf")"]... OWNER[<.|:>[GROUP]] FILE..."
- //usage:#define chown_full_usage "\n\n"
- //usage:       "Change the owner and/or group of each FILE to OWNER and/or GROUP\n"
- //usage:     "\n	-R	Recurse"
--- 
-1.8.3.4
-
diff --git a/meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch b/meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
deleted file mode 100644
index 2d729b1..0000000
--- a/meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a97777889328157bb7d06ec618bad16712a9c345 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Tue, 3 Feb 2015 12:11:30 +0100
-Subject: [PATCH] ifconfig: fix double free fatal error in INET_sprint
-
-Derived from:
-http://git.busybox.net/busybox/commit/?id=a97777889328157bb7d06ec618bad16712a9c345.
-
-While INET_sprint or INET6_sprint is called circularly by keeping
-ifconfiging, sap->sa_family would be cleaned by other parallel processes
-such as dhclient sometimes, and then there would be a double free error
-like the following:
-
-  *** glibc detected *** ifconfig: double free or corruption (fasttop): 0x000a6008 ***
-  ======= Backtrace: =========
-  /lib/libc.so.6(+0x6bc84)[0x40133c84]
-  /lib/libc.so.6(cfree+0x94)[0x40138684]
-  ifconfig[0x1c460]
-  ifconfig[0x1c6a0]
-  ifconfig[0x1ccf4]
-  ifconfig[0x187c8]
-  ifconfig[0xd544]
-  ifconfig[0xd5dc]
-  ifconfig[0xdca8]
-  /lib/libc.so.6(__libc_start_main+0x110)[0x400df258]
-  ======= Memory map: ========
-  00008000-0009c000 r-xp 00000000 1f:05 444328     /bin/busybox
-  000a3000-000a4000 rw-p 00093000 1f:05 444328     /bin/busybox
-
-This patch moved free() two lines down to address this problem.
-
-Upstream-Status: Backport
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- networking/interface.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/networking/interface.c b/networking/interface.c
-index bf7d2b1..b0572d0 100644
---- a/networking/interface.c
-+++ b/networking/interface.c
-@@ -91,9 +91,9 @@ static const char* FAST_FUNC INET_sprint(struct sockaddr *sap, int numeric)
- {
- 	static char *buff; /* defaults to NULL */
- 
--	free(buff);
- 	if (sap->sa_family == 0xFFFF || sap->sa_family == 0)
- 		return "[NONE SET]";
-+	free(buff);
- 	buff = INET_rresolve((struct sockaddr_in *) sap, numeric, 0xffffff00);
- 	return buff;
- }
-@@ -173,9 +173,9 @@ static const char* FAST_FUNC INET6_sprint(struct sockaddr *sap, int numeric)
- {
- 	static char *buff;
- 
--	free(buff);
- 	if (sap->sa_family == 0xFFFF || sap->sa_family == 0)
- 		return "[NONE SET]";
-+	free(buff);
- 	buff = INET6_rresolve((struct sockaddr_in6 *) sap, numeric);
- 	return buff;
- }
--- 
-1.8.3.4
-
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index a5adea2..77274d0 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.23.2
-# Thu Jul 30 11:00:00 2015
+# Busybox version: 1.24.1
+# Tue Oct 31 11:00:00 2015
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -64,9 +64,9 @@ CONFIG_FEATURE_HAVE_RPC=y
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
 CONFIG_LFS=y
-# CONFIG_CROSS_COMPILER_PREFIX is not set
+CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
-# CONFIG_EXTRA_CFLAGS is not set
+CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
 
@@ -156,6 +156,7 @@ CONFIG_CPIO=y
 CONFIG_GZIP=y
 # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
 CONFIG_GZIP_FAST=0
+# CONFIG_FEATURE_GZIP_LEVELS is not set
 # CONFIG_LZOP is not set
 # CONFIG_LZOP_COMPR_HIGH is not set
 # CONFIG_RPM is not set
@@ -187,11 +188,13 @@ CONFIG_DD=y
 CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
 # CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
 # CONFIG_FEATURE_DD_IBS_OBS is not set
+# CONFIG_FEATURE_DD_STATUS is not set
 # CONFIG_HOSTID is not set
 CONFIG_ID=y
 CONFIG_GROUPS=y
 CONFIG_SHUF=y
 CONFIG_SYNC=y
+# CONFIG_FEATURE_SYNC_FANCY is not set
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
@@ -200,6 +203,7 @@ CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
 # CONFIG_FEATURE_TR_EQUIV is not set
+# CONFIG_TRUNCATE is not set
 CONFIG_UNLINK=y
 # CONFIG_BASE64 is not set
 CONFIG_WHO=y
@@ -292,6 +296,7 @@ CONFIG_TEE=y
 CONFIG_TRUE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
+CONFIG_UNAME_OSNAME="GNU/Linux"
 # CONFIG_UNEXPAND is not set
 # CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_UNIQ=y
@@ -562,7 +567,9 @@ CONFIG_FEATURE_MOUNT_NFS=y
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
+# CONFIG_FEATURE_MOUNT_OTHERTAB is not set
 # CONFIG_REV is not set
+# CONFIG_UEVENT is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKID is not set
@@ -660,10 +667,15 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
 CONFIG_FEATURE_CROND_DIR=""
+# CONFIG_I2CGET is not set
+# CONFIG_I2CSET is not set
+# CONFIG_I2CDUMP is not set
+# CONFIG_I2CDETECT is not set
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
 CONFIG_FEATURE_LESS_BRACKETS=y
 CONFIG_FEATURE_LESS_FLAGS=y
+# CONFIG_FEATURE_LESS_TRUNCATE is not set
 # CONFIG_FEATURE_LESS_MARKS is not set
 # CONFIG_FEATURE_LESS_REGEXP is not set
 # CONFIG_FEATURE_LESS_WINCH is not set
@@ -763,6 +775,8 @@ CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
 CONFIG_FEATURE_WGET_LONG_OPTIONS=y
 CONFIG_FEATURE_WGET_TIMEOUT=y
+# CONFIG_FEATURE_WGET_OPENSSL is not set
+# CONFIG_FEATURE_WGET_SSL_HELPER is not set
 # CONFIG_WHOIS is not set
 CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
@@ -824,6 +838,7 @@ CONFIG_IP=y
 CONFIG_FEATURE_IP_ADDRESS=y
 CONFIG_FEATURE_IP_LINK=y
 CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_ROUTE_DIR="/etc/iproute2"
 CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_FEATURE_IP_RULE is not set
 # CONFIG_FEATURE_IP_SHORT_FORMS is not set
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
similarity index 80%
rename from meta/recipes-core/busybox/busybox_1.23.2.bb
rename to meta/recipes-core/busybox/busybox_1.24.1.bb
index e9f7eb6..92bbee1 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -30,9 +30,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
-           file://0001-Switch-to-POSIX-utmpx-API.patch \
-           file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
-           file://0001-chown-fix-help-text.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://0002-Passthrough-r-to-linker.patch \
            file://mount-via-label.cfg \
@@ -41,5 +38,5 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://getopts.cfg \
 "
 
-SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
-SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
+SRC_URI[tarball.md5sum] = "be98a40cadf84ce2d6b05fa41a275c6a"
+SRC_URI[tarball.sha256sum] = "37d03132cc078937360b392170b7a1d0e5b322eee9f57c0b82292a8b1f0afe3d"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index e9ff0bc..d968fad 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,8 +1,8 @@
 require busybox.inc
 
-SRCREV = "be947c4d97c0dacb703a6f24dd813ff6dd3a33b6"
+SRCREV = "966423d4034067f52b419570a1016d1dfc4aeacd"
 # Lookout for PV bump too when SRCREV is changed
-PV = "1.23.2+git${SRCPV}"
+PV = "1.25.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -36,8 +36,8 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
-           file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
-           file://0001-chown-fix-help-text.patch \
+           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
+           file://0002-Passthrough-r-to-linker.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
1.9.1


