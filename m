Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B11B6AC00
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2017 18:05:12 +0000 (UTC)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v07I5BG1020360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Sat, 7 Jan 2017 12:05:11 -0600
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Sat, 7 Jan 2017 12:05:10 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Sat, 7 Jan 2017 12:05:10 -0600
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Sat, 7 Jan 2017 12:05:09 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 7 Jan 2017 20:03:01 +0200
Message-ID: <20170107180301.1935-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-07_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=6
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701070284
Cc: ken.sharp@ni.com
Subject: [PATCH v4] wic/isoimage-isohybrid: remove do_stage_partition()
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
X-List-Received-Date: Sat, 07 Jan 2017 18:05:15 -0000
Content-Type: text/plain

The purpouse of this function was to check dependencies for building a
hybrid iso and build them using bitbake if not found. Calling bitbake in
this context means this wic plugin itself cannot be instrumented inside
bitbake recipes which is undesirable, the benefits of this are clear:
there is no need to maintain outside scripts to generate an iso using wic
and the isohybrid building logic can be further abstracted away into an
isohybrid.bbclass in the future which can be easily inherited or something
similar.

So remove the function and add all dependencies to NATIVE_RECIPES so that
wic can print useful errors when they're not built.

To automate building the isohybrid image dependencies, add the following
somewhere in your image build inheritence hierarcy (or maybe create a
bbclass in the future to do these sort of things automatically):

DEPENDS += "syslinux syslinux-native cdrtools-native e2fsprogs-native \
            parted-native dosfstools-native mtools-native grub-efi-native"

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 49 ----------------------
 scripts/lib/wic/utils/oe/misc.py                   |  4 ++
 2 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 3858fd439b..15fd858d22 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -194,55 +194,6 @@ class IsoImagePlugin(SourcePlugin):
         return initrd
 
     @classmethod
-    def do_stage_partition(cls, part, source_params, creator, cr_workdir,
-                           oe_builddir, bootimg_dir, kernel_dir,
-                           native_sysroot):
-        """
-        Special content staging called before do_prepare_partition().
-        It cheks if all necessary tools are available, if not
-        tries to instal them.
-        """
-        # Make sure parted is available in native sysroot
-        if not os.path.isfile("%s/usr/sbin/parted" % native_sysroot):
-            msger.info("Building parted-native...\n")
-            exec_cmd("bitbake parted-native")
-
-        # Make sure mkfs.ext2/3/4 is available in native sysroot
-        if not os.path.isfile("%s/sbin/mkfs.ext2" % native_sysroot):
-            msger.info("Building e2fsprogs-native...\n")
-            exec_cmd("bitbake e2fsprogs-native")
-
-        # Make sure syslinux is available in sysroot and in native sysroot
-        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
-        if not syslinux_dir:
-            msger.error("Couldn't find STAGING_DATADIR, exiting.\n")
-        if not os.path.exists("%s/syslinux" % syslinux_dir):
-            msger.info("Building syslinux...\n")
-            exec_cmd("bitbake syslinux")
-        if not os.path.exists("%s/syslinux" % syslinux_dir):
-            msger.error("Please build syslinux first\n")
-
-        # Make sure syslinux is available in native sysroot
-        if not os.path.exists("%s/usr/bin/syslinux" % native_sysroot):
-            msger.info("Building syslinux-native...\n")
-            exec_cmd("bitbake syslinux-native")
-
-        #Make sure mkisofs is available in native sysroot
-        if not os.path.isfile("%s/usr/bin/mkisofs" % native_sysroot):
-            msger.info("Building cdrtools-native...\n")
-            exec_cmd("bitbake cdrtools-native")
-
-        # Make sure mkfs.vfat is available in native sysroot
-        if not os.path.isfile("%s/sbin/mkfs.vfat" % native_sysroot):
-            msger.info("Building dosfstools-native...\n")
-            exec_cmd("bitbake dosfstools-native")
-
-        # Make sure mtools is available in native sysroot
-        if not os.path.isfile("%s/usr/bin/mcopy" % native_sysroot):
-            msger.info("Building mtools-native...\n")
-            exec_cmd("bitbake mtools-native")
-
-    @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index fe188c9d26..489393a24e 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -35,8 +35,11 @@ from wic.utils import runner
 
 # executable -> recipe pairs for exec_native_cmd
 NATIVE_RECIPES = {"bmaptool": "bmap-tools",
+                  "grub-mkimage": "grub-efi",
+                  "isohybrid": "syslinux",
                   "mcopy": "mtools",
                   "mkdosfs": "dosfstools",
+                  "mkisofs": "cdrtools",
                   "mkfs.btrfs": "btrfs-tools",
                   "mkfs.ext2": "e2fsprogs",
                   "mkfs.ext3": "e2fsprogs",
@@ -44,6 +47,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "mkfs.vfat": "dosfstools",
                   "mksquashfs": "squashfs-tools",
                   "mkswap": "util-linux",
+                  "mmd": "syslinux",
                   "parted": "parted",
                   "sfdisk": "util-linux",
                   "sgdisk": "gptfdisk",
-- 
2.11.0


