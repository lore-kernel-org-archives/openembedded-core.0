Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFC1CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:21:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8261.1762510872113354726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YL0tcnP5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3406543a8f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77Pxbt2731672
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 02:21:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=BokN8ZmRPWI395hRAXXFo034ef3nYiK8r/f9d+N/G28=; b=YL0tcnP5pfEl
	7LjBgHDhzlNo/++9RE3MEevSYdH75/alo1ZBrlRaUrfTUsBENunvGbyldqeqpmi0
	Jm02Yd1AnUCW/BQUcANv46qyb2jw87z+RC5sIUdegN/ARXdH0sL66ugXf3jJnaHs
	lHPwQJy5EeD6kZTppYLU0vnuE7dPDPyPMMR80s0uzy1jxPz6NMDes3zVmB/uCInY
	Pm2T2FfMG/2Y7Sbf4LB4JBI8zBwI/J4FX2bANoFv2u89MDuOmY/iOcNR0GUelIyl
	k2FWcfd1Kbpx08CZfBMrAtF2Obxie/uOWwrIgWwZI4PVUNis6Nc7yhzQgFWHLK9u
	Etwj3UfSTQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96ym8d0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:21:11 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 02:21:11 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 02:21:10 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  4/7] go: fix CVE-2025-58189
Date: Fri, 7 Nov 2025 15:51:00 +0530
Message-ID: <20251107102103.436637-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251107102103.436637-1-archana.polampalli@windriver.com>
References: <20251107102103.436637-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: by3xEN27GTn_mXQ3cEZ7YLaPCcqswqN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX2nAd2U/1Gtt/
 A+kYOhmyGjkHvOpcZRO5fYdcnnDTdWDIv9RV9CmEhqz9ps6VW3L8M9gTz2vjOMl7aDyxJmYe7Ss
 JtnTVwveOOEp+irdVQWxZwdzxKaoLd9GWL+b/F89lJjsmDEKIPxDktOF77/bR7rTuDQkR1FiAic
 XI5jhG16WTwEWIL2vTg9tHjAGUgBI4bjsCkhNTiHc96EroeXI15GEHFAANmhyQiGQuub1g9fFLd
 lhVMvNWjv+c3XP8g/w4oxzdWITgzkCfaP1AOqlYNWV3u0OdQwhZT0w4esz01jDGT2CxBHYrGTDN
 wQHp5PByMUUhpKcUsDyKmEHfb+CXMUTknTDccVUEAhq04sycYb4JPYieeDt8ACFgUmZq7fih6Qs
 gNJhL6CNXj+tRK83RqZ8PwL948OnXg==
X-Proofpoint-GUID: by3xEN27GTn_mXQ3cEZ7YLaPCcqswqN7
X-Authority-Analysis: v=2.4 cv=NqPcssdJ c=1 sm=1 tr=0 ts=690dc817 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pM9yUfARAAAA:8 a=1XWaLZrsAAAA:8 a=1w1LfWAyAAAA:8
 a=yhUri8FnAAAA:8 a=wXdO-bZgSI_5K8jihpEA:9 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22 a=DTEug4J5-LymngTEnqh0:22
 a=8nbOMqh3J4Vhtx036jbE:22
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
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226027

From: Archana Polampalli <archana.polampalli@windriver.com>

When Conn.Handshake fails during ALPN negotiation the error contains attacker
controlled information (the ALPN protocols sent by the client) which is not escaped.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-58189.patch                | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58189.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index b619fc48f4..1e4139148e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -24,6 +24,7 @@ SRC_URI += "\
     file://CVE-2025-58185.patch \
     file://CVE-2025-58187.patch \
     file://CVE-2025-58188.patch \
+    file://CVE-2025-58189.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58189.patch b/meta/recipes-devtools/go/go/CVE-2025-58189.patch
new file mode 100644
index 0000000000..4908cf6400
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58189.patch
@@ -0,0 +1,50 @@
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
+	if http11fallback {
+		return "", nil
+	}
+-	return "", fmt.Errorf("tls: client requested unsupported application protocols (%s)", clientProtos)
++	return "", fmt.Errorf("tls: client requested unsupported application protocols (%q)", clientProtos)
+ }
+
+ // supportsECDHE returns whether ECDHE key exchanges can be used with this
+--
+2.40.0
-- 
2.40.0


