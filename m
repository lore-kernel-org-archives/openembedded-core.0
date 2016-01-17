Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id D61D3731F2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:07 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id n128so142172588pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NTB7niTizDXCDyl0myqGa3HbWfr8N+COlSj3glj39fs=;
	b=hK6YaMky/adFvHPYHjfAvhUmY8JujWmaghOZg4/Lf5/btYrW9L6Irk1vMFCZwql5KQ
	XVhoL4yRf55UfsWhLnObcQ86yBMAB7tASZitRCMwt0apV0Wj6dMOOL1xYVbwXuKQEQS2
	Bwq/aa0vaf36RZexyKx2rmAh6BZhQVNX4/YDBJn2KOTbOP8cMXgtDkLxuaqzAFp5YCn/
	UWrZsnBw4igzPahZZI+Yttd32mAhocGh6vkFZo3R6dXysmOmA3KPGr97FC3PbrBAnlsX
	ENmo/DixsNDy8O3ftrqrV+AEaeHOAVa5yXzIiaeoiuuPRuXe8rqiUN7WZdgeSBJdF5QE
	DzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NTB7niTizDXCDyl0myqGa3HbWfr8N+COlSj3glj39fs=;
	b=FS9+Es3DxLfUuxr6tq1yufeAvz4+rHJ1GnOa8XYi03fROQIbpzUhswd3TI42fbg888
	uIt8JkzF9EiEMMwdga7lCS3XiPhwECOrUGQlxCT2DMt+/lQkRA7pWL+Ow8GjUGSrD6AD
	RnG8MpfkGRfUmentr0CYhVw7PM4CThDkQ9BO++uqhn/SG6xQNZ4B5sFjIhGGVEsF5t7F
	LGGUBxsB1nLZyAuCJhTeZL+LtvzAaJ7eGWOsZ8zjrDbRL2PTv2+4Ral+o9gOM8qpkqip
	w5eB1+YtkRvNE1jsl9OKeLfBSqCjmGC4EmY74WHkMipRznVzEfCxdgY/IoS5XqnryZyL
	UhkA==
X-Gm-Message-State: ALoCoQn4q/HL3s61dnfnE3wI5e7eUdDqtqA9ApVUin29eAzN76N2d70t7yYqPg6K8OYorAnaOH9Z83tWJYkUp3EirxMBifGbMg==
X-Received: by 10.98.75.4 with SMTP id y4mr28450585pfa.32.1453030628544;
	Sun, 17 Jan 2016 03:37:08 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:42 -0800
Message-Id: <2682781c4cc6b1b321f38f6658b6acab90b414ac.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 09/73] xserver-xorg: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:08 -0000

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


