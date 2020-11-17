Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: INgmsTVMnK1q/ze0ESXd4aS+wqhZPmYC+viENPZFpUqw6xsNHHQQWk8E8jNC3cQvWkNVmg+6oV
 pI/evGKPczVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720010"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:30 -0800
IronPort-SDR: BUyiuwiJ80CHGPwJfQThhKku3Elispin64tD+hJvzio0G2P1p2zwLE3UYf/YVq0g3fUSWvgQhj
 piPaWE7bTXyQ==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802975"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/19] binutils: reproducibility: reuse debug-prefix-map for stabs
Date: Tue, 17 Nov 2020 23:36:01 +0800
Message-Id: <b4b79870d7946e58692adb68d1329955500d3c56.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denys Zagorui <dzagorui@cisco.com>

powerpc 32bit Linux Kernel widely uses .stabs pseudo-op to
produce debugging information in stabs format. Faced an issue
that during Linux Kernel build with Yocto build system for 32bit
powerpc platform resulting vmlinux contains absolute path in
.stabstr section that cannot be remapped with -fdebug-prefix-map
option.

Yocto uses scripts/mkmakefile Linux Kernel build approach that
allows to store all generated files outside of kernel source
tree. With this approach each compilier invocation is performed
with an absolute path to a file that will be compiled and this
absolute path is recorded in init stab. There is no way to remap
this path.

Reuse remap_debug_filename api to make -fdebug-prefix-map flag
aplicable for init stab.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4dce4e01cfa153fb12cfd1684d36e0432bef6741)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.35.inc                |  1 +
 ...oducibility-for-stabs-debugging-data.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.inc b/meta/recipes-devtools/binutils/binutils-2.35.inc
index 5ae9ec4226..bc9107b084 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
@@ -41,5 +41,6 @@ SRC_URI = "\
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch b/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
new file mode 100644
index 0000000000..42e0c1c32d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
@@ -0,0 +1,35 @@
+From aa6586e80fc6fcd739aa959a71e4cf064cdef072 Mon Sep 17 00:00:00 2001
+From: Denys Zagorui <dzagorui@cisco.com>
+Date: Mon, 9 Nov 2020 15:39:10 +0000
+Subject: [PATCH] gas: improve reproducibility for stabs debugging data format
+
+	* config/obj-elf (obj_elf_init_stab_section): Improve
+	reproducibility for stabs debugging data format
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0541201782c006c09d029d18a45c6e743cfea906]
+---
+ gas/config/obj-elf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gas/config/obj-elf.c b/gas/config/obj-elf.c
+index de22b5a1da..2025df8542 100644
+--- a/gas/config/obj-elf.c
++++ b/gas/config/obj-elf.c
+@@ -2374,12 +2374,13 @@ obj_elf_init_stab_section (segT seg)
+   p = frag_more (12);
+   /* Zero it out.  */
+   memset (p, 0, 12);
+-  file = as_where (NULL);
++  file = remap_debug_filename (as_where (NULL));
+   stabstr_name = concat (segment_name (seg), "str", (char *) NULL);
+   stroff = get_stab_string_offset (file, stabstr_name, TRUE);
+   know (stroff == 1 || (stroff == 0 && file[0] == '\0'));
+   md_number_to_chars (p, stroff, 4);
+   seg_info (seg)->stabu.p = p;
++  xfree ((char *) file);
+ }
+ 
+ #endif
+-- 
+2.20.1
+
-- 
2.28.0

