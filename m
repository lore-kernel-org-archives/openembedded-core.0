Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSOpO-0004iP-0d for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 10:34:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4A8OXL4008169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 09:24:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25763-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 09:24:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4A8OMbS008162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 09:24:23 +0100
Message-ID: <1336638262.2494.123.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 09:24:22 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Drop EXPORT_FUNCTIONS use against mapping_rename_hook
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
X-List-Received-Date: Thu, 10 May 2012 08:34:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The usage of this function renaming and it being called using
bb.build.exec_func() causes needless indirection loops, confusing log
files and seems generally pointless.

This simplification makes the process much simpler and faster. I can't
come up with a good reason why the export_functions functionality is
needed for this function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 44e551f..3d0f406 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1788,7 +1788,7 @@ addtask package_write before do_build after do_package
 # Helper functions for the package writing classes
 #
 
-python package_mapping_rename_hook () {
+def mapping_rename_hook(d):
 	"""
 	Rewrite variables to account for package renaming in things
 	like debian.bbclass or manual PKG variable name changes
@@ -1799,6 +1799,4 @@ python package_mapping_rename_hook () {
 	runtime_mapping_rename("RPROVIDES", d)
 	runtime_mapping_rename("RREPLACES", d)
 	runtime_mapping_rename("RCONFLICTS", d)
-}
 
-EXPORT_FUNCTIONS mapping_rename_hook
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index dc0f963..4096fa2 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -330,7 +330,7 @@ python do_package_deb () {
             raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
         # more fields
 
-        bb.build.exec_func("mapping_rename_hook", localdata)
+        mapping_rename_hook(localdata)
 
         rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
         for dep in rdepends:
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 0e4fea8..73ec0ee 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -367,7 +367,7 @@ python do_package_ipk () {
 			raise bb.build.FuncFailed("Missing field for ipk generation: %s" % value)
 		# more fields
 
-		bb.build.exec_func("mapping_rename_hook", localdata)
+		mapping_rename_hook(localdata)
 
 		rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
 		rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", True) or "")
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index cf66a51..d7376cd 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -719,7 +719,7 @@ python write_specfile () {
 		translate_vers('RCONFLICTS', localdata)
 
 		# Map the dependencies into their final form
-		bb.build.exec_func("mapping_rename_hook", localdata)
+		mapping_rename_hook(localdata)
 
 		splitrdepends    = strip_multilib(localdata.getVar('RDEPENDS', True), d) or ""
 		splitrrecommends = strip_multilib(localdata.getVar('RRECOMMENDS', True), d) or ""




