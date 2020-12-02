Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.400.1606934419915848027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 10:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v3] procps: split into binary subpackages
Date: Wed,  2 Dec 2020 18:40:11 +0000
Message-Id: <20201202184011.12746-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

This change allows you to pull individual binaries into the
target without including the entire suite.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/procps/procps_3.3.16.bb | 55 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 2810ebd285a..619a3cc7181 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -50,15 +50,13 @@ do_install_append () {
 
 CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
 
-bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
+bindir_progs = "free pkill pmap pgrep pwdx skill slabtop snice tload top uptime vmstat w"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
 
 ALTERNATIVE_PRIORITY = "200"
 ALTERNATIVE_PRIORITY[pidof] = "150"
 
-ALTERNATIVE_${PN} = "${bindir_progs} ${base_bindir_progs} ${base_sbindir_progs}"
-
 ALTERNATIVE_${PN}-doc = "kill.1 uptime.1"
 ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
@@ -69,8 +67,59 @@ python __anonymous() {
 
     for prog in d.getVar('base_sbindir_progs').split():
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
+
+    for prog in d.getVar('bindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('bindir'), prog))
 }
 
 # 'ps' isn't suitable for use as a security tool so whitelist this CVE.
 # https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
 CVE_CHECK_WHITELIST += "CVE-2018-1121"
+
+python __anonymous () {
+    packages = []
+    for prog in d.getVar('bindir_progs').split():
+        pkg = "procps-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${bindir}/%s*" % prog)
+
+    for prog in d.getVar('base_sbindir_progs').split():
+        pkg = "procps-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_sbindir}/%s*" % prog)
+
+    for prog in d.getVar('base_bindir_progs').split():
+        pkg = "procps-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_bindir}/%s*" % prog)
+
+    pkg = "procps-man"
+    packages.append(pkg)
+    if not d.getVar("FILES_%s" % pkg):
+            d.setVar("FILES_%s" % pkg, "${mandir}/*")
+
+    pkg = "procps-lib"
+    packages.append(pkg)
+    if not d.getVar("FILES_%s" % pkg):
+            d.setVar("FILES_%s" % pkg, "${libdir}/*")
+
+    pkg = "procps-sysctl"
+    d.appendVar("FILES_%s" % pkg, " ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d")
+
+    d.setVar("PROCPS_PACKAGES", " ".join(packages))
+}
+# "procps" is a metapackage which pulls in all procps binaries
+PACKAGES += "${PROCPS_PACKAGES}"
+PROVIDES += "${PROCPS_PACKAGES}"
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} += "${PROCPS_PACKAGES}"
-- 
2.17.1

