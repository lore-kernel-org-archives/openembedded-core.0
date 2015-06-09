Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3539C758B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:20:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59JKBGV018579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jun 2015 12:20:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 9 Jun 2015 12:20:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 9 Jun 2015 15:20:10 -0400
Message-ID: <1433877610-23410-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] xorg: fix VESA int10 error
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
X-List-Received-Date: Tue, 09 Jun 2015 19:20:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When falling back to the VESA server, X fails to start due to an error
reading the int10 vec.

We cherry-pick the following commit to fix the error:

   commit 0a78b599b34cc8b5fe6fe82f90e90234e8ab7a56
   Author: Jürg Billeter <j@bitron.ch>
   Date:   Sat Feb 7 18:13:21 2015 +0100

       int10: Fix error check for pci_device_map_legacy

       pci_device_map_legacy returns 0 on success.

       Signed-off-by: Jürg Billeter <j@bitron.ch>
       Reviewed-by: Adam Jackson <ajax@redhat.com>
       Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...Fix-error-check-for-pci_device_map_legacy.patch | 50 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.17.1.bb            |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
new file mode 100644
index 000000000000..28b3218a30d2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
@@ -0,0 +1,50 @@
+From 0a78b599b34cc8b5fe6fe82f90e90234e8ab7a56 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
+Date: Sat, 7 Feb 2015 18:13:21 +0100
+Subject: [PATCH] int10: Fix error check for pci_device_map_legacy
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+pci_device_map_legacy returns 0 on success.
+
+Upstream-status: backport 0a78b599b34cc8b5fe6fe82f90e90234e8ab7a56
+
+Signed-off-by: Jürg Billeter <j@bitron.ch>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ hw/xfree86/int10/generic.c                | 2 +-
+ hw/xfree86/os-support/linux/int10/linux.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/xfree86/int10/generic.c b/hw/xfree86/int10/generic.c
+index 012d194..8d5c4da 100644
+--- a/hw/xfree86/int10/generic.c
++++ b/hw/xfree86/int10/generic.c
+@@ -104,7 +104,7 @@ readIntVec(struct pci_device *dev, unsigned char *buf, int len)
+ {
+     void *map;
+ 
+-    if (!pci_device_map_legacy(dev, 0, len, 0, &map))
++    if (pci_device_map_legacy(dev, 0, len, 0, &map))
+         return FALSE;
+ 
+     memcpy(buf, map, len);
+diff --git a/hw/xfree86/os-support/linux/int10/linux.c b/hw/xfree86/os-support/linux/int10/linux.c
+index 79b9a88..6ca118f 100644
+--- a/hw/xfree86/os-support/linux/int10/linux.c
++++ b/hw/xfree86/os-support/linux/int10/linux.c
+@@ -75,7 +75,7 @@ readLegacy(struct pci_device *dev, unsigned char *buf, int base, int len)
+ {
+     void *map;
+ 
+-    if (!pci_device_map_legacy(dev, base, len, 0, &map))
++    if (pci_device_map_legacy(dev, base, len, 0, &map))
+         return FALSE;
+ 
+     memcpy(buf, map, len);
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
index 82051b36aaec..edca51e56837 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xtrans.patch \
             file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
 	    file://0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch \
+	    file://0001-int10-Fix-error-check-for-pci_device_map_legacy.patch \
            "
 
 SRC_URI[md5sum] = "5986510d59e394a50126a8e2833e79d3"
-- 
2.1.0


