Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id A854071A2B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:09:01 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1c00Le-0007xp-UF; Fri, 28 Oct 2016 08:09:02 +0200
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.87)
	(envelope-from <ejo@pengutronix.de>)
	id 1c00Le-0000LI-D9; Fri, 28 Oct 2016 08:09:02 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 08:09:02 +0200
Message-Id: <20161028060902.1133-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.9.3
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH][krogoth] pseudo: backport 'Work around issues with glibc 2.24'
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
X-List-Received-Date: Fri, 28 Oct 2016 06:09:04 -0000

This patch is required for krogoth, too in order to make it properly
work with glibc 2.24.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>

Below the message of the original commit:

There are issues with a change made to RTLD_NEXT behaviour in glibc 2.24
and that change was also backported to older glibc versions in some distros
like Fedora 23. This adds a workaround whilst the pseudo maintainer fixes
various issues properly.

(From OE-Core rev: 21c38a091c4a1917f62a942c4751b0fd11dce340)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-jupiter                                       |  2 +-
 .../pseudo/pseudo-glibc-rtld-next-workaround.patch | 85 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       |  1 +
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch

diff --git a/meta-jupiter b/meta-jupiter
index a1299a3..5a66c62 160000
--- a/meta-jupiter
+++ b/meta-jupiter
@@ -1 +1 @@
-Subproject commit a1299a3e711c93ed8a7eb652bdbacd83669263c6
+Subproject commit 5a66c628800824585208d0130ee6b731c7e95edd
diff --git a/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch b/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
new file mode 100644
index 0000000..6710734
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
@@ -0,0 +1,85 @@
+We started seeing:
+
+No real function for mknod: /home/paul/poky_sdk/tmp/sysroots/x86_64-
+linux/usr/bin/../lib/pseudo/lib64/libpseudo.so: undefined symbol: mknod
+No real function for mknodat: /home/paul/poky_sdk/tmp/sysroots/x86_64-
+linux/usr/bin/../lib/pseudo/lib64/libpseudo.so: undefined symbol: mknodat
+
+In glibc 2.24 they've merged:
+
+https://sourceware.org/git/?p=glibc.git;a=commit;h=7d45c163d00c88d5875a112343c4ea3e61349e6b
+related to bugzilla entry:
+https://sourceware.org/bugzilla/show_bug.cgi?id=19509
+
+which means that the behaviour of RTLD_NEXT is slightly different.
+As far as I can tell, mknod has not been present in glibc for a while. 
+To quote stat.h:
+
+/* To allow the `struct stat' structure and the file type `mode_t'
+   bits to vary without changing shared library major version number,
+   the `stat' family of functions and `mknod' are in fact inline
+   wrappers around calls to `xstat', `fxstat', `lxstat', and `xmknod',
+   which all take a leading version-number argument designating the
+   data structure and bits used.  <bits/stat.h> defines _STAT_VER with
+   the version number corresponding to `struct stat' as defined in
+   that file; and _MKNOD_VER with the version number corresponding to
+   the S_IF* macros defined therein.  It is arranged that when not
+   inlined these function are always statically linked; that way a
+   dynamically-linked executable always encodes the version number
+   corresponding to the data structures it uses, so the `x' functions
+   in the shared library can adapt without needing to recompile all
+   callers.  */
+
+so I suspect mknod has not existed for a while, if ever and what we
+were finding, who knows. Everying in the system links against _xmknod
+which we have a separate wrapper for.
+
+Anyhow, ignoring that problem which hasn't caused a issue in the past, 
+the RTLD_NEXT change causes messages to be printed to stdout which causes 
+carnage if for example the packaging code is expecting a list of packages:
+
+WARNING: core-image-minimal-1.0-r0 do_rootfs: No not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
+WARNING: core-image-minimal-1.0-r0 do_rootfs: real not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
+WARNING: core-image-minimal-1.0-r0 do_rootfs: function not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
+WARNING: core-image-minimal-1.0-r0 do_rootfs: for not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
+WARNING: core-image-minimal-1.0-r0 do_rootfs: mknod: not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
+[etc]
+
+This bug will affect:
+* any distro using glibc 2.24
+* any system using a uninative tarball for glibc 2.24
+* any system which took a backport for the fix which was merged into
+  the 2.23 branch for a while before it was reverted (Fedora 23 had this)
+
+The easiest thing to do is to ignore the problem and disable the diag
+message which masks the problem with no ill effects.
+
+As Peter notes, there are a few issues here:
+
+* the fact there is no mknod symbol
+* the fact an error here isn't fatal
+* the #ifdef/#else looks suspect
+* handle RTLD_NEXT chaining properly (need more libs?)
+
+which he'll work on upstream and hopefully have fixed in a new version.
+
+Upstream-Status: Submitted [Peter is aware of the issue]
+
+RP 2016/5/18
+
+Index: pseudo-1.7.5/pseudo_wrappers.c
+===================================================================
+--- pseudo-1.7.5.orig/pseudo_wrappers.c
++++ pseudo-1.7.5/pseudo_wrappers.c
+@@ -146,9 +146,9 @@ pseudo_init_one_wrapper(pseudo_function
+ 			return;
+ 		}
+ #else
+-		if (e != NULL) {
++		/*if (e != NULL) {
+ 			pseudo_diag("No real function for %s: %s\n", func->name, e);
+-		}
++		}*/
+ #endif
+ 	}
+ }
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
index d90e644..38e6f4d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     file://fallback-group \
     file://moreretries.patch \
     file://handle-remove-xattr.patch \
+    file://pseudo-glibc-rtld-next-workaround.patch \
 "
 
 SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
-- 
2.9.3


