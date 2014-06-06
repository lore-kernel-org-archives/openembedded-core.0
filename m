Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4696B7BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:26:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s568QKba024412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:26:20 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.200) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Jun 2014 01:26:20 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 16:26:25 +0800
Message-ID: <1402043186-18539-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] grub-2.00: remove our 40_custom
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
X-List-Received-Date: Fri, 06 Jun 2014 08:26:24 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

We have this in recipes-bsp/grub/grub/40_custom:

[snip]
menuentry "Linux" {
    set root=(hd0,1)
    linux /vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ __VGA_MODE__ quiet
}
[snip]

These lines are only for initrdscripts/files/init-install.sh, the side
effect is that it would make the target's grub-mkconfig doesn't work
well since the 40_custom will be installed to /etc/grub.d/40_custom, the
grub-mkconfig will run the 40_custom, and there will always be a
'menuentry "Linux"' menu in grub.cfg no matter it is valid or not, we
can do this in init-install.sh rather than grub to fix the problem,
which is also much simpler.

We have done the related work in init-install.sh, now we need remove our own
40_custom, and use grub's own 40_custom which is the right one.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-bsp/grub/grub/40_custom |    9 ---------
 meta/recipes-bsp/grub/grub_2.00.bb   |    2 --
 meta/recipes-bsp/grub/grub_git.bb    |    2 --
 3 files changed, 13 deletions(-)
 delete mode 100755 meta/recipes-bsp/grub/grub/40_custom

diff --git a/meta/recipes-bsp/grub/grub/40_custom b/meta/recipes-bsp/grub/grub/40_custom
deleted file mode 100755
index f891b02..0000000
--- a/meta/recipes-bsp/grub/grub/40_custom
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-exec tail -n +3 $0
-# This file provides an easy way to add custom menu entries.  Simply type the
-# menu entries you want to add after this comment.  Be careful not to change
-# the 'exec tail' line above.
-menuentry "Linux" {
-    set root=(hd0,1)
-    linux /vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ __VGA_MODE__ quiet
-}
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 6075b20..ce2d680 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -20,7 +20,6 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-2.00-fpmath-sse-387-fix.patch \
           file://remove-gets.patch \
           file://check-if-liblzma-is-disabled.patch \
-          file://40_custom \
           file://fix-issue-with-flex-2.5.37.patch \
           file://grub-2.00-add-oe-kernel.patch \
           "
@@ -44,7 +43,6 @@ EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
-    install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
 }
 
 INSANE_SKIP_${PN} = "arch"
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3edc20a..7f89739 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -19,7 +19,6 @@ DEFAULT_PREFERENCE_arm = "1"
 PV = "2.00+${SRCPV}"
 SRCREV = "4b8b9135f1676924a8458da528d264bbc7bbb301"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
-           file://40_custom \
            file://autogen.sh-exclude-pc.patch \
            file://grub-2.00-add-oe-kernel.patch \
            file://asciih-fix-build-warning-error.patch \
@@ -52,7 +51,6 @@ do_configure_prepend() {
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
-    install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
  
 }
 
-- 
1.7.10.4


