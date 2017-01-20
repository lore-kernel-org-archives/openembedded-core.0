Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDA27727F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5EYp019639; Fri, 20 Jan 2017 18:05:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TLtXNJySfJyh; Fri, 20 Jan 2017 18:05:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5A0M019621
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000uj-JU; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:05:01 +0000
Message-Id: <1484935506-3419-9-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/14] wic: fixed test_iso_image test case
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
X-List-Received-Date: Fri, 20 Jan 2017 18:07:18 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Fixed isoimage-isohybrid plulgin and correspondent wic tet case:
- used wic-tools target when getting varlue of STAGING_LIBDIR variable
- ensured that image is built with efi and hddimg enabled

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py                        | 4 ++++
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 6a61ba6..14109c4 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -149,6 +149,10 @@ class Wic(oeSelfTest):
     @testcase(1346)
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
+        config = 'IMAGE_FSTYPES += " hddimg "\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
         cmd = "wic create mkhybridiso --image-name core-image-minimal"
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 15fd858..a8a5dc0 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -336,15 +336,12 @@ class IsoImagePlugin(SourcePlugin):
 
                 if not os.path.isfile("%s/EFI/BOOT/%s" \
                                 % (bootimg_dir, grub_image)):
-                    grub_path = get_bitbake_var("STAGING_LIBDIR")
+                    grub_path = get_bitbake_var("STAGING_LIBDIR", "wic-tools")
                     if not grub_path:
                         msger.error("Couldn't find STAGING_LIBDIR, exiting.\n")
 
                     grub_core = "%s/grub/%s" % (grub_path, grub_target)
                     if not os.path.exists(grub_core):
-                        msger.info("Building grub-efi...\n")
-                        exec_cmd("bitbake grub-efi")
-                    if not os.path.exists(grub_core):
                         msger.error("Please build grub-efi first\n")
 
                     grub_cmd = "grub-mkimage -p '/EFI/BOOT' "
-- 
2.7.4


