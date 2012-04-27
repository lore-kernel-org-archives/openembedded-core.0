Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNdVi-00018l-Qj
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:14:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Apr 2012 22:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136013993"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2012 22:04:47 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 13:04:02 +0800
Message-Id: <e347fa24adcf1c2d611dc8efe4b3db0dc5249946.1335498445.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
References: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1335498445.git.lianhao.lu@intel.com>
References: <cover.1335498445.git.lianhao.lu@intel.com>
Subject: [PATCH 2/7] popt: Fixing pkgconfig file installation issue.
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
X-List-Received-Date: Fri, 27 Apr 2012 05:14:27 -0000

Install the pkgconfig files into $(libdir) instead of $(prefix)/lib/.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-support/popt/popt/pkgconfig_fix.patch |   15 +++++++++++++++
 meta/recipes-support/popt/popt_1.16.bb             |    6 ++++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/popt/popt/pkgconfig_fix.patch

diff --git a/meta/recipes-support/popt/popt/pkgconfig_fix.patch b/meta/recipes-support/popt/popt/pkgconfig_fix.patch
new file mode 100644
index 0000000..0bddbf8
--- /dev/null
+++ b/meta/recipes-support/popt/popt/pkgconfig_fix.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Install the pkgconfig file into libdir.
+
+--- popt-1.16.orig/Makefile.am	2012-04-26 13:42:54.021139813 +0800
++++ popt-1.16/Makefile.am	2012-04-26 13:36:03.552096912 +0800
+@@ -47,7 +47,7 @@
+ libpopt_la_SOURCES = popt.c poptparse.c poptconfig.c popthelp.c poptint.c
+ libpopt_la_LDFLAGS = -no-undefined @LTLIBINTL@ @LTLIBICONV@
+ 
+-pkgconfigdir = $(prefix)/lib/pkgconfig
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = popt.pc
+ 
+ if HAVE_LD_VERSION_SCRIPT
diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index fa6c326..cd22e9a 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -4,9 +4,11 @@ SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz"
+SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+           file://pkgconfig_fix.patch \
+          "
 
 SRC_URI[md5sum] = "3743beefa3dd6247a73f8f7a32c14c33"
 SRC_URI[sha256sum] = "e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8"
-- 
1.7.0.4



