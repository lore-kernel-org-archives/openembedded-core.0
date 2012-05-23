Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDC-0006Li-9w
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:13:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507156"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:19 -0700
Message-Id: <92a6c2145d6309bf35be1bb1c017dbe6970af682.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/30] rpm: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:13:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../rpm/rpm/rpm_fix_for_automake-1.12.patch        |   21 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch b/meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..abbb15d
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
@@ -0,0 +1,21 @@
+Upstream-Status: 2012/05/02
+
+automake 1.12 has depricated automatic de-ANSI-fication.
+
+fix this issue:
+| configure.ac:564: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+Index: rpm-5.4.0/configure.ac
+===================================================================
+--- rpm-5.4.0.orig/configure.ac
++++ rpm-5.4.0/configure.ac
+@@ -561,7 +561,6 @@ dnl # platform specific checks
+ AC_SEARCH_LIBS([strerror],[cposix])
+ 
+ dnl # standard checks
+-AM_C_PROTOTYPES
+ AC_C_INLINE
+ AC_C_BIGENDIAN
+ 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 5ee6b47..3c259b2 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl file"
 extrarpmdeps_virtclass-native = "python-native file-native"
-PR = "r36"
+PR = "r37"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -70,6 +70,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://pythondeps.sh \
 	   file://rpmdeps-oecore.patch \
 	   file://rpm-resolvedep.patch \
+	   file://rpm_fix_for_automake-1.12.patch \
 	  "
 
 #	   file://rpm-autoconf.patch \
-- 
1.7.7



