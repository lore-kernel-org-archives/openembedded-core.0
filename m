Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 131A66E9AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 17:28:38 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so2212802eei.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 09:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pdg7FKnxXnIPplt6g3BGib1r1tIfOeF0NH5yxUsPeHM=;
	b=jLEzkwGTsPea+xtb9axyMwT73Au0ird+6N/XBeR76FlA31dMTkhlVgBXtjkzt/p3LM
	HlzRSHMuUW4qMMnZwN4oJ7shnEk+2IPCa4J1q0CRSM8+gRfqfkbDHv5O9AvfN3+hIxpY
	282KvVNv44TvsGOrZ0noWM016xf7kXwHQmJdpCh0s5eJk4c5bRge7upsMxSMDixM7a9+
	qRVNpm0zk//EFMAuBn3JtbIpecqSiTAa6vzqmEtUgj+j0BHINcUY8UuWHPpqpHdcwKwp
	b2tcmWVukLnzkvU4zHVkGDlaH3uKA+XaR0bUIDNHYYE0rQP6xSNrnJ7eIV4hUOuJ4jze
	UveA==
X-Received: by 10.14.119.197 with SMTP id n45mr15303090eeh.93.1393090118858;
	Sat, 22 Feb 2014 09:28:38 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v6sm41107933eef.2.2014.02.22.09.28.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 09:28:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2014 18:29:10 +0100
Message-Id: <1393090150-28187-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1393090150-28187-1-git-send-email-Martin.Jansa@gmail.com>
References: <20140222120340.GM3854@jama>
	<1393090150-28187-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] pulseaudio: Make it compatible with systemd-209
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
X-List-Received-Date: Sat, 22 Feb 2014 17:28:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_4.0.bb                   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
new file mode 100644
index 0000000..467cd2c
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
@@ -0,0 +1,30 @@
+From 002b16f0f2176b4c685e210e335bf69c02563ede Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 22 Feb 2014 18:03:10 +0100
+Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
+
+* they were merged into libsystemd in systemd-209
+
+Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 388fae2..fff7a83 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1160,7 +1160,7 @@ AC_ARG_ENABLE([systemd],
+     AS_HELP_STRING([--disable-systemd],[Disable optional systemd support]))
+ 
+ AS_IF([test "x$enable_systemd" != "xno"],
+-    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd-login ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
++    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
+     HAVE_SYSTEMD=0)
+ 
+ AS_IF([test "x$enable_systemd" = "xyes" && test "x$HAVE_SYSTEMD" = "x0"],
+-- 
+1.8.5.3
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
index b419c54..53dd494 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
@@ -1,6 +1,7 @@
 require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
+           file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
            file://volatiles.04_pulse"
 
 SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
-- 
1.8.5.3


