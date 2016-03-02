Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 63937762B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 07:37:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q129so6059373pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 23:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XN2HiE+7KJLkrUl0Xba07Evu6GVRfiqHT3qIMmDGUYo=;
	b=pr9MPltBtqM6w8FJyCvn9lOzlnjfvK9YIjW5qhhHo4K2AjOR0kQFp3/QS9AM+hnfIi
	PZyvBi2t74RHZfjlvUquEEZx87nywmpdiNBE53CGUIn5Z1VKX+XFyaCOQhsCSU9X8/ov
	HrQw2o1f1d73eYvtumvgnSqnsUU1DKw2gHvhttodElutRF7fJZJzSvkoHjt7bEDjohm7
	nDjKMGtKNzReSFaRpoKc2PTYNcMRLQPPbHysnHGaHPI6IGg2t6aqnG5B/nZyn40TKcvn
	aN4SJaTzKnE2Jlr2XUqbDw1jncn4wK361BqOB6odXeg0ZPBvw50J4OzoXnQTKg8nm6n/
	T7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XN2HiE+7KJLkrUl0Xba07Evu6GVRfiqHT3qIMmDGUYo=;
	b=AjKQLcfHmBZKoIt7GIivEkZ0W9X4egUnnbcGYWtpWvVmuseuDzW31gfH0lFp1gzBqF
	0Ui9SXZiDbzQRoXbpkpCZve1eIv49LIzAOo4+hirdvlGE246MYfu7pCTE4SeS5nIIsGB
	WICfAuL1OVlbKif78KcMGd+ho8PHMvTtfMgYy32nQ8G54HJNWaND4zHsabvpuT99U3Dg
	gY8wPk1h1loUyplQYdiK/0pfjuhA0KAt77GvMIkkfHZYqtPsUbhX+lG8viASPrwPPk3+
	WCutW9wQGF22Pa5i8g3G5oalsJH23/wYeDUTlrtDcN5zg8x4ywLSeVJu7R9KXYW/9CRi
	PHCw==
X-Gm-Message-State: AD7BkJL/+MogsFDmcqat171SUBZ3igo+YkMPH/AOPWHfOv/Ekbkg1Na0UAB4oBuv48fCpA==
X-Received: by 10.98.68.91 with SMTP id r88mr15021199pfa.12.1456904245694;
	Tue, 01 Mar 2016 23:37:25 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o66sm28565328pfi.14.2016.03.01.23.37.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 23:37:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 23:37:21 -0800
Message-Id: <1456904241-17157-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [jethro][fido][PATCH] openssl: Security fix CVE-2016-0800
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
X-List-Received-Date: Wed, 02 Mar 2016 07:37:25 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

CVE-2016-0800 SSL/TLS: Cross-protocol attack on TLS using SSLv2 (DROWN)

https://www.openssl.org/news/secadv/20160301.txt

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/openssl/CVE-2016-0800.patch            | 198 +++++++
 .../openssl/openssl/CVE-2016-0800_2.patch          | 592 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-0800_3.patch          | 503 +++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   3 +
 4 files changed, 1296 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
new file mode 100644
index 0000000..e5635fe
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
@@ -0,0 +1,198 @@
+From 9dfd2be8a1761fffd152a92d8f1b356ad667eea7 Mon Sep 17 00:00:00 2001
+From: Viktor Dukhovni <openssl-users@dukhovni.org>
+Date: Wed, 17 Feb 2016 21:07:48 -0500
+Subject: [PATCH] Disable SSLv2 default build, default negotiation and weak
+ ciphers.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+SSLv2 is by default disabled at build-time.  Builds that are not
+configured with "enable-ssl2" will not support SSLv2.  Even if
+"enable-ssl2" is used, users who want to negotiate SSLv2 via the
+version-flexible SSLv23_method() will need to explicitly call either
+of:
+
+    SSL_CTX_clear_options(ctx, SSL_OP_NO_SSLv2);
+or
+    SSL_clear_options(ssl, SSL_OP_NO_SSLv2);
+
+as appropriate.  Even if either of those is used, or the application
+explicitly uses the version-specific SSLv2_method() or its client
+or server variants, SSLv2 ciphers vulnerable to exhaustive search
+key recovery have been removed.  Specifically, the SSLv2 40-bit
+EXPORT ciphers, and SSLv2 56-bit DES are no longer available.
+
+Mitigation for CVE-2016-0800
+
+Reviewed-by: Emilia Käsper <emilia@openssl.org>
+
+Upstream-Status: Backport
+
+https://git.openssl.org/?p=openssl.git;a=commit;h=9dfd2be8a1761fffd152a92d8f1b356ad667eea7
+
+CVE: CVE-2016-0800
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ CHANGES        | 17 +++++++++++++++++
+ Configure      |  3 ++-
+ NEWS           |  2 +-
+ ssl/s2_lib.c   |  6 ++++++
+ ssl/ssl_conf.c | 10 +++++++++-
+ ssl/ssl_lib.c  |  7 +++++++
+ 6 files changed, 42 insertions(+), 3 deletions(-)
+
+Index: openssl-1.0.2d/Configure
+===================================================================
+--- openssl-1.0.2d.orig/Configure
++++ openssl-1.0.2d/Configure
+@@ -847,9 +847,10 @@ my %disabled = ( # "what"         => "co
+ 		 "md2"            => "default",
+ 		 "rc5"            => "default",
+ 		 "rfc3779"	  => "default",
+-		 "sctp"       => "default",
++		 "sctp"           => "default",
+ 		 "shared"         => "default",
+ 		 "ssl-trace"	  => "default",
++		 "ssl2"           => "default",
+ 		 "store"	  => "experimental",
+ 		 "unit-test"	  => "default",
+ 		 "zlib"           => "default",
+Index: openssl-1.0.2d/ssl/s2_lib.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/s2_lib.c
++++ openssl-1.0.2d/ssl/s2_lib.c
+@@ -156,6 +156,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
+      128,
+      },
+ 
++# if 0
+ /* RC4_128_EXPORT40_WITH_MD5 */
+     {
+      1,
+@@ -171,6 +172,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
+      40,
+      128,
+      },
++# endif
+ 
+ /* RC2_128_CBC_WITH_MD5 */
+     {
+@@ -188,6 +190,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
+      128,
+      },
+ 
++# if 0
+ /* RC2_128_CBC_EXPORT40_WITH_MD5 */
+     {
+      1,
+@@ -203,6 +206,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
+      40,
+      128,
+      },
++# endif
+ 
+ # ifndef OPENSSL_NO_IDEA
+ /* IDEA_128_CBC_WITH_MD5 */
+@@ -222,6 +226,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
+      },
+ # endif
+ 
++# if 0
+ /* DES_64_CBC_WITH_MD5 */
+     {
+      1,
+@@ -237,6 +242,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
+      56,
+      56,
+      },
++# endif
+ 
+ /* DES_192_EDE3_CBC_WITH_MD5 */
+     {
+Index: openssl-1.0.2d/ssl/ssl_conf.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/ssl_conf.c
++++ openssl-1.0.2d/ssl/ssl_conf.c
+@@ -330,11 +330,19 @@ static int cmd_Protocol(SSL_CONF_CTX *cc
+         SSL_FLAG_TBL_INV("TLSv1.1", SSL_OP_NO_TLSv1_1),
+         SSL_FLAG_TBL_INV("TLSv1.2", SSL_OP_NO_TLSv1_2)
+     };
++    int ret;
++    int sslv2off;
++
+     if (!(cctx->flags & SSL_CONF_FLAG_FILE))
+         return -2;
+     cctx->tbl = ssl_protocol_list;
+     cctx->ntbl = sizeof(ssl_protocol_list) / sizeof(ssl_flag_tbl);
+-    return CONF_parse_list(value, ',', 1, ssl_set_option_list, cctx);
++
++    sslv2off = *cctx->poptions & SSL_OP_NO_SSLv2;
++    ret = CONF_parse_list(value, ',', 1, ssl_set_option_list, cctx);
++    /* Never turn on SSLv2 through configuration */
++    *cctx->poptions |= sslv2off;
++    return ret;
+ }
+ 
+ static int cmd_Options(SSL_CONF_CTX *cctx, const char *value)
+Index: openssl-1.0.2d/ssl/ssl_lib.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/ssl_lib.c
++++ openssl-1.0.2d/ssl/ssl_lib.c
+@@ -2052,6 +2052,13 @@ SSL_CTX *SSL_CTX_new(const SSL_METHOD *m
+      */
+     ret->options |= SSL_OP_LEGACY_SERVER_CONNECT;
+ 
++    /*
++     * Disable SSLv2 by default, callers that want to enable SSLv2 will have to
++     * explicitly clear this option via either of SSL_CTX_clear_options() or
++     * SSL_clear_options().
++     */
++    ret->options |= SSL_OP_NO_SSLv2;
++
+     return (ret);
+  err:
+     SSLerr(SSL_F_SSL_CTX_NEW, ERR_R_MALLOC_FAILURE);
+Index: openssl-1.0.2d/CHANGES
+===================================================================
+--- openssl-1.0.2d.orig/CHANGES
++++ openssl-1.0.2d/CHANGES
+@@ -2,6 +2,25 @@
+  OpenSSL CHANGES
+  _______________
+ 
++ 
++  * Disable SSLv2 default build, default negotiation and weak ciphers.  SSLv2
++    is by default disabled at build-time.  Builds that are not configured with
++    "enable-ssl2" will not support SSLv2.  Even if "enable-ssl2" is used,
++    users who want to negotiate SSLv2 via the version-flexible SSLv23_method()
++    will need to explicitly call either of:
++
++        SSL_CTX_clear_options(ctx, SSL_OP_NO_SSLv2);
++    or
++        SSL_clear_options(ssl, SSL_OP_NO_SSLv2);
++
++    as appropriate.  Even if either of those is used, or the application
++    explicitly uses the version-specific SSLv2_method() or its client and
++    server variants, SSLv2 ciphers vulnerable to exhaustive search key
++    recovery have been removed.  Specifically, the SSLv2 40-bit EXPORT
++    ciphers, and SSLv2 56-bit DES are no longer available.
++    [Viktor Dukhovni]
++    
++
+  Changes between 1.0.2c and 1.0.2d [9 Jul 2015]
+ 
+   *) Alternate chains certificate forgery
+Index: openssl-1.0.2d/NEWS
+===================================================================
+--- openssl-1.0.2d.orig/NEWS
++++ openssl-1.0.2d/NEWS
+@@ -1,6 +1,7 @@
+ 
+   NEWS
+   ====
++  Disable SSLv2 default build, default negotiation and weak ciphers.
+ 
+   This file gives a brief overview of the major changes between each OpenSSL
+   release. For more details please read the CHANGES file.
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
new file mode 100644
index 0000000..de89d08
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
@@ -0,0 +1,592 @@
+From 021fb42dd0cf2bf985b0e26ca50418eb42c00d09 Mon Sep 17 00:00:00 2001
+From: Viktor Dukhovni <openssl-users@dukhovni.org>
+Date: Wed, 17 Feb 2016 23:38:55 -0500
+Subject: [PATCH] Bring SSL method documentation up to date
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reviewed-by: Emilia Käsper <emilia@openssl.org>
+
+Upstream-Status: Backport
+
+https://git.openssl.org/?p=openssl.git;a=commit;h=021fb42dd0cf2bf985b0e26ca50418eb42c00d09
+
+CVE: CVE-2016-0800 #2 patch
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ doc/apps/ciphers.pod            |  29 ++++---
+ doc/apps/s_client.pod           |  12 +--
+ doc/apps/s_server.pod           |   8 +-
+ doc/ssl/SSL_CONF_cmd.pod        |  33 ++++----
+ doc/ssl/SSL_CTX_new.pod         | 168 ++++++++++++++++++++++++++++------------
+ doc/ssl/SSL_CTX_set_options.pod |  10 +++
+ doc/ssl/ssl.pod                 |  77 ++++++++++++++----
+ 7 files changed, 226 insertions(+), 111 deletions(-)
+
+diff --git a/doc/apps/ciphers.pod b/doc/apps/ciphers.pod
+index 1c26e3b..8038b05 100644
+--- a/doc/apps/ciphers.pod
++++ b/doc/apps/ciphers.pod
+@@ -38,25 +38,21 @@ SSL v2 and for SSL v3/TLS v1.
+ 
+ Like B<-v>, but include cipher suite codes in output (hex format).
+ 
+-=item B<-ssl3>
++=item B<-ssl3>, B<-tls1>
+ 
+-only include SSL v3 ciphers.
++This lists ciphers compatible with any of SSLv3, TLSv1, TLSv1.1 or TLSv1.2.
+ 
+ =item B<-ssl2>
+ 
+-only include SSL v2 ciphers.
+-
+-=item B<-tls1>
+-
+-only include TLS v1 ciphers.
++Only include SSLv2 ciphers.
+ 
+ =item B<-h>, B<-?>
+ 
+-print a brief usage message.
++Print a brief usage message.
+ 
+ =item B<cipherlist>
+ 
+-a cipher list to convert to a cipher preference list. If it is not included
++A cipher list to convert to a cipher preference list. If it is not included
+ then the default cipher list will be used. The format is described below.
+ 
+ =back
+@@ -109,9 +105,10 @@ The following is a list of all permitted cipher strings and their meanings.
+ 
+ =item B<DEFAULT>
+ 
+-the default cipher list. This is determined at compile time and
+-is normally B<ALL:!EXPORT:!aNULL:!eNULL:!SSLv2>. This must be the firstcipher string
+-specified.
++The default cipher list.
++This is determined at compile time and is normally
++B<ALL:!EXPORT:!aNULL:!eNULL:!SSLv2>.
++When used, this must be the first cipherstring specified.
+ 
+ =item B<COMPLEMENTOFDEFAULT>
+ 
+@@ -582,11 +579,11 @@ Note: these ciphers can also be used in SSL v3.
+ =head2 Deprecated SSL v2.0 cipher suites.
+ 
+  SSL_CK_RC4_128_WITH_MD5                 RC4-MD5
+- SSL_CK_RC4_128_EXPORT40_WITH_MD5        EXP-RC4-MD5
+- SSL_CK_RC2_128_CBC_WITH_MD5             RC2-MD5
+- SSL_CK_RC2_128_CBC_EXPORT40_WITH_MD5    EXP-RC2-MD5
++ SSL_CK_RC4_128_EXPORT40_WITH_MD5        Not implemented.
++ SSL_CK_RC2_128_CBC_WITH_MD5             RC2-CBC-MD5
++ SSL_CK_RC2_128_CBC_EXPORT40_WITH_MD5    Not implemented.
+  SSL_CK_IDEA_128_CBC_WITH_MD5            IDEA-CBC-MD5
+- SSL_CK_DES_64_CBC_WITH_MD5              DES-CBC-MD5
++ SSL_CK_DES_64_CBC_WITH_MD5              Not implemented.
+  SSL_CK_DES_192_EDE3_CBC_WITH_MD5        DES-CBC3-MD5
+ 
+ =head1 NOTES
+diff --git a/doc/apps/s_client.pod b/doc/apps/s_client.pod
+index 84d0527..618df96 100644
+--- a/doc/apps/s_client.pod
++++ b/doc/apps/s_client.pod
+@@ -201,15 +201,11 @@ Use the PSK key B<key> when using a PSK cipher suite. The key is
+ given as a hexadecimal number without leading 0x, for example -psk
+ 1a2b3c4d.
+ 
+-=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
++=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-tls1_1>, B<-tls1_2>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
+ 
+-these options disable the use of certain SSL or TLS protocols. By default
+-the initial handshake uses a method which should be compatible with all
+-servers and permit them to use SSL v3, SSL v2 or TLS as appropriate.
+-
+-Unfortunately there are still ancient and broken servers in use which
+-cannot handle this technique and will fail to connect. Some servers only
+-work if TLS is turned off.
++These options require or disable the use of the specified SSL or TLS protocols.
++By default the initial handshake uses a I<version-flexible> method which will
++negotiate the highest mutually supported protocol version.
+ 
+ =item B<-fallback_scsv>
+ 
+diff --git a/doc/apps/s_server.pod b/doc/apps/s_server.pod
+index baca779..6f4acb7 100644
+--- a/doc/apps/s_server.pod
++++ b/doc/apps/s_server.pod
+@@ -217,11 +217,11 @@ Use the PSK key B<key> when using a PSK cipher suite. The key is
+ given as a hexadecimal number without leading 0x, for example -psk
+ 1a2b3c4d.
+ 
+-=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>
++=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-tls1_1>, B<-tls1_2>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
+ 
+-these options disable the use of certain SSL or TLS protocols. By default
+-the initial handshake uses a method which should be compatible with all
+-servers and permit them to use SSL v3, SSL v2 or TLS as appropriate.
++These options require or disable the use of the specified SSL or TLS protocols.
++By default the initial handshake uses a I<version-flexible> method which will
++negotiate the highest mutually supported protocol version.
+ 
+ =item B<-bugs>
+ 
+diff --git a/doc/ssl/SSL_CONF_cmd.pod b/doc/ssl/SSL_CONF_cmd.pod
+index 2bf1a60..e81d76a 100644
+--- a/doc/ssl/SSL_CONF_cmd.pod
++++ b/doc/ssl/SSL_CONF_cmd.pod
+@@ -74,7 +74,7 @@ B<prime256v1>). Curve names are case sensitive.
+ 
+ =item B<-named_curve>
+ 
+-This sets the temporary curve used for ephemeral ECDH modes. Only used by 
++This sets the temporary curve used for ephemeral ECDH modes. Only used by
+ servers
+ 
+ The B<value> argument is a curve name or the special value B<auto> which
+@@ -85,7 +85,7 @@ can be either the B<NIST> name (e.g. B<P-256>) or an OpenSSL OID name
+ =item B<-cipher>
+ 
+ Sets the cipher suite list to B<value>. Note: syntax checking of B<value> is
+-currently not performed unless a B<SSL> or B<SSL_CTX> structure is 
++currently not performed unless a B<SSL> or B<SSL_CTX> structure is
+ associated with B<cctx>.
+ 
+ =item B<-cert>
+@@ -111,9 +111,9 @@ operations are permitted.
+ 
+ =item B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
+ 
+-Disables protocol support for SSLv2, SSLv3, TLS 1.0, TLS 1.1 or TLS 1.2 
+-by setting the corresponding options B<SSL_OP_NO_SSL2>, B<SSL_OP_NO_SSL3>,
+-B<SSL_OP_NO_TLS1>, B<SSL_OP_NO_TLS1_1> and B<SSL_OP_NO_TLS1_2> respectively.
++Disables protocol support for SSLv2, SSLv3, TLSv1.0, TLSv1.1 or TLSv1.2
++by setting the corresponding options B<SSL_OP_NO_SSLv2>, B<SSL_OP_NO_SSLv3>,
++B<SSL_OP_NO_TLSv1>, B<SSL_OP_NO_TLSv1_1> and B<SSL_OP_NO_TLSv1_2> respectively.
+ 
+ =item B<-bugs>
+ 
+@@ -177,7 +177,7 @@ Note: the command prefix (if set) alters the recognised B<cmd> values.
+ =item B<CipherString>
+ 
+ Sets the cipher suite list to B<value>. Note: syntax checking of B<value> is
+-currently not performed unless an B<SSL> or B<SSL_CTX> structure is 
++currently not performed unless an B<SSL> or B<SSL_CTX> structure is
+ associated with B<cctx>.
+ 
+ =item B<Certificate>
+@@ -244,7 +244,7 @@ B<prime256v1>). Curve names are case sensitive.
+ 
+ =item B<ECDHParameters>
+ 
+-This sets the temporary curve used for ephemeral ECDH modes. Only used by 
++This sets the temporary curve used for ephemeral ECDH modes. Only used by
+ servers
+ 
+ The B<value> argument is a curve name or the special value B<Automatic> which
+@@ -258,10 +258,11 @@ The supported versions of the SSL or TLS protocol.
+ 
+ The B<value> argument is a comma separated list of supported protocols to
+ enable or disable. If an protocol is preceded by B<-> that version is disabled.
+-All versions are enabled by default, though applications may choose to
+-explicitly disable some. Currently supported protocol values are B<SSLv2>,
+-B<SSLv3>, B<TLSv1>, B<TLSv1.1> and B<TLSv1.2>. The special value B<ALL> refers
+-to all supported versions.
++Currently supported protocol values are B<SSLv2>, B<SSLv3>, B<TLSv1>,
++B<TLSv1.1> and B<TLSv1.2>.
++All protocol versions other than B<SSLv2> are enabled by default.
++To avoid inadvertent enabling of B<SSLv2>, when SSLv2 is disabled, it is not
++possible to enable it via the B<Protocol> command.
+ 
+ =item B<Options>
+ 
+@@ -339,16 +340,16 @@ The value is a directory name.
+ The order of operations is significant. This can be used to set either defaults
+ or values which cannot be overridden. For example if an application calls:
+ 
+- SSL_CONF_cmd(ctx, "Protocol", "-SSLv2");
++ SSL_CONF_cmd(ctx, "Protocol", "-SSLv3");
+  SSL_CONF_cmd(ctx, userparam, uservalue);
+ 
+-it will disable SSLv2 support by default but the user can override it. If 
++it will disable SSLv3 support by default but the user can override it. If
+ however the call sequence is:
+ 
+  SSL_CONF_cmd(ctx, userparam, uservalue);
+- SSL_CONF_cmd(ctx, "Protocol", "-SSLv2");
++ SSL_CONF_cmd(ctx, "Protocol", "-SSLv3");
+ 
+-SSLv2 is B<always> disabled and attempt to override this by the user are
++then SSLv3 is B<always> disabled and attempt to override this by the user are
+ ignored.
+ 
+ By checking the return code of SSL_CTX_cmd() it is possible to query if a
+@@ -372,7 +373,7 @@ can be checked instead. If -3 is returned a required argument is missing
+ and an error is indicated. If 0 is returned some other error occurred and
+ this can be reported back to the user.
+ 
+-The function SSL_CONF_cmd_value_type() can be used by applications to 
++The function SSL_CONF_cmd_value_type() can be used by applications to
+ check for the existence of a command or to perform additional syntax
+ checking or translation of the command value. For example if the return
+ value is B<SSL_CONF_TYPE_FILE> an application could translate a relative
+diff --git a/doc/ssl/SSL_CTX_new.pod b/doc/ssl/SSL_CTX_new.pod
+index 491ac8c..b8cc879 100644
+--- a/doc/ssl/SSL_CTX_new.pod
++++ b/doc/ssl/SSL_CTX_new.pod
+@@ -2,13 +2,55 @@
+ 
+ =head1 NAME
+ 
+-SSL_CTX_new - create a new SSL_CTX object as framework for TLS/SSL enabled functions
++SSL_CTX_new,
++SSLv23_method, SSLv23_server_method, SSLv23_client_method,
++TLSv1_2_method, TLSv1_2_server_method, TLSv1_2_client_method,
++TLSv1_1_method, TLSv1_1_server_method, TLSv1_1_client_method,
++TLSv1_method, TLSv1_server_method, TLSv1_client_method,
++SSLv3_method, SSLv3_server_method, SSLv3_client_method,
++SSLv2_method, SSLv2_server_method, SSLv2_client_method,
++DTLS_method, DTLS_server_method, DTLS_client_method,
++DTLSv1_2_method, DTLSv1_2_server_method, DTLSv1_2_client_method,
++DTLSv1_method, DTLSv1_server_method, DTLSv1_client_method -
++create a new SSL_CTX object as framework for TLS/SSL enabled functions
+ 
+ =head1 SYNOPSIS
+ 
+  #include <openssl/ssl.h>
+ 
+  SSL_CTX *SSL_CTX_new(const SSL_METHOD *method);
++ const SSL_METHOD *SSLv23_method(void);
++ const SSL_METHOD *SSLv23_server_method(void);
++ const SSL_METHOD *SSLv23_client_method(void);
++ const SSL_METHOD *TLSv1_2_method(void);
++ const SSL_METHOD *TLSv1_2_server_method(void);
++ const SSL_METHOD *TLSv1_2_client_method(void);
++ const SSL_METHOD *TLSv1_1_method(void);
++ const SSL_METHOD *TLSv1_1_server_method(void);
++ const SSL_METHOD *TLSv1_1_client_method(void);
++ const SSL_METHOD *TLSv1_method(void);
++ const SSL_METHOD *TLSv1_server_method(void);
++ const SSL_METHOD *TLSv1_client_method(void);
++ #ifndef OPENSSL_NO_SSL3_METHOD
++ const SSL_METHOD *SSLv3_method(void);
++ const SSL_METHOD *SSLv3_server_method(void);
++ const SSL_METHOD *SSLv3_client_method(void);
++ #endif
++ #ifndef OPENSSL_NO_SSL2
++ const SSL_METHOD *SSLv2_method(void);
++ const SSL_METHOD *SSLv2_server_method(void);
++ const SSL_METHOD *SSLv2_client_method(void);
++ #endif
++
++ const SSL_METHOD *DTLS_method(void);
++ const SSL_METHOD *DTLS_server_method(void);
++ const SSL_METHOD *DTLS_client_method(void);
++ const SSL_METHOD *DTLSv1_2_method(void);
++ const SSL_METHOD *DTLSv1_2_server_method(void);
++ const SSL_METHOD *DTLSv1_2_client_method(void);
++ const SSL_METHOD *DTLSv1_method(void);
++ const SSL_METHOD *DTLSv1_server_method(void);
++ const SSL_METHOD *DTLSv1_client_method(void);
+ 
+ =head1 DESCRIPTION
+ 
+@@ -23,65 +65,88 @@ client only type. B<method> can be of the following types:
+ 
+ =over 4
+ 
+-=item SSLv2_method(void), SSLv2_server_method(void), SSLv2_client_method(void)
++=item SSLv23_method(), SSLv23_server_method(), SSLv23_client_method()
++
++These are the general-purpose I<version-flexible> SSL/TLS methods.
++The actual protocol version used will be negotiated to the highest version
++mutually supported by the client and the server.
++The supported protocols are SSLv2, SSLv3, TLSv1, TLSv1.1 and TLSv1.2.
++Most applications should use these method, and avoid the version specific
++methods described below.
++
++The list of protocols available can be further limited using the
++B<SSL_OP_NO_SSLv2>, B<SSL_OP_NO_SSLv3>, B<SSL_OP_NO_TLSv1>,
++B<SSL_OP_NO_TLSv1_1> and B<SSL_OP_NO_TLSv1_2> options of the
++L<SSL_CTX_set_options(3)> or L<SSL_set_options(3)> functions.
++Clients should avoid creating "holes" in the set of protocols they support,
++when disabling a protocol, make sure that you also disable either all previous
++or all subsequent protocol versions.
++In clients, when a protocol version is disabled without disabling I<all>
++previous protocol versions, the effect is to also disable all subsequent
++protocol versions.
++
++The SSLv2 and SSLv3 protocols are deprecated and should generally not be used.
++Applications should typically use L<SSL_CTX_set_options(3)> in combination with
++the B<SSL_OP_NO_SSLv3> flag to disable negotiation of SSLv3 via the above
++I<version-flexible> SSL/TLS methods.
++The B<SSL_OP_NO_SSLv2> option is set by default, and would need to be cleared
++via L<SSL_CTX_clear_options(3)> in order to enable negotiation of SSLv2.
++
++=item TLSv1_2_method(), TLSv1_2_server_method(), TLSv1_2_client_method()
+ 
+-A TLS/SSL connection established with these methods will only understand
+-the SSLv2 protocol. A client will send out SSLv2 client hello messages
+-and will also indicate that it only understand SSLv2. A server will only
+-understand SSLv2 client hello messages.
++A TLS/SSL connection established with these methods will only understand the
++TLSv1.2 protocol.  A client will send out TLSv1.2 client hello messages and
++will also indicate that it only understand TLSv1.2.  A server will only
++understand TLSv1.2 client hello messages.
+ 
+-=item SSLv3_method(void), SSLv3_server_method(void), SSLv3_client_method(void)
++=item TLSv1_1_method(), TLSv1_1_server_method(), TLSv1_1_client_method()
+ 
+ A TLS/SSL connection established with these methods will only understand the
+-SSLv3 protocol. A client will send out SSLv3 client hello messages
+-and will indicate that it only understands SSLv3. A server will only understand
+-SSLv3 client hello messages. This especially means, that it will
+-not understand SSLv2 client hello messages which are widely used for
+-compatibility reasons, see SSLv23_*_method().
++TLSv1.1 protocol.  A client will send out TLSv1.1 client hello messages and
++will also indicate that it only understand TLSv1.1.  A server will only
++understand TLSv1.1 client hello messages.
+ 
+-=item TLSv1_method(void), TLSv1_server_method(void), TLSv1_client_method(void)
++=item TLSv1_method(), TLSv1_server_method(), TLSv1_client_method()
+ 
+ A TLS/SSL connection established with these methods will only understand the
+-TLSv1 protocol. A client will send out TLSv1 client hello messages
+-and will indicate that it only understands TLSv1. A server will only understand
+-TLSv1 client hello messages. This especially means, that it will
+-not understand SSLv2 client hello messages which are widely used for
+-compatibility reasons, see SSLv23_*_method(). It will also not understand
+-SSLv3 client hello messages.
+-
+-=item SSLv23_method(void), SSLv23_server_method(void), SSLv23_client_method(void)
+-
+-A TLS/SSL connection established with these methods may understand the SSLv2,
+-SSLv3, TLSv1, TLSv1.1 and TLSv1.2 protocols.
+-
+-If the cipher list does not contain any SSLv2 ciphersuites (the default
+-cipher list does not) or extensions are required (for example server name)
+-a client will send out TLSv1 client hello messages including extensions and
+-will indicate that it also understands TLSv1.1, TLSv1.2 and permits a
+-fallback to SSLv3. A server will support SSLv3, TLSv1, TLSv1.1 and TLSv1.2
+-protocols. This is the best choice when compatibility is a concern.
+-
+-If any SSLv2 ciphersuites are included in the cipher list and no extensions
+-are required then SSLv2 compatible client hellos will be used by clients and
+-SSLv2 will be accepted by servers. This is B<not> recommended due to the
+-insecurity of SSLv2 and the limited nature of the SSLv2 client hello
+-prohibiting the use of extensions.
++TLSv1 protocol.  A client will send out TLSv1 client hello messages and will
++indicate that it only understands TLSv1.  A server will only understand TLSv1
++client hello messages.
+ 
+-=back
++=item SSLv3_method(), SSLv3_server_method(), SSLv3_client_method()
++
++A TLS/SSL connection established with these methods will only understand the
++SSLv3 protocol.  A client will send out SSLv3 client hello messages and will
++indicate that it only understands SSLv3.  A server will only understand SSLv3
++client hello messages.  The SSLv3 protocol is deprecated and should not be
++used.
++
++=item SSLv2_method(), SSLv2_server_method(), SSLv2_client_method()
++
++A TLS/SSL connection established with these methods will only understand the
++SSLv2 protocol.  A client will send out SSLv2 client hello messages and will
++also indicate that it only understand SSLv2.  A server will only understand
++SSLv2 client hello messages.  The SSLv2 protocol offers little to no security
++and should not be used.
++As of OpenSSL 1.0.2g, EXPORT ciphers and 56-bit DES are no longer available
++with SSLv2.
+ 
+-The list of protocols available can later be limited using the SSL_OP_NO_SSLv2,
+-SSL_OP_NO_SSLv3, SSL_OP_NO_TLSv1, SSL_OP_NO_TLSv1_1 and SSL_OP_NO_TLSv1_2
+-options of the SSL_CTX_set_options() or SSL_set_options() functions.
+-Using these options it is possible to choose e.g. SSLv23_server_method() and
+-be able to negotiate with all possible clients, but to only allow newer
+-protocols like TLSv1, TLSv1.1 or TLS v1.2.
++=item DTLS_method(), DTLS_server_method(), DTLS_client_method()
+ 
+-Applications which never want to support SSLv2 (even is the cipher string
+-is configured to use SSLv2 ciphersuites) can set SSL_OP_NO_SSLv2.
++These are the version-flexible DTLS methods.
++
++=item DTLSv1_2_method(), DTLSv1_2_server_method(), DTLSv1_2_client_method()
++
++These are the version-specific methods for DTLSv1.2.
++
++=item DTLSv1_method(), DTLSv1_server_method(), DTLSv1_client_method()
++
++These are the version-specific methods for DTLSv1.
++
++=back
+ 
+-SSL_CTX_new() initializes the list of ciphers, the session cache setting,
+-the callbacks, the keys and certificates and the options to its default
+-values.
++SSL_CTX_new() initializes the list of ciphers, the session cache setting, the
++callbacks, the keys and certificates and the options to its default values.
+ 
+ =head1 RETURN VALUES
+ 
+@@ -91,8 +156,8 @@ The following return values can occur:
+ 
+ =item NULL
+ 
+-The creation of a new SSL_CTX object failed. Check the error stack to
+-find out the reason.
++The creation of a new SSL_CTX object failed. Check the error stack to find out
++the reason.
+ 
+ =item Pointer to an SSL_CTX object
+ 
+@@ -102,6 +167,7 @@ The return value points to an allocated SSL_CTX object.
+ 
+ =head1 SEE ALSO
+ 
++L<SSL_CTX_set_options(3)>, L<SSL_CTX_clear_options(3)>, L<SSL_set_options(3)>,
+ L<SSL_CTX_free(3)|SSL_CTX_free(3)>, L<SSL_accept(3)|SSL_accept(3)>,
+ L<ssl(3)|ssl(3)>,  L<SSL_set_connect_state(3)|SSL_set_connect_state(3)>
+ 
+diff --git a/doc/ssl/SSL_CTX_set_options.pod b/doc/ssl/SSL_CTX_set_options.pod
+index e80a72c..9a7e98c 100644
+--- a/doc/ssl/SSL_CTX_set_options.pod
++++ b/doc/ssl/SSL_CTX_set_options.pod
+@@ -189,15 +189,25 @@ browser has a cert, it will crash/hang.  Works for 3.x and 4.xbeta
+ =item SSL_OP_NO_SSLv2
+ 
+ Do not use the SSLv2 protocol.
++As of OpenSSL 1.0.2g the B<SSL_OP_NO_SSLv2> option is set by default.
+ 
+ =item SSL_OP_NO_SSLv3
+ 
+ Do not use the SSLv3 protocol.
++It is recommended that applications should set this option.
+ 
+ =item SSL_OP_NO_TLSv1
+ 
+ Do not use the TLSv1 protocol.
+ 
++=item SSL_OP_NO_TLSv1_1
++
++Do not use the TLSv1.1 protocol.
++
++=item SSL_OP_NO_TLSv1_2
++
++Do not use the TLSv1.2 protocol.
++
+ =item SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION
+ 
+ When performing renegotiation as a server, always start a new session
+diff --git a/doc/ssl/ssl.pod b/doc/ssl/ssl.pod
+index 242087e..70cca17 100644
+--- a/doc/ssl/ssl.pod
++++ b/doc/ssl/ssl.pod
+@@ -130,41 +130,86 @@ protocol methods defined in B<SSL_METHOD> structures.
+ 
+ =over 4
+ 
+-=item const SSL_METHOD *B<SSLv2_client_method>(void);
++=item const SSL_METHOD *B<SSLv23_method>(void);
+ 
+-Constructor for the SSLv2 SSL_METHOD structure for a dedicated client.
++Constructor for the I<version-flexible> SSL_METHOD structure for
++clients, servers or both.
++See L<SSL_CTX_new(3)> for details.
+ 
+-=item const SSL_METHOD *B<SSLv2_server_method>(void);
++=item const SSL_METHOD *B<SSLv23_client_method>(void);
+ 
+-Constructor for the SSLv2 SSL_METHOD structure for a dedicated server.
++Constructor for the I<version-flexible> SSL_METHOD structure for
++clients.
+ 
+-=item const SSL_METHOD *B<SSLv2_method>(void);
++=item const SSL_METHOD *B<SSLv23_client_method>(void);
+ 
+-Constructor for the SSLv2 SSL_METHOD structure for combined client and server.
++Constructor for the I<version-flexible> SSL_METHOD structure for
++servers.
+ 
+-=item const SSL_METHOD *B<SSLv3_client_method>(void);
++=item const SSL_METHOD *B<TLSv1_2_method>(void);
+ 
+-Constructor for the SSLv3 SSL_METHOD structure for a dedicated client.
++Constructor for the TLSv1.2 SSL_METHOD structure for clients, servers
++or both.
+ 
+-=item const SSL_METHOD *B<SSLv3_server_method>(void);
++=item const SSL_METHOD *B<TLSv1_2_client_method>(void);
+ 
+-Constructor for the SSLv3 SSL_METHOD structure for a dedicated server.
++Constructor for the TLSv1.2 SSL_METHOD structure for clients.
+ 
+-=item const SSL_METHOD *B<SSLv3_method>(void);
++=item const SSL_METHOD *B<TLSv1_2_server_method>(void);
++
++Constructor for the TLSv1.2 SSL_METHOD structure for servers.
++
++=item const SSL_METHOD *B<TLSv1_1_method>(void);
+ 
+-Constructor for the SSLv3 SSL_METHOD structure for combined client and server.
++Constructor for the TLSv1.1 SSL_METHOD structure for clients, servers
++or both.
++
++=item const SSL_METHOD *B<TLSv1_1_client_method>(void);
++
++Constructor for the TLSv1.1 SSL_METHOD structure for clients.
++
++=item const SSL_METHOD *B<TLSv1_1_server_method>(void);
++
++Constructor for the TLSv1.1 SSL_METHOD structure for servers.
++
++=item const SSL_METHOD *B<TLSv1_method>(void);
++
++Constructor for the TLSv1 SSL_METHOD structure for clients, servers
++or both.
+ 
+ =item const SSL_METHOD *B<TLSv1_client_method>(void);
+ 
+-Constructor for the TLSv1 SSL_METHOD structure for a dedicated client.
++Constructor for the TLSv1 SSL_METHOD structure for clients.
+ 
+ =item const SSL_METHOD *B<TLSv1_server_method>(void);
+ 
+-Constructor for the TLSv1 SSL_METHOD structure for a dedicated server.
++Constructor for the TLSv1 SSL_METHOD structure for servers.
+ 
+-=item const SSL_METHOD *B<TLSv1_method>(void);
++=item const SSL_METHOD *B<SSLv3_method>(void);
++
++Constructor for the SSLv3 SSL_METHOD structure for clients, servers
++or both.
++
++=item const SSL_METHOD *B<SSLv3_client_method>(void);
++
++Constructor for the SSLv3 SSL_METHOD structure for clients.
++
++=item const SSL_METHOD *B<SSLv3_server_method>(void);
++
++Constructor for the SSLv3 SSL_METHOD structure for servers.
++
++=item const SSL_METHOD *B<SSLv2_method>(void);
++
++Constructor for the SSLv2 SSL_METHOD structure for clients, servers
++or both.
++
++=item const SSL_METHOD *B<SSLv2_client_method>(void);
++
++Constructor for the SSLv2 SSL_METHOD structure for clients.
++
++=item const SSL_METHOD *B<SSLv2_server_method>(void);
+ 
+-Constructor for the TLSv1 SSL_METHOD structure for combined client and server.
++Constructor for the SSLv2 SSL_METHOD structure for servers.
+ 
+ =back
+ 
+-- 
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
new file mode 100644
index 0000000..d260244
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
@@ -0,0 +1,503 @@
+From bc38a7d2d3c6082163c50ddf99464736110f2000 Mon Sep 17 00:00:00 2001
+From: Viktor Dukhovni <openssl-users@dukhovni.org>
+Date: Fri, 19 Feb 2016 13:05:11 -0500
+Subject: [PATCH] Disable EXPORT and LOW SSLv3+ ciphers by default
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reviewed-by: Emilia Käsper <emilia@openssl.org>
+
+Upstream-Status: Backport
+
+https://git.openssl.org/?p=openssl.git;a=commit;h=bc38a7d2d3c6082163c50ddf99464736110f2000
+
+CVE: CVE-2016-0800 #3 patch
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ CHANGES              |  5 +++++
+ Configure            |  5 +++++
+ NEWS                 |  1 +
+ doc/apps/ciphers.pod | 30 ++++++++++++++++++++---------
+ ssl/s3_lib.c         | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 86 insertions(+), 9 deletions(-)
+
+Index: openssl-1.0.2d/Configure
+===================================================================
+--- openssl-1.0.2d.orig/Configure
++++ openssl-1.0.2d/Configure
+@@ -58,6 +58,10 @@ my $usage="Usage: Configure [no-<cipher>
+ #		library and will be loaded in run-time by the OpenSSL library.
+ # sctp          include SCTP support
+ # 386           generate 80386 code
++# enable-weak-ssl-ciphers
++#		Enable EXPORT and LOW SSLv3 ciphers that are disabled by
++#		default.  Note, weak SSLv2 ciphers are unconditionally
++#		disabled.
+ # no-sse2	disables IA-32 SSE2 code, above option implies no-sse2
+ # no-<cipher>   build without specified algorithm (rsa, idea, rc5, ...)
+ # -<xxx> +<xxx> compiler options are passed through 
+@@ -853,6 +857,7 @@ my %disabled = ( # "what"         => "co
+ 		 "ssl2"           => "default",
+ 		 "store"	  => "experimental",
+ 		 "unit-test"	  => "default",
++		 "weak-ssl-ciphers" => "default",
+ 		 "zlib"           => "default",
+ 		 "zlib-dynamic"   => "default"
+ 	       );
+Index: openssl-1.0.2d/doc/apps/ciphers.pod
+===================================================================
+--- openssl-1.0.2d.orig/doc/apps/ciphers.pod
++++ openssl-1.0.2d/doc/apps/ciphers.pod
+@@ -136,34 +136,46 @@ than 128 bits, and some cipher suites wi
+ 
+ =item B<LOW>
+ 
+-"low" encryption cipher suites, currently those using 64 or 56 bit encryption algorithms
+-but excluding export cipher suites.
++Low strength encryption cipher suites, currently those using 64 or 56 bit
++encryption algorithms but excluding export cipher suites.
++As of OpenSSL 1.0.2g, these are disabled in default builds.
+ 
+ =item B<EXP>, B<EXPORT>
+ 
+-export encryption algorithms. Including 40 and 56 bits algorithms.
++Export strength encryption algorithms. Including 40 and 56 bits algorithms.
++As of OpenSSL 1.0.2g, these are disabled in default builds.
+ 
+ =item B<EXPORT40>
+ 
+-40 bit export encryption algorithms
++40-bit export encryption algorithms
++As of OpenSSL 1.0.2g, these are disabled in default builds.
+ 
+ =item B<EXPORT56>
+ 
+-56 bit export encryption algorithms. In OpenSSL 0.9.8c and later the set of
++56-bit export encryption algorithms. In OpenSSL 0.9.8c and later the set of
+ 56 bit export ciphers is empty unless OpenSSL has been explicitly configured
+ with support for experimental ciphers.
++As of OpenSSL 1.0.2g, these are disabled in default builds.
+ 
+ =item B<eNULL>, B<NULL>
+ 
+-the "NULL" ciphers that is those offering no encryption. Because these offer no
+-encryption at all and are a security risk they are disabled unless explicitly
+-included.
++The "NULL" ciphers that is those offering no encryption. Because these offer no
++encryption at all and are a security risk they are not enabled via either the
++B<DEFAULT> or B<ALL> cipher strings.
++Be careful when building cipherlists out of lower-level primitives such as
++B<kRSA> or B<aECDSA> as these do overlap with the B<eNULL> ciphers.
++When in doubt, include B<!eNULL> in your cipherlist.
+ 
+ =item B<aNULL>
+ 
+-the cipher suites offering no authentication. This is currently the anonymous
++The cipher suites offering no authentication. This is currently the anonymous
+ DH algorithms and anonymous ECDH algorithms. These cipher suites are vulnerable
+ to a "man in the middle" attack and so their use is normally discouraged.
++These are excluded from the B<DEFAULT> ciphers, but included in the B<ALL>
++ciphers.
++Be careful when building cipherlists out of lower-level primitives such as
++B<kDHE> or B<AES> as these do overlap with the B<aNULL> ciphers.
++When in doubt, include B<!aNULL> in your cipherlist.
+ 
+ =item B<kRSA>, B<RSA>
+ 
+Index: openssl-1.0.2d/ssl/s3_lib.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/s3_lib.c
++++ openssl-1.0.2d/ssl/s3_lib.c
+@@ -198,6 +198,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 03 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_RSA_RC4_40_MD5,
+@@ -212,6 +213,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++#endif
+ 
+ /* Cipher 04 */
+     {
+@@ -246,6 +248,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 06 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_RSA_RC2_40_MD5,
+@@ -260,6 +263,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++#endif
+ 
+ /* Cipher 07 */
+ #ifndef OPENSSL_NO_IDEA
+@@ -280,6 +284,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+ #endif
+ 
+ /* Cipher 08 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_RSA_DES_40_CBC_SHA,
+@@ -294,8 +299,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++#endif
+ 
+ /* Cipher 09 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_RSA_DES_64_CBC_SHA,
+@@ -310,6 +317,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++#endif
+ 
+ /* Cipher 0A */
+     {
+@@ -329,6 +337,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+ 
+ /* The DH ciphers */
+ /* Cipher 0B */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      0,
+      SSL3_TXT_DH_DSS_DES_40_CBC_SHA,
+@@ -343,8 +352,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++#endif
+ 
+ /* Cipher 0C */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_DH_DSS_DES_64_CBC_SHA,
+@@ -359,6 +370,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++#endif
+ 
+ /* Cipher 0D */
+     {
+@@ -377,6 +389,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 0E */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      0,
+      SSL3_TXT_DH_RSA_DES_40_CBC_SHA,
+@@ -391,8 +404,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++#endif
+ 
+ /* Cipher 0F */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_DH_RSA_DES_64_CBC_SHA,
+@@ -407,6 +422,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++#endif
+ 
+ /* Cipher 10 */
+     {
+@@ -426,6 +442,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+ 
+ /* The Ephemeral DH ciphers */
+ /* Cipher 11 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_EDH_DSS_DES_40_CBC_SHA,
+@@ -440,8 +457,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++#endif
+ 
+ /* Cipher 12 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_EDH_DSS_DES_64_CBC_SHA,
+@@ -456,6 +475,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++#endif
+ 
+ /* Cipher 13 */
+     {
+@@ -474,6 +494,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 14 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_EDH_RSA_DES_40_CBC_SHA,
+@@ -488,8 +509,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++#endif
+ 
+ /* Cipher 15 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_EDH_RSA_DES_64_CBC_SHA,
+@@ -504,6 +527,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++#endif
+ 
+ /* Cipher 16 */
+     {
+@@ -522,6 +546,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 17 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_ADH_RC4_40_MD5,
+@@ -536,6 +561,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++#endif
+ 
+ /* Cipher 18 */
+     {
+@@ -554,6 +580,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 19 */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_ADH_DES_40_CBC_SHA,
+@@ -568,8 +595,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++#endif
+ 
+ /* Cipher 1A */
++#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_ADH_DES_64_CBC_SHA,
+@@ -584,6 +613,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++#endif
+ 
+ /* Cipher 1B */
+     {
+@@ -655,6 +685,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+ #ifndef OPENSSL_NO_KRB5
+ /* The Kerberos ciphers*/
+ /* Cipher 1E */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_DES_64_CBC_SHA,
+@@ -669,6 +700,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++# endif
+ 
+ /* Cipher 1F */
+     {
+@@ -719,6 +751,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 22 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_DES_64_CBC_MD5,
+@@ -733,6 +766,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++# endif
+ 
+ /* Cipher 23 */
+     {
+@@ -783,6 +817,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      },
+ 
+ /* Cipher 26 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_DES_40_CBC_SHA,
+@@ -797,8 +832,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++# endif
+ 
+ /* Cipher 27 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_RC2_40_CBC_SHA,
+@@ -813,8 +850,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++# endif
+ 
+ /* Cipher 28 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_RC4_40_SHA,
+@@ -829,8 +868,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++# endif
+ 
+ /* Cipher 29 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_DES_40_CBC_MD5,
+@@ -845,8 +886,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      56,
+      },
++# endif
+ 
+ /* Cipher 2A */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_RC2_40_CBC_MD5,
+@@ -861,8 +904,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++# endif
+ 
+ /* Cipher 2B */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      SSL3_TXT_KRB5_RC4_40_MD5,
+@@ -877,6 +922,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      40,
+      128,
+      },
++# endif
+ #endif                          /* OPENSSL_NO_KRB5 */
+ 
+ /* New AES ciphersuites */
+@@ -1300,6 +1346,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+ # endif
+ 
+     /* Cipher 62 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      TLS1_TXT_RSA_EXPORT1024_WITH_DES_CBC_SHA,
+@@ -1314,8 +1361,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++# endif
+ 
+     /* Cipher 63 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      TLS1_TXT_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA,
+@@ -1330,8 +1379,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      56,
+      },
++# endif
+ 
+     /* Cipher 64 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      TLS1_TXT_RSA_EXPORT1024_WITH_RC4_56_SHA,
+@@ -1346,8 +1397,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      128,
+      },
++# endif
+ 
+     /* Cipher 65 */
++# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
+     {
+      1,
+      TLS1_TXT_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA,
+@@ -1362,6 +1415,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
+      56,
+      128,
+      },
++# endif
+ 
+     /* Cipher 66 */
+     {
+Index: openssl-1.0.2d/CHANGES
+===================================================================
+--- openssl-1.0.2d.orig/CHANGES
++++ openssl-1.0.2d/CHANGES
+@@ -2,7 +2,11 @@
+  OpenSSL CHANGES
+  _______________
+ 
+- 
++  * Disable weak ciphers in SSLv3 and up in default builds of OpenSSL.
++    Builds that are not configured with "enable-weak-ssl-ciphers" will not
++    provide any "EXPORT" or "LOW" strength ciphers.
++    [Viktor Dukhovni]
++
+   * Disable SSLv2 default build, default negotiation and weak ciphers.  SSLv2
+     is by default disabled at build-time.  Builds that are not configured with
+     "enable-ssl2" will not support SSLv2.  Even if "enable-ssl2" is used,
+Index: openssl-1.0.2d/NEWS
+===================================================================
+--- openssl-1.0.2d.orig/NEWS
++++ openssl-1.0.2d/NEWS
+@@ -1,6 +1,7 @@
+ 
+   NEWS
+   ====
++  Disable weak ciphers in SSLv3 and up in default builds of OpenSSL.
+   Disable SSLv2 default build, default negotiation and weak ciphers.
+ 
+   This file gives a brief overview of the major changes between each OpenSSL
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 8defa5b..f900bf6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -44,6 +44,9 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2015-3197.patch \
             file://CVE-2016-0701_1.patch \
             file://CVE-2016-0701_2.patch \
+            file://CVE-2016-0800.patch \
+            file://CVE-2016-0800_2.patch \
+            file://CVE-2016-0800_3.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


