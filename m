Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOVha-0004cX-Mj
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 17:38:34 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so4531486wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DTGTDOBO2DzXdk63GSm/s25CcYEpeR6MJt1+v1dplJ8=;
	b=O6xHNSwRXKsfgE7FQf3lyHnT85/gUjRJLi0IPqe1t8rUllI8VKR+PRVe29QyrSJlcM
	VezwFhOCH8xtsHX4QVVoBTgnbcCPBi+83fABae1i8SqLpuQ5tD9Vc3E8Feyw4ocasRw2
	ru3SONG072U01zv96y3nQ5OA2qfJx8s+MsZlX5NIxMJEtUtE+o/b/jR1HZ18TyXRIvlb
	e0gd5fzj9I+Xfbl+HNSDE8sJDkSoY5sYLmU4IH9SYPJ6n49RBepdLwUg9gEm++HuPrCe
	egkD5Pvgzretj7wayRO57RETP024/Ip2TJxaLvxfy+7nATB30ii6J4BIsS528A59ZYwz
	9ZSw==
Received: by 10.180.94.102 with SMTP id db6mr4831265wib.20.1350487516599;
	Wed, 17 Oct 2012 08:25:16 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id v3sm28140562wiy.5.2012.10.17.08.25.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 08:25:15 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 17:24:56 +0200
Message-Id: <1350487497-13102-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
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
X-List-Received-Date: Wed, 17 Oct 2012 15:38:34 -0000

This is used by:
openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/classes/gtk-immodules-cache.bbclass |   70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 meta/classes/gtk-immodules-cache.bbclass

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
new file mode 100644
index 0000000..833eefe
--- /dev/null
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -0,0 +1,70 @@
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



