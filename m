Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6F04606E0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 21:20:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2014 14:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1020,1389772800"; d="scan'208";a="536676756"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2014 14:20:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 May 2014 14:20:01 -0700
Message-Id: <1399670401-1448-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH][Dylan] openssl: fix CVE-2014-0198
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
X-List-Received-Date: Fri, 09 May 2014 21:20:32 -0000

From: "Maxin B. John" <maxin.john@enea.com>

A null pointer dereference bug was discovered in do_ssl3_write().
An attacker could possibly use this to cause OpenSSL to crash, resulting
in a denial of service.

https://access.redhat.com/security/cve/CVE-2014-0198

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch | 23 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch
new file mode 100644
index 0000000..d7cd974
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+Reference: https://bugzilla.redhat.com/show_bug.cgi?id=1093837
+
+CVE-2014-0198: An attacker can trigger generation of an SSL
+alert which could cause a null pointer dereference.
+
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+diff -Naur openssl-1.0.1g-orig/ssl/s3_pkt.c openssl-1.0.1g/ssl/s3_pkt.c
+--- openssl-1.0.1g-orig/ssl/s3_pkt.c	2014-03-17 17:14:20.000000000 +0100
++++ openssl-1.0.1g/ssl/s3_pkt.c	2014-05-06 02:32:43.862587660 +0200
+@@ -657,6 +657,10 @@
+ 		if (i <= 0)
+ 			return(i);
+ 		/* if it went, fall through and send more stuff */
++		/* we may have released our buffer, so get it again */
++		if (wb->buf == NULL)
++			if (!ssl3_setup_write_buffer(s))
++				return -1;
+ 		}
+ 
+ 	if (len == 0 && !create_empty_fragment)
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 103cb48..bc1b944 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -36,6 +36,7 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
             file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
             file://CVE-2014-0160.patch \
+            file://openssl-CVE-2014-0198-fix.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.8.3.2


