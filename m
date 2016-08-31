Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 89D5060746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 08:50:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 31 Aug 2016 01:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; d="scan'208";a="1033523804"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2016 01:50:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 11:50:03 +0300
Message-Id: <1472633403-13862-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f6ef8fb895e0b0b4263ae5ebba8756137b5756c0.1472480768.git.alexander.kanavin@linux.intel.com>
References: <f6ef8fb895e0b0b4263ae5ebba8756137b5756c0.1472480768.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 08/15] gnutls: update to 3.5.3
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
X-List-Received-Date: Wed, 31 Aug 2016 08:50:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add patch to fix compile without libtasn headers.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v1:
* Add patch to fix compile without libtasn headers

Thanks,
 Jussi


 ...001-Use-correct-include-dir-with-minitasn.patch | 31 ++++++++++++++++++++++
 .../gnutls/{gnutls_3.5.1.bb => gnutls_3.5.3.bb}    |  5 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.1.bb => gnutls_3.5.3.bb} (50%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch b/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
new file mode 100644
index 0000000..d7dd7cf
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
@@ -0,0 +1,31 @@
+From 2651b08477f42dd7a05ea7d6df410fb2c46de4fb Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 31 Aug 2016 11:04:06 +0300
+Subject: [PATCH] Use correct include dir with minitasn
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows compiling certtool-cfg without libtasn headers.
+
+Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/merge_requests/54]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 182f3a5..cf65388 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -146,6 +146,7 @@ libcmd_cli_debug_la_SOURCES = cli-debug-args.def cli-debug-args.c cli-debug-args
+ COMMON_LIBS = $(LIBOPTS) $(LTLIBINTL)
+ if ENABLE_MINITASN1
+ COMMON_LIBS += ../lib/minitasn1/libminitasn1.la ../gl/libgnu.la 
++AM_CPPFLAGS += -I$(top_srcdir)/lib/minitasn1
+ else
+ COMMON_LIBS += $(LIBTASN1_LIBS)
+ endif
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.1.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
similarity index 50%
rename from meta/recipes-support/gnutls/gnutls_3.5.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.3.bb
index 85d9904..1bdca6a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
@@ -3,6 +3,7 @@ require gnutls.inc
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
+            file://0001-Use-correct-include-dir-with-minitasn.patch \
            "
-SRC_URI[md5sum] = "cb48bb0cf36d329f7321c6cdc0d7ae36"
-SRC_URI[sha256sum] = "bc4a0f80a627c3aca6e7ea59d30e50cda118c61e0e3fab367ff1451d6ec8bdbd"
+SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
+SRC_URI[sha256sum] = "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b5eae74881bdb1fef"
-- 
2.1.4


