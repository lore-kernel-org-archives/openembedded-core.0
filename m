Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29087109E54E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 05:06:39 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40965.1774501586562659914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 22:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ldRzz0/N;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8329; q=dns/txt;
  s=iport01; t=1774501586; x=1775711186;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=12J7YMe+JkJNtdHfiCJzTP2gzINYs9Elaieqt8g4DUQ=;
  b=ldRzz0/Nthwe000vvMYIZaz3WV/6ZUgmUL8fivJrgTXlXS6oiwJ5bAhm
   0tQeG5zVyrrWAmnuGPsaVb9CdJjY7FK56zcTPrrKGUa1r/15Y/ugGXAe7
   Ooai46qAq++P8q/qthfNi/eFnIXFVI5y1s/kC9Ef7jNzj7sQGfAyYpVow
   4qme9mGsxtNpZKmAanIn92MidwG7P7H9MjqjmoawM5NDLEcYZtNwYF228
   T/YQlaldmFKfIOiMKVL3oyXtz4DZ1LkO1wUGzJfhLjj4DnGRmzf5yDEdl
   C60U2ptRNoNp36FwlEehraYHsYsfB7q+sw/Moz8H8zmLZURlo5lEIMw44
   A==;
X-CSE-ConnectionGUID: 5YXvWUMtToycLTFz4hpa2g==
X-CSE-MsgGUID: V7mYclGKRQiLDAgQ/eCBLA==
X-IPAS-Result: =?us-ascii?q?A0BPDgD2vcRp/47/Ja1aHgEBCxIMggULgkgPcV5DSZQqg?=
 =?us-ascii?q?iGgHA8BAQEPRA0EAQGSLAImNwYOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgEtCwEYAVkDAQJaIyGDAgGCcwMRBrEtgXkzgQGDK?=
 =?us-ascii?q?AExBQkCAkABT9smAQsUAYE4hTyIG1sYAYR6JxsbgXKEfYEFgVwBAQEBAYghB?=
 =?us-ascii?q?IIigQ6BYYN7BoUBhx9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbB?=
 =?us-ascii?q?wWCBA+IbXRtgROEFigDCxgNSBEsNxQbBD5uB4xeM4FBUxkHASwtBy0BGw4BA?=
 =?us-ascii?q?YI9C5MjE5ABgiGhDgoog3SMHpU6GjOFW6UQmQaOCZZQhGiBfiaBRwsHcBU7g?=
 =?us-ascii?q?mcJFjMZD444g2mBf4MUUVzDAiYyAgEIMgEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:Gkau8qKekxZeuspmFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgz0On
 GZOCG/UafmIZWejedx0btnj8EIGvZ/WmIVjGgYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGQpajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0zPXEoArA95tpwEGpqy
 dIKdDAVZ0qM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLolgeu1g3P/ehVTqUmeouw85G27IAlZjumyYYOOK4TRLSlTtnjHo
 1PN+0vaOCgbEPC2xgPC/1mGosaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Art3iqr/MYipy33WkuYHEAIaV5o+eYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90cu7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/9UlcBeOktK0Es
 xbAs1DNOE=
X-Talos-CUID: 9a23:QLIKcm5b9fnEwTrXvtssqX8kBP8YV2Hhy2bbB3OWGzppULTPRgrF
X-Talos-MUID: 9a23:SxZuIwl2yKWMHDIz2grPdnpca8JZ6KCBK3o0kLEqksa9ciFbERO02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,141,1770595200"; 
   d="scan'208";a="697913903"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Mar 2026 05:06:25 +0000
Received: from sjc-ads-7443.cisco.com (sjc-ads-7443.cisco.com [10.30.220.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 860D1180000B4
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:06:25 +0000 (GMT)
Received: by sjc-ads-7443.cisco.com (Postfix, from userid 1840713)
	id 2DA35CCFFC1; Wed, 25 Mar 2026 22:06:25 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/3] curl: fix CVE-2026-3784
Date: Wed, 25 Mar 2026 22:04:36 -0700
Message-ID: <20260326050435.2019528-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.228, sjc-ads-7443.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233950

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] as referenced in [2]
which is mentioned in [3]:

[1] https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3ef86e97afb856fb364
[2] https://curl.se/docs/CVE-2026-3784.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-3784

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../curl/curl/CVE-2026-3784.patch             | 183 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 0000000000..abf2fc0625
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,183 @@
+From 0bfc0eca3c3858f3a3d838b9a2fff258d4b4d088 Mon Sep 17 00:00:00 2001
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
+
+Backport Changes:
+- In lib/url.c, within proxy_info_matches(), replace strcasecompare()
+  with the upstream fixed curl_strequal().
+  the use of strcasecompare(data->host.name, needle->host.name) was introduced
+  in curl-7_87_0 by this commit.
+  https://github.com/curl/curl/commit/3f039dfd6f0a1d806b94cc2d5548926182485b7e
+- In lib/url.c, a manual modification was made in ConnectionExists()
+  by replacing socks_proxy_info_matches(&m->needle->socks_proxy, &conn->http_proxy)
+  with proxy_info_matches(&needle->socks_proxy, &check->socks_proxy).
+  The socks_proxy_info_matches check in the if block was originally introduced
+  in curl-8_14_0 via the following commit:
+  https://github.com/curl/curl/commit/35e1e7be22df543ead520392af1d8f022e77203c
+- In tests/http/testenv/curl.py file, updated the http_download() method
+  with parameter url_options: Optional[Dict[str,List[str]]] of upstream fixed.
+  The use of Optional was introduced curl-7_88_0 by this commit
+  https://github.com/curl/curl/commit/33ac97e1cb99e04f4833a2fa70636a5bbc23c4ef
+
+(cherry picked from commit 5f13a7645e565c5c1a06f3ef86e97afb856fb364)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ lib/url.c                        | 28 +++++++---------------------
+ tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
+ tests/http/testenv/curl.py       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 24 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 6d212680dc..528f9a3b23 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -703,30 +703,16 @@ proxy_info_matches(const struct proxy_info *data,
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     strcasecompare(data->host.name, needle->host.name))
+-    return TRUE;
++     curl_strequal(data->host.name, needle->host.name)) {
+
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
++    return TRUE;
++  }
+   return FALSE;
+ }
+
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
+ #else
+ /* disabled, won't get called */
+ #define proxy_info_matches(x,y) FALSE
+@@ -1085,7 +1071,7 @@ ConnectionExists(struct Curl_easy *data,
+       continue;
+
+     if(needle->bits.socksproxy &&
+-      !socks_proxy_info_matches(&needle->socks_proxy,
++      !proxy_info_matches(&needle->socks_proxy,
+                                 &check->socks_proxy))
+       continue;
+
+diff --git a/tests/http/test_13_proxy_auth.py b/tests/http/test_13_proxy_auth.py
+index abeae0100e..1bf8429a3f 100644
+--- a/tests/http/test_13_proxy_auth.py
++++ b/tests/http/test_13_proxy_auth.py
+@@ -155,3 +155,23 @@ class TestProxyAuth:
+                          protocol='HTTP/2' if proto == 'h2' else 'HTTP/1.1')
+         assert self.get_tunnel_proto_used(r) == 'HTTP/2' \
+             if tunnel == 'h2' else 'HTTP/1.1'
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
+index bfd6fdefc7..4de0082c4f 100644
+--- a/tests/http/testenv/curl.py
++++ b/tests/http/testenv/curl.py
+@@ -425,7 +425,8 @@ class CurlClient:
+                       with_headers: bool = False,
+                       with_profile: bool = False,
+                       no_save: bool = False,
+-                      extra_args: List[str] = None):
++                      extra_args: List[str] = None,
++                      url_options: Optional[Dict[str,List[str]]] = None):
+         if extra_args is None:
+             extra_args = []
+         if no_save:
+@@ -445,6 +446,7 @@ class CurlClient:
+             ])
+         return self._raw(urls, alpn_proto=alpn_proto, options=extra_args,
+                          with_stats=with_stats,
++                         url_options=url_options,
+                          with_headers=with_headers,
+                          with_profile=with_profile)
+
+@@ -582,6 +584,7 @@ class CurlClient:
+
+     def _raw(self, urls, intext='', timeout=None, options=None, insecure=False,
+              alpn_proto: Optional[str] = None,
++             url_options=None,
+              force_resolve=True,
+              with_stats=False,
+              with_headers=True,
+@@ -590,7 +593,8 @@ class CurlClient:
+         args = self._complete_args(
+             urls=urls, timeout=timeout, options=options, insecure=insecure,
+             alpn_proto=alpn_proto, force_resolve=force_resolve,
+-            with_headers=with_headers, def_tracing=def_tracing)
++            with_headers=with_headers, def_tracing=def_tracing,
++            url_options=url_options)
+         r = self._run(args, intext=intext, with_stats=with_stats,
+                       with_profile=with_profile)
+         if r.exit_code == 0 and with_headers:
+@@ -602,8 +606,10 @@ class CurlClient:
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
+@@ -621,7 +627,13 @@ class CurlClient:
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
+--
+2.44.1
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 07e532721f..e08dc6d309 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2026-1965_p1.patch \
     file://CVE-2026-1965_p2.patch \
     file://CVE-2026-3783.patch \
+    file://CVE-2026-3784.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.44.4


