Return-Path: <sgreber@lilafast.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB6CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 09:47:53 +0000 (UTC)
Received: from 16.mo561.mail-out.ovh.net (16.mo561.mail-out.ovh.net [188.165.56.217])
 by mx.groups.io with SMTP id smtpd.web11.7525.1761040064088338361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 02:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lilafast.org header.s=ovhmo5359723-selector1 header.b=OHd6wtDN;
 spf=permerror, err=too many SPF records (domain: lilafast.org, ip: 188.165.56.217, mailfrom: sgreber@lilafast.org)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.254.116])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4crSC212GJz6XC8
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 09:47:41 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-rgt88 (unknown [10.110.118.160])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8A9C5C154C;
	Tue, 21 Oct 2025 09:47:41 +0000 (UTC)
Received: from lilafast.org ([37.59.142.99])
	by ghost-submission-7d8d68f679-rgt88 with ESMTPSA
	id k3VhCb1W92hLjQQABisz1A
	(envelope-from <sgreber@lilafast.org>); Tue, 21 Oct 2025 09:47:41 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-99G003f2b4db82-8e6f-4e08-a04d-e1f7cfbcb46e,
                    7C9AB429209E025C099E29F777304FB41B477A26) smtp.auth=sgreber@lilafast.org
X-OVh-ClientIp: 46.183.102.211
From: Steffen Greber <sgreber@lilafast.org>
To: openembedded-core@lists.openembedded.org
Cc: Steffen Greber <sgreber@lilafast.org>
Subject: [PATCH] wic: add option to specify the diskid
Date: Tue, 21 Oct 2025 09:47:38 +0000
Message-ID: <20251021094738.4037-1-sgreber@lilafast.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6250151859129701460
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFHz7TQofY2UVciaXA8Uh1jzu0v4KxAsA9wFjBEflCJfPG45lA38I172spDrI547BuloY/CovVDUwVQuxweSXFoh8AIucgqXIbqiIxxcSjD/5hsLSvps2NQK9neF1RG8MRKhFcW4CoglGj6kPzsZgh0Fa3f76s/tVt/mepmx9F7GWsTORuUQtPWiRQlbb1+2SCkByDEjYc65SiX0tMb6uea2V9JQyPIsa1S4thYTbQavGE+F4QdchiLlwVwaJxy6KxRKD94yz6/ZafC8pkPBZm2Oo8dWGP00197E5SsDlrC5NGOHNN27PjTpAG9ZpiQNcH2gYGGdd5aVbtiDmze+4dzAQGtBna9lZVVwtfnDT1eA30dkcH06AqehVqUbGsIGCoHsb7KXAIHoCul4xT57Ci19Ag6cugE4zXd06CdJX6JZebx+TULZxvNhQYdH3MaLMY6H2UvUkg9/VHb6v2vL1rumSC3cWfokdt/BvWDNJ/iV0IsiK0NVChrGzsHUoVn0lRPny2OGLDs1/0FrSW2jJzH30+UmuufB9ORHtrbYNYG+MKmaRU2Pw5PUksL/1oAJsd7/65gOn609atKzfwxGNle2hUa9Z3L+b5CufXPXOnXNxtXbu5fgUrXS7idy6AISag6DWPkGwOSfLMP/UHH2iR5x16GRaRwAujxfZNhc1dD3g
DKIM-Signature: a=rsa-sha256; bh=0VRbzzYz/H0riBBJOuZ9kKoZaWU7GZknJTrL76owRjQ=;
 c=relaxed/relaxed; d=lilafast.org; h=From; s=ovhmo5359723-selector1;
 t=1761040062; v=1;
 b=OHd6wtDNVQ8kjFCALUaIuLDqTkpgGo2LYmFF+LHjl8MYV9xmDb534skpAGppB3iF0KGn2AFB
 uQSIFNYHEcFgVInwK6/ioOcmSPxtQFnARRs0InGORA67LW+tVnykQaBpHsHb+i4V1uiroKc9wrG
 tjS9R4KosoYr+ZMNp4Y8R2ZXeCMPWFmoU3nOq1jA8CgK9J4k1CDtDQ2Io3Ue1RoOECkfk7LBrul
 t6QRhLxC0FTU8ePkJWC/DFmFNra3QwYUw+VWHfd7zboHcx2NyZy47hBcUhmmFZSBf4Yqv8Vd1SA
 lnP4dcMt/I8Sy75k2FbvKH+SUz23tQA0N5jmMkwUPP31Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 09:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225147

This adds a feature to specify the disk ID when creating a disk with
the wic tool. This is useful when using the DOS partition scheme and
booting with root=3DPARTUUID=3D<partuuid>. In DOS partitions, the partiti=
on
ID is <diskid>-<partition-number>, so it makes sense to let the user
define the disk ID.

You can specify it in the kickstart file using the --diskid argument
to the bootloader command. The value can be given in decimal or
hexadecimal format (e.g. 3735928559 or 0xdeadbeef). If omitted, the
previous behaviour does not change.

Signed-off-by: Steffen Greber <sgreber@lilafast.org>
---
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/plugins/imager/direct.py | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index a762d3b6cf..48b5b09ddd 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -196,6 +196,7 @@ class KickStart():
         bootloader.add_argument('--configfile')
         bootloader.add_argument('--ptable', choices=3D('msdos', 'gpt', '=
gpt-hybrid'),
                                 default=3D'msdos')
+        bootloader.add_argument('--diskid', type=3Dlambda x: int(x, 0))
         bootloader.add_argument('--timeout', type=3Dint)
         bootloader.add_argument('--source')
=20
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index 6e1f1c8cba..f40f033a3d 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -76,7 +76,7 @@ class DirectPlugin(ImagerPlugin):
                 break
=20
         image_path =3D self._full_path(self.workdir, self.parts[0].disk,=
 "direct")
-        self._image =3D PartitionedImage(image_path, self.ptable_format,
+        self._image =3D PartitionedImage(image_path, self.ptable_format,=
 self.ks.bootloader.diskid,
                                        self.parts, self.native_sysroot,
                                        options.extra_space)
=20
@@ -302,7 +302,7 @@ class PartitionedImage():
     Partitioned image in a file.
     """
=20
-    def __init__(self, path, ptable_format, partitions, native_sysroot=3D=
None, extra_space=3D0):
+    def __init__(self, path, ptable_format, disk_id, partitions, native_=
sysroot=3DNone, extra_space=3D0):
         self.path =3D path  # Path to the image file
         self.numpart =3D 0  # Number of allocated partitions
         self.realpart =3D 0 # Number of partitions in the partition tabl=
e
@@ -315,7 +315,9 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format =3D ptable_format  # Partition table format
         # Disk system identifier
-        if os.getenv('SOURCE_DATE_EPOCH'):
+        if disk_id:
+            self.identifier =3D disk_id
+        elif os.getenv('SOURCE_DATE_EPOCH'):
             self.identifier =3D random.Random(int(os.getenv('SOURCE_DATE=
_EPOCH'))).randint(1, 0xffffffff)
         else:
             self.identifier =3D random.SystemRandom().randint(1, 0xfffff=
fff)

