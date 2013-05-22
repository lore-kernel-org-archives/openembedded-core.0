Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6A33C60657
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 22:05:23 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so2165238pbb.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=OjVgS2hIBOmqmy6h1rE8f+loY/RG1+TRIxQ9FinOY+k=;
	b=lT06rqx4Kj832gLKU/dIyMFrpPLCUD7TQMWF2GD9eQbXDWmRlHnLn+/xcejRbwLiyF
	RgWFQN8HTyGlV54RBsuvtvyeoYb+aOx8z6duA7Nb/fdmBSfoGaZLx2ka5WshyUR0EkiC
	LZMMr1AsUG6iYplJX5FBVOjiz8GiFC/qqUQMZIDDzK8H2xUSMn9JKHx7Wc95ocy/xv9X
	8k/si+OvudeBHSVI1wuTNxcbMYCbm2VPLebsrl5HDqPwtFQUFhrIy9a/312MEXmdnbKA
	2xO1XR2PHpLJlxxRnOHPHWlWnqXvB4Uxxn40bWw50RgBqypn+W+7aqAtQPMMSQN4C20H
	jj4w==
X-Received: by 10.66.189.99 with SMTP id gh3mr10280505pac.63.1369260324503;
	Wed, 22 May 2013 15:05:24 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id qp4sm8734701pbc.41.2013.05.22.15.05.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 15:05:23 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 08:18:21 +1000
Message-Id: <1369261101-27731-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2] busybox: backport sulogin empty root password fix
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
X-List-Received-Date: Wed, 22 May 2013 22:05:23 -0000

This allows system maintenance login if the root password is empty.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../busybox-sulogin-empty-root-password.patch      | 58 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
new file mode 100644
index 0000000..baad298
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+From b6dc13c2d3754704b1bf5af4e6b957b48585102f Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Tue, 21 May 2013 17:01:55 +0200
+Subject: [PATCH] sulogin: allow system maintenance login if root password is
+ empty
+
+The current password checking is unable to distinguish between the user
+entering an empty password or pressing Control-D. As a result, an empty
+password always results in normal startup.
+
+We modify bb_ask to return NULL if Control-D is pressed without entering
+a password. The sulogin applet is then modified to only proceed to
+normal startup if bb_ask returns NULL. This covers EOF with no password,
+interrupt by timeout and ^C.
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ libbb/bb_askpass.c   | 4 +++-
+ loginutils/sulogin.c | 4 ++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/libbb/bb_askpass.c b/libbb/bb_askpass.c
+index fe2b506..77c1bcd 100644
+--- a/libbb/bb_askpass.c
++++ b/libbb/bb_askpass.c
+@@ -65,7 +65,9 @@ char* FAST_FUNC bb_ask(const int fd, int timeout, const char *prompt)
+ 	i = 0;
+ 	while (1) {
+ 		int r = read(fd, &ret[i], 1);
+-		if (r < 0) {
++		if ((i == 0 && r == 0) /* EOF (^D) with no password */
++		 || r < 0
++		) {
+ 			/* read is interrupted by timeout or ^C */
+ 			ret = NULL;
+ 			break;
+diff --git a/loginutils/sulogin.c b/loginutils/sulogin.c
+index f79802a..65e6384 100644
+--- a/loginutils/sulogin.c
++++ b/loginutils/sulogin.c
+@@ -83,8 +83,8 @@ int sulogin_main(int argc UNUSED_PARAM, char **argv)
+ 		cp = bb_ask(STDIN_FILENO, timeout,
+ 				"Give root password for system maintenance\n"
+ 				"(or type Control-D for normal startup):");
+-
+-		if (!cp || !*cp) {
++		if (!cp) {
++			/* ^D, ^C, timeout, or read error */
+ 			bb_info_msg("Normal startup");
+ 			return 0;
+ 		}
+-- 
+1.8.2.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 1445a5e..07d722d 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://testsuite-du-du-k-works-fix-false-positive.patch \
            file://strict-atime.patch \
            file://fail_on_no_media.patch \
+           file://busybox-sulogin-empty-root-password.patch \
            file://inetd.conf \
            file://inetd"
 
-- 
1.8.2.3


