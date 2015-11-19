Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4A26080F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:10 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so27770552qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kZeRaqoT2J9EgoaizrwRzvHn9SnlIxuKSHUmJll99pQ=;
	b=oGK5AescbUqb1tIjYbwkEfufY8i+A7iQ7OyINXxWtz1+GBxiVICH4WE0sZlEqusBdu
	0fI94SEmJoVspurwgD2ztK0OR3r1Des3WfaC5ZVcnTgelByesS7IfOdw1fVoUfw3tGvc
	Z0qaRhrrC22ylFXHJm747iJUuNJzjFIUTyVtj3MP9CTQcVNK4Dzim8zUYh49vGXoZHhu
	SUQrX562rrOntzQkd4LzQj6S+mOvA2g090OO7SWuXUTE7CK5ggfPgU7cWpKe7W2LvtaZ
	lBbd65d4c1SwhjvsnOHvhnB+jrRfBpuxCRnq2ETF5E858G3fBo7eBHKpGfHTT0PNLXjr
	xFww==
X-Received: by 10.55.79.207 with SMTP id d198mr7832979qkb.49.1447953070715;
	Thu, 19 Nov 2015 09:11:10 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:57 +0000
Message-Id: <358d1db2e9f434ff493cae0e5808fed7dd5aafa2.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:10 -0000

Default config is enabling additional features that dont compile with
musl so lets disable them for musl case and use posix compliant
getpwent()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...user-use-POSIX-getpwent-instead-of-getpwe.patch | 71 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox/musl.cfg         | 12 ++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  2 +
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
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 2559823..9779788 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -39,7 +39,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
+           file://0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch \
 "
+SRC_URI_append_libc-musl = " file://musl.cfg "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
 SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
-- 
2.6.3


