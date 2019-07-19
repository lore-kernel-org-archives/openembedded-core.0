Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id DC1007F0EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 05:55:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2019 22:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="187929468"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.185.125])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2019 22:55:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 13:55:28 +0800
Message-Id: <20190719055529.25447-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719055529.25447-1-anuj.mittal@intel.com>
References: <20190719055529.25447-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gdb: fix CVE-2017-9778
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
X-List-Received-Date: Fri, 19 Jul 2019 05:55:34 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gdb/gdb-8.3.inc         |  1 +
 .../gdb/gdb/CVE-2017-9778.patch               | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.3.inc b/meta/recipes-devtools/gdb/gdb-8.3.inc
index db8d5f349f..a5ef936fbf 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
+           file://CVE-2017-9778.patch \
            "
 SRC_URI[md5sum] = "bbd95b2f9b34621ad7a19a3965476314"
 SRC_URI[sha256sum] = "802f7ee309dcc547d65a68d61ebd6526762d26c3051f52caebe2189ac1ffd72e"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
new file mode 100644
index 0000000000..f142ed00d7
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
@@ -0,0 +1,98 @@
+From 6ad3791f095cfc1b0294f62c4b3a524ba735595e Mon Sep 17 00:00:00 2001
+From: Sandra Loosemore <sandra@codesourcery.com>
+Date: Thu, 25 Apr 2019 07:27:02 -0700
+Subject: [PATCH] Detect invalid length field in debug frame FDE header.
+
+GDB was failing to catch cases where a corrupt ELF or core file
+contained an invalid length value in a Dwarf debug frame FDE header.
+It was checking for buffer overflow but not cases where the length was
+negative or caused pointer wrap-around.
+
+In addition to the additional validity check, this patch cleans up the
+multiple signed/unsigned conversions on the length field so that an
+unsigned representation is used consistently throughout.
+
+This patch fixes CVE-2017-9778 and PR gdb/21600.
+
+2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
+	    Kang Li <kanglictf@gmail.com>
+
+	PR gdb/21600
+
+	* dwarf2-frame.c (read_initial_length): Be consistent about using
+	unsigned representation of length.
+	(decode_frame_entry_1): Likewise.  Check for wraparound of
+	end pointer as well as buffer overflow.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9778
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gdb/ChangeLog      | 10 ++++++++++
+ gdb/dwarf2-frame.c | 14 +++++++-------
+ 2 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/gdb/ChangeLog b/gdb/ChangeLog
+index 1c125de..d028d2b 100644
+--- a/gdb/ChangeLog
++++ b/gdb/ChangeLog
+@@ -1,3 +1,13 @@
++2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
++	Kang Li <kanglictf@gmail.com>
++
++	PR gdb/21600
++
++	* dwarf2-frame.c (read_initial_length): Be consistent about using
++	unsigned representation of length.
++	(decode_frame_entry_1): Likewise.  Check for wraparound of
++	end pointer as well as buffer overflow.
++
+ 2019-05-11  Joel Brobecker  <brobecker@adacore.com>
+ 
+ 	* version.in: Set GDB version number to 8.3.
+diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
+index 178ac44..dc5d3b3 100644
+--- a/gdb/dwarf2-frame.c
++++ b/gdb/dwarf2-frame.c
+@@ -1488,7 +1488,7 @@ static ULONGEST
+ read_initial_length (bfd *abfd, const gdb_byte *buf,
+ 		     unsigned int *bytes_read_ptr)
+ {
+-  LONGEST result;
++  ULONGEST result;
+ 
+   result = bfd_get_32 (abfd, buf);
+   if (result == 0xffffffff)
+@@ -1789,7 +1789,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
+ {
+   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
+   const gdb_byte *buf, *end;
+-  LONGEST length;
++  ULONGEST length;
+   unsigned int bytes_read;
+   int dwarf64_p;
+   ULONGEST cie_id;
+@@ -1800,15 +1800,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
+   buf = start;
+   length = read_initial_length (unit->abfd, buf, &bytes_read);
+   buf += bytes_read;
+-  end = buf + length;
+-
+-  /* Are we still within the section?  */
+-  if (end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
+-    return NULL;
++  end = buf + (size_t) length;
+ 
+   if (length == 0)
+     return end;
+ 
++  /* Are we still within the section?  */
++  if (end <= buf || end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
++    return NULL;
++
+   /* Distinguish between 32 and 64-bit encoded frame info.  */
+   dwarf64_p = (bytes_read == 12);
+ 
+-- 
+2.20.1
+
-- 
2.20.1


