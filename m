Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFw-0002AH-LA
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055124"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:57 -0800
Message-Id: <96bf0fc3511e25fe97fa0e572e6594c21365456a.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/21] subversion: add 1.7.0 with native support and negative D_P for now
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:52 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* intentionaly with negative D_P, bitbake fetcher should be improved to
  detect old checkout with newer subversion available or vice versa and
  do svn upgrade automaticaly or show better error, but subversion as
  client for target or -native for distributions which explicitly say
  they want 1.7 (with PREFERRED_VERSION) can be available already from
  oe-core.
* be aware that checkouts from 1.7.0 are not compatible with older
  subversion clients (ie when builder populating distro PREMIRROR is
  using 1.7.0 all builders need to have also 1.7.0)
* and also 1.7.0 client needs to call svn upgrade in checkout first in
  order to use it (so if PREMIRROR has tarball from 1.6.x it won't work
  on client using 1.7.0 unless fetcher2 is improved to detect this and
  call svn upgrade)
* tested on SHR distribution
  http://wiki.shr-project.org/trac/wiki/Building%20SHR#subversion1.7inshr-chroot
* only missing part is to add subversion-native dependency, so that
  native subversion is built, before building ie elementary (because EFL
  are using svnversion from configure.ac to detect source revision and
  .svn dir needs to be from compatible version).
* read http://subversion.apache.org/docs/release-notes/1.7.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++++++++
 .../subversion/subversion_1.7.0.bb                 |   37 ++++++++++++++++++++
 2 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
new file mode 100644
index 0000000..5cd572b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+--- a/configure.ac	2011-10-20 21:56:02.230663987 +0200
++++ b/configure.ac	2011-08-17 15:01:30.000000000 +0200
+@@ -227,8 +227,8 @@
+   LIBTOOL="$sh_libtool"
+   SVN_LIBTOOL="$sh_libtool"
+ else
+-  sh_libtool="$abs_builddir/libtool"
+-  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
++  sh_libtool="$abs_builddir/$host_alias-libtool"
++  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
+ fi
+ AC_SUBST(SVN_LIBTOOL)
+ 
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.0.bb b/meta/recipes-devtools/subversion/subversion_1.7.0.bb
new file mode 100644
index 0000000..396b35b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion_1.7.0.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "The Subversion (svn) client"
+SECTION = "console/network"
+DEPENDS = "apr-util neon"
+RDEPENDS_${PN} = "neon"
+LICENSE = "Apache-2"
+HOMEPAGE = "http://subversion.tigris.org"
+
+BBCLASSEXTEND = "native"
+
+# negative, because of new checkout format in 1.7.0 
+# and distro PREMIRRORs need to be in sync with users
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://libtool2.patch \
+"
+SRC_URI[md5sum] = "930e6644a1b6094efd268fde6a318f04"
+SRC_URI[sha256sum] = "64fd5f263a80e609717a3ca42f1f2625606a5c4a40a85716f82c866033780978"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
+
+EXTRA_OECONF = " \
+                --without-berkeley-db --without-apxs --without-apache \
+                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
+                --with-apr-util=${STAGING_BINDIR_CROSS}"
+
+inherit autotools
+
+export LDFLAGS += " -L${STAGING_LIBDIR} "
+
+acpaths = "-I build/ -I build/ac-macros/"
+
+do_configure_prepend () {
+	rm -f ${S}/libtool
+	rm -f ${S}/build/libtool.m4
+	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
+}
-- 
1.7.6.4



