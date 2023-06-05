Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA18EC7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 11:57:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5633.1685966236850461339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 04:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F+F+S/yp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5520b22283=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355BghVT022512
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Jun 2023 04:57:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=euXAnFo2V1N6QC3jqJqDPhm/PBFEl2qtz0tQdWwEWl0=;
 b=F+F+S/yp3To1OlpMOcFnF0hxvrZcNFC0WfHxhvgeU0q55ORlOMhMNMPjxrBuWVIA46vJ
 18ZHVFjs0OyZ8XI9kZnKd5h5R726qcY5eWU8aNq2eUOsYCBDhZZuLM8ZMKRNU7Edd0Yj
 ISsdXCHWPFVGveDW4Vh9rD8UbRZLd8cAvf2TEjokPUm+oGtGpKDPfhqW1p+h2XZkczLl
 LRe4hRSWHAmhCcqueV3ge6j96LXzBB1idVMyJq0gPWjHMDhPe44S2GJ4wT56o+fz6rcx
 RwWxHsXrvXqD5nRGCrz17jVOs2JCwOZEqVutSaYPTbazCBj6+59op5TdVO6tZnUMtqBG wg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t39adu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 04:57:16 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 04:57:14 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-requests: fix for CVE-2023-32681
Date: Mon, 5 Jun 2023 11:56:46 +0000
Message-ID: <20230605115646.1409716-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: bm4SAv1JotBuvZYHZtwbINmH1QArJDC9
X-Proofpoint-ORIG-GUID: bm4SAv1JotBuvZYHZtwbINmH1QArJDC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=977 phishscore=0 clxscore=1011 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 11:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182377

From: Narpat Mali <narpat.mali@windriver.com>

Requests is a HTTP library. Since Requests 2.3.0, Requests has been leaking
Proxy-Authorization headers to destination servers when redirected to an HTTPS
endpoint. This is a product of how we use `rebuild_proxies` to reattach the
`Proxy-Authorization` header to requests. For HTTP connections sent through the
tunnel, the proxy will identify the header in the request itself and remove it
prior to forwarding to the destination server. However when sent over HTTPS,
the `Proxy-Authorization` header must be sent in the CONNECT request as the proxy
has no visibility into the tunneled request. This results in Requests forwarding
proxy credentials to the destination server unintentionally, allowing a malicious
actor to potentially exfiltrate sensitive information. This issue has been patched
in version 2.31.0.

Reference: https://github.com/advisories/GHSA-j8r2-6x86-q33q

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-requests/CVE-2023-32681.patch     | 63 +++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch b/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
new file mode 100644
index 0000000000..35b4241bde
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
@@ -0,0 +1,63 @@
+From cd0128c0becd8729d0f8733bf42fbd333d51f833 Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Mon, 5 Jun 2023 09:31:36 +0000
+Subject: [PATCH] Merge pull request from GHSA-j8r2-6x86-q33q
+
+CVE: CVE-2023-32681
+
+Upstream-Status: Backport [https://github.com/psf/requests/commit/74ea7cf7a6a27a4eeb2ae24e162bcc942a6706d5]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ requests/sessions.py   |  4 +++-
+ tests/test_requests.py | 20 ++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/requests/sessions.py b/requests/sessions.py
+index 3f59cab..648cffa 100644
+--- a/requests/sessions.py
++++ b/requests/sessions.py
+@@ -293,7 +293,9 @@ class SessionRedirectMixin(object):
+         except KeyError:
+             username, password = None, None
+
+-        if username and password:
++        # urllib3 handles proxy authorization for us in the standard adapter.
++        # Avoid appending this to TLS tunneled requests where it may be leaked.
++        if not scheme.startswith('https') and username and password:
+             headers['Proxy-Authorization'] = _basic_auth_str(username, password)
+
+         return new_proxies
+diff --git a/tests/test_requests.py b/tests/test_requests.py
+index 29b3aca..6a37777 100644
+--- a/tests/test_requests.py
++++ b/tests/test_requests.py
+@@ -601,6 +601,26 @@ class TestRequests:
+
+         assert sent_headers.get("Proxy-Authorization") == proxy_auth_value
+
++
++    @pytest.mark.parametrize(
++        "url,has_proxy_auth",
++        (
++            ('http://example.com', True),
++            ('https://example.com', False),
++        ),
++    )
++    def test_proxy_authorization_not_appended_to_https_request(self, url, has_proxy_auth):
++        session = requests.Session()
++        proxies = {
++            'http': 'http://test:pass@localhost:8080',
++            'https': 'http://test:pass@localhost:8090',
++        }
++        req = requests.Request('GET', url)
++        prep = req.prepare()
++        session.rebuild_proxies(prep, proxies)
++
++        assert ('Proxy-Authorization' in prep.headers) is has_proxy_auth
++
+     def test_basicauth_with_netrc(self, httpbin):
+         auth = ('user', 'pass')
+         wrong_auth = ('wronguser', 'wrongpass')
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
index af52b7caf5..635a6af31f 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+SRC_URI += "file://CVE-2023-32681.patch"
+
 SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
 
 inherit pypi setuptools3
-- 
2.40.0


