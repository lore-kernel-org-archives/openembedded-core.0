Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id D25997319C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:39 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id c96so60848792qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LqNVTHJ5iSBAZg+Kl5vgb8iiKtHOV/PNZjFLzAebONA=;
	b=sRm/4DDeMgCePnoUTsceFl2sQ3b0CVXE/ch8+HRolGs58U8tUtrTanEIRUn+v+lhnJ
	r696pS174mt+o28XxbPXubbtsf+vP5HHefK4mBy/e0uMQVvcr3Gs3EzNW/jhGOkpVhy1
	MKSNlK23VItvr4c9TbY0rjJfVefFq66+/86wbebxpFhKhTf9E7CE00FG0BOPCwJhz+CS
	f5okzD0KmrlshNuZ0j+mwGBtThHcJL36BWvm6OZLo/5YVuCWa1JN8c2Ooii9gScIh2OV
	j3ahiT6MC8OfqeIAy8iTlkzrOKzE2rGC+Q98XIQok4wMSjersrzk4wA06wGHkRLEpqga
	6LuA==
X-Received: by 10.140.155.201 with SMTP id b192mr15833689qhb.29.1450569160220; 
	Sat, 19 Dec 2015 15:52:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:22 +0000
Message-Id: <8b25bbe0ade4a8c4eeb058ff0f9e3fd02cddf891.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 13/17] xserver-xorg: Fix build with musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:40 -0000

inb/outb are implemented for ARM on glibc but not on linux in general
therefore the conditional has to reflect that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch  | 18 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.18.0.bb                |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
new file mode 100644
index 0000000..4be441f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
@@ -0,0 +1,18 @@
+inb/outb family for arm is only implemented on glibc
+so assumption across linux is wrong
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: xorg-server-1.18.0/hw/xfree86/common/compiler.h
+===================================================================
+--- xorg-server-1.18.0.orig/hw/xfree86/common/compiler.h
++++ xorg-server-1.18.0/hw/xfree86/common/compiler.h
+@@ -758,7 +758,7 @@ inl(unsigned short port)
+     return xf86ReadMmio32Le((void *) ioBase, port);
+ }
+ 
+-#elif defined(__arm__) && defined(__linux__)
++#elif defined(__arm__) && defined(__GLIBC__)
+ 
+ /* for Linux on ARM, we use the LIBC inx/outx routines */
+ /* note that the appropriate setup via "ioperm" needs to be done */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
index 60973c5..e606dac 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
@@ -1,6 +1,8 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch"
+SRC_URI += "file://configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch \
+            file://musl-arm-inb-outb.patch \
+           "
 SRC_URI[md5sum] = "3c1c1057d3ad27380d8dd87ffcc182cd"
 SRC_URI[sha256sum] = "195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e"
 
-- 
2.6.4


