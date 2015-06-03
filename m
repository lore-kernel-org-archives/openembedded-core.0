Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 331C17582D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 16:42:09 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so117636615igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0HtZ2mS2/IBtVJCRMCJ/P5MRSu427K2Yc6Fo6kdnX2I=;
	b=U8X/lcyMz3VeIqvmT3INOhJTi23hP0aUs9jXkGPhRDz1wxwYV4O72BwrnDv9hToL+u
	NrObP67m/mCf/5NsTX3dKDv15nQowcAOc2bHxZksygKYqpkhTEJsdquOhSa/2GVgjWPr
	DuHL8jo8x8CchFDNUy6773JhwX0NqkXHU6zHWHaxJsWTRpAhyqJRXbtqYsNrd+N9Gphn
	GlcH2ivVvMr0cjA/MXV19U67E/QEQ6tsJFXsv9plSEad54yV8j1PmmOwK/HtfIBuOgtV
	FZE9xBkc8fhv6bAhEsyTH7mGzfHaIcsfYydBlIobuB7c4dQY8NVCS02zXTJb6mGOa2lx
	K+Gw==
X-Received: by 10.50.142.9 with SMTP id rs9mr28023528igb.17.1433349731023;
	Wed, 03 Jun 2015 09:42:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id d4sm15059595iod.17.2015.06.03.09.42.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 09:42:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 09:42:01 -0700
Message-Id: <e653c3e71f673d1bfbf781a214c4ac65de0a5747.1433349512.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
References: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
In-Reply-To: <cover.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] libpam: Fix wrong crypt library detection
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
X-List-Received-Date: Wed, 03 Jun 2015 16:42:10 -0000

Surfaced when building with musl This details are in patch headers
Enabel innetgr.patch for musl as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pam/libpam/crypt_configure.patch               | 31 ++++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |  6 +++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/crypt_configure.patch

diff --git a/meta/recipes-extended/pam/libpam/crypt_configure.patch b/meta/recipes-extended/pam/libpam/crypt_configure.patch
new file mode 100644
index 0000000..efa82fb
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/crypt_configure.patch
@@ -0,0 +1,31 @@
+This patch fixes a case where it find crypt defined in libc (musl) but
+not in specified libraries then it ends up assigning
+
+LIBCRYPT="-l" which then goes into makefile cause all sort of problems
+e.g.
+
+ld: cannot find -l-m32
+| collect2: error: ld returned 1 exit status
+
+The reason is that -l appears on commandline with out any library and
+compiler treats the next argument as library name whatever it is.
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: Linux-PAM-1.1.6/configure.in
+===================================================================
+--- Linux-PAM-1.1.6.org/configure.in
++++ Linux-PAM-1.1.6/configure.in
+@@ -400,7 +400,9 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" =
+   [crypt_libs="crypt"])
+ 
+ BACKUP_LIBS=$LIBS
+-AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="-l$ac_lib", LIBCRYPT="")
++AC_SEARCH_LIBS([crypt],[$crypt_libs],
++	       [test "$ac_cv_search_crypt" = "none required" ||
++		LIBCRYPT="$ac_cv_search_crypt"])
+ AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index b3b39da..d347bdc 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://fedorahosted.org/linux-pam/"
 BUGTRACKER = "https://fedorahosted.org/linux-pam/newticket"
 SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
-# /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time 
+# /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
 # libpam-runtime-1.0.1 is GPLv2+), by openembedded
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3"
@@ -27,11 +27,13 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://pam-unix-nullok-secure.patch \
            file://pam_timestamp-fix-potential-directory-traversal-issu.patch \
            file://libpam-xtests-remove-bash-dependency.patch \
+           file://crypt_configure.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
+SRC_URI_append_libc-musl = " file://pam-no-innetgr.patch"
 
 DEPENDS = "bison flex flex-native cracklib"
 
@@ -145,7 +147,7 @@ do_install() {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/99_pam ${D}${sysconfdir}/default/volatiles
 
-	install -d ${D}${sysconfdir}/pam.d/     
+	install -d ${D}${sysconfdir}/pam.d/
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
 
 	# The lsb requires unix_chkpwd has setuid permission
-- 
2.1.4


