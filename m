Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 815D162133
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:51:49 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id w104so4909537qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yQZU9LQnwULc3h06DozdQAGNtgi1juN9R8YcXfblXCY=;
	b=KKEnzOVsX6J45DNGM4bo0NAwsRCZiy9HOSWCOl8M4CoXaPha9OmKTdkxOoVLYYX83Z
	XnaZ570ZsT88PZfroiesh/9chkw0J0J427IZ74mbnzfQRTNvc2UrsZ0n3e/TYK+mal8D
	e2EP/9Tql0hiaoTwcmOO7NNY24ot+yuINy/q/DUQL8+4jLo+xqCcq/pIWmVmMqFonloA
	0mH4cnph/ouN58yB3gG+C4q5wtrRGDW7Y832YcyB9nqBScrsMjCG2HxHow4+3IC947qP
	we3SzoITP13tUTjnyCNzDz27v3VQBRgA2iJ9KYri3mQpCPbVfl7xBsGYNXFKQt4mnd28
	iCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yQZU9LQnwULc3h06DozdQAGNtgi1juN9R8YcXfblXCY=;
	b=VMnUILB4FTEb56Wt1wBsfP6GL1SvnrhAhUJPeBJ5Rd55nE7Xkq6HqCqKPpoA31p5Mv
	6OuChXn2UzETkU7T+74PTpnH1+iB3sngF48Xst3bQlJBPvlvb5QiNK8t6Bgavmjm8aJR
	kQGH4fvvyXDL3DpDe3D63+dUA70RzVFbcBbZhE0SBzx+u+rNyVrtw9rIdb7C52i2l5Su
	4kqsbWys1Y/nAarO5PcQgAN7ZAhounPm82gVxVwm7t/wOnUb8lRm2ZNKy0Cm8u18weE/
	VjDbAmp+o6GrcfJ0s9/sc95uINppOMomvd3Mh4bQZQMGUlByaiEXcNLQApxOq1EvQX4y
	BMkg==
X-Gm-Message-State: AD7BkJLTmLpyFJJ961dUB58psx58FqIUkknY+NoXT3a8gsheEL3na3b+FpAoPcNt07f8Yw==
X-Received: by 10.140.148.134 with SMTP id 128mr1340374qhu.98.1458715909709;
	Tue, 22 Mar 2016 23:51:49 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id b34sm478226qgb.31.2016.03.22.23.51.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 23:51:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 06:51:41 +0000
Message-Id: <1458715901-31788-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1458715901-31788-1-git-send-email-raj.khem@gmail.com>
References: <1458715901-31788-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] gdb: Fix build on mips64/musl
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
X-List-Received-Date: Wed, 23 Mar 2016 06:51:49 -0000

Define _ABIO32 if not already defined
heps in fixing gdb for mips64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 507f274..d9c864d 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -8,6 +8,7 @@ SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0001-include-sys-types.h-for-mode_t.patch \
             file://0001-use-asm-sgidefs.h.patch \
             file://force-readline-static.patch \
+            file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
new file mode 100644
index 0000000..3173952
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -0,0 +1,37 @@
+From e92f8932ef488de2a56db4299131ce6a4eb170bd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 23 Mar 2016 06:30:09 +0000
+Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
+
+This helps building gdb on mips64 on musl, since
+musl does not provide sgidefs.h this define is
+only defined when GCC is using o32 ABI, in that
+case gcc emits it as built-in define and hence
+it works ok for mips32
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gdb/mips-linux-nat.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index fd5c705..753f29d 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -46,6 +46,11 @@
+ #define PTRACE_GET_THREAD_AREA 25
+ #endif
+ 
++/* musl does not define and relies on compiler built-in macros for it   */
++#ifndef _ABIO32
++#define _ABIO32 1
++#endif
++
+ /* Assume that we have PTRACE_GETREGS et al. support.  If we do not,
+    we'll clear this and use PTRACE_PEEKUSER instead.  */
+ static int have_ptrace_regsets = 1;
+-- 
+1.8.3.1
+
-- 
1.8.3.1


