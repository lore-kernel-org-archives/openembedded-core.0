Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.6193.1607038115150546914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 15:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v4 2/3] net-tools: split into binary packages
Date: Thu,  3 Dec 2020 23:28:25 +0000
Message-Id: <20201203232826.28519-2-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203232826.28519-1-okaya@kernel.org>
References: <20201203232826.28519-1-okaya@kernel.org>

Support per binary package to not bloat the system with unneeded
tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../net-tools/net-tools_1.60-20181103.bb                 | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index e97731073e8..f9253123c24 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -21,6 +21,7 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 S = "${WORKDIR}/git"
 
 inherit gettext
+inherit lib_subpackage
 
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
@@ -93,18 +94,10 @@ base_bindir_progs  = "ifconfig netstat route \
     ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'dnsdomainname domainname hostname nisdomainname ypdomainname', '', d)} \
 "
 
-ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
 ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'hostname.1 dnsdomainname.1', '', d)}"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
 ALTERNATIVE_PRIORITY[hostname.1] = "10"
-
-python __anonymous() {
-    for prog in d.getVar('base_sbindir_progs').split():
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
-    for prog in d.getVar('base_bindir_progs').split():
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
-}
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

