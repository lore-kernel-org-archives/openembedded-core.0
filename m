Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764B9D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 16:08:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19470.1764346086809427219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 08:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dau7BxQy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4427058972=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASDjw893449973
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 08:08:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=WRy47CImMlhntThGbgwVCHXZ2kHsEyJDBy5ZGITWB+g=; b=dau7BxQyh3Pb
	ipoNCgiz4vNaBFDauREGS3oRTPH76uNFmDG1QKBPxw7SlvM4c1UuiJkZjywE5/9Q
	qi/sX0h9Hmh+yNgK/1ZKYxbxnpdL85I+GTwFwqP4NLyUorwNJuXhKr6eZ0UmCWYt
	zDDTzK1LWF+jFRM97Ar++xBqs9NkY63CGojOEA8weWxVTVz4SM32vh+xf7QDwL/0
	aT8blATAauyAHu7s4TVqi/lHWA7mZqCttPZl8m8W7B2A6IHaQZf9DyfXMf1rCWHt
	MXZpQMLyjkjTo+R/E8jfRa/bBD8YQ9MQALsgSKX5B2dzihPsOQ7WBOwBMixepmjZ
	w0nUTkU+VA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5ewc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 08:08:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 08:08:05 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 08:08:04 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  2/4] go: fix CVE-2025-58189
Date: Fri, 28 Nov 2025 21:37:57 +0530
Message-ID: <20251128160759.331036-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251128160759.331036-1-archana.polampalli@windriver.com>
References: <20251128160759.331036-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=6929c8e6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pM9yUfARAAAA:8 a=Oh2cFVv5AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=1w1LfWAyAAAA:8
 a=yhUri8FnAAAA:8 a=5R-fWCJ7wIqqrW0gSnkA:9 a=YH-7kEGJnRg4CV3apUU-:22
 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=DTEug4J5-LymngTEnqh0:22
 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDExOCBTYWx0ZWRfXwWiknSChjmKP
 J7Z1Eq5SC1Gt58sAPqyQEq7aHPbvorA9vsA5nDMaeSil17wmmrAnBwvd+Krhgl92HnKxHNgoULY
 o5Qyt5wHO6amJMd667COR+PoWnLP5+yYNv+HEJCQ9Dqhl9aTdveZXRGJxF2HoJMsbFlWJldd6Rh
 onsN6tdnHdfXxpYSeUHMesmp0lPbFgXgSdQSV9W714OlYNM2lFxkfsWf8+gq5ricuG73Rv4jUWf
 O2TWjm0P/PeKAss0VmfnHuJ3r1B4OQ8hCnh5giN5+4UCn5WpvrFjYLfWH3QE0UJtB7J+YTYO4UW
 bZkfY+t+pMbwA9Q/X7HcELKNIMubIWAVgdNt04lOCMXG7XblxTj3UXfe75UHkcLUSo4ESVbDil5
 wft6aqU5R8C+0y03gTTTGa8jhgLN8Q==
X-Proofpoint-GUID: pnLTdfNoHFyQ_kDe6-kFBkcbR1-chKOm
X-Proofpoint-ORIG-GUID: pnLTdfNoHFyQ_kDe6-kFBkcbR1-chKOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 16:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226917

From: Archana Polampalli <archana.polampalli@windriver.com>

When Conn.Handshake fails during ALPN negotiation the error contains attacker controlled
information (the ALPN protocols sent by the client) which is not escaped.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2025-58189.patch           | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index c5aa3f9786..61fee12cf9 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -70,6 +70,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-47906.patch \
            file://CVE-2024-24783.patch \
            file://CVE-2025-58187.patch \
+           file://CVE-2025-58189.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch
new file mode 100644
index 0000000000..835f071733
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch
@@ -0,0 +1,51 @@
+From 2e1e356e33b9c792a9643749a7626a1789197bb9 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 29 Sep 2025 10:11:56 -0700
+Subject: [PATCH] crypto/tls: quote protocols in ALPN error message
+
+Quote the protocols sent by the client when returning the ALPN
+negotiation error message.
+
+Fixes CVE-2025-58189
+Updates #75652
+Fixes #75660
+
+Change-Id: Ie7b3a1ed0b6efcc1705b71f0f1e8417126661330
+Reviewed-on: https://go-review.googlesource.com/c/go/+/707776
+Auto-Submit: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Auto-Submit: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+TryBot-Bypass: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Daniel McCarney <daniel@binaryparadox.net>
+(cherry picked from commit 4e9006a716533fe1c7ee08df02dfc73078f7dc19)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/708096
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2025-58189
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2e1e356e33b9c792a9643749a7626a1789197bb9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/tls/handshake_server.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index 4e84aa9..17b6891 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -312,7 +312,7 @@ func negotiateALPN(serverProtos, clientProtos []string, quic bool) (string, erro
+ 	if http11fallback {
+ 		return "", nil
+ 	}
+-	return "", fmt.Errorf("tls: client requested unsupported application protocols (%s)", clientProtos)
++	return "", fmt.Errorf("tls: client requested unsupported application protocols (%q)", clientProtos)
+ }
+ 
+ // supportsECDHE returns whether ECDHE key exchanges can be used with this
+-- 
+2.40.0
+
-- 
2.40.0


