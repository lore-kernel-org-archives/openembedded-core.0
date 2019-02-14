Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id ADFEA7C617
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 16:15:33 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x1EGFWnI010121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 14 Feb 2019 17:15:33 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.77])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x1EGFWAF001470;
	Thu, 14 Feb 2019 17:15:33 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B791F10D47AA;
	Thu, 14 Feb 2019 17:15:32 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 17:15:29 +0100
Message-Id: <20190214161529.25843-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] nfs-utils: build tools with target compiler
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
X-List-Received-Date: Thu, 14 Feb 2019 16:15:35 -0000

Some tools were built with CC_FOR_BUILD which points to the target
compiler. The current patch avoided issues by deleting some of the
binaries during install.

This patch replaces the CC_FOR_BUILD with CC so the tools are built with
the target compiler. This means the binaries no longer need to be
deleted.

I stumbled upon this by trying to globally add "--ffile-prefix-map", which
is not supported by my host GCC, to get rid of some "buildpaths" QA Warnings.

Cc: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../0001-Don-t-build-tools-with-CC_FOR_BUILD.patch | 40 +++++++++++++++++++++
 ...-Do-not-pass-CFLAGS-to-gcc-while-building.patch | 42 ----------------------
 .../nfs-utils/nfs-utils_2.3.3.bb                   |  7 +---
 3 files changed, 41 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
new file mode 100644
index 0000000000..23bc3eaf72
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
@@ -0,0 +1,40 @@
+From 79019d976584c598f8d0a9d8de43c989946f974b Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Wed, 13 Feb 2019 09:28:07 +0100
+Subject: [PATCH] Don't build tools with CC_FOR_BUILD
+
+The tools are intended for the target not for the host.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+---
+ tools/locktest/Makefile.am | 1 -
+ tools/rpcgen/Makefile.am   | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index 3156815..87d0bac 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -1,6 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-CC=$(CC_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = testlk
+diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
+index 8a9ec89..3e092c9 100644
+--- a/tools/rpcgen/Makefile.am
++++ b/tools/rpcgen/Makefile.am
+@@ -1,6 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-CC=$(CC_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = rpcgen
+-- 
+2.11.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
deleted file mode 100644
index 993f1e5ea5..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-nfs-utils: Do not pass CFLAGS to gcc while building
-
-Do not pass CFLAGS/LDFLAGS to gcc while building, The needed flags has
-been passed by xxx_CFLAGS=$(CFLAGS_FOR_BUILD).
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- tools/locktest/Makefile.am |    2 ++
- tools/rpcgen/Makefile.am   |    2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index 3156815..1729fd1 100644
---- a/tools/locktest/Makefile.am
-+++ b/tools/locktest/Makefile.am
-@@ -1,6 +1,8 @@
- ## Process this file with automake to produce Makefile.in
- 
- CC=$(CC_FOR_BUILD)
-+CFLAGS=
-+LDFLAGS=
- LIBTOOL = @LIBTOOL@ --tag=CC
- 
- noinst_PROGRAMS = testlk
-diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
-index 8a9ec89..8bacdaa 100644
---- a/tools/rpcgen/Makefile.am
-+++ b/tools/rpcgen/Makefile.am
-@@ -1,6 +1,8 @@
- ## Process this file with automake to produce Makefile.in
- 
- CC=$(CC_FOR_BUILD)
-+CFLAGS=
-+LDFLAGS=
- LIBTOOL = @LIBTOOL@ --tag=CC
- 
- noinst_PROGRAMS = rpcgen
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 84530f698b..ac4437b925 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -26,7 +26,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-mountd.service \
            file://nfs-statd.service \
            file://proc-fs-nfsd.mount \
-           file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
            file://nfs-utils-musl-limits.patch \
@@ -35,6 +34,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://clang-format-string.patch \
            file://0001-Makefile.am-update-the-path-of-libnfs.a.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
+           file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
 "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
@@ -147,11 +147,6 @@ do_install_append () {
 	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
 	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
 
-	# the following are built by CC_FOR_BUILD
-	rm -f ${D}${sbindir}/rpcdebug
-	rm -f ${D}${sbindir}/rpcgen
-	rm -f ${D}${sbindir}/locktest
-
         # Make python tools use python 3
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}/mountstats ${D}${sbindir}/nfsiostat
 
-- 
2.11.0


