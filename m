Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 646587017D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 11:48:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 04:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="136607121"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 04:48:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:45:03 +0300
Message-Id: <20170807114504.28410-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/7] oprofile: update to 1.2.0
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
X-List-Received-Date: Mon, 07 Aug 2017 11:48:33 -0000

Drop upstreamed 0001-Fix-FTBFS-problem-with-GCC-6.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |  1 -
 .../0001-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ----------------------
 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb     | 10 -----
 meta/recipes-kernel/oprofile/oprofile_1.2.0.bb     | 10 +++++
 4 files changed, 10 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_1.2.0.bb

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 4b01654fa3e..83fc8435cbd 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -25,7 +25,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://root-home-dir.patch \
            file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
-           file://0001-Fix-FTBFS-problem-with-GCC-6.patch \
 "
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
deleted file mode 100644
index d372fd527ba..00000000000
--- a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
-From: William Cohen <wcohen@redhat.com>
-Date: Fri, 5 Feb 2016 17:30:19 -0500
-Subject: [PATCH] Fix FTBFS problem with GCC-6
-
-GCC-6 is pickier about some of the type conversions causing the Fedora
-24 mass rebuild the build of oprofile failed with:
-
-make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libutil++'
-g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
-op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t, long long unsigned int&, long long unsigned int&) const':
-op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_ostream<char>}' to 'const bool' in initialization
-  bool const verbose = cverb << (vbfd & vlevel1);
-                                               ^
-op_bfd.cpp:546:7: error: in argument to unary !
-  if (!verbose)
-       ^~~~~~~
-
-Avoid the intermediate bool type to make GCC-6 happy.
-
-Signed-off-by: William Cohen <wcohen@redhat.com>
----
-Upstream-Status: Backport
-
- libutil++/op_bfd.cpp | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
-index 389c920..f2eb42b 100644
---- a/libutil++/op_bfd.cpp
-+++ b/libutil++/op_bfd.cpp
-@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_idx,
- {
- 	op_bfd_symbol const & sym = syms[sym_idx];
- 
--	bool const verbose = cverb << (vbfd & vlevel1);
--
- 	if (anon_obj)
- 		start = sym.vma();
- 	else
- 		start = sym.filepos();
- 	end = start + sym.size();
- 
--	if (!verbose)
-+	if (!(cverb << (vbfd & vlevel1)))
- 		return;
- 
- 	io_state state(cverb << (vbfd & vlevel1));
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
deleted file mode 100644
index 92a94ad0d4d..00000000000
--- a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require oprofile.inc
-
-DEPENDS += "virtual/kernel"
-DEPENDS_append_powerpc64 = " libpfm4"
-
-SRC_URI[md5sum] = "248c4c069f9476f427fa7195563f9867"
-SRC_URI[sha256sum] = "cf759a6de1a6033d5dfc93bda129a9f2e128aecc4238cc657feb0801d1b0366c"
-
-S = "${WORKDIR}/oprofile-${PV}"
-
diff --git a/meta/recipes-kernel/oprofile/oprofile_1.2.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.2.0.bb
new file mode 100644
index 00000000000..e85e805c37c
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile_1.2.0.bb
@@ -0,0 +1,10 @@
+require oprofile.inc
+
+DEPENDS += "virtual/kernel"
+DEPENDS_append_powerpc64 = " libpfm4"
+
+SRC_URI[md5sum] = "4fcd3920984dcb607314b2e225086c3a"
+SRC_URI[sha256sum] = "eb95f98c40b7d0ee29b45fba3565d9f8381747528aa6b6159e37d4fa0c8ca57d"
+
+S = "${WORKDIR}/oprofile-${PV}"
+
-- 
2.13.2


