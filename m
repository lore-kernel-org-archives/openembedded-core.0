Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0C765D36
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 18:16:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Apr 2014 11:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,819,1389772800"; d="scan'208";a="516878252"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.244])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2014 11:15:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 19:15:05 +0100
Message-Id: <8a4172619653ae8d992fb3eaccbf78a7e3903dd1.1396980809.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396980809.git.paul.eggleton@linux.intel.com>
References: <cover.1396980809.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396980809.git.paul.eggleton@linux.intel.com>
References: <cover.1396980809.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 1/4] Security Advisory - openssl - CVE-2013-4353
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
X-List-Received-Date: Tue, 08 Apr 2014 18:16:06 -0000

From: Yue Tao <Yue.Tao@windriver.com>

The ssl3_take_mac function in ssl/s3_both.c in OpenSSL 1.0.1 before
1.0.1f allows remote TLS servers to cause a denial of service (NULL
pointer dereference and application crash) via a crafted Next Protocol
Negotiation record in a TLS handshake.

(From OE-Core master rev: 35ccce7002188c8270d2fead35f9763b22776877)

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...or-TLS-record-tampering-bug-CVE-2013-4353.patch | 31 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
new file mode 100644
index 0000000..d03dc06
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
@@ -0,0 +1,31 @@
+From 197e0ea817ad64820789d86711d55ff50d71f631 Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Mon, 6 Jan 2014 14:35:04 +0000
+Subject: [PATCH] Fix for TLS record tampering bug CVE-2013-4353
+
+Upstream-Status: Backport
+commit 197e0ea817ad64820789d86711d55ff50d71f631 upstream
+
+ ssl/s3_both.c |    6 +++++-
+ 3 files changed, 11 insertions(+), 1 deletions(-)
+
+diff --git a/ssl/s3_both.c b/ssl/s3_both.c
+index 1e5dcab..53b9390 100644
+--- a/ssl/s3_both.c
++++ b/ssl/s3_both.c
+@@ -210,7 +210,11 @@ static void ssl3_take_mac(SSL *s)
+ 	{
+ 	const char *sender;
+ 	int slen;
+-
++	/* If no new cipher setup return immediately: other functions will
++	 * set the appropriate error.
++	 */
++	if (s->s3->tmp.new_cipher == NULL)
++		return;
+ 	if (s->state & SSL_ST_CONNECT)
+ 		{
+ 		sender=s->method->ssl3_enc->server_finished_label;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index ac27dba..3476d84 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
             file://find.pl \
+            file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.0


