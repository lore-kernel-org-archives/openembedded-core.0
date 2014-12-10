Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 99CC17250F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:55:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="635378102"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2014 21:55:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:55:17 -0800
Message-Id: <3f8f5fc33b06f2b8d388d2ca33fa695cd19c8908.1418190513.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
Subject: [PATCH 5/6] libnss-mdns: Convert to git
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
Add patch to prevent docs generation and README fixup

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libnss-mdns/libnss-mdns-disable-docs.patch     | 23 ++++++++++++++++++++++
 .../libnss-mdns/libnss-mdns_0.10.bb                | 10 ++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/libnss-mdns/libnss-mdns/libnss-mdns-disable-docs.patch

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns/libnss-mdns-disable-docs.patch b/meta/recipes-connectivity/libnss-mdns/libnss-mdns/libnss-mdns-disable-docs.patch
new file mode 100644
index 0000000..aeb2823
--- /dev/null
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns/libnss-mdns-disable-docs.patch
@@ -0,0 +1,23 @@
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -18,15 +18,14 @@
+ # USA.
+ 
+ EXTRA_DIST=bootstrap.sh README LICENSE
+-SUBDIRS=src doc
++SUBDIRS=src
+ 
+ MAINTAINERCLEANFILES=README
+ noinst_DATA = README
+ 
+ README:
+-	rm -f README
+-	$(MAKE) -C doc README
+-	cd $(srcdir) && ln -s doc/README README
++	ln -s $(abs_top_builddir)/doc/README.html README
++
+ 
+ homepage: all dist
+ 	test -d $$HOME/homepage/private
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 0b936ef..a199e6f 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -8,12 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "avahi"
 PR = "r7"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
+SRCREV = "644e03cff7a587934bf62bce9b59bedcf06ddb26"
+PV = "0.10+git${SRCPV}"
 
-SRC_URI[md5sum] = "03938f17646efbb50aa70ba5f99f51d7"
-SRC_URI[sha256sum] = "1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d"
+SRC_URI = "git://git.0pointer.net/nss-mdns.git \
+           file://libnss-mdns-disable-docs.patch \
+          "
 
-S = "${WORKDIR}/nss-mdns-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
1.8.3.1


