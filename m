Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.947.1626461122920046393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 11:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC06631B
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 11:45:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 853673F66F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 11:45:21 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] e2fsprogs: ensure small images have 256-byte inodes
Date: Fri, 16 Jul 2021 19:45:18 +0100
Message-Id: <20210716184519.2755673-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

e2fsprogs calls filesystems larger than 3MB but smaller than 512MB
"small", which has some implications:

- blocksize 1024 instead of 4096
- inode_ratio 4096 instead of 16384
- inode_size 128 instead of 256

The outcome of the inode size dropping to 128 bytes is that they cannot
store 64-bit timestamps, so are not Y2038-safe.

A previous attempt to solve this problem[1] changed some of the canned
wic files to pass -T default to mkfs.ext4, but this only covered wic
images and not traditional images.  Also, actually small filesystems,
for example a core-image-minimal, will happily be tens of megabytes and
with the "default" options will result in an image which runs out of
blocks before it runs out of space:

mkfs.ext4: Could not allocate block in ext2 filesystem while populating f=
ile system

Considering that many OpenEmbedded images are in fact "small", being
2038-safe is worth the marginal increase is disk usage.  This patch
alters the small configuration in native builds so that it also has
256-byte inodes.  Target is unchanged so that standard behaviour is
maintained outside of the build.

This is actually the same underlying patch that Mathieu Dubois-Briand
sent in April, but the wic change in [1] was accepted instead. I believe
that is the wrong approach and this approach covers more cases.

[ YOCTO #14478 ]

[1] openembedded-core eecbe62
[2] https://lists.openembedded.org/g/openembedded-core/message/150298

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../e2fsprogs/big-inodes-for-small-fs.patch   | 22 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.46.2.bb             |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-=
for-small-fs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-sma=
ll-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-sm=
all-fs.patch
new file mode 100644
index 0000000000..caeb560d32
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.p=
atch
@@ -0,0 +1,22 @@
+Ensure "small" file systems also have the default inode size (256 bytes)=
 so that
+can store 64-bit timestamps and work past 2038.
+
+The "small" type is any size >3MB and <512MB, which covers a lot of rela=
tively
+small filesystems built by OE, especially when they're sized to fit the =
contents
+and expand to the storage on boot.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
+index 01e35cf8..29f41dc0 100644
+--- a/misc/mke2fs.conf.in
++++ b/misc/mke2fs.conf.in
+@@ -16,7 +16,6 @@
+ 	}
+ 	small =3D {
+ 		blocksize =3D 1024
+-		inode_size =3D 128
+ 		inode_ratio =3D 4096
+ 	}
+ 	floppy =3D {
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
index fc022f37de..94243296ae 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
@@ -10,6 +10,7 @@ SRC_URI +=3D "file://remove.ldconfig.call.patch \
=20
 SRC_URI_append_class-native =3D " file://e2fsprogs-fix-missing-check-for=
-permission-denied.patch \
                                 file://quiet-debugfs.patch \
+                                file://big-inodes-for-small-fs.patch \
 "
=20
=20
--=20
2.25.1

