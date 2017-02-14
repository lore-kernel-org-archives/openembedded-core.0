Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 87379731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 16:28:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 14 Feb 2017 08:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,162,1484035200"; d="scan'208";a="65070756"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2017 08:28:27 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 10:31:48 -0600
Message-Id: <1487089908-9840-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1487089908-9840-1-git-send-email-anibal.limon@linux.intel.com>
References: <1487089908-9840-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] classes/license.bbclass: Don't copy unneeded licenses by package
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
X-List-Received-Date: Tue, 14 Feb 2017 16:28:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Usually a recipe only provides one package but when provides more
than one package the LICENSE variable per package (i.e. linux-firmware)
needs to take into account to avoid unnecesary copy of licenses into
packages.

The patch validates if LICENSE exists in package LICENSES in order to
don't copy unneeded licenses.

As result of this patch some packages will not contain licenses there
are not into LICENSE variable.

For example:

acl contains GPLv2+ instead of GPLv2+ and LGPLv2.1+
libacl contains LGPLv2+ instead of GPLv2+ and LGPLv2.1+

This behaviour is declared on the acl recipe as:

SUMMARY = "Utilities for managing POSIX Access Control Lists"
HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
SECTION = "libs"

LICENSE = "LGPLv2.1+ & GPLv2+"
LICENSE_${PN} = "GPLv2+"
LICENSE_lib${BPN} = "LGPLv2.1+"

[YOCTO #10325]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 3c5e49e..f9fb5bb 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -131,6 +131,10 @@ def write_license_files(d, license_manifest, pkg_dic):
                 bb.utils.mkdirhier(pkg_rootfs_license_dir)
                 pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                                             pkg_dic[pkg]["PN"]) 
+
+                pkg_manifest_licenses = [canonical_license(d, lic) \
+                        for lic in pkg_dic[pkg]["LICENSES"]]
+
                 licenses = os.listdir(pkg_license_dir)
                 for lic in licenses:
                     rootfs_license = os.path.join(rootfs_license_dir, lic)
@@ -138,9 +142,18 @@ def write_license_files(d, license_manifest, pkg_dic):
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
                     if re.match("^generic_.*$", lic):
-                        generic_lic = re.search("^generic_(.*)$", lic).group(1)
-                        if oe.license.license_ok(canonical_license(d,
-                            generic_lic), bad_licenses) == False:
+                        generic_lic = canonical_license(d,
+                                re.search("^generic_(.*)$", lic).group(1))
+
+                        # Do not copy generic license into package if isn't
+                        # declared into LICENSES of the package.
+                        if not re.sub('\+$', '', generic_lic) in \
+                                [re.sub('\+', '', lic) for lic in \
+                                 pkg_manifest_licenses]:
+                            continue
+
+                        if oe.license.license_ok(generic_lic,
+                                bad_licenses) == False:
                             continue
 
                         if not os.path.exists(rootfs_license):
@@ -488,7 +501,6 @@ def find_license_files(d):
         bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     except SyntaxError:
         bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
-
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
     for path, chksum in lic_chksums.items():
-- 
2.1.4


