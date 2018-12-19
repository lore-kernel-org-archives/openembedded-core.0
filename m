Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 466247BF28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597367"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:29 +0800
Message-Id: <20181219072929.5870-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 9/9] i2c-tools: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:39 -0000

* For changes, see:
https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/log/?qt=range&q=v4.0...v4.1

* Remove upstreamed patches

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rog-Module.mk-Add-missing-dependency.patch | 32 ------
 ...b-Module.mk-Add-missing-dependencies.patch | 37 -------
 ...s-Module.mk-Add-missing-dependencies.patch | 66 -------------
 .../i2c-tools/files/remove-i2c-dev.patch      | 98 -------------------
 .../{i2c-tools_4.0.bb => i2c-tools_4.1.bb}    |  8 +-
 5 files changed, 2 insertions(+), 239 deletions(-)
 delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
 delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
 delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
 delete mode 100644 meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.0.bb => i2c-tools_4.1.bb} (77%)

diff --git a/meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch b/meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
deleted file mode 100644
index 5b1a53844e..0000000000
--- a/meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 01674fefe3bd24fd93412fbb3eb4e85fe70c80aa Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 18 Dec 2017 16:01:39 +0200
-Subject: [PATCH] i2c-tools: eeprog/Module.mk: Add missing dependency
-
-Absence of this dependency caused parallel build to run into a race
-and break.
-
-Upstream-Status: Accepted
-https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=f87c97317012a3b96b67237925893b8ffd5f4f50
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- eeprog/Module.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/eeprog/Module.mk b/eeprog/Module.mk
-index 9d36869..d215855 100644
---- a/eeprog/Module.mk
-+++ b/eeprog/Module.mk
-@@ -20,7 +20,7 @@ EEPROG_TARGETS	:= eeprog
- # Programs
- #
- 
--$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o
-+$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(EEPROG_LDFLAGS)
- 
- #
--- 
-2.4.0
-
diff --git a/meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch b/meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
deleted file mode 100644
index 426b4330ea..0000000000
--- a/meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a6a59693066fd8da81f7107479df3e32a129247d Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Wed, 6 Dec 2017 09:55:04 +0100
-Subject: [PATCH] lib/Module.mk: Add missing dependencies
-
-The lib symlinks lacked a dependency to the actual library file, so
-parallel builds could run into a race and break.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- lib/Module.mk | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 432a051..fd2c8c4 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -42,11 +42,11 @@ endif
- $(LIB_DIR)/$(LIB_SHLIBNAME): $(LIB_DIR)/smbus.o
- 	$(CC) -shared $(LDFLAGS) -Wl,--version-script=$(LIB_DIR)/libi2c.map -Wl,-soname,$(LIB_SHSONAME) -o $@ $^ -lc
- 
--$(LIB_DIR)/$(LIB_SHSONAME):
-+$(LIB_DIR)/$(LIB_SHSONAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
- 	$(RM) $@
- 	$(LN) $(LIB_SHLIBNAME) $@
- 
--$(LIB_DIR)/$(LIB_SHBASENAME):
-+$(LIB_DIR)/$(LIB_SHBASENAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
- 	$(RM) $@
- 	$(LN) $(LIB_SHLIBNAME) $@
- 
--- 
-2.4.0
-
diff --git a/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch b/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
deleted file mode 100644
index 33cf2d42a8..0000000000
--- a/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 08b0d67ba7eceb862cb17f52eb1911e9579726ea Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Thu, 14 Dec 2017 08:52:26 +0100
-Subject: [PATCH] tools/Module.mk: Add missing dependencies
-
-Better build the library before building the tools which link against
-it, otherwise parallel builds could run into a race and break.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- lib/Module.mk   |  7 +++++++
- tools/Module.mk | 10 +++++-----
- 2 files changed, 12 insertions(+), 5 deletions(-)
-
-Index: i2c-tools-4.0/lib/Module.mk
-===================================================================
---- i2c-tools-4.0.orig/lib/Module.mk
-+++ i2c-tools-4.0/lib/Module.mk
-@@ -35,6 +35,13 @@ LIB_TARGETS	+= $(LIB_STLIBNAME)
- LIB_OBJECTS	+= smbus.ao
- endif
- 
-+# Library file to link against (static or dynamic)
-+ifeq ($(USE_STATIC_LIB),1)
-+LIB_DEPS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
-+else
-+LIB_DEPS	:= $(LIB_DIR)/$(LIB_SHBASENAME)
-+endif
-+
- #
- # Libraries
- #
-Index: i2c-tools-4.0/tools/Module.mk
-===================================================================
---- i2c-tools-4.0.orig/tools/Module.mk
-+++ i2c-tools-4.0/tools/Module.mk
-@@ -24,19 +24,19 @@ TOOLS_TARGETS	:= i2cdetect i2cdump i2cse
- # Programs
- #
- 
--$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o
-+$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
- #
diff --git a/meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch b/meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch
deleted file mode 100644
index 703688d08a..0000000000
--- a/meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 226bc03acca44cf4b300597308064c44676b6f4b Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Tue, 23 Jan 2018 14:24:16 +0100
-Subject: Delete duplicate i2c-dev.h
-
-The <linux/i2c-dev.h> header file is provided by the kernel, so drop
-our own copy of this file.
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Acked-by: Wolfram Sang <wsa@the-dreams.de>
----
- include/linux/i2c-dev.h | 72 -------------------------------------------------
- 1 file changed, 72 deletions(-)
- delete mode 100644 include/linux/i2c-dev.h
-
-diff --git a/include/linux/i2c-dev.h b/include/linux/i2c-dev.h
-deleted file mode 100644
-index 839d25a..0000000
---- a/include/linux/i2c-dev.h
-+++ /dev/null
-@@ -1,72 +0,0 @@
--/*
--    i2c-dev.h - i2c-bus driver, char device interface
--
--    Copyright (C) 1995-97 Simon G. Vogl
--    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
--
--    This program is free software; you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation; either version 2 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program; if not, write to the Free Software
--    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
--    MA 02110-1301 USA.
--*/
--
--#ifndef _LINUX_I2C_DEV_H
--#define _LINUX_I2C_DEV_H
--
--#include <linux/types.h>
--
--
--/* /dev/i2c-X ioctl commands.  The ioctl's parameter is always an
-- * unsigned long, except for:
-- *	- I2C_FUNCS, takes pointer to an unsigned long
-- *	- I2C_RDWR, takes pointer to struct i2c_rdwr_ioctl_data
-- *	- I2C_SMBUS, takes pointer to struct i2c_smbus_ioctl_data
-- */
--#define I2C_RETRIES	0x0701	/* number of times a device address should
--				   be polled when not acknowledging */
--#define I2C_TIMEOUT	0x0702	/* set timeout in units of 10 ms */
--
--/* NOTE: Slave address is 7 or 10 bits, but 10-bit addresses
-- * are NOT supported! (due to code brokenness)
-- */
--#define I2C_SLAVE	0x0703	/* Use this slave address */
--#define I2C_SLAVE_FORCE	0x0706	/* Use this slave address, even if it
--				   is already in use by a driver! */
--#define I2C_TENBIT	0x0704	/* 0 for 7 bit addrs, != 0 for 10 bit */
--
--#define I2C_FUNCS	0x0705	/* Get the adapter functionality mask */
--
--#define I2C_RDWR	0x0707	/* Combined R/W transfer (one STOP only) */
--
--#define I2C_PEC		0x0708	/* != 0 to use PEC with SMBus */
--#define I2C_SMBUS	0x0720	/* SMBus transfer */
--
--
--/* This is the structure as used in the I2C_SMBUS ioctl call */
--struct i2c_smbus_ioctl_data {
--	__u8 read_write;
--	__u8 command;
--	__u32 size;
--	union i2c_smbus_data *data;
--};
--
--/* This is the structure as used in the I2C_RDWR ioctl call */
--struct i2c_rdwr_ioctl_data {
--	struct i2c_msg *msgs;	/* pointers to i2c_msgs */
--	__u32 nmsgs;			/* number of i2c_msgs */
--};
--
--#define  I2C_RDRW_IOCTL_MAX_MSGS	42
--
--
--#endif /* _LINUX_I2C_DEV_H */
--- 
-cgit v1.1
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
similarity index 77%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
index fe3247d82e..2b4563d4f0 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
@@ -5,14 +5,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
-           file://0001-lib-Module.mk-Add-missing-dependencies.patch \
-           file://0001-tools-Module.mk-Add-missing-dependencies.patch \
-           file://0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch \
-           file://remove-i2c-dev.patch \
 "
 
-SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
-SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f071ca403"
+SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
+SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
 
 inherit update-alternatives
 
-- 
2.17.1


