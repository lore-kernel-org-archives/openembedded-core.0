Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SA7yk-00035I-49
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 23:56:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 23:47:37 +0100
Message-Id: <1332283657-5978-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2] parted: update to version 3.1
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
X-List-Received-Date: Tue, 20 Mar 2012 22:56:34 -0000

* Supports disks > 2TB

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* v2: Updated DEPENDS to match shlibs.
      Updated fix-git-version-gen.patch (applied upstream).

 .../parted/parted-3.1/fix-doc-mandir.patch         |   20 +++++++++
 .../parted/parted-3.1/fix-git-version-gen.patch    |   43 ++++++++++++++++++++
 .../{parted-3.0 => parted-3.1}/no_check.patch      |    0
 .../{parted-3.0 => parted-3.1}/syscalls.patch      |    0
 .../parted/{parted_3.0.bb => parted_3.1.bb}        |   12 +++--
 5 files changed, 70 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
 rename meta/recipes-extended/parted/{parted-3.0 => parted-3.1}/no_check.patch (100%)
 rename meta/recipes-extended/parted/{parted-3.0 => parted-3.1}/syscalls.patch (100%)
 rename meta/recipes-extended/parted/{parted_3.0.bb => parted_3.1.bb} (52%)

diff --git a/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch b/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
new file mode 100644
index 0000000..0711d4e
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Submitted [bug-parted@gnu.org]
+
+| for po in `ls -1 ./*.pt_BR.po 2>/dev/null`; do \
+| 		make $(basename ${po%.pt_BR.po}); \
+| 	done
+| Makefile:904: *** Recursive variable `mandir' references itself (eventually).  Stop.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+--- parted-3.1/doc/po4a.mk.orig	2012-03-15 14:09:11.555831872 +0100
++++ parted-3.1/doc/po4a.mk	2012-03-15 14:10:44.243830985 +0100
+@@ -23,7 +23,7 @@
+ # threshold is 80%), it won't be distributed, and the build won't fail.
+ #
+ 
+-mandir = $(mandir)/$(lang)
++mandir := $(mandir)/$(lang)
+ 
+ # Inform automake that we want to install some man pages in section 1, 5
+ # and 8.
diff --git a/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
new file mode 100644
index 0000000..a9f26e9
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Accepted [Expected to be included in parted versions > 3.1]
+Upstream-URL: http://git.savannah.gnu.org/cgit/gnulib.git/patch/?id=cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9
+
+From cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Sun, 18 Mar 2012 17:39:14 +0000
+Subject: git-version-gen: don't let "prefix" envvar cause trouble
+
+* build-aux/git-version-gen (prefix): Initialize properly,
+so as not to use a value specified via the environment.
+Details here: http://thread.gmane.org/gmane.comp.gnu.parted.bugs/10810
+---
+diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
+index d5542a2..0fa9063 100755
+--- a/build-aux/git-version-gen
++++ b/build-aux/git-version-gen
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ # Print a version string.
+-scriptversion=2012-01-06.07; # UTC
++scriptversion=2012-03-18.17; # UTC
+ 
+ # Copyright (C) 2007-2012 Free Software Foundation, Inc.
+ #
+@@ -92,6 +92,8 @@ Options:
+ 
+ Running without arguments will suffice in most cases."
+ 
++prefix=v
++
+ while test $# -gt 0; do
+   case $1 in
+     --help) echo "$usage"; exit 0;;
+@@ -120,7 +122,6 @@ if test -z "$tarball_version_file"; then
+ fi
+ 
+ tag_sed_script="${tag_sed_script:-s/x/x/}"
+-prefix="${prefix:-v}"
+ 
+ nl='
+ '
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-extended/parted/parted-3.0/no_check.patch b/meta/recipes-extended/parted/parted-3.1/no_check.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.0/no_check.patch
rename to meta/recipes-extended/parted/parted-3.1/no_check.patch
diff --git a/meta/recipes-extended/parted/parted-3.0/syscalls.patch b/meta/recipes-extended/parted/parted-3.1/syscalls.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.0/syscalls.patch
rename to meta/recipes-extended/parted/parted-3.1/syscalls.patch
diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-extended/parted/parted_3.1.bb
similarity index 52%
rename from meta/recipes-extended/parted/parted_3.0.bb
rename to meta/recipes-extended/parted/parted_3.1.bb
index 2fba6d1..21d3a66 100644
--- a/meta/recipes-extended/parted/parted_3.0.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -3,15 +3,17 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
-DEPENDS = "readline e2fsprogs"
+DEPENDS = "ncurses readline util-linux"
 PR = "r0"
 
-SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
-           file://syscalls.patch "
+           file://syscalls.patch \
+           file://fix-git-version-gen.patch \
+           file://fix-doc-mandir.patch"
 
-SRC_URI[md5sum] = "a94e84a9b9944715c4453f82ccc639bf"
-SRC_URI[sha256sum] = "8886eece015202f6bd5ce8414f4b68838452cef509f2e3389ad56128219837b7"
+SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
+SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
 
 EXTRA_OECONF = "--disable-device-mapper"
 
-- 
1.7.5.4



