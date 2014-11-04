Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11AFB71F94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 17:14:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 09:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="631275915"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2014 09:14:33 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:14:58 -0600
Message-Id: <1415121300-16524-7-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
References: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 6/8] license_class: license_create_manifest improve package file read
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
X-List-Received-Date: Tue, 04 Nov 2014 17:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Improved package file read using oe.packagedata.read_pkgdatafile
instead of doing itself.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f2dd0eb..d462b0a 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -28,6 +28,7 @@ python write_package_manifest() {
 python license_create_manifest() {
     import re
     import oe.license
+    import oe.packagedata
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
     bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
@@ -84,25 +85,11 @@ python license_create_manifest() {
         for pkg in pkg_list:
             pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
                                     'runtime-reverse', pkg)
-            with open(pkg_info, "r") as pkg_info_file:
-                pkg_dic[pkg] = {}
+            pkg_lic_name = "LICENSE_" + os.path.basename(os.readlink(pkg_info))
 
-                pkg_lic_name = os.path.basename(os.readlink(pkg_info))
-
-                for line in pkg_info_file.read().split("\n"):
-                    if re.match("^PN: .*$", line):
-                        pkg_dic[pkg]["PN"] = re.search("PN: (.*)$", line).group(1)
-
-                    if re.match("^PV: .*$", line):
-                        pkg_dic[pkg]["PV"] = re.search("PV: (.*)$", line).group(1)
-
-                    if re.match("^LICENSE_%s: (.*)$" % re.escape(pkg_lic_name)
-                                , line):
-                        pkg_dic[pkg]["LICENSE"] = re.search("^LICENSE_%s: (.*)$"
-                                    % pkg_lic_name, line).group(1)
-                    elif re.match("^LICENSE: (.*)$", line):
-                        pkg_dic[pkg]["LICENSE"] = re.search("^LICENSE: (.*)$",
-                                    line).group(1)
+            pkg_dic[pkg] = oe.packagedata.read_pkgdatafile(pkg_info)
+            if not "LICENSE" in pkg_dic[pkg].keys():
+               pkg_dic[pkg]["LICENSE"] = pkg_dic[pkg][pkg_lic_name]
 
     license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                         d.getVar('IMAGE_NAME', True), 'license.manifest')
-- 
1.9.1


