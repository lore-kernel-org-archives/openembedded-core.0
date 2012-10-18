Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOko3-0005oZ-JE
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 09:46:15 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so6138626wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a5k/aMn+MrinvgKqXkqDGjfWkqyJuncoX+fhqGRmUl4=;
	b=xNBYA02UcPOzQAnvkc3ti+x1zmQGQjDsH658zBi9YsCxsJMYLjzejFMZIInjGMJ2VZ
	/qVPMCrroPqGiEd51p788ZYcL3N919WXntAMLeXxWEPcsttzJ74EYEwdpShiWV4NlUjX
	1/4LTbooNZo1lro4i8sp545u3yZGYQNLnidDc2WaXrtm1opKZkpQfIYMzXR/BTipjc6n
	GyIHvtCBvzpQkybKE1hvb/mggkcNpKCpEq8crgBZcAYQXgcl8q7gmr8FNgf5f3tnfCPL
	Fl/rahHUQn88kAmGQSIzbgpV/NvjcBZSYfYUrTry1wc3j3epjMKOQZk4y1oPMVGsBKVB
	aIUQ==
Received: by 10.180.87.42 with SMTP id u10mr9284690wiz.0.1350545576525;
	Thu, 18 Oct 2012 00:32:56 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id fp6sm8202639wib.0.2012.10.18.00.32.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 00:32:55 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 09:32:47 +0200
Message-Id: <1350545567-16374-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
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
X-List-Received-Date: Thu, 18 Oct 2012 07:46:15 -0000

This is used by:
openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/classes/gtk-immodules-cache.bbclass |   55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta/classes/gtk-immodules-cache.bbclass

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
new file mode 100644
index 0000000..515d28b
--- /dev/null
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -0,0 +1,55 @@
+# This class will update the inputmethod module cache for virtual keyboards
+#
+# Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
+
+gtk_immodule_cache_postinst() {
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+if [ ! -z `which gtk-query-immodules-2.0` ]; then
+    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+fi
+if [ ! -z `which gtk-query-immodules-3.0` ]; then
+    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
+fi
+}
+
+gtk_immodule_cache_postrm() {
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+if [ ! -z `which gtk-query-immodules-2.0` ]; then
+    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+fi
+if [ ! -z `which gtk-query-immodules-3.0` ]; then
+    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
+fi
+}
+
+python populate_packages_append () {
+    gtkimmodules_pkgs = d.getVar('GTKIMMODULES_PACKAGES', True).split()
+
+    for pkg in gtkimmodules_pkgs:
+            bb.note("adding gtk-immodule-cache postinst and postrm scripts to %s" % pkg)
+
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+            if not postinst:
+                postinst = '#!/bin/sh\n'
+            postinst += d.getVar('gtk_immodule_cache_postinst', True)
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+            if not postrm:
+                postrm = '#!/bin/sh\n'
+            postrm += d.getVar('gtk_immodule_cache_postrm', True)
+            d.setVar('pkg_postrm_%s' % pkg, postrm)
+}
+
+python __anonymous() {
+    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES')
+        if not gtkimmodules_check:
+            bb_filename = d.getVar('FILE')
+            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
+}
+
-- 
1.7.9.5



