Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9482C6A35D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 04:57:40 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 10so1313285pdc.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 21:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a7wtPj/ZQzIpx1vcVwEzGN9Me3Or1XCb+NLzyUKgVEk=;
	b=IL/kl5x8ap4n8It6/5YylbvdV953ubxSU+RUEoKdN5tyWa7ZaOy16OAehhp/WXNBiU
	T5ZF+98YVtqsDJwljT1Yu7vODfEj8ApRtnN5CTcwmkOgIBja2p0Fa4qBZJwvMfWCzdHJ
	TqKCFdP3XmLgJZOntLjm3p+yDpBxrmY5A/CjNOOGgN4QOCVxW43LQzYNtmKfs5aG4jWA
	tliGYSXgJSz14dSs0xCyX1Ph9yQwE+cl/RwPWJ43sLq51EMx4BC7g6aiPNrluJsIUMT2
	tXhuw6PkcpJrMmJErX/DwUnL4H++1eVa9fQ//8mZsD1/d6ft/bukpmkcBBkbhDH/vv4P
	89OA==
X-Received: by 10.68.239.132 with SMTP id vs4mr5898062pbc.147.1369198661740;
	Tue, 21 May 2013 21:57:41 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ov2sm5604374pbc.34.2013.05.21.21.57.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 21:57:40 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 15:10:43 +1000
Message-Id: <1369199443-3441-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] busybox: backport sulogin empty root password fix
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
X-List-Received-Date: Wed, 22 May 2013 04:57:40 -0000

This allows system maintenance login if the root password is empty.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../busybox-sulogin-empty-root-password.patch      | 58 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
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
index 1445a5e..91510d6 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -33,6 +33,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://testsuite-du-du-k-works-fix-false-positive.patch \
            file://strict-atime.patch \
            file://fail_on_no_media.patch \
+           file://busybox-sulogin-empty-root-password.patch \
            file://inetd.conf \
            file://inetd"
 
-- 
1.8.2.3


