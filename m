Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED4F6FC54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:15:47 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hzCFn6Tfbz3hjRX;
	Thu, 18 Sep 2014 11:15:41 +0200 (CEST)
X-Auth-Info: CutGXtSdSIfAgM43ByijPlWPxshzaBMGWKqKtKC+u10=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hzCFn449RzvhTZ;
	Thu, 18 Sep 2014 11:15:41 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Sep 2014 11:15:35 +0200
Message-Id: <1411031735-14721-2-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1411031735-14721-1-git-send-email-marex@denx.de>
References: <1411031735-14721-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, koen@dominion.thruhere.net
Subject: [PATCH 2/2] meta-toolchain-qt: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 18 Sep 2014 09:15:48 -0000

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
the python shipped with the SDK complete via nativesdk-packagegroup-python.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index 6b162bd..b8b9c78 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -1,4 +1,8 @@
-TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-${QTNAME}-toolchain-host packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK = " \
+	nativesdk-packagegroup-${QTNAME}-toolchain-host \
+	packagegroup-cross-canadian-${MACHINE} \
+	nativesdk-packagegroup-python \
+	"
 TOOLCHAIN_TARGET_TASK = "packagegroup-${QTNAME}-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"
 
-- 
2.0.0


