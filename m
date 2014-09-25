Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-01.prod.phx3.secureserver.net
	(p3plsmtpa09-01.prod.phx3.secureserver.net [173.201.193.230])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3C260144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 13:28:44 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-01.prod.phx3.secureserver.net with 
	id vRUj1o00C0BVjqb01RUk8G; Thu, 25 Sep 2014 06:28:45 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 08:28:29 -0500
Message-Id: <1411651709-18518-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1411148655-5500-1-git-send-email-pab@pabigot.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2] git: add Git perl module to perltools package
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
X-List-Received-Date: Thu, 25 Sep 2014 13:28:46 -0000

Git perl tools such as add--interactive load the Git module at runtime.
A previous patch to eliminate a QA error by deleting it instead of
packaging it was incorrect.

    beaglebone[62]$ git add -i
    Can't locate Git.pm in @INC (you may need to install the Git module) (@INC contains: /usr/lib/perl/5.20.0 /prj/pab/Utils/lib/perl5/linux-arm/5.020000 /prj/pab/Utils/lib/perl5/ /prj/pab/Utils/lib/perl5/site_perl/linux-arm /prj/pab/Utils/lib/perl5/site_perl /etc/perl /usr/lib/perl/site_perl/5.20.0/ /usr/lib/perl/site_perl/5.20.0 /usr/lib/perl/vendor_perl/5.20.0/ /usr/lib/perl/vendor_perl/5.20.0 /usr/lib/perl/5.20.0/ /usr/local/lib/site_perl .) at /usr/lib/git/git-core/git-add--interactive line 7.
    BEGIN failed--compilation aborted at /usr/lib/git/git-core/git-add--interactive line 7.

[YOCTO#3780]

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
V2:
- replace native cleanup command-in-variable with shell function
- invoke cleanup in nativesdk and target packages

 meta/recipes-devtools/git/git.inc | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 7633577..2515833 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -30,24 +30,21 @@ do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
-
-	# ${libdir} is not applicable here, perl-native files are always
-	# installed to /usr/lib on both 32/64 bits targets.
-	rm -rf ${D}${exec_prefix}/lib/perl-native
-	rmdir ${D}${exec_prefix}/lib || true
 }
 
-PERLSEDFIXUP = " \
+perl_native_fixup () {
 	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
 	       -e 's#${libdir}/perl-native/#${libdir}/#' \
-	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')} \
-"
+	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')}
+	mv ${D}${libdir}/perl-native/perl ${D}${libdir}
+	rmdir ${D}${libdir}/perl-native || true
+}
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
 REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
 
 do_install_append_class-target () {
-	${PERLSEDFIXUP}
+	perl_native_fixup
 }
 
 do_install_append_class-native() {
@@ -60,7 +57,7 @@ do_install_append_class-nativesdk() {
 	create_wrapper ${D}${bindir}/git \
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
-	${PERLSEDFIXUP}
+	perl_native_fixup
 }
 
 FILES_${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
@@ -90,6 +87,7 @@ PERLTOOLS = " \
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
+    ${libdir}/perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
-- 
1.8.5.5


