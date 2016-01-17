Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF7776BD7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:36 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id yy13so325930238pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=UrYCldNaAnlInioMyFmzp8G9UHOSki0Evv+nwMmOZtQ=;
	b=BXtwgsUh/qf1bkeNZKmMyUIPIVm8/53vdAPXzqlb0//ZmlGvs/5Y33j/FHcXepoowh
	0myz4UONv7xXneWRKw5oqpwS2Qi68P6yIaJIwycAcotdyByvTLeXqyVngLi7VPL6iUAB
	vxwijMVJ/oudE4mIKj3LeRG5BNPEhVBygA3L3c5mFaToBmNABztWLgMzlX4wYN+tIvYX
	RP2yYqdQZ8gj4IcGms1Bd6Jc55/GBVXpTg0EOCEu41Z1Enq06eLuVCMKldY3Kn7QEULZ
	aEJ1+w/DO5H0sqEiqTHj/qHYvRMuK1bsH6oTzNHDxVdE2YH9LGdZ5EOS/UkZjqAXj2Zq
	OvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=UrYCldNaAnlInioMyFmzp8G9UHOSki0Evv+nwMmOZtQ=;
	b=lu9oezk7gztROzsCEYcTiom6N3+GTZ17Tv9az5BwDL9pTLJvFWezpviLPHcUaZ52Jp
	bvmjTuwtx/a07ZkCM4pKsVsrufjH6E97+N6RoFYlYiQBroYRYWILYiq25vYphQQOp0ep
	NR4fX6O1feoq0ArQcQpsBWn/j8K/evYx6Sg/MzTV951OAWdzzqjU0FLB7+pTlRbMDd2i
	IePnJ6NpIYy1Ulwk/Egi4H+O+wE2G0lcVTBsEEt3xGOSMo7jvw9qemyqU1NWlIHAP+V3
	0AVc/eJjRJlM0QcYBudmG2Bpki8cl25mHb6wQGw+7uCOj0Jp9kzCiCQ1t5Vntq5abFwX
	nAlA==
X-Gm-Message-State: ALoCoQn0z6YciTlS0JBPtmSCrGXqB36/ABKSuBf1yTzNoLIs6kqWxUydPaGoNMkO72mi1OAyzWCl7Q4Eu29sSKKBIMp+IWKe7Q==
X-Received: by 10.66.234.226 with SMTP id uh2mr28484342pac.20.1453030655025;
	Sun, 17 Jan 2016 03:37:35 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:11 -0800
Message-Id: <c302d51624af799cf482e51df5b68063940d26a3.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 38/73] iputils: Use member based initialization for mrghdr struct
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:36 -0000

Fix build with musl

uclibc and glibc dont agree on structure of the struct, musl rightly
adds padding elements, so when doing anonymous initialization struct
elements gets wrongly mapped on 64bit arches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-header-inclusion-for-musl.patch | 92 ++++++++++++++++++++++
 .../0001-Intialize-struct-elements-by-name.patch   | 52 ++++++++++++
 meta/recipes-extended/iputils/iputils_s20151218.bb |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
 create mode 100644 meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch

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
diff --git a/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch b/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
new file mode 100644
index 0000000..6da01dc
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
@@ -0,0 +1,52 @@
+From 000629f74908a2a95f6104444c77ad93cf40d62d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 08:50:50 +0000
+Subject: [PATCH] Intialize struct elements by name
+
+makes it portable across glibc and musl
+
+Fixes errors
+
+| ping.c: In function 'send_probe':
+| ping.c:735:19: warning: initialization makes integer from pointer
+without a cast [-Wint-conversion]
+|           &iov, 1, &cmsg, 0, 0 };
+|                    ^
+| ping.c:735:19: note: (near initialization for 'm.__pad1')
+| ping.c:735:19: error: initializer element is not computable at load
+time
+| ping.c:735:19: note: (near initialization for 'm.__pad1')
+| make: *** [ping.o] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ ping.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/ping.c b/ping.c
+index 4989760..e67f381 100644
+--- a/ping.c
++++ b/ping.c
+@@ -731,8 +731,15 @@ int send_probe()
+ 
+ 	do {
+ 		static struct iovec iov = {outpack, 0};
+-		static struct msghdr m = { &whereto, sizeof(whereto),
+-						   &iov, 1, &cmsg, 0, 0 };
++		static struct msghdr m = {
++			.msg_name = &whereto,
++			.msg_namelen = sizeof(whereto),
++			.msg_iov = &iov,
++			.msg_iovlen = 1,
++			.msg_control = &cmsg,
++			.msg_controllen = 0,
++			.msg_flags= 0,
++		};
+ 		m.msg_controllen = cmsg_len;
+ 		iov.iov_len = cc;
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/iputils/iputils_s20151218.bb b/meta/recipes-extended/iputils/iputils_s20151218.bb
index 4c3523d..62c3c81 100644
--- a/meta/recipes-extended/iputils/iputils_s20151218.bb
+++ b/meta/recipes-extended/iputils/iputils_s20151218.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/use_gethostbyname2.diff \
            file://debian/targets.diff \
            file://nsgmls-path-fix.patch \
+           file://0001-Fix-header-inclusion-for-musl.patch \
+           file://0001-Intialize-struct-elements-by-name.patch \
           "
 
 SRC_URI[md5sum] = "8aaa7395f27dff9f57ae016d4bc753ce"
-- 
2.7.0


