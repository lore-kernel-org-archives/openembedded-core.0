Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFA665E28
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 19:10:36 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTfRb30m2z3hhqp;
	Thu,  7 Aug 2014 21:10:35 +0200 (CEST)
X-Auth-Info: Dzfldv0nSmegTUr94amMWfP1Hx8nUEEK5h/RUHhBjME=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTfRb2CgGz7S6Rv; 
	Thu,  7 Aug 2014 21:10:35 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 21:10:29 +0200
Message-Id: <1407438629-13369-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 07 Aug 2014 19:10:44 -0000

The Qt SDK toolchain pulls in python via packagegroup-cross-canadian-${MACHINE}
and ships it. But the python is missing many modules and is rather incomplete.

The environment-setup-* script configures the PATH variable to point into
it's own sysroot first, it means the python from the SDK is used as well
when the environment is configured. It actually does make sense to use the
python from the SDK, since the SDK should provide the tools needed to build
additional software.

The problem is, the python in the SDK image is stripped to a bare minimum
of modules, which prevents some software from being built with the SDK as
is. Add the same python modules as the buildtools-tarball.bb adds to make
the python shipped with the SDK complete.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc | 32 +++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

NOTE: This lets me build U-Boot git HEAD , which now has Kconfig in it
      and that depends on the "subprocess" module. But instead of adding
      just one module, I want to fix this properly and future-proof this.

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index 6b162bd..99d5e64 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -1,4 +1,34 @@
-TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-${QTNAME}-toolchain-host packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK = " \
+	nativesdk-packagegroup-${QTNAME}-toolchain-host \
+	packagegroup-cross-canadian-${MACHINE} \
+	nativesdk-python-core \
+	nativesdk-python-textutils \
+	nativesdk-python-sqlite3 \
+	nativesdk-python-pickle \
+	nativesdk-python-logging \
+	nativesdk-python-elementtree \
+	nativesdk-python-curses \
+	nativesdk-python-compile \
+	nativesdk-python-compiler \
+	nativesdk-python-fcntl \
+	nativesdk-python-shell \
+	nativesdk-python-misc \
+	nativesdk-python-multiprocessing \
+	nativesdk-python-subprocess \
+	nativesdk-python-xmlrpc \
+	nativesdk-python-netclient \
+	nativesdk-python-netserver \
+	nativesdk-python-distutils \
+	nativesdk-python-unixadmin \
+	nativesdk-python-compression \
+	nativesdk-python-json \
+	nativesdk-python-unittest \
+	nativesdk-python-mmap \
+	nativesdk-python-difflib \
+	nativesdk-python-pprint \
+	nativesdk-python-git \
+	nativesdk-python-pkgutil \
+	"
 TOOLCHAIN_TARGET_TASK = "packagegroup-${QTNAME}-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"
 
-- 
2.0.1


