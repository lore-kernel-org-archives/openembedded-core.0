Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB7479DDE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:02 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 89393FF802;
	Sat,  3 Nov 2018 16:45:01 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:11 -0700
Message-Id: <20181103164427.16125-10-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 09/25] openssl_1.0: fix cryptodev-linux PACKAGECONFIG support
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:03 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Since openssl isn't an autotools recipe, defining cryptodev-linux
related config options via PACKAGECONFIG hasn't worked correctly
since PACKAGECONFIG_CONFARGS stopped being automatically appended to
EXTRA_OECONF in 2016:

  http://git.openembedded.org/openembedded-core/commit/?id=c98fb5f5129e71829ffab4449b3d28082bc95ab4

The issue appears to have been hidden as the flags are also hardcoded
in CFLAG - and therefore always enabled, regardless of the state of
the PACKAGECONFIG option. Fix by passing both EXTRA_OECONF and
PACKAGECONFIG_CONFARGS when running the openssl Configure script.
Although the openssl 1.1 recipe doesn't contain any PACKAGECONFIG
options yet, pre-emptively make the same fix there too.

Also only enable cryptodev-linux by default for target builds (based
on the historical comments in the recipe, that seems to have been the
original intention).

(From OE-Core rev: 6fee11b04b979a5b3237902d947db7118cafca2b)

(From OE-Core rev: 201f4a889c0e4b3d13369e38662bf97ed8a9a8e1)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 9 ++++-----
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index e78830c55b..b8fe49f7c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -63,6 +63,9 @@ UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
 PACKAGECONFIG ?= "cryptodev-linux"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
 PACKAGECONFIG[perl] = ",,,"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
 
@@ -88,10 +91,6 @@ CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB
 # (and it causes issues with SELinux)
 CFLAG += "-Wa,--noexecstack"
 
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-
 CFLAG_append_class-native = " -fPIC"
 
 do_configure_prepend_darwin () {
@@ -202,7 +201,7 @@ do_configure () {
 		useprefix=/
 	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
 }
 
 do_compile_prepend_class-target () {
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index d277170fdd..14c3f54132 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -120,7 +120,7 @@ do_configure () {
                 useprefix=/
         fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
 }
 
 do_install () {
-- 
2.18.1


