Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B7BE678855
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 23:32:12 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id a43so1539277wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 15:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZcWv5W9yMlPqsayX7v8zeixhUxXJ2cMAQku1QqyTf0w=;
	b=O8x2l/eVZHxRg+wn+M4mtubg4j3gRsaOl9UJjJYNKSLPltJRuHoSLfzcXJ40BI1pIr
	xq2HdLe6yG/7ULxq2yzNofF8/cVOEDC6eELz2Af8hhU4L0UOlP21vRmUooXBHyYarZhV
	0S6qw/VHkZ8FrA06jGtCNTQcFBar/RLHX+OPmofBspttYWrYEtth/8eylsy74kKupYMX
	/jO4Bu7rVEVoJ0jH5f1DMjUvNP67okE0Kkr8SkaCZ39A35hBKbRuzB6uLaXBZ0ddeuXb
	t0X78RX7EGYNLGEk/+6O/RCasb1WUwvHOQLqJODOSq5LYncglnIB1qR+fs7L/HDrdXJL
	D6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZcWv5W9yMlPqsayX7v8zeixhUxXJ2cMAQku1QqyTf0w=;
	b=Z8BaRnocupSBsOpXNDhBnuJEtPouFVdrlJiA9pbrWtCPANzPepfskBvIOvGMhYiaEH
	LkkMFWfCuWhdDjfY81VcEMAYt3mwgqNYmuuTG7Yl5jUGGnXep6e5T/ESPT1g6Jw5AySh
	SDDk44WqiOe1P3e1lqV70MWulpwwfH6sV/DzTTqpGEJey39pwoOntPaHYVVzlnH8v+By
	KwfCtk1k+KnwHRLTfvHfsN0Mh6EMHqLDkiZesV5+MZrFqyPQ0JCK4qA+xjPFeix10GK+
	0/a5wtQbxOfhNzlzeZosSgTdLzNbfwahPfS/gHKyjEXluBDoDC89c0JvbFpaD3D2Gfiz
	i6Mg==
X-Gm-Message-State: AKwxytdrWRxKrkMvzTlNo/QAQXH4ak+CbOn1JfVn9DSBt/7VAooRMjNc
	27LNzoFNeeP0d/Ej7DlJ4bLi7c+4
X-Google-Smtp-Source: AH8x224ozODqJGwfEl+CkEXDNurli7szeFD6WgdCQvCgJ2UUsEhBXypvUKXbRwHwjoXGjlYulp2+sQ==
X-Received: by 10.223.129.183 with SMTP id 52mr9146545wra.40.1517268733054;
	Mon, 29 Jan 2018 15:32:13 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 19sm5090138wrx.73.2018.01.29.15.32.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 15:32:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 23:32:08 +0000
Message-Id: <20180129233208.13795-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] qemu: fix memfd_create with glibc 2.27
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
X-List-Received-Date: Mon, 29 Jan 2018 23:32:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
index 00000000000..62e8d3800bd
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
index ccd8917f8dc..8306db2ce5a 100644
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
2.11.0


