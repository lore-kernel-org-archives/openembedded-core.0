Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 574FC6D46F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 05:17:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBA5HS9v026933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Dec 2013 21:17:28 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 9 Dec 2013 21:17:28 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2013 13:18:19 +0800
Message-ID: <f912a34b9f494e08cf0e0e45c5d646989a0a9dd2.1386652595.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386652595.git.Qi.Chen@windriver.com>
References: <cover.1386652595.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] license.bbclass: fix the code of installing and packaging license files
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
X-List-Received-Date: Tue, 10 Dec 2013 05:17:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, enabling and disabling 'LICENSE_CREATE_PACKAGE' doesn't cause
rerun of the packaging process. As a result, if this variable was enabled
before, then the generated packages would still require the '-lic' packages
even if the variable is now disabled.

Ideally, the packaging process should rerun if the value of the variable
LICENSE_CREATE_PACKAGE is modified. And as this variable also triggers
the installation of license files, the do_install task should also rerun
if the variable is modified. On the other hand, the tasks should not rerun
for native packages and nativesdk packages, because installing and packaging
the license files only applies to the target packages.

This patch achieves the above behavior.

[YOCTO #5635]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/license.bbclass |   25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 7fe47b2..d35071c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -98,15 +98,32 @@ python do_populate_lic() {
     copy_license_files(lic_files_paths, destdir)
 }
 
-# it would be better to copy them in do_install_append, but find_license_filesa is python
-python perform_packagecopy_prepend () {
+# Copy license files in do_install if necessary
+python install_lic_files() {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
     if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
         lic_files_paths = find_license_files(d)
-
-        # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot be used to join D and LICENSE_FILES_DIRECTORY
         destdir = d.getVar('D', True) + os.path.join(d.getVar('LICENSE_FILES_DIRECTORY', True), d.getVar('PN', True))
         copy_license_files(lic_files_paths, destdir)
+}
+do_install[postfuncs] += "install_lic_files "
+
+# When LICENSE_FILES_DIRECTORY or LICENSE_CREATE_PACKAGE changes, it should
+# only affect target packages
+python __anonymous() {
+    # The dependency of do_install should only apply for target packages...
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or \
+       bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or \
+       bb.data.inherits_class('cross-canadian', d):
+        return
+
+    d.appendVarFlag('do_install', 'vardeps', 'LICENSE_CREATE_PACKAGE LICENSE_FILES_DIRECTORY')
+}
+
+# Set up license packages if necessary
+python perform_packagecopy_prepend () {
+    enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
+    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
         add_package_and_files(d)
 }
 
-- 
1.7.9.5


