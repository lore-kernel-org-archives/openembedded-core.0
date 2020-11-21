Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.949.1605924074236237355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 18:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=05LaXBxh;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 58860223B0;
	Sat, 21 Nov 2020 02:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605924073;
	bh=sSD8oimvU5ttdz470yTtMapJ8H4W3Y3gPR9jdZb6QE8=;
	h=From:To:Cc:Subject:Date:From;
	b=05LaXBxhRsPZyWUf6UvsQuPwQlgGfkO3F3nQvYvNHeQALLBUFhGJAFBOQRZZVOfQr
	 S5Vvwm+opy03RSrKr+w5hD9GS5MdHXVGW+GaIUIlix8cFdrIF9yNhiL8OKvPV3rFtr
	 Th0+bVQPN1UQ8ipAchiQwnoxanbFCvYE4OksDLiw=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v2] net-tools: split into binary packages
Date: Sat, 21 Nov 2020 02:01:08 +0000
Message-Id: <20201121020108.19793-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Support per binary package to not bloat the system with unneeded
tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../net-tools/net-tools_1.60-26.bb            | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 8bd30fc6d9b..ace18b830f2 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -129,4 +129,29 @@ python __anonymous() {
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
+PACKAGES += "${NETTOOLS_PACKAGES}"
+PROVIDES += "${NETTOOLS_PACKAGES}"
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} += "${NETTOOLS_PACKAGES}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

