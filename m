Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyIEQ-000837-F3
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 09:32:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0O8GnS3024262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 00:16:49 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 24 Jan 2013 00:16:48 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2013 16:16:46 +0800
Message-ID: <989ba4f0ead8f84824d4e5822f9b2f58941d73a3.1359014474.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359014474.git.Qi.Chen@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 06/12] volatiles_sysvinit.bbclass: add recipe
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
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This bbclass is used to support read-only rootfs with sysvinit init
manager.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/volatiles_sysvinit.bbclass |   49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/classes/volatiles_sysvinit.bbclass

diff --git a/meta/classes/volatiles_sysvinit.bbclass b/meta/classes/volatiles_sysvinit.bbclass
new file mode 100644
index 0000000..df5bedc
--- /dev/null
+++ b/meta/classes/volatiles_sysvinit.bbclass
@@ -0,0 +1,49 @@
+# This bbclass is used to support read-only rootfs with sysvinit init manager.
+
+VOLATILESPN ?= "${PN}"
+VOLATILES_PKGD_DIR = "${PKGD}${sysconfdir}/default/volatiles"
+CONF_FILE_NAME = "readonly-${VOLATILESPN}"
+
+CONF_FILE = "${VOLATILES_PKGD_DIR}/${CONF_FILE_NAME}"
+
+def volatiles_after_parse(d):
+    if d.getVar('VOLATILE_PKGS') == None:
+        if d.getVar('VOLATILE_DIR') == None:
+            raise bb.build.FuncFailed, "%s inherits volatiles but doesn't set VOLATILE_DIR" % d.getVar('FILE')
+        if d.getVar('VOLATILE_LINK') == None:
+            raise bb.build.FuncFailed, "%s inherits volatiles but doesn't set VOLATILE_LINK" % d.getVar('FILE')
+
+python __anonymous() {
+    volatiles_after_parse(d)
+}
+
+do_install_prepend () {
+    install -d ${D}${sysconfdir}/default/volatiles
+}
+
+python populate_packages_prepend () {
+    def volatiles_package(pkg):
+        bb.debug(1, 'generating volatile config files for %s' % pkg)
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", True)
+        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
+        bb.data.update_data(localdata)
+
+        # install read-only specific conf files
+        filepath = localdata.getVar('CONF_FILE', True)
+        dirpath = localdata.getVar('VOLATILE_DIR', True)
+        linkpath = localdata.getVar('VOLATILE_LINK', True)
+        f = open(filepath, 'a')
+        f.write("d root root 0755 %s none\n" % dirpath)
+        f.write("l root root 0755 %s %s\n" % (linkpath, dirpath))
+        f.close()
+
+    pkgs = d.getVar('VOLATILE_PKGS', True)
+    if pkgs == None:
+        pkgs = d.getVar('VOLATILESPN', True)
+        packages = (d.getVar('PACKAGES', True) or "").split()
+        if not pkgs in packages and packages != []:
+            pkgs = packages[0]
+    for pkg in pkgs.split():
+        volatiles_package(pkg)
+}
-- 
1.7.9.5



