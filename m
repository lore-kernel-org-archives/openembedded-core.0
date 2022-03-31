Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB50AC433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.661.1648751368872686118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89729139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20CDB3F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/23] oeqa/selftest/wic: use os.path.join to join paths
Date: Thu, 31 Mar 2022 19:29:13 +0100
Message-Id: <20220331182915.22128-21-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163862

Instead of using string concatenation, use os.path.join.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 92 ++++++++++++++---------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index c2496486bc2..5bdd9ae87e3 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -170,14 +170,14 @@ class Wic(WicTestCase):
         """Test wic create wictestdisk --image-name=3Dcore-image-minimal=
"""
         cmd =3D "wic create wictestdisk --image-name=3Dcore-image-minima=
l -o %s" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
+        self.assertEqual(1, len(glob(os.path.join (self.resultdir, "wict=
estdisk-*.direct"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID b=
oot"""
         cmd =3D "wic create directdisk-gpt --image-name core-image-minim=
al -o %s" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.dire=
ct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-*.direct"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_iso_image(self):
@@ -190,22 +190,22 @@ class Wic(WicTestCase):
         self.remove_config(config)
         cmd =3D "wic create mkhybridiso --image-name core-image-minimal =
-o %s" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.=
direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.=
iso")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "HYBRI=
D_ISO_IMG-*.direct"))))
+        self.assertEqual(1, len(glob(os.path.join (self.resultdir, "HYBR=
ID_ISO_IMG-*.iso"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         cmd =3D "wic create qemux86-directdisk -e core-image-minimal -o =
%s" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdis=
k-*direct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "qemux=
86-directdisk-*direct"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd =3D "wic create mkefidisk -e core-image-minimal -o %s" % sel=
f.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct=
")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "mkefi=
disk-*direct"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_bootloader_config(self):
@@ -216,7 +216,7 @@ class Wic(WicTestCase):
         self.remove_config(config)
         cmd =3D "wic create directdisk-bootloader-config -e core-image-m=
inimal -o %s" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootlo=
ader-config-*direct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-bootloader-config-*direct"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_systemd_bootdisk(self):
@@ -227,7 +227,7 @@ class Wic(WicTestCase):
         self.remove_config(config)
         cmd =3D "wic create systemd-bootdisk -e core-image-minimal -o %s=
" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-=
*direct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "syste=
md-bootdisk-*direct"))))
=20
     def test_efi_bootpart(self):
         """Test creation of efi-bootpart image"""
@@ -236,7 +236,7 @@ class Wic(WicTestCase):
         self.append_config('IMAGE_EFI_BOOT_FILES =3D "%s;kernel"\n' % ki=
mgtype)
         runCmd(cmd)
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
-        images =3D glob(self.resultdir + "mkefidisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "mkefidisk-*.direct=
"))
         result =3D runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))  =
    =20
         self.assertIn("kernel",result.output)
=20
@@ -246,7 +246,7 @@ class Wic(WicTestCase):
         kimgtype =3D get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal'=
)
         self.write_config('IMAGE_BOOT_FILES =3D "%s"\n' % kimgtype)
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-=
*direct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdima=
ge-bootpart-*direct"))))
=20
     # TODO this doesn't have to be x86-specific
     @only_for_arch(['i586', 'i686', 'x86_64'])
@@ -277,28 +277,28 @@ class Wic(WicTestCase):
                         "-n %(recipe_sysroot_native)s "
                         "-r %(image_rootfs)s "
                         "-o %(resultdir)s" % bbvars)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.dire=
ct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-*.direct"))))
=20
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
                                    "-c gzip -o %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect.gz")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct.gz"))))
=20
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-c bzip2 -o %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect.bz2")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct.bz2"))))
=20
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "--compress-with=3Dxz -o %s" % self.r=
esultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect.xz")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct.xz"))))
=20
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
@@ -312,23 +312,23 @@ class Wic(WicTestCase):
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
-        self.assertEqual(1, len(glob(self.resultdir + "tmp.wic*")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "tmp.w=
ic*"))))
=20
     def test_debug_long(self):
         """Test --debug option"""
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "--debug -o %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
-        self.assertEqual(1, len(glob(self.resultdir + "tmp.wic*")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "tmp.w=
ic*"))))
=20
     def test_skip_build_check_short(self):
         """Test -s option"""
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-s -o %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
=20
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
@@ -336,14 +336,14 @@ class Wic(WicTestCase):
                                    "--image-name=3Dcore-image-minimal "
                                    "--skip-build-check "
                                    "--outdir %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
=20
     def test_build_rootfs_short(self):
         """Test -f option"""
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-f -o %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
=20
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
@@ -351,7 +351,7 @@ class Wic(WicTestCase):
                                    "--image-name=3Dcore-image-minimal "
                                    "--build-rootfs "
                                    "--outdir %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
=20
     # TODO this doesn't have to be x86-specific
     @only_for_arch(['i586', 'i686', 'x86_64'])
@@ -362,7 +362,7 @@ class Wic(WicTestCase):
                         "--rootfs rootfs1=3Dcore-image-minimal "
                         "--rootfs rootfs2=3Dcore-image-minimal "
                         "--outdir %s" % self.resultdir)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-=
rootfs*.direct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-multi-rootfs*.direct"))))
=20
     # TODO this doesn't have to be x86-specific
     @only_for_arch(['i586', 'i686', 'x86_64'])
@@ -382,7 +382,7 @@ class Wic(WicTestCase):
                         "--rootfs-dir rootfs1=3D%(image_rootfs)s "
                         "--rootfs-dir rootfs2=3D%(image_rootfs)s "
                         "--outdir %(resultdir)s" % bbvars)
-        self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct"=
 % bbvars)))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "%(wks=
)s-*.direct" % bbvars))))
=20
     def test_exclude_path(self):
         """Test --exclude-path wks option."""
@@ -403,7 +403,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=3D=
ext4 --exclude-path bin/ --r
                                        % (wks_file, self.resultdir))
=20
             os.remove(wks_file)
-            wicout =3D glob(self.resultdir + "%s-*direct" % 'temp')
+            wicout =3D glob(os.path.join(self.resultdir, "%s-*direct" % =
'temp'))
             self.assertEqual(1, len(wicout))
=20
             wicimg =3D wicout[0]
@@ -691,7 +691,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-di=
rectory=3Detc
=20
         # Get stock fstab from base-files recipe
         bitbake('base-files -c do_install')
-        bf_fstab =3D os.path.join(get_bb_var('D', 'base-files'), 'etc/fs=
tab')
+        bf_fstab =3D os.path.join(get_bb_var('D', 'base-files'), 'etc', =
'fstab')
         self.assertEqual(True, os.path.exists(bf_fstab))
         bf_fstab_md5sum =3D runCmd('md5sum %s 2>/dev/null' % bf_fstab).o=
utput.split(" ")[0]
=20
@@ -746,7 +746,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-di=
rectory=3Detc
         runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
                                    "--extra-space %i -o %s" % (extraspac=
e ,self.resultdir))
-        wicout =3D glob(self.resultdir + "wictestdisk-*.direct")
+        wicout =3D glob(os.path.join(self.resultdir, "wictestdisk-*.dire=
ct"))
         self.assertEqual(1, len(wicout))
         size =3D os.path.getsize(wicout[0])
         self.assertTrue(size > extraspace)
@@ -757,15 +757,15 @@ class Wic2(WicTestCase):
         """Test generation of .bmap file -m option"""
         cmd =3D "wic create wictestdisk -e core-image-minimal -m -o %s" =
% self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct")))
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct.bmap")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct"))))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct.bmap"))))
=20
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
         cmd =3D "wic create wictestdisk -e core-image-minimal --bmap -o =
%s" % self.resultdir
         runCmd(cmd)
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct")))
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct.bmap")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct"))))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct.bmap"))))
=20
     def test_image_env(self):
         """Test generation of <image>.env files."""
@@ -801,7 +801,7 @@ class Wic2(WicTestCase):
                                    "--image-name=3D%s -v %s -n %s -o %s"
                                    % (image, imgenvdir, native_sysroot,
                                       self.resultdir))
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct"))))
=20
     def test_image_vars_dir_long(self):
         """Test image vars directory selection --vars option"""
@@ -816,7 +816,7 @@ class Wic2(WicTestCase):
                                    "--outdir %s"
                                    % (image, imgenvdir, native_sysroot,
                                       self.resultdir))
-        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct"))))
=20
     @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_wic_image_type(self):
@@ -899,7 +899,7 @@ class Wic2(WicTestCase):
=20
         wksname =3D os.path.splitext(os.path.basename(wkspath))[0]
=20
-        wicout =3D glob(self.resultdir + "%s-*direct" % wksname)
+        wicout =3D glob(os.path.join(self.resultdir, "%s-*direct" % wksn=
ame))
=20
         if not wicout:
             return (p, None)
@@ -1078,7 +1078,7 @@ class Wic2(WicTestCase):
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
             runCmd(cmd)
             wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
-            out =3D glob(self.resultdir + "%s-*direct" % wksname)
+            out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
             self.assertEqual(1, len(out))
=20
     def test_rawcopy_plugin(self):
@@ -1168,7 +1168,7 @@ class Wic2(WicTestCase):
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
             runCmd(cmd)
             wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
-            out =3D glob(self.resultdir + "%s-*.direct" % wksname)
+            out =3D glob(os.path.join(self.resultdir, "%s-*.direct" % wk=
sname))
             self.assertEqual(1, len(out))
=20
     # TODO this test could also work on aarch64
@@ -1218,7 +1218,7 @@ class Wic2(WicTestCase):
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
             runCmd(cmd)
             wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
-            out =3D glob(self.resultdir + "%s-*direct" % wksname)
+            out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
             self.assertEqual(1, len(out))
=20
     def test_kickstart_parser(self):
@@ -1230,7 +1230,7 @@ class Wic2(WicTestCase):
             cmd =3D "wic create %s -e core-image-minimal -o %s" % (wks.n=
ame, self.resultdir)
             runCmd(cmd)
             wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
-            out =3D glob(self.resultdir + "%s-*direct" % wksname)
+            out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
             self.assertEqual(1, len(out))
=20
     def test_image_bootpart_globbed(self):
@@ -1241,7 +1241,7 @@ class Wic2(WicTestCase):
         self.append_config(config)
         runCmd(cmd)
         self.remove_config(config)
-        self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-=
*direct")))
+        self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdima=
ge-bootpart-*direct"))))
=20
     def test_sparse_copy(self):
         """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
@@ -1287,7 +1287,7 @@ class Wic2(WicTestCase):
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
             runCmd(cmd)
             wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
-            out =3D glob(self.resultdir + "%s-*direct" % wksname)
+            out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
             self.assertEqual(1, len(out))
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
@@ -1351,7 +1351,7 @@ class ModifyTests(WicTestCase):
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        images =3D glob(self.resultdir + "wictestdisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "wictestdisk-*.dire=
ct"))
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1369,7 +1369,7 @@ class ModifyTests(WicTestCase):
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        images =3D glob(self.resultdir + "wictestdisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "wictestdisk-*.dire=
ct"))
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1415,7 +1415,7 @@ class ModifyTests(WicTestCase):
         runCmd("wic create mkefidisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        images =3D glob(self.resultdir + "mkefidisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "mkefidisk-*.direct=
"))
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1443,7 +1443,7 @@ class ModifyTests(WicTestCase):
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        images =3D glob(self.resultdir + "wictestdisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "wictestdisk-*.dire=
ct"))
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1458,7 +1458,7 @@ class ModifyTests(WicTestCase):
         runCmd("wic create wictestdisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        images =3D glob(self.resultdir + "wictestdisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "wictestdisk-*.dire=
ct"))
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1494,7 +1494,7 @@ class ModifyTests(WicTestCase):
         runCmd("wic create mkefidisk "
                                    "--image-name=3Dcore-image-minimal "
                                    "-D -o %s" % self.resultdir)
-        images =3D glob(self.resultdir + "mkefidisk-*.direct")
+        images =3D glob(os.path.join(self.resultdir, "mkefidisk-*.direct=
"))
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
--=20
2.25.1


