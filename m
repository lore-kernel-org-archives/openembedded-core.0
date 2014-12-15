Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97B5265E38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBF9NI90005262
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Dec 2014 01:23:18 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Dec 2014 01:23:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Dec 2014 17:23:03 +0800
Message-ID: <536e3e63a536745f3f15354277373d2d83740e63.1418634986.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418634986.git.hongxu.jia@windriver.com>
References: <cover.1418634986.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: jeffrey.honig@windriver.com
Subject: [PATCH 1/3] base/license.bbclass: expand wildcards in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Mon, 15 Dec 2014 09:23:26 -0000
Content-Type: text/plain

The whitelist processing in code in base.bbclass does not play well with
wildcards in INCOMPATIBLE_LICENSES. The code expects bad_licenses to
contain actual license names, not wildcards.

Add incompatible_license_contains to replace bb.utils.contains(
"INCOMPATIBLE_LICENSE", **, **, **, d)

[YOCTO #5592]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/base.bbclass    |  2 +-
 meta/classes/license.bbclass | 25 +++++++++++++++++++++++++
 meta/conf/documentation.conf |  2 +-
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index de81a7d..06cfe26 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -443,7 +443,7 @@ python () {
                 check_license = False
 
         if check_license and bad_licenses:
-            bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+            bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
             whitelist = []
             for lic in bad_licenses:
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 14d3107..ea4c880 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -285,6 +285,31 @@ def canonical_license(d, license):
             lic += '+'
     return lic or license
 
+def expand_wildcard_licenses(d, wildcard_licenses):
+    """
+    Return actual spdx format license names if wildcard used. We expand
+    wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE_LICENSES values.
+    """
+    import fnmatch
+    licenses = []
+    spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
+    for wld_lic in wildcard_licenses:
+        spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
+        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
+
+    spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES') or '').split()
+    for wld_lic in wildcard_licenses:
+        licenses += fnmatch.filter(spdx_lics, wld_lic)
+
+    licenses = list(set(licenses))
+    return licenses
+
+def incompatible_license_contains(license, truevalue, falsevalue, d):
+    license = canonical_license(d, license)
+    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+    return truevalue if license in bad_licenses else falsevalue
+
 def incompatible_license(d, dont_want_licenses, package=None):
     """
     This function checks if a recipe has only incompatible licenses. It also
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 5564316..2ab86e1 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -223,7 +223,7 @@ IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in t
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
 IMAGE_TYPES[doc] = "Specifies the complete list of supported image types by default."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
-INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build."
+INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build. Wildcard is supported, such as '*GPLv3'"
 INHIBIT_DEFAULT_DEPS[doc] = "Prevents the default dependencies, namely the C compiler and standard C library (libc), from being added to DEPENDS."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
-- 
1.9.1


