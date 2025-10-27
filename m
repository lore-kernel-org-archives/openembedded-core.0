Return-Path: <sgreber@lilafast.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0F8CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:14 +0000 (UTC)
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net [46.105.50.32])
 by mx.groups.io with SMTP id smtpd.web11.3519.1761601383688797745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 14:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lilafast.org header.s=ovhmo5359723-selector1 header.b=dNqyfSus;
 spf=permerror, err=too many SPF records (domain: lilafast.org, ip: 46.105.50.32, mailfrom: sgreber@lilafast.org)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.43.142])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4cwRnd4YMlz5xfZ
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-54skw (unknown [10.110.168.219])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BD6E3C2C5A;
	Mon, 27 Oct 2025 21:43:00 +0000 (UTC)
Received: from lilafast.org ([37.59.142.113])
	by ghost-submission-7d8d68f679-54skw with ESMTPSA
	id PnOjCWTn/2hhQw4A1gX0dA
	(envelope-from <sgreber@lilafast.org>); Mon, 27 Oct 2025 21:43:00 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-113S0078b5a3e08-f931-4390-9830-b8d4832d0d25,
                    3F692C44A947FF2F3A0538E2626ED5B3A79D6A16) smtp.auth=sgreber@lilafast.org
X-OVh-ClientIp: 87.79.80.255
From: Steffen Greber <sgreber@lilafast.org>
To: openembedded-core@lists.openembedded.org
Cc: Steffen Greber <sgreber@lilafast.org>
Subject: [PATCH v3] wic: add wic tests and support setting GPT diskid
Date: Mon, 27 Oct 2025 22:42:56 +0100
Message-ID: <20251027214256.104888-1-sgreber@lilafast.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16673733197594252372
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTESPtIkLAzt6nMlTO1EC23+PGGpC6kLgSs7v8KZPkpjCeZZyfU0asXoYehBOFGqvoCF1O0F16w13pC6T2AJmZ5AJV0//POKDWe+/KqOSDOyKHaI7Pnyk+jsa3kzoigsMlSj9n0n6rulAZJZ4QFJ3A+FiClGzKOLmHVDm887yVGXn145QQHNkGuZvIHV38ruChxQpDfC4luF8pYRDsKVr5FUTlZ0e5l+Lyy8Oo5RNDjd7XfF4mhCYJI5Enill2tZBfMgKtVrxpBJlddXaScxOOW9ejxCvKjIERW8zBHIDyZj3cm0wceubvh72DGr/gE2fusAtc28Vc6GGnrBslAQlmGhcM0XRiIhUYYiRkJFDCh/xn9TJblxR3+SDo8+TdlOwFcb843/liCeibE7SREbvWKct7nJfJTChuqARiaM2AcVMueqoWBTMgK7NmXvU52+SxQ0F86ecBPbQutkhmxBP/dwIZZL06LloSjXXkTRrMLuR35ZUjxKRP9ENtBxGSVEDP5a6MrUB6NPZV79PvF4z6yOnfYb81n+u/DiNcZnOjSRTSN5ccGkFi4m2uFgjDwyL43DuJsT5MzkhTqUJA6sAFLIEb3wNxF3kFR2gJu34dcPdvzAIs464eV4maf6psOh/bdCopJ5WWFH/+Ci1OiQXFrDFDgoyUoRgkSibq4XI3qIkA
DKIM-Signature: a=rsa-sha256; bh=Hd9l+gzjegIgs+K32GekG7f3/MNVSoTT+qRT5bKQjt8=;
 c=relaxed/relaxed; d=lilafast.org; h=From; s=ovhmo5359723-selector1;
 t=1761601381; v=1;
 b=dNqyfSusk2hWXMes+up0zf89hCbUTVCGr7+uBgfAPrFwsbrL4Uh2/yMwLPBhDng+R3qpJqdp
 FmnEWLSYI5hYs6qMW3gbvCdnyGtwgUV+sCVQNFone4r1PtPzEXjva1yv80y6l9U24Ckw0dvK8f1
 Kd06cqX3FtRmrqcXQ6umRg5L8zGj+qRcvG1ix+vnPTIeObThCvX7RvwVMT2sCiqOte4RtzrGvRv
 OdHo7hdML7ZY9cbDRn1WPTnoGEeVmW4x5mupHvvCpCLbH9TPtWh20J2YniT+vi70PMPeqrvwUrZ
 4z1cbQRc6hMmk3L+N0/yOPQg2zWyb5nN13fBi0vRamCuQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 21:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225364

Add unit tests for wic.py to cover previous patch review.
Also extend implementation to allow defining the diskid for GPT partition=
s.

Signed-off-by: Steffen Greber <sgreber@lilafast.org>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 36 ++++++++++++++++++++++++
 scripts/lib/wic/ksparser.py              | 21 +++++++++++++-
 scripts/lib/wic/plugins/imager/direct.py | 14 +++++----
 3 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index bb4ac23ebf..d7a9b14658 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1905,6 +1905,42 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
             self.assertIn("Source parameter 'fill' only works with the '=
--fixed-size' option, exiting.", result.output)
             self.assertNotEqual(0, result.status)
=20
+    def test_diskid_on_msdos_partition(self):
+        """Test diksid on msdos partions"""
+        img =3D 'core-image-minimal'
+        diskid =3D "0xdeadbbef"
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.writelines(['bootloader --ptable msdos --diskid %s\n' % =
diskid,
+                            'part /boot --size=3D100M --active --fstype=3D=
ext4 --label boot\n'
+                            'part /     --source rootfs      --fstype=3D=
ext4 --label root\n'])
+            wks.flush()
+            cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
+            runCmd(cmd)
+            wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
+            out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
+            self.assertEqual(1, len(out))
+            sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+            result =3D runCmd("%s/usr/sbin/sfdisk -l %s | grep 'Disk ide=
ntifier:'" % (sysroot, out[0]))
+            self.assertEqual("Disk identifier: %s" % diskid.lower(), res=
ult.output)
+
+    def test_diskid_on_gpt_partition(self):
+        """Test diksid on gpt partions"""
+        img =3D 'core-image-minimal'
+        diskid =3D "deadbeef-cafe-babe-f00d-cec2ea4eface"
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.writelines(['bootloader --ptable gpt --diskid %s\n' % di=
skid,
+                            'part /boot --size=3D100M --active --fstype=3D=
ext4 --label boot\n'
+                            'part /     --source rootfs      --fstype=3D=
ext4 --label root\n'])
+            wks.flush()
+            cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
+            runCmd(cmd)
+            wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
+            out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
+            self.assertEqual(1, len(out))
+            sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+            result =3D runCmd("%s/usr/sbin/sfdisk -l %s | grep 'Disk ide=
ntifier:'" % (sysroot, out[0]))
+            self.assertEqual("Disk identifier: %s" % diskid.upper(), res=
ult.output)
+
 class ModifyTests(WicTestCase):
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 48b5b09ddd..4ccd70dc55 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -16,6 +16,7 @@ import os
 import shlex
 import logging
 import re
+import uuid
=20
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
=20
@@ -196,7 +197,7 @@ class KickStart():
         bootloader.add_argument('--configfile')
         bootloader.add_argument('--ptable', choices=3D('msdos', 'gpt', '=
gpt-hybrid'),
                                 default=3D'msdos')
-        bootloader.add_argument('--diskid', type=3Dlambda x: int(x, 0))
+        bootloader.add_argument('--diskid')
         bootloader.add_argument('--timeout', type=3Dint)
         bootloader.add_argument('--source')
=20
@@ -297,6 +298,24 @@ class KickStart():
                             if append_var:
                                 self.bootloader.append =3D ' '.join(filt=
er(None, \
                                                          (self.bootloade=
r.append, append_var)))
+                            if parsed.diskid:
+                                if parsed.ptable =3D=3D "msdos":
+                                    try:
+                                        self.bootloader.diskid =3D int(p=
arsed.diskid, 0)
+                                    except ValueError:
+                                        err =3D "with --ptbale msdos onl=
y 32bit integers " \
+                                              "are allowed for --diskid.=
 %s could not " \
+                                              "be parsed" % self.ptable
+                                        raise KickStartError(err)
+                                else:
+                                    try:
+                                        self.bootloader.diskid =3D uuid.=
UUID(parsed.diskid)
+                                    except ValueError:
+                                        err =3D "with --ptable %s only v=
alid uuids are " \
+                                              "allowed for --diskid. %s =
could not be " \
+                                              "parsed" % (parsed.ptable,=
 parsed.diskid)
+                                        raise KickStartError(err)
+
                         else:
                             err =3D "%s:%d: more than one bootloader spe=
cified" \
                                       % (confpath, lineno)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index f40f033a3d..ad922cfbf1 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -315,7 +315,14 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format =3D ptable_format  # Partition table format
         # Disk system identifier
-        if disk_id:
+        if disk_id and ptable_format in ('gpt', 'gpt-hybrid'):
+            self.disk_guid =3D disk_id
+        elif os.getenv('SOURCE_DATE_EPOCH'):
+            self.disk_guid =3D uuid.UUID(int=3Dint(os.getenv('SOURCE_DAT=
E_EPOCH')))
+        else:
+            self.disk_guid =3D uuid.uuid4()
+
+        if disk_id and ptable_format =3D=3D 'msdos':
             self.identifier =3D disk_id
         elif os.getenv('SOURCE_DATE_EPOCH'):
             self.identifier =3D random.Random(int(os.getenv('SOURCE_DATE=
_EPOCH'))).randint(1, 0xffffffff)
@@ -545,11 +552,6 @@ class PartitionedImage():
=20
     def _write_disk_guid(self):
         if self.ptable_format in ('gpt', 'gpt-hybrid'):
-            if os.getenv('SOURCE_DATE_EPOCH'):
-                self.disk_guid =3D uuid.UUID(int=3Dint(os.getenv('SOURCE=
_DATE_EPOCH')))
-            else:
-                self.disk_guid =3D uuid.uuid4()
-
             logger.debug("Set disk guid %s", self.disk_guid)
             sfdisk_cmd =3D "sfdisk --sector-size %s --disk-id %s %s" % \
                         (self.sector_size, self.path, self.disk_guid)

