Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9651C6FAB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:08:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q985dg001354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:08:05 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 02:08:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 17:08:45 +0800
Message-ID: <7e79b8fc1964fb54b44a6fba451946cfc044a4e0.1395823715.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395823715.git.jackie.huang@windriver.com>
References: <cover.1395823715.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] Security Advisory - openssl - CVE-2013-6449
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
X-List-Received-Date: Wed, 26 Mar 2014 09:08:04 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The ssl_get_algorithm2 function in ssl/s3_lib.c in OpenSSL before 1.0.2
obtains a certain version number from an incorrect data structure, which
allows remote attackers to cause a denial of service (daemon crash) via
crafted traffic from a TLS 1.2 client.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...e-version-in-SSL_METHOD-not-SSL-structure.patch |   33 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
new file mode 100644
index 0000000..e5a8ade
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
@@ -0,0 +1,33 @@
+From ca989269a2876bae79393bd54c3e72d49975fc75 Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Thu, 19 Dec 2013 14:37:39 +0000
+Subject: [PATCH] Use version in SSL_METHOD not SSL structure.
+
+Upstream-Status: Backport
+commit ca989269a2876bae79393bd54c3e72d49975fc75 upstream
+
+When deciding whether to use TLS 1.2 PRF and record hash algorithms
+use the version number in the corresponding SSL_METHOD structure
+instead of the SSL structure. The SSL structure version is sometimes
+inaccurate. Note: OpenSSL 1.0.2 and later effectively do this already.
+(CVE-2013-6449)
+---
+ ssl/s3_lib.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/ssl/s3_lib.c b/ssl/s3_lib.c
+index bf832bb..c4ef273 100644
+--- a/ssl/s3_lib.c
++++ b/ssl/s3_lib.c
+@@ -4286,7 +4286,7 @@ need to go to SSL_ST_ACCEPT.
+ long ssl_get_algorithm2(SSL *s)
+ 	{
+ 	long alg2 = s->s3->tmp.new_cipher->algorithm2;
+-	if (TLS1_get_version(s) >= TLS1_2_VERSION &&
++	if (s->method->version == TLS1_2_VERSION &&
+ 	    alg2 == (SSL_HANDSHAKE_MAC_DEFAULT|TLS1_PRF))
+ 		return SSL_HANDSHAKE_MAC_SHA256 | TLS1_PRF_SHA256;
+ 	return alg2;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 4b9fd36..4787c67 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://find.pl \
             file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
             file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
+            file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.7.9.5


