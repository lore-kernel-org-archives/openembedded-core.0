Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2E80E7326D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:39:17 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 65so47586409pff.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=APMou1BJezD42fdaVxTMgd+sQnhOLAzLOanQ3fvGhJ0=;
	b=l4gYM6d1aqQI38AgGb5U5c3ZXRaFVCJ8xp4OGxePYLtyxMExvDF9RRPcu12kl8lo7V
	cypEjpw7xhfmwk5ZD+oczSxBEuU5UOyBRUmUePNohhgGZWLo+VlPV1cVS8QF0ehoxuJ6
	4OtxXqqdWtLoW2A4NGmMaMz+jPgGHkkcJlMm41YQ/TkMHjar+FYadEgCxgt6mJz33dDP
	HhfejPhj/UjbBLb14p5ynn4UJ5PwEpnLfkcGVlX+VyJd52Yb0v20c4qGRTdIfBIteoGC
	SX6P27vAGJSO/UTXph3aRywwoTmAa37B++oea9shW2pM2SSB5qXf/AHSjHRy1DLS25os
	WQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=APMou1BJezD42fdaVxTMgd+sQnhOLAzLOanQ3fvGhJ0=;
	b=Mz7AEnTTu50Po4Si+rGADZ/uRqAvhz3HwOnzGgJAvda2cOUH/amtT8C8GPUagzgylv
	GQydfUZr9/5yl3O4Uj6Ly6f7SxHPNH/omn1g5srDUIRa8k0Nbv6eOkvFfSz/BS9SMQRF
	0QxWfofAxaeu4JkshGBuOvtM+H1LuPWZ5O/3yTxwaWaMg9M0ImdPeqW0twV67O630qks
	xiO4ZSAXAia99/NomdCugboVPOBjlWrs3XxzEe+prEMSmsPG7sVFVnZd+j/z5iCzu4xL
	4CRI9dt/oKhjpcQ1POSmMi8eOrACGa638qS2T83Ba9LhymvzVkrByZzQh1HgkN53MlLx
	Aj2w==
X-Gm-Message-State: AG10YOQCu7NAxBhZQJ2tf5OLMT31M7Ogaa72kAi+IdM11Ae3Uu7QaSbS1UtOMLFZb1Ln2Q==
X-Received: by 10.98.89.73 with SMTP id n70mr7373647pfb.68.1453495158641;
	Fri, 22 Jan 2016 12:39:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	o4sm11597451pfa.85.2016.01.22.12.39.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 12:39:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 12:39:08 -0800
Message-Id: <1453495148-4049-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: backport upstream truncate open mode fix
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
X-List-Received-Date: Fri, 22 Jan 2016 20:39:20 -0000

  https://git.busybox.net/busybox/commit/?h=1_24_stable&id=be729c1d3b5c923f10871dd68ea94156d0f8c803

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../busybox-1.24.1-truncate-open-mode.patch        | 81 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch b/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
new file mode 100644
index 0000000..cdc9108
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
@@ -0,0 +1,81 @@
+Upstream-Status: Backport
+
+  http://busybox.net/downloads/fixes-1.24.1/
+  https://git.busybox.net/busybox/commit/?id=e111a1640494fe87fc913f94fae3bb805de0fc99
+  https://git.busybox.net/busybox/commit/?h=1_24_stable&id=be729c1d3b5c923f10871dd68ea94156d0f8c803
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+From be729c1d3b5c923f10871dd68ea94156d0f8c803 Mon Sep 17 00:00:00 2001
+From: Ari Sundholm <ari@tuxera.com>
+Date: Mon, 4 Jan 2016 15:40:37 +0200
+Subject: [PATCH] truncate: always set mode when opening file to avoid fortify
+ errors
+
+Busybox crashes due to no mode being given when opening:
+$ ./busybox truncate -s 1M foo
+*** invalid open64 call: O_CREAT without mode ***: ./busybox terminated
+======= Backtrace: =========
+/lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x7f66d921338f]
+/lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x7f66d92aac9c]
+/lib/x86_64-linux-gnu/libc.so.6(+0xeb6aa)[0x7f66d928b6aa]
+./busybox[0x4899f9]
+======= Memory map: ========
+00400000-004d0000 r-xp 00000000 00:1a 137559                             /home/ari/busybox/busybox
+006cf000-006d0000 r--p 000cf000 00:1a 137559                             /home/ari/busybox/busybox
+006d0000-006d1000 rw-p 000d0000 00:1a 137559                             /home/ari/busybox/busybox
+006d1000-006d4000 rw-p 00000000 00:00 0
+014e7000-01508000 rw-p 00000000 00:00 0                                  [heap]
+7f66d8f8a000-7f66d8fa0000 r-xp 00000000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
+7f66d8fa0000-7f66d919f000 ---p 00016000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
+7f66d919f000-7f66d91a0000 rw-p 00015000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
+7f66d91a0000-7f66d935b000 r-xp 00000000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
+7f66d935b000-7f66d955a000 ---p 001bb000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
+7f66d955a000-7f66d955e000 r--p 001ba000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
+7f66d955e000-7f66d9560000 rw-p 001be000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
+7f66d9560000-7f66d9565000 rw-p 00000000 00:00 0
+7f66d9565000-7f66d966a000 r-xp 00000000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
+7f66d966a000-7f66d9869000 ---p 00105000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
+7f66d9869000-7f66d986a000 r--p 00104000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
+7f66d986a000-7f66d986b000 rw-p 00105000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
+7f66d986b000-7f66d988e000 r-xp 00000000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
+7f66d9a64000-7f66d9a67000 rw-p 00000000 00:00 0
+7f66d9a8a000-7f66d9a8d000 rw-p 00000000 00:00 0
+7f66d9a8d000-7f66d9a8e000 r--p 00022000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
+7f66d9a8e000-7f66d9a8f000 rw-p 00023000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
+7f66d9a8f000-7f66d9a90000 rw-p 00000000 00:00 0
+7ffc47761000-7ffc47782000 rw-p 00000000 00:00 0                          [stack]
+7ffc477ab000-7ffc477ad000 r-xp 00000000 00:00 0                          [vdso]
+ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
+Aborted (core dumped)
+$
+
+Fix this by simply always setting the mode, as it doesn't hurt even
+when O_CREAT is not specified.
+
+This bug is a regression introduced in fc3e40e, as xopen(), which
+was originally used, would automatically set the mode.
+
+Signed-off-by: Ari Sundholm <ari@tuxera.com>
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+(cherry picked from commit e111a1640494fe87fc913f94fae3bb805de0fc99)
+---
+ coreutils/truncate.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coreutils/truncate.c b/coreutils/truncate.c
+index e5fa656..4c997bf 100644
+--- a/coreutils/truncate.c
++++ b/coreutils/truncate.c
+@@ -64,7 +64,7 @@ int truncate_main(int argc UNUSED_PARAM, char **argv)
+ 
+ 	argv += optind;
+ 	while (*argv) {
+-		int fd = open(*argv, flags);
++		int fd = open(*argv, flags, 0666);
+ 		if (fd < 0) {
+ 			if (errno != ENOENT || !(opts & OPT_NOCREATE)) {
+ 				bb_perror_msg("%s: open", *argv);
+-- 
+2.6.2
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 5e19d9c..12eb989 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-Passthrough-r-to-linker.patch \
            file://busybox-1.24.1-unzip.patch \
            file://busybox-1.24.1-unzip-regression.patch \
+           file://busybox-1.24.1-truncate-open-mode.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
1.9.1


