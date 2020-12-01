Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.5108.1606794211357623805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 19:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=pf4aAY2x;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5E6642064C;
	Tue,  1 Dec 2020 03:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606794210;
	bh=N7yJG7lmk5Q/hG4sXSXj32tYXaFR4FMx55+pi+PG+lk=;
	h=From:To:Cc:Subject:Date:From;
	b=pf4aAY2x23EPYlIMZkGmEYZy6RKnnW+0t4Owuild8XPszdI3FM7vNDnLjlFREXUfa
	 JmTZGlbJT9OGjOtU0EuZvY2go8PZVtaKa43EQDeX1Xtq/wbcrxyg7uqambRuidLsGn
	 f7GOCfTPsG4Y/LHhMuJhelrlqGkArOfcvbnH88pA=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v2] procps: split into binary subpackages
Date: Tue,  1 Dec 2020 03:43:26 +0000
Message-Id: <20201201034326.11447-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

This change allows you to pull individual binaries into the
target without including the entire suite.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/procps/procps_3.3.16.bb | 51 +++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 2810ebd285a..1b62ae33f5c 100644
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
@@ -69,8 +67,55 @@ python __anonymous() {
 
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
+    for prog in d.getVar('base_sbindir_progs').split():
+        pkg = "procps-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_sbindir}/%s*" % prog)
+    for prog in d.getVar('base_bindir_progs').split():
+        pkg = "procps-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_bindir}/%s*" % prog)
+    pkg = "procps-man"
+    packages.append(pkg)
+    if not d.getVar("FILES_%s" % pkg):
+            d.setVar("FILES_%s" % pkg, "${mandir}/*")
+    pkg = "procps-lib"
+    packages.append(pkg)
+    if not d.getVar("FILES_%s" % pkg):
+            d.setVar("FILES_%s" % pkg, "${libdir}/*")
+    pkg = "procps-sysctl"
+    d.appendVar("FILES_%s" % pkg, " ${sysconfdir}/sysctl.conf")
+
+    d.setVar("PROCPS_PACKAGES", " ".join(packages))
+}
+# "procps" is a metapackage which pulls in all procps binaries
+PACKAGES += "${PROCPS_PACKAGES}"
+PROVIDES += "${PROCPS_PACKAGES}"
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} += "${PROCPS_PACKAGES}"
+
-- 
2.17.1

