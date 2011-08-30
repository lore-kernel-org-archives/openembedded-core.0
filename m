Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyOaz-000544-EC for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 15:43:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UDcOiS018929
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 14:38:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18709-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 14:38:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UDcH4m018923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 14:38:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 14:38:06 +0100
Message-ID: <1314711486.5939.354.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Ensure task's variable dependencies are correctly caputred in the sstate checksum
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
X-List-Received-Date: Tue, 30 Aug 2011 13:43:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[YOCTO #1388]

This change is needed to correctly add the dependencies for the do_package
task which bitbake is unable to automatically detect itself.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 66d6450..342cb29 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -88,8 +88,9 @@ python __anonymous () {
 
     d.setVar("PACKAGES", " ".join([row[1] for row in pkgs_mapping]))
 
+    vars = (d.getVar("PACKAGEVARS", True) or "").split()
     for pkg_mapping in pkgs_mapping:
-        for subs in ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY", "pkg_postinst", "pkg_postrm", "INITSCRIPT_NAME", "INITSCRIPT_PARAMS"]:
+        for subs in vars:
             d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
     map_dependencies("DEPENDS", d)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 15c4142..73e8f63 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1620,6 +1620,19 @@ python package_depchains() {
 				pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
 }
 
+# Since bitbake can't determine which variables are accessed during package 
+# iteration, we need to list them here:
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS"
+
+def gen_packagevar(d):
+    ret = []
+    pkgs = (d.getVar("PACKAGES", True) or "").split()
+    vars = (d.getVar("PACKAGEVARS", True) or "").split()
+    for p in pkgs:
+        for v in vars:
+            ret.append(v + "_" + p)
+    return " ".join(ret)
+
 PACKAGE_PREPROCESS_FUNCS ?= ""
 PACKAGEFUNCS ?= "package_get_auto_pr \	
                 perform_packagecopy \
@@ -1656,6 +1669,7 @@ python do_package () {
 }
 
 do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
+do_package[vardeps] += "${PACKAGEFUNCS} ${@gen_packagevar(d)}"
 addtask package before do_build after do_install
 
 PACKAGELOCK = "${STAGING_DIR}/package-output.lock"




