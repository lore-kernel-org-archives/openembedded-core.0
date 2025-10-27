Return-Path: <sgreber@lilafast.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0871ECCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:46:56 +0000 (UTC)
Received: from 9.mo561.mail-out.ovh.net (9.mo561.mail-out.ovh.net [87.98.184.141])
 by mx.groups.io with SMTP id smtpd.web10.34911.1761576411117943201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lilafast.org header.s=ovhmo5359723-selector1 header.b=C8OEYcqs;
 spf=permerror, err=too many SPF records (domain: lilafast.org, ip: 87.98.184.141, mailfrom: sgreber@lilafast.org)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.231.67])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4cwGYP0NGtz6MXr
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 14:46:48 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-xgg6w (unknown [10.110.113.124])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 34C53C18C8;
	Mon, 27 Oct 2025 14:46:47 +0000 (UTC)
Received: from lilafast.org ([37.59.142.102])
	by ghost-submission-7d8d68f679-xgg6w with ESMTPSA
	id IxZtNNeF/2hXaQAAIpTa7w
	(envelope-from <sgreber@lilafast.org>); Mon, 27 Oct 2025 14:46:47 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R00472204b9a-c13f-4a07-a85d-1f55eba77cf0,
                    3F692C44A947FF2F3A0538E2626ED5B3A79D6A16) smtp.auth=sgreber@lilafast.org
X-OVh-ClientIp: 46.183.102.210
From: Steffen Greber <sgreber@lilafast.org>
To: openembedded-core@lists.openembedded.org
Cc: Steffen Greber <sgreber@lilafast.org>,
	Ross Burton <Ross.Burton@arm.com>
Subject: [PATCH v2] wic: add option to specify the diskid
Date: Mon, 27 Oct 2025 15:46:43 +0100
Message-ID: <20251027144643.102409-1-sgreber@lilafast.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9644458602718188591
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGsqI+cY5ywLQY0v6FiWx32V961yVp7r8V4oW28OFu6JU/0hjguo38oIJo9dId1GV0Xab4M/bb86wRUHwos2S/ezDdY23yCcCpXRBS9SZQF+4WsAh4VMZv5GhjZ60txP54LYgRE//mP2o6kycwq32THhWHBKtErbZ/3sf5idzCCixS/gztxcrVJvnw2nvFYpGZGOS7ZzpZAswjxGYMlfwpziG/7CrkKr27i0an8wpmAMEFpC5sOlGt5OfAArGDZAql4N2mgWT1zbtLVrtF/grqxSzOT6iYJ/bOOgED83Zgps162bhoY416pYyAUWfFd+JwOGErDwXFjf5BvOb9cD+OYOqLFm/Z2Abu8HdNEhTqpLkPafY6bAPtR12KRAiYPdV7CXzWxKlOEsfnVRbZRpFZeck/icDjk9hJ3lhKeK6YQ7QJAlVM+PHIUaR0WNMfpF4yx+sZkKjn3wkjSZ3xQMxlqBm+zhz36pqVdScUM7lJcKaNfRrbye54oD7iKKhaGuI3tPr/JEYxZUarv864hR9pVFPeaaoB9MSkwlRucLXhQYXdeW5nNrMjDj1AQ1686lUD2hLBENp5iXrOcutMGprsJQh21jKSqwN7g/xHWanvjqaF0x4oVM8MVPUwlUpDwc9FlSCh+hDxIqMejeXq5IKDW+5TuqXCYGg1XRDzwT8QpOg
DKIM-Signature: a=rsa-sha256; bh=Ls/fX9aujyKYquFwCcT0w5e7YeqBVAdfQjyK/LEnb6c=;
 c=relaxed/relaxed; d=lilafast.org; h=From; s=ovhmo5359723-selector1;
 t=1761576409; v=1;
 b=C8OEYcqsTsUXyCr171PvKiDOEuXfw9RPEu4WeEuBEsMzViNBgvYN5rnc9G4TcZjlT+e4UEjo
 j3VwWUyWCbz2OLpbwByPjOijKNpUTBWfb6GamWt/561D+lDUriYhiBKuCgI0neuSDKxmnNPYJvc
 isG7cSsEYuyJJQoQz1XTkQ4YbJ+a7nLeTomhJl1KzjvKLOzRzEYHVmjqTPzePa9S/3VMd0WHxoR
 ppfXnmwJ6HMUISVnuo8mS/mdwPf3aN8yzYLzll24sCeARNXDgE/Zk21PJHMDErE5JTkeVLG7wxV
 vtbWkorp+G+ac+04JwV2uvMS1qyLNL3TMCd/yuReCndFg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 14:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225337

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

Add WIC tests and support setting GPT diskid

Add unit tests for wic.py to cover previous patch review.
Also extend implementation to allow defining the diskid for GPT partition=
s.

CC: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Steffen Greber <sgreber@lilafast.org>
---
changes in v2:
- add diskid support for gpt tabels
- add wic tests as requested by the reviewer
---
 meta/lib/oeqa/selftest/cases/wic.py      | 36 ++++++++++++++++++++++++
 scripts/lib/wic/ksparser.py              | 20 +++++++++++++
 scripts/lib/wic/plugins/imager/direct.py | 20 +++++++------
 3 files changed, 68 insertions(+), 8 deletions(-)

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
index a762d3b6cf..4ccd70dc55 100644
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
@@ -196,6 +197,7 @@ class KickStart():
         bootloader.add_argument('--configfile')
         bootloader.add_argument('--ptable', choices=3D('msdos', 'gpt', '=
gpt-hybrid'),
                                 default=3D'msdos')
+        bootloader.add_argument('--diskid')
         bootloader.add_argument('--timeout', type=3Dint)
         bootloader.add_argument('--source')
=20
@@ -296,6 +298,24 @@ class KickStart():
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
index 6e1f1c8cba..ad922cfbf1 100644
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
@@ -315,7 +315,16 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format =3D ptable_format  # Partition table format
         # Disk system identifier
-        if os.getenv('SOURCE_DATE_EPOCH'):
+        if disk_id and ptable_format in ('gpt', 'gpt-hybrid'):
+            self.disk_guid =3D disk_id
+        elif os.getenv('SOURCE_DATE_EPOCH'):
+            self.disk_guid =3D uuid.UUID(int=3Dint(os.getenv('SOURCE_DAT=
E_EPOCH')))
+        else:
+            self.disk_guid =3D uuid.uuid4()
+
+        if disk_id and ptable_format =3D=3D 'msdos':
+            self.identifier =3D disk_id
+        elif os.getenv('SOURCE_DATE_EPOCH'):
             self.identifier =3D random.Random(int(os.getenv('SOURCE_DATE=
_EPOCH'))).randint(1, 0xffffffff)
         else:
             self.identifier =3D random.SystemRandom().randint(1, 0xfffff=
fff)
@@ -543,11 +552,6 @@ class PartitionedImage():
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

