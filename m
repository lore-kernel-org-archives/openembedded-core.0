Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 78AC76E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 16:28:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 14 Feb 2017 08:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,162,1484035200"; d="scan'208";a="65070750"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2017 08:28:26 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 10:31:47 -0600
Message-Id: <1487089908-9840-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] license.bbclass: Don't copy again LICENSE already handled as no-generic
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

The NO_GENERIC_LICENSE mapping was added [1] to enable copy LICENSES
from upstream source code into recipe licenses, previously that only
common-licenses was processed.

This result on copy twice the NO_GENERIC_LICENSE specified because there
is a mapping between license in LIC_CHKSUM and NO_GENERIC_LICENSE.

In order to avoid double copy one as generic_ and other as LICENSE. keep
track of licenses already copied.

For linux-firmware the result will be only generic_ licenses into
common-licenses.

[YOCTO #10325]

[1]
http://lists.openembedded.org/pipermail/openembedded-core/2015-April/104222.html

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 44467d0..3c5e49e 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -398,6 +398,8 @@ def find_license_files(d):
     generic_directory = d.getVar('COMMON_LICENSE_DIR')
     # List of basename, path tuples
     lic_files_paths = []
+    # hash for keep track generic lics mappings
+    non_generic_lics = {}
     # Entries from LIC_FILES_CHKSUM
     lic_chksums = {}
     license_source_dirs = []
@@ -459,6 +461,7 @@ def find_license_files(d):
             # of the package rather than the license_source_dirs.
             lic_files_paths.append(("generic_" + license_type,
                                     os.path.join(srcdir, non_generic_lic)))
+            non_generic_lics[non_generic_lic] = license_type
         else:
             # Add explicity avoid of CLOSED license because this isn't generic
             if license_type != 'CLOSED':
@@ -492,6 +495,9 @@ def find_license_files(d):
         lic_chksum_paths[os.path.basename(path)][chksum] = os.path.join(srcdir, path)
     for basename, files in lic_chksum_paths.items():
         if len(files) == 1:
+            # Don't copy again a LICENSE already handled as non-generic
+            if basename in non_generic_lics:
+                continue
             lic_files_paths.append((basename, list(files.values())[0]))
         else:
             # If there are multiple different license files with identical
-- 
2.1.4


