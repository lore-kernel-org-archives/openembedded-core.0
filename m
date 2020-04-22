Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2531.1587543665419261863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 01:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: xiao.zhang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03M8L4tM020293
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 01:21:04 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 01:20:46 -0700
From: "ZhangXiao" <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <xiao.zhang@windriver.com>
Subject: [OE-core][zeus][PATCH] openssl: fix CVE-2020-1967
Date: Wed, 22 Apr 2020 01:20:46 -0700
Message-ID: <20200422082046.2992-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Server or client applications that call the SSL_check_chain()
function during or after a TLS 1.3 handshake may crash due to
a NULL pointer dereference as a result of incorrect handling of
the "signature_algorithms_cert" TLS extension.

The crash occurs if an invalid or unrecognised signature
algorithm is received from the peer. This could be exploited
by a malicious peer in a Denial of Service attack.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../openssl/openssl/CVE-2020-1967.patch       | 53 +++++++++++++++++++
 .../openssl/openssl_1.1.1d.bb                 |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2020-1967.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2020-1967.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2020-1967.patch
new file mode 100644
index 0000000000..dfe8ed1332
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2020-1967.patch
@@ -0,0 +1,53 @@
+From 27b06c515c0a7e14853f84be85fb70c4450a6925 Mon Sep 17 00:00:00 2001
+From: Benjamin Kaduk <kaduk@mit.edu>
+Date: Fri, 10 Apr 2020 12:27:28 -0700
+Subject: [PATCH] Fix NULL dereference in SSL_check_chain() for TLS 1.3
+
+commit eb563247aef3e83dda7679c43f9649270462e5b1 upstream
+git://git.openssl.org/openssl.git
+
+In the tls1_check_sig_alg() helper function, we loop through the list of
+"signature_algorithms_cert" values received from the client and attempt
+to look up each one in turn in our internal table that maps wire
+codepoint to string-form name, digest and/or signature NID, etc., in
+order to compare the signature scheme from the peer's list against what
+is used to sign the certificates in the certificate chain we're
+checking.  Unfortunately, when the peer sends a value that we don't
+support, the lookup returns NULL, but we unconditionally dereference the
+lookup result for the comparison, leading to an application crash
+triggerable by an unauthenticated client.
+
+Since we will not be able to say anything about algorithms we don't
+recognize, treat NULL return from lookup as "does not match".
+
+We currently only apply the "signature_algorithm_cert" checks on TLS 1.3
+connections, so previous TLS versions are unaffected.  SSL_check_chain()
+is not called directly from libssl, but may be used by the application
+inside a callback (e.g., client_hello or cert callback) to verify that a
+candidate certificate chain will be acceptable to the client.
+
+CVE: CVE-2020-1967
+Upstream-Status: Backport
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ ssl/t1_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index b482019..5287d10 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -2099,7 +2099,7 @@ static int tls1_check_sig_alg(SSL *s, X509 *x, int default_nid)
+         sigalg = use_pc_sigalgs
+                  ? tls1_lookup_sigalg(s->s3->tmp.peer_cert_sigalgs[i])
+                  : s->shared_sigalgs[i];
+-        if (sig_nid == sigalg->sigandhash)
++        if (sigalg != NULL && sig_nid == sigalg->sigandhash)
+             return 1;
+     }
+     return 0;
+-- 
+2.23.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 169824a8be..1bf7073127 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://CVE-2019-1551.patch \
            file://reproducible.patch \
+           file://CVE-2020-1967.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.23.0

