Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC48EC77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 05:59:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9001.1750831142458203130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 22:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271b73e9d=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5dTFE016579
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:59:02 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mkqj6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:59:02 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 24 Jun 2025 22:58:59 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 24 Jun 2025 22:58:57 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][scarthgap][PATCH 1/1] go: fix CVE-2025-4673
Date: Wed, 25 Jun 2025 11:28:54 +0530
Message-ID: <20250625055854.170999-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfX11lh5xnLwxqY JCcI02Svo78j2fiYo1jIJL2c/igFvw3XAYiNFhd8ENNeiRapyK5xeLgxD+sKFIRN94SODF+z2OW YKHlWKAZNKe7o9GsdKxXO5XrLjLBAV7xniPC05TWvZ6gE4RfxzH+f+r6etN7y80BxsDH2EIOAiz
 ySHL28v3jEeWvXFOSRpTGDkPfb5r9DalmAgd5UenAlz1hWim9NUH7i8TngZ8TxCcq7nmy3XEFcy GgBjnmXAVNovQZ0RvsTtnqHZfEDCCWX6KyZHZCL3kBiDCEAqXdqGuriRFu8NhRiP5uE7IEv/AJz Ra5X9j2gxlRgF3cIN5OwtT2fm1pcpuZwpyzXdp/GVAzYgXFIoZvsrUXfZwRt8Rnn3Qkr/sGEoo/
 b5i/a3NeT2aYpCbO9nJ+OXb7+IIRhS0Nspxu47NuExRWfrtdNie0NBEgR7T4IHWp9weCXjOG
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685b9026 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=ekYV4lpRAAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8
 a=yhUri8FnAAAA:8 a=A1X0JdhQAAAA:8 a=TplnEbsI_GblamtprvIA:9 a=mrCxpU6zTNQDHnudu_9Q:22 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-GUID: JCvo-Q0mwqSqp89lUu3CTO8_RSVVStTs
X-Proofpoint-ORIG-GUID: JCvo-Q0mwqSqp89lUu3CTO8_RSVVStTs
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
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 05:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219302

Proxy-Authorization and Proxy-Authenticate headers persisted on
cross-origin redirects potentially leaking sensitive information.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-4673

Upstream-patch:
https://github.com/golang/go/commit/b897e97c36cb62629a458bc681723ca733404e32

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-4673.patch                 | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-4673.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index b154aa3984..af09cb52cd 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -16,5 +16,6 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://CVE-2025-22870.patch \
     file://CVE-2025-22871.patch \
+    file://CVE-2025-4673.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go/CVE-2025-4673.patch b/meta/recipes-devtools/go/go/CVE-2025-4673.patch
new file mode 100644
index 0000000000..5ca4fec3dc
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-4673.patch
@@ -0,0 +1,68 @@
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
+ src/net/http/client_test.go | 3 +++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/http/client.go b/src/net/http/client.go
+index 23f4d81..e07616b 100644
+--- a/src/net/http/client.go
++++ b/src/net/http/client.go
+@@ -805,7 +805,8 @@ func (c *Client) makeHeadersCopier(ireq *Request) func(req *Request, stripSensit
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
+index 641d7ff..97150bd 100644
+--- a/src/net/http/client_test.go
++++ b/src/net/http/client_test.go
+@@ -1541,6 +1541,8 @@ func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
+		if r.Host+r.URL.Path != "a.example.com/" {
+			if h := r.Header.Get("Authorization"); h != "" {
+				t.Errorf("on request to %v%v, Authorization=%q, want no header", r.Host, r.URL.Path, h)
++			} else if h := r.Header.Get("Proxy-Authorization"); h != "" {
++				t.Errorf("on request to %v%v, Proxy-Authorization=%q, want no header", r.Host, r.URL.Path, h)
+			}
+		}
+		// Follow a chain of redirects from a to b and back to a.
+@@ -1569,6 +1571,7 @@ func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
+	req, _ := NewRequest("GET", proto+"://a.example.com/", nil)
+	req.Header.Add("Cookie", "foo=bar")
+	req.Header.Add("Authorization", "secretpassword")
++	req.Header.Add("Proxy-Authorization", "secretpassword")
+	res, err := c.Do(req)
+	if err != nil {
+		t.Fatal(err)
+--
+2.40.0
-- 
2.40.0


