Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB2C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:28:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7384.1686054505046953491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kdOxLSPo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356BqR8K022498
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 05:28:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=+zpC9I4ArFzEgRgWgTje8AUw9vO7VeOQ4HSG1xOTCIw=;
 b=kdOxLSPoVR+6ySkyE0tZP0EOWxewy8NArVttMTS79Nuc25ua9+Ojpg4bYRdKh2Me/ZK+
 ovI2kLDV5J2T/bFkO6eSLUBITMRE85qSpW7uI1Cqvk2xXS9rmPektNGGxVA865N9bHMr
 PXeo5i/AvVytIvaCe6SnypUsXEAX+KFgPS0ZlvvUkBWE0PM4Wvs1LCij3y/SABrTrnQl
 21nBXcCpZf68whAB3wZat9FRJW3WrZRX1p9i/AwuT6ynPqHB2ZWgjd7SRd+tcSYPD1CD
 LyTtS2l8GZDhctK3Achcs8fBxrR28ROsHFlcgtbENnZ2zdC9dwULFtGQHf6xsxVLHCwL DA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051ja5df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:28:24 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:28:22 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-46700
Date: Tue, 6 Jun 2023 12:28:04 +0000
Message-ID: <20230606122804.3735790-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: zcja0c8W8jEnoc6Fxmqz5mXnbEQVOLkX
X-Proofpoint-GUID: zcja0c8W8jEnoc6Fxmqz5mXnbEQVOLkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 12:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182432

A memory corruption issue was addressed with improved input validation. This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 15.7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web content may lead to arbitrary code execution.

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
index 1dac4f5677..699936ec39 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-46700.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


