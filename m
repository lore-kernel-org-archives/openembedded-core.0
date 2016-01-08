Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 068E176E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:54 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id r67so1593406qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=e6bmdsCBhlfY4aCDt/77ilwPVATNk844areEKxTCLxc=;
	b=zdG3Yiee1mGaociccx1SoyFz5MdqbXT+qFSNkvvyDbZ8MVM/5zSO18LXLBBfvlDRhY
	KYzrL9VrGv4SHRC/MIsp5dClDCVOQaFPJ9ydlljn6ABWVP3TUTYVvOAKxH/FfrSwu3dE
	iraa+YS5B1o3M1tq+pWSzlGFBLfrDgwYNqGmoTgPeQnCfN9zVORd1uEVvP7Fs4EyujJo
	2PtT0ucu1iOPSPrf9DpimzbG2VbdYIdNziUM30yZfEJUpf3FTMqZfAm+bXce52Sad1hT
	dN4wV7N2MWF5ouC6JG5f46PHYuMk9b3bVtO3mEAvXHdvgAIIpKC2PlA/hD4TVDEEUcmx
	oV6w==
X-Received: by 10.55.20.75 with SMTP id e72mr74126236qkh.72.1452248395307;
	Fri, 08 Jan 2016 02:19:55 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:09 +0000
Message-Id: <6ec05639193a3835ceab4172e75df52a0f129740.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 41/53] net-tools: Fix build on musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../net-tools/net-tools/musl-fixes.patch           | 100 +++++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb                 |   1 +
 2 files changed, 101 insertions(+)
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
index 04ea76f..79c7291 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://net-tools-config.h \
            file://net-tools-config.make \
            file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
+           file://musl-fixes.patch \
 	   "
 
 # for this package we're mostly interested in tracking debian patches,
-- 
2.7.0


