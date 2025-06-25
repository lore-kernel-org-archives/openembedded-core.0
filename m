Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E648BC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 05:58:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8870.1750831085572859906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 22:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271b73e9d=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4sQci014703
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:58:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mkqgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:58:04 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 24 Jun 2025 22:58:02 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 24 Jun 2025 22:58:00 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] go: fix CVE-2025-4673
Date: Wed, 25 Jun 2025 11:27:52 +0530
Message-ID: <20250625055752.167930-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfX8PBAz+7aKHzR bgfbvyu/hi3MbFpr3b2rBJniDo+7CUiyztVztbp8Uu/lngSLYcFB09Dit3EcZttzwxsVTorT/to XUFW3Hhp8d6XbwstogIJW0vTb+eEeJEBVHS2nXhS/MO2lR3p1ByfLElRnoYoptj3b7nzYC2BzNT
 JIGdFx1cCP/5XJXpsp6eExcxnHrkNJlFz3knBpC+Ci12+dPZnXkHcuYd8MAOObC/SJHslccMgrA vKkm4AOWWonKpN3fFqAVtHFlYgvaISl4xLXNHCsqMDCAM6ySGophH7UnVtEvZHkDPqYnRPW5etH PHO3fp6b7kSW0I/Elw8TBRSe+lY1yqJpJhEgmMcKpr383AogGUzAwKej60MTc+KI+GPmHLr+Lep
 qvrn6dyu4m7LQlcuK2eXFM/YkvrolB/f77/YhiA16Lgc1wTt914crTiGtmGoKhWM4TCbRSMJ
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685b8fed cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=ekYV4lpRAAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8
 a=yhUri8FnAAAA:8 a=A1X0JdhQAAAA:8 a=TplnEbsI_GblamtprvIA:9 a=mrCxpU6zTNQDHnudu_9Q:22 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-GUID: hSvIjAdWq0g_DgqPrUw3YQSyJKpfzvl-
X-Proofpoint-ORIG-GUID: hSvIjAdWq0g_DgqPrUw3YQSyJKpfzvl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 05:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219301

Proxy-Authorization and Proxy-Authenticate headers persisted on
cross-origin redirects potentially leaking sensitive information.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-4673

Upstream-patch:
https://github.com/golang/go/commit/b897e97c36cb62629a458bc681723ca733404e32

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2025-4673.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-4673.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e54205d48c..033f770f64 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -63,6 +63,7 @@ SRC_URI += "\
     file://CVE-2024-34158.patch \
     file://CVE-2024-45336.patch \
     file://CVE-2025-22871.patch \
+    file://CVE-2025-4673.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2025-4673.patch b/meta/recipes-devtools/go/go-1.21/CVE-2025-4673.patch
new file mode 100644
index 0000000000..62864f44ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2025-4673.patch
@@ -0,0 +1,70 @@
+From b897e97c36cb62629a458bc681723ca733404e32 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Wed, 21 May 2025 14:11:44 -0400
+Subject: [PATCH] net/http: strip sensitive proxy headers from redirect
+ requests
+
+Similarly to Authentication entries, Proxy-Authentication entries should be stripped to ensure sensitive information is not leaked on redirects outside of the original domain.
+
+https://fetch.spec.whatwg.org/#authentication-entries
+
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for reporting this issue.
+
+Updates golang/go#73816
+Fixes golang/go#73905
+Fixes CVE-2025-4673
+
+Change-Id: I1615f31977a2fd014fbc12aae43f82692315a6d0
+Reviewed-on: https://go-review.googlesource.com/c/go/+/679255
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+
+CVE: CVE-2025-4673
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/b897e97c36cb62629a458bc681723ca733404e32]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/net/http/client.go      | 3 ++-
+ src/net/http/client_test.go | 5 ++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/net/http/client.go b/src/net/http/client.go
+index 13b6152..d1c9407 100644
+--- a/src/net/http/client.go
++++ b/src/net/http/client.go
+@@ -806,7 +806,8 @@ func (c *Client) makeHeadersCopier(ireq *Request) func(req *Request, stripSensit
+		for k, vv := range ireqhdr {
+			sensitive := false
+			switch CanonicalHeaderKey(k) {
+-			case "Authorization", "Www-Authenticate", "Cookie", "Cookie2":
++			case "Authorization", "Www-Authenticate", "Cookie", "Cookie2",
++				"Proxy-Authorization", "Proxy-Authenticate":
+				sensitive = true
+			}
+			if !(sensitive && stripSensitiveHeaders) {
+diff --git a/src/net/http/client_test.go b/src/net/http/client_test.go
+index 8bf1808..66ad370 100644
+--- a/src/net/http/client_test.go
++++ b/src/net/http/client_test.go
+@@ -1562,7 +1562,9 @@ func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
+                if r.Host+r.URL.Path != "a.example.com/" {
+                        if h := r.Header.Get("Authorization"); h != "" {
+                                t.Errorf("on request to %v%v, Authorization=%q, want no header", r.Host, r.URL.Path, h)
+-                       }
++		       } else if h := r.Header.Get("Proxy-Authorization"); h != "" {
++			       t.Errorf("on request to %v%v, Proxy-Authorization=%q, want no header", r.Host, r.URL.Path, h)
++		       }
+                }
+                // Follow a chain of redirects from a to b and back to a.
+                // The Authorization header is stripped on the first redirect to b,
+@@ -1590,6 +1592,7 @@ func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
+        req, _ := NewRequest("GET", proto+"://a.example.com/", nil)
+        req.Header.Add("Cookie", "foo=bar")
+        req.Header.Add("Authorization", "secretpassword")
++       req.Header.Add("Proxy-Authorization", "secretpassword")
+        res, err := c.Do(req)
+        if err != nil {
+                t.Fatal(err)
+--
+2.40.0
-- 
2.40.0


