Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B953065F54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 00:53:36 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Tue, 6 May 2014
	02:53:35 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 05C5928C882;
	Tue,  6 May 2014 02:53:36 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 02:53:34 +0200
Message-ID: <1399337614-415-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] openssl: fix CVE-2014-0198
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
X-List-Received-Date: Tue, 06 May 2014 00:53:39 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

A null pointer dereference bug was discovered in do_ssl3_write().
An attacker could possibly use this to cause OpenSSL to crash, resulting
in a denial of service.

https://access.redhat.com/security/cve/CVE-2014-0198

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../openssl/openssl-CVE-2014-0198-fix.patch        |   23 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |    1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
new file mode 100644
index 0000000..4c51d74
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index 5ca29d0..7c44546 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://configure-targets.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
             file://openssl-fix-des.pod-error.patch \
+            file://openssl-CVE-2014-0198-fix.patch \
             file://Makefiles-ptest.patch \
             file://run-ptest \
            "
-- 
1.7.10.4


