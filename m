Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id A2D4A607AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 11:56:56 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 6950524E1F49;
	Tue,  4 Dec 2018 03:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1543924617; bh=l2iL13MKpFROUIreXeFOahWicLCEA8LqqlxtQoD2Nbw=;
	h=From:To:Cc:Subject:Date:From;
	b=B8GUGde/RUfqPjxQzUl3U2+MAZkR/77jDpdtAdqaN2nyxjFV3wkcCC41PCSLephDu
	C4ly2EhJH4MBQZ8XBHRXw2gK7mA1+WA+RX50qgoDJT7TCAod5aPC32fjn9TrE9eDdO
	dChKKH9dtNGNI3TK7cUL2MKApeuIgVsnJ7fpwjnzigcaj00g8bkysgZRuRB1RrZC7O
	NCYPCkT0wLy3XO1z/mTTVwyArUmgxScTIiHHwz6VwPx5l5TLAs6fJxGzC/nNap326S
	rpjLpqFT0A0sp06T5NLxttW4ZjmtUilQNKTyv3uXXbWjOQRReC9LWiYSZEEP3oUcKN
	mi876kegWoEBQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id E07285A38;
	Tue,  4 Dec 2018 03:56:55 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2018 14:56:53 +0300
Message-Id: <20181204115653.28369-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] gdb: Remove long ago upstreamed patch
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
X-List-Received-Date: Tue, 04 Dec 2018 11:56:56 -0000

This fix was upstreamed a long ago, see [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=37ce4055fe907b9edd25498dcda7a133dbd19784

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.inc              |  1 -
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  | 29 ----------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.inc b/meta/recipes-devtools/gdb/gdb-8.2.inc
index dfb0059123..7e0809de72 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
 SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
-           file://0001-include-sys-types.h-for-mode_t.patch \
            file://0002-make-man-install-relative-to-DESTDIR.patch \
            file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
            file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
deleted file mode 100644
index 2c8783e192..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6ae0fb9b49047cef338262e30273f63139fd1261 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Jan 2016 18:18:52 -0800
-Subject: [PATCH 01/11] include sys/types.h for mode_t
-
-mode_t is used in target.h, so we need to include sys/types.h to get the
-defintion
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gdb/gdbserver/target.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index fce54e05ad..278cee78a8 100644
---- a/gdb/gdbserver/target.h
-+++ b/gdb/gdbserver/target.h
-@@ -29,6 +29,7 @@
- #include "mem-break.h"
- #include "btrace-common.h"
- #include <vector>
-+#include <sys/types.h>
- 
- struct emit_ops;
- struct buffer;
--- 
-2.18.0
-
-- 
2.16.2


