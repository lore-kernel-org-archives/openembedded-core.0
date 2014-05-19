Return-Path: <matt@arkanian.console-pimps.org>
X-Greylist: delayed 552 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 May 2014 15:22:20 UTC
Received: from arkanian.console-pimps.org (unknown [212.110.184.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA7165F1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 15:22:20 +0000 (UTC)
Received: by arkanian.console-pimps.org (Postfix, from userid 1002)
	id 04CDC6C064; Mon, 19 May 2014 16:13:09 +0100 (BST)
Received: from localhost (unknown [90.207.204.193])
	by arkanian.console-pimps.org (Postfix) with ESMTPSA id C9EFB6C05D;
	Mon, 19 May 2014 16:13:05 +0100 (BST)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 16:13:04 +0100
Message-Id: <1400512384-26235-1-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.9.0
Cc: Matt Fleming <matt.fleming@intel.com>,
	"Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH][Dora] openssl: fix CVE-2014-0198
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
X-List-Received-Date: Mon, 19 May 2014 15:22:22 -0000

From: "Maxin B. John" <maxin.john@enea.com>

A null pointer dereference bug was discovered in do_ssl3_write().
An attacker could possibly use this to cause OpenSSL to crash, resulting
in a denial of service.

https://access.redhat.com/security/cve/CVE-2014-0198

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---
 .../openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch | 23 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch
new file mode 100644
index 0000000..4c51d74
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
index bfdb25e..842a903 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -38,6 +38,7 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
             file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
             file://CVE-2014-0160.patch \
+            file://openssl-CVE-2014-0198-fix.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.0


