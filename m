Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6EB96067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 23:04:18 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so8401391pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=21uxGri3dConE6fUNOsorfogo49KEqmAIJGjGKaqHkQ=;
	b=lHG1jZbKqOofncbllk3QbsHmNJN6yFxN7w6jVB7iD48waj3aJPZmMbNBifGV+dXTAj
	2nNkNFnPOhw20b34rGYZyhhz1N6J7/+jPJvG91b2bi6GdLrUAUGTcunY4W7mMNtnp4dx
	r6PD6ypT467dfDRO3VYoYD1J606sqlngt19SwOo5bErKR2kR3T2wvvYATwLOFh8+J8Ep
	kCTtFMfc0EmXDBkMHxviMY9ulfPUXUOGaXVHUluRneGkptv73MrkLY1ifgJb/UA8gwzw
	4XjLrTxgcGFqSdBXj53v6MJl/SHwyeKSKWu1IqtQjHK1bzTCQKs8zvrQ0vTudV841e+Y
	g1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=21uxGri3dConE6fUNOsorfogo49KEqmAIJGjGKaqHkQ=;
	b=NHIcmsR6u3k06VLmyOXZW3ntO5/2tUr2Q6jHH0chwvIZ/3GekwZEnNvmK88Hidvxa3
	70hMhzzOkYvkC0Euy60BTJr2Jr34NobxNvxOEC3DddXk/OMHYnqz+E565HyWEus3rdRp
	YazH/dkVVdToc90ru2Ur9QVm1ah0pf+USzvdLQZrAd2MYiadn1bpnGCbPQGiM4M0ahmD
	i6cJGDLxie8SAE+uCsPvLXPXMrLIht5qp3iqdWdWreQi+37Vi0Qa1rhjoHLaq2KUmHQ1
	+z4TJAvrkq5HPZwVvz5mrvYnA7Qi668mAg+xsutTQyrlSb4jaVVaNBjLcsWgmCBkYfrV
	JLxw==
X-Gm-Message-State: ALyK8tIknUiibZoAvYEQovBU1gQk4rVz4eKkxX/xpm3p9G9420gyCknaMcZ58I9iaCtVzg==
X-Received: by 10.67.3.164 with SMTP id bx4mr44261837pad.9.1468710258735;
	Sat, 16 Jul 2016 16:04:18 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 84sm2346368pfp.59.2016.07.16.16.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 16:04:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 16 Jul 2016 16:04:11 -0700
Message-Id: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][PATCH] 1/5] openssl: Security fix CVE-2016-2177
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
X-List-Received-Date: Sat, 16 Jul 2016 23:04:19 -0000

From: Armin Kuster <akuster@mvista.com>

Affects openssl <= 1.0.2h
CVSS v2 Base Score: 7.5 HIGH

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/openssl/CVE-2016-2177.patch            | 286 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
new file mode 100644
index 0000000..df36d5f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
@@ -0,0 +1,286 @@
+From a004e72b95835136d3f1ea90517f706c24c03da7 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Thu, 5 May 2016 11:10:26 +0100
+Subject: [PATCH] Avoid some undefined pointer arithmetic
+
+A common idiom in the codebase is:
+
+if (p + len > limit)
+{
+    return; /* Too long */
+}
+
+Where "p" points to some malloc'd data of SIZE bytes and
+limit == p + SIZE
+
+"len" here could be from some externally supplied data (e.g. from a TLS
+message).
+
+The rules of C pointer arithmetic are such that "p + len" is only well
+defined where len <= SIZE. Therefore the above idiom is actually
+undefined behaviour.
+
+For example this could cause problems if some malloc implementation
+provides an address for "p" such that "p + len" actually overflows for
+values of len that are too big and therefore p + len < limit!
+
+Issue reported by Guido Vranken.
+
+CVE-2016-2177
+
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+
+Upstream-Status: Backport
+CVE: CVE-2016-2177
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+---
+ ssl/s3_srvr.c  | 14 +++++++-------
+ ssl/ssl_sess.c |  2 +-
+ ssl/t1_lib.c   | 56 ++++++++++++++++++++++++++++++--------------------------
+ 3 files changed, 38 insertions(+), 34 deletions(-)
+
+diff --git a/ssl/s3_srvr.c b/ssl/s3_srvr.c
+index ab28702..ab7f690 100644
+--- a/ssl/s3_srvr.c
++++ b/ssl/s3_srvr.c
+@@ -980,7 +980,7 @@ int ssl3_get_client_hello(SSL *s)
+ 
+         session_length = *(p + SSL3_RANDOM_SIZE);
+ 
+-        if (p + SSL3_RANDOM_SIZE + session_length + 1 >= d + n) {
++        if (SSL3_RANDOM_SIZE + session_length + 1 >= (d + n) - p) {
+             al = SSL_AD_DECODE_ERROR;
+             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+@@ -998,7 +998,7 @@ int ssl3_get_client_hello(SSL *s)
+     /* get the session-id */
+     j = *(p++);
+ 
+-    if (p + j > d + n) {
++    if ((d + n) - p < j) {
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+         goto f_err;
+@@ -1054,14 +1054,14 @@ int ssl3_get_client_hello(SSL *s)
+ 
+     if (SSL_IS_DTLS(s)) {
+         /* cookie stuff */
+-        if (p + 1 > d + n) {
++        if ((d + n) - p < 1) {
+             al = SSL_AD_DECODE_ERROR;
+             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+         }
+         cookie_len = *(p++);
+ 
+-        if (p + cookie_len > d + n) {
++        if ((d + n ) - p < cookie_len) {
+             al = SSL_AD_DECODE_ERROR;
+             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+@@ -1131,7 +1131,7 @@ int ssl3_get_client_hello(SSL *s)
+         }
+     }
+ 
+-    if (p + 2 > d + n) {
++    if ((d + n ) - p < 2) {
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+         goto f_err;
+@@ -1145,7 +1145,7 @@ int ssl3_get_client_hello(SSL *s)
+     }
+ 
+     /* i bytes of cipher data + 1 byte for compression length later */
+-    if ((p + i + 1) > (d + n)) {
++    if ((d + n) - p < i + 1) {
+         /* not enough data */
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
+@@ -1211,7 +1211,7 @@ int ssl3_get_client_hello(SSL *s)
+ 
+     /* compression */
+     i = *(p++);
+-    if ((p + i) > (d + n)) {
++    if ((d + n) - p < i) {
+         /* not enough data */
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
+diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
+index b182998..54ee783 100644
+--- a/ssl/ssl_sess.c
++++ b/ssl/ssl_sess.c
+@@ -573,7 +573,7 @@ int ssl_get_prev_session(SSL *s, unsigned char *session_id, int len,
+     int r;
+ #endif
+ 
+-    if (session_id + len > limit) {
++    if (limit - session_id < len) {
+         fatal = 1;
+         goto err;
+     }
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index fb64607..cdac011 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -1867,11 +1867,11 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+         0x02, 0x03,             /* SHA-1/ECDSA */
+     };
+ 
+-    if (data >= (limit - 2))
++    if (limit - data <= 2)
+         return;
+     data += 2;
+ 
+-    if (data > (limit - 4))
++    if (limit - data < 4)
+         return;
+     n2s(data, type);
+     n2s(data, size);
+@@ -1879,7 +1879,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+     if (type != TLSEXT_TYPE_server_name)
+         return;
+ 
+-    if (data + size > limit)
++    if (limit - data < size)
+         return;
+     data += size;
+ 
+@@ -1887,7 +1887,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+         const size_t len1 = sizeof(kSafariExtensionsBlock);
+         const size_t len2 = sizeof(kSafariTLS12ExtensionsBlock);
+ 
+-        if (data + len1 + len2 != limit)
++        if (limit - data != (int)(len1 + len2))
+             return;
+         if (memcmp(data, kSafariExtensionsBlock, len1) != 0)
+             return;
+@@ -1896,7 +1896,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+     } else {
+         const size_t len = sizeof(kSafariExtensionsBlock);
+ 
+-        if (data + len != limit)
++        if (limit - data != (int)(len))
+             return;
+         if (memcmp(data, kSafariExtensionsBlock, len) != 0)
+             return;
+@@ -2053,19 +2053,19 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
+     if (data == limit)
+         goto ri_check;
+ 
+-    if (data > (limit - 2))
++    if (limit - data < 2)
+         goto err;
+ 
+     n2s(data, len);
+ 
+-    if (data + len != limit)
++    if (limit - data != len)
+         goto err;
+ 
+-    while (data <= (limit - 4)) {
++    while (limit - data >= 4) {
+         n2s(data, type);
+         n2s(data, size);
+ 
+-        if (data + size > (limit))
++        if (limit - data < size)
+             goto err;
+ # if 0
+         fprintf(stderr, "Received extension type %d size %d\n", type, size);
+@@ -2472,18 +2472,18 @@ static int ssl_scan_clienthello_custom_tlsext(SSL *s,
+     if (s->hit || s->cert->srv_ext.meths_count == 0)
+         return 1;
+ 
+-    if (data >= limit - 2)
++    if (limit - data <= 2)
+         return 1;
+     n2s(data, len);
+ 
+-    if (data > limit - len)
++    if (limit - data < len)
+         return 1;
+ 
+-    while (data <= limit - 4) {
++    while (limit - data >= 4) {
+         n2s(data, type);
+         n2s(data, size);
+ 
+-        if (data + size > limit)
++        if (limit - data < size)
+             return 1;
+         if (custom_ext_parse(s, 1 /* server */ , type, data, size, al) <= 0)
+             return 0;
+@@ -2569,20 +2569,20 @@ static int ssl_scan_serverhello_tlsext(SSL *s, unsigned char **p,
+                              SSL_TLSEXT_HB_DONT_SEND_REQUESTS);
+ # endif
+ 
+-    if (data >= (d + n - 2))
++    if ((d + n) - data <= 2)
+         goto ri_check;
+ 
+     n2s(data, length);
+-    if (data + length != d + n) {
++    if ((d + n) - data != length) {
+         *al = SSL_AD_DECODE_ERROR;
+         return 0;
+     }
+ 
+-    while (data <= (d + n - 4)) {
++    while ((d + n) - data >= 4) {
+         n2s(data, type);
+         n2s(data, size);
+ 
+-        if (data + size > (d + n))
++        if ((d + n) - data < size)
+             goto ri_check;
+ 
+         if (s->tlsext_debug_cb)
+@@ -3307,29 +3307,33 @@ int tls1_process_ticket(SSL *s, unsigned char *session_id, int len,
+     /* Skip past DTLS cookie */
+     if (SSL_IS_DTLS(s)) {
+         i = *(p++);
+-        p += i;
+-        if (p >= limit)
++
++        if (limit - p <= i)
+             return -1;
++
++        p += i;
+     }
+     /* Skip past cipher list */
+     n2s(p, i);
+-    p += i;
+-    if (p >= limit)
++    if (limit - p <= i)
+         return -1;
++    p += i;
++
+     /* Skip past compression algorithm list */
+     i = *(p++);
+-    p += i;
+-    if (p > limit)
++    if (limit - p < i)
+         return -1;
++    p += i;
++
+     /* Now at start of extensions */
+-    if ((p + 2) >= limit)
++    if (limit - p <= 2)
+         return 0;
+     n2s(p, i);
+-    while ((p + 4) <= limit) {
++    while (limit - p >= 4) {
+         unsigned short type, size;
+         n2s(p, type);
+         n2s(p, size);
+-        if (p + size > limit)
++        if (limit - p < size)
+             return 0;
+         if (type == TLSEXT_TYPE_session_ticket) {
+             int r;
+-- 
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index 699fe62..e7d1106 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://ptest_makefile_deps.patch  \
             file://configure-musl-target.patch \
             file://parallel.patch \
+            file://CVE-2016-2177.patch \
            "
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
 SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
-- 
2.3.5


