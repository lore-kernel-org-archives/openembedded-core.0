Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B831371A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266955"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:20 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:46 +0300
Message-Id: <63d2ee97749d16d376a9731c713369d8ace2d8fa.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/19] gnutls: update to 3.5.5
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove backported 0001-Use-correct-include-dir-with-minitasn.patch and
CVE-2016-7444.patch (which still applied silently and incorrectly:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...001-Use-correct-include-dir-with-minitasn.patch | 31 -------------------
 .../gnutls/gnutls/CVE-2016-7444.patch              | 35 ----------------------
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        | 13 --------
 meta/recipes-support/gnutls/gnutls_3.5.5.bb        |  9 ++++++
 4 files changed, 9 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.5.3.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.5.5.bb

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch b/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
deleted file mode 100644
index d7dd7cf..0000000
--- a/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2651b08477f42dd7a05ea7d6df410fb2c46de4fb Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 31 Aug 2016 11:04:06 +0300
-Subject: [PATCH] Use correct include dir with minitasn
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This allows compiling certtool-cfg without libtasn headers.
-
-Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/merge_requests/54]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 182f3a5..cf65388 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -146,6 +146,7 @@ libcmd_cli_debug_la_SOURCES = cli-debug-args.def cli-debug-args.c cli-debug-args
- COMMON_LIBS = $(LIBOPTS) $(LTLIBINTL)
- if ENABLE_MINITASN1
- COMMON_LIBS += ../lib/minitasn1/libminitasn1.la ../gl/libgnu.la 
-+AM_CPPFLAGS += -I$(top_srcdir)/lib/minitasn1
- else
- COMMON_LIBS += $(LIBTASN1_LIBS)
- endif
--- 
-2.9.3
-
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch b/meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch
deleted file mode 100644
index 215be5a..0000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-CVE: CVE-2016-7444
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Upstream commit follows:
-
-
-From 964632f37dfdfb914ebc5e49db4fa29af35b1de9 Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
-Date: Sat, 27 Aug 2016 17:00:22 +0200
-Subject: [PATCH] ocsp: corrected the comparison of the serial size in OCSP response
-
-Previously the OCSP certificate check wouldn't verify the serial length
-and could succeed in cases it shouldn't.
-
-Reported by Stefan Buehler.
----
- lib/x509/ocsp.c | 1 +
- 1 file changed, 1 insertion(+), 0 deletions(-)
-
-diff --git a/lib/x509/ocsp.c b/lib/x509/ocsp.c
-index 92db9b6..8181f2e 100644
---- a/lib/x509/ocsp.c
-+++ b/lib/x509/ocsp.c
-@@ -1318,6 +1318,7 @@ gnutls_ocsp_resp_check_crt(gnutls_ocsp_resp_t resp,
- 		gnutls_assert();
- 		goto cleanup;
- 	}
-+	cserial.size = t;
- 
- 	if (rserial.size != cserial.size
- 	    || memcmp(cserial.data, rserial.data, rserial.size) != 0) {
---
-libgit2 0.24.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
deleted file mode 100644
index b2dbb07..0000000
--- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require gnutls.inc
-
-SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-            file://0001-configure.ac-fix-sed-command.patch \
-            file://use-pkg-config-to-locate-zlib.patch \
-            file://0001-Use-correct-include-dir-with-minitasn.patch \
-            file://CVE-2016-7444.patch \
-           "
-SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
-SRC_URI[sha256sum] = "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b5eae74881bdb1fef"
-
-# x86 .text relocations should be fixed from 3.5.5 onwards
-INSANE_SKIP_${PN}_append_x86 = " textrel"
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.5.bb b/meta/recipes-support/gnutls/gnutls_3.5.5.bb
new file mode 100644
index 0000000..d255959
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_3.5.5.bb
@@ -0,0 +1,9 @@
+require gnutls.inc
+
+SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
+            file://0001-configure.ac-fix-sed-command.patch \
+            file://use-pkg-config-to-locate-zlib.patch \
+           "
+SRC_URI[md5sum] = "fb84c4d7922c1545da8dda4dcb9487d4"
+SRC_URI[sha256sum] = "86994fe7804ee16d2811e366b9bf2f75304f8e470ae0e3716d60ffeedac0e529"
+
-- 
2.9.3


