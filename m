Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.6114.1607038115751838584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 15:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v4 3/3] procps: split into binary subpackages
Date: Thu,  3 Dec 2020 23:28:26 +0000
Message-Id: <20201203232826.28519-3-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203232826.28519-1-okaya@kernel.org>
References: <20201203232826.28519-1-okaya@kernel.org>

This change allows you to pull individual binaries into the
target without including the entire suite.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/procps/procps_3.3.16.bb | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 2810ebd285a..efca33127a4 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 DEPENDS = "ncurses"
 
 inherit autotools gettext pkgconfig update-alternatives
+inherit lib_subpackage
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
            file://sysctl.conf \
@@ -50,27 +51,19 @@ do_install_append () {
 
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
 
-python __anonymous() {
-    for prog in d.getVar('base_bindir_progs').split():
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
-
-    for prog in d.getVar('base_sbindir_progs').split():
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
-}
-
 # 'ps' isn't suitable for use as a security tool so whitelist this CVE.
 # https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
 CVE_CHECK_WHITELIST += "CVE-2018-1121"
+
+FILES_${PN}-sysctl_append = " ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
-- 
2.17.1

