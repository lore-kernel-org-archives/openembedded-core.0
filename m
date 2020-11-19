Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.5572.1605768286433375127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 22:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=GTwziqGF;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2FC272223F;
	Thu, 19 Nov 2020 06:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605768285;
	bh=enMT4KxE2GjC3Tlrlkuj6m1oHvaxBiQDVvlbYjW1zKs=;
	h=From:To:Cc:Subject:Date:From;
	b=GTwziqGFhasJFnpvy8rWGDXyG5tQ+6x2tR4qzfpCEP7xo2e13t8bAM+dOPbXfMZyL
	 IKVy0hHvgnfu/zyec95XtqdMMKbqhoZHGA/tOC0AWAWkDfJ8bimQGgnM5CbUtVhJ3l
	 Fofy91fsn6Kljb8vmCBJSMEEtb6lhciEdxildP0w=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] net-tools: split into binary packages
Date: Thu, 19 Nov 2020 06:44:42 +0000
Message-Id: <20201119064442.21650-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Support per binary package to not bloat the system with unneeded
tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../net-tools/net-tools_1.60-26.bb            | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 8bd30fc6d9b..b60fdd255e9 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -129,4 +129,31 @@ python __anonymous() {
 }
 ALTERNATIVE_PRIORITY = "100"
 
+python __anonymous () {
+    packages = []
+    for prog in d.getVar('base_sbindir_progs').split():
+        pkg = "net-tools-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_sbindir}/%s*" % prog)
+    for prog in d.getVar('base_bindir_progs').split():
+        pkg = "net-tools-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_bindir}/%s*" % prog)
+    pkg = "net-tools-man"
+    packages.append(pkg)
+    if not d.getVar("FILES_%s" % pkg):
+            d.setVar("FILES_%s" % pkg, "${mandir}/*")
+    d.setVar("NETTOOLS_PACKAGES", " ".join(packages))
+}
+# "net-tools" is a metapackage which pulls in all net-tools binaries
+PACKAGES += "${PN}"
+PACKAGES = "${PN}-dbg ${NETTOOLS_PACKAGES}"
+PROVIDES += "${PN}"
+PROVIDES = "${PN}-dbg ${NETTOOLS_PACKAGES}"
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} += "${NETTOOLS_PACKAGES}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

