Return-Path: <radzy@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E961771A1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 22:17:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAFMHTht014476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 14:17:29 -0800 (PST)
Received: from ala-d3039.corp.ad.wrs.com (147.11.216.76) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 15 Nov 2016 14:17:28 -0800
From: "T.O. Radzy Radzykewycz" <radzy@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 14:14:38 -0800
Message-ID: <1479248078-19815-1-git-send-email-radzy@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] [V2] OpenSSL: CVE-2004-2761 replace MD5 hash algorithm
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
X-List-Received-Date: Tue, 15 Nov 2016 22:17:28 -0000
Content-Type: text/plain

Use SHA256 as default digest for OpenSSL instead of MD5.

CVE: CVE-2004-2761

    The MD5 Message-Digest Algorithm is not collision resistant,
    which makes it easier for context-dependent attackers to
    conduct spoofing attacks, as demonstrated by attacks on the
    use of MD5 in the signature algorithm of an X.509 certificate.

Upstream-Status: Backport
Backport from OpenSSL 2.0 to OpenSSL 1.0.2
Commit f8547f62c212837dbf44fb7e2755e5774a59a57b

Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: T.O. Radzy Radzykewycz <radzy@windriver.com>
---
 .../Use-SHA256-not-MD5-as-default-digest.patch     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
new file mode 100644
index 000000000000..58c9ee784433
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
@@ -0,0 +1,69 @@
+From d795f5f20a29adecf92c09459a3ee07ffac01a99 Mon Sep 17 00:00:00 2001
+From: Rich Salz <rsalz@akamai.com>
+Date: Sat, 13 Jun 2015 17:03:39 -0400
+Subject: [PATCH] Use SHA256 not MD5 as default digest.
+
+Commit f8547f62c212837dbf44fb7e2755e5774a59a57b upstream.
+
+Upstream-Status: Backport
+Backport from OpenSSL 2.0 to OpenSSL 1.0.2
+Commit f8547f62c212837dbf44fb7e2755e5774a59a57b   
+
+CVE: CVE-2004-2761
+
+    The MD5 Message-Digest Algorithm is not collision resistant,
+    which makes it easier for context-dependent attackers to            
+    conduct spoofing attacks, as demonstrated by attacks on the     
+    use of MD5 in the signature algorithm of an X.509 certificate.     
+
+Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>     
+Signed-off-by: T.O. Radzy Radzykewycz <radzy@windriver.com> 
+---
+ apps/ca.c   | 2 +-
+ apps/dgst.c | 2 +-
+ apps/enc.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/apps/ca.c b/apps/ca.c
+index 3b7336c..8f3a84b 100644
+--- a/apps/ca.c
++++ b/apps/ca.c
+@@ -1612,7 +1612,7 @@ static int certify_cert(X509 **xret, char *infile, EVP_PKEY *pkey, X509 *x509,
+     } else
+         BIO_printf(bio_err, "Signature ok\n");
+ 
+-    if ((rreq = X509_to_X509_REQ(req, NULL, EVP_md5())) == NULL)
++    if ((rreq = X509_to_X509_REQ(req, NULL, NULL)) == NULL)
+         goto err;
+ 
+     ok = do_body(xret, pkey, x509, dgst, sigopts, policy, db, serial, subj,
+diff --git a/apps/dgst.c b/apps/dgst.c
+index 95e5fa3..0d1529f 100644
+--- a/apps/dgst.c
++++ b/apps/dgst.c
+@@ -442,7 +442,7 @@ int MAIN(int argc, char **argv)
+             goto end;
+         }
+         if (md == NULL)
+-            md = EVP_md5();
++            md = EVP_sha256();
+         if (!EVP_DigestInit_ex(mctx, md, impl)) {
+             BIO_printf(bio_err, "Error setting digest %s\n", pname);
+             ERR_print_errors(bio_err);
+diff --git a/apps/enc.c b/apps/enc.c
+index 7b7c70b..a7d944c 100644
+--- a/apps/enc.c
++++ b/apps/enc.c
+@@ -344,7 +344,7 @@ int MAIN(int argc, char **argv)
+     }
+ 
+     if (dgst == NULL) {
+-        dgst = EVP_md5();
++        dgst = EVP_sha256();
+     }
+ 
+     if (bufsize != NULL) {
+-- 
+1.9.1
+
-- 
1.9.1


