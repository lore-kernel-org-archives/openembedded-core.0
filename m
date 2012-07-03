Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPn-0006xS-UX
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:20:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158041"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:30 -0700
Message-Id: <705baf06d151eb4f9dcae7b23c7f3e57c0c09a74.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/17] kconfig-frontends: New recipe
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
X-List-Received-Date: Tue, 03 Jul 2012 07:20:54 -0000

From: Khem Raj <raj.khem@gmail.com>

kconfig-frontends provides the kconfig infrastructure
thats used for linux kernel as a standalone package. Its
not intended to be used for kernel itself but can be
used by packages who are based on kconfig e.g. busybox
uclibc or new packages who wants to use kconfig infra
for the package build

kconfig-frontends names it's shared library as -3.4.0.so instead of .so.3.4.0,
this causes the -dev package to grab it since it matches on *.so. This error
would also have shown up with the old PACKAGE order.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
new file mode 100644
index 0000000..9abfa75
--- /dev/null
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
@@ -0,0 +1,34 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The kconfig-frontends project aims at centralising \
+the effort of keeping an up-to-date, out-of-tree, packaging of the \
+kconfig infrastructure, ready for use by third-party projects. \
+The kconfig-frontends package provides the kconfig parser, as well as all \
+the frontends"
+HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
+SECTION = "devel"
+DEPENDS += "ncurses flex bison gperf"
+PR = "r0"
+PV = "3.4.0"
+SPIN = "0"
+SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
+SRC_URI[md5sum] = "7eed0faf5a41d6dd0b2a886a440a972d"
+SRC_URI[sha256sum] = "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
+
+S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
+
+inherit autotools
+do_configure_prepend () {
+	mkdir -p scripts/.autostuff/m4
+}
+EXTRA_OECONF += "--disable-gconf --disable-qconf"
+
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+SOLIBS = "-${PV}.so"
+FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
+
+BBCLASSEXTEND = "native"
-- 
1.7.7.6



