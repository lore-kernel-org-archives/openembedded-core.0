Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F36176067C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 08:01:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so9928253pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oR/Oz96PFWyNWFTOr62coCs5+IK/mRIbN5+kbZJzuFY=;
	b=B/KqJf1lWZ5E5UOb/1l+XgDPRC1tOlsZBO1h7W8lDLTca41fH8c5PmywQs12B6BsDS
	ry9NTn192o5o/nJUGctFtpf3xzy+5cOBaiUOqfZbqTNN65zyIH8XdWJYHPHatY0ESTtR
	TQ2QJ3TxKE8/lMyv8Mf2CL8G3FEIpa0s4C+TUnD5Morw225hpCdAucaPUM2PZYw5E2iz
	wuGtM1uZFt5sNLkQWxN0tuJlaqvxEpwVBH+EX8WLnK8+BYN8HGf39zJmPTOo3RiiOTcM
	S763w9TgDmo4U1an6hzY+xASRY1cZr7QcGKvQOa3lAw+HURNisrU7p8YYLzB5LHSideU
	zgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oR/Oz96PFWyNWFTOr62coCs5+IK/mRIbN5+kbZJzuFY=;
	b=aiA/MxntQSg0I1eODV/KgnAX4qjj3T3eoVMW06va6sx7Bzdw5xVOsi1I6TRV15gzdW
	3Ic6yl7/RjwS7xWR8ou2vRc1le4ydJt3Evcchg4ZQraul+VxdMfC2drJ1rxDaGyPeRnu
	qKQ9UM1lZmdw2RLuiceyo8yNZ/tlIQ6EDl4mLdls621EowPzRdYVuKB5dsSk4BHImNPi
	jBW9YcNHLlQNuDMF5e+/LLaxOqJdEey3kiHb2jrvPlodI9bvZqbz6VYK5ljKTtaCEJNX
	YRyV+JziYnpF+8lXhpvBo094BovT42GTD1PQEH+WuvXgoCsDd0fza212XeKhbVYL8ksa
	HAJg==
X-Gm-Message-State: ALyK8tLESgEtd6oHrlrLBgqWT8XtSs6xjr6OW230t8bzSMwvX4ls9qtap/U6Bgfz5QeMsg==
X-Received: by 10.98.59.77 with SMTP id i74mr16650773pfa.45.1468051263777;
	Sat, 09 Jul 2016 01:01:03 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id m78sm785822pfj.66.2016.07.09.01.01.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 01:01:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2016 01:00:54 -0700
Message-Id: <20160709080054.21811-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160709080054.21811-1-raj.khem@gmail.com>
References: <20160709080054.21811-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] piglit: Fix build on musl/arm
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
X-List-Received-Date: Sat, 09 Jul 2016 08:01:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-FE_UPWARD-only-if-its-defined-in-fenv.h.patch | 54 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
new file mode 100644
index 0000000..f851a92
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
@@ -0,0 +1,54 @@
+From 0fc2c2932699cfd68be96c820fddfdd79b48b788 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Jul 2016 07:52:19 +0000
+Subject: [PATCH] tests: Use FE_UPWARD only if its defined in fenv.h
+
+On ARM, musl does not define FE_* when arch does not have
+VFP, (which is right interpretation), therefore check if
+its defined before using it
+
+Fixes errors like
+
+tests/general/roundmode-pixelstore.c:82:19: error: 'FE_UPWARD' undeclared (first use in this function)
+  ret = fesetround(FE_UPWARD);
+                   ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tests/general/roundmode-getintegerv.c | 2 ++
+ tests/general/roundmode-pixelstore.c  | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/tests/general/roundmode-getintegerv.c b/tests/general/roundmode-getintegerv.c
+index 28ecfaf..5c27579 100644
+--- a/tests/general/roundmode-getintegerv.c
++++ b/tests/general/roundmode-getintegerv.c
+@@ -81,7 +81,9 @@ piglit_init(int argc, char **argv)
+ {
+ 	int ret;
+ 	bool pass = true;
++#ifdef FE_UPWARD
+ 	ret = fesetround(FE_UPWARD);
++#endif
+ 	if (ret != 0) {
+ 		printf("Couldn't set rounding mode\n");
+ 		piglit_report_result(PIGLIT_SKIP);
+diff --git a/tests/general/roundmode-pixelstore.c b/tests/general/roundmode-pixelstore.c
+index 9284f43..3fcb396 100644
+--- a/tests/general/roundmode-pixelstore.c
++++ b/tests/general/roundmode-pixelstore.c
+@@ -79,7 +79,9 @@ piglit_init(int argc, char **argv)
+ {
+ 	int ret;
+ 	bool pass = true;
++#ifdef FE_UPWARD
+ 	ret = fesetround(FE_UPWARD);
++#endif
+ 	if (ret != 0) {
+ 		printf("Couldn't set rounding mode\n");
+ 		piglit_report_result(PIGLIT_SKIP);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 607f236..fbe35ef 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -3,7 +3,9 @@ LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://anongit.freedesktop.org/piglit \
-           file://0001-tests-Fix-missing-include-of-Xutil.h.patch"
+           file://0001-tests-Fix-missing-include-of-Xutil.h.patch \
+           file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+"
 
 # From 2015-02-19
 SRCREV = "c4585427913e4cb28994b4bfb11d49778273aa2c"
-- 
2.9.0


