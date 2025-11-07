Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF62CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:21:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8354.1762510876909943628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=US94t9jr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3406543a8f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74vOHP2487900
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 02:21:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=DeNFBHTLujcieQvRczOnSJHYAkGpaHc1MyPPrlhlgOs=; b=US94t9jrBBYq
	ndufgYFy2fD9eK2DXfE96lXYi9Wz99Xjb+ya0W79DTZCe7fEd7RcihDc9i+rx/D4
	VxI0xB+sPtxaG4XOioPgGKqRC7gfkwTT3j+fpxwnCFnULkoWp60d4KttbQZwlOT/
	ZZdUpxZnufYdTosnGMpdv98uC+HbZPP7llqDblefzViPlu7W66c5Petmlllcsqc7
	FhGWgt+wONMvWjeF4hLKCfGzmLRK45JiKcdjWuLmOpm7OWuecmZ+C2ZHyvqhpJdB
	voMQ9aW068uy30/zBHQ8QErO13i/65FNjqYfSSpIpCSQkr1vHTdhtbdzvOTXHw9P
	gri2uMZpeA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96ym8d0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:21:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 02:21:15 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 02:21:14 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  7/7] go: fix CVE-2025-61724
Date: Fri, 7 Nov 2025 15:51:03 +0530
Message-ID: <20251107102103.436637-7-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251107102103.436637-1-archana.polampalli@windriver.com>
References: <20251107102103.436637-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ek7T1N6fMWDRpcOhSxUYyBpmacI2_YvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfXw0bh6K/d5ci9
 pO2bym1jGaeLIG9FpV2UG9FHu8m6/J8N8Sj/8rhW3XzaQ9wr2Puudy2p7Qw2XVmWP1kddGtqNrG
 pfvMxWxMyvBjd+wRNRWbZ20/CyJEhQyLK+UJIrCwwmH+nY2Hn/Hiv4yePkazvR2hp0rwVcJViZE
 tL8BzNoiF4F75bVISje6vWZCss8Y8YzXvHSFkauWy++0PxWzsGU5R9hLPD/vESnM9HMsmew68U9
 KlC5IPCvxfDLx7SiNGkBVwfqOKsFQtmCBui45aiiJQM958nUbihPISaDISI3QWqsxWKJloiK1+6
 TpN7sZYWVI3eBuWqOC2zm9elmlqDxL/C7u/flbmLzvI583eXBkmGMXImt8fwalYgCxoLVBdaizS
 yzgk4q72Oiu5JATaNa0bG/8EScG5RQ==
X-Proofpoint-GUID: ek7T1N6fMWDRpcOhSxUYyBpmacI2_YvK
X-Authority-Analysis: v=2.4 cv=NqPcssdJ c=1 sm=1 tr=0 ts=690dc81c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=UGZXEnhljDJq2poRytIA:9
 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226030

From: Archana Polampalli <archana.polampalli@windriver.com>

The Reader.ReadResponse function constructs a response string through
repeated string concatenation of lines. When the number of lines in a
response is large, this can cause excessive CPU consumption.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-61724.patch                | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61724.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 9996cfb870..825b8f4d68 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -27,6 +27,7 @@ SRC_URI += "\
     file://CVE-2025-58189.patch \
     file://CVE-2025-47912.patch \
     file://CVE-2025-61723.patch \
+    file://CVE-2025-61724.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61724.patch b/meta/recipes-devtools/go/go/CVE-2025-61724.patch
new file mode 100644
index 0000000000..a91c24508e
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61724.patch
@@ -0,0 +1,75 @@
+From a402f4ad285514f5f3db90516d72047d591b307a Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 30 Sep 2025 15:11:16 -0700
+Subject: [PATCH] net/textproto: avoid quadratic complexity in
+ Reader.ReadResponse
+
+Reader.ReadResponse constructed a response string from repeated
+string concatenation, permitting a malicious sender to cause excessive
+memory allocation and CPU consumption by sending a response consisting
+of many short lines.
+
+Use a strings.Builder to construct the string instead.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes CVE-2025-61724
+For #75716
+Fixes #75717
+
+Change-Id: I1a98ce85a21b830cb25799f9ac9333a67400d736
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2940
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2980
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709837
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-61724
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/a402f4ad285514f5f3db90516d72047d591b307a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/net/textproto/reader.go | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 7930211..0027efe 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -283,8 +283,10 @@ func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err err
+ //
+ // An expectCode <= 0 disables the check of the status code.
+ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error) {
+-	code, continued, message, err := r.readCodeLine(expectCode)
++	code, continued, first, err := r.readCodeLine(expectCode)
+	multi := continued
++	var messageBuilder strings.Builder
++	messageBuilder.WriteString(first)
+	for continued {
+		line, err := r.ReadLine()
+		if err != nil {
+@@ -295,12 +297,15 @@ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err err
+		var moreMessage string
+		code2, continued, moreMessage, err = parseCodeLine(line, 0)
+		if err != nil || code2 != code {
+-			message += "\n" + strings.TrimRight(line, "\r\n")
++			messageBuilder.WriteByte('\n')
++			messageBuilder.WriteString(strings.TrimRight(line, "\r\n"))
+			continued = true
+			continue
+		}
+-		message += "\n" + moreMessage
++		messageBuilder.WriteByte('\n')
++		messageBuilder.WriteString(moreMessage)
+	}
++	message = messageBuilder.String()
+	if err != nil && multi && message != "" {
+		// replace one line error message with all lines (full message)
+		err = &Error{code, message}
+--
+2.40.0
-- 
2.40.0


