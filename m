Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 144107724C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 08:07:34 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id o6so39775352qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 00:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AAtZz05wr/8CbGQkRVsWWlfNdSLOIy5Zv2FTCm5PwMY=;
	b=NfA1HZc5B/Zm2rCM/wTrIuxvQpS3e0TXWaTJIzfkUj6xx7IS3i1ekHWTV3JMK0ClCg
	Tz0Ob/rHjXQsXBbZXWSq4wZS8q1tJQmgJcQO84fLN4bWLz3bJmZYcqiOQDuoer/zUgLf
	wgVSEswTaa8nRPjKx80afY8U/bCJKZZwvvb0bzv+0WsGbDkbw+E9XlRTm+ifXFkNpBnP
	VjIon9TKR3h1GAsULp0vE3jYgxB0RgiYAlUOEqWpyXoVvPOpJ/XpJg1ReI96Z4BHLdjI
	z0meNe3FBGCgPh8EAB5TJtX4Slp8ookcKFpKcU9AE6IuYuB50x4lw6ZYuzbgHCTKV66G
	8zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=AAtZz05wr/8CbGQkRVsWWlfNdSLOIy5Zv2FTCm5PwMY=;
	b=WkxgcOdYoYwZDYDpX1rpBaW0GP4pZB/cng8208lhDHxs5gzH4zCNwHkhfu6n1+Shim
	T6KRXxgK+/WeZlWcrhsP6q/lo5g/NpxJdiZSaE1N9rpDjjfAasUzEjDaiWYze/AMJJBA
	BEaNE3f9IRyNHKP/ad6HK/FKUiHtUNQLuFVGv4eFOhnVNS11EBYrRsBCKtuuEX3IAqlu
	0MmbtPJm5v2+2BXoNAM/xrh9jkZdIHFIxefRNisWi186HeSFCBLAKvLPuULqzBJFGAlb
	AWg4KH45PVY5ANQE3sKK6AiDTKi+srIFTEAh8qz2uGiHDMbnGRv+R3SILVKOU8tM888m
	Krcw==
X-Gm-Message-State: AG10YOQs52d4685zlTjrQCzHxC0LTZxwFUXKPvCZ66RxHCEYIAAy2G/ggdio+X8mR8cuLA==
X-Received: by 10.55.79.207 with SMTP id d198mr21139609qkb.49.1455955655419;
	Sat, 20 Feb 2016 00:07:35 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	n48sm2579937qgd.38.2016.02.20.00.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 00:07:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Feb 2016 08:07:26 +0000
Message-Id: <0608d144a7e1a2e0aa391afc41a5343c5775b29c.1455955403.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
References: <f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455955403.git.raj.khem@gmail.com>
References: <cover.1455955403.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] pseudo: Fix build when security flags are enabled
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
X-List-Received-Date: Sat, 20 Feb 2016 08:07:35 -0000

filter out PIE options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-configure-Prune-PIE-flags.patch     | 44 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch b/meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
new file mode 100644
index 0000000..43504ea
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
@@ -0,0 +1,44 @@
+From b5545c08e6c674c49aef14b47a56a3e92df4d2a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 Feb 2016 07:36:34 +0000
+Subject: [pseudo][PATCH] configure: Prune PIE flags
+
+LDFLAGS are not taken from environment and CFLAGS is used for LDFLAGS
+however when using security options -fpie and -pie options are coming
+as part of ARCH_FLAGS and they get into LDFLAGS of shared objects as
+well so we end up with conflicting options -shared -pie, which gold
+rejects outright and bfd linker lets the one appearning last in cmdline
+take effect. This create quite a unpleasant situation in OE when
+security flags are enabled and gold or not-gold options are used
+it errors out but errors are not same.
+
+Anyway, with this patch we filter pie options from ARCH_FLAGS
+ouright and take control of generating PIC objects
+
+Helps with errors like
+
+| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: pseudo_client.o: relocation R_X86_64_PC32 against symbol `pseudo_util_debug_flags' can not be used when making a shared object; recompile with -fPIC
+| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: final link failed: Bad value
+| collect2: error: ld returned 1 exit status
+| make: *** [lib/pseudo/lib64/libpseudo.so] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index e5ef9ce..83b0890 100755
+--- a/configure
++++ b/configure
+@@ -339,3 +339,5 @@ sed -e '
+   s,@ARCH@,'"$opt_arch"',g
+   s,@BITS@,'"$opt_bits"',g
+ ' < Makefile.in > Makefile
++
++sed -i -e 's/\-[f]*pie//g' Makefile
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
index 195a508..88bd1f5 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = " \
     http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
+    file://0001-configure-Prune-PIE-flags.patch \
     file://fallback-passwd \
     file://fallback-group \
 "
-- 
1.8.3.1


