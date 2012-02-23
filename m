Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC3-0004tn-PG
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652354"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:12 -0800
Message-Id: <7104bcab7ba11e0786bed89bf7530d9d055c65da.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/25] nspr: Add patch in order to remove rpath from binaries
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:56 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

This patch was created in order to avoid QA warnings.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../nspr/files/remove-rpath-from-tests.patch       |   26 ++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tests.patch

diff --git a/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
new file mode 100644
index 0000000..a7e7853
--- /dev/null
+++ b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
@@ -0,0 +1,26 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Thu Feb 9 00:03:38 2012 +0200
+
+Avoid QA warnings by removing hardcoded rpath from binaries.
+
+[...]
+WARNING: QA Issue: package nspr contains bad RPATH {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/nspr-4.8.9/mozilla/nsprpub/pr/tests/../../dist/lib
+in file {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/packages-split/nspr/usr/lib/nspr/tests/multiwait
+[...]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: nspr-4.8.9/mozilla/nsprpub/pr/tests/Makefile.in
+===================================================================
+--- nsprpub.orig/pr/tests/Makefile.in	2012-02-11 00:01:10.476220505 +0200
++++ nsprpub/pr/tests/Makefile.in	2012-02-10 23:57:40.000000000 +0200
+@@ -379,7 +379,7 @@
+ endif
+ 
+ ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
+-    LDOPTS += -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
++    LDOPTS += -Xlinker
+     ifeq ($(USE_PTHREADS),1)
+         EXTRA_LIBS = -lpthread
+     endif
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index 74bfe6b..0607c32 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -5,9 +5,10 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
                     file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
 SECTION = "libs/network"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
+           file://remove-rpath-from-tests.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
-- 
1.7.6.5



