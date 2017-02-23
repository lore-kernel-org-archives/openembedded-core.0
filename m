Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5675E7306A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:40:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 06:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,198,1484035200"; d="scan'208";a="827650024"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2017 06:40:43 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0317B6A4004
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 06:40:41 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 16:33:48 +0200
Message-Id: <a4787efb31f19dc575e8dd552d3dabec4c8b268c.1487860017.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487860017.git.ed.bartosh@linux.intel.com>
References: <cover.1487860017.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/2] wic: bootimg-pcbios: add support for syslinux vesamenu
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
X-List-Received-Date: Thu, 23 Feb 2017 14:40:43 -0000

Installed vesamenu.c32 and its dependencies to support
vesamenu ui in syslinux config.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index bbc9f47..bd03eaa 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -160,13 +160,19 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         hdddir = "%s/hdd/boot" % cr_workdir
 
-        install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" \
-            % (staging_kernel_dir, hdddir)
-        exec_cmd(install_cmd)
-
-        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" \
-            % (bootimg_dir, hdddir)
-        exec_cmd(install_cmd)
+        cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
+                (staging_kernel_dir, hdddir),
+                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
+                (bootimg_dir, hdddir),
+                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
+                (bootimg_dir, hdddir))
+
+        for install_cmd in cmds:
+            exec_cmd(install_cmd)
 
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
-- 
2.1.4


