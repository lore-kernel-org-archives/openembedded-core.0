Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40D1A78AB2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 04:02:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w63428l8023000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2018 21:02:08 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 2 Jul 2018 21:02:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2018 12:11:55 +0800
Message-ID: <6e8cddd54499f46e091ddc2387d499c2138f81b4.1530591075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530591075.git.liezhi.yang@windriver.com>
References: <cover.1530591075.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] git: 2.16.1 -> 2.17.0
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
X-List-Received-Date: Tue, 03 Jul 2018 04:02:07 -0000
Content-Type: text/plain

* Removed code for "${D}${exec_prefix}/lib/perl-native/perl" since there is no
  such a directory now.
* Fixed perl related code.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc       | 12 ++----------
 meta/recipes-devtools/git/git_2.16.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.17.0.bb | 11 +++++++++++
 3 files changed, 13 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.17.0.bb

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index dd9d792..26a22ac 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -52,13 +52,6 @@ perl_native_fixup () {
 	       -e 's#${libdir}/perl-native/#${libdir}/#' \
 	    ${@d.getVar("PERLTOOLS").replace(' /',d.getVar('D') + '/')}
 
-	# ${libdir} is not applicable here, perl-native files are always
-	# installed to /usr/lib on both 32/64 bits targets.
-
-	mkdir -p ${D}${libdir}
-	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${libdir}
-	rmdir -p ${D}${exec_prefix}/lib/perl-native || true
-
 	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'cvsserver', d)}" ]; then
 		# Only install the git cvsserver command if explicitly requested
 		# as it requires the DBI Perl module, which does not exist in
@@ -72,8 +65,7 @@ perl_native_fixup () {
 		# if explicitly requested as they require the SVN::Core Perl
 		# module, which does not exist in OE-Core.
 		rm -r ${D}${libexecdir}/git-core/git-svn \
-		      ${D}${libdir}/perl/site_perl/*/Git/SVN*
-		sed -i -e '/SVN/d' ${D}${libdir}/perl/site_perl/*/auto/Git/.packlist
+		      ${D}${datadir}/perl5/Git/SVN*
 	fi
 }
 
@@ -124,7 +116,7 @@ PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
     ${libdir}/perl \
-    ${datadir}/perl \
+    ${datadir}/perl5 \
 "
 
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
diff --git a/meta/recipes-devtools/git/git_2.16.1.bb b/meta/recipes-devtools/git/git_2.16.1.bb
deleted file mode 100644
index 9dc4eba..0000000
--- a/meta/recipes-devtools/git/git_2.16.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "37467da8e79e72f28598d667f219f75e"
-SRC_URI[tarball.sha256sum] = "56cfa48af2b289bba172ca0a47c29f0083f5846cf4759978b70988e4f07fc9fd"
-SRC_URI[manpages.md5sum] = "5587407f3c28446af12fde3f3131ba34"
-SRC_URI[manpages.sha256sum] = "d499e825f429d76862be415f579c20cc26b046573a3a39237acaf9682cb71be7"
diff --git a/meta/recipes-devtools/git/git_2.17.0.bb b/meta/recipes-devtools/git/git_2.17.0.bb
new file mode 100644
index 0000000..915ed2e
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.17.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "4e1c44b87ecdf41c7538b6c4a95dae08"
+SRC_URI[tarball.sha256sum] = "7a0cff35dbb14b77dca6924c33ac9fe510b9de35d5267172490af548ec5ee1b8"
+SRC_URI[manpages.md5sum] = "e006bb1e890afce4e55cfafffb34d871"
+SRC_URI[manpages.sha256sum] = "41b58c68e90e4c95265c75955ddd5b68f6491f4d57b2f17c6d68e60bbb07ba6a"
-- 
2.7.4


