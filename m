Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 723E777074
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFSLNn001957 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:28:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wUeggjJgkpU7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:28:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFSHgN001952
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:28:18 +0100
Message-ID: <1471620497.16712.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:28:17 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] busybox: Add parallel make fix
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
X-List-Received-Date: Fri, 19 Aug 2016 15:28:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're seeing regular parallel make failures in applet headers in busybox.
This adds a patch to try and avoid the issue, building upon a fix already
backported from upstream. The patch has been sent to upstream.

[YOCTO #10116]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/busybox/busybox/parallel-make-fix.patch b/meta/recipes-core/busybox/busybox/parallel-make-fix.patch
new file mode 100644
index 0000000..120dff1
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/parallel-make-fix.patch
@@ -0,0 +1,65 @@
+When applet_tables is run, we need it to touch both output files,
+else make will keep calling the command, potentially leading to races
+as the files are potentially rewritten.
+
+We also need to ensure that applet_tables is called once, not twice, 
+potentially in parallel. To do this, make one file depend upon the other.
+
+Upstream-Status: Submitted
+RP 2016/8/19
+
+Index: busybox-1.24.1/applets/Kbuild.src
+===================================================================
+--- busybox-1.24.1.orig/applets/Kbuild.src
++++ busybox-1.24.1/applets/Kbuild.src
+@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compres
+ 
+ applets/applet_tables: .config include/applets.h
+ applets/usage:         .config include/applets.h
+-applets/usage_pod:     .config include/applets.h include/applet_tables.h include/NUM_APPLETS.h
++applets/usage_pod:     .config include/applets.h include/applet_tables.h
+ 
+ quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
+       cmd_gen_usage_compressed = $(srctree_slash)applets/usage_compressed include/usage_compressed.h applets
+@@ -40,5 +40,7 @@ include/usage_compressed.h: applets/usag
+ quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h
+       cmd_gen_applet_tables = applets/applet_tables include/applet_tables.h include/NUM_APPLETS.h
+ 
+-include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
++include/NUM_APPLETS.h: applets/applet_tables
+ 	$(call cmd,gen_applet_tables)
++
++include/applet_tables.h: include/NUM_APPLETS.h
+Index: busybox-1.24.1/applets/applet_tables.c
+===================================================================
+--- busybox-1.24.1.orig/applets/applet_tables.c
++++ busybox-1.24.1/applets/applet_tables.c
+@@ -151,23 +151,15 @@ int main(int argc, char **argv)
+ //	printf("#define MAX_APPLET_NAME_LEN %u\n", MAX_APPLET_NAME_LEN);
+ 
+ 	if (argv[2]) {
+-		char line_old[80];
+ 		char line_new[80];
+ 		FILE *fp;
+ 
+-		line_old[0] = 0;
+-		fp = fopen(argv[2], "r");
+-		if (fp) {
+-			fgets(line_old, sizeof(line_old), fp);
+-			fclose(fp);
+-		}
+ 		sprintf(line_new, "#define NUM_APPLETS %u\n", NUM_APPLETS);
+-		if (strcmp(line_old, line_new) != 0) {
+-			fp = fopen(argv[2], "w");
+-			if (!fp)
+-				return 1;
+-			fputs(line_new, fp);
+-		}
++		fp = fopen(argv[2], "w");
++		if (!fp)
++			return 1;
++		fputs(line_new, fp);
++		fclose(fp);
+ 	}
+ 
+ 	return 0;
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 7edd32d..e8265cd 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2016-2147_2.patch \
            file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
            file://makefile-fix-backport.patch \
+           file://parallel-make-fix.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 



