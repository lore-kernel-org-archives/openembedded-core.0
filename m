Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87C57746B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 02:42:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w852glfW027999
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Sep 2018 19:42:47 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 19:42:45 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 19:42:46 -0700
Message-ID: <20180905024246.112849-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] elfutils: CVE-2018-16062
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
X-List-Received-Date: Wed, 05 Sep 2018 02:42:46 -0000
Content-Type: text/plain

Backport the CVE patch from the upstream:
https://sourceware.org/git/?p=elfutils.git;a=commit;
h=29e31978ba51c1051743a503ee325b5ebc03d7e9

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../elfutils/elfutils_0.173.bb                |  1 +
 .../elfutils/files/CVE-2018-16062.patch       | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.173.bb b/meta/recipes-devtools/elfutils/elfutils_0.173.bb
index 03144dc842..2fec73dbdb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.173.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.173.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/ignore_strmerge.diff \
            file://debian/0001-fix-gcc7-ftbfs.patch \
            file://debian/0001-disable_werror.patch \
+           file://CVE-2018-16062.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch b/meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch
new file mode 100644
index 0000000000..cfeb1ca13c
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch
@@ -0,0 +1,79 @@
+From 29e31978ba51c1051743a503ee325b5ebc03d7e9 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 18 Aug 2018 13:27:48 +0200
+Subject: [PATCH] libdw, readelf: Make sure there is enough data to read full
+ aranges header.
+
+dwarf_getaranges didn't check if there was enough data left to read both
+the address and segment size. readelf didn't check there was enough data
+left to read the segment size.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23541
+
+CVE: CVE-2018-16062
+Upstream-Status: Backport
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+---
+ libdw/ChangeLog          | 5 +++++
+ libdw/dwarf_getaranges.c | 4 ++++
+ src/ChangeLog            | 5 +++++
+ src/readelf.c            | 2 ++
+ 4 files changed, 16 insertions(+)
+
+diff --git a/libdw/ChangeLog b/libdw/ChangeLog
+index cb4f34e..472d922 100644
+--- a/libdw/ChangeLog
++++ b/libdw/ChangeLog
+@@ -1,3 +1,8 @@
++2018-08-18  Mark Wielaard  <mark@klomp.org>
++
++	* dwarf_getaranges.c (dwarf_getaranges.c): Make sure there is enough
++	data to read the address and segment size.
++
+ 2018-06-28  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* dwarf_next_cfi.c (dwarf_next_cfi): Check whether length is zero.
+diff --git a/libdw/dwarf_getaranges.c b/libdw/dwarf_getaranges.c
+index bff9c86..de5b81b 100644
+--- a/libdw/dwarf_getaranges.c
++++ b/libdw/dwarf_getaranges.c
+@@ -148,6 +148,10 @@ dwarf_getaranges (Dwarf *dbg, Dwarf_Aranges **aranges, size_t *naranges)
+ 				   length_bytes, &offset, IDX_debug_info, 4))
+ 	goto fail;
+ 
++      /* Next up two bytes for address and segment size.  */
++      if (readp + 2 > readendp)
++	goto invalid;
++
+       unsigned int address_size = *readp++;
+       if (unlikely (address_size != 4 && address_size != 8))
+ 	goto invalid;
+diff --git a/src/ChangeLog b/src/ChangeLog
+index 8c89f83..2f9f774 100644
+--- a/src/ChangeLog
++++ b/src/ChangeLog
+@@ -1,3 +1,8 @@
++2018-08-18  Mark Wielaard  <mark@klomp.org>
++
++	* readelf.c (print_debug_aranges_section): Make sure there is enough
++	data to read the header segment size.
++
+ 2018-06-25  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* readelf.c (print_decoded_line_section): Use dwarf_next_lines
+diff --git a/src/readelf.c b/src/readelf.c
+index 7b5707f..7b488ac 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -5447,6 +5447,8 @@ print_debug_aranges_section (Dwfl_Module *dwflmod __attribute__ ((unused)),
+ 	  goto next_table;
+ 	}
+ 
++      if (readp + 1 > readendp)
++	goto invalid_data;
+       unsigned int segment_size = *readp++;
+       printf (gettext (" Segment size:  %6" PRIu64 "\n\n"),
+ 	      (uint64_t) segment_size);
+-- 
+2.9.3
-- 
2.17.1


