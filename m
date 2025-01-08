Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D82EE7719D
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.14224.1736325763614243212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLWfwUVY;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa66ead88b3so725698466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325762; x=1736930562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPZuq/wXri8Ul+nHWxA/jFNHhDAIksSnIWO5UgMBM+M=;
        b=YLWfwUVYrcG0bkTnOTxQk+TI0NK16Y/oN1PsWGp9FTIgRxSoivpj5m+K0QI0W3SX0w
         o5Bwc8piguFwjK6zRfxLyxzox12PiC64qSNqmsCkhmwzY9+PfIHrLqf4Bh9GxdXxhpdd
         h3thjMu34HSkTvioyke4YTmVFtZjeEp36rrZaQB0+6JmhopYD/jqzxDDV589RzB0cMZx
         3HqSeCslmaqtrvNFI5Dm5+5TDYoHUao8/D9rFajgqPp1vpQM5p76ESy0ZufaYExubAwV
         YOWi7UxaDxKJda6DD3OOGeh037Lh299TgfcWIa9QonUp0q+uR65eIlVnbHcaxrfLd/Ja
         92TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325762; x=1736930562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPZuq/wXri8Ul+nHWxA/jFNHhDAIksSnIWO5UgMBM+M=;
        b=B3RrwdDZ8BO3dC2jDzfnqbA3d8f6aQ4JoMc3bg7TfL7qH9KCcUkEfZ8kBCCNIdQPuX
         8cvOHbowF6BD5hj0Sr6dxkt2JKg3qUcGeKxT2MUxrLrIIYdpGM0EIHopLlWE6+rfXZ6g
         dqPYEqWGX8pNGlE8QVrAbW+t836+hjtT05drAEW0G0oCobfT+IrrMKInfc6c0RfRTUCW
         xWxxL4N5CrdCTHBqH+gH/FLrfLlkerk4oG2XTD/6cKawDsCe6qTlYyB2H06XCZPMeH32
         IUVtflvK2bAVjHsu2xSpsNlM59riHPZIUECXVulN2hHCpCxvaY9RP8Kzn937TvwqL/L+
         K9JQ==
X-Gm-Message-State: AOJu0YwjXBILo4QWSLJB/85ER8oCAlLr6QyKwVhPrFXd+qmcNhilbZYT
	PLECCzjOr/ikoLTLEXvmF6xYEC2NPqsYIXw7AyzQCPtjNVB9L9xpzZrsOg==
X-Gm-Gg: ASbGnctz4c3xd5dJ+Qn8EgJ/dJ0go22VYYzpzi0LVEXpMw3NU7nOH7JMilKmTGTogmO
	cc0acEmLsJWyyBTH9gX7/nfNPh0rITABm8AccwzcS4/ywlG9i2SjvwE3vfbaVFyFeowSkzbLdPT
	aTOWuHXhB/irmPApWdhDGrP2HL/JYisiooI+I4F3fY7RBSxBX2NkVuIe6vDm0i8Au30MU7lclEe
	4iqCT+EaVjxIZOb1SGITCdGKPJEbTf/zXLwT9FI8Qn7mf8OVLq9zg+hWKJ1c+u5brxnFnTZ6arL
	Af2nm/U3+LU13h6VxQ==
X-Google-Smtp-Source: AGHT+IHeULDRYXhv49loLR28yGin0KgPrcgZoNo2YL0UGhMXXGiKrExDRR3folxO5HI+nrTxvdAeJw==
X-Received: by 2002:a17:907:3e21:b0:aa6:7107:db00 with SMTP id a640c23a62f3a-ab2ab70940amr124815566b.50.1736325761694;
        Wed, 08 Jan 2025 00:42:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/20] blktool: remove the recipe
Date: Wed,  8 Jan 2025 09:42:23 +0100
Message-Id: <20250108084226.117178-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209539

From: Alexander Kanavin <alex@linutronix.de>

It was created in 2004 as an alternative to hdparm and never updated since
(while hdparm remains in active development).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../packagegroup-core-tools-testapps.bb       |  1 -
 .../blktool/0001-fix-typos-in-manpage.patch   | 40 ----------
 .../blktool/0002-fix-string-error.patch       | 31 --------
 ...nt-for-BLKROSET-it-must-be-const-int.patch | 78 -------------------
 .../blktool/0004-fix-ftbfs-glibc-2.28.patch   | 19 -----
 .../recipes-extended/blktool/blktool_4-7.1.bb | 29 -------
 8 files changed, 200 deletions(-)
 delete mode 100644 meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
 delete mode 100644 meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
 delete mode 100644 meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
 delete mode 100644 meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
 delete mode 100644 meta/recipes-extended/blktool/blktool_4-7.1.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 6d11c98dfe5..5000b08eb83 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -17,7 +17,6 @@ DISTRO_PN_ALIAS:pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS:pn-babeltrace = "OSPDT"
 DISTRO_PN_ALIAS:pn-babeltrace2 = "OSPDT"
 DISTRO_PN_ALIAS:pn-bjam = "OpenSuSE=boost-jam Debian=bjam"
-DISTRO_PN_ALIAS:pn-blktool = "Debian=blktool Mandriva=blktool"
 DISTRO_PN_ALIAS:pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
 DISTRO_PN_ALIAS:pn-bootchart2 = "Fedora=bootchart2 Opensuse=bootchart"
 DISTRO_PN_ALIAS:pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5d1aa17183d..6e3cb54a1fb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -69,7 +69,6 @@ RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem R
 RECIPE_MAINTAINER:pn-binutils-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-bluez5 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-bmaptool = "Trevor Woerner <twoerner@gmail.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 4fadcd49ae9..d7ea8e937f4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -46,7 +46,6 @@ X11TOOLS = "\
     "
 
 RDEPENDS:${PN} = "\
-    blktool \
     ${KEXECTOOLS} \
     alsa-utils-amixer \
     alsa-utils-aplay \
diff --git a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
deleted file mode 100644
index 25a2fabe156..00000000000
--- a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9cb1667f9d3a9bcfc3b83466cd8d3b79f0554ff0 Mon Sep 17 00:00:00 2001
-From: Azat Khuzhin <a3at.mail@gmail.com>
-Date: Wed, 8 Jul 2015 01:37:09 +0300
-Subject: [PATCH 1/3] fix typos in manpage
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- blktool.8 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/blktool.8 b/blktool.8
-index a1f5c96..45b7724 100644
---- a/blktool.8
-+++ b/blktool.8
-@@ -191,7 +191,7 @@ Query or set device bus state (0 off, 1 on, 2 tristate)
- Query the detected (or overridden, via -t) device class.
- Typically this will result in 'ATA' or 'SCSI' for most devices.
- Detection is based on device major; thus your SATA device may appear as
--'SCSI'.
-+\&'SCSI'.
- 
- .TP
- .B cd-speed
-@@ -237,7 +237,7 @@ Omitting the on/off argument will print the current state.
- 
- .TP
- .B media
--Lock in (or unlock) a removeable device.
-+Lock in (or unlock) a removable device.
- 
- .TP
- .B multiple-count
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
deleted file mode 100644
index 401e41e3ed1..00000000000
--- a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ddb1071da2c78d8155aab62e9f0d46f69500200f Mon Sep 17 00:00:00 2001
-From: Azat Khuzhin <a3at.mail@gmail.com>
-Date: Wed, 8 Jul 2015 01:42:24 +0300
-Subject: [PATCH 2/3] fix string error
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.c b/util.c
-index 1f3a9ca..2ccf56a 100644
---- a/util.c
-+++ b/util.c
-@@ -28,7 +28,7 @@ void pdie(const char *msg, int perr)
- 	if (perr)
- 		perror(msg);
- 	else
--		fprintf(stderr, msg);
-+		fprintf(stderr, "%s", msg);
- 	if (blkdev >= 0)
- 		close(blkdev);
- 	exit(1);
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
deleted file mode 100644
index d1f1e797fe1..00000000000
--- a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 68faa63aaad81f4a289e4a03173ab4cf798deb53 Mon Sep 17 00:00:00 2001
-From: Azat Khuzhin <a3at.mail@gmail.com>
-Date: Sat, 1 Nov 2014 22:24:32 +0300
-Subject: [PATCH 3/3] Fix 3-d argument for BLKROSET it must be 'const int *'
-
-Most of *SET ioctls have int type for 3-d argument, except BLKROSET.
-So add bc_arg_type enum, build it into bool_comand and install arg_type
-to bc_arg_int_ptr for BLKROSET only.
-
-Debian-bug-id: 641164
-Link: https://bugs.debian.org/641164
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- blktool.c | 11 +++++++++--
- blktool.h |  7 +++++++
- 2 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/blktool.c b/blktool.c
-index fbefecd..221a195 100644
---- a/blktool.c
-+++ b/blktool.c
-@@ -85,7 +85,7 @@ static struct bool_command bool_cmd_tbl[] = {
- 	{ { DEF_BOOL("pio-data"), dc_ata, DEF_HDIO(32BIT) },
- 	  "16-bit", "32-bit" },
- 	{ { DEF_BOOL("readonly"), dc_any, IOCNAME(BLKROGET), IOCNAME(BLKROSET) },
--	  DEF_BOOLSTR },
-+	  DEF_BOOLSTR, bc_arg_int_ptr },
- 	{ { DEF_BOOL("unmask-irq"), dc_ata, DEF_HDIO(UNMASKINTR) },
- 	  DEF_BOOLSTR },
- 	{ { "wcache", ct_bool, handle_wcache, dc_any,
-@@ -171,7 +171,14 @@ static void handle_bool(int argc, char **argv, struct command *cmd)
- 
- 	} else if ((argc == 4) && (cmd->write_ioctl_name != NULL)) {
- 		do_32 = parse_bool(argc, argv, bcm);
--		if (ioctl(blkdev, cmd->write_ioctl, do_32))
-+		
-+		int ret;
-+		if (bcm->arg_type == bc_arg_int_ptr) {
-+			ret = ioctl(blkdev, cmd->write_ioctl, &do_32);
-+		} else {
-+			ret = ioctl(blkdev, cmd->write_ioctl, do_32);
-+		}
-+		if (ret)
- 			pdie(cmd->write_ioctl_name, 1);
- 	}
- 	else {
-diff --git a/blktool.h b/blktool.h
-index fce4387..85add83 100644
---- a/blktool.h
-+++ b/blktool.h
-@@ -85,11 +85,18 @@ struct command {
- 	const char		*write_ioctl_name;
- };
- 
-+enum bc_arg_type {
-+	bc_arg_int,
-+	bc_arg_int_ptr,
-+};
-+
- struct bool_command {
- 	struct command		cmd;
- 
- 	const char		*str_false;
- 	const char		*str_true;
-+
-+	enum bc_arg_type arg_type;
- };
- 
- struct class_operations {
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch b/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
deleted file mode 100644
index 65bca651000..00000000000
--- a/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Description: Fix FTBFS with glibc 2.28
-Author: Adrian Bunk <bunk@debian.org>
-Bug-Debian: https://bugs.debian.org/917055
-
-This patch is taken from
-http://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.1.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---- blktool-4.orig/blktool.c
-+++ blktool-4/blktool.c
-@@ -18,6 +18,7 @@
- #include <unistd.h>
- #include <sys/stat.h>
- #include <sys/ioctl.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <errno.h>
- #include <getopt.h>
diff --git a/meta/recipes-extended/blktool/blktool_4-7.1.bb b/meta/recipes-extended/blktool/blktool_4-7.1.bb
deleted file mode 100644
index bb44befb564..00000000000
--- a/meta/recipes-extended/blktool/blktool_4-7.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Tune low-level block device parameters"
-DESCRIPTION = "blktool is used for querying and/or changing settings \
-of a block device. It is like hdparm but a more general tool, as it \
-works on SCSI, IDE and SATA devices."
-HOMEPAGE = "http://packages.debian.org/unstable/admin/blktool"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://blktool.c;beginline=7;endline=8;md5=a5e798ea98fd50972088968a15e5f373"
-
-DEPENDS = "glib-2.0"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/${BPN}/${BPN}_4.orig.tar.gz;name=tarball \
-           file://0001-fix-typos-in-manpage.patch \
-           file://0002-fix-string-error.patch \
-           file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
-           file://0004-fix-ftbfs-glibc-2.28.patch \
-          "
-
-SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
-SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
-
-# for this package we're mostly interested in tracking debian patches,
-# and not in the upstream version where all development has effectively stopped
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/blktool/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
-
-S = "${WORKDIR}/${BPN}-4.orig"
-
-inherit autotools pkgconfig
-- 
2.39.5


