Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12B1106F31E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:25:50 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44904.1774520744128939475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M6XIWHJB;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8406; q=dns/txt;
  s=iport01; t=1774520744; x=1775730344;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xMqkfBzed6SASe1A45yW84d86I9pqslfEuBjxMjQJSw=;
  b=M6XIWHJBEr2bVOFSRB6lF6nD8G52s2lZ/JChH/KLMrLrMOeFJHZQkO9y
   tf5NEyHkKLi8OS4++6zGaB3BtHqU4eJdkDv7UCS4hlm/TeuNRnNaBwPKy
   4Y2/J3YVz1O3CDrdy/vooJGBvzTDJG8fud46B4oRHmPqX84pPfr6UVLHV
   hr5JKb1hcuD7YmEFmXuaOFCQffGrysWM/bSU9VzhiqpFX8A5JU8LEQQ80
   Fyw5NDj95JhFVTdZ4CMJICUAIreXG56LeI4EaS95RRoylYchutMykiTja
   /ooydwiuL+EEwoErYpF/ebdqXL/FGAjgi+5JLDxEWePbNEpJ7NmpTR6Bx
   w==;
X-CSE-ConnectionGUID: w7U+nm3XT8m7aq4eCGL/iA==
X-CSE-MsgGUID: VLozbqPZQaOZWEScLx2oJQ==
X-IPAS-Result: =?us-ascii?q?A0DhDAD6B8Vp/5L/Ja1aHgEBCxIMgWsQDwuCRA9xXkNJl?=
 =?us-ascii?q?CqCIQOgGQ8BAQEPRA0EAQGFBwKNIwImNwYOAQIEAQEBAQMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgZgwIBg?=
 =?us-ascii?q?nMDEQa3LIF5M4EBgygBMQUJAgJAAU+1CAELFAGBOIU8iBtbGAGEeicbG4Fyh?=
 =?us-ascii?q?H2BBYFcAQEBAQGIIQSCIoEOgWGDVwaEfocfSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EMGwcFgWAPiG10bYEThBEoAwsYDUgRLDcUGwQ+bgeMSTGBQ?=
 =?us-ascii?q?VMZBwEsLQctARsOAQGCPQuTIxOQAYIhoQ4KKIN0jB6VOhozhVulEJkGjgmWU?=
 =?us-ascii?q?IRogX4mgUcLB3AVO4JnCRYzGQ+OOINpgX+DFFFcwAAmMgIBCDIBAQcCBw0DC?=
 =?us-ascii?q?4FokX0BAQ?=
IronPort-Data: A9a23:XCehzqAm6y8mOxVW/23iw5YqxClBgxIJ4kV8jS/XYbTApDghgWQDx
 2YZUD/VbPneamb0Ld9xYIW09hwCv5CAyd4yOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCSC/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT/hmYoWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxMUlaENQ4ZW7
 86apF2I1juxEyUFU7tJoZ6nGqE+eYM+CCDV4pZgtwdOtTAZzsA6+v5T2PPx8i67gR3R9zx64
 I0lWZBd1W7FM4WU8NnxXSW0HAlhYpAF/rqcEUTvtJOa1hHLWFTIhPRHWRRe0Y0woo6bAElU/
 vAebTRIZReZiqfukfSwS/JngYIoK8yD0IE34y47i2qGS6x7HNaaH/uiCdxwhF/cguhVAPrDY
 sAZYBJkbQ/LZFtEPVJ/5JcWw7732SWvLWUBwL6TjZQT5HrZ1TRD6bHKAuX4QdeuVZ9SvH/N8
 woq+Ey8WHn2Lue3ziKI9H+pjOLDkS73HYkVDrCQ8v9xnEbVwXQeDhATX1a3rfS1zEmkVLpix
 1c84CEiq+02sUesVNS4B0z+q3+ftRlaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:I6VLmaEuf2MVpvbTpLqE6ceALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBEDjexLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltK0Ec
 xbAs5D4BqaNykcsfrH
X-Talos-CUID: 9a23:KRh042B5pRuyr/76EzY4yQ0SH5sVTi3Yk37Jf0KTJkIuSZTAHA==
X-Talos-MUID: 9a23:68vz9gYP+YJ4O+BTiRvrljt7DPVR6oOcN202mrEW4c6mDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,141,1770595200"; 
   d="scan'208";a="717748601"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Mar 2026 10:25:43 +0000
Received: from sjc-ads-7443.cisco.com (sjc-ads-7443.cisco.com [10.30.220.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id E7C1318000203
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:25:42 +0000 (GMT)
Received: by sjc-ads-7443.cisco.com (Postfix, from userid 1840713)
	id 8E707CCC16B; Thu, 26 Mar 2026 03:25:42 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 3/3] curl: fix CVE-2026-3784
Date: Thu, 26 Mar 2026 03:23:41 -0700
Message-ID: <20260326102341.2645012-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260326050435.2019528-2-sudumbha@cisco.com>
References: <20260326050435.2019528-2-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.228, sjc-ads-7443.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233966

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] as referenced in [2]
which is mentioned in [3]:

[1] https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3ef86e97afb856fb364
[2] https://curl.se/docs/CVE-2026-3784.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-3784

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
Changes from v1 -> v2:
- Updated with the correct patch series numbering

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


