Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RvPOl-0007u8-8F
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 09:30:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q198MUTd014731
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2012 00:22:30 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 9 Feb 2012 00:22:29 -0800
Message-ID: <92a87a54f47245d723727bd190c35323e66ad3ea.1328774359.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1328774359.git.xiaofeng.yan@windriver.com>
References: <cover.1328774359.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 9 Feb 2012 15:36:08 +0800
Date: Thu, 9 Feb 2012 16:05:11 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libx11-1.4.4: Add patch makekeys_crosscompile.patch
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
X-List-Received-Date: Thu, 09 Feb 2012 08:30:35 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

LSB 4.1 complain a host contamination error from libx11 because of absent
patch "makekeys_crosscompile.patch" from libx11-trim-1.4.4.

[YOCTO #1970]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../libx11-1.4.4/makekeys_crosscompile.patch       |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch
new file mode 100644
index 0000000..e5eacf0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch
@@ -0,0 +1,45 @@
+Because the size of "unsigned long" is different between 32-bit
+and 64-bit, judge whether target is 32-bit or 64-bit and tell
+"makekey". 
+
+Upstream-Status: Pending
+
+Signed-off-by: dbuitenh@windriver.com
+
+--- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
++++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
+@@ -33,6 +33,7 @@
+ #include <X11/keysymdef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ 
+ typedef unsigned long Signature;
+ 
+@@ -124,7 +125,12 @@
+ 	    name = info[i].name;
+ 	    sig = 0;
+ 	    while ((c = *name++))
+-		sig = (sig << 1) + c;
++#ifdef USE32
++		sig = (uint32_t)(sig << 1) + c;
++#else
++		sig = (uint64_t)(sig << 1) + c;
++#endif
++		
+ 	    first = j = sig % z;
+ 	    for (k = 0; tab[j]; k++) {
+ 		j += first + 1;
+@@ -163,7 +169,11 @@
+ 	name = info[i].name;
+ 	sig = 0;
+ 	while ((c = *name++))
+-	    sig = (sig << 1) + c;
++#ifdef USE32
++	    sig = (uint32_t)(sig << 1) + c;
++#else
++	    sig = (uint64_t)(sig << 1) + c;
++#endif
+ 	first = j = sig % z;
+ 	while (offsets[j]) {
+ 	    j += first + 1;
-- 
1.7.0.4



