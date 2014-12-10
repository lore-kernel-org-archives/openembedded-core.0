Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB9172519
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:55:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="635378104"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2014 21:55:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:55:18 -0800
Message-Id: <c1472f545458227b5b1066ede5170e55db42972a.1418190513.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
Subject: [PATCH 6/6] nss-myhostname: Convert to git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Dec 2014 05:55:31 -0000

The upstream tarball is no longer available, but the git repo still is, so use it instead
Additionally fix up the Makefile.am to not build the README since it's not a deliverable file

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../nss-myhostname-disable-docs.patch              | 25 ++++++++++++++++++++++
 .../nss-myhostname/nss-myhostname_0.3.bb           | 12 ++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/nss-myhostname-disable-docs.patch

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname/nss-myhostname-disable-docs.patch b/meta/recipes-support/nss-myhostname/nss-myhostname/nss-myhostname-disable-docs.patch
new file mode 100644
index 0000000..0af1903
--- /dev/null
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname/nss-myhostname-disable-docs.patch
@@ -0,0 +1,25 @@
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -20,19 +20,10 @@ ACLOCAL_AMFLAGS = -I m4
+ 
+ lib_LTLIBRARIES = libnss_myhostname.la
+ 
+-EXTRA_DIST=bootstrap.sh README LICENSE
+-SUBDIRS=doc
++EXTRA_DIST=bootstrap.sh LICENSE
+ 
+ AM_CPPFLAGS = -include $(top_builddir)/config.h
+ 
+-MAINTAINERCLEANFILES=README
+-noinst_DATA = README
+-
+-README:
+-	rm -f README
+-	$(MAKE) -C doc README
+-	cd $(srcdir) && ln -s doc/README README
+-
+ homepage: all dist
+ 	test -d $$HOME/homepage/private
+ 	mkdir -p $$HOME/homepage/private/projects/nss-myhostname
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index bbce9e9..31d3c73 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -3,14 +3,16 @@ DESCRIPTION = "plugin for the GNU Name Service Switch (NSS) functionality of \
 the GNU C Library (glibc) providing host name resolution for the locally \
 configured system hostname as returned by gethostname(2)."
 HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
-SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
+SRCREV = "1df2a0fce427fab7754f6ac572cf68cef2e95696"
+PV = "0.3+git${SRCPV}"
+SRC_URI = "git://git.0pointer.net/nss-myhostname.git \
+           file://nss-myhostname-disable-docs.patch \
+          "
 
+S = "${WORKDIR}/git"
 inherit autotools distro_features_check
 
 # The systemd has its own copy of nss-myhostname
-- 
1.8.3.1


