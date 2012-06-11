Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Se9GZ-0001f7-GQ
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:23:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5BICTYQ024026
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 11:12:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 11 Jun 2012 11:12:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 13:18:53 -0500
Message-ID: <64585c9d2312340f6244d296dd123cf872315b1d.1339438568.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/9] rpm: Upgrade RPM to 5.4.9
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
X-List-Received-Date: Mon, 11 Jun 2012 18:23:04 -0000
Content-Type: text/plain

Beside upreving RPM, add necessary integration pathces to libzypp.

Also change the configuration of RPM to support PACKAGECONFIG flags.
RPM is highly configurable, the default configuration is good for
minimal OE-Core use.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |   29 +++++
 .../rpm/rpm/rpm-scriptletexechelper.patch          |   33 +++---
 meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch |   26 ++---
 .../rpm/{rpm_5.4.8.bb => rpm_5.4.9.bb}             |  122 +++++++++-----------
 .../libzypp/libzypp/libzypp-rpm549.patch           |   28 +++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
 6 files changed, 141 insertions(+), 100 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.8.bb => rpm_5.4.9.bb} (82%)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua.patch b/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
new file mode 100644
index 0000000..980e1b1
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
@@ -0,0 +1,29 @@
+Add support for cross compiling lua
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur rpm-5.4.9.orig/configure.ac rpm-5.4.9/configure.ac
+--- rpm-5.4.9.orig/configure.ac	2012-05-16 12:16:36.589813548 -0500
++++ rpm-5.4.9/configure.ac	2012-05-16 12:26:01.070813518 -0500
+@@ -120,6 +120,9 @@
+ 
+ AC_PATH_PROG(AS, as, as)
+ 
++CC_FOR_BUILD=${CC_FOR_BUILD-\$(CC)}
++AC_SUBST(CC_FOR_BUILD)
++
+ dnl # GCC specifics
+ AC_PROG_GCC_TRADITIONAL
+ AC_ARG_ENABLE(build-pic,
+diff -ur rpm-5.4.9.orig/lua/Makefile.am rpm-5.4.9/lua/Makefile.am
+--- rpm-5.4.9.orig/lua/Makefile.am	2012-04-07 19:15:25.000000000 -0500
++++ rpm-5.4.9/lua/Makefile.am	2012-05-16 12:26:19.556856688 -0500
+@@ -40,7 +40,7 @@
+ 
+ # --- bin2c doesn't need anything but a compiler
+ bin2c$(EXEEXT):  bin2c.c
+-	$(CC) -o $@ $<
++	$(CC_FOR_BUILD) -o $@ $<
+ 
+ liblua_la_SOURCES =
+ liblua_la_CFLAGS = @WITH_LUA_SUBDIR_DEF@
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
index e4db0e4..8a9e712 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
@@ -12,10 +12,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
---- rpm-5.4.0.orig/lib/psm.c	2010-12-29 07:42:11.000000000 -0600
-+++ rpm-5.4.0/lib/psm.c	2011-11-08 13:38:48.132791154 -0600
-@@ -792,6 +792,10 @@
+Index: rpm-5.4.9/lib/psm.c
+===================================================================
+--- rpm-5.4.9.orig/lib/psm.c
++++ rpm-5.4.9/lib/psm.c
+@@ -801,6 +801,10 @@ static rpmRC runScript(rpmpsm psm, Heade
      int xx;
      int i;
  
@@ -26,23 +27,23 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
      if (psm->sstates != NULL && ix >= 0 && ix < RPMSCRIPT_MAX)
  	ssp = psm->sstates + ix;
      if (ssp != NULL)
-@@ -858,14 +862,29 @@
+@@ -867,14 +871,29 @@ assert(he->p.str != NULL);
  		(F_ISSET(psm, UNORDERED) ? "a" : ""));
  
      if (Phe->p.argv == NULL) {
--	argv = alloca(5 * sizeof(*argv));
+-	argv = (const char **) alloca(5 * sizeof(*argv));
 -	argv[0] = "/bin/sh";
 -	argc = 1;
-+	argv = alloca(7 * sizeof(*argv));
++	argv = (const char **) alloca(7 * sizeof(*argv));
 +	argc = 0;
 +    } else {
-+	argv = alloca((Phe->c + 6) * sizeof(*argv));
++	argv = (const char **) alloca((Phe->c + 6) * sizeof(*argv));
 +	argc = 0;
 +    }
 +
 +#ifdef RPM_VENDOR_POKY
 +    if (scriptletWrapper && *scriptletWrapper) {
-+        argv[argc++] = scriptletWrapper;
++	argv[argc++] = scriptletWrapper;
 +	argv[argc] = rpmtsRootDir(ts);
 +	if (!argv[argc] || !*argv[argc])
 +	   argv[argc] = "/";
@@ -51,10 +52,10 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
 +#endif
 +
 +    if (Phe->p.argv == NULL) {
-+        argv[argc++] = "/bin/sh";
++	argv[argc++] = "/bin/sh";
  	ldconfig_done = 0;
      } else {
--	argv = alloca((Phe->c + 4) * sizeof(*argv));
+-	argv = (const char **) alloca((Phe->c + 4) * sizeof(*argv));
 -	memcpy(argv, Phe->p.argv, Phe->c * sizeof(*argv));
 -	argc = Phe->c;
 +	memcpy((argv + argc), Phe->p.argv, Phe->c * sizeof(*argv));
@@ -62,7 +63,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
  	ldconfig_done = (ldconfig_path && !strcmp(argv[0], ldconfig_path)
  		? 1 : 0);
      }
-@@ -916,7 +935,12 @@
+@@ -925,7 +944,12 @@ assert(he->p.str != NULL);
  	    goto exit;
  
  	if (rpmIsDebug() &&
@@ -76,7 +77,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
  	{
  	    static const char set_x[] = "set -x\n";
  	    nw = Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
-@@ -1051,12 +1075,22 @@
+@@ -1060,12 +1084,22 @@ assert(he->p.str != NULL);
  
  	{   const char * rootDir = rpmtsRootDir(ts);
  	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
@@ -99,7 +100,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
  	    xx = Chdir("/");
  	    rpmlog(RPMLOG_DEBUG, D_("%s: %s(%s)\texecv(%s) pid %d\n"),
  			psm->stepName, sln, NVRA,
-@@ -2961,6 +2995,13 @@
+@@ -2977,6 +3011,13 @@ assert(psm->te != NULL);
      case PSM_SCRIPT:	/* Run current package scriptlets. */
  	/* XXX running %verifyscript/%sanitycheck doesn't have psm->te */
      {	rpmtxn _parent = (psm && psm->te ? psm->te->txn : NULL);
@@ -113,7 +114,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
  	xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
  	rc = runInstScript(psm);
  	if (rc)
-@@ -2968,11 +3009,24 @@
+@@ -2984,11 +3025,24 @@ assert(psm->te != NULL);
  	else
  	     xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
  	rpmtsGetRdb(ts)->db_txn = NULL;
@@ -138,7 +139,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
  	break;
      case PSM_IMMED_TRIGGERS:
  	/* Run triggers in this package other package(s) set off. */
-@@ -2982,7 +3036,18 @@
+@@ -2998,7 +3052,18 @@ assert(psm->te != NULL);
  	    F_SET(psm, GOTTRIGGERS);
  	}
  	if (psm->triggers != NULL)
diff --git a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
index 1667901..f29866b 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
@@ -16,20 +16,20 @@ RP 2012/2/7
  2 files changed, 152 insertions(+), 1 deletions(-)
  create mode 100644 tools/rpmdeps-oecore.c
 
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index f520843..2eba9bf 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
+Index: rpm-5.4.9/tools/Makefile.am
+===================================================================
+--- rpm-5.4.9.orig/tools/Makefile.am
++++ rpm-5.4.9/tools/Makefile.am
 @@ -58,7 +58,7 @@ pkgbin_PROGRAMS =	\
  	@WITH_AUGEAS_AUGTOOL@ chroot cp @WITH_CUDF_CUDFTOOL@ find mtree \
  	@WITH_SEMANAGE_SEMODULE@ wget \
  	rpmcache rpmdigest rpmrepo rpmspecdump \
 -	rpmcmp rpmdeps sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
 +	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
- dist_man_MANS =		rpmgrep.1
- 
- augtool_SOURCES =	augtool.c
-@@ -155,6 +155,10 @@ rpmdeps_SOURCES =	rpmdeps.c
+ if WITH_DB
+ pkgbin_PROGRAMS +=	dbconvert
+ endif
+@@ -168,6 +168,10 @@ rpmdeps_SOURCES =	rpmdeps.c
  rpmdeps_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
  rpmdeps_LDADD =		$(RPM_LDADD_COMMON)
  
@@ -40,11 +40,10 @@ index f520843..2eba9bf 100644
  rpmdigest_SOURCES =	rpmdigest.c
  rpmdigest_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
  rpmdigest_LDADD =	$(RPMIO_LDADD_COMMON)
-diff --git a/tools/rpmdeps-oecore.c b/tools/rpmdeps-oecore.c
-new file mode 100644
-index 0000000..e646da9
+Index: rpm-5.4.9/tools/rpmdeps-oecore.c
+===================================================================
 --- /dev/null
-+++ b/tools/rpmdeps-oecore.c
++++ rpm-5.4.9/tools/rpmdeps-oecore.c
 @@ -0,0 +1,147 @@
 +#include "system.h"
 +const char *__progname;
@@ -193,6 +192,3 @@ index 0000000..e646da9
 +    optCon = rpmcliFini(optCon);
 +    return ec;
 +}
--- 
-1.7.4.1
-
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.8.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
similarity index 82%
rename from meta/recipes-devtools/rpm/rpm_5.4.8.bb
rename to meta/recipes-devtools/rpm/rpm_5.4.9.bb
index ac86ff3..6eba802 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.8.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -42,14 +42,12 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "beecrypt bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
-extrarpmdeps = "python perl file"
-extrarpmdeps_virtclass-native = "python-native file-native"
-PR = "r39"
+DEPENDS = "libpcre attr acl popt file"
+PR = "r40"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;extract=rpm-5.4.8.tar.gz \
+SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;extract=rpm-5.4.9.tar.gz \
 	   file://rpm-log-auto-rm.patch \
 	   file://rpm-db-reduce.patch \
 	   file://perfile_rpmdeps.sh \
@@ -70,10 +68,11 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;ex
 	   file://rpm-respect-arch.patch \
 	   file://rpm-no-perl-urpm.patch \
 	   file://rpm-macros.patch \
+	   file://rpm-lua.patch \
 	  "
 
-SRC_URI[md5sum] = "424b60bf2e0a624a218440d943861644"
-SRC_URI[sha256sum] = "56eb5033d4de98c217475fb34d466d551f8912959389e7854a806e2bd9e13380"
+SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
+SRC_URI[sha256sum] = "bac7cc5bd9d0e8262fdc0099349924608da8f680f5cb243751f696552239dde8"
 
 inherit autotools gettext
 
@@ -83,63 +82,74 @@ acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
 rpm_macros_virtclass-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
 
-# Configure values taken from rpm.spec
-WITH_BZIP2 = "--with-bzip2"
+# sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
-WITH_XZ = "--with-xz=none"
+# Note: perl and sqlite w/o db specified does not currently work.
+#       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
+PACKAGECONFIG_virtclass-native ??= "db bzip2 zlib beecrypt openssl libelf python"
+PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
 
-WITH_Z = "--with-zlib $WITH_BZIP2 $WITH_XZ"
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz,"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
+PACKAGECONFIG[xar] = "--with-xar,--without-xar,xar,"
 
-WITH_PYTHON = "	--with-python=${PYTHON_BASEVERSION} \
+WITH_PYTHON = " --with-python=${PYTHON_BASEVERSION} \
 		--with-python-inc-dir=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
 		--with-python-lib-dir=${libdir}/python${PYTHON_BASEVERSION} \
-		--without-pythonembed \
-	      "
+		--without-pythonembed"
+PACKAGECONFIG[python] = "${WITH_PYTHON},--without-python,python,"
 
 # Perl modules are not built, but they could be enabled fairly easily
 # the perl module creation and installation would need to be patched.
 # (currently has host perl contamination issues)
-#WITH_PERL = "	--with-perl --without-perlembed"
-WITH_PERL = "	--without-perl --without-perl-urpm"
+WITH_PERL = "--with-perl --without-perlembed --without-perl-urpm"
+WITHOUT_PERL = "--without-perl --without-perl-urpm"
+PACKAGECONFIG[perl] = "${WITH_PERL},${WITHOUT_PERL},perl,"
 
-WITH_PERL_virtclass-native = " --without-perl --without-perl-urpm"
+# The --with-dbsql will only tell RPM to check for support, db
+# may or may not be built w/ the dbsql support.
+WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated"
+PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
 
-WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated --without-sqlite"
+PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
 
-WITH_CRYPTO = "--with-beecrypt --with-openssl --without-nss --without-gcrypt"
+PACKAGECONFIG[beecrypt] = "--with-beecrypt,--without-beecrypt,beecrypt,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
+PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
+PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils,"
+PACKAGECONFIG[libelf] = "--with-libelf,--without-libelf,elfutils,"
 
-WITH_KEYUTILS = "--without-keyutils"
-WITH_LIBELF = "--with-libelf"
-WITH_SELINUX = "--without-selinux --without-sepol --without-semanage"
-#WITH_NEON = "--with-neon=internal --without-libproxy --with-expat --without-gssapi"
-WITH_NEON = "--without-neon --without-libproxy --without-expat --without-gssapi"
+WITH_SELINUX = "--with-selinux --with-sepol --with-semanage"
+WITHOUT_SELINUX = "--without-selinux --without-sepol --without-semanage"
+PACKAGECONFIG[selinux] = "${WITH_SELINUX},${WITHOUT_SELINUX},selinux,"
 
-EXTRA_OECONF = "--verbose \
+WITH_NEON = "--with-neon --with-libproxy --with-expat --without-gssapi"
+WITHOUT_NEON = "--without-neon --without-libproxy --without-expat --without-gssapi"
+PACKAGECONFIG[neon] = "${WITH_NEON},${WITHOUT_NEON},neon,"
+
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,"
+PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
+
+PACAKGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
+
+EXTRA_OECONF += "--verbose \
 		--sysconfdir=/etc \
-		${WITH_DB} \
-		${WITH_Z} \
 		--with-file \
 		--with-path-magic=%{_usrlibrpm}/../../share/misc/magic.mgc \
-		--without-lua \
-		--without-tcl \
 		--with-syck=internal \
 		--without-readline \
-		--without-augeas \
-		${WITH_CRYPTO} \
 		--without-libtasn1 \
 		--without-pakchois \
 		--without-gnutls \
-		${WITH_NEON} \
 		--with-pcre \
 		--enable-utf8 \
 		--without-uuid \
 		--with-attr \
 		--with-acl \
-		--without-xar \
 		--with-popt=external \
-		${WITH_KEYUTILS} \
 		--with-pthreads \
-		${WITH_LIBELF} \
 		--without-cudf \
 		--without-ficl \
 		--without-aterm \
@@ -148,14 +158,11 @@ EXTRA_OECONF = "--verbose \
 		--without-rc \
 		--without-js \
 		--without-gpsee \
-		${WITH_PYTHON} \
-		${WITH_PERL} \
 		--without-ruby \
 		--without-squirrel \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
-                --without-xz \
 		--disable-openmp \
 		--enable-build-pic \
 		--enable-build-versionscript \
@@ -167,7 +174,7 @@ EXTRA_OECONF = "--verbose \
 		--with-bugreport=http://bugzilla.yoctoproject.org \
 		--program-prefix="
 
-CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
+CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
@@ -175,7 +182,7 @@ SOLIBS = "5.4.so"
 
 # Based on %files section in the rpm.spec
 
-FILES_${PN} = "${bindir}/rpm \
+FILES_${PN} =  "${bindir}/rpm \
 		${bindir}/rpmconstant \
 		${libdir}/rpm/rpm.* \
 		${libdir}/rpm/tgpg \
@@ -193,15 +200,10 @@ FILES_${PN} = "${bindir}/rpm \
 		${libdir}/rpm/bin/rpmspecdump \
 		${libdir}/rpm/bin/wget \
 		/var/lib/rpm \
+		/var/cache/rpm \
+		/var/volatile/cache/rpm \
 		"
 
-#		${libdir}/rpm/magic
-#		${libdir}/rpm/magic.mgc
-#		${libdir}/rpm/magic.mime
-#		${libdir}/rpm/magic.mime.mgc
-#		${libdir}/rpm/bin/db_*
-#		${libdir}/rpm/bin/grep
-
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 		${libdir}/rpm/bin/.debug \
 		"
@@ -220,12 +222,6 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmbuild-*.so \
 		"
 
-###%{_rpmhome}/lib/libxar.so.*
-###%{_rpmhome}/lib/libjs.so.*
-###%{_rpmhome}/lib/librpmjsm.so.*
-###%{_rpmhome}/lib/rpmjsm.so
-
-
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
 		${libdir}/rpm/brp-* \
@@ -271,8 +267,6 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/bin/rpmlua \
 		${libdir}/rpm/bin/rpmluac \
 		${libdir}/rpm/bin/sqlite3 \
-		${libdir}/rpm/lib/liblua.a \
-		${libdir}/rpm/lib/liblua.la \
 		${libdir}/rpm/macros.d/cmake \
 		${libdir}/rpm/macros.d/java \
 		${libdir}/rpm/macros.d/libtool \
@@ -293,9 +287,6 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		"
 RDEPENDS_${PN}-build = "file"
 
-#%rpmattr       %{_rpmhome}/gem_helper.rb
-#%rpmattr       %{_rpmhome}/symclash.*
-
 FILES_python-rpm-dbg = "${libdir}/python*/rpm/.debug/_*"
 FILES_python-rpm-staticdev = "${libdir}/python*/rpm/*.a"
 FILES_python-rpm = "${libdir}/python*/rpm"
@@ -319,6 +310,7 @@ FILES_${PN}-dev = "${includedir}/rpm \
 		${libdir}/librpmmisc.so \
 		${libdir}/librpmbuild.la \
 		${libdir}/librpmbuild.so \
+		${libdir}/rpm/lib/liblua.la \
 		${libdir}/pkgconfig/rpm.pc \
 		"
 
@@ -329,18 +321,9 @@ FILES_${PN}-staticdev = " \
 		${libdir}/librpmio.a \
 		${libdir}/librpmmisc.a \
 		${libdir}/librpmbuild.a \
+		${libdir}/rpm/lib/liblua.a \
 		"
 
-###%{_rpmhome}/lib/libxar.a
-###%{_rpmhome}/lib/libxar.la
-###%{_rpmhome}/lib/libxar.so
-###%{_rpmhome}/lib/libjs.a
-###%{_rpmhome}/lib/libjs.la
-###%{_rpmhome}/lib/libjs.so
-###%{_rpmhome}/lib/librpmjsm.a
-###%{_rpmhome}/lib/librpmjsm.la
-###%{_rpmhome}/lib/librpmjsm.so
-
 do_configure() {
 	# Disable tests!
 	echo "all:" > tests/Makefile.am
@@ -348,6 +331,7 @@ do_configure() {
 	./autogen.sh
 
 	export varprefix=${localstatedir}
+	export CC_FOR_BUILD="${BUILD_CC}"
 	oe_runconf
 }
 
@@ -424,6 +408,8 @@ do_install_append() {
 	rm -f ${D}/${libdir}/rpm/bin/dbconvert
 	rm -f ${D}/${libdir}/rpm/bin/pom2spec
 
+	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
+	rm -f ${D}/usr/lib/rpm/bin/api-sanity-checker.pl
 }
 
 do_install_append_virtclass-native() {
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
new file mode 100644
index 0000000..8268a2d
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
@@ -0,0 +1,28 @@
+commit 6c47ad415246cc3a3edac2e1637106d330574c85
+Author: Mark Hatle <mark.hatle@windriver.com>
+Date:   Fri May 11 19:05:09 2012 -0500
+
+    RpmHeader.cc: RPM 5.4.9 integration
+    
+    _RPMVSF_xxx - NODIGEST, NOSIGNATURES, NOHEADER, and NOPAYLOAD
+    are now obsolete and no longer supported.
+    
+    Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/zypp/target/rpm/RpmHeader.cc b/zypp/target/rpm/RpmHeader.cc
+index 1224ecd..c96dae6 100644
+--- a/zypp/target/rpm/RpmHeader.cc
++++ b/zypp/target/rpm/RpmHeader.cc
+@@ -230,10 +230,12 @@ RpmHeader::constPtr RpmHeader::readPackage( const Pathname & path_r,
+   librpmDb::globalInit();
+   rpmts ts = ::rpmtsCreate();
+   unsigned vsflag = RPMVSF_DEFAULT;
++#if !defined(_RPM_5)
+   if ( verification_r & NODIGEST )
+     vsflag |= _RPMVSF_NODIGESTS;
+   if ( verification_r & NOSIGNATURE )
+     vsflag |= _RPMVSF_NOSIGNATURES;
++#endif
+   ::rpmtsSetVSFlags( ts, rpmVSFlags(vsflag) );
+ 
+   Header nh = 0;
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 3c3a9f0..c5761d5 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev libproxy"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r20"
+PR = "r21"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
 	   file://fix_for_compile_wth_gcc-4.6.0.patch \
 	   file://hardcode-lib-fix.patch \
 	   file://close.patch \
+	   file://libzypp-rpm549.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
-- 
1.7.3.4



