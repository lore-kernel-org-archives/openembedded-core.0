Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBB26A9C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 14:45:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s23EjvVG005945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 06:45:57 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 06:45:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 22:49:48 +0800
Message-ID: <213d7368c3c13140bbdc0f47e85e44bb932b1857.1393855671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393855671.git.liezhi.yang@windriver.com>
References: <cover.1393855671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] grub 2.00: add oe's kernel name to the conf file
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
X-List-Received-Date: Mon, 03 Mar 2014 14:46:00 -0000
Content-Type: text/plain

Our kernel's name is bzImage, we need add it to grub.d/10_linux.in so
that the grub-mkconfig and grub-install can work correctly on the
target.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../grub/files/grub-2.00-add-oe-kernel.patch       | 53 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch

diff --git a/meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch b/meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
new file mode 100644
index 0000000..eb8916c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
@@ -0,0 +1,53 @@
+From 7ab576a7c61406b7e63739d1b11017ae336b9008 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 3 Mar 2014 03:34:48 -0500
+Subject: [PATCH] grub.d/10_linux.in: add oe's kernel name
+
+Our kernel's name is bzImage, we need add it to grub.d/10_linux.in so
+that the grub-mkconfig and grub-install can work correctly.
+
+We only need add the bzImage to util/grub.d/10_linux.in, but also add it
+to util/grub.d/20_linux_xen.in to keep compatibility.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ util/grub.d/10_linux.in     |    4 ++--
+ util/grub.d/20_linux_xen.in |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
+index 14402e8..c58f417 100644
+--- a/util/grub.d/10_linux.in
++++ b/util/grub.d/10_linux.in
+@@ -153,11 +153,11 @@ EOF
+ machine=`uname -m`
+ case "x$machine" in
+     xi?86 | xx86_64)
+-	list=`for i in /boot/vmlinuz-* /vmlinuz-* /boot/kernel-* ; do
++	list=`for i in /boot/bzImage-* /bzImage-* /boot/vmlinuz-* /vmlinuz-* /boot/kernel-* ; do
+                   if grub_file_is_not_garbage "$i" ; then echo -n "$i " ; fi
+               done` ;;
+     *) 
+-	list=`for i in /boot/vmlinuz-* /boot/vmlinux-* /vmlinuz-* /vmlinux-* /boot/kernel-* ; do
++	list=`for i in /boot/bzImage-* /boot/vmlinuz-* /boot/vmlinux-* /bzImage-* /vmlinuz-* /vmlinux-* /boot/kernel-* ; do
+                   if grub_file_is_not_garbage "$i" ; then echo -n "$i " ; fi
+ 	     done` ;;
+ esac
+diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
+index 1d94502..b2decf3 100644
+--- a/util/grub.d/20_linux_xen.in
++++ b/util/grub.d/20_linux_xen.in
+@@ -138,7 +138,7 @@ EOF
+ EOF
+ }
+ 
+-linux_list=`for i in /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
++linux_list=`for i in /boot/bzImage[xz]-* /bzImage[xz]-* /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
+     if grub_file_is_not_garbage "$i"; then
+     	basename=$(basename $i)
+ 	version=$(echo $basename | sed -e "s,^[^0-9]*-,,g")
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index ff9a7c6..c21031b 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -22,6 +22,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://check-if-liblzma-is-disabled.patch \
           file://40_custom \
           file://fix-issue-with-flex-2.5.37.patch \
+          file://grub-2.00-add-oe-kernel.patch \
           "
 
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-- 
1.8.3.1


