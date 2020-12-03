Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.6133.1607038113551093166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 15:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v4 1/3] introduce lib_subpackage
Date: Thu,  3 Dec 2020 23:28:24 +0000
Message-Id: <20201203232826.28519-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

This subclass allows us to easily split a recipe into
subpackages.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/classes/lib_subpackage.bbclass | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/classes/lib_subpackage.bbclass

diff --git a/meta/classes/lib_subpackage.bbclass b/meta/classes/lib_subpackage.bbclass
new file mode 100644
index 00000000000..a0c3d2446c7
--- /dev/null
+++ b/meta/classes/lib_subpackage.bbclass
@@ -0,0 +1,40 @@
+python __anonymous() {
+    packages = []
+
+    variables = [ ("base_sbindir_progs", "base_sbindir"),
+                  ("base_bindir_progs", "base_bindir"),
+                  ("bindir_progs", "bindir"),
+                  ("sbindir_progs", "sbindir"),
+                ]
+
+    for v in variables:
+        if d.getVar(v[0]) is None:
+            continue
+        for prog in d.getVar(v[0]).split():
+            pkg = "%s-%s" % (d.getVar("PN"), prog.replace("_", "-"))
+            packages.append(pkg)
+
+            # set alternatives
+            d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+            d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(v[1]), prog))
+
+            d.setVar("RDEPENDS_%s" % pkg, "%s-lib" % d.getVar("PN"))
+            d.appendVar("FILES_%s" % pkg, " ${%s}/%s.%s" % (v[1], prog, d.getVar("BPN")))
+
+    pkg = "%s-man" % (d.getVar("PN"))
+    packages.append(pkg)
+    d.appendVar("FILES_%s" % pkg, " ${mandir}/*")
+
+    pkg = "%s-lib" % (d.getVar("PN"))
+    packages.append(pkg)
+    d.appendVar("FILES_%s" % pkg, " ${libdir}/*")
+
+    d.setVar("LIB_SUBPACKAGES_%s" % d.getVar("PN"), " ".join(packages))
+
+    d.setVar("FILES_%s" % d.getVar("PN"), "")
+    d.setVar("ALTERNATIVE_%s" % d.getVar("PN"), "")
+    d.setVar("ALLOW_EMPTY_%s" % d.getVar("PN"), "1")
+    d.appendVar("PACKAGES", " " + " ".join(packages))
+    d.appendVar("PROVIDES", " " + " ".join(packages))
+    d.appendVar("RRECOMMENDS_%s" % d.getVar("PN"), " " + " ".join(packages))
+}
-- 
2.17.1

