Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD6C7318D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064268"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:32 +0200
Message-Id: <e69738a9fcbba237d2657ab6ca229f312fbc9a72.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/20] grep: update to 2.22
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backported grep-fix-CVE-2015-1345.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../grep/grep/grep-fix-CVE-2015-1345.patch         | 154 ---------------------
 .../grep/{grep_2.21.bb => grep_2.22.bb}            |   5 +-
 2 files changed, 2 insertions(+), 157 deletions(-)
 delete mode 100644 meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch
 rename meta/recipes-extended/grep/{grep_2.21.bb => grep_2.22.bb} (85%)

diff --git a/meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch b/meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch
deleted file mode 100644
index e88a988..0000000
--- a/meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2015-1345.
-http://git.savannah.gnu.org/cgit/grep.git/commit/?id=83a95bd
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 83a95bd8c8561875b948cadd417c653dbe7ef2e2 Mon Sep 17 00:00:00 2001
-From: Yuliy Pisetsky <ypisetsky@fb.com>
-Date: Thu, 1 Jan 2015 15:36:55 -0800
-Subject: [PATCH] grep -F: fix a heap buffer (read) overrun
-
-grep's read buffer is often filled to its full size, except when
-reading the final buffer of a file.  In that case, the number of
-bytes read may be far less than the size of the buffer.  However, for
-certain unusual pattern/text combinations, grep -F would mistakenly
-examine bytes in that uninitialized region of memory when searching
-for a match.  With carefully chosen inputs, one can cause grep -F to
-read beyond the end of that buffer altogether.  This problem arose via
-commit v2.18-90-g73893ff with the introduction of a more efficient
-heuristic using what is now the memchr_kwset function. The use of
-that function in bmexec_trans could leave TP much larger than EP,
-and the subsequent call to bm_delta2_search would mistakenly access
-beyond end of the main input read buffer.
-
-* src/kwset.c (bmexec_trans): When TP reaches or exceeds EP,
-do not call bm_delta2_search.
-* tests/kwset-abuse: New file.
-* tests/Makefile.am (TESTS): Add it.
-* THANKS.in: Update.
-* NEWS (Bug fixes): Mention it.
-
-Prior to this patch, this command would trigger a UMR:
-
-  printf %0360db 0 | valgrind src/grep -F $(printf %019dXb 0)
-
-  Use of uninitialised value of size 8
-     at 0x4142BE: bmexec_trans (kwset.c:657)
-     by 0x4143CA: bmexec (kwset.c:678)
-     by 0x414973: kwsexec (kwset.c:848)
-     by 0x414DC4: Fexecute (kwsearch.c:128)
-     by 0x404E2E: grepbuf (grep.c:1238)
-     by 0x4054BF: grep (grep.c:1417)
-     by 0x405CEB: grepdesc (grep.c:1645)
-     by 0x405EC1: grep_command_line_arg (grep.c:1692)
-     by 0x4077D4: main (grep.c:2570)
-
-See the accompanying test for how to trigger the heap buffer overrun.
-
-Thanks to Nima Aghdaii for testing and finding numerous
-ways to break early iterations of this patch.
----
- NEWS              |  5 +++++
- THANKS.in         |  1 +
- src/kwset.c       |  2 ++
- tests/Makefile.am |  1 +
- tests/kwset-abuse | 32 ++++++++++++++++++++++++++++++++
- 5 files changed, 41 insertions(+)
- create mode 100755 tests/kwset-abuse
-
-diff --git a/NEWS b/NEWS
-index 975440d..3835d8d 100644
---- a/NEWS
-+++ b/NEWS
-@@ -2,6 +2,11 @@ GNU grep NEWS                                    -*- outline -*-
- 
- * Noteworthy changes in release ?.? (????-??-??) [?]
- 
-+** Bug fixes
-+
-+  grep no longer reads from uninitialized memory or from beyond the end
-+  of the heap-allocated input buffer.
-+
- 
- * Noteworthy changes in release 2.21 (2014-11-23) [stable]
- 
-diff --git a/THANKS.in b/THANKS.in
-index aeaf516..624478d 100644
---- a/THANKS.in
-+++ b/THANKS.in
-@@ -62,6 +62,7 @@ Michael Aichlmayr                   mikla@nx.com
- Miles Bader                         miles@ccs.mt.nec.co.jp
- Mirraz Mirraz                       mirraz1@rambler.ru
- Nelson H. F. Beebe                  beebe@math.utah.edu
-+Nima Aghdaii                        naghdaii@fb.com
- Olaf Kirch                          okir@ns.lst.de
- Paul Kimoto                         kimoto@spacenet.tn.cornell.edu
- Péter Radics                        mitchnull@gmail.com
-diff --git a/src/kwset.c b/src/kwset.c
-index 4003c8d..376f7c3 100644
---- a/src/kwset.c
-+++ b/src/kwset.c
-@@ -643,6 +643,8 @@ bmexec_trans (kwset_t kwset, char const *text, size_t size)
-                     if (! tp)
-                       return -1;
-                     tp++;
-+                    if (ep <= tp)
-+                      break;
-                   }
-               }
-           }
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 2cba2cd..0508cd2 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -75,6 +75,7 @@ TESTS =						\
-   inconsistent-range				\
-   invalid-multibyte-infloop			\
-   khadafy					\
-+  kwset-abuse					\
-   long-line-vs-2GiB-read			\
-   match-lines					\
-   max-count-overread				\
-diff --git a/tests/kwset-abuse b/tests/kwset-abuse
-new file mode 100755
-index 0000000..6d8ec0c
---- /dev/null
-+++ b/tests/kwset-abuse
-@@ -0,0 +1,32 @@
-+#! /bin/sh
-+# Evoke a segfault in a hard-to-reach code path of kwset.c.
-+# This bug affected grep versions 2.19 through 2.21.
-+#
-+# Copyright (C) 2015 Free Software Foundation, Inc.
-+#
-+# This program is free software: you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation, either version 3 of the License, or
-+# (at your option) any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-+
-+. "${srcdir=.}/init.sh"; path_prepend_ ../src
-+
-+fail=0
-+
-+# This test case chooses a haystack of size 260,000, since prodding
-+# with gdb showed a reallocation slightly larger than that in fillbuf.
-+# To reach the buggy code, the needle must have length < 1/11 that of
-+# the haystack, and 10,000 is a nice round number that fits the bill.
-+printf '%0260000dXy\n' 0 | grep -F $(printf %010000dy 0)
-+
-+test $? = 1 || fail=1
-+
-+Exit $fail
--- 
-2.4.1
-
diff --git a/meta/recipes-extended/grep/grep_2.21.bb b/meta/recipes-extended/grep/grep_2.22.bb
similarity index 85%
rename from meta/recipes-extended/grep/grep_2.21.bb
rename to meta/recipes-extended/grep/grep_2.22.bb
index c51147b..8092a0f 100644
--- a/meta/recipes-extended/grep/grep_2.21.bb
+++ b/meta/recipes-extended/grep/grep_2.22.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://grep-fix-CVE-2015-1345.patch \
           "
 
-SRC_URI[md5sum] = "43c48064d6409862b8a850db83c8038a"
-SRC_URI[sha256sum] = "5244a11c00dee8e7e5e714b9aaa053ac6cbfa27e104abee20d3c778e4bb0e5de"
+SRC_URI[md5sum] = "e1015e951a49a82b02e38891026ef5df"
+SRC_URI[sha256sum] = "ca91d22f017bfcb503d4bc3b44295491c89a33a3df0c3d8b8614f2d3831836eb"
 
 inherit autotools gettext texinfo
 
-- 
2.6.2


