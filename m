Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4928.1626435149859451692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 04:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66F41042
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 04:32:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7130E3F774
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 04:32:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] parted: skip tests that need vfat support
Date: Fri, 16 Jul 2021 12:32:24 +0100
Message-Id: <20210716113225.4138702-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716113225.4138702-1-ross.burton@arm.com>
References: <20210716113225.4138702-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

At the time of writing the qemu kernels don't support vfat filesystems.
There are patches on the list to add that, but as two tests fail without
vfat support, make them skip if vfat isn't available.

[ YOCTO #14470 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../parted/files/check-vfat.patch             | 51 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.4.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/check-vfat.patch

diff --git a/meta/recipes-extended/parted/files/check-vfat.patch b/meta/r=
ecipes-extended/parted/files/check-vfat.patch
new file mode 100644
index 0000000000..c64130a4e2
--- /dev/null
+++ b/meta/recipes-extended/parted/files/check-vfat.patch
@@ -0,0 +1,51 @@
+Add checks for both mkfs.vfat and the vfat file system in the kernel bef=
ore
+running tests.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/t-lib-helpers.sh b/tests/t-lib-helpers.sh
+index 4c6c75f..2cc7577 100644
+--- a/tests/t-lib-helpers.sh
++++ b/tests/t-lib-helpers.sh
+@@ -418,3 +418,13 @@ require_64bit_()
+           ;;
+   esac
+ }
++
++# Check if the specified filesystem is either built into the kernel, or=
 can be loaded
++# as a module
++# Usage: has_filesystem vfat
++# Ruturns 0 if the filesystem is available, otherwise skips the test
++require_filesystem_()
++{
++  grep -q $1 /proc/filesystems && return 0
++  modprobe --quiet --dry-run $1 || skip_ "this test requires kernel sup=
port for $1"
++}
+diff --git a/tests/t1100-busy-label.sh b/tests/t1100-busy-label.sh
+index f1a13df..0f47b08 100755
+--- a/tests/t1100-busy-label.sh
++++ b/tests/t1100-busy-label.sh
+@@ -19,6 +19,9 @@
+ . "${srcdir=3D.}/init.sh"; path_prepend_ ../parted
+ require_root_
+ require_scsi_debug_module_
++require_fat_
++require_filesystem_ vfat
++
+ ss=3D$sector_size_
+=20
+ scsi_debug_setup_ sector_size=3D$ss dev_size_mb=3D90 > dev-name ||
+diff --git a/tests/t1101-busy-partition.sh b/tests/t1101-busy-partition.=
sh
+index e35e6f0..c813848 100755
+--- a/tests/t1101-busy-partition.sh
++++ b/tests/t1101-busy-partition.sh
+@@ -22,6 +22,8 @@ test "$VERBOSE" =3D yes && parted --version
+=20
+ require_root_
+ require_scsi_debug_module_
++require_fat_
++require_filesystem_ vfat
+=20
+ # create memory-backed device
+ scsi_debug_setup_ dev_size_mb=3D80 > dev-name ||
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-ex=
tended/parted/parted_3.4.bb
index 96d30372c3..6f6af445b9 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicit=
ly-.patch \
            file://run-ptest \
+           file://check-vfat.patch \
            "
=20
 SRC_URI[md5sum] =3D "357d19387c6e7bc4a8a90fe2d015fe80"
--=20
2.25.1

