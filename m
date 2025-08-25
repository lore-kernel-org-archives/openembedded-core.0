Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62B5CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:51:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.39365.1756129869979853324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=drGz9x7n;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202508251351084c289f578cfcd7339d-54cjaz@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202508251351084c289f578cfcd7339d
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Aug 2025 15:51:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=49uYHoVomAwBSQJhcGZgaAGrykoEgQJaR4PbYdjy5Wo=;
 b=drGz9x7nBoK0WrBefQW2So6MdVQj1ZqZ70uCn4MD8EGaj72PWTjXNCtoENtd4yGibKIUov
 oBtqV4T5ZxCcA7bRkTrR0FuP6b2/OPA/pxoOB4hg0e/8hLV0YOrGwQAqxLbRmSuME/kMlSaL
 x5D7U2a+qScrnm0KXKLGWuI9U8g6ZYQezdvgRD4HMqFCk3fg2KGQZvxB8RWGJ5UhycAI2oWQ
 YxC46ROOtaPWa6DZG+gaTQJImi9jCwVlVQ5OI6Qbrn8MgIsJ4VocV13NRLzNmhpXFm6GEA07
 ak3sLaVocZ1nlHES18mhrVqvEuvcurlKLgTFQvua8DwYh7W9XS5PIg2A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] nginx: patch CVE-2025-53859
Date: Mon, 25 Aug 2025 15:50:21 +0200
Message-Id: <20250825135021.451414-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 13:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222408

From: Peter Marko <peter.marko@siemens.com>

Pick patch from nginx site which is also mentioned in [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-53859

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nginx/files/CVE-2025-53859.patch          | 131 ++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
new file mode 100755
index 0000000000..6f689938f4
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
@@ -0,0 +1,131 @@
+CVE: CVE-2025-53859
+Upstream-Status: Backport [https://nginx.org/download/patch.2025.smtp.txt]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
+index 1167df3fb..d3be7f3b3 100644
+--- a/src/mail/ngx_mail_handler.c
++++ b/src/mail/ngx_mail_handler.c
+@@ -523,7 +523,7 @@ ngx_mail_starttls_only(ngx_mail_session_t *s, ngx_connection_t *c)
+ ngx_int_t
+ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+ {
+-    u_char     *p, *last;
++    u_char     *p, *pos, *last;
+     ngx_str_t  *arg, plain;
+ 
+     arg = s->args.elts;
+@@ -555,7 +555,7 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    s->login.data = p;
++    pos = p;
+ 
+     while (p < last && *p) { p++; }
+ 
+@@ -565,7 +565,8 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    s->login.len = p++ - s->login.data;
++    s->login.len = p++ - pos;
++    s->login.data = pos;
+ 
+     s->passwd.len = last - p;
+     s->passwd.data = p;
+@@ -583,24 +584,26 @@ ngx_int_t
+ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
+     ngx_uint_t n)
+ {
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, login;
+ 
+     arg = s->args.elts;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login username: \"%V\"", &arg[n]);
+ 
+-    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
+-    if (s->login.data == NULL) {
++    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
++    if (login.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->login, &arg[n]) != NGX_OK) {
++    if (ngx_decode_base64(&login, &arg[n]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH LOGIN command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->login = login;
++
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login username: \"%V\"", &s->login);
+ 
+@@ -611,7 +614,7 @@ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
+ ngx_int_t
+ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, passwd;
+ 
+     arg = s->args.elts;
+ 
+@@ -620,18 +623,19 @@ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
+                    "mail auth login password: \"%V\"", &arg[0]);
+ #endif
+ 
+-    s->passwd.data = ngx_pnalloc(c->pool,
+-                                 ngx_base64_decoded_length(arg[0].len));
+-    if (s->passwd.data == NULL) {
++    passwd.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
++    if (passwd.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->passwd, &arg[0]) != NGX_OK) {
++    if (ngx_decode_base64(&passwd, &arg[0]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH LOGIN command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->passwd = passwd;
++
+ #if (NGX_DEBUG_MAIL_PASSWD)
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login password: \"%V\"", &s->passwd);
+@@ -674,24 +678,26 @@ ngx_int_t
+ ngx_mail_auth_cram_md5(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+     u_char     *p, *last;
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, login;
+ 
+     arg = s->args.elts;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth cram-md5: \"%V\"", &arg[0]);
+ 
+-    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
+-    if (s->login.data == NULL) {
++    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
++    if (login.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->login, &arg[0]) != NGX_OK) {
++    if (ngx_decode_base64(&login, &arg[0]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH CRAM-MD5 command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->login = login;
++
+     p = s->login.data;
+     last = p + s->login.len;
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index bcc384bd8a..4a7be2f99a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
     file://0001-configure-libxslt-conf.patch \
+    file://CVE-2025-53859.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd

