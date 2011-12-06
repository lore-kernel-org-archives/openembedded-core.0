Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXvPT-0008RN-MS
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 14:50:15 +0100
Received: by eaao14 with SMTP id o14so16829eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 05:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=p5M3XR20XvE7mnwr7N1KPeiOWRg9DVumqx8fPY3NdJk=;
	b=a1tv8xrkHlKUTFLCtQrwJCkhxKiDqfH+tDG4IGUTj7aCx1Xc+Ib+VkSrc7SKhf0d2S
	dtC8g7Ry9Rk12B+9XVytYgOMrZaqGM5bhljfwfmncFiwJavduKjIXLdGZb09JuI4TKY/
	R2+rwlVdqURDZS/U7/2q7cXnUlFl6UjFD6Rto=
Received: by 10.213.35.13 with SMTP id n13mr2464254ebd.4.1323179007426;
	Tue, 06 Dec 2011 05:43:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x12sm71316821eef.9.2011.12.06.05.43.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 05:43:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 14:43:15 +0100
Message-Id: <1323178995-12270-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <20111206091601.GA5456@jama.jama.net>
References: <20111206091601.GA5456@jama.jama.net>
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH] subversion: update 1.7.0 to 1.7.2 and force libtool recreation
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
X-List-Received-Date: Tue, 06 Dec 2011 13:50:15 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

* subversion-1.7.* had libtool-2.4, oe-core now has 2.4.2 and it was
  failing:
  x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4.2, but the
  x86_64-linux-libtool: definition of this LT_INIT comes from libtool 2.4.
  x86_64-linux-libtool: You should recreate aclocal.m4 with macros from libtool 2.4.2
  x86_64-linux-libtool: and run autoconf again.

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../subversion/subversion-1.7.0/libtool2.patch     |   15 --------
 .../subversion/subversion-1.7.2/libtool2.patch     |   15 ++++++++
 .../subversion/subversion_1.7.0.bb                 |   37 -------------------
 .../subversion/subversion_1.7.2.bb                 |   38 ++++++++++++++++++++
 4 files changed, 53 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.2.bb

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
deleted file mode 100644
index 5cd572b..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- a/configure.ac	2011-10-20 21:56:02.230663987 +0200
-+++ b/configure.ac	2011-08-17 15:01:30.000000000 +0200
-@@ -227,8 +227,8 @@
-   LIBTOOL="$sh_libtool"
-   SVN_LIBTOOL="$sh_libtool"
- else
--  sh_libtool="$abs_builddir/libtool"
--  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
-+  sh_libtool="$abs_builddir/$host_alias-libtool"
-+  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
- fi
- AC_SUBST(SVN_LIBTOOL)
- 
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch
new file mode 100644
index 0000000..5cd572b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch
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
deleted file mode 100644
index 396b35b..0000000
--- a/meta/recipes-devtools/subversion/subversion_1.7.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "The Subversion (svn) client"
-SECTION = "console/network"
-DEPENDS = "apr-util neon"
-RDEPENDS_${PN} = "neon"
-LICENSE = "Apache-2"
-HOMEPAGE = "http://subversion.tigris.org"
-
-BBCLASSEXTEND = "native"
-
-# negative, because of new checkout format in 1.7.0 
-# and distro PREMIRRORs need to be in sync with users
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://libtool2.patch \
-"
-SRC_URI[md5sum] = "930e6644a1b6094efd268fde6a318f04"
-SRC_URI[sha256sum] = "64fd5f263a80e609717a3ca42f1f2625606a5c4a40a85716f82c866033780978"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
-
-EXTRA_OECONF = " \
-                --without-berkeley-db --without-apxs --without-apache \
-                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS}"
-
-inherit autotools
-
-export LDFLAGS += " -L${STAGING_LIBDIR} "
-
-acpaths = "-I build/ -I build/ac-macros/"
-
-do_configure_prepend () {
-	rm -f ${S}/libtool
-	rm -f ${S}/build/libtool.m4
-	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
-}
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
new file mode 100644
index 0000000..23e2132
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -0,0 +1,38 @@
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
+SRC_URI[md5sum] = "1e5dfffd27be080672e5a042564368a8"
+SRC_URI[sha256sum] = "7eb3e1ae2b0385e1cc20ca9e1839e0ef0ac98a7455dc52ba4cdf567547bfc517"
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
+	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
+	rm -f ${S}/aclocal.m4
+	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
+}
-- 
1.7.8



