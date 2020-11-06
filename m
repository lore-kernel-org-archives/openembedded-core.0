Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web11.10056.1604658517146902125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 02:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: ch@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4CSGnb2jYLz1rwbT;
	Fri,  6 Nov 2020 11:28:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4CSGnb24qZz1qsXb;
	Fri,  6 Nov 2020 11:28:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id CuNfJ324fAjO; Fri,  6 Nov 2020 11:28:34 +0100 (CET)
X-Auth-Info: wzEBde7Up3vvzjhedR2kkN6MBlTfHpU8rZ7ru8SPQr4=
Received: from localhost (dslb-088-074-220-167.088.074.pools.vodafone-ip.de [88.74.220.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri,  6 Nov 2020 11:28:34 +0100 (CET)
From: "Claudius Heine" <ch@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Henning Schild <henning.schild@siemens.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH] wic: added fspassno parameter to partition
Date: Fri,  6 Nov 2020 11:27:22 +0100
Message-Id: <20201106102722.3674813-1-ch@denx.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <f75a25804d34913e592233c06a9dfdafe6be0830.camel@linuxfoundation.org>
References: <f75a25804d34913e592233c06a9dfdafe6be0830.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The `fspassno` parameter allows to overwrite the value of the last
column (`fs_passno`) in the /etc/fstab of the target root file system.
This allows to have periodic file system checks.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 scripts/lib/wic/help.py                  | 6 ++++++
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 1 +
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index bd3a2b97df..dd0a02fc12 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -939,6 +939,12 @@ DESCRIPTION
                       quotes.  If not specified, the default string is
                       "defaults".
=20
+         --fspassno: Specifies the order in which filesystem checks are =
done
+                     at boot time by fsck.  See fs_passno parameter of
+                     fstab(5).  This parameter will be copied into the
+                     /etc/fstab file of the installed system.  If not
+                     specified the default value of "0" will be used.
+
          --label label: Specifies the label to give to the filesystem
                         to be made on the partition. If the given
                         label is already in use by another filesystem,
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 913e3283dc..b1ade01ed4 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -155,6 +155,7 @@ class KickStart():
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=3Dsizetype("M"))
         part.add_argument('--fsoptions', dest=3D'fsopts')
+        part.add_argument('--fspassno', dest=3D'fspassno')
         part.add_argument('--fstype', default=3D'vfat',
                           choices=3D('ext2', 'ext3', 'ext4', 'btrfs',
                                    'squashfs', 'vfat', 'msdos', 'swap'))
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ebe250b00d..44b17b5bd7 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -33,6 +33,7 @@ class Partition():
         self.include_path =3D args.include_path
         self.change_directory =3D args.change_directory
         self.fsopts =3D args.fsopts
+        self.fspassno =3D args.fspassno
         self.fstype =3D args.fstype
         self.label =3D args.label
         self.use_label =3D args.use_label
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index 55db826e93..c2225ba067 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -138,8 +138,9 @@ class DirectPlugin(ImagerPlugin):
                 device_name =3D "/dev/%s%s%d" % (part.disk, prefix, part=
.realnum)
=20
             opts =3D part.fsopts if part.fsopts else "defaults"
+            passno =3D part.fspassno if part.fspassno else "0"
             line =3D "\t".join([device_name, part.mountpoint, part.fstyp=
e,
-                              opts, "0", "0"]) + "\n"
+                              opts, "0", passno]) + "\n"
=20
             fstab_lines.append(line)
             updated =3D True
--=20
2.20.1

