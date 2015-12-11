Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8AB60616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 07:23:08 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 0ea0_3928_f09d7d51_0bb4_470a_b040_8f26af236022;
	Fri, 11 Dec 2015 16:23:05 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 94E09AC03C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:23:04 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A0BE946E450 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:23:03 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt38.g01.fujitsu.local (10.128.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 11 Dec 2015 16:23:01 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Dec 2015 16:24:08 +0900
Message-ID: <1449818648-29055-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
References: <CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH v2][jethro] openssl: fix for CVE-2015-1794
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
X-List-Received-Date: Fri, 11 Dec 2015 07:23:13 -0000
Content-Type: text/plain

This patch was imported from
https://git.openssl.org/?p=openssl.git;a=commit;h=ada57746b6b80beae73111fe1291bf8dd89af91c

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../Fix-seg-fault-with-0-p-val-in-SKE.patch        | 103 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-with-0-p-val-in-SKE.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-with-0-p-val-in-SKE.patch b/meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-with-0-p-val-in-SKE.patch
new file mode 100644
index 0000000..e6715e5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-with-0-p-val-in-SKE.patch
@@ -0,0 +1,103 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From ada57746b6b80beae73111fe1291bf8dd89af91c Mon Sep 17 00:00:00 2001
+From: Guy Leaver (guleaver) <guleaver@cisco.com>
+Date: Fri, 7 Aug 2015 15:45:21 +0100
+Subject: [PATCH] Fix seg fault with 0 p val in SKE
+
+If a client receives a ServerKeyExchange for an anon DH ciphersuite with the
+value of p set to 0 then a seg fault can occur. This commits adds a test to
+reject p, g and pub key parameters that have a 0 value (in accordance with
+RFC 5246)
+
+The security vulnerability only affects master and 1.0.2, but the fix is
+additionally applied to 1.0.1 for additional confidence.
+
+CVE-2015-1794
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+---
+ ssl/s3_clnt.c |   16 ++++++++++++++++
+ ssl/ssl.h     |    3 +++
+ ssl/ssl_err.c |    3 +++
+ 3 files changed, 22 insertions(+), 0 deletions(-)
+
+diff --git a/ssl/s3_clnt.c b/ssl/s3_clnt.c
+index 6af145a..2059151 100644
+--- a/ssl/s3_clnt.c
++++ b/ssl/s3_clnt.c
+@@ -1699,6 +1699,12 @@ int ssl3_get_key_exchange(SSL *s)
+         }
+         p += i;
+ 
++        if (BN_is_zero(dh->p)) {
++            SSLerr(SSL_F_SSL3_GET_KEY_EXCHANGE, SSL_R_BAD_DH_P_VALUE);
++            goto f_err;
++        }
++
++
+         if (2 > n - param_len) {
+             SSLerr(SSL_F_SSL3_GET_KEY_EXCHANGE, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+@@ -1719,6 +1725,11 @@ int ssl3_get_key_exchange(SSL *s)
+         }
+         p += i;
+ 
++        if (BN_is_zero(dh->g)) {
++            SSLerr(SSL_F_SSL3_GET_KEY_EXCHANGE, SSL_R_BAD_DH_G_VALUE);
++            goto f_err;
++        }
++
+         if (2 > n - param_len) {
+             SSLerr(SSL_F_SSL3_GET_KEY_EXCHANGE, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+@@ -1740,6 +1751,11 @@ int ssl3_get_key_exchange(SSL *s)
+         p += i;
+         n -= param_len;
+ 
++        if (BN_is_zero(dh->pub_key)) {
++            SSLerr(SSL_F_SSL3_GET_KEY_EXCHANGE, SSL_R_BAD_DH_PUB_KEY_VALUE);
++            goto f_err;
++        }
++
+ # ifndef OPENSSL_NO_RSA
+         if (alg_a & SSL_aRSA)
+             pkey =
+diff --git a/ssl/ssl.h b/ssl/ssl.h
+index 6fe1a24..c6c5bce 100644
+--- a/ssl/ssl.h
++++ b/ssl/ssl.h
+@@ -2846,8 +2846,11 @@ void ERR_load_SSL_strings(void);
+ # define SSL_R_BAD_DATA_RETURNED_BY_CALLBACK              106
+ # define SSL_R_BAD_DECOMPRESSION                          107
+ # define SSL_R_BAD_DH_G_LENGTH                            108
++# define SSL_R_BAD_DH_G_VALUE                             375
+ # define SSL_R_BAD_DH_PUB_KEY_LENGTH                      109
++# define SSL_R_BAD_DH_PUB_KEY_VALUE                       393
+ # define SSL_R_BAD_DH_P_LENGTH                            110
++# define SSL_R_BAD_DH_P_VALUE                             395
+ # define SSL_R_BAD_DIGEST_LENGTH                          111
+ # define SSL_R_BAD_DSA_SIGNATURE                          112
+ # define SSL_R_BAD_ECC_CERT                               304
+diff --git a/ssl/ssl_err.c b/ssl/ssl_err.c
+index 1a6030e..202228b 100644
+--- a/ssl/ssl_err.c
++++ b/ssl/ssl_err.c
+@@ -386,8 +386,11 @@ static ERR_STRING_DATA SSL_str_reasons[] = {
+      "bad data returned by callback"},
+     {ERR_REASON(SSL_R_BAD_DECOMPRESSION), "bad decompression"},
+     {ERR_REASON(SSL_R_BAD_DH_G_LENGTH), "bad dh g length"},
++    {ERR_REASON(SSL_R_BAD_DH_G_VALUE), "bad dh g value"},
+     {ERR_REASON(SSL_R_BAD_DH_PUB_KEY_LENGTH), "bad dh pub key length"},
++    {ERR_REASON(SSL_R_BAD_DH_PUB_KEY_VALUE), "bad dh pub key value"},
+     {ERR_REASON(SSL_R_BAD_DH_P_LENGTH), "bad dh p length"},
++    {ERR_REASON(SSL_R_BAD_DH_P_VALUE), "bad dh p value"},
+     {ERR_REASON(SSL_R_BAD_DIGEST_LENGTH), "bad digest length"},
+     {ERR_REASON(SSL_R_BAD_DSA_SIGNATURE), "bad dsa signature"},
+     {ERR_REASON(SSL_R_BAD_ECC_CERT), "bad ecc cert"},
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 249f8c4..c5a2a65 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
+            file://Fix-seg-fault-with-0-p-val-in-SKE.patch  \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
1.8.4.2


