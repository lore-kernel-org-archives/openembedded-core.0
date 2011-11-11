Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu5I-0005ch-1e
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:36:08 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so4356740faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VH3uaeEXHRtoSgzrgXD3N3W6B3qz6r76z5sXs07JGNg=;
	b=M/AAjQya88+PFam8i0Z3qS2Y/3OHoskAOxQ4yy3fNGFHNmA9LqCRsAWysRYJbR4lEQ
	sqw0Uosef0c8r6i7dsHbvmRiXpE3Ag56mjGg1l4ON83qq9uhu1U1iFj31xJvI5V/tp8M
	A4Hij3n0Z9wJa1I/0wkpqidfmhRRD7JLQU7I8=
Received: by 10.204.7.71 with SMTP id c7mr8851080bkc.34.1321028986488;
	Fri, 11 Nov 2011 08:29:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z15sm11731242bkv.4.2011.11.11.08.29.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:42 +0100
Message-Id: <9ccabe2cccf4d74325e875e85e6bef1141bd9474.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 06/22] subversion: add 1.7.0 with native support and negative D_P for now
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
X-List-Received-Date: Fri, 11 Nov 2011 16:36:08 -0000

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
1.7.8.rc1



