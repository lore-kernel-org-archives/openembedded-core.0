Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QQTtK-0001UQ-Q0
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 02:30:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 May 2011 17:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,287,1304319600"; 
   d="scan'208";a="9008246"
Received: from unknown (HELO [10.255.13.47]) ([10.255.13.47])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2011 17:26:55 -0700
Message-ID: <4DE192CF.5050508@intel.com>
Date: Sat, 28 May 2011 17:26:55 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] license.bbclass: Infinite recursion of or nodes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 00:30:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


This fixes two bugs. When populate_lic was hitting | it was going
into an infinite recursion of the node.

Also, some LICENSE fields may start with "(". We want to avoid
invalid python syntax here, so we strip out the whitespace.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
  meta/classes/license.bbclass |   15 ++++++++-------
  1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index a4d34e7..3f93bf5 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -22,7 +22,7 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
  #
  # We should really discuss standardizing this field, but that's a longer term goal.
  # For now, we can do this and it should grab the most common LICENSE naming variations.
-#
+
  #GPL variations
  SPDXLICENSEMAP[GPL] = "GPL-1"
  SPDXLICENSEMAP[GPLv2] = "GPL-2"
@@ -77,7 +77,8 @@ python do_populate_lic() {
              op = node.op
              if isinstance(op, ast.BitOr):
                  x = LicenseVisitor()
-                x.visit(node)
+                x.visit(node.left)
+                x.visit(node.right)
              else:
                  ast.NodeVisitor.generic_visit(self, node)

@@ -96,7 +97,6 @@ python do_populate_lic() {
              pass

      def find_license(license_type):
-
          try:
              bb.mkdirhier(gen_lic_dest)
          except:
@@ -106,7 +106,7 @@ python do_populate_lic() {
          if not os.path.isfile(os.path.join(generic_directory, license_type)):
              if bb.data.getVarFlag('SPDXLICENSEMAP', license_type, d) != None:
                  # Great, there is an SPDXLICENSEMAP. We can copy!
-                bb.warn("We need to use a SPDXLICENSEMAP for %s" % (license_type))
+                bb.note("We need to use a SPDXLICENSEMAP for %s" % (license_type))
                  spdx_generic = bb.data.getVarFlag('SPDXLICENSEMAP', license_type, d)
                  copy_license(generic_directory, gen_lic_dest, spdx_generic)
                  link_license(gen_lic_dest, destdir, spdx_generic)
@@ -119,7 +119,6 @@ python do_populate_lic() {
              copy_license(generic_directory, gen_lic_dest, license_type)
              link_license(gen_lic_dest, destdir, license_type)

-
      # All the license types for the package
      license_types = bb.data.getVar('LICENSE', d, True)
      # All the license files for the package
@@ -131,7 +130,7 @@ python do_populate_lic() {
      srcdir = bb.data.getVar('S', d, True)
      # Directory we store the generic licenses as set in the distro configuration
      generic_directory = bb.data.getVar('COMMON_LICENSE_DIR', d, True)
-    bb.warn(generic_directory)
+
      try:
          bb.mkdirhier(destdir)
      except:
@@ -158,13 +157,15 @@ python do_populate_lic() {
      gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d, True), "common-licenses")

      clean_licenses = ""
+
      for x in license_types.replace("(", " ( ").replace(")", " ) ").split():
          if ((x != "(") and (x != ")") and (x != "&") and (x != "|")):
              clean_licenses += "'" + x + "'"
          else:
              clean_licenses += " " + x + " "

-    node = ast.parse(clean_licenses)
+    # lstrip any possible indents, since ast needs python syntax.
+    node = ast.parse(clean_licenses.lstrip())
      v = LicenseVisitor()
      v.visit(node)
  }
-- 
1.7.1


