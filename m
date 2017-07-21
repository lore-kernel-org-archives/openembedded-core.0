Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 16AEC77E92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:20:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6L6KRkg032621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 21 Jul 2017 07:20:28 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dYRIZ-0005Jd-Fu; Fri, 21 Jul 2017 07:20:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 07:20:25 +0100
Message-Id: <1500618025-20395-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 21 Jul 2017 07:20:28 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] subversion: Upgrade 1.9.5-> 1.9.6
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
X-List-Received-Date: Fri, 21 Jul 2017 06:20:29 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/subversion_1.9.5.bb                 | 55 ----------------------
 .../subversion/subversion_1.9.6.bb                 | 55 ++++++++++++++++++++++
 2 files changed, 55 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion_1.9.5.bb
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.9.6.bb

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.5.bb b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
deleted file mode 100644
index 05fba67..0000000
--- a/meta/recipes-devtools/subversion/subversion_1.9.5.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "Subversion (svn) version control system client"
-SECTION = "console/network"
-DEPENDS = "apr-util serf sqlite3 file"
-DEPENDS_append_class-native = " file-replacement-native"
-RDEPENDS_${PN} = "serf"
-LICENSE = "Apache-2"
-HOMEPAGE = "http://subversion.tigris.org"
-
-BBCLASSEXTEND = "native"
-
-inherit gettext
-
-SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://disable_macos.patch \
-           file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
-           file://0001-Fix-libtool-name-in-configure.ac.patch \
-           file://serfmacro.patch \
-           "
-
-SRC_URI[md5sum] = "9fcbae352a5efe73d46a88c97c6bba14"
-SRC_URI[sha256sum] = "8a4fc68aff1d18dcb4dd9e460648d24d9e98657fbed496c582929c6b3ce555e5"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
-
-PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
-
-EXTRA_OECONF = " \
-                --without-berkeley-db --without-apxs \
-                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS} \
-                --disable-keychain \
-                ac_cv_path_RUBY=none"
-
-inherit autotools
-
-export LDFLAGS += " -L${STAGING_LIBDIR} "
-CPPFLAGS += "-P"
-BUILD_CPPFLAGS += "-P"
-
-acpaths = "-I build/ -I build/ac-macros/"
-
-do_configure_prepend () {
-	rm -f ${S}/libtool
-	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
-	rm -f ${S}/aclocal.m4
-	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
-}
-
-#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/su!
 bversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
-#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with the above command before installing it
-#| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
-#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
-#| make: *** [install-serf-lib] Error 1
-PARALLEL_MAKEINST = ""
diff --git a/meta/recipes-devtools/subversion/subversion_1.9.6.bb b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
new file mode 100644
index 0000000..b27115b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Subversion (svn) version control system client"
+SECTION = "console/network"
+DEPENDS = "apr-util serf sqlite3 file"
+DEPENDS_append_class-native = " file-replacement-native"
+RDEPENDS_${PN} = "serf"
+LICENSE = "Apache-2"
+HOMEPAGE = "http://subversion.tigris.org"
+
+BBCLASSEXTEND = "native"
+
+inherit gettext
+
+SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://disable_macos.patch \
+           file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
+           file://0001-Fix-libtool-name-in-configure.ac.patch \
+           file://serfmacro.patch \
+           "
+
+SRC_URI[md5sum] = "f27e00338d4a9f7f9aec9d4a3f8b418b"
+SRC_URI[sha256sum] = "dbcbc51fb634082f009121f2cb64350ce32146612787ffb0f7ced351aacaae19"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
+
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
+PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
+
+EXTRA_OECONF = " \
+                --without-berkeley-db --without-apxs \
+                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
+                --with-apr-util=${STAGING_BINDIR_CROSS} \
+                --disable-keychain \
+                ac_cv_path_RUBY=none"
+
+inherit autotools
+
+export LDFLAGS += " -L${STAGING_LIBDIR} "
+CPPFLAGS += "-P"
+BUILD_CPPFLAGS += "-P"
+
+acpaths = "-I build/ -I build/ac-macros/"
+
+do_configure_prepend () {
+	rm -f ${S}/libtool
+	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
+	rm -f ${S}/aclocal.m4
+	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
+}
+
+#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/su!
 bversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
+#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with the above command before installing it
+#| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
+#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
+#| make: *** [install-serf-lib] Error 1
+PARALLEL_MAKEINST = ""
-- 
2.7.4


