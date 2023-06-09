Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F262EC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:09:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14327.1686319780176286064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ehjJ5wJC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5524cb4a3f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359DAV0S000425
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jun 2023 07:09:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=e3FTvNw0yHF5I26JDTUE2XhGpPqYEMxGChJXwHPCCo4=;
 b=ehjJ5wJC3uwZwUVdLhP1Gs5GU5XLElq4CfRnTWSUCGioCn5+PWDS8nbssd2oJ49Tyk20
 xZrkHV4xjGp58p1qk72HaorDZ2WnM5iI7Hr70UeAWErPuhPOzJ0RBqAJzXCNvENWKFdB
 gS1n7d1RRU+E1uN3jJn8V8uWfpLt1QY/EpqpKvq8r2xXeFNOw1xroNLI5+ip2sewPLyc
 Hco2bARIcuuFY+XVFWCAJztvEgfEcTCcbAZT+tn0UahDVBYqr+a7qxm7Ql/KydacIO6S
 SdAFzgDUpDpc7Q8fyNmEUvcJdDzKwNayP9dVZpdBW2PJu57h132OM5COJXczDyZLmVOz Lg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av7aqq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:09:39 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 07:09:37 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH V2 6/6] webkitgtk: fix CVE-2022-46700
Date: Fri, 9 Jun 2023 14:09:08 +0000
Message-ID: <20230609140908.3465521-6-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230609140908.3465521-1-yogita.urade@windriver.com>
References: <20230609140908.3465521-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: HL_SGfqLXuT6Vfuun2PtoqJSj6w_xbBN
X-Proofpoint-GUID: HL_SGfqLXuT6Vfuun2PtoqJSj6w_xbBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_10,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306090120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 14:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182556

A memory corruption issue was addressed with improved input validation.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
15.7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing
maliciously crafted web content may lead to arbitrary code execution.

References:
https://support.apple.com/en-us/HT213531
https://bugs.webkit.org/show_bug.cgi?id=247562
https://github.com/WebKit/WebKit/pull/6266

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-46700.patch     | 67 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch
new file mode 100644
index 0000000000..242b8337fa
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch
@@ -0,0 +1,67 @@
+From 86fbeb6fcd638e2350b09a43dde355f9830e75da Mon Sep 17 00:00:00 2001
+From: David Degazio <d_degazio@apple.com>
+Date: Tue, 8 Nov 2022 19:54:33 -0800
+Subject: [PATCH] Intl.Locale.prototype.hourCycles leaks empty JSValue to
+ script https://bugs.webkit.org/show_bug.cgi?id=247562 rdar://102031379
+
+Reviewed by Mark Lam.
+
+We currently don't check if IntlLocale::hourCycles returns a null JSArray, which allows it
+to be encoded as an empty JSValue and exposed to user code. This patch throws a TypeError
+when udatpg_open returns a failed status.
+
+* JSTests/stress/intl-locale-invalid-hourCycles.js: Added.
+(main):
+* Source/JavaScriptCore/runtime/IntlLocale.cpp:
+(JSC::IntlLocale::hourCycles):
+
+Canonical link: https://commits.webkit.org/256473@main
+
+CVE:CVE-2022-46700
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/86fbeb6fcd638e2350b09a43dde355f9830e75da]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ JSTests/stress/intl-locale-invalid-hourCycles.js | 12 ++++++++++++
+ Source/JavaScriptCore/runtime/IntlLocale.cpp     |  4 +++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 JSTests/stress/intl-locale-invalid-hourCycles.js
+
+diff --git a/JSTests/stress/intl-locale-invalid-hourCycles.js b/JSTests/stress/intl-locale-invalid-hourCycles.js
+new file mode 100644
+index 000000000000..7b94eb844764
+--- /dev/null
++++ b/JSTests/stress/intl-locale-invalid-hourCycles.js
+@@ -0,0 +1,12 @@
++function main() {
++    const v24 = new Intl.Locale("trimEnd", { 'numberingSystem': "foobar" });
++    let empty = v24.hourCycles;
++    print(empty);
++}
++
++try {
++    main();
++} catch (e) {
++    if (!(e instanceof TypeError))
++        throw e;
++}
+diff --git a/Source/JavaScriptCore/runtime/IntlLocale.cpp b/Source/JavaScriptCore/runtime/IntlLocale.cpp
+index c3c346163a18..bef424727a8a 100644
+--- a/Source/JavaScriptCore/runtime/IntlLocale.cpp
++++ b/Source/JavaScriptCore/runtime/IntlLocale.cpp
+@@ -632,8 +632,10 @@ JSArray* IntlLocale::hourCycles(JSGlobalObject* globalObject)
+
+     UErrorCode status = U_ZERO_ERROR;
+     auto generator = std::unique_ptr<UDateTimePatternGenerator, ICUDeleter<udatpg_close>>(udatpg_open(m_localeID.data(), &status));
+-    if (U_FAILURE(status))
++    if (U_FAILURE(status)) {
++        throwTypeError(globalObject, scope, "invalid locale"_s);
+         return nullptr;
++    }
+
+     // Use "j" skeleton and parse pattern to retrieve the configured hour-cycle information.
+     constexpr const UChar skeleton[] = { 'j', 0 };
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 69663c1cb7..e9dd0d0a8d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-42867.patch \
            file://CVE-2022-42856.patch \
            file://CVE-2023-23517-CVE-2023-23518.patch \
+           file://CVE-2022-46700.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


