Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42BF7708FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:15:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6V8FK28005653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:15:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 31 Jul 2014 01:15:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jul 2014 01:15:18 -0700
Message-ID: <03c7d8231db167463fa1e24e0ff52be226aab492.1406794207.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406794207.git.liezhi.yang@windriver.com>
References: <cover.1406794207.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] package_manager.py: set preferred ABI for rpm
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
X-List-Received-Date: Thu, 31 Jul 2014 08:15:21 -0000
Content-Type: text/plain

When using the RPM packaging backend to generate a rootfs there needs to
be a way to configure the preferred ABI to resolve ELF file conflicts.

Currently RPM resolves ELF file conflicts with the last-installed wins.
Using SMART it's difficult to know what the last installed will be.

There are three specific policies that can be selected:
1: ELF32 wins
2: ELF64 wins
3: ELF64 N32 wins (mips64 or mips64el only)

Another option "0" is uncontrollable, which means that if two are being
installed at once Elf64 is preferred, but if they're being installed in
two different transactions, last in wins, so we don't document it.

Add RPM_PREFER_COLOR to let the user config the preferred ABI.

[YOCTO #4073]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py |   16 ++++++++++++++++
 meta/lib/oe/rootfs.py          |    3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5444422..a0984c4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -821,6 +821,22 @@ class RpmPM(PackageManager):
         self._invoke_smart('config --set rpm-extra-macros._var=%s' %
                            self.d.getVar('localstatedir', True))
         cmd = 'config --set rpm-extra-macros._tmppath=/install/tmp'
+
+        prefer_color = self.d.getVar('RPM_PREFER_COLOR', True)
+        if prefer_color:
+            if prefer_color not in ['0', '1', '2', '3']:
+                bb.fatal("Invalid RPM_PREFER_COLOR: %s, it should be one of:\n"
+                        "\t1: ELF32 wins\n"
+                        "\t2: ELF64 wins\n"
+                        "\t3: ELF64 N32 wins (mips64 or mips64el only)" %
+                        prefer_color)
+            if prefer_color == "3" and self.d.getVar("TUNE_ARCH", True) not in \
+                                    ['mips64', 'mips64el']:
+                bb.fatal("RPM_PREFER_COLOR = \"3\" is for mips64 or mips64el "
+                         "only.")
+            self._invoke_smart('config --set rpm-extra-macros._prefer_color=%s'
+                        % prefer_color)
+
         self._invoke_smart(cmd)
 
         # Write common configuration for host and target usage
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 90a98b4..0424a01 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -329,7 +329,8 @@ class RpmRootfs(Rootfs):
 
     @staticmethod
     def _depends_list():
-        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS', 'RPM_POSTPROCESS_COMMANDS']
+        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
+                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_COLOR']
 
     def _get_delayed_postinsts(self):
         postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
-- 
1.7.9.5


