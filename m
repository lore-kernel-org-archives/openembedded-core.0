Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYKVT-0007Kt-BB
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:42:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 09:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="217197547"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.166])
	by azsmga001.ch.intel.com with ESMTP; 13 Nov 2012 09:28:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 17:27:58 +0000
Message-Id: <c5858b520b5c40306ab3be12fd5d071fb78a8e64.1352827498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352827498.git.paul.eggleton@linux.intel.com>
References: <cover.1352827498.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1352827498.git.paul.eggleton@linux.intel.com>
References: <cover.1352827498.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/4] rpm: Add additional RPMSENSE values to python module
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
X-List-Received-Date: Tue, 13 Nov 2012 17:42:40 -0000

From: Mark Hatle <mark.hatle@windriver.com>

We add a number of additional RPMSENSE values to the python module to better
support the dependency calculations in SMART.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/python-rpm-rpmsense.patch              |   33 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch

diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
new file mode 100644
index 0000000..61f1e0c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -0,0 +1,33 @@
+rpmmodule.c: Export a few additional RPMSENSE values
+
+We want to see the RPMSENSE_SCRIPT values for use with SMART.  We also
+want to see the MISSINGOK value so we can avoid recommended packages causing
+failures.
+
+Upstream-status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/python/rpmmodule.c
+===================================================================
+--- rpm-5.4.9.orig/python/rpmmodule.c
++++ rpm-5.4.9/python/rpmmodule.c
+@@ -494,12 +494,16 @@ void init_rpm(void)
+     REGISTER_ENUM(RPMSENSE_EQUAL);
+     REGISTER_ENUM(RPMSENSE_NOTEQUAL);
+     REGISTER_ENUM(RPMSENSE_FIND_REQUIRES);
+-#if defined(RPM_VENDOR_MANDRIVA)
++#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
+     REGISTER_ENUM(RPMSENSE_PREREQ);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_PRE);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_POST);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_PREUN);
+-    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN)
++    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN);
++#endif
++
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++    REGISTER_ENUM(RPMSENSE_MISSINGOK);
+ #endif
+ 
+     REGISTER_ENUM(RPMDEPS_FLAG_NOUPGRADE);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 44f1ca1..a64ddd1 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r53"
+PR = "r54"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -81,6 +81,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-stub-out-git_strerror.patch \
 	   file://rpm-db_buffer_small.patch \
 	   file://rpm-py-init.patch \
+	   file://python-rpm-rpmsense.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.9.5



