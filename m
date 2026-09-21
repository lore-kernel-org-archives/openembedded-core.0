Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2ABC982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:31 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43679.1789974445627404157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YgQivEgY;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so13383975e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974444; x=1790579244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LF5VLF6GhCCH+83vvMjafci5bnEbF8Wbqpe+j8XDF5Q=;
        b=YgQivEgYbQR+4IGUqjzvCrH451JDmWYiWKklACl1P5e1xXc7m73rWBvbmM57+waKv6
         E/c/9otXOp/zyVnA1Dl8E6OaXfljguetcYQ8EdQ5a1DcCW/fNECb3xL3jb93MUi0ax09
         gwK3rD0a3gxUSPDTPK9FC/5yt9A425e+ZDTFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974444; x=1790579244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LF5VLF6GhCCH+83vvMjafci5bnEbF8Wbqpe+j8XDF5Q=;
        b=0X4vhfaY5yhyxmLG5Sv7mJjD/rCKpBsNwAreMgFgHGuh6DKBY/ilp8QN1pXwbIW6B5
         w6I3AdUNBD24eo8YoheuJupKR0gOtvaJ9NnL52eGT65nS/a317gOXg2Ugo0vB8/uHels
         IIzMPcEaKG9O4Z3rrBwwauZbGaRfmvnUpCRTT/Sbh9aNEuYNGXWjgLizzU/tAzTzV3NZ
         dEWgE87L/viHmuIBr1vI/sMuvRGkOAMjK3lYJ27/A6CfiXQfI8firCkGrreQQwrZqlD6
         KNCr2lruW8K4M9iAQ2WjJILCe8dGWMVRQ9+btcm4J2n6nlWbdaVNSaa8K8oOMfVUuYe3
         /K6A==
X-Gm-Message-State: AFuF++kujox96NTgh1tUU6BaILCiqEeMfRl4DoyXGnjRyaxu4df9Ee2Z
	npYBBLcu2FBPnVmKYQgFyPAnl6jtmf9/ZINQH0g6is6IgZDZwKx+a66M6dDRw1rgXhsV/UOxk0j
	sRi+SpvQ=
X-Gm-Gg: AYBFou1p8RWGQaC+MszlIvwerPOAi2Acwh1oiwSXOfj8/ve2o3uza+GK/k71S4SiC1L
	bgEO0GXipHdxCi20ekbsYMqxoLZr63OV6tMg86+IhCDzx6tiKDwjA3Yv6EqHvPFysnfvYS7q7+q
	HIbsHMpwjL49bG64l5yG7116K44CvH5K98/O0JXXAplhprumxodFYRbgbJMqXhLLt+E6rDVWsZi
	IvKdEuzajAljvRPrnHI3uyf4WkJZcK/WvsRaWrxoJnsxUeOdUe0+FL3bvp7MsTZB+uSkFt+dc9S
	SjdX/V9T+pI6sihk7j3222MTRo/xrPkhoyGZc39u/IAjPHqYvK+u2E6aonenV1PdCtndBiYsvpm
	3GUCIpVW9F78my2OMWVBzl+g3sdJa7qo4271naec6BHKaA46TBBaS71u0+KiBJuQrMIaMkEq1Hu
	X6665JFfDFoo7MBlpn7YQiUxbKd5dhXXdVLbHNkic5Xz5v7gyBmsdz+N7xDMWXjF75LJHIHXeXh
	aUtVm09rSeXIF0XWc66aah01hD/jQVpjZ9c+w==
X-Received: by 2002:a05:600c:83c9:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49fcd011179mr91936645e9.23.1789974443649;
        Mon, 21 Sep 2026 00:07:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/20] python3-urllib3: upgrade 2.7.0 -> 2.8.0
Date: Mon, 21 Sep 2026 08:06:53 +0100
Message-ID: <20260921070656.521680-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246304

2.8.0 (2026-09-15)
==================

Security

Fixed the following security issues:

    The TLS configuration for HTTPS proxies could be ignored or overridden. (High severity, GHSA-8988-9cw3-xx77)
    HTTPResponse.stream() and read_chunked() could buffer a chunk-size line of unbounded length in memory. (High severity, GHSA-vxq7-64xx-v4gw)
    Chunked Deflate streaming could enter an infinite loop. (Medium severity, GHSA-gh4c-6fx4-qh6g)

Caution!

urllib3 2.8.0 fixes HTTPS proxy TLS configuration being ignored or overridden by destination settings. Configurations relying on that behavior may require changes.

Configure proxy CA certificates and client certificates in proxy_ssl_context, and proxy identity checks with proxy_assert_hostname or proxy_assert_fingerprint. Destination client certificates and identity overrides no longer apply to HTTPS forwarding proxy connections.
Deprecations & Removals

    Deprecated using an empty collection as the Retry option allowed_methods to retry any verb. (#5044)

Features

    Added Url.auth_decoded and Url.auth_decoded_joined convenience properties to the result of parse_url(). (#4945)
    Added basic_auth_encoding and proxy_basic_auth_encoding parameters to urllib3.util.make_headers(). (#5092)

Bugfixes

    Fixed response header handling to replace obsolete folded header lines (obs-fold) with spaces in accordance with RFC 9112, preventing raw CRLF sequences from appearing in header values such as Set-Cookie. (#1362)

    Fixed usage of proxy_ssl_context with ProxyManager when use_forwarding_for_https=True. Passing ssl_context instead of proxy_ssl_context for HTTPS proxies in this configuration now emits a FutureWarning and will raise an error in v3.0. (#2577)

    Changed behavior of the default ConnectionPool.pool initialization. LifoQueue is now resolved from the queue module after the ConnectionPool is instantiated instead of using the default cached QueueCls class property. This is done because sometimes the queue.LifoQueue is monkey-patched late in the program, such as by gevent. (#3289)

    Raised UnrewindableBodyError instead of ValueError when retrying a request whose body had tell() but not seek(). (#3779)

    Decoded percent-encoded SOCKS proxy credentials before authenticating with the proxy server. (#3785)

    Fixed HTTPResponse.drain_conn() to discard unread response data in 64 KiB chunks (same as the default amt when doing HTTPResponse.stream(...)). (#5019)

    Fixed is_ipaddress() to detect non-standard IPv4 forms accepted by socket.connect, such as hex (0x7f000001), octal (0177.0.0.1), and decimal integers (2130706433), ensuring SSL certificate verification uses the correct mode for these addresses. (#5029)

    Fixed HTTPConnectionPool.urlopen raising a misleading FullPoolError instead of ValueError when called with an invalid timeout argument on a pool created with block=True. (#5059)

    Fixed port-zero handling to preserve explicit :0 values instead of substituting the default ports 80 or 443 in URL parsing, pool selection, proxy configuration, connection_from_url(), and HTTP/2 request authority. (#5071, #5101)

    Fixed a bug where PoolManager passed the assert_hostname and assert_fingerprint parameters to HTTP connection pools. (#5077)

    Fixed HTTPConnectionPool.urlopen() and HTTP proxy forwarding to strip URL fragments from absolute request targets before sending requests. (#5079)

    Added safeguards to the proxy tunneling code to prevent potential security issues when handling invalid characters in the proxy host and HTTP headers. This change affects users of Python 3.10, Python 3.11, and Python 3.12 when the standard library does not contain the fix; those on newer Python versions should upgrade to 3.13.14+ or 3.14.5+ to get the same security fixes. (#5091)

    Fixed HTTPSConnection.connect() overriding ProxyConfig.ssl_context's certificate policy and proxy identity checks with the target connection's TLS settings when forwarding through an HTTPS proxy.

    HTTPSConnection no longer applies target SNI, assertions, or client credentials to forwarding proxy handshakes and continues to use its ssl_context as a fallback when an HTTPS proxy forwards an HTTP target. (#5093)

    Fixed URL parsing to more strictly enforce RFC 3986 host syntax, rejecting invalid host input such as raw spaces and control characters, malformed percent-encodings, and percent-encoded control characters in HTTP(S) hosts and IPv6 zone identifiers, including proxy CONNECT tunnel targets. Host normalization now also follows RFC 3986 normalization rules for percent-encoded octets by decoding percent-encoded unreserved characters and uppercasing the hexadecimal digits of retained percent-encoded octets. (#5095)

    Fixed an AttributeError on Python built with OpenSSL 4+, where ssl.PROTOCOL_TLSv1 no longer exists. (#5097)

    Fixed urllib3.contrib.pyopenssl to use cryptography APIs when reading a certificate subject and loading encrypted private keys, avoiding DeprecationWarning raised by pyOpenSSL 26.3.0+. (#5103)

    Fixed handling of HTTP 303 redirects for requests with chunked or file-like bodies. (#5161)

    Fixed assert_fingerprint() to raise SSLError instead of binascii.Error when a fingerprint has a supported length but contains non-hexadecimal characters. (#5211)

Misc

    Added a test dependency group containing the minimum dependencies needed to run the test suite, intended for downstream packagers. The dev-base and mypy groups now include this new group via include-group, removing duplication. (#3594)
    Fixed test failures with pytest >= 9.1. (#5094)
    Enabled JSPI tests with Firefox in the Emscripten test suite. (#5166)
    Improved streamed response decoding performance. (#5209)
    Fixed flaky tests. (#5232, #5234, #5239)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-urllib3_2.7.0.bb => python3-urllib3_2.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.7.0.bb => python3-urllib3_2.8.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.8.0.bb
index 9e73a49bca2..4aafe2d63dd 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
+SRC_URI[sha256sum] = "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
 
 inherit pypi python_hatchling
 

