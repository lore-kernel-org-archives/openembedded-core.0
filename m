Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvoDq-0006Tz-JV
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 13:05:32 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so1445383pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=q8TSU+D6CJ+r7Jpq5IzfGRD6H0/yo/Y6qVMLQYIrnnw=;
	b=SDE9qlq7onXFnjZGTIc4JJg8/u8JxGKt7JHVHB5Ms3bXnrpN5lUo23mq5eF/ouu+Ah
	SELZngQI4WO++DQGGsjgDrNKIciuYm9Nq6pJayetVoqxYhTBHzWKU1R7WvrTv8xKWi8o
	tcrTPRiuxF3vyJHCKKZTy1ZgPRqO5fYmVqkSJDD/WDGUYoconEWSAmBKJPjXhs/wANzh
	1lT3Gq//IPpEL6hWeXhk5mXPc10zO2uECoKeYYLdGcRaXOcHaoN22cGRFkhGmoO5zMRf
	auOvR/j7c8kbXpb8dLCtxdQDn+FPD7w2DT00PWSBxk7eXV0ex7JgDPhAP19D7FAwrOod
	+tjw==
X-Received: by 10.68.238.8 with SMTP id vg8mr12722724pbc.26.1358423406995;
	Thu, 17 Jan 2013 03:50:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t7sm1213455pax.17.2013.01.17.03.50.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 03:50:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 12:49:44 +0100
Message-Id: <abc88e3324899fe1d3a58b7031cb7f687aa93075.1358423316.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1358423316.git.Martin.Jansa@gmail.com>
References: <cover.1358423316.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1358423316.git.Martin.Jansa@gmail.com>
References: <cover.1358423316.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] license.bbclass: package license texts to PN-lic when LICENSE_CREATE_PACKAGE is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 12:05:45 -0000

[YOCTO #3743]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 63d081f..22e6c56 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -6,6 +6,11 @@
 LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"
 
+# Create extra package with license texts and add it to RRECOMMENDS_${PN}
+LICENSE_CREATE_PACKAGE ??= "0"
+LICENSE_PACKAGE_SUFFIX ??= "-lic"
+LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
+
 addtask populate_lic after do_patch before do_build
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
@@ -95,6 +100,35 @@ python do_populate_lic() {
     copy_license_files(lic_files_paths, destdir)
 }
 
+# it would be better to copy them in do_install_append, but find_license_filesa is python
+python perform_packagecopy_prepend () {
+    enabled = d.getVar('LICENSE_CREATE_PACKAGE', True)
+    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
+        lic_files_paths = find_license_files(d)
+
+        # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot be used to join D and LICENSE_FILES_DIRECTORY
+        destdir = d.getVar('D', True) + os.path.join(d.getVar('LICENSE_FILES_DIRECTORY', True), d.getVar('PN', True))
+        copy_license_files(lic_files_paths, destdir)
+        add_package_and_files(d)
+}
+
+def add_package_and_files(d):
+    packages = d.getVar('PACKAGES', True)
+    files = d.getVar('LICENSE_FILES_DIRECTORY', True)
+    pn = d.getVar('PN', True)
+    pn_lic = "%s%s" % (pn, d.getVar('LICENSE_PACKAGE_SUFFIX'))
+    if pn_lic in packages:
+        bb.warn("%s package already existed in %s." % (pn_lic, pn))
+    else:
+        # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
+        d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
+        d.setVar('FILES_' + pn_lic, files)
+        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn, True)
+        if rrecommends_pn:
+            d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
+        else:
+            d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))
+
 def copy_license_files(lic_files_paths, destdir):
     bb.mkdirhier(destdir)
     for (basename, path) in lic_files_paths:
-- 
1.8.1.1



