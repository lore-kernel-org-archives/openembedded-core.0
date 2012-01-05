Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RirGY-0007x6-JU
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:38:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92761365"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:30:45 -0800
Message-Id: <28a437b814507e6d98841f4270eabdc155816232.1325784550.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
References: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/7] automake-1.11.2: backport pkglibexec_SCRIPTS fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 17:38:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake-1.11.2 made variable libexec_SCRIPTS valid while
pkglibexec_SCRIPTS invalid. Both should be either allowed
or not allowed. This issue is fixed in the automake
developement branch, and now backported into our automake
1.11.2 recipe.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 ++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.11.2.bb  |    5 +-
 2 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch

diff --git a/meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch b/meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
new file mode 100644
index 0000000..f06dfe3
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
@@ -0,0 +1,118 @@
+Upstream-Status: Backport
+
+Backporting this patch from automake devel git tree.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/01/05
+
+
+From 4e4dae500390d2ace681e4e4bc4c590ecdca38c6 Mon Sep 17 00:00:00 2001
+From: Stefano Lattarini <stefano.lattarini@gmail.com>
+Date: Tue, 03 Jan 2012 08:06:09 +0000
+Subject: install: pkglibexec_SCRIPTS is a valid prefix/primary combination
+
+It makes little sense for `libexec_SCRIPTS' to be accepted as valid
+while `pkglibexec_SCRIPTS' is not.  So fix this inconsistency by
+explicitly allowing `pkglibexec_SCRIPTS' as well.  It is worth
+noting that the inconsistency has been there for a long time,
+but only the quite recent commit `v1.11-373-g9ca6326' "Warnings
+about primary/prefix mismatch fixed and extended" has made it
+noisy enough to be noticed.
+
+* automake.in (handle_scripts): Also list `pkglibexec' among the
+prefixes valid for the `SCRIPTS' primary.
+* doc/automake.texi (Scripts): Likewise.
+* tests/primary-prefix-valid-couples.test: Update.
+* THANKS: Likewise.
+* NEWS: Likewise.
+
+Reported by Dennis Schridde on the automake list:
+<http://lists.gnu.org/archive/html/automake/2012-01/msg00002.html>
+---
+diff --git a/NEWS b/NEWS
+index 599f19f..2e572e4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -82,6 +82,11 @@ New in 1.11.0a:
+ 
+ Bugs fixed in 1.11.0a:
+ 
++* Bugs introduced by 1.11.2:
++
++  - Automake now correctly recognizes the prefix/primary combination
++   `pkglibexec_SCRIPTS' as valid.
++
+ * Bugs introduced by 1.11:
+ 
+   - The `parallel-tests' test driver works around a GNU make 3.80 bug with
+diff --git a/THANKS b/THANKS
+index e9da06c..e9c6db8 100644
+--- a/THANKS
++++ b/THANKS
+@@ -78,6 +78,7 @@ David Pashley		david@davidpashley.com
+ David Zaroski		cz253@cleveland.Freenet.Edu
+ Dean Povey		dpovey@wedgetail.com
+ Dennis J. Linse		Dennis.J.Linse@SAIC.com
++Dennis Schridde		devurandom@gmx.net
+ Derek R. Price		derek.price@openavenue.com
+ Diab Jerius		djerius@cfa.harvard.edu
+ Didier Cassirame	faded@free.fr
+diff --git a/automake.in b/automake.in
+index a852195..a689b63 100644
+--- a/automake.in
++++ b/automake.in
+@@ -3091,7 +3091,7 @@ sub handle_scripts
+     # useful to sometimes distribute scripts verbatim.  This happens
+     # e.g. in Automake itself.
+     &am_install_var ('-candist', 'scripts', 'SCRIPTS',
+-		     'bin', 'sbin', 'libexec', 'pkgdata',
++		     'bin', 'sbin', 'libexec', 'pkglibexec', 'pkgdata',
+ 		     'noinst', 'check');
+ }
+ 
+diff --git a/doc/automake.texi b/doc/automake.texi
+index cebe084..0c4dc01 100644
+--- a/doc/automake.texi
++++ b/doc/automake.texi
+@@ -7099,11 +7099,12 @@ prefix as with other primaries.
+ @vindex sbin_SCRIPTS
+ @vindex libexec_SCRIPTS
+ @vindex pkgdata_SCRIPTS
++@vindex pkglibexec_SCRIPTS
+ @vindex noinst_SCRIPTS
+ @vindex check_SCRIPTS
+ 
+ Scripts can be installed in @code{bindir}, @code{sbindir},
+-@code{libexecdir}, or @code{pkgdatadir}.
++@code{libexecdir}, @code{pkglibexecdir}, or @code{pkgdatadir}.
+ 
+ Scripts that need not be installed can be listed in
+ @code{noinst_SCRIPTS}, and among them, those which are needed only by
+diff --git a/tests/primary-prefix-invalid-couples.test b/tests/primary-prefix-invalid-couples.test
+index 88e0817..c3d6471 100755
+--- a/tests/primary-prefix-invalid-couples.test
++++ b/tests/primary-prefix-invalid-couples.test
+@@ -79,7 +79,7 @@ for primary in $primaries; do
+       prefixes_ok='bin sbin libexec pkglibexec'
+       ;;
+     SCRIPTS)
+-      prefixes_ok='bin sbin libexec pkgdata'
++      prefixes_ok='bin sbin libexec pkglibexec pkgdata'
+       ;;
+     DATA)
+       prefixes_ok='data dataroot pkgdata doc html dvi pdf ps
+diff --git a/tests/primary-prefix-valid-couples.test b/tests/primary-prefix-valid-couples.test
+index 36ff5d8..6eb4149 100755
+--- a/tests/primary-prefix-valid-couples.test
++++ b/tests/primary-prefix-valid-couples.test
+@@ -57,7 +57,7 @@ for p in lib pkglib; do
+   echo "${p}_LTLIBRARIES = libd-$p.la" >> Makefile.am
+ done
+ 
+-for p in bin sbin libexec pkgdata; do
++for p in bin sbin libexec pkglibexec pkgdata; do
+   echo "${p}_SCRIPTS = $p.sh" >> Makefile.am
+ done
+ 
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-devtools/automake/automake_1.11.2.bb b/meta/recipes-devtools/automake/automake_1.11.2.bb
index 0a65f24..4534c39 100644
--- a/meta/recipes-devtools/automake/automake_1.11.2.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.2.bb
@@ -36,9 +36,10 @@ PATHFIXPATCH_virtclass-nativesdk = ""
 
 SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
-	    file://python-libdir.patch"
+	    file://python-libdir.patch \
+            file://automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch"
 
-PR = "r0"
+PR = "r1"
 SRC_URI[md5sum] = "18194e804d415767bae8f703c963d456"
 SRC_URI[sha256sum] = "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be56b499d016368718"
 
-- 
1.7.6.4



