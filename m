Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83F2C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 13:22:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21003.1713532966518043876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 06:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BjPMCyO7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483981f7a8=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43JBC62M032024
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 13:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=FtMsE
	tfL56ooLAp71eZSL8va9/7BVFPtNROlXEyHo2U=; b=BjPMCyO74gQgkyFHnh2rV
	6t3chdri3zD+ktJEvb8VPRnLER0QpMccz8Xh3rquA5yRAeFm35E0FyEycWsZFkKz
	9Ej6aonDt4NCPI2XT/UvbfkEaempTbwiA7xwWLSgTwQQq/A7zgw0bkBwHVXD0U19
	EA9H3X6AwDhk0oUbQuYu5hueTNowOoBf5AGpTwFKjAb3PD8SIaDyeDFpBLzBywaC
	SnzJuvvWS8UjySK7nnqTxyMVvUwss4RDOg7v4fa5H6jU+IV1F6YElQn1UNbntAOQ
	BplHyZFtAjK/sQJ09zWUUfoqhYKw7jNjR0/dKkkfIGO2eXOrUDoSEAKAIFcnts36
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfh16p2hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 13:22:45 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 19 Apr 2024 06:22:42 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2023-45288
Date: Fri, 19 Apr 2024 13:22:24 +0000
Message-ID: <20240419132224.2631349-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: BIRSvfBFzFdRPgPTm2uSxF4F6ic38puS
X-Proofpoint-GUID: BIRSvfBFzFdRPgPTm2uSxF4F6ic38puS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_09,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 13:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198549

From: Soumya Sambu <soumya.sambu@windriver.com>

An attacker may cause an HTTP/2 endpoint to read arbitrary amounts of
header data by sending an excessive number of CONTINUATION frames.
Maintaining HPACK state requires parsing and processing all HEADERS
and CONTINUATION frames on a connection. When a request's headers
exceed MaxHeaderBytes, no memory is allocated to store the excess
headers, but they are still parsed. This permits an attacker to cause
an HTTP/2 endpoint to read arbitrary amounts of header data, all
associated with a request which is going to be rejected. These headers
can include Huffman-encoded data which is significantly more expensive
for the receiver to decode than for an attacker to send. The fix sets
a limit on the amount of excess header frames we will process before
closing a connection.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45288

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  3 +-
 .../go/go-1.22/CVE-2023-45288.patch           | 96 +++++++++++++++++++
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 768961de2c..b5566db1fe 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.22:${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2023-45290.patch \
     file://CVE-2024-24784.patch \
     file://CVE-2024-24785.patch \
+    file://CVE-2023-45288.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch b/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch
new file mode 100644
index 0000000000..ad84fb84d9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch
@@ -0,0 +1,96 @@
+From e55d7cf8435ba4e58d4a5694e63b391821d4ee9b Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 28 Mar 2024 16:57:51 -0700
+Subject: [PATCH] [release-branch.go1.22] net/http: update bundled
+ golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+Fixes CVE-2023-45288
+For #65051
+Fixes #66298
+
+Change-Id: I5bbf774ebe7651e4bb7e55139d3794bd2b8e8fa8
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2197227
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/576076
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Than McIntosh <thanm@google.com>
+
+CVE: CVE-2023-45288
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4ee9b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go |  1 +
+ src/net/http/h2_bundle.go                | 31 ++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index d48d43f..ee6d455 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -36,6 +36,7 @@ import (
+ func TestAllDependencies(t *testing.T) {
+	t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
+	t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from vendored modules")
++	t.Skip("TODO(#65051): 1.22.2 contains unreleased changes from vendored modules")
+
+	goBin := testenv.GoToolPath(t)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 9d6abd8..10ff193 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -2842,6 +2842,7 @@ func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFr
+		if size > remainSize {
+			hdec.SetEmitEnabled(false)
+			mh.Truncated = true
++			remainSize = 0
+			return
+		}
+		remainSize -= size
+@@ -2854,6 +2855,36 @@ func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFr
+	var hc http2headersOrContinuation = hf
+	for {
+		frag := hc.HeaderBlockFragment()
++
++		// Avoid parsing large amounts of headers that we will then discard.
++		// If the sender exceeds the max header list size by too much,
++		// skip parsing the fragment and close the connection.
++		//
++		// "Too much" is either any CONTINUATION frame after we've already
++		// exceeded the max header list size (in which case remainSize is 0),
++		// or a frame whose encoded size is more than twice the remaining
++		// header list bytes we're willing to accept.
++		if int64(len(frag)) > int64(2*remainSize) {
++			if http2VerboseLogs {
++				log.Printf("http2: header list too large")
++			}
++			// It would be nice to send a RST_STREAM before sending the GOAWAY,
++			// but the struture of the server's frame writer makes this difficult.
++			return nil, http2ConnectionError(http2ErrCodeProtocol)
++		}
++
++		// Also close the connection after any CONTINUATION frame following an
++		// invalid header, since we stop tracking the size of the headers after
++		// an invalid one.
++		if invalid != nil {
++			if http2VerboseLogs {
++				log.Printf("http2: invalid header: %v", invalid)
++			}
++			// It would be nice to send a RST_STREAM before sending the GOAWAY,
++			// but the struture of the server's frame writer makes this difficult.
++			return nil, http2ConnectionError(http2ErrCodeProtocol)
++		}
++
+		if _, err := hdec.Write(frag); err != nil {
+			return nil, http2ConnectionError(http2ErrCodeCompression)
+		}
+--
+2.40.0
-- 
2.40.0


