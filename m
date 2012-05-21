Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJa1-0005eM-Qp
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:46 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uabjlcJNwVr4LBhyeMkPlp/TsEAGf0GhNc/AMKzlivc=;
	b=kkUlX8Ciez4+JXY2CpfC2U+dNfC1CvkUnwOqSMBrF7EHx5IgOuDjlvJ1EXKaGq6mW5
	M4JmZsIt27PCToyBA2nqdjcTElTNaUCIvktLImCRVzQCpEhkuX1di8i0arbnh1G1wJ5u
	GQ9hVn/A+5fZEdlFA+0DVeU7ZrukudlLv2PbMvGr0i1lyi5ZEzWgf2mmiqmlsEg9DODJ
	uAZtQ3nvX2VtXhNaoXoJ5W8en60M0b+vPZ5d3X2qz4MaPhQwyNR59x/Vnu7aoY8Am4Se
	A48/qzWBRwWfq1E4U6rSudPSmDTakc8ncbhWX2GjLS162nkbb5/xn9iYEBcKdUi6c09R
	6/NQ==
Received: by 10.68.234.200 with SMTP id ug8mr15876253pbc.54.1337571400786;
	Sun, 20 May 2012 20:36:40 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:46 -0700
Message-Id: <de21917ba83f104a2d53941f40a9b2b8d35dce49.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 11/14] xserver-xorg: Fix build for mips64
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
X-List-Received-Date: Mon, 21 May 2012 03:46:47 -0000

mips64 N64 ABI has different size for int and pointer
which means the compiler will complain about conversions
which works fine for 32 bit since sizes are same.

amd64 is taken care of already so we take care of mips64
with this patch by understanding the difference in sizes
in compiler.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    1 +
 .../xserver-xorg-1.11.2/mips64-compiler.patch      |   29 ++++++++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index fc41568..595ab77 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -2,6 +2,7 @@
 SRC_URI += "file://crosscompile.patch \
             file://fix_open_max_preprocessor_error.patch \
             file://gcc-47-warning.patch \
+	    file://mips64-compiler.patch \
            "
 
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
new file mode 100644
index 0000000..e6bc95b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
@@ -0,0 +1,29 @@
+on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
+so we end up with incompatible conversion errors
+
+This patch choses the right values for mips64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
+===================================================================
+--- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
++++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
+@@ -104,6 +104,7 @@
+ 
+ #  if !defined(__arm__)
+ #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
++      && !defined(__mips64) \
+       && !(defined(__alpha__) && defined(linux)) \
+       && !(defined(__ia64__) && defined(linux)) \
+ 
+@@ -708,7 +709,7 @@
+ }
+ 
+ #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
+-#    ifdef __arm32__
++#    if defined (__arm32__) || defined (__mips64)
+ #     define PORT_SIZE long
+ #    else
+ #     define PORT_SIZE short
-- 
1.7.5.4



