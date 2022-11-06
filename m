Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14CEC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 21:53:46 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.3429.1667771617943581167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 13:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=ZMvX5pnY;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.195, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id ECE3160002;
	Sun,  6 Nov 2022 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1667771616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pJKRCWbV/HRszhkJqRo0N25dPeCqUYXpdHx1yZdkZcs=;
	b=ZMvX5pnYpOvqJagxTqq2ZHoL1WQ2rDDq/EHkdRifVCoasUuVWJhAH3M4rAXe+7MByrMgEY
	/ldDdrgANpHvnH81RqsF8+UV3GrHuUp/dL5V8DOTof1HUU1b5sLe3X1tvn/AXrxmCp+Daq
	ri4AwrKdk/fGySj/mF8eObPlQCWFh0AG1Tcrj1x3kxwCToNRmoa/bTRa/3cSF8Vph65UFe
	7c8ypfjwCNZO8Eg9PL3QrV1VwGaObOJiGxlC9CKVADlV3TqxIlagdyQsB2T1KiWxQWFuMj
	uHCyqMbZxxQhqQ8fy7kxC8tduN4oqav3F0x8kRWlmDucUlzhoxuI83mnjxkdhA==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [langdale][PATCH] curl: Backport CVE fixes
Date: Sun,  6 Nov 2022 13:52:13 -0800
Message-Id: <20221106215213.373740-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 21:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172815

Backport fixes for:
 - CVE-2022-32221 POST following PUT confusion
 - CVE-2022-35260 .netrc parser out-of-bounds access
 - CVE-2022-42915 HTTP proxy double-free
 - CVE-2022-42916 HSTS bypass via IDN

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/curl/CVE-2022-32221.patch            |  27 ++++
 .../curl/curl/CVE-2022-35260.patch            |  73 ++++++++++
 .../curl/curl/CVE-2022-42915.patch            |  53 +++++++
 .../curl/curl/CVE-2022-42916.patch            | 134 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.85.0.bb      |   4 +
 5 files changed, 291 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42915.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
new file mode 100644
index 0000000000..03a7ac513b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
@@ -0,0 +1,27 @@
+From dd31455d46dcf9e3a1b8bd37e671af1a6af52807 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 15 Sep 2022 09:22:45 +0200
+Subject: [PATCH] setopt: when POST is set, reset the 'upload' field
+
+Reported-by: RobBotic1 on github
+Fixes #9507
+Closes #9511
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a64e3e59938abd7d6]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/setopt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index d5e3b50..b8793b4 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -696,6 +696,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.method = HTTPREQ_GET;
++    data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_HTTPPOST:
diff --git a/meta/recipes-support/curl/curl/CVE-2022-35260.patch b/meta/recipes-support/curl/curl/CVE-2022-35260.patch
new file mode 100644
index 0000000000..a4aae69fd0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-35260.patch
@@ -0,0 +1,73 @@
+From 9169e54444bdca7b5e7b44034c463fe5fc801e88 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2022 14:37:24 +0200
+Subject: [PATCH] netrc: replace fgets with Curl_get_line
+
+Make the parser only accept complete lines and avoid problems with
+overly long lines.
+
+Reported-by: Hiroki Kurosawa
+
+Closes #9789
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c97ec984fb2bc919a3aa86]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/curl_get_line.c | 6 +++---
+ lib/netrc.c         | 5 +++--
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/lib/curl_get_line.c b/lib/curl_get_line.c
+index 6a26bb2..22e3705 100644
+--- a/lib/curl_get_line.c
++++ b/lib/curl_get_line.c
+@@ -25,7 +25,7 @@
+ #include "curl_setup.h"
+ 
+ #if !defined(CURL_DISABLE_COOKIES) || !defined(CURL_DISABLE_ALTSVC) ||  \
+-  !defined(CURL_DISABLE_HSTS)
++  !defined(CURL_DISABLE_HSTS) || !defined(CURL_DISABLE_NETRC)
+ 
+ #include "curl_get_line.h"
+ #include "curl_memory.h"
+@@ -33,8 +33,8 @@
+ #include "memdebug.h"
+ 
+ /*
+- * get_line() makes sure to only return complete whole lines that fit in 'len'
+- * bytes and end with a newline.
++ * Curl_get_line() makes sure to only return complete whole lines that fit in
++ * 'len' bytes and end with a newline.
+  */
+ char *Curl_get_line(char *buf, int len, FILE *input)
+ {
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 62a6a10..5d17482 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -33,6 +33,7 @@
+ #include "netrc.h"
+ #include "strtok.h"
+ #include "strcase.h"
++#include "curl_get_line.h"
+ 
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -84,7 +85,7 @@ static int parsenetrc(const char *host,
+     char netrcbuffer[4096];
+     int  netrcbuffsize = (int)sizeof(netrcbuffer);
+ 
+-    while(!done && fgets(netrcbuffer, netrcbuffsize, file)) {
++    while(!done && Curl_get_line(netrcbuffer, netrcbuffsize, file)) {
+       char *tok;
+       char *tok_end;
+       bool quoted;
+@@ -243,7 +244,7 @@ static int parsenetrc(const char *host,
+         } /* switch (state) */
+         tok = ++tok_end;
+       }
+-    } /* while fgets() */
++    } /* while Curl_get_line() */
+ 
+     out:
+     if(!retcode) {
diff --git a/meta/recipes-support/curl/curl/CVE-2022-42915.patch b/meta/recipes-support/curl/curl/CVE-2022-42915.patch
new file mode 100644
index 0000000000..43de6e62eb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-42915.patch
@@ -0,0 +1,53 @@
+From 3ede0e72aaad6447d2a5ab07dac43e1b9d7e617b Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 6 Oct 2022 14:13:36 +0200
+Subject: [PATCH] http_proxy: restore the protocol pointer on error
+
+Reported-by: Trail of Bits
+
+Closes #9790
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/55e1875729f9d9fc7315ce]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/http_proxy.c | 6 ++----
+ lib/url.c        | 9 ---------
+ 2 files changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/lib/http_proxy.c b/lib/http_proxy.c
+index 1f87f6c..cc20b3a 100644
+--- a/lib/http_proxy.c
++++ b/lib/http_proxy.c
+@@ -212,10 +212,8 @@ void Curl_connect_done(struct Curl_easy *data)
+     Curl_dyn_free(&s->rcvbuf);
+     Curl_dyn_free(&s->req);
+ 
+-    /* restore the protocol pointer, if not already done */
+-    if(s->prot_save)
+-      data->req.p.http = s->prot_save;
+-    s->prot_save = NULL;
++    /* restore the protocol pointer */
++    data->req.p.http = s->prot_save;
+     data->info.httpcode = 0; /* clear it as it might've been used for the
+                                 proxy */
+     data->req.ignorebody = FALSE;
+diff --git a/lib/url.c b/lib/url.c
+index bfc784f..61c99d2 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -746,15 +746,6 @@ static void conn_shutdown(struct Curl_easy *data, struct connectdata *conn)
+   DEBUGASSERT(data);
+   infof(data, "Closing connection %ld", conn->connection_id);
+ 
+-#ifndef USE_HYPER
+-  if(conn->connect_state && conn->connect_state->prot_save) {
+-    /* If this was closed with a CONNECT in progress, cleanup this temporary
+-       struct arrangement */
+-    data->req.p.http = NULL;
+-    Curl_safefree(conn->connect_state->prot_save);
+-  }
+-#endif
+-
+   /* possible left-overs from the async name resolvers */
+   Curl_resolver_cancel(data);
+ 
diff --git a/meta/recipes-support/curl/curl/CVE-2022-42916.patch b/meta/recipes-support/curl/curl/CVE-2022-42916.patch
new file mode 100644
index 0000000000..000af69885
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-42916.patch
@@ -0,0 +1,134 @@
+From 401455229a5006bed0346fedc99791ccb53e146c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 12 Oct 2022 10:47:59 +0200
+Subject: [PATCH] url: use IDN decoded names for HSTS checks
+
+Reported-by: Hiroki Kurosawa
+
+Closes #9791
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/53bcf55b4538067e6]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/url.c | 91 ++++++++++++++++++++++++++++---------------------------
+ 1 file changed, 47 insertions(+), 44 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 61c99d2..6426fa7 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2024,10 +2024,56 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+     failf(data, "Too long host name (maximum is %d)", MAX_URL_LEN);
+     return CURLE_URL_MALFORMAT;
+   }
++  hostname = data->state.up.hostname;
++
++  if(hostname && hostname[0] == '[') {
++    /* This looks like an IPv6 address literal. See if there is an address
++       scope. */
++    size_t hlen;
++    conn->bits.ipv6_ip = TRUE;
++    /* cut off the brackets! */
++    hostname++;
++    hlen = strlen(hostname);
++    hostname[hlen - 1] = 0;
++
++    zonefrom_url(uh, data, conn);
++  }
++
++  /* make sure the connect struct gets its own copy of the host name */
++  conn->host.rawalloc = strdup(hostname ? hostname : "");
++  if(!conn->host.rawalloc)
++    return CURLE_OUT_OF_MEMORY;
++  conn->host.name = conn->host.rawalloc;
++
++  /*************************************************************
++   * IDN-convert the hostnames
++   *************************************************************/
++  result = Curl_idnconvert_hostname(data, &conn->host);
++  if(result)
++    return result;
++  if(conn->bits.conn_to_host) {
++    result = Curl_idnconvert_hostname(data, &conn->conn_to_host);
++    if(result)
++      return result;
++  }
++#ifndef CURL_DISABLE_PROXY
++  if(conn->bits.httpproxy) {
++    result = Curl_idnconvert_hostname(data, &conn->http_proxy.host);
++    if(result)
++      return result;
++  }
++  if(conn->bits.socksproxy) {
++    result = Curl_idnconvert_hostname(data, &conn->socks_proxy.host);
++    if(result)
++      return result;
++  }
++#endif
+ 
+ #ifndef CURL_DISABLE_HSTS
++  /* HSTS upgrade */
+   if(data->hsts && strcasecompare("http", data->state.up.scheme)) {
+-    if(Curl_hsts(data->hsts, data->state.up.hostname, TRUE)) {
++    /* This MUST use the IDN decoded name */
++    if(Curl_hsts(data->hsts, conn->host.name, TRUE)) {
+       char *url;
+       Curl_safefree(data->state.up.scheme);
+       uc = curl_url_set(uh, CURLUPART_SCHEME, "https", 0);
+@@ -2133,26 +2179,6 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+ 
+   (void)curl_url_get(uh, CURLUPART_QUERY, &data->state.up.query, 0);
+ 
+-  hostname = data->state.up.hostname;
+-  if(hostname && hostname[0] == '[') {
+-    /* This looks like an IPv6 address literal. See if there is an address
+-       scope. */
+-    size_t hlen;
+-    conn->bits.ipv6_ip = TRUE;
+-    /* cut off the brackets! */
+-    hostname++;
+-    hlen = strlen(hostname);
+-    hostname[hlen - 1] = 0;
+-
+-    zonefrom_url(uh, data, conn);
+-  }
+-
+-  /* make sure the connect struct gets its own copy of the host name */
+-  conn->host.rawalloc = strdup(hostname ? hostname : "");
+-  if(!conn->host.rawalloc)
+-    return CURLE_OUT_OF_MEMORY;
+-  conn->host.name = conn->host.rawalloc;
+-
+ #ifdef ENABLE_IPV6
+   if(data->set.scope_id)
+     /* Override any scope that was set above.  */
+@@ -3781,29 +3807,6 @@ static CURLcode create_conn(struct Curl_easy *data,
+   if(result)
+     goto out;
+ 
+-  /*************************************************************
+-   * IDN-convert the hostnames
+-   *************************************************************/
+-  result = Curl_idnconvert_hostname(data, &conn->host);
+-  if(result)
+-    goto out;
+-  if(conn->bits.conn_to_host) {
+-    result = Curl_idnconvert_hostname(data, &conn->conn_to_host);
+-    if(result)
+-      goto out;
+-  }
+-#ifndef CURL_DISABLE_PROXY
+-  if(conn->bits.httpproxy) {
+-    result = Curl_idnconvert_hostname(data, &conn->http_proxy.host);
+-    if(result)
+-      goto out;
+-  }
+-  if(conn->bits.socksproxy) {
+-    result = Curl_idnconvert_hostname(data, &conn->socks_proxy.host);
+-    if(result)
+-      goto out;
+-  }
+-#endif
+ 
+   /*************************************************************
+    * Check whether the host and the "connect to host" are equal.
diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index ad6a5175bc..0386052bf4 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -13,6 +13,10 @@ SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
+    file://CVE-2022-32221.patch \
+    file://CVE-2022-35260.patch \
+    file://CVE-2022-42915.patch \
+    file://CVE-2022-42916.patch \
 "
 SRC_URI[sha256sum] = "88b54a6d4b9a48cb4d873c7056dcba997ddd5b7be5a2d537a4acb55c20b04be6"
 
-- 
2.37.4


