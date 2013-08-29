Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A75CC6BF08
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:12 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so346581eaj.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=BZ9+iB+z7BDQahUckByOcAGy4VrtVa9xgUKvh+aPv9o=;
	b=J6wY8bMM5WO67SI9Adr0rztHuXhXTUGtP5416SLH1vyCxx2lG1Q/BpvaIuNveofeI+
	swwj5H8VOenbMBbRvrojXHnobaZ/T2S43XlwdmEbDfApIIOC9yKrVkWikC+cO7jlcGGb
	DLhj9+IsWYwfQ3AQdq13s1aYNxUD/eX2vVhbrkxET/96hRbiK3HOFLaSTRhWxByny26n
	DBtvKf1qnMJoGuy3i0KVopVPLgQI9wv6H7PxzySXOxHKqP9AXivZqEWod2DBXgPxI/CR
	WxIZOcripux42KDGCJ5IncM4pRPZUM6ABky2fSG3zspmYdEvjW1bJAM/q6c7fHJfKPbP
	gfLA==
X-Received: by 10.14.9.72 with SMTP id 48mr5359628ees.42.1377792133104;
	Thu, 29 Aug 2013 09:02:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm47235098eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:01 +0200
Message-Id: <57d83569337ca4ab56403f78915489226d9c0bcd.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 14/20] consolekit: Add patch to explicitly disable polkit when not enabled
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../allow.to.disable.polkit.support.patch          | 33 ++++++++++++++++++++++
 .../recipes-support/consolekit/consolekit_0.4.6.bb |  4 +--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/consolekit/consolekit/allow.to.disable.polkit.support.patch

diff --git a/meta/recipes-support/consolekit/consolekit/allow.to.disable.polkit.support.patch b/meta/recipes-support/consolekit/consolekit/allow.to.disable.polkit.support.patch
new file mode 100644
index 0000000..e1a868b
--- /dev/null
+++ b/meta/recipes-support/consolekit/consolekit/allow.to.disable.polkit.support.patch
@@ -0,0 +1,33 @@
+Polkit is autodetected from sysroot.
+
+We need to explicitly disable it to get deterministic behavior
+when following sequence is used:
+bitbake consolekit
+bitbake polkit
+bitbake consolekit
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/configure.ac	2013-08-26 15:43:00.770168252 +0200
++++ b/configure.ac	2013-08-26 15:45:15.816173094 +0200
+@@ -56,13 +56,16 @@
+   gthread-2.0 >= $GLIB_REQUIRED_VERSION
+ )
+ 
+-PKG_CHECK_MODULES(POLKIT,
++AC_ARG_ENABLE(polkit,
++	[AS_HELP_STRING([--enable-polkit],[build polkit support])],
++[PKG_CHECK_MODULES(POLKIT,
+   polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
+   have_polkit=yes,
+   have_polkit=no)
+ if test "x$have_polkit" = "xyes" ; then
+        AC_DEFINE(HAVE_POLKIT, [], [Define if we have polkit])
+-fi
++fi], [have_polkit=no])
++  
+ AM_CONDITIONAL(HAVE_POLKIT, test x$have_polkit = xyes)
+ AC_SUBST(HAVE_POLKIT)
+ 
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 63da028..7f05389 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -12,6 +12,7 @@ RDEPENDS_${PN} += "base-files"
 inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
+           file://allow.to.disable.polkit.support.patch \
            file://sepbuildfix.patch"
 
 SRC_URI[md5sum] = "611792b4d616253a5bdec9175f8b7678"
@@ -23,8 +24,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
-# No option to turn it on or off, so rely on the build dependency for now.
-PACKAGECONFIG[policykit] = ",,polkit"
+PACKAGECONFIG[policykit] = "--enable-polkit,--disable-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
 
 FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
-- 
1.8.3.2


