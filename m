Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCBB6FF76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 02:58:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBN2w43Z025117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 18:58:05 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 18:58:03 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Dec 2016 10:59:21 +0800
Message-ID: <525bc19d379cb5f2b774a7593f213de26dc2ae18.1482461845.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482461845.git.Qi.Chen@windriver.com>
References: <cover.1482461845.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/2] package_manager: default to have scriptlet output captured in log
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
X-List-Received-Date: Fri, 23 Dec 2016 02:58:04 -0000
Content-Type: text/plain

We need to have scriptlet output captured in log. If we don't do so,
some useful information from scriptlets (especially postinstall script)
would be missing. In case a script has a warning message but it does not
necessarily have to fail, the message should be captured.

Opkg has already done that. Change for rpm and dpkg so that scriptlet
output is captured and no warning message is missing.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e557473..19364f6 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -669,11 +669,11 @@ class RpmPM(PackageManager):
         self.install_dir_path = os.path.join(self.target_rootfs, self.install_dir_name)
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
         self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
-        # 0 = default, only warnings
-        # 1 = --log-level=info (includes information about executing scriptlets and their output)
+        # 0 = --log-level=warning, only warnings
+        # 1 = --log-level=info (includes information about executing scriptlets and their output), default
         # 2 = --log-level=debug
         # 3 = --log-level=debug plus dumps of scriplet content and command invocation
-        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "0")
+        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "1")
         self.smart_opt = ["--log-level=%s" %
                          ("warning" if self.debug_level == 0 else
                           "info" if self.debug_level == 1 else
@@ -2024,8 +2024,9 @@ class DpkgPM(OpkgDpkgPM):
                     try:
                         bb.note("Executing %s for package: %s ..." %
                                  (control_script.name.lower(), pkg_name))
-                        subprocess.check_output([p_full, control_script.argument],
-                                stderr=subprocess.STDOUT)
+                        output = subprocess.check_output([p_full, control_script.argument],
+                                stderr=subprocess.STDOUT).decode("utf-8")
+                        bb.note(output)
                     except subprocess.CalledProcessError as e:
                         bb.note("%s for package %s failed with %d:\n%s" %
                                 (control_script.name, pkg_name, e.returncode,
-- 
1.9.1


