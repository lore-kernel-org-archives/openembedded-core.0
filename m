Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1A9E77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.12660.1733928468071616747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3M87AFys;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-723f37dd76cso6072240b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928467; x=1734533267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ir4bspaLnjgR82fHCLD+3S+SNhxc/A9J9w7RHENIVA=;
        b=3M87AFysbojnghQJBrCryl/MRwQCZg9z0Y5bM7Q3GCNjAStrg+oUdrssFlJ5q2oI3B
         faRl5vMrmWapY7mPCvNI/kEiVDWsC+PntMwtNoJese6G/ij1ZndAf0EwYT/fInutuprT
         qDNj267sB9ZuVwlMtIY6NFqfLxs/fTSdVw4P6dpvSY8SG2YQM1pIZtvELd7hTBCO5Rzc
         XFRDf/OflHGATaE/0Y+8LU4b9ofbUWMYAz1mWqNmv137h+0+24t53tzTC5jJr5aIN4nq
         PVABuVGK1s31KKu9htIVFeSUFGsw2p1g2i4B+puKlSKrAPFj37ruo3ipgkb1U06srewu
         6z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928467; x=1734533267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ir4bspaLnjgR82fHCLD+3S+SNhxc/A9J9w7RHENIVA=;
        b=VzRjodSbv1lCR8HNeLZ20hgmiXWu4FlBIlXH35EUJ4Z8gyzegN5AJwRWvbbsLRDTkR
         zvYvh1oRyo62uULAB5c7/u/bzwzi0NV23U6IK0K77zYSu97lFdksUj8PsrweYprPPEPt
         f2DP9YfhrqE3SSuTJvXL2HjM8Etv+m3x+6wvTdndrA3IuWIrUuvb+xKk25v2ER2ejsM8
         LJO60E1wCKILYSHUPGUui3mEGHdd9aIkEEnPbxvAvouslcvgPKe0jlv3DMfKqDuC2dDB
         UBm1703h4cvyGTx10PNOZBrTwg7h4VX2Xkb3RhWlDLS5a30BXcGdFwNIy/iGd1IPscd3
         /Naw==
X-Gm-Message-State: AOJu0Yx/BsJ5Y0K6eHKYsN8QXTIHDORncPIZZHIGVFGEshotL5RoQVKg
	ETP8RFT/gwZH8y6T+7EdYWx92v2+ZvKgBWN9xD4Jeyja8Ov36IjiOj7JCbsHpMm5pyfA/5fFM7E
	y
X-Gm-Gg: ASbGnctW2BqR2kWhWdDLPne0NcDbp4jW7KumUwOTQcg+RoChVGpmIU0cacO1Yej+Vyn
	k1sMdJ7bko6HqAxLUkB5kub/CEl6TIiZGfjZ+ZHmN/qfCbcW6wR6hWnYRPiblNCSs3QvTCrpSDS
	PEJ0ec/7mpb6yH7amVYrk70QNdy2wWdyshIE3Vt8eW1rmHSrkvFHlo3Df8Qkjkc7WZ1TSfhIG9I
	PgSxdJ0AzoFPW/CHTKOB9WECqz1CLdeMzW728Uh2C0=
X-Google-Smtp-Source: AGHT+IEfgw5Yfv/h9/SlxNznMS+C/eDDyTyG059Dejuwqvd0BoANq205gSsOlvp/szJkF7XORjYAiw==
X-Received: by 2002:a05:6a21:78a6:b0:1e1:aef4:9cdd with SMTP id adf61e73a8af0-1e1c126e58bmr4808500637.1.1733928467164;
        Wed, 11 Dec 2024 06:47:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] python3-requests: fix CVE-2024-35195
Date: Wed, 11 Dec 2024 06:47:33 -0800
Message-Id: <8bc8d316a6e8ac08b4eb2b9e2ec30b1f2309c31c.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208588

From: Jiaying Song <jiaying.song.cn@windriver.com>

Requests is a HTTP library. Prior to 2.32.0, when making requests
through a Requests `Session`, if the first request is made with
`verify=False` to disable cert verification, all subsequent requests to
the same host will continue to ignore cert verification regardless of
changes to the value of `verify`. This behavior will continue for the
lifecycle of the connection in the connection pool. This vulnerability
is fixed in 2.32.0.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-35195

Upstream patches:
https://github.com/psf/requests/commit/a58d7f2ffb4d00b46dca2d70a3932a0b37e22fac

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-requests/CVE-2024-35195.patch     | 121 ++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |   4 +-
 2 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2024-35195.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2024-35195.patch b/meta/recipes-devtools/python/python3-requests/CVE-2024-35195.patch
new file mode 100644
index 0000000000..4e2605b922
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2024-35195.patch
@@ -0,0 +1,121 @@
+From 5bedf76da0f76ab2d489972055a5d62066013427 Mon Sep 17 00:00:00 2001
+From: Ian Stapleton Cordasco <graffatcolmingov@gmail.com>
+Date: Sun, 3 Mar 2024 07:00:49 -0600
+Subject: [PATCH] Use TLS settings in selecting connection pool
+
+Previously, if someone made a request with `verify=False` then made a
+request where they expected verification to be enabled to the same host,
+they would potentially reuse a connection where TLS had not been
+verified.
+
+This fixes that issue.
+
+Upstream-Status: Backport
+[https://github.com/psf/requests/commit/a58d7f2ffb4d00b46dca2d70a3932a0b37e22fac]
+
+CVE: CVE-2024-35195
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ requests/adapters.py | 58 +++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 57 insertions(+), 1 deletion(-)
+
+diff --git a/requests/adapters.py b/requests/adapters.py
+index fe22ff4..7ff6998 100644
+--- a/requests/adapters.py
++++ b/requests/adapters.py
+@@ -10,6 +10,7 @@ and maintain connections.
+ 
+ import os.path
+ import socket
++import typing
+ 
+ from urllib3.poolmanager import PoolManager, proxy_from_url
+ from urllib3.response import HTTPResponse
+@@ -47,12 +48,38 @@ except ImportError:
+     def SOCKSProxyManager(*args, **kwargs):
+         raise InvalidSchema("Missing dependencies for SOCKS support.")
+ 
++if typing.TYPE_CHECKING:
++    from .models import PreparedRequest
++
++
+ DEFAULT_POOLBLOCK = False
+ DEFAULT_POOLSIZE = 10
+ DEFAULT_RETRIES = 0
+ DEFAULT_POOL_TIMEOUT = None
+ 
+ 
++def _urllib3_request_context(
++    request: "PreparedRequest", verify: "bool | str | None"
++) -> "(typing.Dict[str, typing.Any], typing.Dict[str, typing.Any])":
++    host_params = {}
++    pool_kwargs = {}
++    parsed_request_url = urlparse(request.url)
++    scheme = parsed_request_url.scheme.lower()
++    port = parsed_request_url.port
++    cert_reqs = "CERT_REQUIRED"
++    if verify is False:
++        cert_reqs = "CERT_NONE"
++    if isinstance(verify, str):
++        pool_kwargs["ca_certs"] = verify
++    pool_kwargs["cert_reqs"] = cert_reqs
++    host_params = {
++        "scheme": scheme,
++        "host": parsed_request_url.hostname,
++        "port": port,
++    }
++    return host_params, pool_kwargs
++
++
+ class BaseAdapter(object):
+     """The Base Transport Adapter"""
+ 
+@@ -290,6 +317,35 @@ class HTTPAdapter(BaseAdapter):
+ 
+         return response
+ 
++    def _get_connection(self, request, verify, proxies=None):
++        # Replace the existing get_connection without breaking things and
++        # ensure that TLS settings are considered when we interact with
++        # urllib3 HTTP Pools
++        proxy = select_proxy(request.url, proxies)
++        try:
++            host_params, pool_kwargs = _urllib3_request_context(request, verify)
++        except ValueError as e:
++            raise InvalidURL(e, request=request)
++        if proxy:
++            proxy = prepend_scheme_if_needed(proxy, "http")
++            proxy_url = parse_url(proxy)
++            if not proxy_url.host:
++                raise InvalidProxyURL(
++                    "Please check proxy URL. It is malformed "
++                    "and could be missing the host."
++                )
++            proxy_manager = self.proxy_manager_for(proxy)
++            conn = proxy_manager.connection_from_host(
++                **host_params, pool_kwargs=pool_kwargs
++            )
++        else:
++            # Only scheme should be lower case
++            conn = self.poolmanager.connection_from_host(
++                **host_params, pool_kwargs=pool_kwargs
++            )
++
++        return conn
++
+     def get_connection(self, url, proxies=None):
+         """Returns a urllib3 connection for the given URL. This should not be
+         called from user code, and is only exposed for use when subclassing the
+@@ -410,7 +466,7 @@ class HTTPAdapter(BaseAdapter):
+         """
+ 
+         try:
+-            conn = self.get_connection(request.url, proxies)
++            conn = self._get_connection(request, verify, proxies)
+         except LocationValueError as e:
+             raise InvalidURL(e, request=request)
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
index 635a6af31f..689a1dffb7 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI += "file://CVE-2023-32681.patch"
+SRC_URI += "file://CVE-2023-32681.patch \
+            file://CVE-2024-35195.patch \
+           "
 
 SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
 
-- 
2.34.1


