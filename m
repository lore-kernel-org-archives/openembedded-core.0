Return-Path: <Shan.Hai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6825F7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:53:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T8rCjA011966
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 01:53:13 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 29 Apr 2015 01:53:12 -0700
From: Shan Hai <shan.hai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 16:53:09 +0800
Message-ID: <1430297589-27335-2-git-send-email-shan.hai@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1430297589-27335-1-git-send-email-shan.hai@windriver.com>
References: <1430297589-27335-1-git-send-email-shan.hai@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub2: fix initrd size restriction bug
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
X-List-Received-Date: Wed, 29 Apr 2015 08:53:12 -0000
Content-Type: text/plain

The current grub2 fails on loading large initrd file (> 500M) since
the initrd size is added to the addr_min and causes the failure.
Fix it by picking a patch from grub2 upstream.

Signed-off-by: Shan Hai <shan.hai@windriver.com>
---
 .../grub/files/grub2-fix-initrd-size-bug.patch     | 48 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch

diff --git a/meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch b/meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
new file mode 100644
index 0000000..d114f48
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
@@ -0,0 +1,48 @@
+From 8fbb150a56966edde4dc07b8d01be5eb149b65ab Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@ubuntu.com>
+Date: Sun, 20 Jan 2013 23:03:35 +0000
+Subject: [PATCH 1/1] * grub-core/loader/i386/linux.c (grub_cmd_initrd): Don't
+ add the initrd size to addr_min, since the initrd will be allocated after
+ this address.
+
+commit 6a0debbd9167e8f79cdef5497a73d23e580c0cd4 upstream
+
+Upstream-Status: Backport
+
+Signed-off-by: Shan Hai <shan.hai@windriver.com>
+---
+ ChangeLog                     | 6 ++++++
+ grub-core/loader/i386/linux.c | 3 +--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index c2f42d5..40cb508 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2013-01-20  Colin Watson  <cjwatson@ubuntu.com>
++
++	* grub-core/loader/i386/linux.c (grub_cmd_initrd): Don't add the
++	initrd size to addr_min, since the initrd will be allocated after
++	this address.
++
+ 2012-07-02  Vladimir Serbinenko  <phcoder@gmail.com>
+ 
+ 	* grub-core/net/tftp.c (ack): Fix endianness problem.
+diff --git a/grub-core/loader/i386/linux.c b/grub-core/loader/i386/linux.c
+index 62087cf..e2425c8 100644
+--- a/grub-core/loader/i386/linux.c
++++ b/grub-core/loader/i386/linux.c
+@@ -1098,8 +1098,7 @@ grub_cmd_initrd (grub_command_t cmd __attribute__ ((unused)),
+      worse than that of Linux 2.3.xx, so avoid the last 64kb.  */
+   addr_max -= 0x10000;
+ 
+-  addr_min = (grub_addr_t) prot_mode_target + prot_init_space
+-             + page_align (size);
++  addr_min = (grub_addr_t) prot_mode_target + prot_init_space;
+ 
+   /* Put the initrd as high as possible, 4KiB aligned.  */
+   addr = (addr_max - size) & ~0xFFF;
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index add4586..312771b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-efi-fix-with-glibc-2.20.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
+           file://grub2-fix-initrd-size-bug.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
-- 
1.8.5.2.233.g932f7e4


