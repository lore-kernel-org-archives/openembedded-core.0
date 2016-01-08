Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id BEF1876E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:55 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id e32so258875423qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=iAze4PkwcDejaD7r/lPQoCOyiyFOtjwpJU3Fb9iQGVA=;
	b=KcPXhq3vz/vz+TV+MqjsI6GuogYF0ki139fYGvGpTTnCAIZpA0ENOXNo0sQS1Ng3LS
	mzTAuu4tbC4gQAJRDdBdJbhVnBq02NH3joBejgfbTsnYBDRsZlqJBhGUcbOBJY7cg70d
	ci0M7F+4fB1LlWK9f9HpnfQWVokhD77h4vodQgRytVgOlpy3DDu02nuTgkX5EQZjb8KT
	WwJo5C9II64kTfL5YuJ4IWoQHXtFcr1BJE3sowJjHRFW/OyxjEwvPpFuoHcWxuftUR62
	KBDT9CDh18Sq1T8ADWhBOQ1y76mEnuGfugjeZO+DmJv4AiGETzwrisjWtWg0XpqfpB6b
	un4w==
X-Received: by 10.140.219.136 with SMTP id p130mr151014331qhb.80.1452248396630;
	Fri, 08 Jan 2016 02:19:56 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:11 +0000
Message-Id: <f62faf89dca98d5c730612b45a467991ed30bd79.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 43/53] iputils: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-header-inclusion-for-musl.patch | 92 ++++++++++++++++++++++
 meta/recipes-extended/iputils/iputils_s20121221.bb |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch

diff --git a/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch b/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
new file mode 100644
index 0000000..20ef07e
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
@@ -0,0 +1,92 @@
+From be0bb81d72fea4d20da74f4f2236aa145684f332 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Jan 2016 14:14:22 -0800
+Subject: [PATCH] Fix header inclusion for musl
+
+Fix errors e.g.
+
+In file included from tracepath.c:17:0:
+/usr/include/linux/errqueue.h:33:18:
+error: array type has incomplete element type 'struct timespec'
+  struct timespec ts[3];
+                  ^
+tracepath.c: In function 'main':
+tracepath.c:329:16: error: 'INT_MAX' undeclared (first use in this
+function)
+      overhead, INT_MAX);
+                ^
+tracepath.c:329:16: note: each undeclared identifier is reported only
+once for each function it appears in
+Makefile:131: recipe for target 'tracepath.o' failed
+make: *** [tracepath.o] Error 1
+
+ping_common.c: In function 'main_loop':
+ping_common.c:756:15: error: 'HZ' undeclared (first use in this
+function)
+    if (1000 % HZ == 0 ? next <= 1000 / HZ : (next < INT_MAX / HZ &&
+next * HZ <= 1000)) {
+
+protocols/timed.h is not needed and is absent in musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ clockdiff.c   | 1 -
+ ping_common.c | 1 +
+ tracepath.c   | 2 ++
+ tracepath6.c  | 1 +
+ 4 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/clockdiff.c b/clockdiff.c
+index 7c1ea1b..1d6341e 100644
+--- a/clockdiff.c
++++ b/clockdiff.c
+@@ -14,7 +14,6 @@
+ #include <netinet/ip.h>
+ #include <netinet/ip_icmp.h>
+ #define TSPTYPES
+-#include <protocols/timed.h>
+ #include <fcntl.h>
+ #include <netdb.h>
+ #include <arpa/inet.h>
+diff --git a/ping_common.c b/ping_common.c
+index 7f82851..3ce699d 100644
+--- a/ping_common.c
++++ b/ping_common.c
+@@ -2,6 +2,7 @@
+ #include <ctype.h>
+ #include <sched.h>
+ #include <math.h>
++#include <asm-generic/param.h>
+ 
+ int options;
+ 
+diff --git a/tracepath.c b/tracepath.c
+index 89e6d16..c9d6ddd 100644
+--- a/tracepath.c
++++ b/tracepath.c
+@@ -12,6 +12,8 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
++#include <limits.h>
++#include <time.h>
+ #include <sys/socket.h>
+ #include <linux/types.h>
+ #include <linux/errqueue.h>
+diff --git a/tracepath6.c b/tracepath6.c
+index 126fadf..9d5745c 100644
+--- a/tracepath6.c
++++ b/tracepath6.c
+@@ -12,6 +12,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
++#include <limits.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <netinet/icmp6.h>
+-- 
+2.6.4
+
diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index 49913d6..225c28b 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/targets.diff \
            file://nsgmls-path-fix.patch \
            file://fix-build-command-line-argument-with-gnutls.patch \
+           file://0001-Fix-header-inclusion-for-musl.patch \
           "
 
 SRC_URI[md5sum] = "6072aef64205720dd1893b375e184171"
-- 
2.7.0


