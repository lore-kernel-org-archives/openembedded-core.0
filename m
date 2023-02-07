Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8FEC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 12:45:21 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.82220.1675773912112890646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 04:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id 1B9F6112CD
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 13:45:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.4]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pPNLP-1Y0XhJ0; Tue, 7 Feb 2023 13:45:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3] wic-imager-direct.py: use fstab update also for root device
Date: Tue,  7 Feb 2023 13:44:56 +0100
Message-Id: <20230207124456.6091-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675773907-511B9A0B-C816A04F/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b44dd46-8562-417f-b84f-dcf2cfbf6656
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 12:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176815

wic imager is able to add entries for the partitions to fstab. This patch=
 also
creates an entry for the root device, which was previously ignored. The r=
oot
device entry can now optionally be uuid or label based.

The stock fstab file provided by base-files.bb already contains an entry =
for the
root device. To avoid a duplicate entry in fstab, this  '/dev/root' line =
is removed
during the fstab update.

The default /dev/root entry in base-files adds the value '1' for dump and=
 passno. Add an
argument to set dump, which formerly has been hardcoded to '0'. Like this=
 we can provide the
same settings if using the fstab_update.

The result looks something like this:

proc /proc proc defaults 0 0
devpts /dev/pts devpts mode=3D0620,ptmxmode=3D0666,gid=3D5 0 0
tmpfs /run tmpfs mode=3D0755,nodev,nosuid,strictatime 0 0
tmpfs /var/volatile tmpfs defaults 0 0

UUID=3D055A-69B5 /boot vfat defaults 0 0
UUID=3D0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 1 1

If neither '--on-disk' nor '--use-label' nor '--use-uuid' are set in the =
wks file, wic falls
back to '/dev/sda' as the default device entry, which may or may not be v=
alid.
Avoid starting to guess if we don't know anything and just skip the parti=
tion in that case,
except for the root partition where we add back '/dev/root' as a reasonab=
le default,
because we can rely on it in the yocto/oe environment.

The result is now like this:

proc                 /proc                proc       defaults            =
  0  0
devpts               /dev/pts             devpts     mode=3D0620,ptmxmode=
=3D0666,gid=3D5      0  0
tmpfs                /run                 tmpfs      mode=3D0755,nodev,no=
suid,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults            =
  0  0

/dev/root	/	ext4	defaults	1	1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 scripts/lib/wic/ksparser.py              |  3 ++-
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 20 +++++++++++++++++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d1e546b12d..7cf53b3b4a 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -155,6 +155,7 @@ class KickStart():
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=3Dsizetype("M"))
         part.add_argument('--fsoptions', dest=3D'fsopts')
+        part.add_argument('--fsdump', dest=3D'fsdump')
         part.add_argument('--fspassno', dest=3D'fspassno')
         part.add_argument('--fstype', default=3D'vfat',
                           choices=3D('ext2', 'ext3', 'ext4', 'btrfs',
@@ -164,7 +165,7 @@ class KickStart():
         part.add_argument('--label')
         part.add_argument('--use-label', action=3D'store_true')
         part.add_argument('--no-table', action=3D'store_true')
-        part.add_argument('--ondisk', '--ondrive', dest=3D'disk', defaul=
t=3D'sda')
+        part.add_argument('--ondisk', '--ondrive', dest=3D'disk')
         part.add_argument("--overhead-factor", type=3Doverheadtype)
         part.add_argument('--part-name')
         part.add_argument('--part-type')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2a916e077c..113713cf16 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -33,6 +33,7 @@ class Partition():
         self.include_path =3D args.include_path
         self.change_directory =3D args.change_directory
         self.fsopts =3D args.fsopts
+        self.fsdump =3D args.fsdump
         self.fspassno =3D args.fspassno
         self.fstype =3D args.fstype
         self.label =3D args.label
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index dfaa901567..ff626b8109 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -114,12 +114,20 @@ class DirectPlugin(ImagerPlugin):
         with open(fstab_path) as fstab:
             fstab_lines =3D fstab.readlines()
=20
+        for line in fstab_lines:
+            if '/dev/root' in line:
+                fstab_lines.remove(line)
+
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint =3D=3D "/" or not (part.mountpoint.sta=
rtswith('/') or part.mountpoint =3D=3D "swap"):
+               or not (part.mountpoint.startswith('/') or part.mountpoin=
t =3D=3D "swap"):
                 continue
=20
+            if part.mountpoint =3D=3D "/":
+                part.fsdump =3D part.fsdump if part.fsdump else "1"
+                part.fspassno =3D part.fspassno if part.fspassno else "1=
"
+
             if part.use_uuid:
                 if part.fsuuid:
                     # FAT UUID is different from others
@@ -132,15 +140,21 @@ class DirectPlugin(ImagerPlugin):
                     device_name =3D "PARTUUID=3D%s" % part.uuid
             elif part.use_label:
                 device_name =3D "LABEL=3D%s" % part.label
-            else:
+            elif part.disk:
                 # mmc device partitions are named mmcblk0p1, mmcblk0p2..
                 prefix =3D 'p' if  part.disk.startswith('mmcblk') else '=
'
                 device_name =3D "/dev/%s%s%d" % (part.disk, prefix, part=
.realnum)
+            elif part.mountpoint =3D=3D "/":
+                # use /dev/root as fallback device
+                device_name =3D "/dev/root"
+            else:
+                continue
=20
             opts =3D part.fsopts if part.fsopts else "defaults"
+            dump =3D part.fsdump if part.fsdump else "0"
             passno =3D part.fspassno if part.fspassno else "0"
             line =3D "\t".join([device_name, part.mountpoint, part.fstyp=
e,
-                              opts, "0", passno]) + "\n"
+                              opts, dump, passno]) + "\n"
=20
             fstab_lines.append(line)
             updated =3D True
--=20
2.34.1


