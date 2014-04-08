Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7EB65D40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 18:51:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2014 11:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,819,1389772800"; d="scan'208";a="516878302"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.244])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2014 11:15:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 19:15:07 +0100
Message-Id: <6f6c2432bb38e65381de7ca16fa8fcaf88786ad3.1396980809.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396980809.git.paul.eggleton@linux.intel.com>
References: <cover.1396980809.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396980809.git.paul.eggleton@linux.intel.com>
References: <cover.1396980809.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 3/4] Security Advisory - openssl - CVE-2013-6449
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
X-List-Received-Date: Tue, 08 Apr 2014 18:51:46 -0000

From: Yue Tao <Yue.Tao@windriver.com>

The ssl_get_algorithm2 function in ssl/s3_lib.c in OpenSSL before 1.0.2
obtains a certain version number from an incorrect data structure, which
allows remote attackers to cause a denial of service (daemon crash) via
crafted traffic from a TLS 1.2 client.

(From OE-Core master rev: 3e0ac7357a962e3ef6595d21ec4843b078a764dd)

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...e-version-in-SSL_METHOD-not-SSL-structure.patch | 33 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
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
index 32e03a5..3313ed5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://configure-targets.patch \
             file://find.pl \
             file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
             file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
+            file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.0


