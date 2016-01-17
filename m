Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 41DF6731BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:18 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n128so142173920pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O5Cyfhvc+rZQJ6B3pnZ1ixiCfU+XzjakZalFIReG0bQ=;
	b=l1yeX8vkvBRZqgWZfvNn086LgQIfo6GNrCU9rGr9ldziAHrcQMeEv+5yTDjl8R0DJt
	L9QCt74seuYe/a3kw0nqnqs0oOBSMpxEBbumUBXPw2XGjBEcLruHNWw7ZJPvjy1emZfk
	FPulbEEHNaBewGGy3xdgR5zTifJ2nELyojHbIqoXDv1XOJ3C+VNZggOAlE0BDeFAkfJ8
	zIoCjkR4sQhkduLiAzMRv6yW5MeY2GN/phG4TqYwkTGY34P5dc9iaeTXtpyCiZ33Cs1R
	yLYJgF5GSn/PQMzMs08NhfoNW7HnYLn7bM1RAp3w1DA8wQykMVFYuOO+lh5QOtDOXRwW
	sjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=O5Cyfhvc+rZQJ6B3pnZ1ixiCfU+XzjakZalFIReG0bQ=;
	b=LMrz3CjFlTwhI2y/ZGReyQPymqc7P0gHU6l5rZvY94oSePivXyJr56iTNy+GCR1m/j
	TsfJBQjcbLvfVboTTCDq5iw1uf6u3b7HBLMnuUbl7G1F/5JQE0V5SOpzs5AyLoAFC8wy
	9ZPA9v0iQafPvUwM0HOAcwPKpE/lsZ+elYLGmacbEawGgCSIQyOiSM0FeIGjHOqsM2a1
	vtRLzC+1P1GVzpBT+BM/VFc/z8oMdvQXKVEf2ss8PVTW2rouY+A2TZttSlPPq8lu1X1s
	tGPPp9mFWmazJ93We0lAXcFwUxuIxBs+EFvjAy8GjT6bZQaK3kz5VnnDLdWJkLpJHGb4
	Q3yw==
X-Gm-Message-State: ALoCoQm/7GcGs3XAheTESic8LWZ/+1AqDFgjJx8L/TWLBRDXFwxiyI/Gh7ciTk3s3WXL61L8MUJMKW0xSCnX4vjc7+t/cuBwZA==
X-Received: by 10.98.18.145 with SMTP id 17mr28822657pfs.103.1453030639899;
	Sun, 17 Jan 2016 03:37:19 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:54 -0800
Message-Id: <64d7a9aa86c39b7bdaa1ae035f33a3cee3117d4f.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 21/73] net-tools: Link with libintl on uclibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:19 -0000

libintl is needed explicitly on linker cmdline on uclibc since the APIs
are not in libc itelf.

Fix build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../net-tools/net-tools/musl-fixes.patch           | 100 +++++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb                 |   3 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/musl-fixes.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/musl-fixes.patch b/meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
new file mode 100644
index 0000000..f694d59
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
@@ -0,0 +1,100 @@
+Adjust headers for non-glibc cases
+especially exposed by musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: net-tools-1.60/lib/inet6_gr.c
+===================================================================
+--- net-tools-1.60.orig/lib/inet6_gr.c
++++ net-tools-1.60/lib/inet6_gr.c
+@@ -23,7 +23,7 @@
+ #include <string.h>
+ #include <stdio.h>
+ #include <unistd.h>
+-#ifndef __GLIBC__
++#ifdef HAVE_IPV6_ROUTE_H
+ #include <netinet6/ipv6_route.h>	/* glibc doesn't have this */
+ #endif
+ #include "version.h"
+Index: net-tools-1.60/lib/inet6_sr.c
+===================================================================
+--- net-tools-1.60.orig/lib/inet6_sr.c
++++ net-tools-1.60/lib/inet6_sr.c
+@@ -23,10 +23,10 @@
+ #include <string.h>
+ #include <stdio.h>
+ #include <unistd.h>
+-#ifdef __GLIBC__
+-#include <net/route.h>
+-#else
++#ifdef HAVE_IPV6_ROUTE_H
+ #include <netinet6/ipv6_route.h>	/* glibc does not have this */
++#else
++#include <net/route.h>
+ #endif
+ #include "version.h"
+ #include "net-support.h"
+Index: net-tools-1.60/lib/inet_sr.c
+===================================================================
+--- net-tools-1.60.orig/lib/inet_sr.c
++++ net-tools-1.60/lib/inet_sr.c
+@@ -26,6 +26,7 @@
+ #include <string.h>
+ #include <stdio.h>
+ #include <unistd.h>
++#include <asm-generic/param.h>
+ #include "version.h"
+ #include "net-support.h"
+ #include "pathnames.h"
+Index: net-tools-1.60/lib/util-ank.c
+===================================================================
+--- net-tools-1.60.orig/lib/util-ank.c
++++ net-tools-1.60/lib/util-ank.c
+@@ -14,6 +14,7 @@
+  * Rani Assaf <rani@magic.metawire.com> 980929:	resolve addresses
+  */
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+Index: net-tools-1.60/mii-tool.c
+===================================================================
+--- net-tools-1.60.orig/mii-tool.c
++++ net-tools-1.60/mii-tool.c
+@@ -47,10 +47,6 @@ static char Version[] = "$Id: mii-tool.c
+ #include <net/if.h>
+ #include <linux/sockios.h>
+ 
+-#ifndef __GLIBC__
+-#include <linux/if_arp.h>
+-#include <linux/if_ether.h>
+-#endif
+ #include "mii.h"
+ #include "version.h"
+ 
+Index: net-tools-1.60/netstat.c
+===================================================================
+--- net-tools-1.60.orig/netstat.c
++++ net-tools-1.60/netstat.c
+@@ -87,6 +87,7 @@
+ #include <dirent.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <asm-generic/param.h>
+ 
+ #include "net-support.h"
+ #include "pathnames.h"
+Index: net-tools-1.60/slattach.c
+===================================================================
+--- net-tools-1.60.orig/slattach.c
++++ net-tools-1.60/slattach.c
+@@ -44,6 +44,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <getopt.h>
++#include <termios.h>
+ #include <linux/if_slip.h>
+ 
+ #if defined(__GLIBC__)
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 923d048..79c7291 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://net-tools-config.h \
            file://net-tools-config.make \
            file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
+           file://musl-fixes.patch \
 	   "
 
 # for this package we're mostly interested in tracking debian patches,
@@ -30,7 +31,7 @@ SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e4
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
 
 inherit gettext
-
+LDFLAGS_append_libc-uclibc = " -lintl "
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
 
-- 
2.7.0


