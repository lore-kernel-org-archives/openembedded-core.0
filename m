Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC6C758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7HBsUuI003197 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 12:54:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Vufc8K3ZzRio
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 12:54:30 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7HBsRVV003192
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 12:54:28 +0100
Message-ID: <1471434867.20391.163.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 12:54:27 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] busybox: Backport makefile fix from upstream
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
X-List-Received-Date: Wed, 17 Aug 2016 11:54:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This at least partially addresses one of the build races we've seen
on the autobuilder in busybox. Its a straightforward backport from 
upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch b/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
new file mode 100644
index 0000000..2e9842e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
@@ -0,0 +1,40 @@
+From 9e5820a86277818c2f83c11c2aa76d7f0a38283e Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 14 Aug 2016 02:54:27 +0200
+Subject: build system: fix include/NUM_APPLETS.h generation
+
+TBH, it's more like "work around my bad makefile-fu" than "fix"...
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ applets/Kbuild.src | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/applets/Kbuild.src b/applets/Kbuild.src
+index b612399..5cc1827 100644
+--- a/applets/Kbuild.src
++++ b/applets/Kbuild.src
+@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h include/applet_tables.h
+ 
+ applets/applet_tables: .config include/applets.h
+ applets/usage:         .config include/applets.h
+-applets/usage_pod:     .config include/applet_tables.h include/applets.h
++applets/usage_pod:     .config include/applets.h include/applet_tables.h include/NUM_APPLETS.h
+ 
+ quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
+       cmd_gen_usage_compressed = $(srctree_slash)applets/usage_compressed include/usage_compressed.h applets
+@@ -40,8 +40,5 @@ include/usage_compressed.h: applets/usage $(srctree_slash)applets/usage_compress
+ quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h
+       cmd_gen_applet_tables = applets/applet_tables include/applet_tables.h include/NUM_APPLETS.h
+ 
+-include/applet_tables.h: applets/applet_tables
+-	$(call cmd,gen_applet_tables)
+-
+-include/NUM_APPLETS.h: applets/applet_tables
++include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
+ 	$(call cmd,gen_applet_tables)
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index d3dc2a2..7edd32d 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2016-2147.patch \
            file://CVE-2016-2147_2.patch \
            file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
+           file://makefile-fix-backport.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 



