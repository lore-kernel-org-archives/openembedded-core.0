Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 170196B678
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 16:16:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8KGUxtn028391 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 17:30:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1n9OPYN6hHGd
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 17:30:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8KGUtvh028387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 17:30:57 +0100
Message-ID: <1379693778.18603.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2013 17:16:18 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] btrfs-tools: Fix parallel make issue
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
X-List-Received-Date: Fri, 20 Sep 2013 16:16:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

btrfs-tools was failing occasionally due to version.h being missing. This
fixes the problems, thanks to several people on #yocto for helping out
why my lack of make knowledge of old fashioned suffix rules :)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build2.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build2.patch
new file mode 100644
index 0000000..af1a760
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build2.patch
@@ -0,0 +1,27 @@
+btrfs-progs: Fix parallel build
+
+Upstream-Status: Pending
+
+"make btrfs.o" fails unable to find version.h.
+
+This adds version.h as a dependency for all .o files and fixes various parallel 
+build failures.
+
+RP 20/9/2013
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2013-09-20 14:45:34.307723221 +0000
++++ git/Makefile	2013-09-20 16:06:45.503611030 +0000
+@@ -76,7 +76,7 @@
+ 	check = true
+ endif
+ 
+-.c.o:
++%.o: %.c version.h
+ 	$(Q)$(check) $<
+ 	@echo "    [CC]     $@"
+ 	$(Q)$(CC) $(DEPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c $<
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index fe6a35a..2d2d555 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -21,6 +21,7 @@ PV = "0.20+git${SRCPV}"
 
 SRC_URI += "file://weak-defaults.patch"
 SRC_URI += "file://btrfs-progs-fix-parallel-build.patch"
+SRC_URI += "file://btrfs-progs-fix-parallel-build2.patch"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install



