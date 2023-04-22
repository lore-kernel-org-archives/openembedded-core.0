Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2613C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:54:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.10294.1682178895292994430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BXm4X/HC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a920d484bdso26676715ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178894; x=1684770894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjXmVFTycnpr4R+cY6KKuoIZsmox6wLPm8ej4ZUPvM0=;
        b=BXm4X/HCPLcSHixMTt6ZXMQ1aTdDRLfJSZ0IeBjVEA+W3PKavi0B4G+UIW6Qq7JGr4
         wd92gXkSqLpz5qervnos5sOqQOObgtxPPrlKu5VY5BrpjA/Sa1mKtsShHsfCTy3uqDr+
         aA8b4kJj0N/e9YuBwJ0AEFK5f8ekEumMthfC7DCvdOPtjxelBW6P+5ccY4eYTdRqsDbI
         c98VDOValBWMVvFVTplArzXxxCuM3y77l6bfxq544LBaGFnAMzXHwEWmsiio7WMyc11n
         sFwlM/Wsai82W++vOsR/dNFgIc5dZe2WsB+wqRTV/PaC2+aZbMya4zNOGA4yKHrC+Hdn
         m+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178894; x=1684770894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjXmVFTycnpr4R+cY6KKuoIZsmox6wLPm8ej4ZUPvM0=;
        b=Gi1Uka5ItwGGcpdv+ZT315C1+MMSrRoDGzy8xTsap0YUKtf8o4r+LVJHx2FFdqak39
         YxilV8YBIOrmtYuCayB1vcOjgnMvvBYHcNN9ME9T0bRMcWLgllxf9FO1E3+8efHI37iN
         IP+f4gw6ESrN9wCJ/1vkJHae/cp+CQ5xJzHwjthmr/Q+LHJbBilDBbB42n9B62B9Vkj+
         um+iJlr5PpuRfcZeG/7sJy3RqadCj3XSEbqUyWopDypFNHDrUUoWdk+CRBEXo3Edq/BE
         vEiFwiXfYi1YfxJ0CyJl9Y6v9IZKRNygrWGqa4BbAbv/nScx3da/TXZ0UYcngp3OEOH/
         IwVw==
X-Gm-Message-State: AAQBX9efKAMxLEGH+A+5BWjTJZ8/27b6mzCCitmwm3svEc7eoFv5GVN9
	6nH45zDrTXTKn73o82AyuQuJ6OTkqS3pkef0aBs=
X-Google-Smtp-Source: AKy350bV7mw0v9ONzFaw1Fgy9mF+GQcTXhausQhndsjArzzodAE2WC8rCPWYoOYJD4Z326yUdsRkjQ==
X-Received: by 2002:a17:902:e886:b0:1a8:13fc:a654 with SMTP id w6-20020a170902e88600b001a813fca654mr10089478plg.25.1682178894162;
        Sat, 22 Apr 2023 08:54:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.54.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:54:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] curl: Security fix for CVE-2023-27535, CVE-2023-27536, CVE-2023-27538
Date: Sat, 22 Apr 2023 05:54:34 -1000
Message-Id: <0b35659c895e6ff2690d42f976169e4a65be07e6.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180304

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37878, https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1, https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb, https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-27535-pre1.patch       | 196 ++++++++++++++++++
 .../CVE-2023-27535_and_CVE-2023-27538.patch   | 170 +++++++++++++++
 .../curl/curl/CVE-2023-27536.patch            |  52 +++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 4 files changed, 421 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535_and_CVE-2023-27538.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
new file mode 100644
index 0000000000..57e1cb9e13
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
@@ -0,0 +1,196 @@
+From ed5095ed94281989e103c72e032200b83be37878 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 6 Oct 2022 00:49:10 +0200
+Subject: [PATCH] strcase: add and use Curl_timestrcmp
+
+This is a strcmp() alternative function for comparing "secrets",
+designed to take the same time no matter the content to not leak
+match/non-match info to observers based on how fast it is.
+
+The time this function takes is only a function of the shortest input
+string.
+
+Reported-by: Trail of Bits
+
+Closes #9658
+
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37878]
+Comment: to backport fix for CVE-2023-27535, add function Curl_timestrcmp.
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/netrc.c             |  6 +++---
+ lib/strcase.c           | 22 ++++++++++++++++++++++
+ lib/strcase.h           |  1 +
+ lib/url.c               | 33 +++++++++++++--------------------
+ lib/vauth/digest_sspi.c |  4 ++--
+ lib/vtls/vtls.c         |  4 ++--
+ 6 files changed, 43 insertions(+), 27 deletions(-)
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 0a4ae2c..b771b60 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -140,9 +140,9 @@ static int parsenetrc(const char *host,
+           /* we are now parsing sub-keywords concerning "our" host */
+           if(state_login) {
+             if(specific_login) {
+-              state_our_login = strcasecompare(login, tok);
++              state_our_login = !Curl_timestrcmp(login, tok);
+             }
+-            else if(!login || strcmp(login, tok)) {
++            else if(!login || Curl_timestrcmp(login, tok)) {
+               if(login_alloc) {
+                 free(login);
+                 login_alloc = FALSE;
+@@ -158,7 +158,7 @@ static int parsenetrc(const char *host,
+           }
+           else if(state_password) {
+             if((state_our_login || !specific_login)
+-                && (!password || strcmp(password, tok))) {
++               && (!password || Curl_timestrcmp(password, tok))) {
+               if(password_alloc) {
+                 free(password);
+                 password_alloc = FALSE;
+diff --git a/lib/strcase.c b/lib/strcase.c
+index 692a3f1..be085b3 100644
+--- a/lib/strcase.c
++++ b/lib/strcase.c
+@@ -141,6 +141,28 @@ bool Curl_safecmp(char *a, char *b)
+   return !a && !b;
+ }
+ 
++/*
++ * Curl_timestrcmp() returns 0 if the two strings are identical. The time this
++ * function spends is a function of the shortest string, not of the contents.
++ */
++int Curl_timestrcmp(const char *a, const char *b)
++{
++  int match = 0;
++  int i = 0;
++
++  if(a && b) {
++    while(1) {
++      match |= a[i]^b[i];
++      if(!a[i] || !b[i])
++        break;
++      i++;
++    }
++  }
++  else
++    return a || b;
++  return match;
++}
++
+ /* --- public functions --- */
+ 
+ int curl_strequal(const char *first, const char *second)
+diff --git a/lib/strcase.h b/lib/strcase.h
+index 382b80a..c6979da 100644
+--- a/lib/strcase.h
++++ b/lib/strcase.h
+@@ -48,5 +48,6 @@ void Curl_strntoupper(char *dest, const char *src, size_t n);
+ void Curl_strntolower(char *dest, const char *src, size_t n);
+ 
+ bool Curl_safecmp(char *a, char *b);
++int Curl_timestrcmp(const char *first, const char *second);
+ 
+ #endif /* HEADER_CURL_STRCASE_H */
+diff --git a/lib/url.c b/lib/url.c
+index df4377d..c397b57 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -930,19 +930,10 @@ socks_proxy_info_matches(const struct proxy_info *data,
+   /* the user information is case-sensitive
+      or at least it is not defined as case-insensitive
+      see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-  if(!data->user != !needle->user)
+-    return FALSE;
+-  /* curl_strequal does a case insentive comparison, so do not use it here! */
+-  if(data->user &&
+-     needle->user &&
+-     strcmp(data->user, needle->user) != 0)
+-    return FALSE;
+-  if(!data->passwd != !needle->passwd)
+-    return FALSE;
++
+   /* curl_strequal does a case insentive comparison, so do not use it here! */
+-  if(data->passwd &&
+-     needle->passwd &&
+-     strcmp(data->passwd, needle->passwd) != 0)
++  if(Curl_timestrcmp(data->user, needle->user) ||
++     Curl_timestrcmp(data->passwd, needle->passwd))
+     return FALSE;
+   return TRUE;
+ }
+@@ -1341,10 +1332,10 @@ ConnectionExists(struct Curl_easy *data,
+       if(!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) {
+         /* This protocol requires credentials per connection,
+            so verify that we're using the same name and password as well */
+-        if(strcmp(needle->user, check->user) ||
+-           strcmp(needle->passwd, check->passwd) ||
+-           !Curl_safecmp(needle->sasl_authzid, check->sasl_authzid) ||
+-           !Curl_safecmp(needle->oauth_bearer, check->oauth_bearer)) {
++        if(Curl_timestrcmp(needle->user, check->user) ||
++           Curl_timestrcmp(needle->passwd, check->passwd) ||
++           Curl_timestrcmp(needle->sasl_authzid, check->sasl_authzid) ||
++           Curl_timestrcmp(needle->oauth_bearer, check->oauth_bearer)) {
+           /* one of them was different */
+           continue;
+         }
+@@ -1420,8 +1411,8 @@ ConnectionExists(struct Curl_easy *data,
+            possible. (Especially we must not reuse the same connection if
+            partway through a handshake!) */
+         if(wantNTLMhttp) {
+-          if(strcmp(needle->user, check->user) ||
+-             strcmp(needle->passwd, check->passwd)) {
++          if(Curl_timestrcmp(needle->user, check->user) ||
++             Curl_timestrcmp(needle->passwd, check->passwd)) {
+ 
+             /* we prefer a credential match, but this is at least a connection
+                that can be reused and "upgraded" to NTLM */
+@@ -1443,8 +1434,10 @@ ConnectionExists(struct Curl_easy *data,
+           if(!check->http_proxy.user || !check->http_proxy.passwd)
+             continue;
+ 
+-          if(strcmp(needle->http_proxy.user, check->http_proxy.user) ||
+-             strcmp(needle->http_proxy.passwd, check->http_proxy.passwd))
++          if(Curl_timestrcmp(needle->http_proxy.user,
++                             check->http_proxy.user) ||
++             Curl_timestrcmp(needle->http_proxy.passwd,
++                             check->http_proxy.passwd))
+             continue;
+         }
+         else if(check->proxy_ntlm_state != NTLMSTATE_NONE) {
+diff --git a/lib/vauth/digest_sspi.c b/lib/vauth/digest_sspi.c
+index 94f8f8c..a413419 100644
+--- a/lib/vauth/digest_sspi.c
++++ b/lib/vauth/digest_sspi.c
+@@ -429,8 +429,8 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+      has changed then delete that context. */
+   if((userp && !digest->user) || (!userp && digest->user) ||
+      (passwdp && !digest->passwd) || (!passwdp && digest->passwd) ||
+-     (userp && digest->user && strcmp(userp, digest->user)) ||
+-     (passwdp && digest->passwd && strcmp(passwdp, digest->passwd))) {
++     (userp && digest->user && Curl_timestrcmp(userp, digest->user)) ||
++     (passwdp && digest->passwd && Curl_timestrcmp(passwdp, digest->passwd))) {
+     if(digest->http_context) {
+       s_pSecFn->DeleteSecurityContext(digest->http_context);
+       Curl_safefree(digest->http_context);
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index e2d3438..881c8d2 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -146,8 +146,8 @@ Curl_ssl_config_matches(struct ssl_primary_config *data,
+      Curl_safecmp(data->random_file, needle->random_file) &&
+      Curl_safecmp(data->egdsocket, needle->egdsocket) &&
+ #ifdef USE_TLS_SRP
+-     Curl_safecmp(data->username, needle->username) &&
+-     Curl_safecmp(data->password, needle->password) &&
++     !Curl_timestrcmp(data->username, needle->username) &&
++     !Curl_timestrcmp(data->password, needle->password) &&
+      (data->authtype == needle->authtype) &&
+ #endif
+      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &&
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535_and_CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27535_and_CVE-2023-27538.patch
new file mode 100644
index 0000000000..4e701edfff
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27535_and_CVE-2023-27538.patch
@@ -0,0 +1,170 @@
+From 8f4608468b890dce2dad9f91d5607ee7e9c1aba1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 9 Mar 2023 17:47:06 +0100
+Subject: [PATCH] ftp: add more conditions for connection reuse
+
+Reported-by: Harry Sintonen
+Closes #10730
+
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1, https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Comment: Backport for CVE-2023-27535 also fixes CVE-2023-27538 in the file "lib/url.c".
+CVE: CVE-2023-27535, CVE-2023-27538 
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/ftp.c     | 28 ++++++++++++++++++++++++++--
+ lib/ftp.h     |  5 +++++
+ lib/setopt.c  |  2 +-
+ lib/url.c     | 19 ++++++++++++++++---
+ lib/urldata.h |  4 ++--
+ 5 files changed, 50 insertions(+), 8 deletions(-)
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index c6efaed..93bbaeb 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -4097,6 +4097,8 @@ static CURLcode ftp_disconnect(struct Curl_easy *data,
+   }
+ 
+   freedirs(ftpc);
++  Curl_safefree(ftpc->account);
++  Curl_safefree(ftpc->alternative_to_user);
+   Curl_safefree(ftpc->prevpath);
+   Curl_safefree(ftpc->server_os);
+   Curl_pp_disconnect(pp);
+@@ -4364,11 +4366,31 @@ static CURLcode ftp_setup_connection(struct Curl_easy *data,
+ {
+   char *type;
+   struct FTP *ftp;
++  struct ftp_conn *ftpc = &conn->proto.ftpc;
+ 
+-  data->req.p.ftp = ftp = calloc(sizeof(struct FTP), 1);
++  ftp = calloc(sizeof(struct FTP), 1);
+   if(!ftp)
+     return CURLE_OUT_OF_MEMORY;
+ 
++  /* clone connection related data that is FTP specific */
++  if(data->set.str[STRING_FTP_ACCOUNT]) {
++    ftpc->account = strdup(data->set.str[STRING_FTP_ACCOUNT]);
++    if(!ftpc->account) {
++      free(ftp);
++      return CURLE_OUT_OF_MEMORY;
++    }
++  }
++  if(data->set.str[STRING_FTP_ALTERNATIVE_TO_USER]) {
++    ftpc->alternative_to_user =
++      strdup(data->set.str[STRING_FTP_ALTERNATIVE_TO_USER]);
++    if(!ftpc->alternative_to_user) {
++      Curl_safefree(ftpc->account);
++      free(ftp);
++      return CURLE_OUT_OF_MEMORY;
++    }
++  }
++  data->req.p.ftp = ftp;
++
+   ftp->path = &data->state.up.path[1]; /* don't include the initial slash */
+ 
+   /* FTP URLs support an extension like ";type=<typecode>" that
+@@ -4403,7 +4425,9 @@ static CURLcode ftp_setup_connection(struct Curl_easy *data,
+   /* get some initial data into the ftp struct */
+   ftp->transfer = PPTRANSFER_BODY;
+   ftp->downloadsize = 0;
+-  conn->proto.ftpc.known_filesize = -1; /* unknown size for now */
++  ftpc->known_filesize = -1; /* unknown size for now */
++  ftpc->use_ssl = data->set.use_ssl;
++  ftpc->ccc = data->set.ftp_ccc;
+ 
+   return CURLE_OK;
+ }
+diff --git a/lib/ftp.h b/lib/ftp.h
+index 1cfdac0..afca25b 100644
+--- a/lib/ftp.h
++++ b/lib/ftp.h
+@@ -115,6 +115,8 @@ struct FTP {
+    struct */
+ struct ftp_conn {
+   struct pingpong pp;
++  char *account;
++  char *alternative_to_user;
+   char *entrypath; /* the PWD reply when we logged on */
+   char *file;    /* url-decoded file name (or path) */
+   char **dirs;   /* realloc()ed array for path components */
+@@ -144,6 +146,9 @@ struct ftp_conn {
+   ftpstate state; /* always use ftp.c:state() to change state! */
+   ftpstate state_saved; /* transfer type saved to be reloaded after
+                            data connection is established */
++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for FTP or
++                              IMAP or POP3 or others! (type: curl_usessl)*/
++  unsigned char ccc;       /* ccc level for this connection */
+   curl_off_t retr_size_saved; /* Size of retrieved file saved */
+   char *server_os;     /* The target server operating system. */
+   curl_off_t known_filesize; /* file size is different from -1, if wildcard
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 29a78a4..89d0150 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -2304,7 +2304,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     arg = va_arg(param, long);
+     if((arg < CURLUSESSL_NONE) || (arg >= CURLUSESSL_LAST))
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+-    data->set.use_ssl = (curl_usessl)arg;
++    data->set.use_ssl = (unsigned char)arg;
+     break;
+ 
+   case CURLOPT_SSL_OPTIONS:
+diff --git a/lib/url.c b/lib/url.c
+index c397b57..280171c 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1347,11 +1347,24 @@ ConnectionExists(struct Curl_easy *data,
+          (check->httpversion >= 20) &&
+          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
+         continue;
+-
+-      if(get_protocol_family(needle->handler) == PROTO_FAMILY_SSH) {
+-        if(!ssh_config_matches(needle, check))
++#ifdef USE_SSH
++      else if(get_protocol_family(needle->handler) & PROTO_FAMILY_SSH) {
++      if(!ssh_config_matches(needle, check))
+           continue;
+       }
++#endif
++#ifndef CURL_DISABLE_FTP
++      else if(get_protocol_family(needle->handler) & PROTO_FAMILY_FTP) {
++        /* Also match ACCOUNT, ALTERNATIVE-TO-USER, USE_SSL and CCC options */
++        if(Curl_timestrcmp(needle->proto.ftpc.account,
++                           check->proto.ftpc.account) ||
++           Curl_timestrcmp(needle->proto.ftpc.alternative_to_user,
++                           check->proto.ftpc.alternative_to_user) ||
++           (needle->proto.ftpc.use_ssl != check->proto.ftpc.use_ssl) ||
++           (needle->proto.ftpc.ccc != check->proto.ftpc.ccc))
++          continue;
++      }
++#endif
+ 
+       if((needle->handler->flags&PROTOPT_SSL)
+ #ifndef CURL_DISABLE_PROXY
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 69eb2ee..6e6122a 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1748,8 +1748,6 @@ struct UserDefined {
+   enum CURL_NETRC_OPTION
+        use_netrc;        /* defined in include/curl.h */
+ #endif
+-  curl_usessl use_ssl;   /* if AUTH TLS is to be attempted etc, for FTP or
+-                            IMAP or POP3 or others! */
+   long new_file_perms;    /* Permissions to use when creating remote files */
+   long new_directory_perms; /* Permissions to use when creating remote dirs */
+   long ssh_auth_types;   /* allowed SSH auth types */
+@@ -1877,6 +1875,8 @@ struct UserDefined {
+   BIT(http09_allowed); /* allow HTTP/0.9 responses */
+   BIT(mail_rcpt_allowfails); /* allow RCPT TO command to fail for some
+                                 recipients */
++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for FTP or
++                              IMAP or POP3 or others! (type: curl_usessl)*/
+ };
+ 
+ struct Names {
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
new file mode 100644
index 0000000000..fb3ee6a14d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
@@ -0,0 +1,52 @@
+From cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 10 Mar 2023 09:22:43 +0100
+Subject: [PATCH] url: only reuse connections with same GSS delegation
+
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+CVE: CVE-2023-27536
+Signed-off-by: Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/url.c     | 6 ++++++
+ lib/urldata.h | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index 280171c..c6413a1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1341,6 +1341,11 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
++      /* GSS delegation differences do not actually affect every connection
++         and auth method, but this check takes precaution before efficiency */
++      if(needle->gssapi_delegation != check->gssapi_delegation)
++        continue;
++
+       /* If multiplexing isn't enabled on the h2 connection and h1 is
+          explicitly requested, handle it: */
+       if((needle->handler->protocol & PROTO_FAMILY_HTTP) &&
+@@ -1813,6 +1818,7 @@ static struct connectdata *allocate_conn(struct Curl_easy *data)
+   conn->fclosesocket = data->set.fclosesocket;
+   conn->closesocket_client = data->set.closesocket_client;
+   conn->lastused = Curl_now(); /* used now */
++  conn->gssapi_delegation = data->set.gssapi_delegation;
+ 
+   return conn;
+   error:
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 6e6122a..602c735 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1131,6 +1131,7 @@ struct connectdata {
+   int socks5_gssapi_enctype;
+ #endif
+   unsigned short localport;
++  long gssapi_delegation; /* inherited from set.gssapi_delegation */
+ };
+ 
+ /* The end of connectdata. */
+-- 
+2.35.7
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 4c18afe293..70ceb9f370 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -42,6 +42,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27533.patch \
            file://CVE-2023-27534.patch \
+           file://CVE-2023-27535-pre1.patch \
+           file://CVE-2023-27535_and_CVE-2023-27538.patch \
+           file://CVE-2023-27536.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


