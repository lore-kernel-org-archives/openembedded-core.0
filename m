Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAEDA72DAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 19:17:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1AJHtgg020104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Feb 2015 11:17:55 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 11:17:55 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 14:17:37 -0500
Message-ID: <1423595858-24970-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1423595858-24970-1-git-send-email-paul.gortmaker@windriver.com>
References: <1423595858-24970-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] git: expand recipe to take advantage of pre-gen'd manpages
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
X-List-Received-Date: Tue, 10 Feb 2015 19:18:00 -0000
Content-Type: text/plain

These could be created from scratch from git itself, but it
requires asciidoc, xsltproc, python bits and too much other
baggage.  Since the git folks issue a tarball with the manpages
for each release, it is simpler to just go get that.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-devtools/git/git.inc      | 11 ++++++++++-
 meta/recipes-devtools/git/git_2.2.1.bb |  6 ++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 53966287902c..59f1c00521fc 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -5,7 +5,9 @@ DEPENDS = "openssl curl zlib expat"
 
 PROVIDES_append_class-native = " git-replacement-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
@@ -30,6 +32,12 @@ do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
+	install -d ${D}/${mandir}/man1
+	install -d ${D}/${mandir}/man5
+	install -d ${D}/${mandir}/man7
+	install -t ${D}/${mandir}/man1 ${WORKDIR}/man1/*
+	install -t ${D}/${mandir}/man5 ${WORKDIR}/man5/*
+	install -t ${D}/${mandir}/man7 ${WORKDIR}/man7/*
 }
 
 perl_native_fixup () {
@@ -64,6 +72,7 @@ do_install_append_class-nativesdk() {
 }
 
 FILES_${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
+FILES_${PN}-doc = "${mandir}"
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
 PERLTOOLS = " \
diff --git a/meta/recipes-devtools/git/git_2.2.1.bb b/meta/recipes-devtools/git/git_2.2.1.bb
index 2d47cda7752e..d1fcb2758750 100644
--- a/meta/recipes-devtools/git/git_2.2.1.bb
+++ b/meta/recipes-devtools/git/git_2.2.1.bb
@@ -1,7 +1,9 @@
 require git.inc
 
-SRC_URI[md5sum] = "ff41fdb094eed1ec430aed8ee9b9849c"
-SRC_URI[sha256sum] = "367a77d0b10a5070b02a0fb0e942f26f25af61793128e0ddfd5c5c474de93589"
+SRC_URI[tarball.md5sum] = "ff41fdb094eed1ec430aed8ee9b9849c"
+SRC_URI[tarball.sha256sum] = "367a77d0b10a5070b02a0fb0e942f26f25af61793128e0ddfd5c5c474de93589"
+SRC_URI[manpages.md5sum] = "b5ddd262b608804ba4403f0f82d881d7"
+SRC_URI[manpages.sha256sum] = "69dcb3decdb33dd35491935e80f71c40c576b536df4223eb98d5f7ccd9643293"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
2.2.1


