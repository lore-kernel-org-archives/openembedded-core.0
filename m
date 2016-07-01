Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E16C560124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 19:30:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2016 12:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,558,1459839600"; d="scan'208";a="1009140642"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.12.103])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2016 12:30:36 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 20:30:33 +0100
Message-Id: <1467401433-2237-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1467401433-2237-1-git-send-email-joshua.g.lock@intel.com>
References: <1467401433-2237-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] pseudo: upgrade to 1.8.0
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
X-List-Received-Date: Fri, 01 Jul 2016 19:30:38 -0000

* drop patches where the changes exist upstream
* fetch from git as no tarball is available for 1.8.0

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../pseudo/files/handle-remove-xattr.patch         | 36 ---------
 .../pseudo/pseudo/obey-ldflags.patch               | 50 -------------
 .../pseudo/pseudo-glibc-rtld-next-workaround.patch | 85 ----------------------
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       | 23 ------
 meta/recipes-devtools/pseudo/pseudo_1.8.0.bb       | 14 ++++
 5 files changed, 14 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.0.bb

diff --git a/meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch b/meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch
deleted file mode 100644
index 8b7f30c..0000000
--- a/meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a24cf102967a4966bfabe36c3542fb65f35bf539 Mon Sep 17 00:00:00 2001
-From: Peter Seebach <peter.seebach@windriver.com>
-Date: Wed, 23 Mar 2016 11:55:25 -0500
-Subject: actually handle remove_xattr correctly
-
-The path is required but wasn't being extracted from the client's message,
-resulting in xattr removal never working. This does not fully address some
-deeper problems with the xattr implementation, but at least the common
-removal case works.
-
-Upstream-Status: Backport
-
-Index: pseudo-1.7.5/ChangeLog.txt
-===================================================================
---- pseudo-1.7.5.orig/ChangeLog.txt
-+++ pseudo-1.7.5/ChangeLog.txt
-@@ -1,3 +1,7 @@
-+2016-03-22:
-+       * (seebs) extract path from message for remove_xattr so it
-+         actually works.
-+
- 2016-02-09:
-         * (seebs) 1.7.5 release
- 
-Index: pseudo-1.7.5/pseudo.c
-===================================================================
---- pseudo-1.7.5.orig/pseudo.c
-+++ pseudo-1.7.5/pseudo.c
-@@ -543,6 +543,7 @@ pseudo_op(pseudo_msg_t *msg, const char
- 		case OP_GET_XATTR:
- 		case OP_LIST_XATTR:
- 		case OP_REPLACE_XATTR:
-+		case OP_REMOVE_XATTR:
- 		case OP_SET_XATTR:
- 			/* In a rename there are two paths, null separated in msg->path */
- 			initial_len = strlen(msg->path);
diff --git a/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
deleted file mode 100644
index 8881f6e..0000000
--- a/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0ace81a687355a3c55caa161b51972a82f5c413f Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Mon, 9 May 2016 17:00:57 -0700
-Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS
-
-Upstream-Status: Backport
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
----
- Makefile.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6511814..22ef625 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -109,26 +109,26 @@ pseudo: $(PSEUDO)
- $(PSEUDO): $(BIN) pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_server.o pseudo_ipc.o
- 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDO) \
- 		pseudo.o pseudo_server.o pseudo_client.o pseudo_ipc.o \
--		$(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
-+		$(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
- 
- pseudolog: $(PSEUDOLOG)
- 
- $(PSEUDOLOG): $(BIN) pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_ipc.o
- 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) pseudolog.o pseudo_client.o pseudo_ipc.o \
--		$(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
-+		$(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
- 
- pseudodb: $(PSEUDODB)
- 
- $(PSEUDODB): $(BIN) pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o
- 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDODB) pseudodb.o \
--		$(DBOBJS) $(SHOBJS) pseudo_ipc.o $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
-+		$(DBOBJS) $(SHOBJS) pseudo_ipc.o $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
- 
- libpseudo: $(LIBPSEUDO)
- 
- $(LIBPSEUDO): $(LIB) $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS)
- 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_ipc.o \
--		$(WRAPOBJS) $(SHOBJS) $(CLIENT_LDFLAGS)
-+		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
- 
- # *everything* now relies on stuff that's generated in the
- # wrapper process.
--- 
-2.8.0
-
diff --git a/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch b/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
deleted file mode 100644
index 6710734..0000000
--- a/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-We started seeing:
-
-No real function for mknod: /home/paul/poky_sdk/tmp/sysroots/x86_64-
-linux/usr/bin/../lib/pseudo/lib64/libpseudo.so: undefined symbol: mknod
-No real function for mknodat: /home/paul/poky_sdk/tmp/sysroots/x86_64-
-linux/usr/bin/../lib/pseudo/lib64/libpseudo.so: undefined symbol: mknodat
-
-In glibc 2.24 they've merged:
-
-https://sourceware.org/git/?p=glibc.git;a=commit;h=7d45c163d00c88d5875a112343c4ea3e61349e6b
-related to bugzilla entry:
-https://sourceware.org/bugzilla/show_bug.cgi?id=19509
-
-which means that the behaviour of RTLD_NEXT is slightly different.
-As far as I can tell, mknod has not been present in glibc for a while. 
-To quote stat.h:
-
-/* To allow the `struct stat' structure and the file type `mode_t'
-   bits to vary without changing shared library major version number,
-   the `stat' family of functions and `mknod' are in fact inline
-   wrappers around calls to `xstat', `fxstat', `lxstat', and `xmknod',
-   which all take a leading version-number argument designating the
-   data structure and bits used.  <bits/stat.h> defines _STAT_VER with
-   the version number corresponding to `struct stat' as defined in
-   that file; and _MKNOD_VER with the version number corresponding to
-   the S_IF* macros defined therein.  It is arranged that when not
-   inlined these function are always statically linked; that way a
-   dynamically-linked executable always encodes the version number
-   corresponding to the data structures it uses, so the `x' functions
-   in the shared library can adapt without needing to recompile all
-   callers.  */
-
-so I suspect mknod has not existed for a while, if ever and what we
-were finding, who knows. Everying in the system links against _xmknod
-which we have a separate wrapper for.
-
-Anyhow, ignoring that problem which hasn't caused a issue in the past, 
-the RTLD_NEXT change causes messages to be printed to stdout which causes 
-carnage if for example the packaging code is expecting a list of packages:
-
-WARNING: core-image-minimal-1.0-r0 do_rootfs: No not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
-WARNING: core-image-minimal-1.0-r0 do_rootfs: real not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
-WARNING: core-image-minimal-1.0-r0 do_rootfs: function not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
-WARNING: core-image-minimal-1.0-r0 do_rootfs: for not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
-WARNING: core-image-minimal-1.0-r0 do_rootfs: mknod: not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
-[etc]
-
-This bug will affect:
-* any distro using glibc 2.24
-* any system using a uninative tarball for glibc 2.24
-* any system which took a backport for the fix which was merged into
-  the 2.23 branch for a while before it was reverted (Fedora 23 had this)
-
-The easiest thing to do is to ignore the problem and disable the diag
-message which masks the problem with no ill effects.
-
-As Peter notes, there are a few issues here:
-
-* the fact there is no mknod symbol
-* the fact an error here isn't fatal
-* the #ifdef/#else looks suspect
-* handle RTLD_NEXT chaining properly (need more libs?)
-
-which he'll work on upstream and hopefully have fixed in a new version.
-
-Upstream-Status: Submitted [Peter is aware of the issue]
-
-RP 2016/5/18
-
-Index: pseudo-1.7.5/pseudo_wrappers.c
-===================================================================
---- pseudo-1.7.5.orig/pseudo_wrappers.c
-+++ pseudo-1.7.5/pseudo_wrappers.c
-@@ -146,9 +146,9 @@ pseudo_init_one_wrapper(pseudo_function
- 			return;
- 		}
- #else
--		if (e != NULL) {
-+		/*if (e != NULL) {
- 			pseudo_diag("No real function for %s: %s\n", func->name, e);
--		}
-+		}*/
- #endif
- 	}
- }
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
deleted file mode 100644
index d4f1e36..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require pseudo.inc
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
-           file://0001-configure-Prune-PIE-flags.patch \
-           file://fallback-passwd \
-           file://fallback-group \
-           file://moreretries.patch \
-           file://handle-remove-xattr.patch \
-           file://obey-ldflags.patch \
-           file://pseudo-glibc-rtld-next-workaround.patch \
-           "
-
-SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
-SRC_URI[sha256sum] = "fd89cadec984d3b8202aca465898b1bb4350e0d63ba9aa9ac899f6f50270e688"
-
-PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
-
-do_install_append_class-native () {
-	install -d ${D}${sysconfdir}
-	# The fallback files should never be modified
-	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
-}
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
new file mode 100644
index 0000000..08477ff
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
@@ -0,0 +1,14 @@
+require pseudo.inc
+
+SRCREV = "786c6d3813622d18e12d36c4aa722af6a417c8fa"
+PV = "1.8.0+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/pseudo \
+           file://0001-configure-Prune-PIE-flags.patch \
+           file://fallback-passwd \
+           file://fallback-group \
+           file://moreretries.patch \
+           "
+
+S = "${WORKDIR}/git"
+
-- 
2.7.4


