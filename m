Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACE177138
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:10 +0000 (UTC)
Received: by pabws5 with SMTP id ws5so16035645pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=f0cn6Pl6/y2PpSEBLKm8OsjCq7b8zbNHZBCRpje7EI0=;
	b=Ntjdrx52myZhIjla5aThB/4x/JIRtFG3bsG1kepNKWiwYAD2Ca8xpGNZi5WMJ0dClj
	7taVffIloDvCLNKqXQJLEb1MSDbwHIGqj/mxm3IXzgOQKOUKl9ZmbBy4GCw0std+mYN4
	ZhVS00L4MzSoLifGP5GA1BqQhKNSs9GzTQWN6CdLD/lFeXOyIy6UYavgmzKuMarBcBqX
	N5AkO8uXTcCctf726Lo9y5Ty3/Ooxfl6Dc/Zf+h0sJ2oitsDhRWgLwE82sHKiRssJx4A
	R4SD4Cr84stxSZK0p0Wk75/QQOWQ4uplADf2ZT+RI8SUjQG/k4l0ez/BOlmqlqtM3ZvC
	/9rw==
X-Received: by 10.66.229.8 with SMTP id sm8mr14871036pac.135.1444982410466;
	Fri, 16 Oct 2015 01:00:10 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 01:00:01 -0700
Message-Id: <1873ae8e416729e91cded9e667b42cb53d6c8783.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 7/9] libtirpc: Fix a bug exposed by uclibc
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:10 -0000

to have va_list we need to include stdarg.h no matter what
but it was latent since with glibc it was getting pull in silently
via other headers

Change-Id: Ie5f1af4c1374fa525647fcb3ae936ec525a99da1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libtirpc/libtirpc/va_list.patch | 18 ++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb      |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/va_list.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/va_list.patch b/meta/recipes-extended/libtirpc/libtirpc/va_list.patch
new file mode 100644
index 0000000..855d15b
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/va_list.patch
@@ -0,0 +1,18 @@
+This patch is fixing build with uclibc where compiler ( gcc5 ) says it cant find va_list
+the patch is right for upstreaming as well
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libtirpc-0.2.5/src/debug.h
+===================================================================
+--- libtirpc-0.2.5.orig/src/debug.h
++++ libtirpc-0.2.5/src/debug.h
+@@ -22,6 +22,7 @@
+ #ifndef _DEBUG_H
+ #define _DEBUG_H
+ #include <syslog.h>
++#include <stdarg.h>
+ 
+ extern int libtirpc_debug_level;
+ extern int  log_stderr;
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
index 3edf002..330b829 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
@@ -15,7 +15,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            file://libtirpc-0.2.1-fortify.patch \
           "
 
-SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
+SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch \
+                               file://va_list.patch \
+                             "
 
 SRC_URI[libtirpc.md5sum] = "8cd41a5ef5a9b50d0fb6abb98af15368"
 SRC_URI[libtirpc.sha256sum] = "62f9de7c2c8686c568757730e1fef66502a0e00d6cacf33546d0267984e002db"
-- 
2.6.1


