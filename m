Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C791271957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:30:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Oct 2016 01:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="1068367607"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2016 01:30:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 11:30:01 +0300
Message-Id: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476087291.git.jussi.kukkonen@intel.com>
References: <cover.1476087291.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] gnutls: Backport certificate check fix
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
X-List-Received-Date: Mon, 10 Oct 2016 08:30:32 -0000

Previously the OCSP certificate check wouldn't verify the serial
length and could succeed in cases it shouldn't (CVE-2016-7444).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gnutls/gnutls/CVE-2016-7444.patch              | 35 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch b/meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch
new file mode 100644
index 0000000..215be5a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch
@@ -0,0 +1,35 @@
+CVE: CVE-2016-7444
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Upstream commit follows:
+
+
+From 964632f37dfdfb914ebc5e49db4fa29af35b1de9 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
+Date: Sat, 27 Aug 2016 17:00:22 +0200
+Subject: [PATCH] ocsp: corrected the comparison of the serial size in OCSP response
+
+Previously the OCSP certificate check wouldn't verify the serial length
+and could succeed in cases it shouldn't.
+
+Reported by Stefan Buehler.
+---
+ lib/x509/ocsp.c | 1 +
+ 1 file changed, 1 insertion(+), 0 deletions(-)
+
+diff --git a/lib/x509/ocsp.c b/lib/x509/ocsp.c
+index 92db9b6..8181f2e 100644
+--- a/lib/x509/ocsp.c
++++ b/lib/x509/ocsp.c
+@@ -1318,6 +1318,7 @@ gnutls_ocsp_resp_check_crt(gnutls_ocsp_resp_t resp,
+ 		gnutls_assert();
+ 		goto cleanup;
+ 	}
++	cserial.size = t;
+ 
+ 	if (rserial.size != cserial.size
+ 	    || memcmp(cserial.data, rserial.data, rserial.size) != 0) {
+--
+libgit2 0.24.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
index 8317eb4..b2dbb07 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://0001-Use-correct-include-dir-with-minitasn.patch \
+            file://CVE-2016-7444.patch \
            "
 SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
 SRC_URI[sha256sum] = "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b5eae74881bdb1fef"
-- 
2.1.4


