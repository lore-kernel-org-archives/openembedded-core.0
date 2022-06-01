Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Riyaz Ahmed Khan" <rak3033@gmail.com>
Subject: [OE-core][dunfell][PATCH v2] curl: Add fix for CVE-2022-27781 CVE-2022-27782
Date: Wed,  1 Jun 2022 14:11:18 +0530
Message-Id: <20220601084118.26285-1-rak3033@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org, rak3033@gmail.com, Riyaz.Khan@kpit.com
Cc: Ranjitsinh.Rathod@kpit.com

From: Riyaz Khan <Riyaz.Khan@kpit.com>

Add patches for CVE issues: CVE-2022-27781 CVE-2022-27782

CVE-2022-27781
Link: [https://github.com/curl/curl/commit/5c7da89d404bf59c8dd82a001119a16d18365917]

CVE-2022-27782
Link: [https://github.com/curl/curl/commit/1645e9b44505abd5cbaf65da5282c3f33b5924a5]

Change-Id: I6ebe14ff8caf809f8332bb785b159090f5046896
Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
---
 .../curl/curl/CVE-2022-27781.patch            | 50 +++++++++++++
 .../curl/curl/CVE-2022-27782.patch            | 75 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  2 +
 3 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-27781.patch b/meta/recipes-support/curl/curl/CVE-2022-27781.patch
new file mode 100644
index 0000000000..83cdd1290f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27781.patch
@@ -0,0 +1,50 @@
+From 5c7da89d404bf59c8dd82a001119a16d18365917 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 May 2022 10:07:15 +0200
+Subject: [PATCH] nss: return error if seemingly stuck in a cert loop
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2022-27781
+
+Reported-by: Florian Kohnhäuser
+Bug: https://curl.se/docs/CVE-2022-27781.html
+Closes #8822
+
+CVE: CVE-2022-27781
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5c7da89d404bf59c8dd82a001119a16d18365917]
+
+Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
+
+---
+ lib/vtls/nss.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index 5b7de9f81895..569c0628feb5 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -983,6 +983,9 @@ static void display_cert_info(struct Curl_easy *data,
+   PR_Free(common_name);
+ }
+ 
++/* A number of certs that will never occur in a real server handshake */
++#define TOO_MANY_CERTS 300
++
+ static CURLcode display_conn_info(struct Curl_easy *data, PRFileDesc *sock)
+ {
+   CURLcode result = CURLE_OK;
+@@ -1018,6 +1021,11 @@ static CURLcode display_conn_info(struct Curl_easy *data, PRFileDesc *sock)
+         cert2 = CERT_FindCertIssuer(cert, now, certUsageSSLCA);
+         while(cert2) {
+           i++;
++          if(i >= TOO_MANY_CERTS) {
++            CERT_DestroyCertificate(cert2);
++            failf(data, "certificate loop");
++            return CURLE_SSL_CERTPROBLEM;
++          }
+           if(cert2->isRoot) {
+             CERT_DestroyCertificate(cert2);
+             break;
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27782.patch b/meta/recipes-support/curl/curl/CVE-2022-27782.patch
new file mode 100644
index 0000000000..a88aabe517
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27782.patch
@@ -0,0 +1,75 @@
+From 1645e9b44505abd5cbaf65da5282c3f33b5924a5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 May 2022 23:13:53 +0200
+Subject: [PATCH] url: check SSH config match on connection reuse
+
+CVE-2022-27782
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2022-27782.html
+Closes #8825
+
+CVE: CVE-2022-27782
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1645e9b44505abd5cbaf65da5282c3f33b5924a5]
+
+Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
+
+---
+ lib/url.c      | 11 +++++++++++
+ lib/vssh/ssh.h |  6 +++---
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index cf14a333ac69..6b31d4b1315d 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1100,6 +1100,12 @@ static void prune_dead_connections(struct Curl_easy *data)
+   }
+ }
+ 
++static bool ssh_config_matches(struct connectdata *one,
++                               struct connectdata *two)
++{
++  return (Curl_safecmp(one->proto.sshc.rsa, two->proto.sshc.rsa) &&
++          Curl_safecmp(one->proto.sshc.rsa_pub, two->proto.sshc.rsa_pub));
++}
+ /*
+  * Given one filled in connection struct (named needle), this function should
+  * detect if there already is one that has all the significant details
+@@ -1356,6 +1362,11 @@ ConnectionExists(struct Curl_easy *data,
+          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
+         continue;
+ 
++      if(get_protocol_family(needle->handler) == PROTO_FAMILY_SSH) {
++        if(!ssh_config_matches(needle, check))
++          continue;
++      }
++
+       if((needle->handler->flags&PROTOPT_SSL)
+ #ifndef CURL_DISABLE_PROXY
+          || !needle->bits.httpproxy || needle->bits.tunnel_proxy
+diff --git a/lib/vssh/ssh.h b/lib/vssh/ssh.h
+index 7972081ec610..30d82e57648e 100644
+--- a/lib/vssh/ssh.h
++++ b/lib/vssh/ssh.h
+@@ -7,7 +7,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2021, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -131,8 +131,8 @@ struct ssh_conn {
+ 
+   /* common */
+   const char *passphrase;     /* pass-phrase to use */
+-  char *rsa_pub;              /* path name */
+-  char *rsa;                  /* path name */
++  char *rsa_pub;              /* strdup'ed public key file */
++  char *rsa;                  /* strdup'ed private key file */
+   bool authed;                /* the connection has been authenticated fine */
+   bool acceptfail;            /* used by the SFTP_QUOTE (continue if
+                                  quote command fails) */
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index e850376ff8..602caf97ab 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -28,6 +28,8 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-27776.patch \
            file://CVE-2022-27775.patch \
            file://CVE-2022-22576.patch \
+           file://CVE-2022-27781.patch \
+           file://CVE-2022-27782.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.17.1

