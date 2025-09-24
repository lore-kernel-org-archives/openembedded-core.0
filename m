Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18C1CAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:57:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9048.1758707855499142196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gWFVbNZ2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362f596f5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O7e5Vr564804
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 09:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EaeWhT1kCXYsb5E4n29l
	8p8ovxPtpMMoQVtZkHFgf2w=; b=gWFVbNZ2obcRg57fl9XMA+zC+OmQhbFdz394
	XI0my2+knUBcMAc14XZBLuZmUBdSsyHubBEtsh01SlMkNytC4HXAOvSab/+USini
	rKCAbw9VrMXxRuiJ2w2FitDIn+tSnvRkjPCjvaQ4WmGNgx4vq3UZa710ZNoi9gnZ
	00QRA5C0gVgOI3XCRAv8zEJcj7kpmDQnDt9KUqOoPzAJBJmk/VtBaOzsdRATqfw0
	weTjITsLTf8ffFV/MPH/RaVF0FhlPdwYu43leEiH7BgPf/6xD6mlkBk2WhdDjUe7
	6HDhgnLQASHnw1S09H508woP8OlnmMCzE5KkdbEmCuKLfpfZzw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1mnrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 09:57:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 24 Sep 2025 02:57:33 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] curl: fix CVE-2025-9086
Date: Wed, 24 Sep 2025 15:26:40 +0530
Message-ID: <20250924095640.3807720-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: hB4XiYhg6HLRUy1Mg93bZbFaI4j7bkRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA4NSBTYWx0ZWRfXzoZV3ohMDIfE
 Icm/aJ42e53xqHWpjxJ1myIOhEy2q7DFiwMUQx/kgeHCWgw7jA7NjgMEEv8f84H5YuQyq5hT0xo
 wbDAeL9CZzbNCND52Pcb7o6c7+676m5mP3kdmsmY1LTASQZs/xntsFYmkLAzpHX5IalSoRgI8Ao
 +MfbpWXgLkyccnvhBYuh5+NrQtd32l9RRZRTHSEHtq5IbQ+cAF6EGNyddnHclb908JwKBLRzEVO
 X7bxGJuXx6tIC7c1HwYDaHMVQPETMLFTPLc1XHh3U3pRZ2jNKcdG1e2YFBJNkLf21Au8gatSmfl
 wsvjNHlw37oZk9VSAIaF2MjKlwYKE7wzljqUdNGS8Pbc4JnYVLTmp07KNjpW08=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d3c08d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=ugkhXdxtAAAA:8 a=t7CeM3EgAAAA:8 a=plTMs5P8gSCzHe5utQIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hB4XiYhg6HLRUy1Mg93bZbFaI4j7bkRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 09:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223958

From: Yogita Urade <yogita.urade@windriver.com>

1, A cookie is set using the secure keyword for https://target
2, curl is redirected to or otherwise made to speak with http://target
(same hostname, but using clear text HTTP) using the same cookie set
3, The same cookie name is set - but with just a slash as path (path="/").
Since this site is not secure, the cookie should just be ignored.
4, A bug in the path comparison logic makes curl read outside a heap buffer boundary

The bug either causes a crash or it potentially makes the comparison come to
the wrong conclusion and lets the clear-text site override the contents of
the secure cookie, contrary to expectations and depending on the memory contents
immediately following the single-byte allocation that holds the path.

The presumed and correct behavior would be to plainly ignore the second set of
the cookie since it was already set as secure on a secure host so overriding
it on an insecure host should not be okay.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9086

Upstream patch:
https://github.com/curl/curl/commit/c6ae07c6a541e0e96d0040afb6

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../curl/curl/CVE-2025-9086.patch             | 55 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-9086.patch b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
new file mode 100644
index 0000000000..8ee7cd5192
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
@@ -0,0 +1,55 @@
+From c6ae07c6a541e0e96d0040afb62b45dd37711300 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 11 Aug 2025 20:23:05 +0200
+Subject: [PATCH] cookie: don't treat the leading slash as trailing
+
+If there is only a leading slash in the path, keep that. Also add an
+assert to make sure the path is never blank.
+
+Reported-by: Google Big Sleep
+Closes #18266
+
+CVE: CVE-2025-9086
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c6ae07c6a541e0e96d0040afb6]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/cookie.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index e287458..ac7d3de 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -312,7 +312,7 @@ static char *sanitize_cookie_path(const char *cookie_path)
+   }
+
+   /* convert /hoge/ to /hoge */
+-  if(len && new_path[len - 1] == '/') {
++  if(len > 1 && new_path[len - 1] == '/') {
+     new_path[len - 1] = 0x0;
+   }
+
+@@ -1078,7 +1078,7 @@ Curl_cookie_add(struct Curl_easy *data,
+         if(clist->spath && co->spath) {
+           if(clist->secure && !co->secure && !secure) {
+             size_t cllen;
+-            const char *sep;
++            const char *sep = NULL;
+
+             /*
+              * A non-secure cookie may not overlay an existing secure cookie.
+@@ -1087,8 +1087,9 @@ Curl_cookie_add(struct Curl_easy *data,
+              * "/loginhelper" is ok.
+              */
+
+-            sep = strchr(clist->spath + 1, '/');
+-
++            DEBUGASSERT(clist->spath[0]);
++            if(clist->spath[0])
++              sep = strchr(clist->spath + 1, '/');
+             if(sep)
+               cllen = sep - clist->spath;
+             else
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 623d8a4bc3..54362e6978 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-11053-0001.patch \
            file://CVE-2024-11053-0002.patch \
            file://CVE-2025-0167.patch \
+           file://CVE-2025-9086.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.40.0


