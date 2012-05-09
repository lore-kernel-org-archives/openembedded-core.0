Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRuul-0000dS-5t
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:37:59 +0200
Received: by dalh21 with SMTP id h21so8590354dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ejNF7Z/P9bue+D6IOtx+slVelmTwJYU0bn56o4g9+6M=;
	b=dcBZI/8ZDxyEeoANgg7LswYOdWQax1j6aQ6UpK+JC8CserTklkEk0gy3jto/m3X7KK
	Xz6p5aeNxqbYC9QK4WUbYnYq1ZuIa/uFJl2CAwKbmmDrZWSW6JQfSW1k/V3mM39kMtkJ
	5hzYMP7BWFNseR7NDnsPvsG6kVZhkAzhiu7fCsmaCS5wWiezWYTXOoJXFzavO/yhO/Hz
	J/pUS2M+GLGeN9LPC9qhy+NFFXfwpKS8OWJjvUNWfPkjIwQZeoRoEZvQjs/ksX/6P+oV
	A5CdtOkn6ROyTZKskORIq8dP3CMAi9Ko3eNNsbF/FjWcA/2VfqiQqQtnFx6KRC55+Ur5
	UHtQ==
Received: by 10.68.222.197 with SMTP id qo5mr2984000pbc.72.1336523286363;
	Tue, 08 May 2012 17:28:06 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qk5sm4002909pbc.45.2012.05.08.17.28.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:28:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:27:48 -0700
Message-Id: <096c4f3ac2f83fc08064afcec5a05824bb96b94e.1336522880.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
References: <2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336522880.git.raj.khem@gmail.com>
References: <cover.1336522880.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] xserver-xorg: Fix build on powerpc
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
X-List-Received-Date: Wed, 09 May 2012 00:37:59 -0000

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



