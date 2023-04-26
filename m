Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F55C77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 08:18:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3033.1682497085808579161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 01:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pbvq+F3H;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a6f0d8cdfeso54688135ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 01:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682497085; x=1685089085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLy6+4P/Yq/mZ/crlJpW1ciRP8OltabwA5JoDF5L/d8=;
        b=Pbvq+F3HPNYlGnKnYcTiEpFlEMQxbbukgEZlw6pJG3b/sOqvE5OP7oUqBwYX6TvLt1
         mw6W20QvIgvYUpbX0AMqVrOw5KPSn+rLr1/aF9XfPKscG95WHTKBw6nOGki3X91mXYBH
         UQBLPoUNuMSoqcS9nC3CBUhR+DjXQKoqgB5Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497085; x=1685089085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLy6+4P/Yq/mZ/crlJpW1ciRP8OltabwA5JoDF5L/d8=;
        b=dYM7yP6EvDKlYlJbkXlz/CVQ1V9c9B9bY4U9r4QQHUojlBj0h7s/PmYwejjSVNhTVg
         eFQFoo6KyMO7WBthVqLRKkQ9R3J+HzQmyT6TVrBJHDTgYjJeeL+zuR3ui2J838gWXQpm
         d9UK6D+V+W5BToOCtuaSeTdFYWGi58y583B2jtYUIPtfPe6UsaM8lOuwI1dDAcb9NWgR
         /KF4kS26I77/4qlX6sSb8p5VJCgMWjhF0RTeN+RTnG1SDTaG7gPWfsGTzZRlodyOz41l
         a/0Dd28JjzQZqy9FzPFEtc84VIgAT3qLHDGvIHLV9eiJCA0zZUJyx6W4soeiDWQifq2s
         b7qQ==
X-Gm-Message-State: AAQBX9eiarJGkV4ZVn363OB9cxQhixy4sXWFfWwgbL+A7WaymuGivioS
	2rqIlVALAV7LkQDM2euf0K8p/B6xDW2H2ly7RAY=
X-Google-Smtp-Source: AKy350bzLj+9z9GzFlwW5yb75Fy4gkw5egv8PTjcjOaqDlMPQIaSH8Tq8o8p4Mpn8f9RHspq2pNAkw==
X-Received: by 2002:a17:902:a5c4:b0:1a6:7b92:15e2 with SMTP id t4-20020a170902a5c400b001a67b9215e2mr18865163plq.49.1682497084395;
        Wed, 26 Apr 2023 01:18:04 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb5:362c:2c57:756a:b18a:bf44])
        by smtp.gmail.com with ESMTPSA id x21-20020a170902b41500b001a1a8e98e93sm9381747plr.287.2023.04.26.01.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 01:18:03 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] curl: Security fix CVE-2023-27533, CVE-2023-27535, CVE-2023-27536 and CVE-2023-27538
Date: Wed, 26 Apr 2023 13:47:45 +0530
Message-Id: <20230426081745.182677-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 08:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180412

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=ubuntu/focal-security & https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684 & https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37878 & https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a64c & https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1 & https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 & https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2023-27533.patch            |  59 +++++
 .../curl/curl/CVE-2023-27535-pre1.patch       | 236 ++++++++++++++++++
 .../curl/curl/CVE-2023-27535.patch            | 170 +++++++++++++
 .../curl/curl/CVE-2023-27536.patch            |  55 ++++
 .../curl/curl/CVE-2023-27538.patch            |  29 +++
 meta/recipes-support/curl/curl_7.69.1.bb      |   5 +
 6 files changed, 554 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27533.patch b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
new file mode 100644
index 0000000000..64ba135056
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
@@ -0,0 +1,59 @@
+Backport of:
+
+From 538b1e79a6e7b0bb829ab4cecc828d32105d0684 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 6 Mar 2023 12:07:33 +0100
+Subject: [PATCH] telnet: only accept option arguments in ascii
+
+To avoid embedded telnet negotiation commands etc.
+
+Reported-by: Harry Sintonen
+Closes #10728
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27533.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684]
+CVE: CVE-2023-27533
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/telnet.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -815,6 +815,17 @@ static void printsub(struct Curl_easy *d
+   }
+ }
+ 
++static bool str_is_nonascii(const char *str)
++{
++  size_t len = strlen(str);
++  while(len--) {
++    if(*str & 0x80)
++      return TRUE;
++    str++;
++  }
++  return FALSE;
++}
++
+ static CURLcode check_telnet_options(struct connectdata *conn)
+ {
+   struct curl_slist *head;
+@@ -829,6 +840,8 @@ static CURLcode check_telnet_options(str
+   /* Add the user name as an environment variable if it
+      was given on the command line */
+   if(conn->bits.user_passwd) {
++    if(str_is_nonascii(data->conn->user))
++      return CURLE_BAD_FUNCTION_ARGUMENT;
+     msnprintf(option_arg, sizeof(option_arg), "USER,%s", conn->user);
+     beg = curl_slist_append(tn->telnet_vars, option_arg);
+     if(!beg) {
+@@ -844,6 +857,9 @@ static CURLcode check_telnet_options(str
+     if(sscanf(head->data, "%127[^= ]%*[ =]%255s",
+               option_keyword, option_arg) == 2) {
+ 
++      if(str_is_nonascii(option_arg))
++        continue;
++
+       /* Terminal type */
+       if(strcasecompare(option_keyword, "TTYPE")) {
+         strncpy(tn->subopt_ttype, option_arg, 31);
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
new file mode 100644
index 0000000000..034b72f7e6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
@@ -0,0 +1,236 @@
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
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37878 & https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a64c]
+Comment: to backport fix for CVE-2023-27535, add function Curl_timestrcmp.
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/netrc.c             |  6 +++---
+ lib/strcase.c           | 22 ++++++++++++++++++++++
+ lib/strcase.h           |  1 +
+ lib/url.c               | 33 +++++++++++++--------------------
+ lib/vauth/digest_sspi.c |  4 ++--
+ lib/vtls/vtls.c         | 21 ++++++++++++++++++++-
+ 6 files changed, 61 insertions(+), 26 deletions(-)
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 9323913..fe3fd1e 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -124,9 +124,9 @@ static int parsenetrc(const char *host,
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
+@@ -142,7 +142,7 @@ static int parsenetrc(const char *host,
+           }
+           else if(state_password) {
+             if((state_our_login || !specific_login)
+-                && (!password || strcmp(password, tok))) {
++               && (!password || Curl_timestrcmp(password, tok))) {
+               if(password_alloc) {
+                 free(password);
+                 password_alloc = FALSE;
+diff --git a/lib/strcase.c b/lib/strcase.c
+index 70bf21c..ec776b3 100644
+--- a/lib/strcase.c
++++ b/lib/strcase.c
+@@ -261,6 +261,28 @@ bool Curl_safecmp(char *a, char *b)
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
+index 8929a53..8077108 100644
+--- a/lib/strcase.h
++++ b/lib/strcase.h
+@@ -49,5 +49,6 @@ void Curl_strntoupper(char *dest, const char *src, size_t n);
+ void Curl_strntolower(char *dest, const char *src, size_t n);
+ 
+ bool Curl_safecmp(char *a, char *b);
++int Curl_timestrcmp(const char *first, const char *second);
+ 
+ #endif /* HEADER_CURL_STRCASE_H */
+diff --git a/lib/url.c b/lib/url.c
+index 9f14a7b..dfbde3b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -886,19 +886,10 @@ socks_proxy_info_matches(const struct proxy_info* data,
+   /* the user information is case-sensitive
+      or at least it is not defined as case-insensitive
+      see https://tools.ietf.org/html/rfc3986#section-3.2.1 */
+-  if((data->user == NULL) != (needle->user == NULL))
+-    return FALSE;
+-  /* curl_strequal does a case insentive comparison, so do not use it here! */
+-  if(data->user &&
+-     needle->user &&
+-     strcmp(data->user, needle->user) != 0)
+-    return FALSE;
+-  if((data->passwd == NULL) != (needle->passwd == NULL))
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
+@@ -1257,10 +1248,10 @@ ConnectionExists(struct Curl_easy *data,
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
+@@ -1326,8 +1317,8 @@ ConnectionExists(struct Curl_easy *data,
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
+@@ -1348,8 +1339,10 @@ ConnectionExists(struct Curl_easy *data,
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
+index a109056..3986386 100644
+--- a/lib/vauth/digest_sspi.c
++++ b/lib/vauth/digest_sspi.c
+@@ -450,8 +450,8 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
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
+index e8cb70f..70a9391 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -98,9 +98,15 @@ Curl_ssl_config_matches(struct ssl_primary_config* data,
+      Curl_safecmp(data->issuercert, needle->issuercert) &&
+      Curl_safecmp(data->clientcert, needle->clientcert) &&
+      Curl_safecmp(data->random_file, needle->random_file) &&
+-     Curl_safecmp(data->egdsocket, needle->egdsocket) &&     
++     Curl_safecmp(data->egdsocket, needle->egdsocket) &&    
++#ifdef USE_TLS_SRP 
++     !Curl_timestrcmp(data->username, needle->username) &&    
++     !Curl_timestrcmp(data->password, needle->password) &&    
++     (data->authtype == needle->authtype) &&   
++#endif 
+      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &&
+      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list13) &&
++     Curl_safe_strcasecompare(data->CRLfile, needle->CRLfile) &&
+      Curl_safe_strcasecompare(data->pinned_key, needle->pinned_key))
+     return TRUE;
+ 
+@@ -117,6 +123,9 @@ Curl_clone_primary_ssl_config(struct ssl_primary_config *source,
+   dest->verifyhost = source->verifyhost;
+   dest->verifystatus = source->verifystatus;
+   dest->sessionid = source->sessionid;
++#ifdef USE_TLS_SRP
++  dest->authtype = source->authtype;
++#endif
+ 
+   CLONE_STRING(CApath);
+   CLONE_STRING(CAfile);
+@@ -127,6 +136,11 @@ Curl_clone_primary_ssl_config(struct ssl_primary_config *source,
+   CLONE_STRING(cipher_list);
+   CLONE_STRING(cipher_list13);
+   CLONE_STRING(pinned_key);
++  CLONE_STRING(CRLfile);
++#ifdef USE_TLS_SRP
++  CLONE_STRING(username);
++  CLONE_STRING(password);
++#endif
+ 
+   return TRUE;
+ }
+@@ -142,6 +156,11 @@ void Curl_free_primary_ssl_config(struct ssl_primary_config* sslc)
+   Curl_safefree(sslc->cipher_list);
+   Curl_safefree(sslc->cipher_list13);
+   Curl_safefree(sslc->pinned_key);
++  Curl_safefree(sslc->CRLfile);
++#ifdef USE_TLS_SRP
++  Curl_safefree(sslc->username);
++  Curl_safefree(sslc->password);
++#endif
+ }
+ 
+ #ifdef USE_SSL
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535.patch b/meta/recipes-support/curl/curl/CVE-2023-27535.patch
new file mode 100644
index 0000000000..e38390a57c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27535.patch
@@ -0,0 +1,170 @@
+From 8f4608468b890dce2dad9f91d5607ee7e9c1aba1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 9 Mar 2023 17:47:06 +0100
+Subject: [PATCH] ftp: add more conditions for connection reuse
+
+Reported-by: Harry Sintonen
+Closes #10730
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27535.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1]
+CVE: CVE-2023-27535
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/ftp.c     | 30 ++++++++++++++++++++++++++++--
+ lib/ftp.h     |  5 +++++
+ lib/setopt.c  |  2 +-
+ lib/url.c     | 16 +++++++++++++++-
+ lib/urldata.h |  4 ++--
+ 5 files changed, 51 insertions(+), 6 deletions(-)
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 31a34e8..7a82a74 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -4059,6 +4059,10 @@ static CURLcode ftp_disconnect(struct connectdata *conn, bool dead_connection)
+   }
+ 
+   freedirs(ftpc);
++  free(ftpc->account);
++  ftpc->account = NULL;
++  free(ftpc->alternative_to_user);
++  ftpc->alternative_to_user = NULL;
+   free(ftpc->prevpath);
+   ftpc->prevpath = NULL;
+   free(ftpc->server_os);
+@@ -4326,11 +4330,31 @@ static CURLcode ftp_setup_connection(struct connectdata *conn)
+   struct Curl_easy *data = conn->data;
+   char *type;
+   struct FTP *ftp;
++  struct ftp_conn *ftpc = &conn->proto.ftpc;
+ 
+-  conn->data->req.protop = ftp = calloc(sizeof(struct FTP), 1);
++  ftp = calloc(sizeof(struct FTP), 1);
+   if(NULL == ftp)
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
++  conn->data->req.protop = ftp;
++
+   ftp->path = &data->state.up.path[1]; /* don't include the initial slash */
+ 
+   /* FTP URLs support an extension like ";type=<typecode>" that
+@@ -4366,7 +4390,9 @@ static CURLcode ftp_setup_connection(struct connectdata *conn)
+   /* get some initial data into the ftp struct */
+   ftp->transfer = FTPTRANSFER_BODY;
+   ftp->downloadsize = 0;
+-  conn->proto.ftpc.known_filesize = -1; /* unknown size for now */
++  ftpc->known_filesize = -1; /* unknown size for now */
++  ftpc->use_ssl = data->set.use_ssl;
++  ftpc->ccc = data->set.ftp_ccc;
+ 
+   return CURLE_OK;
+ }
+diff --git a/lib/ftp.h b/lib/ftp.h
+index 984347f..163dcb3 100644
+--- a/lib/ftp.h
++++ b/lib/ftp.h
+@@ -116,6 +116,8 @@ struct FTP {
+    struct */
+ struct ftp_conn {
+   struct pingpong pp;
++  char *account;
++  char *alternative_to_user;
+   char *entrypath; /* the PWD reply when we logged on */
+   char **dirs;   /* realloc()ed array for path components */
+   int dirdepth;  /* number of entries used in the 'dirs' array */
+@@ -141,6 +143,9 @@ struct ftp_conn {
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
+index 4d96f6b..a91bb70 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -2126,7 +2126,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     arg = va_arg(param, long);
+     if((arg < CURLUSESSL_NONE) || (arg >= CURLUSESSL_LAST))
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+-    data->set.use_ssl = (curl_usessl)arg;
++    data->set.use_ssl = (unsigned char)arg;
+     break;
+ 
+   case CURLOPT_SSL_OPTIONS:
+diff --git a/lib/url.c b/lib/url.c
+index dfbde3b..f84375c 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1257,10 +1257,24 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
+-      if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_SSH) {
++#ifdef USE_SSH
++      else if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+           continue;
+       }
++#endif
++#ifndef CURL_DISABLE_FTP
++      else if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_FTP) {
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
+       if(!needle->bits.httpproxy || (needle->handler->flags&PROTOPT_SSL) ||
+          needle->bits.tunnel_proxy) {
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 168f874..51b793b 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1730,8 +1730,6 @@ struct UserDefined {
+   void *ssh_keyfunc_userp;         /* custom pointer to callback */
+   enum CURL_NETRC_OPTION
+        use_netrc;        /* defined in include/curl.h */
+-  curl_usessl use_ssl;   /* if AUTH TLS is to be attempted etc, for FTP or
+-                            IMAP or POP3 or others! */
+   long new_file_perms;    /* Permissions to use when creating remote files */
+   long new_directory_perms; /* Permissions to use when creating remote dirs */
+   long ssh_auth_types;   /* allowed SSH auth types */
+@@ -1851,6 +1849,8 @@ struct UserDefined {
+   BIT(http09_allowed); /* allow HTTP/0.9 responses */
+   BIT(mail_rcpt_allowfails); /* allow RCPT TO command to fail for some
+                                 recipients */
++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for FTP or
++                              IMAP or POP3 or others! (type: curl_usessl)*/
+ };
+ 
+ struct Names {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
new file mode 100644
index 0000000000..b04a77de25
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
@@ -0,0 +1,55 @@
+From cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 10 Mar 2023 09:22:43 +0100
+Subject: [PATCH] url: only reuse connections with same GSS delegation
+
+Reported-by: Harry Sintonen
+Closes #10731
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5]
+CVE: CVE-2023-27536
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c     | 6 ++++++
+ lib/urldata.h | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index f84375c..87f4eb0 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1257,6 +1257,11 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
++      /* GSS delegation differences do not actually affect every connection
++         and auth method, but this check takes precaution before efficiency */
++      if(needle->gssapi_delegation != check->gssapi_delegation)
++	continue;
++
+ #ifdef USE_SSH
+       else if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+@@ -1708,6 +1713,7 @@ static struct connectdata *allocate_conn(struct Curl_easy *data)
+   conn->fclosesocket = data->set.fclosesocket;
+   conn->closesocket_client = data->set.closesocket_client;
+   conn->lastused = Curl_now(); /* used now */
++  conn->gssapi_delegation = data->set.gssapi_delegation;
+ 
+   return conn;
+   error:
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 51b793b..b8a611b 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1118,6 +1118,7 @@ struct connectdata {
+                               handle */
+   BIT(sock_accepted); /* TRUE if the SECONDARYSOCKET was created with
+                          accept() */
++  long gssapi_delegation; /* inherited from set.gssapi_delegation */
+ };
+ 
+ /* The end of connectdata. */
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
new file mode 100644
index 0000000000..5cd11ef88b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
@@ -0,0 +1,29 @@
+Backport of:
+
+From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 10 Mar 2023 08:22:51 +0100
+Subject: [PATCH] url: fix the SSH connection reuse check
+
+Reported-by: Harry Sintonen
+Closes #10735
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27538.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+CVE: CVE-2023-27538
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1233,7 +1233,7 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
+-      if(get_protocol_family(needle->handler->protocol) == PROTO_FAMILY_SSH) {
++      if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+           continue;
+       }
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index a7f4f5748f..2e3bcb2c6e 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -44,6 +44,11 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-43552.patch \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27534.patch \
+           file://CVE-2023-27533.patch \
+           file://CVE-2023-27538.patch \
+           file://CVE-2023-27535-pre1.patch \
+           file://CVE-2023-27535.patch \
+           file://CVE-2023-27536.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


