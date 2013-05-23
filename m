Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B505C6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:01:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4N81xxr019262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 01:01:59 -0700 (PDT)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 23 May 2013 01:01:59 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2013 16:01:55 +0800
Message-ID: <1369296115-20823-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] libpam: fix multilib packaging issue for pam-plugins
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2013 08:01:58 -0000
Content-Type: text/plain

libpam might miss ABI specific dependencies for pam-plugins-*, for RPM uses
generic names to check the packages depending on it and doesn't consider the
arch, which will lead to packaging issues in multilib build.

pam_plugin_hook is added because the plugin packages are dynamically
generated, so we need to manually process multilib names by add baselib to
RPROVIDES/RDEPENDS as ABI specific tag.

[YOCTO #4532]
[ CQID: WIND00416824 ]

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c355634..289f134 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -51,9 +51,12 @@ FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 PACKAGES_DYNAMIC += "^pam-plugin-.*"
 
-RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
-RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory pam-plugin-succeed-if pam-plugin-time coreutils"
-RRECOMMENDS_${PN} = "libpam-runtime"
+RPROVIDES_${PN} += "libpam-${baselib}"
+RPROVIDES_${PN}-runtime += "libpam-runtime-${baselib}"
+
+RDEPENDS_${PN}-runtime = "libpam-${baselib} pam-plugin-deny-${baselib} pam-plugin-permit-${baselib} pam-plugin-warn-${baselib} pam-plugin-unix-${baselib}"
+RDEPENDS_${PN}-xtests = "libpam-${baselib} pam-plugin-access-${baselib} pam-plugin-debug-${baselib} pam-plugin-cracklib-${baselib} pam-plugin-pwhistory-${baselib} pam-plugin-succeed-if-${baselib} pam-plugin-time-${baselib} coreutils"
+RRECOMMENDS_${PN} = "libpam-runtime-${baselib}"
 
 python populate_packages_prepend () {
     def pam_plugin_append_file(pn, dir, file):
@@ -63,12 +66,30 @@ python populate_packages_prepend () {
             nf = of + " " + nf
         d.setVar('FILES_' + pn, nf)
 
+    def pam_plugin_hook(file, pkg, pattern, format, basename):
+        baselib = d.getVar('baselib', True)
+        mlprefix = d.getVar('MLPREFIX', True) or ''
+
+        rdeps = d.getVar('RDEPENDS_' + pkg, True)
+        if rdeps:
+            rdeps = rdeps + " " + mlprefix + "libpam-" + baselib
+        else:
+            rdeps = mlprefix + "libpam-" + baselib
+        d.setVar('RDEPENDS_' + pkg, rdeps)
+
+        provides = d.getVar('RPROVIDES_' + pkg, True)
+        if provides:
+            provides = provides + " " + pkg + "-" + baselib
+        else:
+            provides = pkg + "-" + baselib
+        d.setVar('RPROVIDES_' + pkg, provides)
+
     dvar = bb.data.expand('${WORKDIR}/package', d, True)
     pam_libdir = d.expand('${base_libdir}/security')
     pam_sbindir = d.expand('${sbindir}')
     pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
 
-    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', extra_depends='')
+    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
     mlprefix = d.getVar('MLPREFIX', True) or ''
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
-- 
1.7.11


