Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4276770A1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Oct 2015 04:36:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t934a8ZZ014215
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Oct 2015 21:36:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 2 Oct 2015 21:36:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Oct 2015 21:36:07 -0700
Message-ID: <1443846967-40083-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [YP 2.1] [RFC PATCH] insane.bbclass: check files under /etc/ are marked by CONFFILES
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
X-List-Received-Date: Sat, 03 Oct 2015 04:36:09 -0000
Content-Type: text/plain

Hello,

Usually, files under /etc/ should be marked by CONFFILES so that package
manager can handle it well when package ugprades.

Please feel free to let me know if you have any suggestions, and I will
send patches later (including set CONFFILES for the recipes) if this is
OK.

[YOCTO #8413]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fb04215..30fc41b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -32,7 +32,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
             unknown-configure-option symlink-to-sysroot multilib \
-            invalid-pkgconfig host-user-contaminated \
+            invalid-pkgconfig host-user-contaminated conffiles \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1020,6 +1020,36 @@ def package_qa_check_host_user(path, name, d, elf, messages):
             return False
     return True
 
+QAPATHTEST[conffiles] = "package_qa_check_conffiles"
+def package_qa_check_conffiles(path, name, d, elf, messages):
+    """ Check files in ${sysconfdir} are marked by CONFFILES """
+
+    if os.path.islink(path) or not os.path.exists(path):
+        return True
+
+    sysconfdir = d.getVar('sysconfdir', True)
+    dest = d.getVar('PKGDEST', True)
+    sysconfdir_path = os.path.join(os.path.join(dest, name), \
+                        sysconfdir.lstrip('/'))
+
+    if not path.startswith(sysconfdir_path):
+        return True
+    else:
+        conffiles = d.getVar('CONFFILES_%s' % name, True)
+        if conffiles == None:
+            conffiles = d.getVar('CONFFILES', True) or ""
+        conffiles = conffiles.split()
+        conf_orig_list = files_from_filevars(conffiles)
+        # PKGDEST + name
+        pkg_root = os.path.join(dest, name)
+        # Prepend "." to match items in files_from_filevars()
+        path_no_root = "." + path.replace(pkg_root, '')
+        if not conffiles or path_no_root not in conf_orig_list:
+            messages["conffiles"] = "%s: %s is not in CONFFILES" % (name, path)
+            return False
+
+    return True
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
1.7.9.5


