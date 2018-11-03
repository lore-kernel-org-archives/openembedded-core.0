Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 7392C79F6B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:24 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 55591FF806;
	Sat,  3 Nov 2018 16:45:23 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:20 -0700
Message-Id: <20181103164427.16125-19-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 18/25] openssl_1.0: add PACKAGECONFIG option to control manpages
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:25 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Creating the openssl manpages, which happens as part of do_install(),
can take a significant amount of time (e.g. ~50 seconds on a quad
core laptop). Provide a PACKAGECONFIG option to allow creation of the
manpages to be skipped completely if not required and inherit the
manpages class to automatically control the PACKAGECONFIG option
(based on the "api-documentation" distro feature).

(From OE-Core rev: 1ddca1872f64c566fd812a6ec44f2d4e4d84f58f)

(From OE-Core rev: 061c17ff22f4df573bccbf4b66f2fdf5501c3617)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-allow-manpages-to-be-disabled.patch  | 31 +++++++++++++++++++
 .../openssl/openssl_1.0.2o.bb                 |  8 +++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
new file mode 100644
index 0000000000..3f7d649955
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
@@ -0,0 +1,31 @@
+From e1c39b80b01d4d18feeadfdc6e45a3e1dd110634 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 27 Jul 2018 21:41:06 +0000
+Subject: [PATCH] allow manpages to be disabled
+
+Define OE_DISABLE_MANPAGES (via environment or the make command line)
+to skip creation and installation of manpages.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ Makefile.org | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.org b/Makefile.org
+index ed98d2a..747d8cb 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -549,7 +549,7 @@ dist:
+ 	@$(MAKE) SDIRS='$(SDIRS)' clean
+ 	@$(MAKE) TAR='$(TAR)' TARFLAGS='$(TARFLAGS)' $(DISTTARVARS) tar
+ 
+-install: all install_docs install_sw
++install: all $(if $(OE_DISABLE_MANPAGES),,install_docs) install_sw
+ 
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index e2f6603ec4..f731acf2e4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://Use-SHA256-not-MD5-as-default-digest.patch \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
+           file://0001-allow-manpages-to-be-disabled.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -59,19 +60,22 @@ SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8
 
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
-inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+inherit pkgconfig siteinfo multilib_header ptest relative_symlinks manpages
 
 PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[perl] = ",,,"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
+PACKAGECONFIG[manpages] = ",,,"
+PACKAGECONFIG[perl] = ",,,"
 
 # Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
 # vulnerability
 EXTRA_OECONF = "no-ssl3"
 
+EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABLE_MANPAGES=1', d)}"
+
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
-- 
2.18.1


