Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E64F177005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:34 +0000 (UTC)
Received: by qkap81 with SMTP id p81so60561768qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=47CRpsEQzrT4dqrh3xOYGbwp0jm1xRDZUtvpmtsnfHw=;
	b=oRKVFX/Q86Cumw/YXpAihIjOiL/NVdGdAsw4Tc4dHgVBvvm463eqk9N1qxURYBL6TR
	RvWLGXFswaXIWeVZymBHXRsidzc97M2wgkMdoejg44AoXPVkP0QXyLM+E9jp6pQkPunV
	7A+cyYnfgJaLwAP8bdWNsHZVfucn69Hbwh5E2zW0N1BxejRlWsePF8aBOMDabljBa1Z4
	0R6lqa9oyX5dwnCnJDl7HASRZgLgcBc0xjSckS76B+PhHJQ2m0FCoEWajOd0+yc+Q3Xk
	PEfF9XTD9VZK0cdzZLqQjUVRp1ux2wXUx7K2yUGWECgZRtsH1TbyHXBGRSkRAeecPdJy
	x6SQ==
X-Received: by 10.55.20.5 with SMTP id e5mr23279548qkh.48.1442248294762;
	Mon, 14 Sep 2015 09:31:34 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:22 +0000
Message-Id: <6de478b1c686b53692722daf36ef853d6a308150.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 07/12] syslinux: Dont bypass gcc driver for dependency generation options
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:36 -0000

GCC docs also do not recommend using -Wp instead pass the option via gcc
driver and let it process it as needed

This also helps in making it work with clang as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0011-mk-MMD-does-not-take-any-arguments.patch  | 33 ++++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch b/meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch
new file mode 100644
index 0000000..443c1cc
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch
@@ -0,0 +1,33 @@
+From 0f3d83c25491951f1fa84c7957358ef3d1bcd8a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Sep 2015 17:39:22 +0000
+Subject: [PATCH] mk: -MMD does not take any arguments
+
+Specify -Wp for each option, clang seems to not accept
+-Wp,-x,y,-a,b
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ mk/syslinux.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: syslinux-6.03/mk/syslinux.mk
+===================================================================
+--- syslinux-6.03.orig/mk/syslinux.mk
++++ syslinux-6.03/mk/syslinux.mk
+@@ -82,11 +82,11 @@ ARCH ?= $(strip $(SUBARCH))
+ GCCWARN  = -W -Wall -Wstrict-prototypes $(DEBUGOPT)
+ 
+ # Common stanza to make gcc generate .*.d dependency files
+-MAKEDEPS = -Wp,-MT,$@,-MD,$(dir $@).$(notdir $@).d
++MAKEDEPS = -MT $@ -MD
+ 
+ # Dependencies that exclude system headers; use whenever we use
+ # header files from the platform.
+-UMAKEDEPS = -Wp,-MT,$@,-MMD,$(dir $@).$(notdir $@).d
++UMAKEDEPS = -MT $@ -MMD
+ 
+ # Items that are only appropriate during development; this file is
+ # removed when tarballs are generated.
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 94077da..8534528 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.xz \
            file://0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch \
            file://0009-linux-syslinux-implement-install_bootblock.patch \
            file://0010-gcc46-compatibility.patch \
+           file://0011-mk-MMD-does-not-take-any-arguments.patch \
            "
 
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
-- 
2.5.2


