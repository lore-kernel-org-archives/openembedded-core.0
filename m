Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE63E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 08:30:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9364.1733301015065047226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 00:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2068bfaaa6=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46nbV8006463
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 08:30:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437qx14h2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 08:30:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Dec 2024 00:30:12 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Dec 2024 00:30:11 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jiaying.song.cn@windriver.com>, <Changqing.Li@windriver.com>
Subject: [kirkstone][PATCH v2] python3-requests: fix CVE-2024-35195
Date: Wed, 4 Dec 2024 17:28:01 +0800
Message-ID: <20241204092801.3106549-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DQNJHK6HR88DODfRJG_ymqUEerFtSAE2
X-Authority-Analysis: v=2.4 cv=EuYorTcA c=1 sm=1 tr=0 ts=67501315 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=3lewGKlCAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=3ovYWJ7vveCLVYKJMIYA:9 a=wtjpj5-OLiSXGFZywz8o:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DQNJHK6HR88DODfRJG_ymqUEerFtSAE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_05,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412040065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208270

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
2.25.1


