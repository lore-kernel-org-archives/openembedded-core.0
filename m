Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58E4E7646C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:18:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6UFIBmN004045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 08:18:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 08:17:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 08:18:09 -0700
Message-ID: <5a438f9c9891d850808a0ca91d545d34291ff23d.1438269391.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438269391.git.liezhi.yang@windriver.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] base.bbclass: move invalid PACKAGECONFIG checking to insane.bbclass
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
X-List-Received-Date: Thu, 30 Jul 2015 15:18:12 -0000
Content-Type: text/plain

There was a problem when check invalid PACKAGECONFIG in the anonymous
function (when parsing), for example, there are two versions of a
recipe:
foo_1.0.bb
foo_2.0.bb
While foo_2.0.bb has a "PACKAGECONFIG[item] = 'x,y,z'", but foo_1.0.bb
doesn't, if we set PACKAGECONFIG_pn-foo = "item" in a conf file, we
would get the warning about invalid PACKAGECONFIG for foo_1.0.bb. Delay
the checking to build time will fix the problem.

[YOCTO #8065]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass   |    4 ----
 meta/classes/insane.bbclass |   11 +++++++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e0f1053..b7e22ad 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -340,10 +340,6 @@ python () {
         pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
         pn = d.getVar("PN", True)
 
-        for pconfig in pkgconfig:
-            if pconfig not in pkgconfigflags:
-                bb.warn("%s: invalid PACKAGECONFIG: %s" % (pn, pconfig))
-
         mlprefix = d.getVar("MLPREFIX", True)
 
         def expandFilter(appends, extension, prefix):
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fc3d5ff..9c05c86 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -31,6 +31,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
             unknown-configure-option symlink-to-sysroot multilib \
+            invalid-pkgconfig \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1139,6 +1140,16 @@ Missing inherit gettext?""" % (gt, config))
                 package_qa_handle_error("unknown-configure-option", error_msg, d)
         except subprocess.CalledProcessError:
             pass
+
+    # Check invalid PACKAGECONFIG
+    pkgconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
+    if pkgconfig:
+        pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
+        for pconfig in pkgconfig:
+            if pconfig not in pkgconfigflags:
+                pn = d.getVar('PN', True)
+                error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
+                package_qa_handle_error("invalid-pkgconfig", error_msg, d)
 }
 
 python do_qa_unpack() {
-- 
1.7.9.5


