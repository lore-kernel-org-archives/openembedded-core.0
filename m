Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 74B5260851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543570"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:38 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:18 +0200
Message-Id: <1486734151-28331-11-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 10/23] musl: Fix issues in relative symlink creation
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:38 -0000

Make use of lnr/ln -r while creating relative symlinks than guessing the
relalive path.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 ...dynamic-linker-a-relative-symlink-to-libc.patch | 58 ++++++++++++++++++----
 meta/recipes-core/musl/musl_git.bb                 |  2 +-
 2 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch b/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
index 5490b1c..5161c09 100644
--- a/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
+++ b/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
@@ -1,6 +1,6 @@
-From 94c0b97b62125d8bbc92dce0694e387d5b2ad181 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 10 Jan 2016 12:14:02 -0800
+From 0ec74744a4cba7c5fdfaa2685995119a4fca0260 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 18 Jan 2017 16:14:37 +0200
 Subject: [PATCH] Make dynamic linker a relative symlink to libc
 
 absolute symlink into $(libdir) fails to load in a cross build
@@ -10,25 +10,63 @@ can be computed during cross builds, qemu in usermode often comes to aid
 in such situations to feed into cross builds.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
 ---
 Upstream-Status: Pending
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+---
+ Makefile         | 2 +-
+ tools/install.sh | 8 +++++---
+ 2 files changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index b2226fa..0d71f7f 100644
+index 8246b78..d1dbe39 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -189,7 +189,7 @@ $(DESTDIR)$(includedir)/%: include/%
+@@ -215,7 +215,7 @@ $(DESTDIR)$(includedir)/%: $(srcdir)/include/%
  	$(INSTALL) -D -m 644 $< $@
  
  $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
 -	$(INSTALL) -D -l $(libdir)/libc.so $@ || true
-+	$(INSTALL) -D -l ..$(libdir)/libc.so $@ || true
++	$(INSTALL) -D -r $(DESTDIR)$(libdir)/libc.so $@ || true
  
  install-libs: $(ALL_LIBS:lib/%=$(DESTDIR)$(libdir)/%) $(if $(SHARED_LIBS),$(DESTDIR)$(LDSO_PATHNAME),)
  
+diff --git a/tools/install.sh b/tools/install.sh
+index d913b60..b6a7f79 100755
+--- a/tools/install.sh
++++ b/tools/install.sh
+@@ -6,18 +6,20 @@
+ #
+ 
+ usage() {
+-printf "usage: %s [-D] [-l] [-m mode] src dest\n" "$0" 1>&2
++printf "usage: %s [-D] [-l] [-r] [-m mode] src dest\n" "$0" 1>&2
+ exit 1
+ }
+ 
+ mkdirp=
+ symlink=
++symlinkflags="-s"
+ mode=755
+ 
+-while getopts Dlm: name ; do
++while getopts Dlrm: name ; do
+ case "$name" in
+ D) mkdirp=yes ;;
+ l) symlink=yes ;;
++r) symlink=yes; symlinkflags="$symlinkflags -r" ;;
+ m) mode=$OPTARG ;;
+ ?) usage ;;
+ esac
+@@ -48,7 +50,7 @@ trap 'rm -f "$tmp"' EXIT INT QUIT TERM HUP
+ umask 077
+ 
+ if test "$symlink" ; then
+-ln -s "$1" "$tmp"
++ln $symlinkflags "$1" "$tmp"
+ else
+ cat < "$1" > "$tmp"
+ chmod "$mode" "$tmp"
 -- 
-2.7.0
+2.7.4
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e9b9fef..5775184 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -49,7 +49,7 @@ do_install() {
 	oe_runmake install DESTDIR='${D}'
 
 	install -d ${D}${bindir}
-	ln -s ../../${libdir}/libc.so ${D}${bindir}/ldd
+	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	for l in crypt dl m pthread resolv rt util xnet
 	do
 		ln -s libc.so ${D}${libdir}/lib$l.so
-- 
2.7.4


