Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id AE4DD7886E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 22:41:20 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id w69so2743387pfd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 14:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=SPJyQCiAjwILAXrXYUGQlnk0GkW6IbS4LmAIxtFL+ss=;
	b=oUMrO5XJQ8YNd8wflQVn0VG2C8LbrX6LT07r3ho4FtebohsOExmPOsOM/se58VhZY2
	eEvGFzwlWyOMm2v5uU+c1t5XM2z0k05HPQ1L4Mdaj0rJzQDvQGiOMQd9+CKZBgjBV2F+
	vr+maQeadUoHFM//kT4xEDIQKjK4sFoUePPwHx5s95Qx9LqDUymm+1kTX0NSrEUeLyhF
	nSYyFjKtr3yPCcYByvnS9IbpJFjbRYWaLY2X4tCloBndNRdn0fkug1eh/tIUebqB7EEB
	QTlcQV78uzYs4u/ROAQi8exln0ogVCuwxB3b/YbMasvyUPCY9acoL+mMTv1K9p/ABxY2
	BChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=SPJyQCiAjwILAXrXYUGQlnk0GkW6IbS4LmAIxtFL+ss=;
	b=Zxij1Ih2fuivU7G6k8W/z6mtPkbWNimTmW02sh52xQJUPEIYhDeTMnOpuodINHiHrI
	8Q8E16+zXgTyavUG81QZUk3V+PdBvAoUrid8gkUIrOw0B4LwO1m3yUHdP4QPqSQ6mgCW
	ADH12xZnIEQx1RJiQqgsyLmNAzgd6dK9npu+PnsXlqHv6DeZXnJ4uePQGHb57lS2/ne0
	iv1fks44ieda/34opcHBZUpDAIg158j/u1dVomEGPW2bM4xnBWOT9PnF4uwxucy2YTmV
	LKczIi1kNvey68Tr8DUlvr/oNY7SkIDBdctGoY9TFDuK8de/OFDtGCG9QUyodgPUeS+0
	tAqQ==
X-Gm-Message-State: AKwxytcR/YtGRzg5HFt7EyQ7a9BUX1N6cjjndhZ9GEnbMwBba6HDYQW8
	bK/osGFxEg34sz6sqqHTj3p29w==
X-Google-Smtp-Source: AH8x227h8k8W4U7kclnqw2J69zWU76n9c3HnNqGDUUqXHKjQ0Igk/x4G+dISkklClDaKDhd3uCVQbg==
X-Received: by 10.99.95.4 with SMTP id t4mr28978783pgb.291.1517524881516;
	Thu, 01 Feb 2018 14:41:21 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::6dba])
	by smtp.gmail.com with ESMTPSA id p14sm452826pgu.7.2018.02.01.14.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 14:41:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:41:06 -0800
Message-Id: <1c844a236f9aa0aaa73a873b2a54f8defc95891e.1517524576.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
In-Reply-To: <cover.1517524576.git.raj.khem@gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] qemu: fix memfd_create with glibc 2.27
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
X-List-Received-Date: Thu, 01 Feb 2018 22:41:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

glibc 2.27 has added memfd_create() but this conflicts with a copy in qemu, so
take a patch from upstream to fix building with glibc 2.27.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu/memfd.patch | 57 +++++++++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.11.0.bb   |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch

diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch b/meta/recipes-devtools/qemu/qemu/memfd.patch
new file mode 100644
index 0000000000..62e8d3800b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/memfd.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 28 Nov 2017 11:51:27 +0100
+Subject: [PATCH] memfd: fix configure test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recent glibc added memfd_create in sys/mman.h.  This conflicts with
+the definition in util/memfd.c:
+
+    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error: static declaration of memfd_create follows non-static declaration
+
+Fix the configure test, and remove the sys/memfd.h inclusion since the
+file actually does not exist---it is a typo in the memfd_create(2) man
+page.
+
+Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+---
+ configure    | 2 +-
+ util/memfd.c | 4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 9c8aa5a98b..99ccc1725a 100755
+--- a/configure
++++ b/configure
+@@ -3923,7 +3923,7 @@ fi
+ # check if memfd is supported
+ memfd=no
+ cat > $TMPC << EOF
+-#include <sys/memfd.h>
++#include <sys/mman.h>
+ 
+ int main(void)
+ {
+diff --git a/util/memfd.c b/util/memfd.c
+index 4571d1aba8..412e94a405 100644
+--- a/util/memfd.c
++++ b/util/memfd.c
+@@ -31,9 +31,7 @@
+ 
+ #include "qemu/memfd.h"
+ 
+-#ifdef CONFIG_MEMFD
+-#include <sys/memfd.h>
+-#elif defined CONFIG_LINUX
++#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
+ #include <sys/syscall.h>
+ #include <asm/unistd.h>
+ 
+-- 
+2.11.0
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.0.bb b/meta/recipes-devtools/qemu/qemu_2.11.0.bb
index ccd8917f8d..8306db2ce5 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://chardev-connect-socket-to-a-spawned-command.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
+           file://memfd.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
@@ -55,4 +56,3 @@ do_install_ptest() {
 	sed -i -e '/wildcard config-host.mak/d' \
 	       -e '$ {/endif/d}' ${D}${PTEST_PATH}/tests/Makefile.include
 }
-
-- 
2.16.1


