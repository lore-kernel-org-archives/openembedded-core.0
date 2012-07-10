Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SoX2A-0007Sn-9y
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 11:47:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6A9ZsCB018432
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 02:35:54 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jul 2012 02:35:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 17:35:50 +0800
Message-ID: <96af80c022420a6ef9feb4d82387f43a5510f75f.1341909636.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1341909636.git.liezhi.yang@windriver.com>
References: <cover.1341909636.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] subversion: do_install failed (parallel issue)
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
X-List-Received-Date: Tue, 10 Jul 2012 09:47:06 -0000
Content-Type: text/plain

install-neon-lib needs libsvn_delta-1.la which will be regenerated
during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
in regenerating and at the same time install-neon-lib links it, the
error willl happen.

The error message is:
/bin/ld: cannot find -lsvn_delta-1
collect2: error: ld returned 1 exit status

This is a parallel issue, so it doesn't happen often.

Note:
The autoreconf doesn't generate build-outputs.mk, it would be generated
by autogen.sh (use build.conf as the input), but autogen.sh isn't
suitable for cross compiling, so both modified build-outputs.mk and
build.conf.

[YOCTO #2727]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../subversion/fix-install-depends.patch           |   45 ++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    6 ++-
 .../subversion/subversion_1.7.2.bb                 |    3 +-
 3 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/fix-install-depends.patch

diff --git a/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
new file mode 100644
index 0000000..6f49ed4
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
@@ -0,0 +1,45 @@
+install-neon-lib should depend on libsvn_delta's installation
+
+install-neon-lib needs libsvn_delta-1.la which will be regenerated
+during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
+in regenerating and at the same time install-neon-lib links it, the
+error willl happen.
+
+Let install-neon-lib run after libsvn_delta-1.la is installed will fix
+the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-outputs.mk |    2 +-
+ build.conf       |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build-outputs.mk b/build-outputs.mk
+--- a/build-outputs.mk
++++ b/build-outputs.mk
+@@ -979,7 +979,7 @@ install-locale: subversion/po/de.mo subversion/po/es.mo subversion/po/fr.mo subv
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
+ 
+-install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la
++install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_LIB_INSTALL_DEPS)
+ 	$(MKDIR) $(DESTDIR)$(neon_libdir)
+ 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
+ 
+diff --git a/build.conf b/build.conf
+--- a/build.conf
++++ b/build.conf
+@@ -272,6 +272,8 @@ type = ra-module
+ path = subversion/libsvn_ra_neon
+ install = neon-lib
+ libs = libsvn_delta libsvn_subr aprutil apriconv apr neon
++# conditionally add more dependencies
++add-install-deps = $(SVN_FS_LIB_INSTALL_DEPS)
+ msvc-static = yes
+ 
+ # Accessing repositories via DAV through serf
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index d3c7392..29029ce 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -7,11 +7,13 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://disable-revision-install.patch \
-	   file://libtool2.patch"
+           file://libtool2.patch \
+           file://fix-install-depends.patch \
+          "
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
 SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
index d4d56d0..ced1b0c 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -7,10 +7,11 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
+           file://fix-install-depends.patch \
 "
 SRC_URI[md5sum] = "1e5dfffd27be080672e5a042564368a8"
 SRC_URI[sha256sum] = "7eb3e1ae2b0385e1cc20ca9e1839e0ef0ac98a7455dc52ba4cdf567547bfc517"
-- 
1.7.1



