Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgj3-0000Jb-Ju
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:43 +0200
Received: by mail-pz0-f45.google.com with SMTP id v2so493772dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ejNF7Z/P9bue+D6IOtx+slVelmTwJYU0bn56o4g9+6M=;
	b=zTawF7SDXeG3Yl+TOUD0L8p9VItP0XAvul06AwXIbPrh83+dcsbq0EFFAFj3qhDyw1
	lWgx7oSP+6GCDvNWQR9YKuHvCNLzG4OpnWO1e3qyFrYeR4Mp1hWLP9YBkLz0syoL9YYK
	TKYb2bKcbcxYckVJ4p7um09PH8DbNpa4IDFFrXBCjyTfLRZdDQaKQSJkZil1lLKkDmq2
	mHZ5G8trNGwf5OkX2VFRFLLaM2Kdg+CrnwK5w0H4Ia6kaHTauILyT/goQ1bPO/98lcLw
	YYCT7sQ/5y7C94k176UjeHJTMH9uPkFozC9SdOWYFnz8MNo4zdeW8KJcXwmYo+mF3RpY
	F6gA==
Received: by 10.68.202.230 with SMTP id kl6mr699396pbc.134.1335992098868;
	Wed, 02 May 2012 13:54:58 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.54.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:54:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:55 -0700
Message-Id: <7ca56149e5c8663c2de473f31e472ea3f2e30ee6.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] xserver-xorg: Fix build on powerpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 21:04:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +++--
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++++++++++++++++
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index f5fa629..6a86af4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -1,10 +1,11 @@
-SRC_URI += "file://crosscompile.patch"
-
 # Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch"
+SRC_URI += "file://crosscompile.patch \
+            file://fix_open_max_preprocessor_error.patch \
+            file://gcc-47-warning.patch \
+           "
 
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r1"
+PR = "r2"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
new file mode 100644
index 0000000..ed4eaac
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
@@ -0,0 +1,33 @@
+This patch fixes errors on powerpc like below
+
+| lnx_video.c: In function 'unmapVidMem':
+| lnx_video.c:472:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+
+Its in 1.12 branch 
+
+http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.12-branch&id=eb3377ffb8a7baa26c9831e56ed782d48b28fa71
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
+===================================================================
+--- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:32:34.186489019 -0700
++++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:49:14.926537452 -0700
+@@ -469,11 +469,11 @@
+ static void
+ unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
+ {
+-    memType alignOff = (memType)Base 
+-	- ((memType)Base & ~(getpagesize() - 1));
++    uintptr_t alignOff = (uintptr_t)Base 
++	- ((uintptr_t)Base & ~(getpagesize() - 1));
+ 
+-    DebugF("alignment offset: %lx\n",alignOff);
+-    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
++    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
++    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
+ }
+ 
+ 
-- 
1.7.5.4



