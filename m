Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.18825.1610893539632166747
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 06:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=sv/CJJfG;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from dom0.fritz.box (unknown [87.123.119.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0C7FB20B7192;
	Sun, 17 Jan 2021 06:25:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0C7FB20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610893538;
	bh=UG67tUk2OYfL/a2Uc/ShHe7/QWoBE5LAfcpGa0pskJY=;
	h=From:To:Cc:Subject:Date:From;
	b=sv/CJJfGo60RNTllyLWudzEfIJynI5xj1BzqInq4YcHQtf0uTWekHQ4eailf6TDWm
	 PkE8ZzNPETfO9vsFtzwiZQSYEEIY/VMjiUuOem10u84CEc05A2WUQeeXBod15yrG/s
	 llEWzrfWmr58yYxRB9gwmouTUj8PnkBeT2IvRaAw=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Barker <pbarker@konsulko.com>
Subject: [meta-oe][PATCH v2 1/3] runqemu: Add support for VHD/VHDX rootfs
Date: Sun, 17 Jan 2021 15:25:17 +0100
Message-Id: <20210117142519.21297-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sinan Kaya <okaya@kernel.org>

Signed-off-by: Sinan Kaya <okaya@kernel.org>
Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 scripts/runqemu | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e5e66f3453..dd92a64553 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -94,11 +94,13 @@ Examples:
   runqemu qemux86-64 core-image-sato ext4
   runqemu qemux86-64 wic-image-minimal wic
   runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-  runqemu qemux86 iso/hddimg/wic.vmdk/wic.qcow2/wic.vdi/ramfs/cpio.gz...
+  runqemu qemux86 iso/hddimg/wic.vmdk/wic.vhd/wic.vhdx/wic.qcow2/wic.vdi=
/ramfs/cpio.gz...
   runqemu qemux86 qemuparams=3D"-m 256"
   runqemu qemux86 bootparams=3D"psplash=3Dfalse"
   runqemu path/to/<image>-<machine>.wic
   runqemu path/to/<image>-<machine>.wic.vmdk
+  runqemu path/to/<image>-<machine>.wic.vhdx
+  runqemu path/to/<image>-<machine>.wic.vhd
 """)
=20
 def check_tun():
@@ -179,7 +181,7 @@ class BaseConfig(object):
         self.portlocks =3D {}
         self.bitbake_e =3D ''
         self.snapshot =3D False
-        self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
+        self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "w=
ic.vhd", "wic.vhdx")
         self.fstypes =3D ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs=
',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
         self.vmtypes =3D ('hddimg', 'iso')
@@ -1203,7 +1205,7 @@ class BaseConfig(object):
             return
         if 'wic.' in self.fstype:
             self.fstype =3D self.fstype[4:]
-        rootfs_format =3D self.fstype if self.fstype in ('vmdk', 'qcow2'=
, 'vdi') else 'raw'
+        rootfs_format =3D self.fstype if self.fstype in ('vmdk', 'vhd', =
'vhdx', 'qcow2', 'vdi') else 'raw'
=20
         qb_rootfs_opt =3D self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
--=20
2.29.2

