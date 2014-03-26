Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7C86BE7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:08:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q98240001351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:08:02 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 02:08:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 17:08:43 +0800
Message-ID: <c8e8ae00d4750f43b0cc33af264a10ea2e605518.1395823715.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395823715.git.jackie.huang@windriver.com>
References: <cover.1395823715.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] Security Advisory - openssl - CVE-2013-4353
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
X-List-Received-Date: Wed, 26 Mar 2014 09:08:02 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The ssl3_take_mac function in ssl/s3_both.c in OpenSSL 1.0.1 before
1.0.1f allows remote TLS servers to cause a denial of service (NULL
pointer dereference and application crash) via a crafted Next Protocol
Negotiation record in a TLS handshake.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...or-TLS-record-tampering-bug-CVE-2013-4353.patch |   31 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    1 +
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
index a574e81..3e92234 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
+            file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.7.9.5


