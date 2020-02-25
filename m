Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4F66F615E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 23:46:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2020 15:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="226521914"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga007.jf.intel.com with ESMTP; 25 Feb 2020 15:46:08 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 15:46:03 -0800
Message-Id: <20200225234603.36012-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Tue, 25 Feb 2020 23:46:08 -0000
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

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...rl_0.4229.bb => libmodule-build-perl_0.4231.bb} | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4229.bb => libmodule-build-perl_0.4231.bb} (90%)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
similarity index 90%
rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index e3ba40d96c..b1967c7b03 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=949;endline=954;md5=624c06db56a2af4d
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
            file://run-ptest \
-          "
-SRC_URI[md5sum] = "1447d9e02e63f7a1643986789a8f1ba9"
-SRC_URI[sha256sum] = "1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18"
+           "
+SRC_URI[md5sum] = "066b193e461d7dfe1eca17a139353001"
+SRC_URI[sha256sum] = "7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717"
 
 S = "${WORKDIR}/Module-Build-${PV}"
 
@@ -75,9 +75,10 @@ RDEPENDS_${PN} += " \
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
@@ -103,4 +104,7 @@ RPROVIDES_${PN} += "\
     libmodule-build-podparser-perl \
 "
 
+# t/xs.t RDEPENDS on "EXTERN.h" provided by perl-dev
+INSANE_SKIP_${PN}-ptest = "dev-deps"
+
 BBCLASSEXTEND = "native"
-- 
2.24.0


