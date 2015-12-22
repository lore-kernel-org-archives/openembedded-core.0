Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E578373286
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:44:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM8i1jL008109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Dec 2015 00:44:01 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Dec 2015 00:44:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>, 
	<ross.burton@intel.com>, <jackie.huang@windriver.com>,
	<mark.hatle@windriver.com>, <liezhi.yang@windriver.com>
Date: Tue, 22 Dec 2015 16:43:21 +0800
Message-ID: <1450773814-31322-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450772654.git.hongxu.jia@windriver.com>
References: <cover.1450772654.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][SOLUTION 2] add variable NETWORK_MANAGER to fix confliction between connman and networkmanager
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
X-List-Received-Date: Tue, 22 Dec 2015 08:44:01 -0000
Content-Type: text/plain

In meta-oe, the networkmanager conflicts with connman. In order to fix
it, we introduce variable NETWORK_MANAGER which was original used in
meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb.

So we could decide which network manager (connman or networkmanager...) to
use by override NETWORK_MANAGER.

The connman-plugin-ethernet has been added to connman's
RPROVIDES, so remove it and keep connman is ok.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf                                      | 4 ++++
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 +--
 meta/recipes-extended/images/core-image-kernel-dev.bb       | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2b81be1..04fa3ff 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -789,6 +789,10 @@ SHELL[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
+# Added to related recipe's RDEPDNS to decide which network manager
+# (connman or networkmanager...) to use
+NETWORK_MANAGER ??= "connman"
+
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ceaa242..f5291e7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -29,8 +29,7 @@ RDEPENDS_packagegroup-self-hosted = "\
     "
 
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
-    connman \
-    connman-plugin-ethernet \
+    ${NETWORK_MANAGER} \
     dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index 6b636ed..605df46 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -4,7 +4,7 @@ sensitive to kernel updates and version changes"
 # Could also be core-image-basic, but we'll keep this small for now
 require recipes-core/images/core-image-minimal.bb
 
-KERNEL_DEV_UTILS ?= "dropbear connman"
+KERNEL_DEV_UTILS ?= "dropbear ${NETWORK_MANAGER}"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
 KERNEL_DEV_MODULE ?= "kernel-modules"
 
-- 
1.9.1


