Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B975D6E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:12:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NCCQGm001796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:12:26 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 23 Jan 2014 04:12:26 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 20:12:35 +0800
Message-ID: <f1cf5165fbbb4f3d90a6d8f35b26b8ad706e672a.1390479069.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390479069.git.Qi.Chen@windriver.com>
References: <cover.1390479069.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] update-rc.d: automatically rdepend on initscripts-funtions
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
X-List-Received-Date: Thu, 23 Jan 2014 12:12:25 -0000
Content-Type: text/plain

Automatically add 'initscripts-functions' to packages when needed.

This extra dependency is added only when the package's init script
would be used at system start-up. In other words, in a systemd based
image, if the package has already got its service files, it will not
have this extra dependency.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/update-rc.d.bbclass |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index c9bf04c..ad803c2 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -71,6 +71,16 @@ PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
 
 python populate_packages_updatercd () {
+    def update_rcd_auto_depend(pkg):
+        import subprocess
+        import os
+        path = d.expand("${D}${INIT_D_DIR}/${INITSCRIPT_NAME}")
+        if not os.path.exists(path):
+            return
+        statement = "grep -q -w '/etc/init.d/functions' %s" % path
+        if subprocess.call(statement, shell=True) == 0:
+            d.appendVar('RDEPENDS_' + pkg, ' initscripts-functions')
+
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
 
@@ -79,6 +89,8 @@ python populate_packages_updatercd () {
         localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
         bb.data.update_data(localdata)
 
+        update_rcd_auto_depend(pkg)
+
         preinst = d.getVar('pkg_preinst_%s' % pkg, True)
         if not preinst:
             preinst = '#!/bin/sh\n'
-- 
1.7.9.5


