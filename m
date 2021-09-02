Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web09.6769.1630588796872080258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 06:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=l8lEf7tA;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1630588792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mpeKmuTX+Ua9LIcc+Kjv+19erRPGefWMTt6lfowBVao=;
	b=l8lEf7tAvxzINe4PSzTzZ0BLleksprYcy179BWmaYwjNf/2KSPhwinjpy9VU+e9EqEP2/4
	7g1JA6CPvou01IJx1DACK4mwPU1CWG4uXO6sgJGwP6+wergdjHmHJ+tS5fQzOfZTwRdMEg
	lgJRH3CUz0lnqk8gdCDps4Qn27XaemY=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] wic: Add extra-space argument
Date: Thu,  2 Sep 2021 15:19:21 +0200
Message-Id: <20210902131921.3378-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This allows extra space to be added after the last partition and is
especially useful when free space is needed for ex: adding partitions on
first boot with ex: systemd-repart[1] and the image is tested in QEMU.

[1] https://www.freedesktop.org/software/systemd/man/systemd-repart.html

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 scripts/lib/wic/plugins/imager/direct.py | 7 +++++--
 scripts/wic                              | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index 96168aadb4..9d10ec01d0 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -77,7 +77,8 @@ class DirectPlugin(ImagerPlugin):
=20
         image_path =3D self._full_path(self.workdir, self.parts[0].disk,=
 "direct")
         self._image =3D PartitionedImage(image_path, self.ptable_format,
-                                       self.parts, self.native_sysroot)
+                                       self.parts, self.native_sysroot,
+                                       options.extra_space)
=20
     def setup_workdir(self, workdir):
         if workdir:
@@ -293,7 +294,7 @@ class PartitionedImage():
     Partitioned image in a file.
     """
=20
-    def __init__(self, path, ptable_format, partitions, native_sysroot=3D=
None):
+    def __init__(self, path, ptable_format, partitions, native_sysroot=3D=
None, extra_space=3D0):
         self.path =3D path  # Path to the image file
         self.numpart =3D 0  # Number of allocated partitions
         self.realpart =3D 0 # Number of partitions in the partition tabl=
e
@@ -314,6 +315,7 @@ class PartitionedImage():
         self.sector_size =3D SECTOR_SIZE
         self.native_sysroot =3D native_sysroot
         num_real_partitions =3D len([p for p in self.partitions if not p=
.no_table])
+        self.extra_space =3D extra_space
=20
         # calculate the real partition number, accounting for partitions=
 not
         # in the partition table and logical partitions
@@ -483,6 +485,7 @@ class PartitionedImage():
             self.min_size +=3D GPT_OVERHEAD
=20
         self.min_size *=3D self.sector_size
+        self.min_size +=3D self.extra_space
=20
     def _create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' obj=
ect. """
diff --git a/scripts/wic b/scripts/wic
index a741aed364..57197c2048 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -346,6 +346,8 @@ def wic_init_parser_create(subparser):
                       default=3DFalse, help=3D"output debug information"=
)
     subparser.add_argument("-i", "--imager", dest=3D"imager",
                       default=3D"direct", help=3D"the wic imager plugin"=
)
+    subparser.add_argument("--extra-space", type=3Dint, dest=3D"extra_sp=
ace",
+                      default=3D0, help=3D"additional free disk space to=
 add to the image")
     return
=20
=20
--=20
2.33.0

