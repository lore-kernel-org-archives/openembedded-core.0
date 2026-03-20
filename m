Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B6C1099B54
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1974.1774048051525649036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f+RxC5qE;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so9775485e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048050; x=1774652850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1Lc8MB21ZmNR2d1DWEUjdosliVLeo73l0zv05E9HQ=;
        b=f+RxC5qEvKPGtgQKur2/Di7uzVXtyy202aB5wcoh2EyhiqgRnJQwPTjTfck2CcjvXv
         iOSHpxD2INu12xmtbNRqy6zr8DpyZwyFXbexKRx0xDrg6mnvsdGAURI5XlArbT7BkDMG
         zeJkP4DzAClMctLFVIJZ86urX1DKkrLPiGdVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048050; x=1774652850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr1Lc8MB21ZmNR2d1DWEUjdosliVLeo73l0zv05E9HQ=;
        b=O/MjvCFo9xMo9iC+dI6V8eQUi9yDDWtiEl96BYqSW2FVQ6PJ2fknmvtaxHQ3y70CJm
         MmG9+b/jnLq1qrinebonaPGmDTe2yDGBSnJfifMCOtyktGJruCn1xIca8e0Qt62/JYBF
         tTZ3y951cj4bOaBSRJOr+ue3nXUqnqRxklOIEWjGthcYZbo4yJvycQisF/f1eVyfxtg0
         xhrxrIlAiE06IwcU2Af0Ojmyo0K9J+nFL/MFoDJXVLMAm3KgwORvzOc2ae8GeypONd5g
         11HAPxdx6ZNsPyZMMe+cyUBx0sJlvUafYc9oIi+9+kbGms3wVqjJEtnuaIoCaAFQslGy
         ueXw==
X-Gm-Message-State: AOJu0YxO5Jv7H5eGqgiR6PTkHDF/oX2P61C78OezTRWsj9oF+gHukix6
	o309wQA+TuCTZVvqqQYOczqBKBDSh58PJ/o3qCu2qkudv47jBVs8MHPvR+PdVdaiHj9R4rS71ll
	UxUs8
X-Gm-Gg: ATEYQzya0Ym3g1Wqf7e6cZX7blEo2NvTEF91gLpkvFWQB9xNQR87WAZ4Gsz3tKss0aQ
	mvvy8fJPPol80IIY0X2UQ8a5Bthi0KVhHvRLATnMziE063eWLMEM5bviAzXch+1I9BhslvoKkX3
	YnX67M09CcIEmZqJftfkOEV+RFkaJb4AxYo/Ou00Jvy7WaI5rLZ6TeEtmizExYTFF/DP4vB/KRx
	aU5ssT+Ay5WfN3Lsm6iwLThCaw4dLvo0gf9Dl70fcVRmgXLK9piZ8S51c0wyFDtvm4Yu5U5S+OS
	Gwa8XAqMumohuhz1yXu2kfdCjHLbuXbdz/Mg84Jy8vAE9PHD7XikVF8XACk17EyjsKowzRK6T3T
	peDj0weD7EoXMp0aD5ArJrtvE5RB43eneBFGTdwQirjo6ZwEPJzM3SKmC31wrb32ZmIxror1IYD
	SYDmb+h+FkeHJVea0uzh5COE46P5xneoF9Qv3g9+CEB7iIHVzmHU2mvWl1cAZ0V/1ckefJ1DkmY
	pUWPQsL0AYRHYyH7+UdLyh1GV0=
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr63965965e9.12.1774048049507;
        Fri, 20 Mar 2026 16:07:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 6/7] curl: patch CVE-2026-3784
Date: Sat, 21 Mar 2026 00:07:21 +0100
Message-ID: <dcbf96f16f009db19566e5292a19e3a18f06accd.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233642

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].
Additionally pick part of clenup patch which resolves conflicts.

[1] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...d-macros-warnings-and-related-tidy-u.patch |  44 +++++
 .../curl/curl/CVE-2026-3784-02.patch          | 162 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   2 +
 3 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784-02.patch

diff --git a/meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch b/meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
new file mode 100644
index 00000000000..b4af8421f53
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
index 00000000000..84f37374c64
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
index 31d34c53909..7211c43afd2 100644
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

