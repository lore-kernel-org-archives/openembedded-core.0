Return-Path: <josh.cartwright@ni.com>
Received: from us-aus-skprod3.natinst.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54D8B6A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 16:55:37 +0000 (UTC)
Received: from mailserv59-us.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	r5QGt02k001110; Wed, 26 Jun 2013 11:55:00 -0500
Received: from beefymiracle.amer.corp.natinst.com ([130.164.14.198])
	by mailserv59-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013062611550068-803950 ;
	Wed, 26 Jun 2013 11:55:00 -0500 
Received: by beefymiracle.amer.corp.natinst.com (Postfix, from userid 1000)
	id 9F0B1600AC; Wed, 26 Jun 2013 11:56:25 -0500 (CDT)
Date: Wed, 26 Jun 2013 11:56:25 -0500
From: Josh Cartwright <josh.cartwright@ni.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130626165625.GA3479@beefymiracle.amer.corp.natinst.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on MailServ59-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 06/26/2013 11:55:00 AM,
	Serialize by Router on MailServ59-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 06/26/2013 11:55:00 AM,
	Serialize complete at 06/26/2013 11:55:00 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-06-26_06:2013-06-26, 2013-06-26,
	1970-01-01 signatures=0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH] openssl: fix documentation build errors with Perl 5.18 pod2man
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
X-List-Received-Date: Wed, 26 Jun 2013 16:55:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please cherrypick upstream commit 8792b7f ("openssl: fix documentation
build errors with Perl 5.18") onto the dylan branch.  It should apply
cleanly; I've also appended it below.

This fixes the following build error building openssl:
| installing man1/CA.pl.1ssl
| installing man1/asn1parse.1ssl
| installing man1/ca.1ssl
| installing man1/ciphers.1ssl
| installing man1/cms.1ssl
| cms.pod around line 457: Expected text after =item, not a number
| cms.pod around line 461: Expected text after =item, not a number
| cms.pod around line 465: Expected text after =item, not a number
| cms.pod around line 470: Expected text after =item, not a number
| cms.pod around line 474: Expected text after =item, not a number
| POD document had syntax errors at /usr/bin/core_perl/pod2man line 71.
| make: *** [install_docs] Error 1

Thanks,
   Josh

-- 8< --
From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl-1.0.1e/openssl-fix-doc.patch   | 435 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +
 2 files changed, 436 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch
new file mode 100644
index 0000000..e87ed80
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch
@@ -0,0 +1,435 @@
+Fix documentation build errors with Perl 5.18 pod2man
+
+This fixes errors building man pages with newer versions of pod2man
+included with Perl 5.18.
+
+Upstream-Status: Submitted
+Signed-off-by: Jonathan Liu
+
+diff --git a/doc/apps/cms.pod b/doc/apps/cms.pod
+index a09588a..881d387 100644
+--- a/doc/apps/cms.pod
++++ b/doc/apps/cms.pod
+@@ -450,28 +450,28 @@ remains DER.
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ the operation was completely successfully.
+ 
+-=item 1 
++=item Z<>1 
+ 
+ an error occurred parsing the command options.
+ 
+-=item 2
++=item Z<>2
+ 
+ one of the input files could not be read.
+ 
+-=item 3
++=item Z<>3
+ 
+ an error occurred creating the CMS file or when reading the MIME
+ message.
+ 
+-=item 4
++=item Z<>4
+ 
+ an error occurred decrypting or verifying the message.
+ 
+-=item 5
++=item Z<>5
+ 
+ the message was verified correctly but an error occurred writing out
+ the signers certificates.
+diff --git a/doc/apps/smime.pod b/doc/apps/smime.pod
+index e4e89af..ef8e8cd 100644
+--- a/doc/apps/smime.pod
++++ b/doc/apps/smime.pod
+@@ -308,28 +308,28 @@ remains DER.
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ the operation was completely successfully.
+ 
+-=item 1 
++=item Z<>1 
+ 
+ an error occurred parsing the command options.
+ 
+-=item 2
++=item Z<>2
+ 
+ one of the input files could not be read.
+ 
+-=item 3
++=item Z<>3
+ 
+ an error occurred creating the PKCS#7 file or when reading the MIME
+ message.
+ 
+-=item 4
++=item Z<>4
+ 
+ an error occurred decrypting or verifying the message.
+ 
+-=item 5
++=item Z<>5
+ 
+ the message was verified correctly but an error occurred writing out
+ the signers certificates.
+diff --git a/doc/crypto/X509_STORE_CTX_get_error.pod b/doc/crypto/X509_STORE_CTX_get_error.pod
+index a883f6c..60e8332 100644
+--- a/doc/crypto/X509_STORE_CTX_get_error.pod
++++ b/doc/crypto/X509_STORE_CTX_get_error.pod
+@@ -278,6 +278,8 @@ happen if extended CRL checking is enabled.
+ an application specific error. This will never be returned unless explicitly
+ set by an application.
+ 
++=back
++
+ =head1 NOTES
+ 
+ The above functions should be used instead of directly referencing the fields
+diff --git a/doc/ssl/SSL_COMP_add_compression_method.pod b/doc/ssl/SSL_COMP_add_compression_method.pod
+index 42fa66b..f4d191c 100644
+--- a/doc/ssl/SSL_COMP_add_compression_method.pod
++++ b/doc/ssl/SSL_COMP_add_compression_method.pod
+@@ -53,11 +53,11 @@ SSL_COMP_add_compression_method() may return the following values:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The operation succeeded.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation failed. Check the error queue to find out the reason.
+ 
+diff --git a/doc/ssl/SSL_CTX_add_session.pod b/doc/ssl/SSL_CTX_add_session.pod
+index 82676b2..8e0abd3 100644
+--- a/doc/ssl/SSL_CTX_add_session.pod
++++ b/doc/ssl/SSL_CTX_add_session.pod
+@@ -52,13 +52,13 @@ The following values are returned by all functions:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+  The operation failed. In case of the add operation, it was tried to add
+  the same (identical) session twice. In case of the remove operation, the
+  session was not found in the cache.
+ 
+-=item 1
++=item Z<>1
+  
+  The operation succeeded.
+ 
+diff --git a/doc/ssl/SSL_CTX_load_verify_locations.pod b/doc/ssl/SSL_CTX_load_verify_locations.pod
+index 84a799f..d1d8977 100644
+--- a/doc/ssl/SSL_CTX_load_verify_locations.pod
++++ b/doc/ssl/SSL_CTX_load_verify_locations.pod
+@@ -100,13 +100,13 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The operation failed because B<CAfile> and B<CApath> are NULL or the
+ processing at one of the locations specified failed. Check the error
+ stack to find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+diff --git a/doc/ssl/SSL_CTX_set_client_CA_list.pod b/doc/ssl/SSL_CTX_set_client_CA_list.pod
+index 632b556..6122a02 100644
+--- a/doc/ssl/SSL_CTX_set_client_CA_list.pod
++++ b/doc/ssl/SSL_CTX_set_client_CA_list.pod
+@@ -66,11 +66,11 @@ values:
+ 
+ =over 4
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+-=item 0
++=item Z<>0
+ 
+ A failure while manipulating the STACK_OF(X509_NAME) object occurred or
+ the X509_NAME could not be extracted from B<cacert>. Check the error stack
+diff --git a/doc/ssl/SSL_CTX_set_session_id_context.pod b/doc/ssl/SSL_CTX_set_session_id_context.pod
+index 58fc685..7c9e515 100644
+--- a/doc/ssl/SSL_CTX_set_session_id_context.pod
++++ b/doc/ssl/SSL_CTX_set_session_id_context.pod
+@@ -64,13 +64,13 @@ return the following values:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The length B<sid_ctx_len> of the session id context B<sid_ctx> exceeded
+ the maximum allowed length of B<SSL_MAX_SSL_SESSION_ID_LENGTH>. The error
+ is logged to the error stack.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+diff --git a/doc/ssl/SSL_CTX_set_ssl_version.pod b/doc/ssl/SSL_CTX_set_ssl_version.pod
+index 254f2b4..e254f96 100644
+--- a/doc/ssl/SSL_CTX_set_ssl_version.pod
++++ b/doc/ssl/SSL_CTX_set_ssl_version.pod
+@@ -42,11 +42,11 @@ and SSL_set_ssl_method():
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The new choice failed, check the error stack to find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+diff --git a/doc/ssl/SSL_CTX_use_psk_identity_hint.pod b/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
+index b80e25b..31e6626 100644
+--- a/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
++++ b/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
+@@ -81,6 +81,8 @@ SSL_CTX_use_psk_identity_hint() and SSL_use_psk_identity_hint() return
+ 
+ Return values from the server callback are interpreted as follows:
+ 
++=over 4
++
+ =item > 0
+ 
+ PSK identity was found and the server callback has provided the PSK
+@@ -94,9 +96,11 @@ data to B<psk> and return the length of the random data, so the
+ connection will fail with decryption_error before it will be finished
+ completely.
+ 
+-=item 0
++=item Z<>0
+ 
+ PSK identity was not found. An "unknown_psk_identity" alert message
+ will be sent and the connection setup fails.
+ 
++=back
++
+ =cut
+diff --git a/doc/ssl/SSL_accept.pod b/doc/ssl/SSL_accept.pod
+index cc724c0..4915e5a 100644
+--- a/doc/ssl/SSL_accept.pod
++++ b/doc/ssl/SSL_accept.pod
+@@ -44,12 +44,12 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 1
++=item Z<>1
+ 
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+ 
+-=item 0
++=item Z<>0
+ 
+ The TLS/SSL handshake was not successful but was shut down controlled and
+ by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
+diff --git a/doc/ssl/SSL_clear.pod b/doc/ssl/SSL_clear.pod
+index d4df1bf..ba192bd 100644
+--- a/doc/ssl/SSL_clear.pod
++++ b/doc/ssl/SSL_clear.pod
+@@ -56,12 +56,12 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The SSL_clear() operation could not be performed. Check the error stack to
+ find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The SSL_clear() operation was successful.
+ 
+diff --git a/doc/ssl/SSL_connect.pod b/doc/ssl/SSL_connect.pod
+index cc56ebb..61cabb7 100644
+--- a/doc/ssl/SSL_connect.pod
++++ b/doc/ssl/SSL_connect.pod
+@@ -41,12 +41,12 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 1
++=item Z<>1
+ 
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+ 
+-=item 0
++=item Z<>0
+ 
+ The TLS/SSL handshake was not successful but was shut down controlled and
+ by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
+diff --git a/doc/ssl/SSL_do_handshake.pod b/doc/ssl/SSL_do_handshake.pod
+index 2435764..beb0dd1 100644
+--- a/doc/ssl/SSL_do_handshake.pod
++++ b/doc/ssl/SSL_do_handshake.pod
+@@ -45,12 +45,12 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 1
++=item Z<>1
+ 
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+ 
+-=item 0
++=item Z<>0
+ 
+ The TLS/SSL handshake was not successful but was shut down controlled and
+ by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
+diff --git a/doc/ssl/SSL_read.pod b/doc/ssl/SSL_read.pod
+index 7038cd2..8ca0ce5 100644
+--- a/doc/ssl/SSL_read.pod
++++ b/doc/ssl/SSL_read.pod
+@@ -86,7 +86,7 @@ The following return values can occur:
+ The read operation was successful; the return value is the number of
+ bytes actually read from the TLS/SSL connection.
+ 
+-=item 0
++=item Z<>0
+ 
+ The read operation was not successful. The reason may either be a clean
+ shutdown due to a "close notify" alert sent by the peer (in which case
+diff --git a/doc/ssl/SSL_session_reused.pod b/doc/ssl/SSL_session_reused.pod
+index da7d062..b09d8a7 100644
+--- a/doc/ssl/SSL_session_reused.pod
++++ b/doc/ssl/SSL_session_reused.pod
+@@ -27,11 +27,11 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ A new session was negotiated.
+ 
+-=item 1
++=item Z<>1
+ 
+ A session was reused.
+ 
+diff --git a/doc/ssl/SSL_set_fd.pod b/doc/ssl/SSL_set_fd.pod
+index 7029112..1480871 100644
+--- a/doc/ssl/SSL_set_fd.pod
++++ b/doc/ssl/SSL_set_fd.pod
+@@ -35,11 +35,11 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The operation failed. Check the error stack to find out why.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+diff --git a/doc/ssl/SSL_set_session.pod b/doc/ssl/SSL_set_session.pod
+index 5f54714..197b521 100644
+--- a/doc/ssl/SSL_set_session.pod
++++ b/doc/ssl/SSL_set_session.pod
+@@ -37,11 +37,11 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ The operation failed; check the error stack to find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+diff --git a/doc/ssl/SSL_set_shutdown.pod b/doc/ssl/SSL_set_shutdown.pod
+index 011a022..fe01308 100644
+--- a/doc/ssl/SSL_set_shutdown.pod
++++ b/doc/ssl/SSL_set_shutdown.pod
+@@ -24,7 +24,7 @@ The shutdown state of an ssl connection is a bitmask of:
+ 
+ =over 4
+ 
+-=item 0
++=item Z<>0
+ 
+ No shutdown setting, yet.
+ 
+diff --git a/doc/ssl/SSL_shutdown.pod b/doc/ssl/SSL_shutdown.pod
+index 89911ac..132ebc5 100644
+--- a/doc/ssl/SSL_shutdown.pod
++++ b/doc/ssl/SSL_shutdown.pod
+@@ -92,19 +92,19 @@ The following return values can occur:
+ 
+ =over 4
+ 
+-=item 1
++=item Z<>1
+ 
+ The shutdown was successfully completed. The "close notify" alert was sent
+ and the peer's "close notify" alert was received.
+ 
+-=item 0
++=item Z<>0
+ 
+ The shutdown is not yet finished. Call SSL_shutdown() for a second time,
+ if a bidirectional shutdown shall be performed.
+ The output of L<SSL_get_error(3)|SSL_get_error(3)> may be misleading, as an
+ erroneous SSL_ERROR_SYSCALL may be flagged even though no error occurred.
+ 
+-=item -1
++=item Z<>-1
+ 
+ The shutdown was not successful because a fatal error occurred either
+ at the protocol level or a connection failure occurred. It can also occur if
+diff --git a/doc/ssl/SSL_write.pod b/doc/ssl/SSL_write.pod
+index e013c12..a57617f 100644
+--- a/doc/ssl/SSL_write.pod
++++ b/doc/ssl/SSL_write.pod
+@@ -79,7 +79,7 @@ The following return values can occur:
+ The write operation was successful, the return value is the number of
+ bytes actually written to the TLS/SSL connection.
+ 
+-=item 0
++=item Z<>0
+ 
+ The write operation was not successful. Probably the underlying connection
+ was closed. Call SSL_get_error() with the return value B<ret> to find out,
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index c7c225d..61de3a6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/no-symbolic.patch \
             file://debian/debian-targets.patch \
             file://openssl_fix_for_x32.patch \
+            file://openssl-fix-doc.patch \
             file://find.pl \
            "
 
-- 
1.8.3.1

