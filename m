Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigy5-0001EP-KT
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:31:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663941"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:31:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:53 -0800
Message-Id: <9fe5b8a0739fae650156942dd27f5b5a934203e1.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/28] gnutls: remove gettext patch for non-GPLv3
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:30 -0000

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



