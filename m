Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 26FB8731A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 08:36:13 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id y89so6628878qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 00:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AAtZz05wr/8CbGQkRVsWWlfNdSLOIy5Zv2FTCm5PwMY=;
	b=DKeXF9S3jzndiLUoHok0A/ZOEsmOCE32sNdFDDzq0FxH6FJlKzCMG0Li0OEZsaMffV
	gg2ZdyB3VtiZJ8Zv6JcgPXGYlrwBMFOKQUBjpn9sB9do8CyCL3hTbvylYxnpMCGsJfHB
	XtF8k/XDeZl2yioPY4ir+SsR2LEZseE6vmNSSMhfttiMLbCiDH4j1e2jVK1voF5uAeV9
	8DTWNEOSNDetHkUdGf6gxrhRN6kEDgGSTzPeun/ga7WgqMtesOIp9qqnHtdh03dMWw6O
	UZ4QU6x/usqjfOyqBQ/Cgt9q8tW80hkhkjI4VQC667XwPMwnKDydNtRGVD36mxzFBnaI
	LFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AAtZz05wr/8CbGQkRVsWWlfNdSLOIy5Zv2FTCm5PwMY=;
	b=EGoOb4jKFkGLzj8LosQzMD7NWzAFUh3c62ROe6FD5qwWzonemvPpk/5cseHS96Unbs
	ZcEyWmwa2qG3YsoAbdpYmlyxqVWEEPCKRj/NoCwte6NMzxnmeyHlEH+MV1OJmmV6Abx9
	nYGXPw/hTRUBiQjKfle573snxjqoIbOlUE2qdFI+QfZ8+PnseSFeEK6kEzdTyKnh8yxd
	ScyM9aEqVAsEkMPPIUTyfSiEnHfDFrpz+rtCSa3cDPZPjIn6hEr6EVtYeNvBnofIFZZS
	r/UrtzAWHyuIqvWoX2+uI5dPtaJFfv/G4F4ARkt6qD0/DAb72O5HNODa1HgJCD8sXMD2
	ltew==
X-Gm-Message-State: AG10YOR0e6tVXu+OUIKNUPhSi+3VE0eme6HyqkLURICb5rHLMinoDLxYTP/x4mD/nPjjXA==
X-Received: by 10.140.105.198 with SMTP id c64mr336129qgf.94.1455698174362;
	Wed, 17 Feb 2016 00:36:14 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id y129sm84720qka.33.2016.02.17.00.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 00:36:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 08:36:06 +0000
Message-Id: <1455698167-7581-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] pseudo: Fix build when security flags are enabled
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
X-List-Received-Date: Wed, 17 Feb 2016 08:36:14 -0000

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


