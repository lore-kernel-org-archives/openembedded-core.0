Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 346E96E9AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 17:28:35 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id m10so1953297eaj.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 09:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0WZWEwKeDsAp9d/VoC6NvvowVN6VwteueSX6BazbdOE=;
	b=MXq968Wi8rvO9L8KIOg38PQG7Fg39Jz8o+CyLznkI4fMbaQMESAcsPXaaJQRDusGG0
	432/cMd0D7D3j4O5ztiBMDY8Uw61xGpRidJ+cIvqekuACJhMEv7828oX/wkXTS4ggIhM
	9JyVtzb7Xg8/g2dAngmMlNdi4T2OueGtASjs4bV0qyGDbG5vduIOnMLfqCupQ8OuvRJp
	TBoXmxnEnjdX8Y7yJCZJXmpbk5yO58NgoTter/uSqDvdeQ/qaDrXHhFwnNSwRCyOoTpj
	/ctAqNHdZlxE74tYtAfWBWJUNb1MebsV3/cJepkOdgkr8/xzTF59cJFVdL4e6fcNM1Ba
	64QQ==
X-Received: by 10.14.225.195 with SMTP id z43mr15411899eep.19.1393090115943;
	Sat, 22 Feb 2014 09:28:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm39346702eeh.13.2014.02.22.09.28.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 09:28:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2014 18:29:09 +0100
Message-Id: <1393090150-28187-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <20140222120340.GM3854@jama>
References: <20140222120340.GM3854@jama>
Subject: [meta-oe][PATCH] polkit: make it compatible with systemd-209
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
X-List-Received-Date: Sat, 22 Feb 2014 17:28:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 39 ++++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.111.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
new file mode 100644
index 0000000..b9334a8
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
@@ -0,0 +1,39 @@
+From 56cadbc45c5ef98a7b775638d2109c4a09a58c06 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 22 Feb 2014 18:09:57 +0100
+Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
+
+* they were merged into libsystemd in systemd-209
+
+Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a7b0148..64d513d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,7 +196,7 @@ AC_ARG_ENABLE([libsystemd-login],
+               [enable_libsystemd_login=auto])
+ if test "$enable_libsystemd_login" != "no"; then
+   PKG_CHECK_MODULES(LIBSYSTEMD_LOGIN,
+-                    [libsystemd-login],
++                    [libsystemd],
+                     have_libsystemd_login=yes,
+                     have_libsystemd_login=no)
+   if test "$have_libsystemd_login" = "yes"; then
+@@ -223,7 +223,7 @@ AS_IF([test "x$cross_compiling" != "xyes" ], [
+       AS_IF([test "$enable_libsystemd_login" = "no" ], [
+         AC_MSG_WARN([ConsoleKit requested but system appears to use systemd])
+       ], [
+-        AC_MSG_ERROR([ConsoleKit autoconfigured, but systemd is in use (missing libsystemd-login pkg-config?)])
++        AC_MSG_ERROR([ConsoleKit autoconfigured, but systemd is in use (missing libsystemd pkg-config?)])
+       ])
+     ])
+   ])
+-- 
+1.8.5.3
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.111.bb b/meta-oe/recipes-extended/polkit/polkit_0.111.bb
index 33101cf..4614387 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.111.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.111.bb
@@ -20,6 +20,7 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
 "
 
 SRC_URI[md5sum] = "81b116edf986d8e13502929a171f4e0d"
-- 
1.8.5.3


