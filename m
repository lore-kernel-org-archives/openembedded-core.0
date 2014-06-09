Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 42C406BD9A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:45:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="554540673"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:45:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:45:05 +0100
Message-Id: <a3e80de6d423c272a287bf3538196b48ac5ddec1.1402328640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402328640.git.paul.eggleton@linux.intel.com>
References: <cover.1402328640.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402328640.git.paul.eggleton@linux.intel.com>
References: <cover.1402328640.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] openssl: upgrade to 1.0.1h
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
X-List-Received-Date: Mon, 09 Jun 2014 15:45:21 -0000

Fixes the following security issues:

* CVE-2014-0224
* CVE-2014-0221
* CVE-2014-0195
* CVE-2014-3470

The patch for CVE-2010-5298, CVE-2014-0198 and a fix for building the
documentation are integrated upstream in this release and so were
dropped. Additionally, a patch from upstream was added in order to
fix a failure during do_compile_ptest_base.

A similar upgrade was also submitted by Yao Xinpan <yaoxp@cn.fujitsu.com>
and Lei Maohui <leimaohui@cn.fujitsu.com>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/heartbeat-test-private-api.patch       |  45 +++
 .../openssl/openssl/openssl-CVE-2010-5298.patch    |  24 --
 .../openssl/openssl-CVE-2014-0198-fix.patch        |  23 --
 .../openssl/openssl/openssl-fix-doc.patch          | 401 ---------------------
 .../{openssl_1.0.1g.bb => openssl_1.0.1h.bb}       |   8 +-
 5 files changed, 48 insertions(+), 453 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1g.bb => openssl_1.0.1h.bb} (86%)

diff --git a/meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch b/meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
new file mode 100644
index 0000000..3c77dfc
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
@@ -0,0 +1,45 @@
+From 2e251ba8feaa696f9408a19336d1fbab148df55e Mon Sep 17 00:00:00 2001
+From: Kurt Roeckx <kurt@roeckx.be>
+Date: Sat, 7 Jun 2014 13:32:23 +0200
+Subject: [PATCH] Link heartbeat_test with the static version of the libraries
+
+It's using an internal API that that might not be available in the shared
+library.
+
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/125]
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ test/Makefile | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/test/Makefile b/test/Makefile
+index f1816ac..1dd7bb9 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -420,6 +420,13 @@ BUILD_CMD=shlib_target=; if [ -n "$(SHARED_LIBS)" ]; then \
+ 		LIBDEPS="$(PEX_LIBS) $$LIBRARIES $(EX_LIBS)" \
+ 		link_app.$${shlib_target}
+ 
++BUILD_CMD_STATIC=shlib_target=; \
++	LIBRARIES="$(DLIBSSL) $(DLIBCRYPTO) $(LIBKRB5)"; \
++	$(MAKE) -f $(TOP)/Makefile.shared -e \
++		APPNAME=$$target$(EXE_EXT) OBJECTS="$$target.o" \
++		LIBDEPS="$(PEX_LIBS) $$LIBRARIES $(EX_LIBS)" \
++		link_app.$${shlib_target}
++
+ $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
+ 	@target=$(RSATEST); $(BUILD_CMD)
+ 
+@@ -618,7 +625,7 @@ $(V3NAMETEST)$(EXE_EXT): $(V3NAMETEST).o $(DLIBCRYPTO)
+ 	@target=$(V3NAMETEST); $(BUILD_CMD)
+ 
+ $(HEARTBEATTEST)$(EXE_EXT): $(HEARTBEATTEST).o $(DLIBCRYPTO)
+-	@target=$(HEARTBEATTEST); $(BUILD_CMD)
++	@target=$(HEARTBEATTEST); $(BUILD_CMD_STATIC)
+ 
+ #$(AESTEST).o: $(AESTEST).c
+ #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
+-- 
+1.9.3
+
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
deleted file mode 100644
index 417a774..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-openssl fix for CVE-2010-5298
-
-Upstream-Status: Backport
-
-Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
-through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
-attackers to inject data across sessions or cause a denial of service
-(use-after-free and parsing error) via an SSL connection in a
-multithreaded environment.
-
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---- a/ssl/s3_pkt.c
-+++ b/ssl/s3_pkt.c
-@@ -1013,7 +1013,7 @@ start:
- 				{
- 				s->rstate=SSL_ST_READ_HEADER;
- 				rr->off=0;
--				if (s->mode & SSL_MODE_RELEASE_BUFFERS)
-+				if (s->mode & SSL_MODE_RELEASE_BUFFERS && s->s3->rbuf.left == 0)
- 					ssl3_release_read_buffer(s);
- 				}
- 			}
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
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch b/meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
deleted file mode 100644
index 451256e..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
+++ /dev/null
@@ -1,401 +0,0 @@
-Fix documentation build errors with Perl 5.18 pod2man
-
-This fixes errors building man pages with newer versions of pod2man
-included with Perl 5.18.
-
-Upstream-Status: Submitted
-Signed-off-by: Jonathan Liu
-
-Index: openssl-1.0.1f/doc/apps/cms.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/apps/cms.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/apps/cms.pod	2014-02-28 10:13:51.899979213 +0200
-@@ -450,28 +450,28 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- the operation was completely successfully.
- 
--=item 1 
-+=item Z<>1 
- 
- an error occurred parsing the command options.
- 
--=item 2
-+=item Z<>2
- 
- one of the input files could not be read.
- 
--=item 3
-+=item Z<>3
- 
- an error occurred creating the CMS file or when reading the MIME
- message.
- 
--=item 4
-+=item Z<>4
- 
- an error occurred decrypting or verifying the message.
- 
--=item 5
-+=item Z<>5
- 
- the message was verified correctly but an error occurred writing out
- the signers certificates.
-Index: openssl-1.0.1f/doc/apps/smime.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/apps/smime.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/apps/smime.pod	2014-02-28 10:16:57.795979233 +0200
-@@ -308,28 +308,28 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- the operation was completely successfully.
- 
--=item 1 
-+=item Z<>1 
- 
- an error occurred parsing the command options.
- 
--=item 2
-+=item Z<>2
- 
- one of the input files could not be read.
- 
--=item 3
-+=item Z<>3
- 
- an error occurred creating the PKCS#7 file or when reading the MIME
- message.
- 
--=item 4
-+=item Z<>4
- 
- an error occurred decrypting or verifying the message.
- 
--=item 5
-+=item Z<>5
- 
- the message was verified correctly but an error occurred writing out
- the signers certificates.
-Index: openssl-1.0.1f/doc/ssl/SSL_COMP_add_compression_method.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_COMP_add_compression_method.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_COMP_add_compression_method.pod	2014-02-28 10:18:09.679979225 +0200
-@@ -53,11 +53,11 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The operation succeeded.
- 
--=item 1
-+=item Z<>1
- 
- The operation failed. Check the error queue to find out the reason.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_CTX_add_session.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_add_session.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_CTX_add_session.pod	2014-02-28 10:18:42.687979221 +0200
-@@ -52,13 +52,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
-  The operation failed. In case of the add operation, it was tried to add
-  the same (identical) session twice. In case of the remove operation, the
-  session was not found in the cache.
- 
--=item 1
-+=item Z<>1
-  
-  The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_CTX_load_verify_locations.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_load_verify_locations.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_CTX_load_verify_locations.pod	2014-02-28 10:19:09.079979218 +0200
-@@ -100,13 +100,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The operation failed because B<CAfile> and B<CApath> are NULL or the
- processing at one of the locations specified failed. Check the error
- stack to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_CTX_set_client_CA_list.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_set_client_CA_list.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_CTX_set_client_CA_list.pod	2014-02-28 10:19:42.999979220 +0200
-@@ -66,13 +66,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- A failure while manipulating the STACK_OF(X509_NAME) object occurred or
- the X509_NAME could not be extracted from B<cacert>. Check the error stack
- to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_CTX_set_session_id_context.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_set_session_id_context.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_CTX_set_session_id_context.pod	2014-02-28 10:20:06.495979211 +0200
-@@ -64,13 +64,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The length B<sid_ctx_len> of the session id context B<sid_ctx> exceeded
- the maximum allowed length of B<SSL_MAX_SSL_SESSION_ID_LENGTH>. The error
- is logged to the error stack.
- 
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_CTX_set_ssl_version.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_set_ssl_version.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_CTX_set_ssl_version.pod	2014-02-28 10:20:32.111979208 +0200
-@@ -42,11 +42,11 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The new choice failed, check the error stack to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_use_psk_identity_hint.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_CTX_use_psk_identity_hint.pod	2014-02-28 10:21:12.351979203 +0200
-@@ -96,7 +96,7 @@
- connection will fail with decryption_error before it will be finished
- completely.
- 
--=item 0
-+=item Z<>0
- 
- PSK identity was not found. An "unknown_psk_identity" alert message
- will be sent and the connection setup fails.
-Index: openssl-1.0.1f/doc/ssl/SSL_accept.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_accept.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_accept.pod	2014-02-28 10:21:51.535979215 +0200
-@@ -44,13 +44,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The TLS/SSL handshake was not successful but was shut down controlled and
- by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
- return value B<ret> to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
- established.
-Index: openssl-1.0.1f/doc/ssl/SSL_clear.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_clear.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_clear.pod	2014-02-28 10:22:13.087979196 +0200
-@@ -56,12 +56,12 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The SSL_clear() operation could not be performed. Check the error stack to
- find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The SSL_clear() operation was successful.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_connect.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_connect.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_connect.pod	2014-02-28 10:22:33.991979193 +0200
-@@ -41,13 +41,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The TLS/SSL handshake was not successful but was shut down controlled and
- by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
- return value B<ret> to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
- established.
-Index: openssl-1.0.1f/doc/ssl/SSL_do_handshake.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_do_handshake.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_do_handshake.pod	2014-02-28 10:22:56.887979159 +0200
-@@ -45,13 +45,13 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The TLS/SSL handshake was not successful but was shut down controlled and
- by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
- return value B<ret> to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
- established.
-Index: openssl-1.0.1f/doc/ssl/SSL_read.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_read.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_read.pod	2014-02-28 10:23:15.303979188 +0200
-@@ -86,7 +86,7 @@
- The read operation was successful; the return value is the number of
- bytes actually read from the TLS/SSL connection.
- 
--=item 0
-+=item Z<>0
- 
- The read operation was not successful. The reason may either be a clean
- shutdown due to a "close notify" alert sent by the peer (in which case
-Index: openssl-1.0.1f/doc/ssl/SSL_session_reused.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_session_reused.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_session_reused.pod	2014-02-28 10:23:36.615979186 +0200
-@@ -27,11 +27,11 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- A new session was negotiated.
- 
--=item 1
-+=item Z<>1
- 
- A session was reused.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_set_fd.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_set_fd.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_set_fd.pod	2014-02-28 10:23:57.599979183 +0200
-@@ -35,11 +35,11 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The operation failed. Check the error stack to find out why.
- 
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_set_session.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_set_session.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_set_session.pod	2014-02-28 10:24:16.943979181 +0200
-@@ -37,11 +37,11 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The operation failed; check the error stack to find out the reason.
- 
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
-Index: openssl-1.0.1f/doc/ssl/SSL_shutdown.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_shutdown.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_shutdown.pod	2014-02-28 10:25:03.623979175 +0200
-@@ -92,19 +92,19 @@
- 
- =over 4
- 
--=item 0
-+=item Z<>0
- 
- The shutdown is not yet finished. Call SSL_shutdown() for a second time,
- if a bidirectional shutdown shall be performed.
- The output of L<SSL_get_error(3)|SSL_get_error(3)> may be misleading, as an
- erroneous SSL_ERROR_SYSCALL may be flagged even though no error occurred.
- 
--=item 1
-+=item Z<>1
- 
- The shutdown was successfully completed. The "close notify" alert was sent
- and the peer's "close notify" alert was received.
- 
--=item -1
-+=item Z<>-1
- 
- The shutdown was not successful because a fatal error occurred either
- at the protocol level or a connection failure occurred. It can also occur if
-Index: openssl-1.0.1f/doc/ssl/SSL_write.pod
-===================================================================
---- openssl-1.0.1f.orig/doc/ssl/SSL_write.pod	2014-01-06 15:47:42.000000000 +0200
-+++ openssl-1.0.1f/doc/ssl/SSL_write.pod	2014-02-28 10:25:36.031979168 +0200
-@@ -79,7 +79,7 @@
- The write operation was successful, the return value is the number of
- bytes actually written to the TLS/SSL connection.
- 
--=item 0
-+=item Z<>0
- 
- The write operation was not successful. Probably the underlying connection
- was closed. Call SSL_get_error() with the return value B<ret> to find out,
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
similarity index 86%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
index bbf1455..ebb1029 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
@@ -27,21 +27,19 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/no-symbolic.patch \
             file://debian/debian-targets.patch \
             file://openssl_fix_for_x32.patch \
-            file://openssl-fix-doc.patch \
             file://fix-cipher-des-ede3-cfb1.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
             file://openssl-fix-des.pod-error.patch \
-            file://openssl-CVE-2014-0198-fix.patch \
             file://Makefiles-ptest.patch \
+            file://heartbeat-test-private-api.patch \
             file://run-ptest \
-            file://openssl-CVE-2010-5298.patch \
            "
 
-SRC_URI[md5sum] = "de62b43dfcd858e66a74bee1c834e959"
-SRC_URI[sha256sum] = "53cb818c3b90e507a8348f4f5eaedb05d8bfe5358aabb508b7263cc670c3e028"
+SRC_URI[md5sum] = "8d6d684a9430d5cc98a62a5d8fbda8cf"
+SRC_URI[sha256sum] = "9d1c8a9836aa63e2c6adb684186cbd4371c9e9dcc01d6e3bb447abf2d4d3d093"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.9.3


