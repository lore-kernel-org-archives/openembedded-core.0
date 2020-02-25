Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Feb 2020 21:29:58 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D4E166150B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 21:29:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2020 13:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="271467670"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2020 13:22:52 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 13:22:33 -0800
Message-Id: <20200225212233.30114-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Tue, 25 Feb 2020 21:29:59 -0000
Content-Transfer-Encoding: 8bit

Upstream release notes:
"
0.4231 - Wed Jan 29 08:47:56 CET 2020

  - Released 0.42_30 without code changes

0.42_30 - Wed Jul 31 13:15:39 CEST 2019

  - Add dependency on ExtUtils::PL2Bat
"

Add ptest RDEPENDS:
  - ExtUtils::Command::MM for t/compat.t
  - gcc, make didn't seem like enough for ptest, replace with
    packagegroup-core-buildessential which definitely works
  - perl-dev for EXTERN.h in t/xs.t

Add INSANE_SKIP dev-deps for the -ptest package because of perl-dev

Five tests from t/help.t are skipped because they are TODO

t/par.t is skipped because PAR::Dist (0.17+) is not present

t/ppm.t is skipped because "HTML support not installed"

All other tests pass.
---
 ...001-Committing-changes-from-do_patch.patch | 22 +++++++++++++++++++
 ...4229.bb => libmodule-build-perl_0.4231.bb} | 16 +++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/libmodule-build-perl/0001-Committing-changes-from-do_patch.patch
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4229.bb => libmodule-build-perl_0.4231.bb} (87%)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl/0001-Committing-changes-from-do_patch.patch b/meta/recipes-devtools/perl/libmodule-build-perl/0001-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..398f94ec5f
--- /dev/null
+++ b/meta/recipes-devtools/perl/libmodule-build-perl/0001-Committing-changes-from-do_patch.patch
@@ -0,0 +1,22 @@
+From e1d8264d1d88456ce608a51b9a8f4addb0da6e3b Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Thu, 20 Feb 2020 19:55:31 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ lib/Module/Build/Base.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Module/Build/Base.pm b/lib/Module/Build/Base.pm
+index b900b17..a97a722 100644
+--- a/lib/Module/Build/Base.pm
++++ b/lib/Module/Build/Base.pm
+@@ -3089,7 +3089,7 @@ sub fix_shebang_line { # Adapted from fixin() in ExtUtils::MM_Unix 1.35
+ 
+     my ($cmd, $arg) = (split(' ', $line, 2), '');
+     next unless $cmd =~ /perl/i;
+-    my $interpreter = $self->{properties}{perl};
++    my $interpreter = "/usr/bin/perl";
+ 
+     $self->log_verbose("Changing sharpbang in $file to $interpreter\n");
+     my $shb = '';
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
similarity index 87%
rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index e3ba40d96c..91dbfb8606 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -15,9 +15,11 @@ LIC_FILES_CHKSUM = "file://README;beginline=949;endline=954;md5=624c06db56a2af4d
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
            file://run-ptest \
-          "
-SRC_URI[md5sum] = "1447d9e02e63f7a1643986789a8f1ba9"
-SRC_URI[sha256sum] = "1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18"
+           file://ptest-perl/run-ptest \
+           file://0001-Committing-changes-from-do_patch.patch \
+           "
+SRC_URI[md5sum] = "066b193e461d7dfe1eca17a139353001"
+SRC_URI[sha256sum] = "7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717"
 
 S = "${WORKDIR}/Module-Build-${PV}"
 
@@ -75,9 +77,10 @@ RDEPENDS_${PN} += " \
 "
 
 RDEPENDS_${PN}-ptest += " \
-    gcc \
-    make \
+    packagegroup-core-buildessential \
+    perl-dev \
     perl-module-blib \
+    perl-module-extutils-command-mm \
     perl-module-file-temp \
     perl-module-lib \
     perl-module-perlio \
@@ -103,4 +106,7 @@ RPROVIDES_${PN} += "\
     libmodule-build-podparser-perl \
 "
 
+# t/xs.t RDEPENDS on "EXTERN.h" provided by perl-dev
+INSANE_SKIP_${PN}-ptest = "dev-deps"
+
 BBCLASSEXTEND = "native"
-- 
2.24.0


