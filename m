Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 51EB371450
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 20:06:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2014 13:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="382099474"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.5])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2014 13:01:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Sep 2014 13:06:28 -0700
Message-Id: <bb42e1d6e1ffe69ba4a36da25e334d7d75e40b28.1409947480.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] nss: Upgrade to 3.17
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
X-List-Received-Date: Fri, 05 Sep 2014 20:06:31 -0000

CVE patches removed since they have been implemented upstream
Rename patch dir (files) to generic PN name

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../nss/files/nss-3.15.1-fix-CVE-2013-1739.patch   |  81 --
 .../nss/files/nss-3.15.1-fix-CVE-2013-1741.patch   |  92 ---
 .../nss/files/nss-3.15.1-fix-CVE-2013-5605.patch   |  18 -
 .../nss/files/nss-CVE-2013-1740.patch              | 916 ---------------------
 .../nss/files/nss-CVE-2013-5606.patch              |  48 --
 .../nss/files/nss-CVE-2014-1492.patch              |  68 --
 .../nss/files/nss-CVE-2014-1544.patch              |  41 -
 meta/recipes-support/nss/nss.inc                   |   9 +-
 .../nss-fix-incorrect-shebang-of-perl.patch        |   0
 .../nss-fix-support-cross-compiling.patch          |   0
 .../nss-no-rpath-for-cross-compiling.patch         |   0
 meta/recipes-support/nss/{files => nss}/nss.pc.in  |   0
 .../recipes-support/nss/{files => nss}/signlibs.sh |   0
 meta/recipes-support/nss/nss_3.15.1.bb             |   9 -
 meta/recipes-support/nss/nss_3.17.bb               |   8 +
 15 files changed, 9 insertions(+), 1281 deletions(-)
 delete mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-5606.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1544.patch
 rename meta/recipes-support/nss/{files => nss}/nss-fix-incorrect-shebang-of-perl.patch (100%)
 rename meta/recipes-support/nss/{files => nss}/nss-fix-support-cross-compiling.patch (100%)
 rename meta/recipes-support/nss/{files => nss}/nss-no-rpath-for-cross-compiling.patch (100%)
 rename meta/recipes-support/nss/{files => nss}/nss.pc.in (100%)
 rename meta/recipes-support/nss/{files => nss}/signlibs.sh (100%)
 delete mode 100644 meta/recipes-support/nss/nss_3.15.1.bb
 create mode 100644 meta/recipes-support/nss/nss_3.17.bb

diff --git a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch
deleted file mode 100644
index 1a159c3..0000000
--- a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
-
---- a/nss/lib/ssl/ssl3con.c
-+++ b/nss/lib/ssl/ssl3con.c
-@@ -10509,7 +10509,7 @@ ssl_RemoveSSLv3CBCPadding(sslBuffer *pla
-     /* SSLv3 padding bytes are random and cannot be checked. */
-     t = plaintext->len;
-     t -= paddingLength+overhead;
--    /* If len >= padding_length+overhead then the MSB of t is zero. */
-+    /* If len >= paddingLength+overhead then the MSB of t is zero. */
-     good = DUPLICATE_MSB_TO_ALL(~t);
-     /* SSLv3 requires that the padding is minimal. */
-     t = blockSize - (paddingLength+1);
-@@ -10742,7 +10742,7 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
- 	}
-     }
- 
--    good = (unsigned)-1;
-+    good = ~0U;
-     minLength = crSpec->mac_size;
-     if (cipher_def->type == type_block) {
- 	/* CBC records have a padding length byte at the end. */
-@@ -10756,14 +10756,7 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
-     /* We can perform this test in variable time because the record's total
-      * length and the ciphersuite are both public knowledge. */
-     if (cText->buf->len < minLength) {
--	SSL_DBG(("%d: SSL3[%d]: HandleRecord, record too small.",
--		 SSL_GETPID(), ss->fd));
--	/* must not hold spec lock when calling SSL3_SendAlert. */
--	ssl_ReleaseSpecReadLock(ss);
--	SSL3_SendAlert(ss, alert_fatal, bad_record_mac);
--	/* always log mac error, in case attacker can read server logs. */
--	PORT_SetError(SSL_ERROR_BAD_MAC_READ);
--	return SECFailure;
-+	goto decrypt_loser;
-     }
- 
-     if (cipher_def->type == type_block &&
-@@ -10831,11 +10824,18 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
- 	return SECFailure;
-     }
- 
-+    if (cipher_def->type == type_block &&
-+	((cText->buf->len - ivLen) % cipher_def->block_size) != 0) {
-+	goto decrypt_loser;
-+    }
-+
-     /* decrypt from cText buf to plaintext. */
-     rv = crSpec->decode(
- 	crSpec->decodeContext, plaintext->buf, (int *)&plaintext->len,
- 	plaintext->space, cText->buf->buf + ivLen, cText->buf->len - ivLen);
--    good &= SECStatusToMask(rv);
-+    if (rv != SECSuccess) {
-+	goto decrypt_loser;
-+    }
- 
-     PRINT_BUF(80, (ss, "cleartext:", plaintext->buf, plaintext->len));
- 
-@@ -10843,7 +10843,7 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
- 
-     /* If it's a block cipher, check and strip the padding. */
-     if (cipher_def->type == type_block) {
--	const unsigned int blockSize = cipher_def->iv_size;
-+	const unsigned int blockSize = cipher_def->block_size;
- 	const unsigned int macSize = crSpec->mac_size;
- 
- 	if (crSpec->version <= SSL_LIBRARY_VERSION_3_0) {
-@@ -10899,10 +10899,11 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
-     }
- 
-     if (good == 0) {
-+decrypt_loser:
- 	/* must not hold spec lock when calling SSL3_SendAlert. */
- 	ssl_ReleaseSpecReadLock(ss);
- 
--	SSL_DBG(("%d: SSL3[%d]: mac check failed", SSL_GETPID(), ss->fd));
-+	SSL_DBG(("%d: SSL3[%d]: decryption failed", SSL_GETPID(), ss->fd));
- 
- 	if (!IS_DTLS(ss)) {
- 	    SSL3_SendAlert(ss, alert_fatal, bad_record_mac);
diff --git a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
deleted file mode 100644
index 21da0c0..0000000
--- a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-Upstream-Status: backport
-yanjun.zhu <yanjun.zhu@windriver.com>
---- a/nss/lib/util/secport.c
-+++ b/nss/lib/util/secport.c
-@@ -69,13 +69,22 @@ PORTCharConversionFunc ucs4Utf8ConvertFu
- PORTCharConversionFunc ucs2Utf8ConvertFunc;
- PORTCharConversionWSwapFunc  ucs2AsciiConvertFunc;
- 
-+/* NSPR memory allocation functions (PR_Malloc, PR_Calloc, and PR_Realloc)
-+ * use the PRUint32 type for the size parameter. Before we pass a size_t or
-+ * unsigned long size to these functions, we need to ensure it is <= half of
-+ * the maximum PRUint32 value to avoid truncation and catch a negative size.
-+ */
-+#define MAX_SIZE (PR_UINT32_MAX >> 1)
-+
- void *
- PORT_Alloc(size_t bytes)
- {
--    void *rv;
-+    void *rv = NULL;
- 
--    /* Always allocate a non-zero amount of bytes */
--    rv = (void *)PR_Malloc(bytes ? bytes : 1);
-+    if (bytes <= MAX_SIZE) {
-+	/* Always allocate a non-zero amount of bytes */
-+	rv = PR_Malloc(bytes ? bytes : 1);
-+    }
-     if (!rv) {
- 	++port_allocFailures;
- 	PORT_SetError(SEC_ERROR_NO_MEMORY);
-@@ -86,9 +95,11 @@ PORT_Alloc(size_t bytes)
- void *
- PORT_Realloc(void *oldptr, size_t bytes)
- {
--    void *rv;
-+    void *rv = NULL;
- 
--    rv = (void *)PR_Realloc(oldptr, bytes);
-+    if (bytes <= MAX_SIZE) {
-+	rv = PR_Realloc(oldptr, bytes);
-+    }
-     if (!rv) {
- 	++port_allocFailures;
- 	PORT_SetError(SEC_ERROR_NO_MEMORY);
-@@ -99,10 +110,12 @@ PORT_Realloc(void *oldptr, size_t bytes)
- void *
- PORT_ZAlloc(size_t bytes)
- {
--    void *rv;
-+    void *rv = NULL;
- 
--    /* Always allocate a non-zero amount of bytes */
--    rv = (void *)PR_Calloc(1, bytes ? bytes : 1);
-+    if (bytes <= MAX_SIZE) {
-+	/* Always allocate a non-zero amount of bytes */
-+	rv = PR_Calloc(1, bytes ? bytes : 1);
-+    }
-     if (!rv) {
- 	++port_allocFailures;
- 	PORT_SetError(SEC_ERROR_NO_MEMORY);
-@@ -209,6 +222,10 @@ PORT_NewArena(unsigned long chunksize)
- {
-     PORTArenaPool *pool;
-     
-+    if (chunksize > MAX_SIZE) {
-+	PORT_SetError(SEC_ERROR_NO_MEMORY);
-+	return NULL;
-+    }
-     pool = PORT_ZNew(PORTArenaPool);
-     if (!pool) {
- 	return NULL;
-@@ -224,8 +241,6 @@ PORT_NewArena(unsigned long chunksize)
-     return(&pool->arena);
- }
- 
--#define MAX_SIZE 0x7fffffffUL
--
- void *
- PORT_ArenaAlloc(PLArenaPool *arena, size_t size)
- {
-@@ -330,6 +345,11 @@ PORT_ArenaGrow(PLArenaPool *arena, void 
-     PORTArenaPool *pool = (PORTArenaPool *)arena;
-     PORT_Assert(newsize >= oldsize);
-     
-+    if (newsize > MAX_SIZE) {
-+	PORT_SetError(SEC_ERROR_NO_MEMORY);
-+	return NULL;
-+    }
-+
-     if (ARENAPOOL_MAGIC == pool->magic ) {
- 	PZ_Lock(pool->lock);
- 	/* Do we do a THREADMARK check here? */
diff --git a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch
deleted file mode 100644
index 7203d02..0000000
--- a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-signed-off-by: Ryan Sleevi <ryan.sleevi@gmail.com>
-Upstream-Status: Backport
-reference:https://hg.mozilla.org/projects/nss/rev/e79a09364b5e
-
---- a/nss/lib/ssl/ssl3con.c
-+++ b/nss/lib/ssl/ssl3con.c
-@@ -781,6 +781,11 @@ static SECStatus
- Null_Cipher(void *ctx, unsigned char *output, int *outputLen, int maxOutputLen,
- 	    const unsigned char *input, int inputLen)
- {
-+    if (inputLen > maxOutputLen) {
-+        *outputLen = 0;  /* Match PK11_CipherOp in setting outputLen */
-+        PORT_SetError(SEC_ERROR_OUTPUT_LEN);
-+        return SECFailure;
-+    }
-     *outputLen = inputLen;
-     if (input != output)
- 	PORT_Memcpy(output, input, inputLen);
diff --git a/meta/recipes-support/nss/files/nss-CVE-2013-1740.patch b/meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
deleted file mode 100644
index db3d6f9..0000000
--- a/meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
+++ /dev/null
@@ -1,916 +0,0 @@
-nss: CVE-2013-1740
-
-Upstream-Status: Backport
-
-the patch comes from:
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1740
-https://bugzilla.mozilla.org/show_bug.cgi?id=919877
-https://bugzilla.mozilla.org/show_bug.cgi?id=713933
-
-changeset:   10946:f28426e944ae
-user:        Wan-Teh Chang <wtc@google.com>
-date:        Tue Nov 26 16:44:39 2013 -0800
-summary:     Bug 713933: Handle the return value of both ssl3_HandleRecord calls
-
-changeset:   10945:774c7dec7565
-user:        Wan-Teh Chang <wtc@google.com>
-date:        Mon Nov 25 19:16:23 2013 -0800
-summary:     Bug 713933: Declare the |falseStart| local variable in the smallest
-
-changeset:   10848:141fae8fb2e8
-user:        Wan-Teh Chang <wtc@google.com>
-date:        Mon Sep 23 11:25:41 2013 -0700
-summary:     Bug 681839: Allow SSL_HandshakeNegotiatedExtension to be called before the handshake is finished, r=brian@briansmith.org
-
-changeset:   10898:1b9c43d28713
-user:        Brian Smith <brian@briansmith.org>
-date:        Thu Oct 31 15:40:42 2013 -0700
-summary:     Bug 713933: Make SSL False Start work with asynchronous certificate validation, r=wtc
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- nss/lib/ssl/ssl.def     |    7 ++
- nss/lib/ssl/ssl.h       |   54 +++++++++++---
- nss/lib/ssl/ssl3con.c   |  188 +++++++++++++++++++++++++++++++++++------------
- nss/lib/ssl/ssl3gthr.c  |   63 ++++++++++++----
- nss/lib/ssl/sslauth.c   |   10 +--
- nss/lib/ssl/sslimpl.h   |   22 +++++-
- nss/lib/ssl/sslinfo.c   |   10 +--
- nss/lib/ssl/sslreveal.c |    9 +--
- nss/lib/ssl/sslsecur.c  |  139 ++++++++++++++++++++++++++++-------
- nss/lib/ssl/sslsock.c   |   12 ++-
- 10 files changed, 386 insertions(+), 128 deletions(-)
-
-diff --git a/nss/lib/ssl/ssl.def b/nss/lib/ssl/ssl.def
-index fbf7fc5..e937bd4 100644
---- a/nss/lib/ssl/ssl.def
-+++ b/nss/lib/ssl/ssl.def
-@@ -163,3 +163,10 @@ SSL_SetStapledOCSPResponses;
- ;+    local:
- ;+*;
- ;+};
-+;+NSS_3.15.3 {    # NSS 3.15.3 release
-+;+    global:
-+SSL_RecommendedCanFalseStart;
-+SSL_SetCanFalseStartCallback;
-+;+    local:
-+;+*;
-+;+};
-diff --git a/nss/lib/ssl/ssl.h b/nss/lib/ssl/ssl.h
-index 6db0e34..ddeaaef 100644
---- a/nss/lib/ssl/ssl.h
-+++ b/nss/lib/ssl/ssl.h
-@@ -121,14 +121,17 @@ SSL_IMPORT PRFileDesc *DTLS_ImportFD(PRFileDesc *model, PRFileDesc *fd);
- #define SSL_ENABLE_FALSE_START         22 /* Enable SSL false start (off by */
-                                           /* default, applies only to       */
-                                           /* clients). False start is a     */
--/* mode where an SSL client will start sending application data before      */
--/* verifying the server's Finished message. This means that we could end up */
--/* sending data to an imposter. However, the data will be encrypted and     */
--/* only the true server can derive the session key. Thus, so long as the    */
--/* cipher isn't broken this is safe. Because of this, False Start will only */
--/* occur on RSA or DH ciphersuites where the cipher's key length is >= 80   */
--/* bits. The advantage of False Start is that it saves a round trip for     */
--/* client-speaks-first protocols when performing a full handshake.          */
-+/* mode where an SSL client will start sending application data before
-+ * verifying the server's Finished message. This means that we could end up
-+ * sending data to an imposter. However, the data will be encrypted and
-+ * only the true server can derive the session key. Thus, so long as the
-+ * cipher isn't broken this is safe. The advantage of false start is that
-+ * it saves a round trip for client-speaks-first protocols when performing a
-+ * full handshake.
-+ *
-+ * In addition to enabling this option, the application must register a
-+ * callback using the SSL_SetCanFalseStartCallback function.
-+ */
- 
- /* For SSL 3.0 and TLS 1.0, by default we prevent chosen plaintext attacks
-  * on SSL CBC mode cipher suites (see RFC 4346 Section F.3) by splitting
-@@ -653,14 +656,45 @@ SSL_IMPORT SECStatus SSL_SetMaxServerCacheLocks(PRUint32 maxLocks);
- SSL_IMPORT SECStatus SSL_InheritMPServerSIDCache(const char * envString);
- 
- /*
--** Set the callback on a particular socket that gets called when we finish
--** performing a handshake.
-+** Set the callback that gets called when a TLS handshake is complete. The
-+** handshake callback is called after verifying the peer's Finished message and
-+** before processing incoming application data.
-+**
-+** For the initial handshake: If the handshake false started (see
-+** SSL_ENABLE_FALSE_START), then application data may already have been sent
-+** before the handshake callback is called. If we did not false start then the
-+** callback will get called before any application data is sent.
- */
- typedef void (PR_CALLBACK *SSLHandshakeCallback)(PRFileDesc *fd,
-                                                  void *client_data);
- SSL_IMPORT SECStatus SSL_HandshakeCallback(PRFileDesc *fd, 
- 			          SSLHandshakeCallback cb, void *client_data);
- 
-+/* Applications that wish to enable TLS false start must set this callback
-+** function. NSS will invoke the functon to determine if a particular
-+** connection should use false start or not. SECSuccess indicates that the
-+** callback completed successfully, and if so *canFalseStart indicates if false
-+** start can be used. If the callback does not return SECSuccess then the
-+** handshake will be canceled. NSS's recommended criteria can be evaluated by
-+** calling SSL_RecommendedCanFalseStart.
-+**
-+** If no false start callback is registered then false start will never be
-+** done, even if the SSL_ENABLE_FALSE_START option is enabled.
-+**/
-+typedef SECStatus (PR_CALLBACK *SSLCanFalseStartCallback)(
-+    PRFileDesc *fd, void *arg, PRBool *canFalseStart);
-+
-+SSL_IMPORT SECStatus SSL_SetCanFalseStartCallback(
-+    PRFileDesc *fd, SSLCanFalseStartCallback callback, void *arg);
-+
-+/* This function sets *canFalseStart according to the recommended criteria for
-+** false start. These criteria may change from release to release and may depend
-+** on which handshake features have been negotiated and/or properties of the
-+** certifciates/keys used on the connection.
-+*/
-+SSL_IMPORT SECStatus SSL_RecommendedCanFalseStart(PRFileDesc *fd,
-+                                                  PRBool *canFalseStart);
-+
- /*
- ** For the server, request a new handshake.  For the client, begin a new
- ** handshake.  If flushCache is non-zero, the SSL3 cache entry will be 
-diff --git a/nss/lib/ssl/ssl3con.c b/nss/lib/ssl/ssl3con.c
-index 61d24d9..f39ba09 100644
---- a/nss/lib/ssl/ssl3con.c
-+++ b/nss/lib/ssl/ssl3con.c
-@@ -2535,7 +2535,7 @@ ssl3_SendRecord(   sslSocket *        ss,
-     SSL_TRC(3, ("%d: SSL3[%d] SendRecord type: %s nIn=%d",
- 		SSL_GETPID(), ss->fd, ssl3_DecodeContentType(type),
- 		nIn));
--    PRINT_BUF(3, (ss, "Send record (plain text)", pIn, nIn));
-+    PRINT_BUF(50, (ss, "Send record (plain text)", pIn, nIn));
- 
-     PORT_Assert( ss->opt.noLocks || ssl_HaveXmitBufLock(ss) );
- 
-@@ -6674,36 +6674,73 @@ done:
-     return rv;
- }
- 
-+static SECStatus
-+ssl3_CheckFalseStart(sslSocket *ss)
-+{
-+    PORT_Assert( ss->opt.noLocks || ssl_HaveSSL3HandshakeLock(ss) );
-+    PORT_Assert( !ss->ssl3.hs.authCertificatePending );
-+    PORT_Assert( !ss->ssl3.hs.canFalseStart );
-+
-+    if (!ss->canFalseStartCallback) {
-+       SSL_TRC(3, ("%d: SSL[%d]: no false start callback so no false start",
-+                   SSL_GETPID(), ss->fd));
-+    } else {
-+       PRBool maybeFalseStart;
-+       SECStatus rv;
-+
-+       /* An attacker can control the selected ciphersuite so we only wish to
-+        * do False Start in the case that the selected ciphersuite is
-+        * sufficiently strong that the attack can gain no advantage.
-+        * Therefore we always require an 80-bit cipher. */
-+        ssl_GetSpecReadLock(ss);
-+        maybeFalseStart = ss->ssl3.cwSpec->cipher_def->secret_key_size >= 10;
-+        ssl_ReleaseSpecReadLock(ss);
-+
-+       if (!maybeFalseStart) {
-+           SSL_TRC(3, ("%d: SSL[%d]: no false start due to weak cipher",
-+                       SSL_GETPID(), ss->fd));
-+       } else {
-+           rv = (ss->canFalseStartCallback)(ss->fd,
-+                                            ss->canFalseStartCallbackData,
-+                                            &ss->ssl3.hs.canFalseStart);
-+           if (rv == SECSuccess) {
-+               SSL_TRC(3, ("%d: SSL[%d]: false start callback returned %s",
-+                           SSL_GETPID(), ss->fd,
-+                           ss->ssl3.hs.canFalseStart ? "TRUE" : "FALSE"));
-+           } else {
-+               SSL_TRC(3, ("%d: SSL[%d]: false start callback failed (%s)",
-+                           SSL_GETPID(), ss->fd,
-+                           PR_ErrorToName(PR_GetError())));
-+           }
-+           return rv;
-+       }
-+    }
-+
-+    ss->ssl3.hs.canFalseStart = PR_FALSE;
-+    return SECSuccess;
-+}
-+
- PRBool
--ssl3_CanFalseStart(sslSocket *ss) {
--    PRBool rv;
-+ssl3_WaitingForStartOfServerSecondRound(sslSocket *ss)
-+{
-+    PRBool result = PR_FALSE;
- 
-     PORT_Assert( ss->opt.noLocks || ssl_HaveSSL3HandshakeLock(ss) );
- 
--    /* XXX: does not take into account whether we are waiting for
--     * SSL_AuthCertificateComplete or SSL_RestartHandshakeAfterCertReq. If/when
--     * that is done, this function could return different results each time it
--     * would be called.
--     */
-+    switch (ss->ssl3.hs.ws) {
-+    case wait_new_session_ticket:
-+        result = PR_TRUE;
-+        break;
-+    case wait_change_cipher:
-+        result = !ssl3_ExtensionNegotiated(ss, ssl_session_ticket_xtn);
-+        break;
-+    case wait_finished:
-+        break;
-+    default:
-+        PR_NOT_REACHED("ssl3_WaitingForStartOfServerSecondRound");
-+    }
- 
--    ssl_GetSpecReadLock(ss);
--    rv = ss->opt.enableFalseStart &&
--	 !ss->sec.isServer &&
--	 !ss->ssl3.hs.isResuming &&
--	 ss->ssl3.cwSpec &&
--
--	 /* An attacker can control the selected ciphersuite so we only wish to
--	  * do False Start in the case that the selected ciphersuite is
--	  * sufficiently strong that the attack can gain no advantage.
--	  * Therefore we require an 80-bit cipher and a forward-secret key
--	  * exchange. */
--	 ss->ssl3.cwSpec->cipher_def->secret_key_size >= 10 &&
--	(ss->ssl3.hs.kea_def->kea == kea_dhe_dss ||
--	 ss->ssl3.hs.kea_def->kea == kea_dhe_rsa ||
--	 ss->ssl3.hs.kea_def->kea == kea_ecdhe_ecdsa ||
--	 ss->ssl3.hs.kea_def->kea == kea_ecdhe_rsa);
--    ssl_ReleaseSpecReadLock(ss);
--    return rv;
-+    return result;
- }
- 
- static SECStatus ssl3_SendClientSecondRound(sslSocket *ss);
-@@ -6785,6 +6822,9 @@ ssl3_SendClientSecondRound(sslSocket *ss)
-     }
-     if (ss->ssl3.hs.authCertificatePending &&
- 	(sendClientCert || ss->ssl3.sendEmptyCert || ss->firstHsDone)) {
-+        SSL_TRC(3, ("%d: SSL3[%p]: deferring ssl3_SendClientSecondRound because"
-+                    " certificate authentication is still pending.",
-+                    SSL_GETPID(), ss->fd));
- 	ss->ssl3.hs.restartTarget = ssl3_SendClientSecondRound;
- 	return SECWouldBlock;
-     }
-@@ -6822,14 +6862,50 @@ ssl3_SendClientSecondRound(sslSocket *ss)
- 	goto loser;	/* err code was set. */
-     }
- 
--    /* XXX: If the server's certificate hasn't been authenticated by this
--     * point, then we may be leaking this NPN message to an attacker.
-+    /* This must be done after we've set ss->ssl3.cwSpec in
-+     * ssl3_SendChangeCipherSpecs because SSL_GetChannelInfo uses information
-+     * from cwSpec. This must be done before we call ssl3_CheckFalseStart
-+     * because the false start callback (if any) may need the information from
-+     * the functions that depend on this being set.
-      */
-+    ss->enoughFirstHsDone = PR_TRUE;
-+
-     if (!ss->firstHsDone) {
-+        /* XXX: If the server's certificate hasn't been authenticated by this
-+         * point, then we may be leaking this NPN message to an attacker.
-+         */
- 	rv = ssl3_SendNextProto(ss);
- 	if (rv != SECSuccess) {
- 	    goto loser;	/* err code was set. */
- 	}
-+
-+        if (ss->opt.enableFalseStart) {
-+            if (!ss->ssl3.hs.authCertificatePending) {
-+                /* When we fix bug 589047, we will need to know whether we are
-+                 * false starting before we try to flush the client second
-+                 * round to the network. With that in mind, we purposefully
-+                 * call ssl3_CheckFalseStart before calling ssl3_SendFinished,
-+                 * which includes a call to ssl3_FlushHandshake, so that
-+                 * no application develops a reliance on such flushing being
-+                 * done before its false start callback is called.
-+                 */
-+                ssl_ReleaseXmitBufLock(ss);
-+                rv = ssl3_CheckFalseStart(ss);
-+                ssl_GetXmitBufLock(ss);
-+                if (rv != SECSuccess) {
-+                    goto loser;
-+                }
-+            } else {
-+                /* The certificate authentication and the server's Finished
-+                 * message are racing each other. If the certificate
-+                 * authentication wins, then we will try to false start in
-+                 * ssl3_AuthCertificateComplete.
-+                 */
-+                SSL_TRC(3, ("%d: SSL3[%p]: deferring false start check because"
-+                            " certificate authentication is still pending.",
-+                            SSL_GETPID(), ss->fd));
-+            }
-+        }
-     }
- 
-     rv = ssl3_SendFinished(ss, 0);
-@@ -6844,10 +6920,7 @@ ssl3_SendClientSecondRound(sslSocket *ss)
-     else
- 	ss->ssl3.hs.ws = wait_change_cipher;
- 
--    /* Do the handshake callback for sslv3 here, if we can false start. */
--    if (ss->handshakeCallback != NULL && ssl3_CanFalseStart(ss)) {
--	(ss->handshakeCallback)(ss->fd, ss->handshakeCallbackData);
--    }
-+    PORT_Assert(ssl3_WaitingForStartOfServerSecondRound(ss));
- 
-     return SECSuccess;
- 
-@@ -9421,13 +9494,6 @@ ssl3_AuthCertificate(sslSocket *ss)
- 
- 	    ss->ssl3.hs.authCertificatePending = PR_TRUE;
- 	    rv = SECSuccess;
--
--	    /* XXX: Async cert validation and False Start don't work together
--	     * safely yet; if we leave False Start enabled, we may end up false
--	     * starting (sending application data) before we
--	     * SSL_AuthCertificateComplete has been called.
--	     */
--	    ss->opt.enableFalseStart = PR_FALSE;
- 	}
- 
- 	if (rv != SECSuccess) {
-@@ -9551,6 +9617,12 @@ ssl3_AuthCertificateComplete(sslSocket *ss, PRErrorCode error)
-     } else if (ss->ssl3.hs.restartTarget != NULL) {
- 	sslRestartTarget target = ss->ssl3.hs.restartTarget;
- 	ss->ssl3.hs.restartTarget = NULL;
-+
-+        if (target == ssl3_FinishHandshake) {
-+            SSL_TRC(3,("%d: SSL3[%p]: certificate authentication lost the race"
-+                       " with peer's finished message", SSL_GETPID(), ss->fd));
-+        }
-+
- 	rv = target(ss);
- 	/* Even if we blocked here, we have accomplished enough to claim
- 	 * success. Any remaining work will be taken care of by subsequent
-@@ -9560,7 +9632,29 @@ ssl3_AuthCertificateComplete(sslSocket *ss, PRErrorCode error)
- 	    rv = SECSuccess;
- 	}
-     } else {
--	rv = SECSuccess;
-+        SSL_TRC(3, ("%d: SSL3[%p]: certificate authentication won the race with"
-+                    " peer's finished message", SSL_GETPID(), ss->fd));
-+
-+        PORT_Assert(!ss->firstHsDone);
-+        PORT_Assert(!ss->sec.isServer);
-+        PORT_Assert(!ss->ssl3.hs.isResuming);
-+        PORT_Assert(ss->ssl3.hs.ws == wait_new_session_ticket ||
-+                    ss->ssl3.hs.ws == wait_change_cipher ||
-+                    ss->ssl3.hs.ws == wait_finished);
-+ 
-+        /* ssl3_SendClientSecondRound deferred the false start check because
-+         * certificate authentication was pending, so we do it now if we still
-+          * haven't received any of the server's second round yet.
-+         */
-+        if (ss->opt.enableFalseStart &&
-+            !ss->firstHsDone &&
-+            !ss->sec.isServer &&
-+            !ss->ssl3.hs.isResuming &&
-+            ssl3_WaitingForStartOfServerSecondRound(ss)) {
-+            rv = ssl3_CheckFalseStart(ss);
-+        } else {
-+            rv = SECSuccess;
-+        }
-     }
- 
- done:
-@@ -10023,9 +10117,6 @@ xmit_loser:
-         return rv;
-     }
- 
--    ss->gs.writeOffset = 0;
--    ss->gs.readOffset  = 0;
--
-     if (ss->ssl3.hs.kea_def->kea == kea_ecdhe_rsa) {
- 	effectiveExchKeyType = kt_rsa;
-     } else {
-@@ -10090,6 +10181,9 @@ xmit_loser:
-     return rv;
- }
- 
-+/* The return type is SECStatus instead of void because this function needs
-+ * to have type sslRestartTarget.
-+ */
- SECStatus
- ssl3_FinishHandshake(sslSocket * ss)
- {
-@@ -10099,19 +10193,16 @@ ssl3_FinishHandshake(sslSocket * ss)
- 
-     /* The first handshake is now completed. */
-     ss->handshake           = NULL;
--    ss->firstHsDone         = PR_TRUE;
- 
-     if (ss->ssl3.hs.cacheSID) {
- 	(*ss->sec.cache)(ss->sec.ci.sid);
- 	ss->ssl3.hs.cacheSID = PR_FALSE;
-     }
- 
-+    ss->ssl3.hs.canFalseStart = PR_FALSE; /* False Start phase is complete */
-     ss->ssl3.hs.ws = idle_handshake;
- 
--    /* Do the handshake callback for sslv3 here, if we cannot false start. */
--    if (ss->handshakeCallback != NULL && !ssl3_CanFalseStart(ss)) {
--	(ss->handshakeCallback)(ss->fd, ss->handshakeCallbackData);
--    }
-+    ssl_FinishHandshake(ss);
- 
-     return SECSuccess;
- }
-@@ -11045,7 +11136,6 @@ process_it:
- 
-     ssl_ReleaseSSL3HandshakeLock(ss);
-     return rv;
--
- }
- 
- /*
-diff --git a/nss/lib/ssl/ssl3gthr.c b/nss/lib/ssl/ssl3gthr.c
-index 6d62515..03e369d 100644
---- a/nss/lib/ssl/ssl3gthr.c
-+++ b/nss/lib/ssl/ssl3gthr.c
-@@ -275,11 +275,17 @@ ssl3_GatherCompleteHandshake(sslSocket *ss, int flags)
- {
-     SSL3Ciphertext cText;
-     int            rv;
--    PRBool         canFalseStart = PR_FALSE;
-+    PRBool         keepGoing = PR_TRUE;
- 
-     SSL_TRC(30, ("ssl3_GatherCompleteHandshake"));
- 
-+    /* ssl3_HandleRecord may end up eventually calling ssl_FinishHandshake,
-+     * which requires the 1stHandshakeLock, which must be acquired before the
-+     * RecvBufLock.
-+     */
-+    PORT_Assert( ss->opt.noLocks || ssl_Have1stHandshakeLock(ss) );
-     PORT_Assert( ss->opt.noLocks || ssl_HaveRecvBufLock(ss) );
-+
-     do {
- 	PRBool handleRecordNow = PR_FALSE;
- 
-@@ -368,20 +374,48 @@ ssl3_GatherCompleteHandshake(sslSocket *ss, int flags)
- 	if (rv < 0) {
- 	    return ss->recvdCloseNotify ? 0 : rv;
- 	}
-+        if (rv == (int) SECSuccess && ss->gs.buf.len > 0) {
-+            /* We have application data to return to the application. This
-+             * prioritizes returning application data to the application over
-+             * completing any renegotiation handshake we may be doing.
-+             */
-+            PORT_Assert(ss->firstHsDone);
-+            PORT_Assert(cText.type == content_application_data);
-+            break;
-+        }
- 
--	/* If we kicked off a false start in ssl3_HandleServerHelloDone, break
--	 * out of this loop early without finishing the handshake.
--	 */
--	if (ss->opt.enableFalseStart) {
--	    ssl_GetSSL3HandshakeLock(ss);
--	    canFalseStart = (ss->ssl3.hs.ws == wait_change_cipher ||
--			     ss->ssl3.hs.ws == wait_new_session_ticket) &&
--		            ssl3_CanFalseStart(ss);
--	    ssl_ReleaseSSL3HandshakeLock(ss);
-+        PORT_Assert(keepGoing);
-+        ssl_GetSSL3HandshakeLock(ss);
-+        if (ss->ssl3.hs.ws == idle_handshake) {
-+            /* We are done with the current handshake so stop trying to
-+             * handshake. Note that it would be safe to test ss->firstHsDone
-+             * instead of ss->ssl3.hs.ws. By testing ss->ssl3.hs.ws instead,
-+             * we prioritize completing a renegotiation handshake over sending
-+             * application data.
-+             */
-+            PORT_Assert(ss->firstHsDone);
-+            PORT_Assert(!ss->ssl3.hs.canFalseStart);
-+            keepGoing = PR_FALSE;
-+        } else if (ss->ssl3.hs.canFalseStart) {
-+            /* Prioritize sending application data over trying to complete
-+             * the handshake if we're false starting.
-+             *
-+             * If we were to do this check at the beginning of the loop instead
-+             * of here, then this function would become be a no-op after
-+             * receiving the ServerHelloDone in the false start case, and we
-+             * would never complete the handshake.
-+             */
-+            PORT_Assert(!ss->firstHsDone);
-+ 
-+            if (ssl3_WaitingForStartOfServerSecondRound(ss)) {
-+                keepGoing = PR_FALSE;
-+            } else {
-+                ss->ssl3.hs.canFalseStart = PR_FALSE;
-+            }
- 	}
--    } while (ss->ssl3.hs.ws != idle_handshake &&
--             !canFalseStart &&
--             ss->gs.buf.len == 0);
-+        ssl_ReleaseSSL3HandshakeLock(ss);
-+     } while (keepGoing);
-+
- 
-     ss->gs.readOffset = 0;
-     ss->gs.writeOffset = ss->gs.buf.len;
-@@ -404,7 +438,10 @@ ssl3_GatherAppDataRecord(sslSocket *ss, int flags)
- {
-     int            rv;
- 
-+    /* ssl3_GatherCompleteHandshake requires both of these locks. */
-+    PORT_Assert( ss->opt.noLocks || ssl_Have1stHandshakeLock(ss) );
-     PORT_Assert( ss->opt.noLocks || ssl_HaveRecvBufLock(ss) );
-+
-     do {
- 	rv = ssl3_GatherCompleteHandshake(ss, flags);
-     } while (rv > 0 && ss->gs.buf.len == 0);
-diff --git a/nss/lib/ssl/sslauth.c b/nss/lib/ssl/sslauth.c
-index d2f57bf..cb956d4 100644
---- a/nss/lib/ssl/sslauth.c
-+++ b/nss/lib/ssl/sslauth.c
-@@ -60,7 +60,6 @@ SSL_SecurityStatus(PRFileDesc *fd, int *op, char **cp, int *kp0, int *kp1,
-     sslSocket *ss;
-     const char *cipherName;
-     PRBool isDes = PR_FALSE;
--    PRBool enoughFirstHsDone = PR_FALSE;
- 
-     ss = ssl_FindSocket(fd);
-     if (!ss) {
-@@ -78,14 +77,7 @@ SSL_SecurityStatus(PRFileDesc *fd, int *op, char **cp, int *kp0, int *kp1,
- 	*op = SSL_SECURITY_STATUS_OFF;
-     }
- 
--    if (ss->firstHsDone) {
--	enoughFirstHsDone = PR_TRUE;
--    } else if (ss->version >= SSL_LIBRARY_VERSION_3_0 &&
--	       ssl3_CanFalseStart(ss)) {
--	enoughFirstHsDone = PR_TRUE;
--    }
--
--    if (ss->opt.useSecurity && enoughFirstHsDone) {
-+    if (ss->opt.useSecurity && ss->enoughFirstHsDone) {
- 	if (ss->version < SSL_LIBRARY_VERSION_3_0) {
- 	    cipherName = ssl_cipherName[ss->sec.cipherType];
- 	} else {
-diff --git a/nss/lib/ssl/sslimpl.h b/nss/lib/ssl/sslimpl.h
-index 90e9567..bf0d67f 100644
---- a/nss/lib/ssl/sslimpl.h
-+++ b/nss/lib/ssl/sslimpl.h
-@@ -842,6 +842,8 @@ const ssl3CipherSuiteDef *suite_def;
-     /* Shared state between ssl3_HandleFinished and ssl3_FinishHandshake */
-     PRBool                cacheSID;
- 
-+    PRBool                canFalseStart;   /* Can/did we False Start */
-+
-     /* clientSigAndHash contains the contents of the signature_algorithms
-      * extension (if any) from the client. This is only valid for TLS 1.2
-      * or later. */
-@@ -1116,6 +1118,10 @@ struct sslSocketStr {
-     unsigned long    clientAuthRequested;
-     unsigned long    delayDisabled;       /* Nagle delay disabled */
-     unsigned long    firstHsDone;         /* first handshake is complete. */
-+    unsigned long    enoughFirstHsDone;   /* enough of the first handshake is
-+                                           * done for callbacks to be able to
-+                                           * retrieve channel security
-+                                           * parameters from the SSL socket. */
-     unsigned long    handshakeBegun;     
-     unsigned long    lastWriteBlocked;   
-     unsigned long    recvdCloseNotify;    /* received SSL EOF. */
-@@ -1156,6 +1162,8 @@ const unsigned char *  preferredCipher;
-     void                     *badCertArg;
-     SSLHandshakeCallback      handshakeCallback;
-     void                     *handshakeCallbackData;
-+    SSLCanFalseStartCallback  canFalseStartCallback;
-+    void                     *canFalseStartCallbackData;
-     void                     *pkcs11PinArg;
-     SSLNextProtoCallback      nextProtoCallback;
-     void                     *nextProtoArg;
-@@ -1358,7 +1366,19 @@ extern void      ssl3_SetAlwaysBlock(sslSocket *ss);
- 
- extern SECStatus ssl_EnableNagleDelay(sslSocket *ss, PRBool enabled);
- 
--extern PRBool    ssl3_CanFalseStart(sslSocket *ss);
-+extern void      ssl_FinishHandshake(sslSocket *ss);
-+
-+/* Returns PR_TRUE if we are still waiting for the server to respond to our
-+ * client second round. Once we've received any part of the server's second
-+ * round then we don't bother trying to false start since it is almost always
-+ * the case that the NewSessionTicket, ChangeCipherSoec, and Finished messages
-+ * were sent in the same packet and we want to process them all at the same
-+ * time. If we were to try to false start in the middle of the server's second
-+ * round, then we would increase the number of I/O operations
-+ * (SSL_ForceHandshake/PR_Recv/PR_Send/etc.) needed to finish the handshake.
-+ */
-+extern PRBool    ssl3_WaitingForStartOfServerSecondRound(sslSocket *ss);
-+
- extern SECStatus
- ssl3_CompressMACEncryptRecord(ssl3CipherSpec *   cwSpec,
- 		              PRBool             isServer,
-diff --git a/nss/lib/ssl/sslinfo.c b/nss/lib/ssl/sslinfo.c
-index 9f2597e..d0c23b7 100644
---- a/nss/lib/ssl/sslinfo.c
-+++ b/nss/lib/ssl/sslinfo.c
-@@ -26,7 +26,6 @@ SSL_GetChannelInfo(PRFileDesc *fd, SSLChannelInfo *info, PRUintn len)
-     sslSocket *      ss;
-     SSLChannelInfo   inf;
-     sslSessionID *   sid;
--    PRBool           enoughFirstHsDone = PR_FALSE;
- 
-     if (!info || len < sizeof inf.length) { 
- 	PORT_SetError(SEC_ERROR_INVALID_ARGS);
-@@ -43,14 +42,7 @@ SSL_GetChannelInfo(PRFileDesc *fd, SSLChannelInfo *info, PRUintn len)
-     memset(&inf, 0, sizeof inf);
-     inf.length = PR_MIN(sizeof inf, len);
- 
--    if (ss->firstHsDone) {
--	enoughFirstHsDone = PR_TRUE;
--    } else if (ss->version >= SSL_LIBRARY_VERSION_3_0 &&
--	       ssl3_CanFalseStart(ss)) {
--	enoughFirstHsDone = PR_TRUE;
--    }
--
--    if (ss->opt.useSecurity && enoughFirstHsDone) {
-+    if (ss->opt.useSecurity && ss->enoughFirstHsDone) {
-         sid = ss->sec.ci.sid;
- 	inf.protocolVersion  = ss->version;
- 	inf.authKeyBits      = ss->sec.authKeyBits;
-diff --git a/nss/lib/ssl/sslreveal.c b/nss/lib/ssl/sslreveal.c
-index dc14794..d972998 100644
---- a/nss/lib/ssl/sslreveal.c
-+++ b/nss/lib/ssl/sslreveal.c
-@@ -77,7 +77,6 @@ SSL_HandshakeNegotiatedExtension(PRFileDesc * socket,
- {
-   /* some decisions derived from SSL_GetChannelInfo */
-   sslSocket * sslsocket = NULL;
--  PRBool enoughFirstHsDone = PR_FALSE;
- 
-   if (!pYes) {
-     PORT_SetError(SEC_ERROR_INVALID_ARGS);
-@@ -93,14 +92,8 @@ SSL_HandshakeNegotiatedExtension(PRFileDesc * socket,
- 
-   *pYes = PR_FALSE;
- 
--  if (sslsocket->firstHsDone) {
--    enoughFirstHsDone = PR_TRUE;
--  } else if (sslsocket->ssl3.initialized && ssl3_CanFalseStart(sslsocket)) {
--    enoughFirstHsDone = PR_TRUE;
--  }
--
-   /* according to public API SSL_GetChannelInfo, this doesn't need a lock */
--  if (sslsocket->opt.useSecurity && enoughFirstHsDone) {
-+  if (sslsocket->opt.useSecurity) {
-     if (sslsocket->ssl3.initialized) { /* SSL3 and TLS */
-       /* now we know this socket went through ssl3_InitState() and
-        * ss->xtnData got initialized, which is the only member accessed by
-diff --git a/nss/lib/ssl/sslsecur.c b/nss/lib/ssl/sslsecur.c
-index 49bb42b..d0df442 100644
---- a/nss/lib/ssl/sslsecur.c
-+++ b/nss/lib/ssl/sslsecur.c
-@@ -97,23 +97,13 @@ ssl_Do1stHandshake(sslSocket *ss)
- 	    ss->securityHandshake = 0;
- 	}
- 	if (ss->handshake == 0) {
--	    ssl_GetRecvBufLock(ss);
--	    ss->gs.recordLen = 0;
--	    ssl_ReleaseRecvBufLock(ss);
--
--	    SSL_TRC(3, ("%d: SSL[%d]: handshake is completed",
--			SSL_GETPID(), ss->fd));
--            /* call handshake callback for ssl v2 */
--	    /* for v3 this is done in ssl3_HandleFinished() */
--	    if ((ss->handshakeCallback != NULL) && /* has callback */
--		(!ss->firstHsDone) &&              /* only first time */
--		(ss->version < SSL_LIBRARY_VERSION_3_0)) {  /* not ssl3 */
--		ss->firstHsDone     = PR_TRUE;
--		(ss->handshakeCallback)(ss->fd, ss->handshakeCallbackData);
-+            /* for v3 this is done in ssl3_FinishHandshake */
-+            if (!ss->firstHsDone && ss->version < SSL_LIBRARY_VERSION_3_0) {
-+                ssl_GetRecvBufLock(ss);
-+                ss->gs.recordLen = 0;
-+                ssl_FinishHandshake(ss);
-+                ssl_ReleaseRecvBufLock(ss);
- 	    }
--	    ss->firstHsDone         = PR_TRUE;
--	    ss->gs.writeOffset = 0;
--	    ss->gs.readOffset  = 0;
- 	    break;
- 	}
- 	rv = (*ss->handshake)(ss);
-@@ -134,6 +124,24 @@ ssl_Do1stHandshake(sslSocket *ss)
-     return rv;
- }
- 
-+void
-+ssl_FinishHandshake(sslSocket *ss)
-+{
-+    PORT_Assert( ss->opt.noLocks || ssl_Have1stHandshakeLock(ss) );
-+    PORT_Assert( ss->opt.noLocks || ssl_HaveRecvBufLock(ss) );
-+
-+    SSL_TRC(3, ("%d: SSL[%d]: handshake is completed", SSL_GETPID(), ss->fd));
-+
-+    ss->firstHsDone = PR_TRUE;
-+    ss->enoughFirstHsDone = PR_TRUE;
-+    ss->gs.writeOffset = 0;
-+    ss->gs.readOffset  = 0;
-+
-+    if (ss->handshakeCallback) {
-+       (ss->handshakeCallback)(ss->fd, ss->handshakeCallbackData);
-+    }
-+}
-+
- /*
-  * Handshake function that blocks.  Used to force a
-  * retry on a connection on the next read/write.
-@@ -206,6 +214,7 @@ SSL_ResetHandshake(PRFileDesc *s, PRBool asServer)
-     ssl_Get1stHandshakeLock(ss);
- 
-     ss->firstHsDone = PR_FALSE;
-+    ss->enoughFirstHsDone = PR_FALSE;
-     if ( asServer ) {
- 	ss->handshake = ssl2_BeginServerHandshake;
- 	ss->handshaking = sslHandshakingAsServer;
-@@ -221,6 +230,8 @@ SSL_ResetHandshake(PRFileDesc *s, PRBool asServer)
-     ssl_ReleaseRecvBufLock(ss);
- 
-     ssl_GetSSL3HandshakeLock(ss);
-+    ss->ssl3.hs.canFalseStart = PR_FALSE;
-+    ss->ssl3.hs.restartTarget = NULL;
- 
-     /*
-     ** Blow away old security state and get a fresh setup.
-@@ -331,6 +342,71 @@ SSL_HandshakeCallback(PRFileDesc *fd, SSLHandshakeCallback cb,
-     return SECSuccess;
- }
- 
-+/* Register an application callback to be called when false start may happen.
-+** Acquires and releases HandshakeLock.
-+*/
-+SECStatus
-+SSL_SetCanFalseStartCallback(PRFileDesc *fd, SSLCanFalseStartCallback cb,
-+                            void *arg)
-+{
-+    sslSocket *ss;
-+
-+    ss = ssl_FindSocket(fd);
-+    if (!ss) {
-+       SSL_DBG(("%d: SSL[%d]: bad socket in SSL_SetCanFalseStartCallback",
-+                SSL_GETPID(), fd));
-+       return SECFailure;
-+    }
-+
-+    if (!ss->opt.useSecurity) {
-+       PORT_SetError(SEC_ERROR_INVALID_ARGS);
-+       return SECFailure;
-+    }
-+
-+    ssl_Get1stHandshakeLock(ss);
-+    ssl_GetSSL3HandshakeLock(ss);
-+
-+    ss->canFalseStartCallback     = cb;
-+    ss->canFalseStartCallbackData = arg;
-+
-+    ssl_ReleaseSSL3HandshakeLock(ss);
-+    ssl_Release1stHandshakeLock(ss);
-+
-+    return SECSuccess;
-+}
-+
-+SECStatus
-+SSL_RecommendedCanFalseStart(PRFileDesc *fd, PRBool *canFalseStart)
-+{
-+    sslSocket *ss;
-+
-+    *canFalseStart = PR_FALSE;
-+    ss = ssl_FindSocket(fd);
-+    if (!ss) {
-+       SSL_DBG(("%d: SSL[%d]: bad socket in SSL_RecommendedCanFalseStart",
-+                SSL_GETPID(), fd));
-+       return SECFailure;
-+    }
-+
-+    if (!ss->ssl3.initialized) {
-+       PORT_SetError(SEC_ERROR_INVALID_ARGS);
-+       return SECFailure;
-+    }
-+
-+    if (ss->version < SSL_LIBRARY_VERSION_3_0) {
-+       PORT_SetError(SSL_ERROR_FEATURE_NOT_SUPPORTED_FOR_SSL2);
-+       return SECFailure;
-+    }
-+
-+    /* Require a forward-secret key exchange. */
-+    *canFalseStart = ss->ssl3.hs.kea_def->kea == kea_dhe_dss ||
-+                    ss->ssl3.hs.kea_def->kea == kea_dhe_rsa ||
-+                    ss->ssl3.hs.kea_def->kea == kea_ecdhe_ecdsa ||
-+                    ss->ssl3.hs.kea_def->kea == kea_ecdhe_rsa;
-+
-+    return SECSuccess;
-+}
-+
- /* Try to make progress on an SSL handshake by attempting to read the 
- ** next handshake from the peer, and sending any responses.
- ** For non-blocking sockets, returns PR_ERROR_WOULD_BLOCK  if it cannot 
-@@ -524,6 +600,9 @@ DoRecv(sslSocket *ss, unsigned char *out, int len, int flags)
-     int              amount;
-     int              available;
- 
-+    /* ssl3_GatherAppDataRecord may call ssl_FinishHandshake, which needs the
-+     * 1stHandshakeLock. */
-+    ssl_Get1stHandshakeLock(ss);
-     ssl_GetRecvBufLock(ss);
- 
-     available = ss->gs.writeOffset - ss->gs.readOffset;
-@@ -590,6 +669,7 @@ DoRecv(sslSocket *ss, unsigned char *out, int len, int flags)
- 
- done:
-     ssl_ReleaseRecvBufLock(ss);
-+    ssl_Release1stHandshakeLock(ss);
-     return rv;
- }
- 
-@@ -1156,7 +1236,7 @@ ssl_SecureRead(sslSocket *ss, unsigned char *buf, int len)
- int
- ssl_SecureSend(sslSocket *ss, const unsigned char *buf, int len, int flags)
- {
--    int              rv		= 0;
-+    int rv = 0;
- 
-     SSL_TRC(2, ("%d: SSL[%d]: SecureSend: sending %d bytes",
- 		SSL_GETPID(), ss->fd, len));
-@@ -1191,19 +1271,15 @@ ssl_SecureSend(sslSocket *ss, const unsigned char *buf, int len, int flags)
-     	ss->writerThread = PR_GetCurrentThread();
-     /* If any of these is non-zero, the initial handshake is not done. */
-     if (!ss->firstHsDone) {
--	PRBool canFalseStart = PR_FALSE;
-+        PRBool falseStart = PR_FALSE;
- 	ssl_Get1stHandshakeLock(ss);
--	if (ss->version >= SSL_LIBRARY_VERSION_3_0) {
-+        if (ss->opt.enableFalseStart &&
-+            ss->version >= SSL_LIBRARY_VERSION_3_0) {
- 	    ssl_GetSSL3HandshakeLock(ss);
--	    if ((ss->ssl3.hs.ws == wait_change_cipher ||
--		ss->ssl3.hs.ws == wait_finished ||
--		ss->ssl3.hs.ws == wait_new_session_ticket) &&
--		ssl3_CanFalseStart(ss)) {
--		canFalseStart = PR_TRUE;
--	    }
-+	    falseStart = ss->ssl3.hs.canFalseStart;
- 	    ssl_ReleaseSSL3HandshakeLock(ss);
- 	}
--	if (!canFalseStart &&
-+	if (!falseStart &&
- 	    (ss->handshake || ss->nextHandshake || ss->securityHandshake)) {
- 	    rv = ssl_Do1stHandshake(ss);
- 	}
-@@ -1228,6 +1304,17 @@ ssl_SecureSend(sslSocket *ss, const unsigned char *buf, int len, int flags)
- 	goto done;
-     }
- 
-+    if (!ss->firstHsDone) {
-+       PORT_Assert(ss->version >= SSL_LIBRARY_VERSION_3_0);
-+#ifdef DEBUG
-+       ssl_GetSSL3HandshakeLock(ss);
-+       PORT_Assert(ss->ssl3.hs.canFalseStart);
-+       ssl_ReleaseSSL3HandshakeLock(ss);
-+#endif
-+       SSL_TRC(3, ("%d: SSL[%d]: SecureSend: sending data due to false start",
-+                   SSL_GETPID(), ss->fd));
-+    }
-+
-     /* Send out the data using one of these functions:
-      *	ssl2_SendClear, ssl2_SendStream, ssl2_SendBlock, 
-      *  ssl3_SendApplicationData
-diff --git a/nss/lib/ssl/sslsock.c b/nss/lib/ssl/sslsock.c
-index cd4a7a7..73e069b 100644
---- a/nss/lib/ssl/sslsock.c
-+++ b/nss/lib/ssl/sslsock.c
-@@ -349,6 +349,8 @@ ssl_DupSocket(sslSocket *os)
- 	    ss->badCertArg            = os->badCertArg;
- 	    ss->handshakeCallback     = os->handshakeCallback;
- 	    ss->handshakeCallbackData = os->handshakeCallbackData;
-+            ss->canFalseStartCallback = os->canFalseStartCallback;
-+            ss->canFalseStartCallbackData = os->canFalseStartCallbackData;
- 	    ss->pkcs11PinArg          = os->pkcs11PinArg;
-     
- 	    /* Create security data */
-@@ -2341,10 +2343,14 @@ ssl_Poll(PRFileDesc *fd, PRInt16 how_flags, PRInt16 *p_out_flags)
- 	    } else if (new_flags & PR_POLL_WRITE) {
- 		    /* The caller is trying to write, but the handshake is 
- 		    ** blocked waiting for data to read, and the first 
--		    ** handshake has been sent.  so do NOT to poll on write.
-+                    ** handshake has been sent.  So do NOT to poll on write
-+                    ** unless we did false start.
- 		    */
--		    new_flags ^=  PR_POLL_WRITE;   /* don't select on write. */
--		    new_flags |=  PR_POLL_READ;	   /* do    select on read. */
-+                    if (!(ss->version >= SSL_LIBRARY_VERSION_3_0 &&
-+                        ss->ssl3.hs.canFalseStart)) {
-+                        new_flags ^= PR_POLL_WRITE; /* don't select on write. */
-+                    }
-+                    new_flags |= PR_POLL_READ;      /* do    select on read. */
- 	    }
- 	}
-     } else if ((new_flags & PR_POLL_READ) && (SSL_DataPending(fd) > 0)) {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/nss/files/nss-CVE-2013-5606.patch b/meta/recipes-support/nss/files/nss-CVE-2013-5606.patch
deleted file mode 100644
index f30475b..0000000
--- a/meta/recipes-support/nss/files/nss-CVE-2013-5606.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-nss: CVE-2013-5606
-
-Upstream-Status: Backport
-
-the patch comes from:
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-5606
-https://bugzilla.mozilla.org/show_bug.cgi?id=910438
-http://hg.mozilla.org/projects/nss/rev/d29898e0981c
-
-The CERT_VerifyCert function in lib/certhigh/certvfy.c in
-Mozilla Network Security Services (NSS) 3.15 before 3.15.3 provides
-an unexpected return value for an incompatible key-usage certificate
-when the CERTVerifyLog argument is valid, which might allow remote
-attackers to bypass intended access restrictions via a crafted certificate.
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- nss/lib/certhigh/certvfy.c |    7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/nss/lib/certhigh/certvfy.c b/nss/lib/certhigh/certvfy.c
-index f364ceb..f450205 100644
---- a/nss/lib/certhigh/certvfy.c
-+++ b/nss/lib/certhigh/certvfy.c
-@@ -1312,7 +1312,7 @@ CERT_VerifyCert(CERTCertDBHandle *handle, CERTCertificate *cert,
- 	PORT_SetError(SEC_ERROR_UNTRUSTED_CERT);
- 	LOG_ERROR_OR_EXIT(log,cert,0,flags);
-     } else if (trusted) {
--	goto winner;
-+	goto done;
-     }
- 
- 
-@@ -1340,7 +1340,10 @@ CERT_VerifyCert(CERTCertDBHandle *handle, CERTCertificate *cert,
- 	}
-     }
- 
--winner:
-+done:
-+    if (log && log->head) {
-+        return SECFailure;
-+    }
-     return(SECSuccess);
- 
- loser:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/nss/files/nss-CVE-2014-1492.patch b/meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
deleted file mode 100644
index 1be8a17..0000000
--- a/meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-nss: CVE-2014-1492
-
-Upstream-Status: Backport
-
-the patch comes from:
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1492
-https://bugzilla.mozilla.org/show_bug.cgi?id=903885
-
-changeset:   11063:709d4e597979
-user:        Kai Engert <kaie@kuix.de>
-date:        Wed Mar 05 18:38:55 2014 +0100
-summary:     Bug 903885, address requests to clarify comments from wtc
-
-changeset:   11046:2ffa40a3ff55
-tag:         tip
-user:        Wan-Teh Chang <wtc@google.com>
-date:        Tue Feb 25 18:17:08 2014 +0100
-summary:     Bug 903885, fix IDNA wildcard handling v4, r=kaie
-
-changeset:   11045:15ea62260c21
-user:        Christian Heimes <sites@cheimes.de>
-date:        Mon Feb 24 17:50:25 2014 +0100
-summary:     Bug 903885, fix IDNA wildcard handling, r=kaie
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- nss/lib/certdb/certdb.c |   15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/nss/lib/certdb/certdb.c b/nss/lib/certdb/certdb.c
-index b7d22bd..91877b7 100644
---- a/nss/lib/certdb/certdb.c
-+++ b/nss/lib/certdb/certdb.c
-@@ -1381,7 +1381,7 @@ cert_TestHostName(char * cn, const char * hn)
- 	    return rv;
- 	}
-     } else {
--	/* New approach conforms to RFC 2818. */
-+	/* New approach conforms to RFC 6125. */
- 	char *wildcard    = PORT_Strchr(cn, '*');
- 	char *firstcndot  = PORT_Strchr(cn, '.');
- 	char *secondcndot = firstcndot ? PORT_Strchr(firstcndot+1, '.') : NULL;
-@@ -1390,14 +1390,17 @@ cert_TestHostName(char * cn, const char * hn)
- 	/* For a cn pattern to be considered valid, the wildcard character...
- 	 * - may occur only in a DNS name with at least 3 components, and
- 	 * - may occur only as last character in the first component, and
--	 * - may be preceded by additional characters
-+         * - may be preceded by additional characters, and
-+         * - must not be preceded by an IDNA ACE prefix (xn--)
- 	 */
- 	if (wildcard && secondcndot && secondcndot[1] && firsthndot 
--	    && firstcndot  - wildcard  == 1
--	    && secondcndot - firstcndot > 1
--	    && PORT_Strrchr(cn, '*') == wildcard
-+            && firstcndot  - wildcard  == 1 /* wildcard is last char in first component */
-+            && secondcndot - firstcndot > 1 /* second component is non-empty */
-+            && PORT_Strrchr(cn, '*') == wildcard /* only one wildcard in cn */
- 	    && !PORT_Strncasecmp(cn, hn, wildcard - cn)
--	    && !PORT_Strcasecmp(firstcndot, firsthndot)) {
-+            && !PORT_Strcasecmp(firstcndot, firsthndot)
-+               /* If hn starts with xn--, then cn must start with wildcard */
-+            && (PORT_Strncasecmp(hn, "xn--", 4) || wildcard == cn)) {
- 	    /* valid wildcard pattern match */
- 	    return SECSuccess;
- 	}
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/nss/files/nss-CVE-2014-1544.patch b/meta/recipes-support/nss/files/nss-CVE-2014-1544.patch
deleted file mode 100644
index d6434df..0000000
--- a/meta/recipes-support/nss/files/nss-CVE-2014-1544.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-nss: CVE-2014-1544
-
-the patch comes from:
-https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-1544
-https://hg.mozilla.org/projects/nss/rev/204f22c527f8
-
-author	Robert Relyea <rrelyea@redhat.com>
-https://bugzilla.mozilla.org/show_bug.cgi?id=963150
-Bug 963150: Add nssCertificate_AddRef and nssCertificate_Destroy calls
-to PK11_ImportCert to prevent nssTrustDomain_AddCertsToCache from
-freeing the CERTCertificate associated with the NSSCertificate. r=wtc.
-
-Upstream-Status: Pending
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- nss/lib/pk11wrap/pk11cert.c |    7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/nss/lib/pk11wrap/pk11cert.c b/nss/lib/pk11wrap/pk11cert.c
-index 39168b9..3f3edb1 100644
---- a/nss/lib/pk11wrap/pk11cert.c
-+++ b/nss/lib/pk11wrap/pk11cert.c
-@@ -981,8 +981,15 @@ PK11_ImportCert(PK11SlotInfo *slot, CERTCertificate *cert,
-      * CERTCertificate, and finish
-      */
-     nssPKIObject_AddInstance(&c->object, certobj);
-+    /* nssTrustDomain_AddCertsToCache may release a reference to 'c' and
-+     * replace 'c' by a different value. So we add a reference to 'c' to
-+     * prevent 'c' from being destroyed. */
-+    nssCertificate_AddRef(c);
-     nssTrustDomain_AddCertsToCache(STAN_GetDefaultTrustDomain(), &c, 1);
-+    /* XXX should we pass the original value of 'c' to
-+     * STAN_ForceCERTCertificateUpdate? */
-     (void)STAN_ForceCERTCertificateUpdate(c);
-+    nssCertificate_Destroy(c);
-     SECITEM_FreeItem(keyID,PR_TRUE);
-     return SECSuccess;
- loser:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index d706c43..cf6110d 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -16,20 +16,13 @@ SRC_URI = "\
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
-    file://nss-3.15.1-fix-CVE-2013-1741.patch \
-    file://nss-3.15.1-fix-CVE-2013-5605.patch \
-    file://nss-CVE-2014-1492.patch \
-    file://nss-CVE-2013-1740.patch \
-    file://nss-3.15.1-fix-CVE-2013-1739.patch \
-    file://nss-CVE-2013-5606.patch \
-    file://nss-CVE-2014-1544.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
 inherit siteinfo
-PR = "r0"
+
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
 RDEPENDS_${PN} = "perl"
diff --git a/meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch b/meta/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
similarity index 100%
rename from meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
rename to meta/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
diff --git a/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch b/meta/recipes-support/nss/nss/nss-fix-support-cross-compiling.patch
similarity index 100%
rename from meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
rename to meta/recipes-support/nss/nss/nss-fix-support-cross-compiling.patch
diff --git a/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch b/meta/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
similarity index 100%
rename from meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
rename to meta/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
diff --git a/meta/recipes-support/nss/files/nss.pc.in b/meta/recipes-support/nss/nss/nss.pc.in
similarity index 100%
rename from meta/recipes-support/nss/files/nss.pc.in
rename to meta/recipes-support/nss/nss/nss.pc.in
diff --git a/meta/recipes-support/nss/files/signlibs.sh b/meta/recipes-support/nss/nss/signlibs.sh
similarity index 100%
rename from meta/recipes-support/nss/files/signlibs.sh
rename to meta/recipes-support/nss/nss/signlibs.sh
diff --git a/meta/recipes-support/nss/nss_3.15.1.bb b/meta/recipes-support/nss/nss_3.15.1.bb
deleted file mode 100644
index 7b06f00..0000000
--- a/meta/recipes-support/nss/nss_3.15.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require nss.inc
-
-SRC_URI += "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_15_1_RTM/src/${BPN}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "fb68f4d210ac9397dd0d3c39c4f938eb"
-SRC_URI[sha256sum] = "f994106a33d1f3210f4151bbb3419a1c28fd1cb545caa7dc9afdebd6da626284"
-
diff --git a/meta/recipes-support/nss/nss_3.17.bb b/meta/recipes-support/nss/nss_3.17.bb
new file mode 100644
index 0000000..804783f
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.17.bb
@@ -0,0 +1,8 @@
+require nss.inc
+
+SRC_URI += "\
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_RTM/src/${BPN}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "081dd99afa12af589c09e2d7cb5f5c6d"
+SRC_URI[sha256sum] = "3b1abcd8f89211dda2cc739bfa76552d080f7ea80482ef2727b006548a7f0c81"
-- 
1.8.3.1


