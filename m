Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB375106ACF9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:05:37 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3876.1773356735751236918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Nw+Mg7tr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260312230536028bbf6661000207cd-qesnte@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260312230536028bbf6661000207cd
        for <openembedded-core@lists.openembedded.org>;
        Fri, 13 Mar 2026 00:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dTuFYmgLXeaOpJVAgoC9jG0oIuH5P/KSSFGj877o/Zk=;
 b=Nw+Mg7trH80D1LhCICoall6WqhMnTTO4fVq1tzkjf0UGn+Mg2sGnF/04CR+VKBtC1LSZ6c
 fozu0B9IRF/uJBrNhoeoC/G3RcZqkRdKLPkFKUpzWqWKL9VRhxMHxaYkjFJRWVkeQkwwgaoq
 fJeCNts/MjlY5ryWcrMj4w7T+4yy3xDTP5iTjuVBd/qECnbwoRZJ4f3K6nn7lpRjH66C/ygv
 /yZAUwUjp5CqTG23sHmCLhiubLOCeGankjEPNYsuICDwf7v5u1Om57HKV+WGzqK2E1+6jhEh
 XJDZGgP52Fiv7ImD01+ZiPbvbj+cj9UC9qOw5+48dNjJnZwEdfSwCcWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 3/4] curl: patch CVE-2026-3784
Date: Fri, 13 Mar 2026 00:05:03 +0100
Message-Id: <20260312230504.76461-3-peter.marko@siemens.com>
In-Reply-To: <20260312230504.76461-1-peter.marko@siemens.com>
References: <20260312230504.76461-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233010

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].
Additionally pick part of clenup patch which resolves conflicts.

[1] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...d-macros-warnings-and-related-tidy-u.patch |  44 +++++
 .../curl/curl/CVE-2026-3784-02.patch          | 162 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   2 +
 3 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784-02.patch

diff --git a/meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch b/meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
new file mode 100644
index 0000000000..b4af8421f5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
@@ -0,0 +1,44 @@
+From 5fa5cb382560316a55f0954f1e8cebdbd6568cfb Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 13 Feb 2026 17:05:36 +0100
+Subject: [PATCH] build: fix `-Wunused-macros` warnings, and related tidy-ups
+
+- fix internal macro `AN_APPLE_OS` reused between sources without
+  resetting it. It may potentially have left the system sha256
+  function unused.
+- fix to define `WOLFSSL_OPTIONS_IGNORE_SYS` so that it always applies
+  to wolfSSL headers, also during feature detection.
+- md4, md5, sha256: simplify fallback logic.
+- delete 20+ unused macros.
+- scope or move macros to avoid `-Wunused-macros` warnings.
+- examples: delete unused code.
+
+The warning detects macros defined but not used within the same C
+source. It does not warn for macros defined in headers. It also works
+with unity builds, but to a lesser extent.
+
+Closes #20593
+
+<picked only part relevant for CVE-2026-3784>
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5fa5cb382560316a55f0954f1e8cebdbd6568cfb]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/url.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 3c0d913432..f0b6b0d5b2 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -639,10 +639,6 @@ socks_proxy_info_matches(const struct proxy_info *data,
+     return FALSE;
+   return TRUE;
+ }
+-#else
+-/* disabled, will not get called */
+-#define proxy_info_matches(x,y) FALSE
+-#define socks_proxy_info_matches(x,y) FALSE
+ #endif
+ 
+ /* A connection has to have been idle for less than 'conn_max_idle_ms'
diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784-02.patch b/meta/recipes-support/curl/curl/CVE-2026-3784-02.patch
new file mode 100644
index 0000000000..84f37374c6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784-02.patch
@@ -0,0 +1,162 @@
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+CVE: CVE-2026-3784
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3ef86e97afb856fb364]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/url.c                        | 29 +++++++----------------------
+ tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
+ tests/http/testenv/curl.py       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 25 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index eabeb776ab..bdc183b45b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -615,30 +615,15 @@ proxy_info_matches(const struct proxy_info *data,
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     curl_strequal(data->host.name, needle->host.name))
++     curl_strequal(data->host.name, needle->host.name)) {
++
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
+     return TRUE;
+-
++  }
+   return FALSE;
+ }
+-
+-static bool
+-socks_proxy_info_matches(const struct proxy_info *data,
+-                         const struct proxy_info *needle)
+-{
+-  if(!proxy_info_matches(data, needle))
+-    return FALSE;
+-
+-  /* the user information is case-sensitive
+-     or at least it is not defined as case-insensitive
+-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-
+-  /* curl_strequal does a case insensitive comparison,
+-     so do not use it here! */
+-  if(Curl_timestrcmp(data->user, needle->user) ||
+-     Curl_timestrcmp(data->passwd, needle->passwd))
+-    return FALSE;
+-  return TRUE;
+-}
+ #endif
+ 
+ /* A connection has to have been idle for less than 'conn_max_idle_ms'
+@@ -954,7 +939,7 @@ static bool url_match_proxy_use(struct connectdata *conn,
+     return FALSE;
+ 
+   if(m->needle->bits.socksproxy &&
+-    !socks_proxy_info_matches(&m->needle->socks_proxy,
++    !proxy_info_matches(&m->needle->socks_proxy,
+                               &conn->socks_proxy))
+     return FALSE;
+ 
+diff --git a/tests/http/test_13_proxy_auth.py b/tests/http/test_13_proxy_auth.py
+index 080adef187..33fb211e99 100644
+--- a/tests/http/test_13_proxy_auth.py
++++ b/tests/http/test_13_proxy_auth.py
+@@ -169,3 +169,23 @@ class TestProxyAuth:
+             '--negotiate', '--proxy-user', 'proxy:proxy'
+         ])
+         r1.check_response(count=1, http_status=200)
++
++    def test_13_10_tunnels_mixed_auth(self, env: Env, httpd, configures_httpd):
++        self.httpd_configure(env, httpd)
++        curl = CurlClient(env=env)
++        url1 = f'http://localhost:{env.http_port}/data.json?1'
++        url2 = f'http://localhost:{env.http_port}/data.json?2'
++        url3 = f'http://localhost:{env.http_port}/data.json?3'
++        xargs1 = curl.get_proxy_args(proxys=False, tunnel=True)
++        xargs1.extend(['--proxy-user', 'proxy:proxy']) # good auth
++        xargs2 = curl.get_proxy_args(proxys=False, tunnel=True)
++        xargs2.extend(['--proxy-user', 'ungood:ungood']) # bad auth
++        xargs3 = curl.get_proxy_args(proxys=False, tunnel=True)
++        # no auth
++        r = curl.http_download(urls=[url1, url2, url3], alpn_proto='http/1.1', with_stats=True,
++                               url_options={url1: xargs1, url2: xargs2, url3: xargs3})
++        # only url1 succeeds, others fail, no connection reuse
++        assert r.stats[0]['http_code'] == 200, f'{r.dump_logs()}'
++        assert r.stats[1]['http_code'] == 0, f'{r.dump_logs()}'
++        assert r.stats[2]['http_code'] == 0, f'{r.dump_logs()}'
++        assert r.total_connects == 3, f'{r.dump_logs()}'
+diff --git a/tests/http/testenv/curl.py b/tests/http/testenv/curl.py
+index 4fc11c7923..1f812a1c2e 100644
+--- a/tests/http/testenv/curl.py
++++ b/tests/http/testenv/curl.py
+@@ -635,7 +635,8 @@ class CurlClient:
+                       with_tcpdump: bool = False,
+                       no_save: bool = False,
+                       limit_rate: Optional[str] = None,
+-                      extra_args: Optional[List[str]] = None):
++                      extra_args: Optional[List[str]] = None,
++                      url_options: Optional[Dict[str,List[str]]] = None):
+         if extra_args is None:
+             extra_args = []
+         if no_save:
+@@ -653,6 +654,7 @@ class CurlClient:
+             ])
+         return self._raw(urls, alpn_proto=alpn_proto, options=extra_args,
+                          with_stats=with_stats,
++                         url_options=url_options,
+                          with_headers=with_headers,
+                          with_profile=with_profile,
+                          with_tcpdump=with_tcpdump)
+@@ -929,6 +931,7 @@ class CurlClient:
+ 
+     def _raw(self, urls, intext='', timeout=None, options=None, insecure=False,
+              alpn_proto: Optional[str] = None,
++             url_options=None,
+              force_resolve=True,
+              with_stats=False,
+              with_headers=True,
+@@ -938,7 +941,8 @@ class CurlClient:
+         args = self._complete_args(
+             urls=urls, timeout=timeout, options=options, insecure=insecure,
+             alpn_proto=alpn_proto, force_resolve=force_resolve,
+-            with_headers=with_headers, def_tracing=def_tracing)
++            with_headers=with_headers, def_tracing=def_tracing,
++            url_options=url_options)
+         r = self._run(args, intext=intext, with_stats=with_stats,
+                       with_profile=with_profile, with_tcpdump=with_tcpdump)
+         if r.exit_code == 0 and with_headers:
+@@ -948,8 +952,10 @@ class CurlClient:
+     def _complete_args(self, urls, timeout=None, options=None,
+                        insecure=False, force_resolve=True,
+                        alpn_proto: Optional[str] = None,
++                       url_options=None,
+                        with_headers: bool = True,
+                        def_tracing: bool = True):
++        url_sep = []
+         if not isinstance(urls, list):
+             urls = [urls]
+ 
+@@ -975,7 +981,13 @@ class CurlClient:
+             active_options = options[options.index('--next') + 1:]
+ 
+         for url in urls:
+-            u = urlparse(urls[0])
++            args.extend(url_sep)
++            if url_options is not None:
++                url_sep = ['--next']
++
++            u = urlparse(url)
++            if url_options is not None and url in url_options:
++                args.extend(url_options[url])
+             if options:
+                 args.extend(options)
+             if alpn_proto is not None:
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 31d34c5390..7211c43afd 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -23,6 +23,8 @@ SRC_URI = " \
     file://CVE-2026-1965-01.patch \
     file://CVE-2026-1965-02.patch \
     file://CVE-2026-3783.patch \
+    file://0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch \
+    file://CVE-2026-3784-02.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

