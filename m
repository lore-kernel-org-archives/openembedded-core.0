Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF8-0000S7-QZ
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486050"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:42 -0700
Message-Id: <5a42333fd6984c9b7625b1ea05950a36d6c3aa1f.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 36/40] diffutils-2.8.1: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:51 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../diffutils_fix_for_automake-1.12.patch          |   27 ++++++++++++++++++++
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    6 +++-
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch b/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..cc05d1d
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.ac:90: error: automatic de-ANSI-fication support has been removed
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12/protos.m4:12: AM_C_PROTOTYPES is expanded from...
+| /srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/diffutils-2.8.1-r4/diffutils-2.8.1/m4/prereq.m4:110: jm_PREREQ_QUOTEARG is expanded from...
+| configure.ac:90: the top level
+| autom4te: m4 failed with exit status: 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: diffutils-2.8.1/m4/prereq.m4
+===================================================================
+--- diffutils-2.8.1.orig/m4/prereq.m4
++++ diffutils-2.8.1/m4/prereq.m4
+@@ -115,7 +115,6 @@ AC_DEFUN([jm_PREREQ_QUOTEARG],
+   AC_HEADER_STDC
+   AC_C_BACKSLASH_A
+   AC_MBSTATE_T
+-  AM_C_PROTOTYPES
+ ])
+ 
+ AC_DEFUN([jm_PREREQ_REGEX],
diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
index 0fb3a31..09eb71e 100644
--- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
+++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
@@ -6,9 +6,11 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r4"
+PR = "r5"
 
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
+           file://diffutils_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "71f9c5ae19b60608f6c7f162da86a428"
 SRC_URI[sha256sum] = "c5001748b069224dd98bf1bb9ee877321c7de8b332c8aad5af3e2a7372d23f5a"
-- 
1.7.7



