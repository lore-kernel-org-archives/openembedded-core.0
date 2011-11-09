Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNyRC-0003HD-LL
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 04:02:56 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 97A192FD0F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:56:36 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 18:56:36 -0800
Message-Id: <5627f4fb619556d9eabad7d31bfc89461eeb9a8d.1320807056.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 97A192FD0F.EE856
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/4] useradd.bbclass: only modify packages in USERADD_PACKAGES
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
X-List-Received-Date: Wed, 09 Nov 2011 03:02:56 -0000

Previously we injected the user/group preinstall script into all
output packages. This fixes that so that only packages listed in
USERADD_PACKAGES get modified.

It also removes the USERADDPN variable, which is no longer needed.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |   42 ++++++++++++++++--------------------------
 1 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a8a1c14..3b2d1db 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -1,5 +1,3 @@
-USERADDPN ?= "${PN}"
-
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
@@ -106,30 +104,29 @@ SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
-	if not d.getVar('USERADD_PACKAGES', False):
-		if not d.getVar('USERADD_PARAM', False) and not d.getVar('GROUPADD_PARAM', False):
-			raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM" % bb.data.getVar('FILE', d)
+	useradd_packages = d.getVar('USERADD_PACKAGES', True)
+
+	if not useradd_packages:
+		raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PACKAGES" % bb.data.getVar('FILE', d)
+
+	for pkg in useradd_packages.split():
+		if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True):
+			raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM for package %s" % (bb.data.getVar('FILE', d), pkg)
 
 python __anonymous() {
 	update_useradd_after_parse(d)
 }
 
 # Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
-# [group|user]add parameters for all packages in this recipe
+# [group|user]add parameters for all USERADD_PACKAGES in this recipe
 def get_all_cmd_params(d, cmd_type):
 	import string
 	
 	param_type = cmd_type.upper() + "ADD_PARAM_%s"
 	params = []
 
-	pkgs = d.getVar('USERADD_PACKAGES', True)
-	if not pkgs:
-		pkgs = d.getVar('USERADDPN', True)
-		packages = (d.getVar('PACKAGES', True) or "").split()
-		if packages and pkgs not in packages:
-			pkgs = packages[0]
-
-	for pkg in pkgs.split():
+	useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
+	for pkg in useradd_packages.split():
 		param = d.getVar(param_type % pkg, True)
 		if param:
 			params.append(param)
@@ -156,17 +153,10 @@ fakeroot python populate_packages_prepend () {
 		rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
 		rdepends += " base-passwd shadow"
 		bb.data.setVar("RDEPENDS_%s" % pkg, rdepends, d)
-		
-	# We add the user/group calls to all packages to allow any package
-	# to contain files owned by the users/groups defined in the recipe.
-	# The user/group addition code is careful not to create duplicate
-	# entries, so this is safe.
-	pkgs = d.getVar('USERADD_PACKAGES', True)
-	if not pkgs:
-		pkgs = d.getVar('USERADDPN', True)
-		packages = (d.getVar('PACKAGES', True) or "").split()
-		if packages and pkgs not in packages:
-			pkgs = packages[0]
-	for pkg in pkgs.split():
+	
+	# Add the user/group preinstall scripts and RDEPENDS requirements
+	# to packages specified by USERADD_PACKAGES
+	useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
+	for pkg in useradd_packages.split():
 		update_useradd_package(pkg)
 }
-- 
1.7.5.4



