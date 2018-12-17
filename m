Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9A2865C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:39:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBH3dCLb003587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:22 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:02 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:17 -0500
Message-ID: <b211c6cba6af43c21ff7215a23acfa4dd8ea3bdb.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/17] linux-yocto/tiny: restore qemuarm support
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:47 -0000
Content-Type: text/plain

qemuarm-tiny support was added to the 4.15 linux-yocto kernel, and
was incorrectly dropped from 4.18.

This restores the support for out of the box builds in 4.18+.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index bb31d3dd6688..968b94c2076e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -1,4 +1,6 @@
 KBRANCH ?= "v4.18/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
+
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
@@ -13,6 +15,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
+SRCREV_machine_qemuarm ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
 SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
 SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
 
@@ -21,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
 
 # Functionality flags
 KERNEL_FEATURES = ""
-- 
2.5.0


