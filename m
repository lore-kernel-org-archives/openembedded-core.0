Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.7288.1603146128234361144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 15:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=Z87vECAT;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4487; q=dns/txt; s=iport;
  t=1603146128; x=1604355728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZAU8vzsdh1oIc7DsNYo9EPDQpNOdIAXx0V7R9nMT8Vk=;
  b=Z87vECATU1jrT5XpwM/Bg3I6fVVGs7Bvvr9vGgcRyEUchpjaPx5s6ORJ
   4u3skGsNln/JlEJQNtbzoNLJ1UwcbGyp4UoXyLd05BSPwGQ+Ckb9CXZln
   HIwXJOSD7c6DTF07gBuMNR2Zw5sjG0G1/r6MCfhkXE8WsCUaHOrl1fN+i
   g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BoBQDrEI5f/4oNJK1gHgEBCxIMQIN?=
 =?us-ascii?q?5cFUBMiyEPZEZgQKbIwsBAQENAQEYDQoEAQGBVYJ1AoINAiU4EwIDAQELAQE?=
 =?us-ascii?q?FAQEBAgEGBG2FYQyFcgECBAEiBAsBRhAcAwECAwImAgIoJwgQCYMmAYJ8D64?=
 =?us-ascii?q?sGTx2fzOEPgEDAgxDRIUSBoEOKog3hH8bggCBEYJbc4JcAQEBAQEWgQ2DUIJ?=
 =?us-ascii?q?fBJMQh3KBbol3kROCdIMWhW6LFIZKDyKhUJ4kkQeEMwIEBgUCFYFrI4FXTSM?=
 =?us-ascii?q?VgyQTPRkNkhCFFIViIQMwAgktAgYBCQEBAwmMAoJGAQE?=
X-IronPort-AV: E=Sophos;i="5.77,395,1596499200"; 
   d="scan'208";a="810430399"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 19 Oct 2020 22:21:57 +0000
Received: from kamensky-p53s.cisco.com ([10.24.43.127])
	(authenticated bits=0)
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 09JMLmwe027939
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2020 22:21:57 GMT
From: "Victor Kamensky" <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] qemu: change TLBs number to 64 in 34Kf mips cpu model
Date: Mon, 19 Oct 2020 15:21:46 -0700
Message-Id: <20201019222146.29078-3-kamensky@cisco.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201019222146.29078-1-kamensky@cisco.com>
References: <20201019222146.29078-1-kamensky@cisco.com>
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.43.127, [10.24.43.127]
X-Outbound-Node: alln-core-5.cisco.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace OE private qemu patch with one that got upstreamed
and solves the same problem: increase qemumips CI performance
by increasing number of TLBs in CPU model and reduce need to
run software TLB refill code.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 ...-Increase-number-of-TLB-entries-on-the-34.patch | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bbb9038961..84f600cec0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://find_datadir.patch \
            file://usb-fix-setup_len-init.patch \
+           file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
new file mode 100644
index 0000000000..5227b7cbd2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
@@ -0,0 +1,59 @@
+From 68fa519a6cb455005317bd61f95214b58b2f1e69 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Fri, 16 Oct 2020 15:20:37 +0200
+Subject: [PATCH] target/mips: Increase number of TLB entries on the 34Kf core
+ (16 -> 64)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per "MIPS32 34K Processor Core Family Software User's Manual,
+Revision 01.13" page 8 in "Joint TLB (JTLB)" section:
+
+  "The JTLB is a fully associative TLB cache containing 16, 32,
+   or 64-dual-entries mapping up to 128 virtual pages to their
+   corresponding physical addresses."
+
+There is no particular reason to restrict the 34Kf core model to
+16 TLB entries, so raise its config to 64.
+
+This is helpful for other projects, in particular the Yocto Project:
+
+  Yocto Project uses qemu-system-mips 34Kf cpu model, to run 32bit
+  MIPS CI loop. It was observed that in this case CI test execution
+  time was almost twice longer than 64bit MIPS variant that runs
+  under MIPS64R2-generic model. It was investigated and concluded
+  that the difference in number of TLBs 16 in 34Kf case vs 64 in
+  MIPS64R2-generic is responsible for most of CI real time execution
+  difference. Because with 16 TLBs linux user-land trashes TLB more
+  and it needs to execute more instructions in TLB refill handler
+  calls, as result it runs much longer.
+
+(https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03428.html)
+
+Buglink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
+Reported-by: Victor Kamensky <kamensky@cisco.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20201016133317.553068-1-f4bug@amsat.org>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/68fa519a6cb455005317bd61f95214b58b2f1e69]
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+
+---
+ target/mips/translate_init.c.inc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-5.1.0/target/mips/translate_init.inc.c
+===================================================================
+--- qemu-5.1.0.orig/target/mips/translate_init.inc.c
++++ qemu-5.1.0/target/mips/translate_init.inc.c
+@@ -254,7 +254,7 @@ const mips_def_t mips_defs[] =
+         .CP0_PRid = 0x00019500,
+         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
+                        (MMU_TYPE_R4000 << CP0C0_MT),
+-        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
++        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
+                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
+                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
+                        (1 << CP0C1_CA),
-- 
2.14.5

