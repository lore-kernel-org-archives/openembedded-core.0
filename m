Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 11C14713BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:40:37 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 16 Oct 2014 13:40:36 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id D0E4328FA68;
	Thu, 16 Oct 2014 13:40:36 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 13:40:35 +0200
Message-ID: <1413459635-23796-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] OpenSSL: Fix no-ssl3 configuration option, CVE-2014-3568
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
X-List-Received-Date: Thu, 16 Oct 2014 11:40:41 -0000
Content-Type: text/plain

References:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3568
https://www.openssl.org/news/secadv_20141015.txt

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../openssl/openssl/openssl-CVE-2014-3568.patch    | 101 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3568.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3568.patch b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3568.patch
new file mode 100644
index 0000000..6081d44
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3568.patch
@@ -0,0 +1,101 @@
+From 26a59d9b46574e457870197dffa802871b4c8fc7 Mon Sep 17 00:00:00 2001
+From: Geoff Thorpe <geoff@openssl.org>
+Date: Wed, 15 Oct 2014 03:25:50 -0400
+Subject: [PATCH] Fix no-ssl3 configuration option
+
+CVE-2014-3568
+
+Upstream-Status: Backport
+
+Reviewed-by: Emilia Kasper <emilia@openssl.org>
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ ssl/s23_clnt.c |  9 +++++++--
+ ssl/s23_srvr.c | 18 +++++++++---------
+ 2 files changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/ssl/s23_clnt.c b/ssl/s23_clnt.c
+index d4e43c3..86ab3de 100644
+--- a/ssl/s23_clnt.c
++++ b/ssl/s23_clnt.c
+@@ -125,9 +125,11 @@ static const SSL_METHOD *ssl23_get_client_method(int ver)
+ 	if (ver == SSL2_VERSION)
+ 		return(SSLv2_client_method());
+ #endif
++#ifndef OPENSSL_NO_SSL3
+ 	if (ver == SSL3_VERSION)
+ 		return(SSLv3_client_method());
+-	else if (ver == TLS1_VERSION)
++#endif
++	if (ver == TLS1_VERSION)
+ 		return(TLSv1_client_method());
+ 	else if (ver == TLS1_1_VERSION)
+ 		return(TLSv1_1_client_method());
+@@ -698,6 +700,7 @@ static int ssl23_get_server_hello(SSL *s)
+ 		{
+ 		/* we have sslv3 or tls1 (server hello or alert) */
+ 
++#ifndef OPENSSL_NO_SSL3
+ 		if ((p[2] == SSL3_VERSION_MINOR) &&
+ 			!(s->options & SSL_OP_NO_SSLv3))
+ 			{
+@@ -712,7 +715,9 @@ static int ssl23_get_server_hello(SSL *s)
+ 			s->version=SSL3_VERSION;
+ 			s->method=SSLv3_client_method();
+ 			}
+-		else if ((p[2] == TLS1_VERSION_MINOR) &&
++		else
++#endif
++		if ((p[2] == TLS1_VERSION_MINOR) &&
+ 			!(s->options & SSL_OP_NO_TLSv1))
+ 			{
+ 			s->version=TLS1_VERSION;
+diff --git a/ssl/s23_srvr.c b/ssl/s23_srvr.c
+index 567a6b1..93ca7d5 100644
+--- a/ssl/s23_srvr.c
++++ b/ssl/s23_srvr.c
+@@ -127,9 +127,11 @@ static const SSL_METHOD *ssl23_get_server_method(int ver)
+ 	if (ver == SSL2_VERSION)
+ 		return(SSLv2_server_method());
+ #endif
++#ifndef OPENSSL_NO_SSL3
+ 	if (ver == SSL3_VERSION)
+ 		return(SSLv3_server_method());
+-	else if (ver == TLS1_VERSION)
++#endif
++	if (ver == TLS1_VERSION)
+ 		return(TLSv1_server_method());
+ 	else if (ver == TLS1_1_VERSION)
+ 		return(TLSv1_1_server_method());
+@@ -600,6 +602,12 @@ int ssl23_get_client_hello(SSL *s)
+ 	if ((type == 2) || (type == 3))
+ 		{
+ 		/* we have SSLv3/TLSv1 (type 2: SSL2 style, type 3: SSL3/TLS style) */
++                s->method = ssl23_get_server_method(s->version);
++		if (s->method == NULL)
++			{
++			SSLerr(SSL_F_SSL23_GET_CLIENT_HELLO,SSL_R_UNSUPPORTED_PROTOCOL);
++			goto err;
++			}
+ 
+ 		if (!ssl_init_wbio_buffer(s,1)) goto err;
+ 
+@@ -627,14 +635,6 @@ int ssl23_get_client_hello(SSL *s)
+ 			s->s3->rbuf.left=0;
+ 			s->s3->rbuf.offset=0;
+ 			}
+-		if (s->version == TLS1_2_VERSION)
+-			s->method = TLSv1_2_server_method();
+-		else if (s->version == TLS1_1_VERSION)
+-			s->method = TLSv1_1_server_method();
+-		else if (s->version == TLS1_VERSION)
+-			s->method = TLSv1_server_method();
+-		else
+-			s->method = SSLv3_server_method();
+ #if 0 /* ssl3_get_client_hello does this */
+ 		s->client_version=(v[0]<<8)|v[1];
+ #endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index 1cbee92..b48c34f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -43,6 +43,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-CVE-2014-3566.patch \
             file://openssl-CVE-2014-3513.patch \
             file://openssl-CVE-2014-3567.patch \
+            file://openssl-CVE-2014-3568.patch \
            "
 
 SRC_URI[md5sum] = "de62b43dfcd858e66a74bee1c834e959"
-- 
1.9.1


