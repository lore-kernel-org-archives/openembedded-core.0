Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F82C7618E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 02:28:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.11413.1682562488570945837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 19:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=TKIYYYtr;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b62d2f729so6238046b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 19:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682562487; x=1685154487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+UTKXTco/frQP99D0UgHen8izMRkVnwc9igLZh3Tx0=;
        b=TKIYYYtr/5ko82TsH+5oz8ML9yM+odf0QjjYc2d7A6GGXsIzmCDUSjVS5UPuwCHTj/
         cKTT+06j+jrN7Kay/uUsTE2alw49AvUtmqCvrhXPjk31T9R/g8o3t/LQZFkQ+zYZ2MAE
         gF4jt8xDgr4PT6tVSFBLMNYtUX0ujfBj5klmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682562487; x=1685154487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+UTKXTco/frQP99D0UgHen8izMRkVnwc9igLZh3Tx0=;
        b=Pxx1nbsUUjDGN1r5hk4JpI9t33Gefbk+jiuwhRRPSvBBaCDoZGQkp9mSy2sSGrxi67
         dib6qINZ8SBehPciEt7jR9dK6P50W9SIzmwu7YyeiZP1xYl0pvbveiQqGTfMtIqHneiM
         9UInAOjgLG5xeocAow7Vu+eG80MdSE1O5jqhZC1MeG9rOJEbLTsr1QWmmtuRC3P7icS4
         tbg3zNgXdJzWBZTe/cM4N3cO6sktfQiuLodQ7jT3dOEyl1qQFfnYuDWXr7NwH4BB2+nG
         zKzVsaMVUKzIVfMkTX5cbygaJM7PLSAJM4kIvFR29UWtkonOcwwUdLIBKRhCaB36QvOG
         TeGA==
X-Gm-Message-State: AAQBX9e975xVDSMuKKRHyXE8VTgHLBVA2f71IO3fTaJG8n8sdRL3/w1e
	qxz4+WVdt3aexdtixnTLCIFJeAZ+nOdXpYla3J8=
X-Google-Smtp-Source: AKy350YY+/3Zo0rcPt4bM+i8sv1rG5TdEQ9iHe9ArqM+k03TLDB02cgTFf2LzR3B29482v58LVrXVA==
X-Received: by 2002:a05:6a20:1610:b0:f5:ff1c:f6a8 with SMTP id l16-20020a056a20161000b000f5ff1cf6a8mr11465310pzj.20.1682562487167;
        Wed, 26 Apr 2023 19:28:07 -0700 (PDT)
Received: from MVIN00020.mvista.com ([106.201.70.155])
        by smtp.gmail.com with ESMTPSA id p5-20020a63c145000000b0051ba9d772f9sm10423792pgi.59.2023.04.26.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 19:28:06 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] curl: Security fix CVE-2023-27533, CVE-2023-27535 and CVE-2023-27536
Date: Thu, 27 Apr 2023 07:55:55 +0530
Message-Id: <20230427022555.63362-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 02:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180462

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=ubuntu/focal-security & https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684 & https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37878 & https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a64c & https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1 & https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2023-27533.patch            |  59 +++++
 .../curl/curl/CVE-2023-27535-pre1.patch       | 236 ++++++++++++++++++
 .../curl/curl/CVE-2023-27535.patch            | 170 +++++++++++++
 .../curl/curl/CVE-2023-27536.patch            |  55 ++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   4 +
 5 files changed, 524 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch

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
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 46ee25da3a..32d18ddb3a 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -45,6 +45,10 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27534.patch \
            file://CVE-2023-27538.patch \
+           file://CVE-2023-27533.patch \
+           file://CVE-2023-27535-pre1.patch \
+           file://CVE-2023-27535.patch \
+           file://CVE-2023-27536.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


