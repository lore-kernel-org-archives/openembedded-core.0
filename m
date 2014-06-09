Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 793C965ED7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:51:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2014 08:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="552717639"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2014 08:51:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:51:17 +0100
Message-Id: <a19b72f7bab8514d2c037418b0bc756f1f4b45ca.1402328991.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402328991.git.paul.eggleton@linux.intel.com>
References: <cover.1402328991.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402328991.git.paul.eggleton@linux.intel.com>
References: <cover.1402328991.git.paul.eggleton@linux.intel.com>
Subject: [daisy][PATCH 2/5] openssl: use upstream fix for CVE-2014-0198
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
X-List-Received-Date: Mon, 09 Jun 2014 15:51:44 -0000

This replaces the fix for CVE-2014-0198 with one borrowed from Fedora,
which is the same as the patch which was actually applied upstream for
the issue, i.e.:

https://git.openssl.org/gitweb/?p=openssl.git;a=commit;h=b107586c0c3447ea22dba8698ebbcd81bb29d48c

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/openssl-1.0.1e-cve-2014-0198.patch     | 38 ++++++++++++++++++++++
 .../openssl/openssl-CVE-2014-0198-fix.patch        | 23 -------------
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |  2 +-
 3 files changed, 39 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0198.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0198.patch b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0198.patch
new file mode 100644
index 0000000..12dcfb7
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0198.patch
@@ -0,0 +1,38 @@
+From: Matt Caswell <matt@openssl.org>
+Date: Sun, 11 May 2014 23:38:37 +0000 (+0100)
+Subject: Fixed NULL pointer dereference. See PR#3321
+X-Git-Url: https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff_plain;h=b107586
+
+Fixed NULL pointer dereference. See PR#3321
+
+Patch borrowed from Fedora
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+
+diff --git a/ssl/s3_pkt.c b/ssl/s3_pkt.c
+index 40eb0dd..d961d12 100644
+--- a/ssl/s3_pkt.c
++++ b/ssl/s3_pkt.c
+@@ -657,9 +657,6 @@ static int do_ssl3_write(SSL *s, int type, const unsigned char *buf,
+ 	SSL3_BUFFER *wb=&(s->s3->wbuf);
+ 	SSL_SESSION *sess;
+ 
+- 	if (wb->buf == NULL)
+-		if (!ssl3_setup_write_buffer(s))
+-			return -1;
+ 
+ 	/* first check if there is a SSL3_BUFFER still being written
+ 	 * out.  This will happen with non blocking IO */
+@@ -675,6 +672,10 @@ static int do_ssl3_write(SSL *s, int type, const unsigned char *buf,
+ 		/* if it went, fall through and send more stuff */
+ 		}
+ 
++ 	if (wb->buf == NULL)
++		if (!ssl3_setup_write_buffer(s))
++			return -1;
++
+ 	if (len == 0 && !create_empty_fragment)
+ 		return 0;
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
deleted file mode 100644
index 4c51d74..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Backport
-
-Reference: https://bugzilla.redhat.com/show_bug.cgi?id=1093837
-
-CVE-2014-0198: An attacker can trigger generation of an SSL
-alert which could cause a null pointer dereference.
-
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
----
-diff -Naur openssl-1.0.1g-orig/ssl/s3_pkt.c openssl-1.0.1g/ssl/s3_pkt.c
---- openssl-1.0.1g-orig/ssl/s3_pkt.c	2014-03-17 17:14:20.000000000 +0100
-+++ openssl-1.0.1g/ssl/s3_pkt.c	2014-05-06 02:32:43.862587660 +0200
-@@ -657,6 +657,10 @@
- 		if (i <= 0)
- 			return(i);
- 		/* if it went, fall through and send more stuff */
-+		/* we may have released our buffer, so get it again */
-+		if (wb->buf == NULL)
-+			if (!ssl3_setup_write_buffer(s))
-+				return -1;
- 		}
- 
- 	if (len == 0 && !create_empty_fragment)
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index d4fc91d..18f0baf 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -34,8 +34,8 @@ SRC_URI += "file://configure-targets.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
             file://openssl-fix-des.pod-error.patch \
-            file://openssl-CVE-2014-0198-fix.patch \
             file://openssl-1.0.1e-cve-2014-0195.patch \
+            file://openssl-1.0.1e-cve-2014-0198.patch \
             file://openssl-CVE-2010-5298.patch \
            "
 
-- 
1.9.3


