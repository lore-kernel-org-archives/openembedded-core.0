Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxWHN-0004JH-Ug
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 06:20:14 +0100
Received: by mail-ob0-f182.google.com with SMTP id uo13so1866236obb.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 21:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=7Gi2wamaJJTDfPcBZAg6LRHACVfexjECimdj76dt7CY=;
	b=k5N8z84ba5/5/lfGatJ+XN2QgdNLON0HvvBYMUHqtOZlxOHWtjfMd2wk41ZrDXDx1J
	EHzUnfu2+sHAQKCT1CKmLMd4ZeCO8Sc1/Dd/y2AfgSRf7seId+7Kskas/GxQa4rKScCH
	lx9kMFvWQqyvlT7F1929rJi/x+uGh746bFPylNXZbQnezXkLZkn66pbSAMTDeQBVP5HS
	M5iAiUKsjLNwSbXKosSAJtCCnzQweLqsltXKV6IAJ21GuD82IuH/3EtaiGJZ0D2gG4Xx
	VjbcGIKqZ0836xC1OHHsyyJ7QO1kF0DJVg73pxfpWk10TUyzxKTMdpj3WKgMKYZafG2W
	qnbQ==
X-Received: by 10.182.182.101 with SMTP id ed5mr15922798obc.23.1358831083897; 
	Mon, 21 Jan 2013 21:04:43 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id zz6sm12729989oeb.1.2013.01.21.21.04.42
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 21:04:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:04:28 -0800
Message-Id: <caae1fea0f8a24f15eae6a671bf627f2579e705d.1358830857.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
References: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
In-Reply-To: <cover.1358830857.git.raj.khem@gmail.com>
References: <cover.1358830857.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] systemd: Fix build on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 05:20:17 -0000

Systemd has some uclibc specific patches which
needed to be forwarded ported to 196

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd-pam-fix-getty-unit.patch       |   25 ++--
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  131 +++++++++++---------
 2 files changed, 83 insertions(+), 73 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
index 533a239..72d1411 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -7,30 +7,29 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  units/serial-getty@.service.m4 |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: systemd-37/units/getty@.service.m4
+Index: systemd-196/units/getty@.service.m4
 ===================================================================
---- systemd-37.orig/units/getty@.service.m4
-+++ systemd-37/units/getty@.service.m4
-@@ -41,7 +41,7 @@
+--- systemd-196.orig/units/getty@.service.m4	2012-11-20 12:39:16.000000000 -0800
++++ systemd-196/units/getty@.service.m4	2013-01-21 16:08:03.707533381 -0800
+@@ -45,7 +45,7 @@
  
  [Service]
- Environment=TERM=linux
  # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I 38400
+-ExecStart=-/sbin/agetty --noclear %I 38400 linux
 +ExecStart=-/sbin/getty -L %I 115200 linux
  Type=idle
  Restart=always
  RestartSec=0
-Index: systemd-37/units/serial-getty@.service.m4
+Index: systemd-196/units/serial-getty@.service.m4
 ===================================================================
---- systemd-37.orig/units/serial-getty@.service.m4
-+++ systemd-37/units/serial-getty@.service.m4
-@@ -37,7 +37,7 @@
+--- systemd-196.orig/units/serial-getty@.service.m4	2012-11-20 12:39:16.000000000 -0800
++++ systemd-196/units/serial-getty@.service.m4	2013-01-21 16:09:01.763535039 -0800
+@@ -40,7 +40,7 @@
+ IgnoreOnIsolate=yes
  
  [Service]
- Environment=TERM=vt102
--ExecStart=-/sbin/agetty -s %I 115200,38400,9600
-+ExecStart=-/sbin/getty -L %I 115200 vt100
+-ExecStart=-/sbin/agetty -s %I 115200,38400,9600 vt102
++ExecStart=-/sbin/getty -L %I 115200 vt102
  Type=idle
  Restart=always
  RestartSec=0
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
index f3b1ace..aa186bd 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -0400
-+++ systemd-pam-185/src/fsck/fsck.c	2012-06-22 21:15:56.000000000 -0400
+Index: systemd-196/src/fsck/fsck.c
+===================================================================
+--- systemd-196.orig/src/fsck/fsck.c	2012-07-26 03:45:14.000000000 -0700
++++ systemd-196/src/fsck/fsck.c	2013-01-21 16:10:46.807537608 -0800
 @@ -36,6 +36,8 @@
  #include "bus-errors.h"
  #include "virt.h"
@@ -31,67 +33,66 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
                  /* Only show one progress counter at max */
                  if (!locked) {
---- systemd-pam-185/src/core/swap.c.orig	2012-06-22 23:22:55.000000000 -0400
-+++ systemd-pam-185/src/core/swap.c	2012-06-22 21:17:10.000000000 -0400
-@@ -40,6 +40,8 @@
- #include "def.h"
+Index: systemd-196/src/core/swap.c
+===================================================================
+--- systemd-196.orig/src/core/swap.c	2012-10-29 19:40:42.000000000 -0700
++++ systemd-196/src/core/swap.c	2013-01-21 16:15:11.751544181 -0800
+@@ -41,6 +41,8 @@
  #include "path-util.h"
+ #include "virt.h"
  
 +#include "config.h"
 +
  static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
          [SWAP_DEAD] = UNIT_INACTIVE,
          [SWAP_ACTIVATING] = UNIT_ACTIVATING,
-@@ -1038,7 +1040,7 @@
-         for (i = 1;; i++) {
+@@ -1059,6 +1061,7 @@
                  char *dev = NULL, *d;
                  int prio = 0, k;
--
+ 
 +#ifdef HAVE_MSFORMAT
-                 if ((k = fscanf(m->proc_swaps,
-                                 "%ms "  /* device/file */
-                                 "%*s "  /* type of swap */
-@@ -1046,10 +1048,18 @@
-                                 "%*s "  /* used */
-                                 "%i\n", /* priority */
-                                 &dev, &prio)) != 2) {
--
+                 k = fscanf(m->proc_swaps,
+                            "%ms "  /* device/file */
+                            "%*s "  /* type of swap */
+@@ -1066,6 +1069,16 @@
+                            "%*s "  /* used */
+                            "%i\n", /* priority */
+                            &dev, &prio);
 +#else
-+		dev = malloc(257);
-+                if ((k = fscanf(m->proc_swaps,
-+                                "%256s "   /* device/file */
-+                                "%*s "  /* type of swap */
-+                                "%*s "  /* swap size */
-+                                "%*s "  /* used */
-+                                "%i\n", /* priority */
-+                                dev, &prio)) != 2) {
++                dev = malloc(257);
++                k = fscanf(m->proc_swaps,
++                           "%256s "/* device/file */
++                           "%*s "  /* type of swap */
++                           "%*s "  /* swap size */
++                           "%*s "  /* used */
++                           "%i\n", /* priority */
++                           dev, &prio);
 +#endif /* HAVE_MSFORMAT */
+                 if (k != 2) {
                          if (k == EOF)
                                  break;
--
-                         log_warning("Failed to parse /proc/swaps:%u.", i);
-                         free(dev);
-                         continue;
---- systemd-pam-185/src/core/mount-setup.c.orig	2012-06-22 23:23:41.000000000 -0400
-+++ systemd-pam-185/src/core/mount-setup.c	2012-06-22 21:19:44.000000000 -0400
+Index: systemd-196/src/core/mount-setup.c
+===================================================================
+--- systemd-196.orig/src/core/mount-setup.c	2012-11-09 06:55:35.000000000 -0800
++++ systemd-196/src/core/mount-setup.c	2013-01-21 16:10:46.807537608 -0800
 @@ -28,6 +28,7 @@
  #include <assert.h>
  #include <unistd.h>
  #include <ftw.h>
 +#include <linux/fs.h>
-
+ 
  #include "mount-setup.h"
  #include "dev-setup.h"
-@@ -41,6 +41,8 @@
- #include "path-util.h"
+@@ -42,6 +43,8 @@
  #include "missing.h"
+ #include "virt.h"
  
 +#include "config.h"
 +
  #ifndef TTY_GID
  #define TTY_GID 5
  #endif
-@@ -200,9 +202,12 @@
+@@ -224,9 +227,12 @@
          for (;;) {
                  char *controller;
                  int enabled = 0;
@@ -106,8 +107,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                          if (feof(f))
                                  break;
  
---- systemd-pam-185/src/core/mount.c.orig	2012-06-22 23:24:17.000000000 -0400
-+++ systemd-pam-185/src/core/mount.c	2012-06-22 22:51:21.000000000 -0400
+Index: systemd-196/src/core/mount.c
+===================================================================
+--- systemd-196.orig/src/core/mount.c	2012-10-22 16:53:02.000000000 -0700
++++ systemd-196/src/core/mount.c	2013-01-21 16:10:46.811537609 -0800
 @@ -41,6 +41,8 @@
  #include "exit-status.h"
  #include "def.h"
@@ -117,7 +120,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
          [MOUNT_DEAD] = UNIT_INACTIVE,
          [MOUNT_MOUNTING] = UNIT_ACTIVATING,
-@@ -1514,7 +1516,7 @@
+@@ -1538,7 +1540,7 @@
                  int k;
  
                  device = path = options = options2 = fstype = d = p = o = NULL;
@@ -126,7 +129,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                  if ((k = fscanf(m->proc_self_mountinfo,
                                  "%*s "       /* (1) mount id */
                                  "%*s "       /* (2) parent id */
-@@ -1533,7 +1535,31 @@
+@@ -1557,7 +1559,31 @@
                                  &fstype,
                                  &device,
                                  &options2)) != 5) {
@@ -159,18 +162,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                          if (k == EOF)
                                  break;
  
---- systemd-pam-185/src/core/umount.c.orig	2012-06-22 23:24:37.000000000 -0400
-+++ systemd-pam-185/src/core/umount.c	2012-06-22 22:56:15.000000000 -0400
-@@ -35,6 +35,8 @@
- #include "path-util.h"
+Index: systemd-196/src/core/umount.c
+===================================================================
+--- systemd-196.orig/src/core/umount.c	2012-11-16 09:32:41.000000000 -0800
++++ systemd-196/src/core/umount.c	2013-01-21 16:10:46.811537609 -0800
+@@ -36,6 +36,8 @@
  #include "util.h"
+ #include "virt.h"
  
 +#include "config.h"
 +
  typedef struct MountPoint {
          char *path;
          dev_t devnum;
-@@ -74,7 +76,7 @@
+@@ -75,7 +77,7 @@
                  MountPoint *m;
  
                  path = p = NULL;
@@ -179,7 +184,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                  if ((k = fscanf(proc_self_mountinfo,
                                  "%*s "       /* (1) mount id */
                                  "%*s "       /* (2) parent id */
-@@ -89,6 +91,23 @@
+@@ -90,6 +92,23 @@
                                  "%*s"        /* (11) mount options 2 */
                                  "%*[^\n]",   /* some rubbish at the end */
                                  &path)) != 1) {
@@ -203,7 +208,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                          if (k == EOF)
                                  break;
  
-@@ -150,7 +169,7 @@
+@@ -151,7 +170,7 @@
                  MountPoint *swap;
                  char *dev = NULL, *d;
                  int k;
@@ -212,7 +217,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                  if ((k = fscanf(proc_swaps,
                                  "%ms " /* device/file */
                                  "%*s " /* type of swap */
-@@ -158,7 +177,16 @@
+@@ -159,7 +178,16 @@
                                  "%*s " /* used */
                                  "%*s\n", /* priority */
                                  &dev)) != 1) {
@@ -230,8 +235,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                          if (k == EOF)
                                  break;
  
---- systemd-pam-185/src/shared/socket-util.c.orig	2012-06-22 23:25:00.000000000 -0400
-+++ systemd-pam-185/src/shared/socket-util.c	2012-06-22 22:59:27.000000000 -0400
+Index: systemd-196/src/shared/socket-util.c
+===================================================================
+--- systemd-196.orig/src/shared/socket-util.c	2012-11-14 13:21:15.000000000 -0800
++++ systemd-196/src/shared/socket-util.c	2013-01-21 16:10:46.811537609 -0800
 @@ -39,6 +39,8 @@
  #include "socket-util.h"
  #include "missing.h"
@@ -241,7 +248,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int socket_address_parse(SocketAddress *a, const char *s) {
          int r;
          char *e, *n;
-@@ -201,8 +203,16 @@
+@@ -202,8 +204,16 @@
          a->type = SOCK_RAW;
  
          errno = 0;
@@ -257,20 +264,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +	}
 +#endif /* HAVE_MSFORMAT */
  
-         if ((family = netlink_family_from_string(sfamily)) < 0)
-                 if (safe_atoi(sfamily, &family) < 0) {
---- systemd-pam-185/src/tmpfiles/tmpfiles.c.orig	2012-06-22 23:25:21.000000000 -0400
-+++ systemd-pam-185/src/tmpfiles/tmpfiles.c	2012-06-22 23:13:49.000000000 -0400
-@@ -48,6 +48,8 @@
- #include "set.h"
+         family = netlink_family_from_string(sfamily);
+         if (family < 0)
+Index: systemd-196/src/tmpfiles/tmpfiles.c
+===================================================================
+--- systemd-196.orig/src/tmpfiles/tmpfiles.c	2012-10-23 16:06:30.000000000 -0700
++++ systemd-196/src/tmpfiles/tmpfiles.c	2013-01-21 16:10:46.811537609 -0800
+@@ -51,6 +51,8 @@
  #include "conf-files.h"
+ #include "capability.h"
  
 +#include "config.h"
 +
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -970,7 +972,7 @@
+@@ -990,7 +992,7 @@
          i = new0(Item, 1);
          if (!i)
                  return log_oom();
@@ -279,7 +288,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          if (sscanf(buffer,
                     "%c "
                     "%ms "
-@@ -986,6 +988,28 @@
+@@ -1006,6 +1008,28 @@
                     &group,
                     &age,
                     &n) < 2) {
@@ -308,8 +317,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                  log_error("[%s:%u] Syntax error.", fname, line);
                  r = -EIO;
                  goto finish;
---- systemd-pam-185/src/cryptsetup/cryptsetup-generator.c.orig	2012-06-22 23:25:47.000000000 -0400
-+++ systemd-pam-185/src/cryptsetup/cryptsetup-generator.c	2012-06-22 23:16:35.000000000 -0400
+Index: systemd-196/src/cryptsetup/cryptsetup-generator.c
+===================================================================
+--- systemd-196.orig/src/cryptsetup/cryptsetup-generator.c	2012-08-08 14:53:24.000000000 -0700
++++ systemd-196/src/cryptsetup/cryptsetup-generator.c	2013-01-21 16:10:46.811537609 -0800
 @@ -30,6 +30,8 @@
  #include "virt.h"
  #include "strv.h"
-- 
1.7.9.5



