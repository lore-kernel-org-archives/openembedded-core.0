Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 043BD7D8F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:26:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 23:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146681143"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.129])
	by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 23:26:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 14:26:34 +0800
Message-Id: <20190429062636.2338-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429062636.2338-1-anuj.mittal@intel.com>
References: <20190429062636.2338-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] gdb: fix CVE-2017-9778
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
X-List-Received-Date: Mon, 29 Apr 2019 06:26:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.1.inc       |  1 +
 .../gdb/gdb/CVE-2017-9778.patch               | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.1.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
index 1fc1ec0da4..cb8d189f2a 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0011-Fix-invalid-sigprocmask-call.patch \
            file://gdbserver-ctrl-c-handling.patch \
            file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
+           file://CVE-2017-9778.patch \
 "
 SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
 SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
new file mode 100644
index 0000000000..935f2661fe
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
@@ -0,0 +1,99 @@
+From a608b79f30ab3f670095e14ba3d3b5b24a19fe68 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=723adb650a31859d7cc45832cb8adca0206455ed]
+CVE: CVE-2017-9778
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gdb/ChangeLog      | 11 +++++++++++
+ gdb/dwarf2-frame.c | 14 +++++++-------
+ 2 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/gdb/ChangeLog b/gdb/ChangeLog
+index 3711dc7..0a9720b 100644
+--- a/gdb/ChangeLog
++++ b/gdb/ChangeLog
+@@ -1,3 +1,14 @@
++2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
++	    Kang Li <kanglictf@gmail.com>
++
++	PR gdb/21600
++
++	* dwarf2-frame.c (read_initial_length): Be consistent about using
++	unsigned representation of length.
++	(decode_frame_entry_1): Likewise.  Check for wraparound of
++	end pointer as well as buffer overflow.
++
++
+ 2018-12-23  Joel Brobecker  <brobecker@adacore.com>
+ 
+ 	* version.in: Set GDB version number to 8.2.1.
+diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
+index 91e16cf..a7b99fd 100644
+--- a/gdb/dwarf2-frame.c
++++ b/gdb/dwarf2-frame.c
+@@ -1477,7 +1477,7 @@ static ULONGEST
+ read_initial_length (bfd *abfd, const gdb_byte *buf,
+ 		     unsigned int *bytes_read_ptr)
+ {
+-  LONGEST result;
++  ULONGEST result;
+ 
+   result = bfd_get_32 (abfd, buf);
+   if (result == 0xffffffff)
+@@ -1780,7 +1780,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
+ {
+   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
+   const gdb_byte *buf, *end;
+-  LONGEST length;
++  ULONGEST length;
+   unsigned int bytes_read;
+   int dwarf64_p;
+   ULONGEST cie_id;
+@@ -1791,15 +1791,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
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
+2.7.4
+
-- 
2.20.1


