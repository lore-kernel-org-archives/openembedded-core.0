Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOUqc-00080o-VL
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:43:52 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so4497475wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uquVAOQrydejQmkdMzzkoKGoekAXgcdd03vQdhQK2J8=;
	b=cstCiRRXiMg8wHVz9OBGnpEI/0uByEnd1OkZ59DnJSdm6fZdeTQuyiVleA61tFauhl
	ykUoeaJIhEkPXFABh3+NvRtJRQ2DBN4Tbx29hNe1VInNyR+a8pvjsHTsxAlhrIjvNkNp
	FJ00v8QzFOSndo6TaQfqsJqga81+V3o8ZBYDxrEkk23jzY1Lybk1dIzmwP/NDX9sBgrD
	y3p8+LgGbol21ySVCov+0Jy0hEKIUNYSNeh1I2EQlBiuTHaj862lVRYWMqTVQU4rTrru
	BAR25hOyrm8lNuJ/Tnrb0UezBpYHlP/gBLPb0sKyxW4+a7IbtfTodW4MlaO6FIFTxqgi
	micQ==
Received: by 10.216.54.149 with SMTP id i21mr5845821wec.162.1350484219172;
	Wed, 17 Oct 2012 07:30:19 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id fp6sm4508834wib.0.2012.10.17.07.30.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 07:30:18 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 16:29:31 +0200
Message-Id: <1350484172-9188-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [PATCH 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
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
X-List-Received-Date: Wed, 17 Oct 2012 14:43:53 -0000

This is used by:
openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/classes/gtk-immodules-cache.bbclass |   72 ++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta/classes/gtk-immodules-cache.bbclass

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
new file mode 100644
index 0000000..cb2d46d
--- /dev/null
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -0,0 +1,72 @@
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
+    packages = d.getVar('PACKAGES', True).split()
+    pkgdest =  d.getVar('PKGDEST', True)
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
+def gtkimmodules_after_parse(d):
+    def gtkimmodules_check_vars():
+        if d.getVar('BB_WORKERCONTEXT', True) is not None:
+            return
+
+        bb_filename = d.getVar('FILE')
+        packages = d.getVar('PACKAGES', True)
+
+        # check gtk-immodules package
+        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES', True) or ""
+        if gtkimmodules_check == "":
+            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
+
+    bpn = d.getVar('BPN', 1)
+    if bpn + "-native" != d.getVar('PN', 1) and \
+            bpn + "-cross" != d.getVar('PN', 1) and \
+            bpn + "-nativesdk" != d.getVar('PN', 1):
+        gtkimmodules_check_vars()
+
+python __anonymous() {
+    gtkimmodules_after_parse(d)
+}
+
-- 
1.7.9.5



