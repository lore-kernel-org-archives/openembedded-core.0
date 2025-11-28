Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CABD116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 16:08:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19474.1764346090491445368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 08:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lt1DMiF7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4427058972=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASFk2mb3001991
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 08:08:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fz9L3CxFiias/Eucw+CJN9bhgipOqhOwboCecZX6jU0=; b=lt1DMiF7igga
	Q68sZiuDwrzg9GXZrltQMORFlpEkWAWhtU8eUN8KGW66XM3B4pdLzzyz/vnJBe/p
	PCk52Vm3cXfxh79fPa68tWP9RrxeuGLF5Loc/dkyauFJ2GlRg5PCvP2o4I59qp43
	/HX+xXBt3qGr/jFZDKmUT6RiK2J2Va3rkIfVx3lsjoSnnHmChGkzUJ0ukO8cbGSQ
	b879ytsGJ68VJh36nYE74PwTgI2CD+bmjkSFKzBEUGeXHxnCM6NUiPJXyB+eSRgL
	XwTeuGqXMhOJ9f1W261NN7ixKWbef6Df0GFs/5ReX02K9+L8kyTHPfzTo6TVCgS/
	ptRHVNDByA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjerhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 08:08:09 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 08:08:09 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 08:08:08 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  4/4] go: fix CVE-2025-61724
Date: Fri, 28 Nov 2025 21:37:59 +0530
Message-ID: <20251128160759.331036-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251128160759.331036-1-archana.polampalli@windriver.com>
References: <20251128160759.331036-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDExOCBTYWx0ZWRfX5/B1Yd++vnl8
 wYUV80FXEWYBI5wKz9TfWnSVUC6s26koJEzRuProQ4qv7KWZwWK+HrhQV3n288p+gokFPj+AfYI
 oCPf5DaC7GIjynXOq6ctN6f4d8OAkGVMSUId8Ju/288Wrf2lExwxn06YXzTpCJyvWaToSRKMz1I
 fke3luN/mlyp81KDDi9u2EdlbYERVLjAziTp9di11ZaznctIOpJYnqtrd4mRDFDS2EgcoiMXHaZ
 icMVRtaEmAWyFgmMLjTsipZJdKZVHap/l6/EIMJKowSnoMAgvNWgYCW0f5HYxTKoLE0nQP6tnTr
 NximOov3YARDWgR+7eVeqaq++19YG+dsawAAIvW1/dKKT3vpK/ah762lRHL79WInjwB9N5sOOoq
 5ByckG5H08UaBLIJBWtFUxzljrNoVQ==
X-Proofpoint-ORIG-GUID: XImOnOSNhXxzkU3Ys3hE0rajHbeIgJmN
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=6929c8ea cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pM9yUfARAAAA:8 a=Oh2cFVv5AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=UGZXEnhljDJq2poRytIA:9
 a=YH-7kEGJnRg4CV3apUU-:22 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XImOnOSNhXxzkU3Ys3hE0rajHbeIgJmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 16:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226920

From: Archana Polampalli <archana.polampalli@windriver.com>

The Reader.ReadResponse function constructs a response string through repeated
string concatenation of lines. When the number of lines in a response is large,
this can cause excessive CPU consumption.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2025-61724.patch           | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b621fb189c..bb5e839950 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -72,6 +72,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-58187.patch \
            file://CVE-2025-58189.patch \
            file://CVE-2025-61723.patch \
+           file://CVE-2025-61724.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch
new file mode 100644
index 0000000000..8c63022909
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch
@@ -0,0 +1,74 @@
+From a402f4ad285514f5f3db90516d72047d591b307a Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 30 Sep 2025 15:11:16 -0700
+Subject: [PATCH] net/textproto: avoid quadratic complexity in
+ Reader.ReadResponse Reader.ReadResponse constructed a response string from
+ repeated string concatenation, permitting a malicious sender to cause
+ excessive memory allocation and CPU consumption by sending a response
+ consisting of many short lines.
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
+index 3ac4d4d..a996257 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -288,8 +288,10 @@ func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err err
+ // An expectCode <= 0 disables the check of the status code.
+ //
+ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error) {
+-	code, continued, message, err := r.readCodeLine(expectCode)
++	code, continued, first, err := r.readCodeLine(expectCode)
+ 	multi := continued
++	var messageBuilder strings.Builder
++	messageBuilder.WriteString(first)
+ 	for continued {
+ 		line, err := r.ReadLine()
+ 		if err != nil {
+@@ -300,12 +302,15 @@ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err err
+ 		var moreMessage string
+ 		code2, continued, moreMessage, err = parseCodeLine(line, 0)
+ 		if err != nil || code2 != code {
+-			message += "\n" + strings.TrimRight(line, "\r\n")
++			messageBuilder.WriteByte('\n')
++			messageBuilder.WriteString(strings.TrimRight(line, "\r\n"))
+ 			continued = true
+ 			continue
+ 		}
+-		message += "\n" + moreMessage
++		messageBuilder.WriteByte('\n')
++		messageBuilder.WriteString(moreMessage)
+ 	}
++	message = messageBuilder.String()
+ 	if err != nil && multi && message != "" {
+ 		// replace one line error message with all lines (full message)
+ 		err = &Error{code, message}
+-- 
+2.40.0
+
-- 
2.40.0


