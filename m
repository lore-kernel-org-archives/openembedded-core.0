Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id B9C406AD2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:11:59 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m19so5528336wev.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=7G87lIk3OOSqzrgl31bX74xSKTfQoD/7mn3DivF3E3s=;
	b=jGJ1MudrdGIFro7/rUwiCqi+zXFvbsaoni9EmqBs75P0yGi40WJEA0e7wHrxcG3gzy
	EdWlASRbFwyC0jQHbw4EkIos0f7q+QOGq4jNzlpCGi5ZgSAN2lyU4xddDobkw++GwGuJ
	c6Cl5yIKTpyCUf0o9FtlgMxBhWJYJ/WTVp8A1ajOMFGVNAqyI1Wazd88KiZhWMVjB6Cz
	IFZ8qnxXi+2OwcpPb6p5wdRvPt8AMffCSd61M27oyOHovmRNaYglVMg2H9Rj7lwQn68i
	lSkUomyyKBEudMgDRKF567QRXDMZAguc5SH/Wxw6eQVelFHZzKQmtj93HjfWXdRC9agh
	rHEA==
X-Received: by 10.180.11.206 with SMTP id s14mr32802wib.40.1371744720416;
	Thu, 20 Jun 2013 09:12:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:11:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:24 +0100
Message-Id: <736802688bdf475a76354cd3c02db8ad71eb2445.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm6RXETFvNaiIhTBHnCIRarSmzrcETHbhBdccxqY7DTdDKCCd2QlVdDddHcl3tEcupFWedZ
Subject: [PATCH 2/7] weston: add patches to make weston-launch work
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
X-List-Received-Date: Thu, 20 Jun 2013 16:12:00 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston/groups.patch  |   47 +++++++++++++
 .../wayland/weston/weston-launch-shell.patch       |   74 ++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |    2 +
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch

diff --git a/meta/recipes-graphics/wayland/weston/groups.patch b/meta/recipes-graphics/wayland/weston/groups.patch
new file mode 100644
index 0000000..9dc043a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/groups.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=65933)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 42821739a228a85ce3432be1796858e5cc31688b Mon Sep 17 00:00:00 2001
+From: Quentin Glidic <sardemff7+git@sardemff7.net>
+Date: Wed, 19 Jun 2013 15:27:11 +0200
+Subject: [PATCH weston] weston-launch: Set all groups for user
+
+Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
+---
+ configure.ac        | 2 +-
+ src/weston-launch.c | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b625221..db3feb0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,7 +52,7 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+ 	      [[#include <time.h>]])
+ AC_CHECK_HEADERS([execinfo.h])
+ 
+-AC_CHECK_FUNCS([mkostemp strchrnul])
++AC_CHECK_FUNCS([mkostemp strchrnul initgroups])
+ 
+ COMPOSITOR_MODULES="wayland-server >= 1.1.90 xkbcommon pixman-1"
+ 
+diff --git a/src/weston-launch.c b/src/weston-launch.c
+index 76dcede..7d7b556 100644
+--- a/src/weston-launch.c
++++ b/src/weston-launch.c
+@@ -631,9 +631,13 @@ main(int argc, char *argv[])
+ 		}
+ 
+ 		if (setgid(wl.pw->pw_gid) < 0 ||
++#ifdef HAVE_INITGROUPS
++                    initgroups(wl.pw->pw_name, wl.pw->pw_gid) < 0 ||
++#endif
+ 		    setuid(wl.pw->pw_uid) < 0)
+ 			error(1, errno, "dropping privilidges failed");
+ 
++
+ 		if (sleep_fork) {
+ 			if (wl.verbose)
+ 				printf("weston-launch: waiting %d seconds\n", sleep_fork);
+-- 
+1.8.3
diff --git a/meta/recipes-graphics/wayland/weston/weston-launch-shell.patch b/meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
new file mode 100644
index 0000000..ffe0608
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
@@ -0,0 +1,74 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ff3230952a68077669e0ea0ac3ceb234273556fc Mon Sep 17 00:00:00 2001
+From: Quentin Glidic <sardemff7+git@sardemff7.net>
+Date: Fri, 17 May 2013 16:20:37 +0200
+Subject: [PATCH] weston-launch: Run weston in the user login shell
+
+This patch brings back the user environment from the shell.
+In the future, weston-launch could create the Wayland socket earlier, in
+which case the user's shell could be used to run Wayland-specific tools
+in the new Weston session.
+
+Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
+---
+ src/weston-launch.c |   19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/src/weston-launch.c b/src/weston-launch.c
+index 64d4a8a..89c3c5a 100644
+--- a/src/weston-launch.c
++++ b/src/weston-launch.c
+@@ -60,6 +60,8 @@
+ 
+ #include "weston-launch.h"
+ 
++#define MAX_ARGV_SIZE 256
++
+ struct weston_launch {
+ 	struct pam_conv pc;
+ 	pam_handle_t *ph;
+@@ -523,8 +525,9 @@ main(int argc, char *argv[])
+ 	struct weston_launch wl;
+ 	char **env;
+ 	int i, c;
+-	char **child_argv;
++	char *child_argv[MAX_ARGV_SIZE];
+ 	char *tty = NULL, *new_user = NULL;
++	char *term;
+ 	int sleep_fork = 0;
+ 	struct option opts[] = {
+ 		{ "user",    required_argument, NULL, 'u' },
+@@ -562,8 +565,8 @@ main(int argc, char *argv[])
+ 		}
+ 	}
+ 
+-	child_argv = &argv[optind-1];
+-	child_argv[0] = BINDIR "/weston";
++	if ((argc - optind) > (MAX_ARGV_SIZE - 5))
++		error(1, E2BIG, "Too many arguments to pass to weston");
+ 
+ 	if (new_user)
+ 		wl.pw = getpwnam(new_user);
+@@ -572,7 +575,17 @@ main(int argc, char *argv[])
+ 	if (wl.pw == NULL)
+ 		error(1, errno, "failed to get username");
+ 
++	child_argv[0] = wl.pw->pw_shell;
++	child_argv[1] = "-l";
++	child_argv[2] = "-c";
++	child_argv[3] = BINDIR "/weston \"$@\"";
++	child_argv[4] = "weston";
++	for (i = 0; i < (argc - optind); ++i)
++		child_argv[5+i] = argv[optind+i];
++
++	term = getenv("TERM");
+ 	clearenv();
++	setenv("TERM", term, 1);
+ 	setenv("USER", wl.pw->pw_name, 1);
+ 	setenv("LOGNAME", wl.pw->pw_name, 1);
+ 	setenv("HOME", wl.pw->pw_dir, 1);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index 026f136..ee33be6 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://install-examples.patch \
+           file://weston-launch-shell.patch \
+           file://groups.patch \
            file://weston.png \
            file://weston.desktop"
 SRC_URI[md5sum] = "dd9f3043fc5228c6bc4e99873fae2254"
-- 
1.7.10.4


