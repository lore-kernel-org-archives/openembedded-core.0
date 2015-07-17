Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF30F7589F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:31:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H2VnCw018275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:31:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 19:31:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 19:31:46 -0700
Message-ID: <a6959c48d7cb4873c2cf9523a287a7651f3aba3e.1437100265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1437100265.git.liezhi.yang@windriver.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] git: 2.4.4 -> 2.4.5
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
X-List-Received-Date: Fri, 17 Jul 2015 02:31:51 -0000
Content-Type: text/plain

* Use git repo rathar then tarball.
* Rename git_2.4.4.bb -> git_git.bb.
* Remove the commands for installing manual since they are already
  installed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc      |   14 +++++---------
 meta/recipes-devtools/git/git_2.4.4.bb |   11 -----------
 meta/recipes-devtools/git/git_git.bb   |    6 ++++++
 3 files changed, 11 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.4.4.bb
 create mode 100644 meta/recipes-devtools/git/git_git.bb

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4da4a27..39b4a79 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -6,10 +6,12 @@ DEPENDS = "openssl curl zlib expat"
 
 PROVIDES_append_class-native = " git-replacement-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+SRC_URI = "git://github.com/git/git.git"
 
-S = "${WORKDIR}/git-${PV}"
+SRCREV = "0df0541bf13723658d31b8d1376b505b710e63c6"
+PV = "2.4.5+git${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
@@ -33,12 +35,6 @@ do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
-	install -d ${D}/${mandir}/man1
-	install -d ${D}/${mandir}/man5
-	install -d ${D}/${mandir}/man7
-	install -t ${D}/${mandir}/man1 ${WORKDIR}/man1/*
-	install -t ${D}/${mandir}/man5 ${WORKDIR}/man5/*
-	install -t ${D}/${mandir}/man7 ${WORKDIR}/man7/*
 	install -d ${D}/${datadir}/bash-completion/completions/
 	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
 }
diff --git a/meta/recipes-devtools/git/git_2.4.4.bb b/meta/recipes-devtools/git/git_2.4.4.bb
deleted file mode 100644
index f9c81ed..0000000
--- a/meta/recipes-devtools/git/git_2.4.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-SRC_URI[tarball.md5sum] = "f122606aee328de3e1019cde720cb0aa"
-SRC_URI[tarball.sha256sum] = "a5d9e3e340a3e5a297092430752f61a9ae5b8b5e4ac042b0341d17189e653456"
-SRC_URI[manpages.md5sum] = "285b126907d59647248577a7df01c44c"
-SRC_URI[manpages.sha256sum] = "15afc42909078909ca7a48d73b7cb358b37f734b81fc3a0c6438be183f05480f"
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
diff --git a/meta/recipes-devtools/git/git_git.bb b/meta/recipes-devtools/git/git_git.bb
new file mode 100644
index 0000000..7099b89
--- /dev/null
+++ b/meta/recipes-devtools/git/git_git.bb
@@ -0,0 +1,6 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
-- 
1.7.9.5


