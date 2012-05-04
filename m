Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF1-0000Rd-3N
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486029"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:23 -0700
Message-Id: <bbf59a430637c8a32ad1dcb139e2f613234ab820.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 17/40] gawk: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gawk/gawk/gawk_fix_for_automake-1.12.patch     |   23 ++++++++++++++++++++
 meta/recipes-extended/gawk/gawk_4.0.0.bb           |    5 ++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch b/meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..a2458a8
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| configure.ac:120: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: gawk-4.0.0/configure.ac
+===================================================================
+--- gawk-4.0.0.orig/configure.ac
++++ gawk-4.0.0/configure.ac
+@@ -116,9 +116,6 @@ dnl Set the programming language for che
+ dnl this only needs to be set once, since everything is in C.
+ AC_LANG([C])
+ 
+-dnl check for C compiler for automake. Needed for dfa.h.
+-AM_C_PROTOTYPES
+-
+ dnl Cygwin doesn't like to get libs with full paths
+ dnl since that overrides linking against DLLs.
+ case `(uname) 2> /dev/null` in
diff --git a/meta/recipes-extended/gawk/gawk_4.0.0.bb b/meta/recipes-extended/gawk/gawk_4.0.0.bb
index 977feb9..3587e85 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.0.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.0.bb
@@ -11,9 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+           file://gawk_fix_for_automake-1.12.patch"
 
 SRC_URI[md5sum] = "51e417b71287629940051e6f652c6492"
 SRC_URI[sha256sum] = "c3a7cf7d976e05c6a1d8a9b3f14fa55d4304707408ddafb1396212653ea00be5"
-- 
1.7.7



