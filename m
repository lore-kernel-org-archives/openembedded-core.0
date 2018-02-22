Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97B6B78704
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:15:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1M9FX9W016629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:15:34 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 22 Feb 2018 01:15:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 17:19:42 +0800
Message-ID: <af832ef5c50622d1f4dd6b642cae79f8ed44287e.1519291029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1519291029.git.liezhi.yang@windriver.com>
References: <cover.1519291029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] git: 2.15.0 -> 2.16.1
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
X-List-Received-Date: Thu, 22 Feb 2018 09:15:32 -0000
Content-Type: text/plain

Add /usr/share/git-core/templates/hooks/fsmonitor-watchman.sample to PERLTOOLS to fix:
ERROR: git-2.16.1-r0 do_package_qa: QA Issue: /usr/share/git-core/templates/hooks/fsmonitor-watchman.sample contained in package git requires /usr/bin/perl, but no providers found in RDEPENDS_git? [file-rdeps]
ERROR: git-2.16.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc       |  2 ++
 meta/recipes-devtools/git/git_2.15.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.16.1.bb | 11 +++++++++++
 3 files changed, 13 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.15.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.16.1.bb

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9b4c128..dd9d792 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -116,6 +116,7 @@ PERLTOOLS = " \
     ${datadir}/gitweb/gitweb.cgi \
     ${datadir}/git-core/templates/hooks/prepare-commit-msg.sample \
     ${datadir}/git-core/templates/hooks/pre-rebase.sample \
+    ${datadir}/git-core/templates/hooks/fsmonitor-watchman.sample \
 "
 
 # Git tools requiring perl
@@ -125,6 +126,7 @@ FILES_${PN}-perltools += " \
     ${libdir}/perl \
     ${datadir}/perl \
 "
+
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
 # git-tk package with gitk and git-gui
diff --git a/meta/recipes-devtools/git/git_2.15.0.bb b/meta/recipes-devtools/git/git_2.15.0.bb
deleted file mode 100644
index fd6c931..0000000
--- a/meta/recipes-devtools/git/git_2.15.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "1ed7298833336c1accb0a7be5a7a2b1b"
-SRC_URI[tarball.sha256sum] = "25762cc50103a6a0665c46ea33ceb0578eee01c19b6a08fd393e8608ccbdb3da"
-SRC_URI[manpages.md5sum] = "19a0116bcb0779e0bc997c4180018daf"
-SRC_URI[manpages.sha256sum] = "3b1b9ebf02d4aa6e741becd1ed9319597488743f939fdab3b894ec52d25408ef"
diff --git a/meta/recipes-devtools/git/git_2.16.1.bb b/meta/recipes-devtools/git/git_2.16.1.bb
new file mode 100644
index 0000000..9dc4eba
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.16.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "37467da8e79e72f28598d667f219f75e"
+SRC_URI[tarball.sha256sum] = "56cfa48af2b289bba172ca0a47c29f0083f5846cf4759978b70988e4f07fc9fd"
+SRC_URI[manpages.md5sum] = "5587407f3c28446af12fde3f3131ba34"
+SRC_URI[manpages.sha256sum] = "d499e825f429d76862be415f579c20cc26b046573a3a39237acaf9682cb71be7"
-- 
2.7.4


