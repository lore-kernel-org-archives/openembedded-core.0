Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S8J87-0006cI-Q2
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 23:26:43 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 23:17:52 +0100
Message-Id: <1331849872-7074-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] parted: update to version 3.1
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
X-List-Received-Date: Thu, 15 Mar 2012 22:26:43 -0000

* Supports disks > 2TB

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../parted/parted-3.1/fix-doc-mandir.patch         |   20 ++++++++++++++++
 .../parted/parted-3.1/fix-git-version-gen.patch    |   24 ++++++++++++++++++++
 .../{parted-3.0 => parted-3.1}/no_check.patch      |    0
 .../{parted-3.0 => parted-3.1}/syscalls.patch      |    0
 .../parted/{parted_3.0.bb => parted_3.1.bb}        |   10 +++++---
 5 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
 rename meta/recipes-extended/parted/{parted-3.0 => parted-3.1}/no_check.patch (100%)
 rename meta/recipes-extended/parted/{parted-3.0 => parted-3.1}/syscalls.patch (100%)
 rename meta/recipes-extended/parted/{parted_3.0.bb => parted_3.1.bb} (57%)

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
index 0000000..3110a72
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Submitted [bug-parted@gnu.org]
+
+Initialize (version-)prefix to prevent inheritance from
+the build environment during autoreconf.
+
+| sed: -e expression #1, char 9: unknown option to `s'
+| configure.ac:55: error: AC_INIT should be called with package and version arguments
+| aclocal.m4:594: AM_INIT_AUTOMAKE is expanded from...
+| configure.ac:55: the top level
+| autom4te: /usr/bin/m4 failed with exit status: 1
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+--- parted-3.1/build-aux/git-version-gen.orig	2012-03-15 13:51:38.911841912 +0100
++++ parted-3.1/build-aux/git-version-gen	2012-03-15 13:51:50.171841800 +0100
+@@ -92,6 +92,8 @@
+ 
+ Running without arguments will suffice in most cases."
+ 
++prefix="v"
++
+ while test $# -gt 0; do
+   case $1 in
+     --help) echo "$usage"; exit 0;;
diff --git a/meta/recipes-extended/parted/parted-3.0/no_check.patch b/meta/recipes-extended/parted/parted-3.1/no_check.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.0/no_check.patch
rename to meta/recipes-extended/parted/parted-3.1/no_check.patch
diff --git a/meta/recipes-extended/parted/parted-3.0/syscalls.patch b/meta/recipes-extended/parted/parted-3.1/syscalls.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.0/syscalls.patch
rename to meta/recipes-extended/parted/parted-3.1/syscalls.patch
diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-extended/parted/parted_3.1.bb
similarity index 57%
rename from meta/recipes-extended/parted/parted_3.0.bb
rename to meta/recipes-extended/parted/parted_3.1.bb
index 2fba6d1..267e53b 100644
--- a/meta/recipes-extended/parted/parted_3.0.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -6,12 +6,14 @@ SECTION = "console/tools"
 DEPENDS = "readline e2fsprogs"
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



