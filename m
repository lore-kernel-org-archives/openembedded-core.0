Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA1F65CC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:19:17 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id q2so34714452obl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZvJlDaPCCCuTPiA0Ud75snQ4GbGIHvcF+ahHj/qpYqA=;
	b=JbezSu6rE0n+ZTLyVWnGJGSr9ZAZaf8vrmZvjHI0Hbyfk1YyR64K9Jm6+dHeCPXmMa
	rvoGaQxLOH6jft1Dpyv4W6o8t+StLUIvTyIOk2gaz36PrkpblP1za+pkwohxrtTrVHKY
	uKGAQoZCoK4W5vVSVUdhdw3G6XH09ECR0vk5+siUngkV5AUW7gekdN3Xp4uEgCt1MKfO
	QHCRJdDvVaYAI2F4Sarq2PugdQxXDfw60QB+OgXHooaovOlJQyAFBtJ+sFzWCtPV5W/K
	buoirulHA6T0JYvBEI4vNGuD1uq9pmZCcluDc14VKwMIc36EVl0RGXXkGTyiw6rqZddu
	HfxA==
X-Received: by 10.182.108.229 with SMTP id hn5mr99055559obb.75.1452583157808; 
	Mon, 11 Jan 2016 23:19:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	d2sm49992973oic.12.2016.01.11.23.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 23:19:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 23:18:33 -0800
Message-Id: <1452583117-812-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/5] strace: drop unnecessary dependency on acl
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:17 -0000

The dependency on acl was removed from strace prior to the v4.10
release, so it's no longer necessary to add a configure option to
allow acl to be disabled.

  http://sourceforge.net/p/strace/code/ci/681452b0f854833d4bd443fcd9bb0bab2b46339f

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../strace/strace-add-configure-options.patch      | 24 ++--------------------
 meta/recipes-devtools/strace/strace_4.10.bb        |  3 +--
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
index e48e4b3..a3f8ec4 100644
--- a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
@@ -1,4 +1,4 @@
-Add options "aio" and "acl" to enable/disable libaio and acl support.
+Add option "aio" to enable/disable libaio support.
 
 Upstream-Status: Pending
 
@@ -12,26 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e73958c..9099370 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -270,6 +270,18 @@ AC_CHECK_HEADERS(m4_normalize([
- 	sys/vfs.h
- 	sys/xattr.h
- ]))
-+
-+AC_ARG_ENABLE([acl],
-+	[AS_HELP_STRING([--enable-acl], [turn on acl support])],
-+	[case $enableval in
-+	yes)
-+		AC_CHECK_HEADERS([sys/acl.h])
-+		;;
-+	no)  ;;
-+	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
-+	esac]
-+)
-+
- AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
-                  [], [], [#include <stddef.h>
- #include <sys/socket.h>
-@@ -745,6 +757,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes; then
+@@ -745,6 +745,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
  fi
  AC_SUBST(dl_LIBS)
  
@@ -54,4 +35,3 @@ index e73958c..9099370 100644
  dnl stack trace with libunwind
 --
 1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 20b7e3d..fe250b7 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -21,12 +21,11 @@ inherit autotools ptest bluetooth
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
 
 PACKAGECONFIG_class-target ??= "\
-    libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    libaio \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
 
-- 
1.9.1


