Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 512AF7327E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:44:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM8i4gV023262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Dec 2015 00:44:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Dec 2015 00:44:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>, 
	<ross.burton@intel.com>, <jackie.huang@windriver.com>,
	<mark.hatle@windriver.com>, <liezhi.yang@windriver.com>
Date: Tue, 22 Dec 2015 16:43:22 +0800
Message-ID: <2fbaa15f862743a9c207842edf3e5f34a6686641.1450772654.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450772654.git.hongxu.jia@windriver.com>
References: <cover.1450772654.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][SOLUTION 1] add virtual/netmanager to fix confliction between connman and networkmanager
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
X-List-Received-Date: Tue, 22 Dec 2015 08:44:04 -0000
Content-Type: text/plain

In meta-oe, the networkmanager conflicts with connman.In order to fix
it, we introduce virtual/netmanager and decide which network manager
(connman or networkmanager...) to use by override PREFERRED_PROVIDER_virtual/netmanager.

The connman-plugin-ethernet has been added to connman's
RPROVIDES, so remove it and keep connman is ok.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf                                        | 2 ++
 meta/recipes-connectivity/connman/connman.inc                 | 1 +
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb   | 3 +--
 meta/recipes-extended/images/core-image-kernel-dev.bb         | 2 +-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 371af31..880baf2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -783,6 +783,8 @@ SHELL[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
+PREFERRED_PROVIDER_virtual/netmanager ??= "connman"
+
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index a4b814a..0d40cb9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -98,6 +98,7 @@ do_install_append() {
 
 # These used to be plugins, but now they are core
 RPROVIDES_${PN} = "\
+	virtual/netmanager \
 	connman-plugin-loopback \
 	connman-plugin-ethernet \
 	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index d38be26..666896a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -29,8 +29,7 @@ RDEPENDS_packagegroup-self-hosted = "\
     "
 
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
-    connman \
-    connman-plugin-ethernet \
+    virtual/netmanager \
     dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index 26b88c9..2ea9847 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -4,7 +4,7 @@ sensitive to kernel updates and version changes"
 # Could also be core-image-basic, but we'll keep this small for now
 require recipes-core/images/core-image-minimal.bb
 
-KERNEL_DEV_UTILS ?= "dropbear connman"
+KERNEL_DEV_UTILS ?= "dropbear virtual/netmanager"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
 KERNEL_DEV_MODULE ?= "kernel-modules"
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 6679db8..8e9d5a7 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -20,7 +20,7 @@ RDEPENDS_${PN} = "\
     ${PN}-games \
     "
 
-NETWORK_MANAGER ?= "connman-gnome"
+NETWORK_MANAGER ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/netmanager","connman","connman-gnome","virtual/netmanager",d)}'
 NETWORK_MANAGER_libc-uclibc = ""
 
 SUMMARY_${PN}-base = "Sato desktop - base packages"
-- 
1.9.1


