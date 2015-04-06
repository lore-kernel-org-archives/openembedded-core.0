Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 369FF73C3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:13 +0000 (UTC)
Received: by iebmp1 with SMTP id mp1so26705162ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k9O+N7TikP6I+CM5yBVRABnk80jqAo04cvz3S53TXpA=;
	b=XKN8DrCp/1nDcAIpcf+Hbhzt40jEWUXi0Azl/HIVz106zVJ1dOjcMDPbX8bFG63kBg
	GI9IMZVimpjttGHke3bPclEve08hMxw3UFuDVujLVyGHaqPLdcQlEH1WBwcH8TOW94lS
	oTbuv8Vx6kA4gKY6wwH0/WU0WWhf4FpeqSYyhZ4DgMYqiMkmQlDjAopXrmasxy/u6+97
	6icoYVXkQxTDOwGTexPRsqnibapajFmGzBTW6Zb+cO87gfrtyEJNrIlRUWDjjZiwgnmE
	R7wvKqQZ/aLJsAzl79xCXNAtC5DR0jiZCYQ4fQxJwke7oj7TTk7m3RFi0EQPSgHQpLxD
	vaQA==
X-Received: by 10.50.78.130 with SMTP id b2mr9589293igx.42.1428341834968;
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:48 +0000
Message-Id: <79f72df6132ea66a77b1b037507ad85c06575303.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 20/24] ofono: Disable backtrace for non-glibc libraries
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:15 -0000

It uses glibc backtrace() API which is not implemented
everywhere e.g. musl

Change-Id: I96380b994c27968542dba6dae220adfecaeda556
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cktrace-Disable-for-non-glibc-C-libraries.patch | 40 ++++++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.16.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch b/meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
new file mode 100644
index 0000000..306b6da
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
@@ -0,0 +1,40 @@
+From 2d729af0897d7d72b83d111876febf9e0eec1a68 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Apr 2015 20:50:56 -0700
+Subject: [PATCH] backtrace: Disable for non-glibc C libraries
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+---
+ src/log.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/log.c b/src/log.c
+index febc874..9db4ae7 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -30,7 +30,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <dlfcn.h>
+ 
+ #include "ofono.h"
+@@ -219,8 +221,9 @@ static void signal_handler(int signo)
+ {
+ 	ofono_error("Aborting (signal %d) [%s]", signo, program_exec);
+ 
++#ifdef __GLIBC__
+ 	print_backtrace(2);
+-
++#endif
+ 	exit(EXIT_FAILURE);
+ }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/ofono/ofono_1.16.bb b/meta/recipes-connectivity/ofono/ofono_1.16.bb
index 712fc5c..fbf13e5 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.16.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.16.bb
@@ -4,6 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
   file://Revert-test-Convert-to-Python-3.patch \
+  file://0001-backtrace-Disable-for-non-glibc-C-libraries.patch \
 "
 SRC_URI[md5sum] = "c31b5b55a1d68354bff771d3edf02829"
 SRC_URI[sha256sum] = "403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07"
-- 
2.1.4


