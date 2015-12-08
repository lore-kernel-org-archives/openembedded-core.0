Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF796FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:44 +0000 (UTC)
Received: by qgec40 with SMTP id c40so9970282qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WZXhKMK4NxPJf/Gb5E+AUGM7XGBvkG6P0DkDKxUYRFk=;
	b=Z+Gj1Rqal0uG0xzVZ1zxvEZEzdiN6W9zc7R7amI8PFvKY2XpnpaPfNoLhNvgtlA1j4
	GhqBWOLLaKn/IRuFbpy/swGDbjV2/viy9DI1Glveq5jx1PTP93AYUjxyNxOlZvtKhScw
	YLqfuGPm0ubUrnA3l4ck13Q7sszc/y8ekqoOxgREVBny8FVwH4LYvPzPzoQeOWIeqKMt
	tpZA/yWSIc86vSdYcAE+v3iPjq0MOUfKfSDUbZGAjJ38MkfjC5gs1B9jk88tM5x1r3VF
	OJsdghocxnz1pEuV9luiDcDYaK2mbLFjaSaH33qo94IC4U3vxq2pnWB58Y0ZKIAKO0pl
	xIOw==
X-Received: by 10.140.92.85 with SMTP id a79mr2259199qge.105.1449562365206;
	Tue, 08 Dec 2015 00:12:45 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:30 +0000
Message-Id: <58367996ce98eadb065c56cac62a034052e9cc4f.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 10/13] busybox: Add config for musl
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:44 -0000

Default config is enabling additional features that dont compile with
musl so lets disable them for musl case and use posix compliant
getpwent()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...user-use-POSIX-getpwent-instead-of-getpwe.patch | 71 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox/musl.cfg         | 12 ++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  2 +
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch
 create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg

diff --git a/meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch b/meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch
new file mode 100644
index 0000000..4cb9a73
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch
@@ -0,0 +1,71 @@
+From f47fa75ef19a43848dedb4a2bff79368878362bf Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 22 Apr 2014 12:41:20 +0000
+Subject: [PATCH] linedit, deluser: use POSIX getpwent instead of getpwent_r
+
+This fixes building with musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+Upstream-Status: backport
+
+ libbb/lineedit.c     | 11 ++++-------
+ loginutils/deluser.c | 11 +++++------
+ 2 files changed, 9 insertions(+), 13 deletions(-)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index 8564307..99e6e2c 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -672,20 +672,17 @@ static char *username_path_completion(char *ud)
+  */
+ static NOINLINE unsigned complete_username(const char *ud)
+ {
+-	/* Using _r function to avoid pulling in static buffers */
+-	char line_buff[256];
+-	struct passwd pwd;
+-	struct passwd *result;
++	struct passwd *pw;
+ 	unsigned userlen;
+ 
+ 	ud++; /* skip ~ */
+ 	userlen = strlen(ud);
+ 
+ 	setpwent();
+-	while (!getpwent_r(&pwd, line_buff, sizeof(line_buff), &result)) {
++	while ((pw = getpwent())) {
+ 		/* Null usernames should result in all users as possible completions. */
+-		if (/*!userlen || */ strncmp(ud, pwd.pw_name, userlen) == 0) {
+-			add_match(xasprintf("~%s/", pwd.pw_name));
++		if (/*!userlen || */ strncmp(ud, pw->pw_name, userlen) == 0) {
++			add_match(xasprintf("~%s/", pw->pw_name));
+ 		}
+ 	}
+ 	endpwent();
+diff --git a/loginutils/deluser.c b/loginutils/deluser.c
+index e39ac55..d7d9b24 100644
+--- a/loginutils/deluser.c
++++ b/loginutils/deluser.c
+@@ -73,14 +73,13 @@ int deluser_main(int argc, char **argv)
+ 			if (!member) {
+ 				/* "delgroup GROUP" */
+ 				struct passwd *pw;
+-				struct passwd pwent;
+ 				/* Check if the group is in use */
+-#define passwd_buf bb_common_bufsiz1
+-				while (!getpwent_r(&pwent, passwd_buf, sizeof(passwd_buf), &pw)) {
+-					if (pwent.pw_gid == gr->gr_gid)
+-						bb_error_msg_and_die("'%s' still has '%s' as their primary group!", pwent.pw_name, name);
++				setpwent();
++				while ((pw = getpwent())) {
++					if (pw->pw_gid == gr->gr_gid)
++						bb_error_msg_and_die("'%s' still has '%s' as their primary group!", pw->pw_name, name);
+ 				}
+-				//endpwent();
++				endpwent();
+ 			}
+ 			pfile = bb_path_group_file;
+ 			if (ENABLE_FEATURE_SHADOWPASSWDS)
+-- 
+1.9.2
+
diff --git a/meta/recipes-core/busybox/busybox/musl.cfg b/meta/recipes-core/busybox/busybox/musl.cfg
new file mode 100644
index 0000000..facfe85
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/musl.cfg
@@ -0,0 +1,12 @@
+# CONFIG_EXTRA_COMPAT is not set
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_HAVE_RPC is not set
+# CONFIG_WERROR is not set
+# CONFIG_FEATURE_SYSTEMD is not set
+# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
+# CONFIG_PAM is not set
+# CONFIG_FEATURE_INETD_RPC is not set
+# CONFIG_SELINUXENABLED is not set
+# CONFIG_FEATURE_MOUNT_NFS is not set
+# CONFIG_FEATURE_UTMP is not set
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 7d2a7b2..7c9e5ea 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -32,12 +32,14 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://0002-Passthrough-r-to-linker.patch \
+           file://0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
            file://resize.cfg \
 "
+SRC_URI_append_libc-musl = " file://musl.cfg "
 
 SRC_URI[tarball.md5sum] = "be98a40cadf84ce2d6b05fa41a275c6a"
 SRC_URI[tarball.sha256sum] = "37d03132cc078937360b392170b7a1d0e5b322eee9f57c0b82292a8b1f0afe3d"
-- 
2.6.3


