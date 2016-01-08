Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBD775D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:33 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n135so198825954qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NTB7niTizDXCDyl0myqGa3HbWfr8N+COlSj3glj39fs=;
	b=iMlxd6B6Yqvk4tgKc1XbYLwYOpHhycV1eGKBb0eWJi4vfUYVuAvMU8axcvNTH5qzyd
	b2FifU6HjRZ63Am53xB59NkLHn3xf6pwF/4uDHaKuAsbVER18m8EYwrwA/6ZmpejjfgB
	/T48+uGgQSZCwYZinMhTho1T/ZbKDiYKtHGlgGJpXlz7XILi2EgaOO5LJOLNGsijmqt7
	JJ/14hdfEWbm1FAbhs8Zn7mqfWYNia3CX8fFgl7wBNt05RxKRjVWgAJZy57Pb9ThofMs
	yflbEuW9AAHau9O789cD4KoHVgg8OUIDQBx/mHeMN38UYXyF5tWz077pWdbHXsP3/tV+
	Itgg==
X-Received: by 10.55.42.5 with SMTP id q5mr15157069qkh.101.1452248374275;
	Fri, 08 Jan 2016 02:19:34 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:38 +0000
Message-Id: <b86708901361b5789e6148729ca88fc4ac21f00a.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 10/53] xserver-xorg: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:34 -0000

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
2.7.0


