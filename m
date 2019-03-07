Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE80B6C487
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 03:22:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x273MMqD025125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2019 19:22:32 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 6 Mar 2019 19:22:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 11:41:22 +0800
Message-ID: <3ca65649194182d3bbe00b88611e50fff7884c5f.1551929817.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1551929817.git.liezhi.yang@windriver.com>
References: <cover.1551929817.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] insane.bbclass: Add configure-unsafe and configure-gettext
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
X-List-Received-Date: Thu, 07 Mar 2019 03:22:41 -0000
Content-Type: text/plain

So that the errors can be controlled by ERROR_QA or WARN_QA, and make them work
with INSANE_SKIP.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fd9c5f0..fedf2c9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -33,7 +33,8 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
-            license-checksum dev-elf file-rdeps \
+            license-checksum dev-elf file-rdeps configure-unsafe \
+            configure-gettext \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -1059,15 +1060,22 @@ python do_qa_configure() {
     configs = []
     workdir = d.getVar('WORKDIR')
 
-    if bb.data.inherits_class('autotools', d):
+    skip = (d.getVar('INSANE_SKIP') or "").split()
+    skip_configure_unsafe = False
+    if 'configure-unsafe' in skip:
+        bb.note("Recipe %s skipping qa chekcing: configure-unsafe" % d.getVar('PN'))
+        skip_configure_unsafe = True
+
+    if bb.data.inherits_class('autotools', d) and not skip_configure_unsafe:
         bb.note("Checking autotools environment for common misconfiguration")
         for root, dirs, files in os.walk(workdir):
             statement = "grep -q -F -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s" % \
                         os.path.join(root,"config.log")
             if "config.log" in files:
                 if subprocess.call(statement, shell=True) == 0:
-                    bb.fatal("""This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
-Rerun configure task after fixing this.""")
+                    error_msg = """This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
+Rerun configure task after fixing this."""
+                    package_qa_handle_error("configure-unsafe", error_msg, d)
 
             if "configure.ac" in files:
                 configs.append(os.path.join(root,"configure.ac"))
@@ -1078,8 +1086,14 @@ Rerun configure task after fixing this.""")
     # Check gettext configuration and dependencies are correct
     ###########################################################################
 
+    skip_configure_gettext = False
+    if 'configure-gettext' in skip:
+        bb.note("Recipe %s skipping qa chekcing: configure-gettext" % d.getVar('PN'))
+        skip_configure_gettext = True
+
     cnf = d.getVar('EXTRA_OECONF') or ""
-    if "gettext" not in d.getVar('P') and "gcc-runtime" not in d.getVar('P') and "--disable-nls" not in cnf:
+    if not ("gettext" in d.getVar('P') or "gcc-runtime" in d.getVar('P') or \
+            "--disable-nls" in cnf or skip_configure_gettext):
         ml = d.getVar("MLPREFIX") or ""
         if bb.data.inherits_class('cross-canadian', d):
             gt = "nativesdk-gettext"
@@ -1090,8 +1104,8 @@ Rerun configure task after fixing this.""")
             for config in configs:
                 gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
                 if subprocess.call(gnu, shell=True) == 0:
-                    bb.fatal("""%s required but not in DEPENDS for file %s.
-Missing inherit gettext?""" % (gt, config))
+                    error_msg = "%s required but not in DEPENDS for file %s. Missing inherit gettext?"
+                    package_qa_handle_error("configure-gettext", error_msg, d)
 
     ###########################################################################
     # Check unrecognised configure options (with a white list)
-- 
2.7.4


