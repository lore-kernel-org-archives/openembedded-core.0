Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4w0J-0005Cy-GV
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:40:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 08:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190888381"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 08:28:16 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 17:33:04 +0300
Message-Id: <ab15eabb5bd24206e53156df6c1564bfc76e09e3.1345818232.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
Subject: [PATCH 1/4] wget: upgrade to 1.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 15:41:00 -0000

remove-gets.patch: removed
	- included in the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../wget/wget-1.13.4/remove-gets.patch             |   23 --------------------
 .../{wget-1.13.4 => wget-1.14}/fix_makefile.patch  |    0
 meta/recipes-extended/wget/wget_1.13.4.bb          |   10 ---------
 meta/recipes-extended/wget/wget_1.14.bb            |    9 ++++++++
 4 files changed, 9 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
 rename meta/recipes-extended/wget/{wget-1.13.4 => wget-1.14}/fix_makefile.patch (100%)
 delete mode 100644 meta/recipes-extended/wget/wget_1.13.4.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.14.bb

diff --git a/meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch b/meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
deleted file mode 100644
index ed1d019..0000000
--- a/meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: wget-1.13.4/lib/stdio.in.h
-===================================================================
---- wget-1.13.4.orig/lib/stdio.in.h	2011-09-13 01:15:14.000000000 -0700
-+++ wget-1.13.4/lib/stdio.in.h	2012-07-04 12:22:45.749092515 -0700
-@@ -693,11 +693,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
diff --git a/meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch b/meta/recipes-extended/wget/wget-1.14/fix_makefile.patch
similarity index 100%
rename from meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch
rename to meta/recipes-extended/wget/wget-1.14/fix_makefile.patch
diff --git a/meta/recipes-extended/wget/wget_1.13.4.bb b/meta/recipes-extended/wget/wget_1.13.4.bb
deleted file mode 100644
index 9a9441e..0000000
--- a/meta/recipes-extended/wget/wget_1.13.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-PR = "${INC_PR}.3"
-
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://fix_makefile.patch \
-           file://remove-gets.patch \
-          "
-SRC_URI[md5sum] = "1df489976a118b9cbe1b03502adbfc27"
-SRC_URI[sha256sum] = "24c7710bc9f220ce23d8a9e0f5673b0efc1cace62db6de0239b5863ecc934dcd"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.14.bb b/meta/recipes-extended/wget/wget_1.14.bb
new file mode 100644
index 0000000..f26b884
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.14.bb
@@ -0,0 +1,9 @@
+PR = "${INC_PR}.0"
+
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://fix_makefile.patch \
+          "
+SRC_URI[md5sum] = "12edc291dba8127f2e9696e69f36299e"
+SRC_URI[sha256sum] = "f3a6898e3a765bb94435b04a6668db9e5d19b3e90e0c69a503a2773ae936c269"
+
+require wget.inc
-- 
1.7.9.5



