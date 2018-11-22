Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id D31D76C506
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 22:38:44 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 07FDC10C14C4;
	Thu, 22 Nov 2018 14:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542926326; bh=rNA/Tfc3oMsiPWnGJxaRZSZMkzjCaNW+Nz8c44Bg0Co=;
	h=From:To:Cc:Subject:Date:From;
	b=BVHsE6uoqafKWmqEMjdvziDR25f2aj7/tI3d5DQnTcuXUoHIZWMKD706T66K4Kkzg
	J3GsEIgTN/8AAzJawJJda0+jXVz4mBDTNp8ZVTjE6Q8HuRovCTxMvcr1r3NrK36Vua
	sjNr/yqcmk7EuPw9cR4d3P1T7cJT5GUSUQs3GVkChZ9KdGDmKKTXmOBtqMql2AB4w3
	GOqIJ5t6NF38THeuWSYZ4dfWHtwFBkUd3y/9pm+1NUFiNAt/kN9TN+Kmfg34oQxlYe
	VEveOOJ/FbsvVo5kRFK3S5QIQYc8GvJQl4GIUVOfW6cWAeO170aIR4cqQKHi2P75Vn
	fuRwATh36QRYQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 4487235CD;
	Thu, 22 Nov 2018 14:38:44 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 01:38:42 +0300
Message-Id: <20181122223842.36893-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] arc: Disable LTTng
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
X-List-Received-Date: Thu, 22 Nov 2018 22:38:44 -0000

LTTng depends on liburcu which is not yet ported to ARC
so disable LTTng on ARC for now.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 3 +++
 meta/recipes-devtools/gdb/gdb-common.inc                           | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb                    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 33d9c09a66..762c046636 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -38,13 +38,16 @@ SYSTEMTAP_riscv64 = ""
 # lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-musl = ""
+LTTNGUST_arc = ""
 LTTNGUST_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_libc-musl = ""
+LTTNGTOOLS_arc = ""
 LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
+LTTNGMODULES_arc = ""
 LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index fa64939f26..57bc0dc773 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -4,6 +4,7 @@ SECTION = "devel"
 DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 
 LTTNGUST = "lttng-ust"
+LTTNGUST_arc = ""
 LTTNGUST_aarch64 = ""
 LTTNGUST_riscv64 = ""
 LTTNGUST_mipsarch = ""
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
index 11d7db6848..85ed3c691b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
+PACKAGECONFIG_remove_arc = "lttng-ust"
 PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-- 
2.16.2


