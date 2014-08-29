Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B56A70EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:38:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T8cg1q025195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:38:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 01:38:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 01:38:40 -0700
Message-ID: <5576157f6e5f5bec7d4d6102f26bc8e22bb63c96.1409300104.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409300104.git.liezhi.yang@windriver.com>
References: <cover.1409300104.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] package_manager.py: use RPM_PREFER_ELF_ARCH
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
X-List-Received-Date: Fri, 29 Aug 2014 08:38:41 -0000
Content-Type: text/plain

Use RPM_PREFER_ELF_ARCH to instead of RPM_PREFER_COLOR as rpm upstream
suggested, and use "4" to instead of "3" since it is a bit mask (not
enumeration), so we need "4" here.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py |   12 ++++++------
 meta/lib/oe/rootfs.py          |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f8fc3c2..2df2d86 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -798,17 +798,17 @@ class RpmPM(PackageManager):
                            self.d.getVar('localstatedir', True))
         cmd = 'config --set rpm-extra-macros._tmppath=/install/tmp'
 
-        prefer_color = self.d.getVar('RPM_PREFER_COLOR', True)
+        prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH', True)
         if prefer_color:
-            if prefer_color not in ['0', '1', '2', '3']:
-                bb.fatal("Invalid RPM_PREFER_COLOR: %s, it should be one of:\n"
+            if prefer_color not in ['0', '1', '2', '4']:
+                bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be one of:\n"
                         "\t1: ELF32 wins\n"
                         "\t2: ELF64 wins\n"
-                        "\t3: ELF64 N32 wins (mips64 or mips64el only)" %
+                        "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
                         prefer_color)
-            if prefer_color == "3" and self.d.getVar("TUNE_ARCH", True) not in \
+            if prefer_color == "4" and self.d.getVar("TUNE_ARCH", True) not in \
                                     ['mips64', 'mips64el']:
-                bb.fatal("RPM_PREFER_COLOR = \"3\" is for mips64 or mips64el "
+                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
                          "only.")
             self._invoke_smart('config --set rpm-extra-macros._prefer_color=%s'
                         % prefer_color)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0424a01..3d8ae81 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -330,7 +330,7 @@ class RpmRootfs(Rootfs):
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
-                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_COLOR']
+                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_ELF_ARCH']
 
     def _get_delayed_postinsts(self):
         postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
-- 
1.7.9.5


