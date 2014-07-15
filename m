Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B49AA70239
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:10:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEAUon021287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:10:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:10:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:10:29 -0700
Message-ID: <0336436e7d51e7f01683a60000688920adaf6804.1405433212.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433212.git.liezhi.yang@windriver.com>
References: <cover.1405433212.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: add QA check: file-depends
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
X-List-Received-Date: Tue, 15 Jul 2014 14:10:34 -0000
Content-Type: text/plain

The ipk or deb can't depend on file such as "/usr/bin/perl", so it would
know nothing about perl, and there would be dependencies problems when
we run "apt-get install" on the target, this check can help us figure
out the depends, and the user can fix it manually.

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass  |    2 +-
 meta/classes/package.bbclass |   25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 106ace7..1a136b7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,7 +29,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir \
+            pn-overrides infodir file-depends \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 26a20d1..eaf7ddf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -52,6 +52,10 @@ LOCALE_SECTION ?= ''
 
 ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
 
+BASH_PATH ?= "${base_bindir}/bash"
+PERL_PATH ?= "${bindir}/perl"
+PYTHON_PATH ?= "${bindir}/python"
+
 # rpm is used for the per-file dependency identification
 PACKAGE_DEPENDS += "rpm-native"
 
@@ -1318,6 +1322,11 @@ python package_do_filedeps() {
     pool.close()
     pool.join()
 
+    # Used for converting file depends into pkg depends
+    prog_maps = {d.getVar("BASH_PATH", True): "bash",
+            d.getVar("PERL_PATH", True): "perl",
+            d.getVar("PYTHON_PATH", True): "python"}
+
     provides_files = {}
     requires_files = {}
 
@@ -1334,10 +1343,26 @@ python package_do_filedeps() {
             key = "FILERPROVIDES_" + file + "_" + pkg
             d.setVar(key, " ".join(provides[file]))
 
+        req_file_pkgs = []
         for file in requires:
             requires_files[pkg].append(file)
             key = "FILERDEPENDS_" + file + "_" + pkg
             d.setVar(key, " ".join(requires[file]))
+            for req_file in requires[file]:
+                if req_file in prog_maps and prog_maps[req_file] not in req_file_pkgs:
+                    if bb.data.inherits_class("nativesdk", d):
+                        req_file_pkgs.append("nativesdk-" + prog_maps[req_file])
+                    else:
+                        req_file_pkgs.append(prog_maps[req_file])
+
+        if req_file_pkgs:
+            rdepends = bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg, True) or "")
+            for p in req_file_pkgs:
+                if p not in rdepends:
+                    if p == "python" and "python3" in rdepends:
+                        continue
+                    msg = "RDEPENDS_%s should contain %s, please consider fixing it" %  (pkg, p)
+                    package_qa_handle_error("file-depends", msg, d)
 
     for pkg in requires_files:
         d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files[pkg]))
-- 
1.7.9.5


