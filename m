Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4459165D24
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 21:33:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2014 11:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,819,1389772800"; d="scan'208";a="489410088"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.244])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2014 11:37:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 19:37:40 +0100
Message-Id: <530228d1d03efabbcd8a8abd9f80de73c0940f7a.1396982039.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396982039.git.paul.eggleton@linux.intel.com>
References: <cover.1396982039.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396982039.git.paul.eggleton@linux.intel.com>
References: <cover.1396982039.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 4/4] openssl: backport fix for CVE-2014-0160
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
X-List-Received-Date: Tue, 08 Apr 2014 21:33:39 -0000

Fixes the "heartbleed" TLS vulnerability (CVE-2014-0160). More
information here:

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0160

Patch borrowed from Debian; this is just a tweaked version of the
upstream commit (without patching the CHANGES file which otherwise
would fail to apply on top of this version).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/openssl-1.0.1e/CVE-2014-0160.patch     | 118 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/CVE-2014-0160.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/CVE-2014-0160.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/CVE-2014-0160.patch
new file mode 100644
index 0000000..c06cd64
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/CVE-2014-0160.patch
@@ -0,0 +1,118 @@
+From 96db9023b881d7cd9f379b0c154650d6c108e9a3 Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Sun, 6 Apr 2014 00:51:06 +0100
+Subject: [PATCH] Add heartbeat extension bounds check.
+
+A missing bounds check in the handling of the TLS heartbeat extension
+can be used to reveal up to 64k of memory to a connected client or
+server.
+
+Thanks for Neel Mehta of Google Security for discovering this bug and to
+Adam Langley <agl@chromium.org> and Bodo Moeller <bmoeller@acm.org> for
+preparing the fix (CVE-2014-0160)
+
+Patch (tweaked version of upstream fix without CHANGES change) borrowed
+from Debian.
+
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ ssl/d1_both.c | 26 ++++++++++++++++++--------
+ ssl/t1_lib.c  | 14 +++++++++-----
+ 3 files changed, 36 insertions(+), 13 deletions(-)
+
+diff --git a/ssl/d1_both.c b/ssl/d1_both.c
+index 7a5596a..2e8cf68 100644
+--- a/ssl/d1_both.c
++++ b/ssl/d1_both.c
+@@ -1459,26 +1459,36 @@ dtls1_process_heartbeat(SSL *s)
+ 	unsigned int payload;
+ 	unsigned int padding = 16; /* Use minimum padding */
+ 
+-	/* Read type and payload length first */
+-	hbtype = *p++;
+-	n2s(p, payload);
+-	pl = p;
+-
+ 	if (s->msg_callback)
+ 		s->msg_callback(0, s->version, TLS1_RT_HEARTBEAT,
+ 			&s->s3->rrec.data[0], s->s3->rrec.length,
+ 			s, s->msg_callback_arg);
+ 
++	/* Read type and payload length first */
++	if (1 + 2 + 16 > s->s3->rrec.length)
++		return 0; /* silently discard */
++	hbtype = *p++;
++	n2s(p, payload);
++	if (1 + 2 + payload + 16 > s->s3->rrec.length)
++		return 0; /* silently discard per RFC 6520 sec. 4 */
++	pl = p;
++
+ 	if (hbtype == TLS1_HB_REQUEST)
+ 		{
+ 		unsigned char *buffer, *bp;
++		unsigned int write_length = 1 /* heartbeat type */ +
++					    2 /* heartbeat length */ +
++					    payload + padding;
+ 		int r;
+ 
++		if (write_length > SSL3_RT_MAX_PLAIN_LENGTH)
++			return 0;
++
+ 		/* Allocate memory for the response, size is 1 byte
+ 		 * message type, plus 2 bytes payload length, plus
+ 		 * payload, plus padding
+ 		 */
+-		buffer = OPENSSL_malloc(1 + 2 + payload + padding);
++		buffer = OPENSSL_malloc(write_length);
+ 		bp = buffer;
+ 
+ 		/* Enter response type, length and copy payload */
+@@ -1489,11 +1499,11 @@ dtls1_process_heartbeat(SSL *s)
+ 		/* Random padding */
+ 		RAND_pseudo_bytes(bp, padding);
+ 
+-		r = dtls1_write_bytes(s, TLS1_RT_HEARTBEAT, buffer, 3 + payload + padding);
++		r = dtls1_write_bytes(s, TLS1_RT_HEARTBEAT, buffer, write_length);
+ 
+ 		if (r >= 0 && s->msg_callback)
+ 			s->msg_callback(1, s->version, TLS1_RT_HEARTBEAT,
+-				buffer, 3 + payload + padding,
++				buffer, write_length,
+ 				s, s->msg_callback_arg);
+ 
+ 		OPENSSL_free(buffer);
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index b82fada..bddffd9 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -2588,16 +2588,20 @@ tls1_process_heartbeat(SSL *s)
+ 	unsigned int payload;
+ 	unsigned int padding = 16; /* Use minimum padding */
+ 
+-	/* Read type and payload length first */
+-	hbtype = *p++;
+-	n2s(p, payload);
+-	pl = p;
+-
+ 	if (s->msg_callback)
+ 		s->msg_callback(0, s->version, TLS1_RT_HEARTBEAT,
+ 			&s->s3->rrec.data[0], s->s3->rrec.length,
+ 			s, s->msg_callback_arg);
+ 
++	/* Read type and payload length first */
++	if (1 + 2 + 16 > s->s3->rrec.length)
++		return 0; /* silently discard */
++	hbtype = *p++;
++	n2s(p, payload);
++	if (1 + 2 + payload + 16 > s->s3->rrec.length)
++		return 0; /* silently discard per RFC 6520 sec. 4 */
++	pl = p;
++
+ 	if (hbtype == TLS1_HB_REQUEST)
+ 		{
+ 		unsigned char *buffer, *bp;
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index fa0a648..485112c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
             file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
             file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
+            file://CVE-2014-0160.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.0


