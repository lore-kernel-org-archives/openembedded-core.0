Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14612CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:29:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7940.1758702560696557425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 01:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MEWokg9x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362f596f5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O4jmTu3974464
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RlTT1AKIsYvzohFnbPUE
	v9Rtg1uReEz98PdKmtCweIc=; b=MEWokg9xwMV0OaSbihFXorpjXUXUh+mviC7k
	3RG3kXhrqR6Zn9nfE0RB2/d8oy7bbxZx2nkRuPamNvvGQ5wTvczvBOWjI1l1UxiA
	5c6C5anXXWBUsmoLLQcKfA+e8N7fdXTZ1bRlcDAUIsByYtVfr4MFnEAavu3ETXnm
	ZkgpJJZ1n4wtQoyBhBZGtXCl9REDI/qRSs6DKEJLrNT+Iytr29w4CWU2LAwfjjq0
	cswbZE/5vqYDyAT3HzJ0jejvkO8lzwRE7uGmk1N3QCR/4jL0KejEEXZfhEtw+PET
	kyK8ay6R0eu53eg7i0H4G/2fpmb/0dvRGYeecrxDYKJcYrWYrQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89cfmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:29:19 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 24 Sep 2025 01:29:18 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] curl: fix CVE-2025-9086
Date: Wed, 24 Sep 2025 13:58:45 +0530
Message-ID: <20250924082845.3947556-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA3MCBTYWx0ZWRfX20573DUAWq65
 MMJKp36n7beIirCFT38kkISaSJEp1hSJNzYlS5NdLxiog0/ACO1RkPCuVsPL8gjOjsXKsA1Jg8c
 RBABFy4JEiZc81JhCAcxiRFJvB3o+q2m5WDTLS0pGrmSya/hE/7DzRhLcgz2yA978kjGTy2KTPu
 lPqxVZKRKBbQm15I35Z0qwxCMnQZoQWKu6qYLUroPTZijK9bR3gQkWA1ltnOnqzQ7POhXbMOmqA
 uZ/PGHlz2ugkETSJlJY/gPGU39dOqpxeOhYTGLiCnkhIgTrpMsHN0X+Dwqsb1nNFbXSM2saJWEY
 7tAsrxZZDCtf1RprbNd79jbkho0g6IsWfbXu6cDi3gibf6j9DzSJzAivPteST0=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d3abdf cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=U2pbwLoH-MOwAsqTANMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: D36rUWZHAUkjHCC1Z0O_79-crf65eyw9
X-Proofpoint-ORIG-GUID: D36rUWZHAUkjHCC1Z0O_79-crf65eyw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223953

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
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-9086.patch b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
new file mode 100644
index 0000000000..c77d8fe33d
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
+index c1ed291..67494d2 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -316,7 +316,7 @@ static char *sanitize_cookie_path(const char *cookie_path)
+   }
+
+   /* convert /hoge/ to /hoge */
+-  if(len && new_path[len - 1] == '/') {
++  if(len > 1 && new_path[len - 1] == '/') {
+     new_path[len - 1] = 0x0;
+   }
+
+@@ -1074,7 +1074,7 @@ Curl_cookie_add(struct Curl_easy *data,
+          clist->spath && co->spath && /* both have paths */
+          clist->secure && !co->secure && !secure) {
+         size_t cllen;
+-        const char *sep;
++        const char *sep = NULL;
+
+         /*
+          * A non-secure cookie may not overlay an existing secure cookie.
+@@ -1083,8 +1083,9 @@ Curl_cookie_add(struct Curl_easy *data,
+          * "/loginhelper" is ok.
+          */
+
+-        sep = strchr(clist->spath + 1, '/');
+-
++        DEBUGASSERT(clist->spath[0]);
++        if(clist->spath[0])
++          sep = strchr(clist->spath + 1, '/');
+         if(sep)
+           cllen = sep - clist->spath;
+         else
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6845a43cd2..6ed3d6e84d 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0002.patch \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
+    file://CVE-2025-9086.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.40.0


