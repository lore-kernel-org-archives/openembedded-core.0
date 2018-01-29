Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 60E6F787AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:01:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 04:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,429,1511856000"; d="scan'208";a="13895498"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2018 04:01:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:01:29 +0200
Message-Id: <a8866852780e47514f7cca9ea46c9ef48e53d29f.1517227178.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
References: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/7] meta/lib/oe/rootfs.py: separate first boot deferral logic into a separate function
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
X-List-Received-Date: Mon, 29 Jan 2018 12:01:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 754ef563abe..d3ec8a56c48 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -293,6 +293,24 @@ class Rootfs(object, metaclass=ABCMeta):
             # Remove the package manager data files
             self.pm.remove_packaging_data()
 
+    def _postpone_to_first_boot(self, postinst_intercept_hook):
+        with open(postinst_intercept_hook) as intercept:
+            registered_pkgs = None
+            for line in intercept.read().split("\n"):
+                m = re.match("^##PKGS:(.*)", line)
+                if m is not None:
+                    registered_pkgs = m.group(1).strip()
+                    break
+
+            if registered_pkgs is not None:
+                bb.warn("The postinstalls for the following packages "
+                        "will be postponed for first boot: %s" %
+                        registered_pkgs)
+
+                # call the backend dependent handler
+                self._handle_intercept_failure(registered_pkgs)
+
+
     def _run_intercepts(self):
         intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
                                       "intercept_scripts")
@@ -314,22 +332,7 @@ class Rootfs(object, metaclass=ABCMeta):
             except subprocess.CalledProcessError as e:
                 bb.warn("The postinstall intercept hook '%s' failed, details in log.do_rootfs" % script)
                 bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
-
-                with open(script_full) as intercept:
-                    registered_pkgs = None
-                    for line in intercept.read().split("\n"):
-                        m = re.match("^##PKGS:(.*)", line)
-                        if m is not None:
-                            registered_pkgs = m.group(1).strip()
-                            break
-
-                    if registered_pkgs is not None:
-                        bb.warn("The postinstalls for the following packages "
-                                "will be postponed for first boot: %s" %
-                                registered_pkgs)
-
-                        # call the backend dependent handler
-                        self._handle_intercept_failure(registered_pkgs)
+                self._postpone_to_first_boot(script_full)
 
     def _run_ldconfig(self):
         if self.d.getVar('LDCONFIGDEPEND'):
-- 
2.15.1


