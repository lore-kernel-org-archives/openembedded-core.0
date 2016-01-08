Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 20A5A7705D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:52 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id b35so218714774qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rcg1WeisGPNTF9TdNP+mIfx7vhL5vqCMSyX7OvXk69I=;
	b=kBrXXfwvGtkG9iayZjbbO+HQ1hRDt8iQx3g+dOEI0L/fTUqY+GTWOAeomm1oPyRIxg
	02tLgs5daihjWMTOJ+eqn4pkZrg1HyK47qrGHV+yiR2+6uM+PUfctSWjFfgMrTSTXT/7
	SCFkeZIaaksa2iUJo7Vs5g2ut6a3WhqKQcKBslZ5QC7Z7BpgsXGmOOyJ+kwSQFGQNnBg
	ivEL7LhTdq7FzTvtAGBgYzpvFDJZMj/zClS2snJ4ugqeqrgYBpoDCbqe17QsQk+GgBJP
	yUVMTJBTaVq+BOIDWUlpnHGDHWri/yJbKmqfEokxKUqrxLuUuQegXe0RvDCYnVMi1Fmm
	5Vkw==
X-Received: by 10.140.247.67 with SMTP id s64mr153495419qhc.20.1452248393342; 
	Fri, 08 Jan 2016 02:19:53 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:06 +0000
Message-Id: <a251e465e6236a6763cc112e2352156837412fa7.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 38/53] rt-tests: Fix build with non-gcc compilers
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:53 -0000

Makery hard sets CC to be some form of gcc, make it set only if CC
variable is absent in environment.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-CC-AR-variable-only-if-it-doesn-t-have-.patch | 30 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_0.96.bb          |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
new file mode 100644
index 0000000..00fcc7d
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
@@ -0,0 +1,30 @@
+From 9640dde4241e1314b8e8ea35b0c8dab0b30ae51f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Jan 2016 10:50:56 -0800
+Subject: [PATCH] Makefile: Set CC/AR variable only if it doesn't have a value
+
+This helps it compile with clang or any other compilers besides gcc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1e4b7d1..2c2d396 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 0.96
+-CC=$(CROSS_COMPILE)gcc
+-AR=$(CROSS_COMPILE)ar
++CC?=$(CROSS_COMPILE)gcc
++AR?=$(CROSS_COMPILE)ar
+ 
+ OBJDIR = bld
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.96.bb b/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
index 7d70392..2f96fea 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 require rt-tests.inc
 inherit ptest
 
-SRC_URI += "file://run-ptest \
+SRC_URI += "file://0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch \
+            file://run-ptest \
             file://rt_bmark.py \
            "
 # Do not install hwlatdetect
-- 
2.7.0


