Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D288700FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:27:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N8RH7V017697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 01:27:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 23 Jun 2016 01:27:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 16:26:43 +0800
Message-ID: <1466670403-24140-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libcap: fix the libcap-native building failure on CentOS 6.7
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
X-List-Received-Date: Thu, 23 Jun 2016 08:27:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...XATTR_NAME_CAPS-is-defined-when-it-is-use.patch | 32 ++++++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.25.bb         |  5 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch

diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
new file mode 100644
index 0000000..a43017c
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
@@ -0,0 +1,32 @@
+ensure the XATTR_NAME_CAPS is defined when it is used
+
+Upstream-status: Pending
+
+VFS_CAP_U32 can not ensure that XATTR_NAME_CAPS is defined, and failed to build
+libcap-native in old release, like CentOS release 6.7 (Final), with the blow
+error:
+     cap_file.c: In function ‘cap_get_fd’:
+     cap_file.c:199: error: ‘XATTR_NAME_CAPS’ undeclared (first use in this function)
+     cap_file.c:199: error: (Each undeclared identifier is reported only once
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ libcap/cap_file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/cap_file.c b/libcap/cap_file.c
+index 40756ea..e27ca80 100644
+--- a/libcap/cap_file.c
++++ b/libcap/cap_file.c
+@@ -25,7 +25,7 @@ extern int fremovexattr(int, const char *);
+ 
+ #include "libcap.h"
+ 
+-#ifdef VFS_CAP_U32
++#if defined (VFS_CAP_U32) && defined (XATTR_NAME_CAPS)
+ 
+ #if VFS_CAP_U32 != __CAP_BLKS
+ # error VFS representation of capabilities is not the same size as kernel
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 865ebb8..8f3f11e 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "hostperl-runtime-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
-
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
+           file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
+"
 SRC_URI[md5sum] = "6666b839e5d46c2ad33fc8aa2ceb5f77"
 SRC_URI[sha256sum] = "693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162"
 
-- 
2.8.1


