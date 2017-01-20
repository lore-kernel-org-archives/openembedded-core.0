Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6080A772E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5E7j019641; Fri, 20 Jan 2017 18:05:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Bn4NK1ttiElS; Fri, 20 Jan 2017 18:05:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5AYd019611
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000u4-ER; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:04:53 +0000
Message-Id: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 01/14] wic: add wic-tools recipe
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
X-List-Received-Date: Fri, 20 Jan 2017 18:05:19 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

This meta recipe is for building tools used by wic.
It allows wic to find tools in recipe specific sysroot as
all tools will be present in wic-tools sysroot.

NOTE: task do_build_sysroot is created to ensure that
sysroot is re-populated when package is built. Otherwise it will
be taken from sstate and sysroot will not be populated.

Generated wic-tools.env file for wic to be able to get values of
wic-tools variables when wic run from bitbake.

Also add dependency to grub-efi

Without grub-efi test_iso_image test case fails with this error:

AssertionError: Command 'wic create mkhybridiso --image-name
core-image-minimal' returned non-zero exit status 1:
Error: Please build grub-efi first

Fixed by adding dependency wic-tools -> grub-efi.

[RP: Added syslinux exclusion for non-IA arches]
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/wic-tools.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/meta/wic-tools.bb

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
new file mode 100644
index 0000000..0a53b73
--- /dev/null
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A meta recipe to build native tools used by wic."
+
+LICENSE = "MIT"
+
+DEPENDS = "parted-native syslinux-native gptfdisk-native dosfstools-native mtools-native bmap-tools-native grub-efi-native cdrtools-native"
+DEPENDS_append_x86 = " syslinux grub-efi"
+DEPENDS_append_x86-64 = " syslinux grub-efi"
+
+INHIBIT_DEFAULT_DEPS = "1"
+inherit nopackages
+
+python do_build_sysroot () {
+    bb.build.exec_func("extend_recipe_sysroot", d)
+
+    # Write environment variables used by wic
+    # to tmp/sysroots/<machine>/imgdata/wictools.env
+    outdir = os.path.join(d.getVar('STAGING_DIR'), 'imgdata')
+    bb.utils.mkdirhier(outdir)
+    with open(os.path.join(outdir, "wic-tools.env"), 'w') as envf:
+        for var in ('RECIPE_SYSROOT_NATIVE', 'STAGING_DATADIR', 'STAGING_LIBDIR'):
+            envf.write('%s="%s"\n' % (var, d.getVar(var).strip()))
+
+}
+addtask do_build_sysroot after do_prepare_recipe_sysroot before do_build
-- 
2.7.4


