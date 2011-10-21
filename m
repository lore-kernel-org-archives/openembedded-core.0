Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAOs-0003FZ-CM
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:24:22 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8IxU7salbrCGcjBJH5brmZRHJBHasr2ziioj6cigG6I=;
	b=p5hr39xO5W/fwYyFqo3NsAoBaYvJFOJaWtVyV78Ygc/DCCP9YsOw9wT2wjWhvZyQB8
	zJmKuOHg30ginpmMsvzSJ9vu36r0ckRUlSIcxKJLXZaGgXlu+lBsR1J+tFUU3is84g/y
	aaH0ynKFJ+Da68Nbx8xOwT1tCI4A9v4iTAK8s=
Received: by 10.204.15.211 with SMTP id l19mr2537796bka.75.1319185111686;
	Fri, 21 Oct 2011 01:18:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm12543929bka.0.2011.10.21.01.18.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:18:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:31 +0200
Message-Id: <bcdfb52940fbceb12549f4725ad808ae496afdb3.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] subversion: add 1.7.0 with native support and negative D_P for now
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
X-List-Received-Date: Fri, 21 Oct 2011 08:24:22 -0000

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
1.7.7



