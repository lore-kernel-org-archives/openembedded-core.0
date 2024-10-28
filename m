Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D12D13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 03:46:27 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.43841.1730087180638284109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 20:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 28 Oct
 2024 11:46:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 28 Oct 2024 11:46:18 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 2/2] selftest: wic: add test for WIC_SECTOR_SIZE
Date: Mon, 28 Oct 2024 11:46:18 +0800
Message-ID: <20241028034618.1504830-3-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 03:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206419

Add test for WIC_SECTOR_SIZE=3D4096. Verified it on ext4 file system.

Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index 5e475f9e3f..c96018abbb 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -839,6 +839,56 @@ bootloader --ptable gpt""")
         finally:
             os.remove(wks_file)
=20
+    def test_wic_sector_size(self):
+        """Test generation image sector size"""
+        # Add WIC_SECTOR_SIZE into config
+        config =3D 'WIC_SECTOR_SIZE =3D "4096"\n'\
+                 'WIC_BLOCK_SIZE =3D "4096"\n'\
+                 'WICVARS:append =3D " WIC_SECTOR_SIZE WIC_BLOCK_SIZE"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+
+        # Check WIC_SECTOR_SIZE apply to bitbake variable
+        wic_sector_size_str =3D get_bb_var('WIC_SECTOR_SIZE', 'core-image-=
minimal')
+        wic_sector_size =3D int(wic_sector_size_str)
+        self.assertEqual(4096, wic_sector_size)
+
+        self.logger.info("Test wic_sector_size: %d \n" % wic_sector_size)
+
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.writelines(
+                ['bootloader --ptable gpt\n',
+                 'part --fstype ext4 --source rootfs --label rofs-a --mkfs=
-extraopts "-b 4096"\n',
+                 'part --fstype ext4 --source rootfs --use-uuid --mkfs-ext=
raopts "-b 4096"\n'])
+            wks.flush()
+            cmd =3D "wic create %s -e core-image-minimal -o %s" % (wks.nam=
e, self.resultdir)
+            runCmd(cmd)
+            wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
+            images =3D glob(os.path.join(self.resultdir, "%s-*direct" % wk=
sname))
+            self.assertEqual(1, len(images))
+
+        sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        # list partitions
+        result =3D runCmd("wic ls %s -n %s" % (images[0], sysroot))
+        self.assertEqual(3, len(result.output.split('\n')))
+        self.logger.info("result: %s \n" % result.output)
+
+        # verify partition size with wic
+        res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s unit =
b p 2>/dev/null" % (wic_sector_size, images[0]))
+
+        self.logger.info("res: %s \n" % res.output)
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B=
:file:4096:4096:gpt::;\n
+        # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
+        # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
+        disk_info =3D res.output.splitlines()[1]
+        # Check sector sizes
+        sector_size_logical =3D int(disk_info.split(":")[3])
+        sector_size_physical =3D int(disk_info.split(":")[4])
+        self.assertEqual(wic_sector_size, sector_size_logical, "Logical se=
ctor size is not %d." % wic_sector_size)
+        self.assertEqual(wic_sector_size, sector_size_physical, "Physical =
sector size is not %d." % wic_sector_size)
+
=20
 class Wic2(WicTestCase):
=20
--=20
2.25.1


