Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5307F969
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:18:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47pTB06hYJz1rfPn;
	Thu,  2 Jan 2020 14:18:16 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47pTB06PfTz1qqkx;
	Thu,  2 Jan 2020 14:18:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id WFegy1Oex4MI; Thu,  2 Jan 2020 14:18:15 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Thu,  2 Jan 2020 14:18:15 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 9FA2A45404DC;
	Thu,  2 Jan 2020 14:18:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id os-DX0y8kQoe; Thu,  2 Jan 2020 14:18:12 +0100 (CET)
Received: from localhost.localdomain (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 51FD14540379;
	Thu,  2 Jan 2020 14:18:12 +0100 (CET)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jan 2020 14:16:09 +0100
Message-Id: <20200102131609.31991-1-sbabic@denx.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 13:18:17 -0000

libubootenv is a replacement for u-boot-fw-utils. It is
hardware-independent and provides fw_printenv and fw_setenv tools that
are full compatible with the ones provided by U-Boot. A library is
provided to access the environment from an own application.
License is LGPL-2.1 and this allow to link the library to proprietary
code. The user of the tools should install the configuration file
"fw_env.config", as he is already used to with u-boot-fw-utils. The
configuration file is compatible with u-boot-fw-utils.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-bsp/u-boot/libubootenv.inc    | 27 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/libubootenv.inc
 create mode 100644 meta/recipes-bsp/u-boot/libubootenv_0.2.bb

diff --git a/meta/recipes-bsp/u-boot/libubootenv.inc b/meta/recipes-bsp/u-boot/libubootenv.inc
new file mode 100644
index 0000000000..87e15e5d79
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libubootenv.inc
@@ -0,0 +1,27 @@
+SUMMARY = "U-Boot libraries and tools to access environment"
+DEPENDS += "mtd-utils"
+
+DESCRIPTION = "This package contains tools and libraries to read \
+and modify U-Boot environment. \
+It provides a hardware-independent replacement for fw_printenv/setenv utilities \
+provided by U-Boot"
+
+HOMEPAGE = "https://github.com/sbabic/libubootenv"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+
+SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROVIDES += "u-boot-fw-utils"
+RPROVIDES_${PN} += "u-boot-fw-utils"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
new file mode 100644
index 0000000000..96a60cbc4b
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -0,0 +1,2 @@
+require libubootenv.inc
+SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
-- 
2.17.1


