Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhiu-0007jz-Sd
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgQ2005212; Tue, 7 May 2013 13:58:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4jQD5RBIx4j4; Tue,  7 May 2013 13:58:42 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwcPv005186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:39 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRG-0005bp-8u; Tue, 07 May 2013 13:56:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:55:56 +0100
Message-Id: <1367931368-21504-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/15] classes: Use modern exception raising syntax
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000

Modern expection rasing syntax is function call format, convert to this
to keep python 3 happy and model correct coding style in the core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gtk-immodules-cache.bbclass |    2 +-
 meta/classes/update-alternatives.bbclass |    4 ++--
 meta/classes/update-rc.d.bbclass         |    4 ++--
 meta/classes/useradd.bbclass             |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index ed3069d..e11ed22 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -78,6 +78,6 @@ python __anonymous() {
         gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES')
         if not gtkimmodules_check:
             bb_filename = d.getVar('FILE')
-            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
+            raise bb.build.FuncFailed("ERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename)
 }
 
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 45f4291..2cadaf7 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -128,9 +128,9 @@ def update_alternatives_after_parse(d):
         alt_path = d.getVar('ALTERNATIVE_PATH', True)
         alt_link = d.getVar('ALTERNATIVE_LINK', True) or ("%s/%s" % (d.getVar('bindir', True), alt_name))
         if alt_name == None:
-            raise bb.build.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE')
+            raise bb.build.build.FuncFailed("%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE'))
         if alt_path == None:
-            raise bb.build.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_PATH" % d.getVar('FILE')
+            raise bb.build.build.FuncFailed("%s inherits update-alternatives but doesn't set ALTERNATIVE_PATH" % d.getVar('FILE'))
 
         alternative = d.getVar('ALTERNATIVE_%s' % pn, True) or ""
         alternative += " " + alt_name
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index d8cc342..5588569 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -44,9 +44,9 @@ fi
 def update_rc_after_parse(d):
     if d.getVar('INITSCRIPT_PACKAGES') == None:
         if d.getVar('INITSCRIPT_NAME') == None:
-            raise bb.build.FuncFailed, "%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE')
+            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE'))
         if d.getVar('INITSCRIPT_PARAMS') == None:
-            raise bb.build.FuncFailed, "%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE')
+            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE'))
 
 python __anonymous() {
     update_rc_after_parse(d)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0a4feba..52c0ba4 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -157,11 +157,11 @@ def update_useradd_after_parse(d):
     useradd_packages = d.getVar('USERADD_PACKAGES', True)
 
     if not useradd_packages:
-        raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE')
+        raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE'))
 
     for pkg in useradd_packages.split():
         if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True):
-            raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM for package %s" % (d.getVar('FILE'), pkg)
+            raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM for package %s" % (d.getVar('FILE'), pkg))
 
 python __anonymous() {
     update_useradd_after_parse(d)
-- 
1.7.10.4



