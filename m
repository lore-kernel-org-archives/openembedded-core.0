Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.4946.1606793700567555565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 19:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=u6wocPwm;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8098220725;
	Tue,  1 Dec 2020 03:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606793699;
	bh=NBd0ypkNgo3WVOHx7ZUlg5uQtpQgHQrsmXXylHYNqd4=;
	h=From:To:Cc:Subject:Date:From;
	b=u6wocPwmvoV75pIbK8SvfmdB5sO075DTDp2mNKGUYqmzmqlg73NPyGlPgWnp2OhdO
	 kH/dkf5Slh4atAJ5HdP3XzKbke++r8jbDgYkax+Di1qQDv59PXp1w80zbypk5Y2KtW
	 BJQCwn7ZqeL23fZ0vpQA/0isLCUgxiUkjPPHDiM4=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v3] net-tools: split into binary packages
Date: Tue,  1 Dec 2020 03:34:49 +0000
Message-Id: <20201201033449.8961-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Support per binary package to not bloat the system with unneeded
tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../net-tools/net-tools_1.60-20181103.bb      | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index e97731073e8..63a3ccbe516 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -93,7 +93,7 @@ base_bindir_progs  = "ifconfig netstat route \
     ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'dnsdomainname domainname hostname nisdomainname ypdomainname', '', d)} \
 "
 
-ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
+ALTERNATIVE_${PN} = ""
 ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'hostname.1 dnsdomainname.1', '', d)}"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
@@ -107,4 +107,31 @@ python __anonymous() {
 }
 ALTERNATIVE_PRIORITY = "100"
 
+python __anonymous () {
+    packages = []
+    for prog in d.getVar('base_sbindir_progs').split():
+        pkg = "net-tools-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${base_sbindir}/%s*" % prog)
+    for prog in d.getVar('base_bindir_progs').split():
+        pkg = "net-tools-%s" % prog.replace("_", "-")
+        packages.append(pkg)
+        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
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

