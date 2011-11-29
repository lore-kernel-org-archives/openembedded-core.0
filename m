Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWm3-0001PH-22
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:07:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 15:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720813"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:22 -0800
Message-Id: <d35b587f669a4b2304a0349ededd7cac315ea97c.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 22/26] ocf-linux: Add ocf-linux to support openssl 1.0
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
X-List-Received-Date: Tue, 29 Nov 2011 23:07:39 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssl/ocf-linux.inc    |   25 ++++++++++++++++++++
 .../openssl/ocf-linux_20100325.bb                  |    6 ++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/ocf-linux.inc
 create mode 100644 meta/recipes-connectivity/openssl/ocf-linux_20100325.bb

diff --git a/meta/recipes-connectivity/openssl/ocf-linux.inc b/meta/recipes-connectivity/openssl/ocf-linux.inc
new file mode 100644
index 0000000..f4ec7c9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/ocf-linux.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Install required headers to enable OCF Linux support"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://README;md5=b02a793c9b7893b4ce1f39f0b231ccd7"
+ 
+INC_PR = "r3"
+
+SRC_URI = "http://sourceforge.net/projects/ocf-linux/files/ocf-linux/${PV}/ocf-linux-${PV}.tar.gz"
+
+S = "${WORKDIR}/ocf-linux-${PV}"
+
+# Need to unpack the the ocf-linux.tar.gz file contained inside the
+# downloaded tarball
+# Install the OCF Linux headers so that other packages such as openssl
+# can find them.  The headers must be in a crypto directory according to
+# the README file.
+do_install() {
+    cd ${S}
+    tar xzf ocf-linux.tar.gz
+    install -d ${D}${includedir}/crypto
+    install -m 0644 ${S}/ocf/*.h ${D}${includedir}/crypto/
+}
+
+ALLOW_EMPTY = "1"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-connectivity/openssl/ocf-linux_20100325.bb b/meta/recipes-connectivity/openssl/ocf-linux_20100325.bb
new file mode 100644
index 0000000..9dccc3c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/ocf-linux_20100325.bb
@@ -0,0 +1,6 @@
+require ocf-linux.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ce5ad54aa94226d496df1f0f3cf0c11f"
+SRC_URI[sha256sum] = "9d17cbd13849939c70699b520280e3b94cf77401cdc131108d4aeaaeea587f6b"
-- 
1.7.6.4



