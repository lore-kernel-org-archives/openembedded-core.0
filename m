Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB8078784
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:32:59 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g21so14559570wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 03:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Zxyo8lbsIrL7vVdaG2OY6iCQAN9+Yv+3uqxQzJjlecQ=;
	b=ss8hkaWrrSaQyRHlPyiOTXUR5ouaEzCjbRgRPjRkqRf3SQLQBf0RsrIpA1Wo2DqXmb
	EHObH7s7DKrastBiWxzPhr9wAhn2OLttBCt7vV1WWFmEFpdLsg0Ox6e3KOwfrZ89tBko
	Jlxb2hfGe337fr+vepZSnCrXjk2er620MSCypRbj7T1PUBsUQH18YIW1NbH+RdsTjGIY
	YP6UT0c4YTelT3mwUQWhukPNwAL2U0VemUdR6X9wjM/nHs6n2zPfRoMHS+X739XaK/dh
	GMbMOqZPp1Qw5w2sxG8DRQd+3mcBLbEdLcHmEeecyTG8BjxiLPNfQhWLXKmT1HTOcH08
	O43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Zxyo8lbsIrL7vVdaG2OY6iCQAN9+Yv+3uqxQzJjlecQ=;
	b=d1b7i9ODnE7RvO1s6Y/qTPxekPlYFv/2Ivf0xoIB1mGte+MvT/0xF+l6/mzW9+VQIH
	1eJHyHNmjk/0ICaSNbGqIMaSn4AzVjiebOCu0uu0F6G3rgQO+oWi4VBavhZ1Ll/3dIZn
	FaHtpjylrcGLpde1RwXPbai1d+3YQwWE7o4qhAGwCHdWUXtuKNCQE78+rd8RuH0o6IXB
	SX7HekgXE9MKzvx1L6Y5A5JlTZpiCgY4RSvTZbKj0xBMtfEYE9/1Ce9hXUbpsnG7rywB
	xPtKrn0ozvb96SF3+Eroi+kzOYzte8Z6P7Jlx9FiN6y2Er3KNSiXvYBSgU/GlFIaakeA
	8EIw==
X-Gm-Message-State: AKwxytcOiYPidZQR7WOwfW7Jintmp96uH3RRAISQzlgMLRYmV5BGBmeH
	rbU2lmGoNCqPWkVlE1VsDDqgKTbv
X-Google-Smtp-Source: AH8x22589ieFdTTPHSaXYI33Jb/XlsW5kpfof4Nr7BMTLPSFLEJjhWRXRIElHEucvRJFQaXomUm7Cw==
X-Received: by 10.223.171.24 with SMTP id q24mr11804310wrc.206.1517398379468; 
	Wed, 31 Jan 2018 03:32:59 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l9sm7800173wrl.1.2018.01.31.03.32.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 03:32:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 11:32:57 +0000
Message-Id: <20180131113257.5800-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] i2c-tools: rewrite packaging
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
X-List-Received-Date: Wed, 31 Jan 2018 11:33:00 -0000

For unknowable reasons this recipe inherits autotools-brokensep despite not in
fact using autotools.

Remove the inherit, add a do_install() that calls the makefile directly.

Extend EXTRA_OEMAKE to pass bindir/sbindir/incdir/libdir/mandir so the files are
all packaged in the correct location (and remove the now redundant sed of
Makefile).

Pass EXTRA=eeprog to EXTRA_OEMAKE to build eeprog, and remove the now redundant
edit of Makefile.

Backport a patch from upstream to remove linux/i2c-dev.h instead of installing
it with a different name (which nobody will be using).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../i2c-tools/files/remove-i2c-dev.patch           | 98 ++++++++++++++++++++++
 meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb   | 17 ++--
 2 files changed, 105 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch

diff --git a/meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch b/meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch
new file mode 100644
index 00000000000..703688d08a3
--- /dev/null
+++ b/meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch
@@ -0,0 +1,98 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 226bc03acca44cf4b300597308064c44676b6f4b Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Tue, 23 Jan 2018 14:24:16 +0100
+Subject: Delete duplicate i2c-dev.h
+
+The <linux/i2c-dev.h> header file is provided by the kernel, so drop
+our own copy of this file.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Acked-by: Wolfram Sang <wsa@the-dreams.de>
+---
+ include/linux/i2c-dev.h | 72 -------------------------------------------------
+ 1 file changed, 72 deletions(-)
+ delete mode 100644 include/linux/i2c-dev.h
+
+diff --git a/include/linux/i2c-dev.h b/include/linux/i2c-dev.h
+deleted file mode 100644
+index 839d25a..0000000
+--- a/include/linux/i2c-dev.h
++++ /dev/null
+@@ -1,72 +0,0 @@
+-/*
+-    i2c-dev.h - i2c-bus driver, char device interface
+-
+-    Copyright (C) 1995-97 Simon G. Vogl
+-    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
+-
+-    This program is free software; you can redistribute it and/or modify
+-    it under the terms of the GNU General Public License as published by
+-    the Free Software Foundation; either version 2 of the License, or
+-    (at your option) any later version.
+-
+-    This program is distributed in the hope that it will be useful,
+-    but WITHOUT ANY WARRANTY; without even the implied warranty of
+-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-    GNU General Public License for more details.
+-
+-    You should have received a copy of the GNU General Public License
+-    along with this program; if not, write to the Free Software
+-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+-    MA 02110-1301 USA.
+-*/
+-
+-#ifndef _LINUX_I2C_DEV_H
+-#define _LINUX_I2C_DEV_H
+-
+-#include <linux/types.h>
+-
+-
+-/* /dev/i2c-X ioctl commands.  The ioctl's parameter is always an
+- * unsigned long, except for:
+- *	- I2C_FUNCS, takes pointer to an unsigned long
+- *	- I2C_RDWR, takes pointer to struct i2c_rdwr_ioctl_data
+- *	- I2C_SMBUS, takes pointer to struct i2c_smbus_ioctl_data
+- */
+-#define I2C_RETRIES	0x0701	/* number of times a device address should
+-				   be polled when not acknowledging */
+-#define I2C_TIMEOUT	0x0702	/* set timeout in units of 10 ms */
+-
+-/* NOTE: Slave address is 7 or 10 bits, but 10-bit addresses
+- * are NOT supported! (due to code brokenness)
+- */
+-#define I2C_SLAVE	0x0703	/* Use this slave address */
+-#define I2C_SLAVE_FORCE	0x0706	/* Use this slave address, even if it
+-				   is already in use by a driver! */
+-#define I2C_TENBIT	0x0704	/* 0 for 7 bit addrs, != 0 for 10 bit */
+-
+-#define I2C_FUNCS	0x0705	/* Get the adapter functionality mask */
+-
+-#define I2C_RDWR	0x0707	/* Combined R/W transfer (one STOP only) */
+-
+-#define I2C_PEC		0x0708	/* != 0 to use PEC with SMBus */
+-#define I2C_SMBUS	0x0720	/* SMBus transfer */
+-
+-
+-/* This is the structure as used in the I2C_SMBUS ioctl call */
+-struct i2c_smbus_ioctl_data {
+-	__u8 read_write;
+-	__u8 command;
+-	__u32 size;
+-	union i2c_smbus_data *data;
+-};
+-
+-/* This is the structure as used in the I2C_RDWR ioctl call */
+-struct i2c_rdwr_ioctl_data {
+-	struct i2c_msg *msgs;	/* pointers to i2c_msgs */
+-	__u32 nmsgs;			/* number of i2c_msgs */
+-};
+-
+-#define  I2C_RDRW_IOCTL_MAX_MSGS	42
+-
+-
+-#endif /* _LINUX_I2C_DEV_H */
+-- 
+cgit v1.1
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
index e936fd759b9..01ac47f611a 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
@@ -8,22 +8,19 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
            file://0001-lib-Module.mk-Add-missing-dependencies.patch \
            file://0001-tools-Module.mk-Add-missing-dependencies.patch \
            file://0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch \
+           file://remove-i2c-dev.patch \
 "
 
 SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
 SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f071ca403"
 
-inherit autotools-brokensep
+EXTRA_OEMAKE = "bindir=${bindir} sbindir=${sbindir} \
+                incdir=${includedir} libdir=${libdir} \
+                mandir=${mandir} \
+                EXTRA=eeprog"
 
-do_compile_prepend() {
-    sed -i 's#/usr/local#/usr#' ${S}/Makefile
-    echo "include eeprog/Module.mk" >> ${S}/Makefile
-}
-
-do_install_append() {
-    install -d ${D}${includedir}/linux
-    install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
-    rm -f ${D}${includedir}/linux/i2c-dev.h
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
 }
 
 PACKAGES =+ "${PN}-misc"
-- 
2.11.0


