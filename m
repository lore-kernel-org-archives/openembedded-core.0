Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RisKK-0006B9-8b
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 19:46:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 10:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109151078"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 10:38:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 10:38:37 -0800
Message-Id: <024ef12e7ae22df2e8468ccdf1d78d6657905cd6.1325788605.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325788605.git.sgw@linux.intel.com>
References: <cover.1325788605.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325788605.git.sgw@linux.intel.com>
References: <cover.1325788605.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] gnutls: remove gettext patch for non-GPLv3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 18:46:12 -0000

GPLv2 version of gnutls does not need the gettext 0.18 patch
since it still uses the over version of gettext that is also
GPLv2.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls_2.12.14.bb |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
index 045ba69..21fd187 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
@@ -1,10 +1,17 @@
 require gnutls.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += "file://gnutls-openssl.patch \
-            file://configure-fix.patch \
-            file://fix-gettext-version.patch"
+            file://configure-fix.patch"
+
+python() {
+    if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
+        # if GPLv3 add patch
+        src_uri = (d.getVar("SRC_URI", False) or "").split()
+        src_uri.append("file://fix-gettext-version.patch")
+        d.setVar("SRC_URI", " ".join(src_uri))
+}
 
 SRC_URI[md5sum] = "555687a7ffefba0bd9de1e71cb61402c"
 SRC_URI[sha256sum] = "5ee72ba6de7a23cf315792561954451e022dac8730149ca95f93c61e95be2ce3"
-- 
1.7.6.4



