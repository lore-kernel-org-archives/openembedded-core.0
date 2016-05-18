Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0D576F8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 18:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4IIVSpQ030079; Wed, 18 May 2016 19:31:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NqWj0aFkp7q2; Wed, 18 May 2016 19:31:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4IIVMPs030076
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 May 2016 19:31:23 +0100
Message-ID: <1463596282.4578.71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 19:31:22 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] pseudo: Work around issues with glibc 2.24
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
X-List-Received-Date: Wed, 18 May 2016 18:31:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are issues with a change made to RTLD_NEXT behaviour in glibc 2.24
and that change was also backported to older glibc versions in some distros
like Fedora 23. This adds a workaround whilst the pseudo maintainer fixes
various issues properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

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
index dfb9b39..d4f1e36 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://moreretries.patch \
            file://handle-remove-xattr.patch \
            file://obey-ldflags.patch \
+           file://pseudo-glibc-rtld-next-workaround.patch \
            "
 
 SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"



