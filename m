Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 681386FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 18:48:24 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b39so20471958qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 11:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=BtFfaEo3kLmJ3HNlVJrgkoIgnXk/9ChnliWYOe9wR0Y=;
	b=nyUrtf2W0PliT395rL9Obu9Rs5nMZgPqev5GX/BjGq6dJ8XrOnvUCMPR3zqV4dqGEs
	XHGiOx7ROpVOpduv3hZ94KwJsiuT+uPydpM1JsCIxiLSU6yGtdcg5Y9W5/Pm1dYUQAzR
	1MNXK0DYV4Wi9TVfnBit49zhe9artOPfZUEAZh0irwqhnoMWj7YoVKpEAJOcZ3aTpFIl
	nGAuqlcvR1SUBAjSsI17WsLWcxID0C+76pD2Klz4/u7Atl0+IN+pMBYun1/K4GqCH/ug
	HX60PpvRA+sEgjKUFerU8/FGz9vUJQeYrsmdkj70fwkNyxWn2mesgTuWElAdMmHU6DY0
	3IbQ==
X-Gm-Message-State: ALQs6tDaJBC51T04AZXNsoaNIbwDA+lCrutGQXh0lQQeZH+HzQ+Cz5Cz
	ivQZQVjwE8SIXYfs+Xu2Dx0JWg==
X-Google-Smtp-Source: AB8JxZqujUIa7b+yqFdcmo+HBcW9mVhVSj31DKDkR2MeRrtEeL3+B0TSDptXPUUc14DwZmsn4K+bJQ==
X-Received: by 10.55.160.142 with SMTP id j136mr29019628qke.225.1524595704829; 
	Tue, 24 Apr 2018 11:48:24 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	s48-v6sm13789220qtb.83.2018.04.24.11.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 24 Apr 2018 11:48:24 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 24 Apr 2018 15:48:17 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2018 15:48:15 -0300
Message-Id: <20180424184816.6763-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] parted: add ontrack DM6 aux3 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2018 18:48:24 -0000

Add ontrack DM6 aux3 partition support to enable creating
partitions required to boot i.MX MXS based platforms.

This patch has been sent long time ago by Alexandre Belloni to
meta-freescale however this must be incuded on OE-Core as this is a
common component across different BSP.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../parted/files/Add_ontrackdm6aux3.patch     | 109 ++++++++++++++++++
 meta/recipes-extended/parted/parted_3.2.bb    |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/Add_ontrackdm6aux3.patch

diff --git a/meta/recipes-extended/parted/files/Add_ontrackdm6aux3.patch b/meta/recipes-extended/parted/files/Add_ontrackdm6aux3.patch
new file mode 100644
index 00000000000..0fc36cdd389
--- /dev/null
+++ b/meta/recipes-extended/parted/files/Add_ontrackdm6aux3.patch
@@ -0,0 +1,109 @@
+diff -Nburp parted-3.2.orig/libparted/fs/Makefile.am parted-3.2/libparted/fs/Makefile.am
+--- parted-3.2.orig/libparted/fs/Makefile.am	2014-07-28 04:29:16.000000000 +0200
++++ parted-3.2/libparted/fs/Makefile.am	2015-03-25 19:51:38.912544030 +0100
+@@ -42,6 +42,7 @@ libfs_la_SOURCES =		\
+   linux_swap/linux_swap.c	\
+   nilfs2/nilfs2.c		\
+   ntfs/ntfs.c			\
++  ontrack/ontrack.c		\
+   reiserfs/reiserfs.c		\
+   reiserfs/reiserfs.h		\
+   ufs/ufs.c			\
+diff -Nburp parted-3.2.orig/libparted/fs/ontrack/ontrack.c parted-3.2/libparted/fs/ontrack/ontrack.c
+--- parted-3.2.orig/libparted/fs/ontrack/ontrack.c	1970-01-01 01:00:00.000000000 +0100
++++ parted-3.2/libparted/fs/ontrack/ontrack.c	2015-03-25 19:55:01.342048099 +0100
+@@ -0,0 +1,39 @@
++#include <config.h>
++
++#include <parted/parted.h>
++#include <parted/crc32.h>
++#include <parted/endian.h>
++
++PedGeometry*
++ontrackdm6aux3_probe (PedGeometry* geom)
++{
++	PedSector length = geom->length;
++
++	/* ignore if sector size is not 512bytes for now  */
++	if (geom->dev->sector_size != PED_SECTOR_SIZE_DEFAULT)
++		return NULL;
++
++	return ped_geometry_new(geom->dev, geom->start, length);
++}
++
++static PedFileSystemOps ontrackdm6aux3_ops = {
++	probe:			ontrackdm6aux3_probe,
++};
++
++static PedFileSystemType ontrackdm6aux3_type = {
++	next:   NULL,
++	ops:    &ontrackdm6aux3_ops,
++	name:   "ontrackdm6aux3",
++};
++
++void
++ped_file_system_ontrack_init ()
++{
++	ped_file_system_type_register (&ontrackdm6aux3_type);
++}
++
++void
++ped_file_system_ontrack_done ()
++{
++	ped_file_system_type_unregister (&ontrackdm6aux3_type);
++}
+diff -Nburp parted-3.2.orig/libparted/labels/dos.c parted-3.2/libparted/labels/dos.c
+--- parted-3.2.orig/libparted/labels/dos.c	2014-06-15 20:17:43.000000000 +0200
++++ parted-3.2/libparted/labels/dos.c	2015-03-25 19:51:38.916543965 +0100
+@@ -83,6 +83,7 @@ static const char MBR_BOOT_CODE[] = {
+ #define PARTITION_COMPAQ_DIAG	0x12
+ #define PARTITION_MSFT_RECOVERY	0x27
+ #define PARTITION_LDM		0x42
++#define PARTITION_ONTRACK_DM6_AUX3	0x53
+ #define PARTITION_LINUX_SWAP	0x82
+ #define PARTITION_LINUX		0x83
+ #define PARTITION_IRST		0x84
+@@ -1500,6 +1501,8 @@ msdos_partition_set_system (PedPartition
+ 		dos_data->system = PARTITION_HFS;
+ 	else if (!strcmp (fs_type->name, "sun-ufs"))
+ 		dos_data->system = PARTITION_SUN_UFS;
++	else if (!strcmp (fs_type->name, "ontrackdm6aux3"))
++		dos_data->system = PARTITION_ONTRACK_DM6_AUX3;
+ 	else if (is_linux_swap (fs_type->name))
+ 		dos_data->system = PARTITION_LINUX_SWAP;
+ 	else
+diff -Nburp parted-3.2.orig/libparted/libparted.c parted-3.2/libparted/libparted.c
+--- parted-3.2.orig/libparted/libparted.c	2014-06-15 20:17:43.000000000 +0200
++++ parted-3.2/libparted/libparted.c	2015-03-25 19:51:38.912544030 +0100
+@@ -110,6 +110,7 @@ extern void ped_file_system_fat_init (vo
+ extern void ped_file_system_ext2_init (void);
+ extern void ped_file_system_nilfs2_init (void);
+ extern void ped_file_system_btrfs_init (void);
++extern void ped_file_system_ontrack_init (void);
+ 
+ static void
+ init_file_system_types ()
+@@ -126,6 +127,7 @@ init_file_system_types ()
+ 	ped_file_system_ext2_init ();
+ 	ped_file_system_nilfs2_init ();
+ 	ped_file_system_btrfs_init ();
++	ped_file_system_ontrack_init ();
+ }
+ 
+ extern void ped_disk_aix_done ();
+@@ -177,6 +179,7 @@ _init()
+ #endif
+ }
+ 
++extern void ped_file_system_ontrack_done (void);
+ extern void ped_file_system_nilfs2_done (void);
+ extern void ped_file_system_ext2_done (void);
+ extern void ped_file_system_fat_done (void);
+@@ -193,6 +196,7 @@ extern void ped_file_system_btrfs_done (
+ static void
+ done_file_system_types ()
+ {
++	ped_file_system_ontrack_done ();
+ 	ped_file_system_nilfs2_done ();
+ 	ped_file_system_ext2_done ();
+ 	ped_file_system_fat_done ();
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index ab30108bf23..2415d031bd6 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://syscalls.patch \
            file://fix-doc-mandir.patch \
            file://fix-compile-failure-while-dis.patch \
+	   file://Add_ontrackdm6aux3.patch \
            file://0001-Include-fcntl.h-in-platform_defs.h.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
-- 
2.17.0


