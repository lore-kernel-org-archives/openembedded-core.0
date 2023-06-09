Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057B4C83003
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:09:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14323.1686319773195900841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ANN8MBoB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5524cb4a3f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359DxcZk004916
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jun 2023 07:09:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=kT5H1+a/m/Pe3ztuSP63Y08srIBWzc68m7ybLESzw00=;
 b=ANN8MBoB+iAHUf020kvSrz2xzQ8DzLnRINEZiBp5QsenrwtvZND5Houvbwp15Vf9XqCF
 Nv/KzlZyWScnL5vy4kMJImrztXUsJs9pvT2SXaWdpDq7+ki/NgXf6y/7FI5K/s+NeeCa
 BrIO8VCDVPhPIK98d0xuKL2NoUdjKOt3NoZA6a+cW3k3KqHOc55bpP3M0rtMOk8R+Qdp
 0iYvY8YWYbzR9Fk5HbnNeXL7pLJsCYbsjQ2ErbpZ8j3BwfRGa+Y7J6lEQ8gYZfHbkyYz
 jH267qE8bP8Guimge6xVdjb9EiKklgQBOZyRX3znNyn1+CjpNP9ZEpsxfKLo8tGp654O og== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av7aqpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:09:32 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 07:09:30 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH V2 2/6] webkitgtk: fix CVE-2022-46699
Date: Fri, 9 Jun 2023 14:09:04 +0000
Message-ID: <20230609140908.3465521-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230609140908.3465521-1-yogita.urade@windriver.com>
References: <20230609140908.3465521-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: MCY9hLuKbgLZFyDS4VYBfAbReNWzdfDH
X-Proofpoint-GUID: MCY9hLuKbgLZFyDS4VYBfAbReNWzdfDH
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
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 14:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182552

A memory corruption issue was addressed with improved state management.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web
content may lead to arbitrary code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46699
https://support.apple.com/en-us/HT213537

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-46699.patch     | 136 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.patch
new file mode 100644
index 0000000000..0752b9c0e2
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.patch
@@ -0,0 +1,136 @@
+From 28686e63de0d3d7270a49b0d6b656467bc4fbf68 Mon Sep 17 00:00:00 2001
+From: Justin Michaud <justin_michaud@apple.com>
+Date: Wed, 9 Nov 2022 19:20:41 -0800
+Subject: [PATCH] Error() ICs should not cache special properties.
+ https://bugs.webkit.org/show_bug.cgi?id=247699
+
+Reviewed by Yusuke Suzuki.
+
+HasOwnProperty/DeleteProperty are not always cacheable for special Error()
+properties like column. These special properties are materialized on-demand
+in materializeErrorInfoIfNeeded, but this function's behaviour can be changed
+by Error.stackTraceLimit without causing a structure transition or firing watchpoints.
+
+That is, we cannot cache property misses, and we cannot assume HasOwnProperty is deterministic
+for a given structure if we are using one of these properties.
+
+* Source/JavaScriptCore/runtime/ErrorInstance.cpp:
+(JSC::ErrorInstance::deleteProperty):
+* Source/JavaScriptCore/runtime/ErrorInstance.h:
+
+Canonical link: https://commits.webkit.org/256519@main
+
+CVE: CVE-2022-46699
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/28686e63de0d3d7270a49b0d6b656467bc4fbf68]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ JSTests/stress/delete-cache-error.js          | 19 ++++++++++++++++++
+ .../get-own-property-slot-cache-error.js      |  6 ++++++
+ JSTests/stress/get-property-cache-error.js    | 20 +++++++++++++++++++
+ .../JavaScriptCore/runtime/ErrorInstance.cpp  |  4 +++-
+ Source/JavaScriptCore/runtime/ErrorInstance.h |  3 ++-
+ 5 files changed, 50 insertions(+), 2 deletions(-)
+ create mode 100644 JSTests/stress/delete-cache-error.js
+ create mode 100644 JSTests/stress/get-own-property-slot-cache-error.js
+ create mode 100644 JSTests/stress/get-property-cache-error.js
+
+diff --git a/JSTests/stress/delete-cache-error.js b/JSTests/stress/delete-cache-error.js
+new file mode 100644
+index 000000000000..d77c09185a13
+--- /dev/null
++++ b/JSTests/stress/delete-cache-error.js
+@@ -0,0 +1,19 @@
++delete Error.stackTraceLimit
++
++// sourceURL is not materialized
++function cacheColumn(o) {
++    delete o.sourceURL
++}
++noInline(cacheColumn)
++
++for (let i = 0; i < 200; ++i) {
++    let e = Error()
++    cacheColumn(e)
++    if (e.sourceURL !== undefined)
++        throw "Test failed on iteration " + i + " " + e.sourceURL
++
++    if (i == 197) {
++        // now it is
++        Error.stackTraceLimit = 10
++    }
++}
+\ No newline at end of file
+diff --git a/JSTests/stress/get-own-property-slot-cache-error.js b/JSTests/stress/get-own-property-slot-cache-error.js
+new file mode 100644
+index 000000000000..f8202213bf79
+--- /dev/null
++++ b/JSTests/stress/get-own-property-slot-cache-error.js
+@@ -0,0 +1,6 @@
++delete Error.stackTraceLimit
++// GetOwnPropertySlot does not materializeErrorInfoIfNeeded because stackString is null.
++Object.hasOwn(Error(), "column")
++Error.stackTraceLimit = 10
++// Now it does
++Object.hasOwn(Error(), "column")
+\ No newline at end of file
+diff --git a/JSTests/stress/get-property-cache-error.js b/JSTests/stress/get-property-cache-error.js
+new file mode 100644
+index 000000000000..b35272ea6fe2
+--- /dev/null
++++ b/JSTests/stress/get-property-cache-error.js
+@@ -0,0 +1,20 @@
++// GetOwnPropertySlot does not materializeErrorInfoIfNeeded because stackString is null.
++delete Error.stackTraceLimit
++expected = undefined
++
++function cacheColumn(o) {
++    return o.column
++}
++noInline(cacheColumn)
++
++for (let i = 0; i < 1000; ++i) {
++    let val = cacheColumn(Error())
++    if (val !== expected)
++        throw "Test failed on iteration " + i + ": " + val
++
++    if (i == 900) {
++        // now it does
++        Error.stackTraceLimit = 10
++        expected = 32
++    }
++}
+\ No newline at end of file
+diff --git a/Source/JavaScriptCore/runtime/ErrorInstance.cpp b/Source/JavaScriptCore/runtime/ErrorInstance.cpp
+index ddf96869e84a..8e5373257d34 100644
+--- a/Source/JavaScriptCore/runtime/ErrorInstance.cpp
++++ b/Source/JavaScriptCore/runtime/ErrorInstance.cpp
+@@ -303,7 +303,9 @@ bool ErrorInstance::deleteProperty(JSCell* cell, JSGlobalObject* globalObject, P
+ {
+     VM& vm = globalObject->vm();
+     ErrorInstance* thisObject = jsCast<ErrorInstance*>(cell);
+-    thisObject->materializeErrorInfoIfNeeded(vm, propertyName);
++    bool materializedProperties = thisObject->materializeErrorInfoIfNeeded(vm, propertyName);
++    if (materializedProperties)
++        slot.disableCaching();
+     return Base::deleteProperty(thisObject, globalObject, propertyName, slot);
+ }
+
+diff --git a/Source/JavaScriptCore/runtime/ErrorInstance.h b/Source/JavaScriptCore/runtime/ErrorInstance.h
+index 28807b4ea33e..2afb153a7442 100644
+--- a/Source/JavaScriptCore/runtime/ErrorInstance.h
++++ b/Source/JavaScriptCore/runtime/ErrorInstance.h
+@@ -30,7 +30,8 @@ namespace JSC {
+ class ErrorInstance : public JSNonFinalObject {
+ public:
+     using Base = JSNonFinalObject;
+-    static constexpr unsigned StructureFlags = Base::StructureFlags | OverridesGetOwnPropertySlot | OverridesGetOwnSpecialPropertyNames | OverridesPut;
++
++    static constexpr unsigned StructureFlags = Base::StructureFlags | OverridesGetOwnPropertySlot | OverridesGetOwnSpecialPropertyNames | OverridesPut | GetOwnPropertySlotIsImpureForPropertyAbsence;
+     static constexpr bool needsDestruction = true;
+
+     static void destroy(JSCell* cell)
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 02258f84e4..8f6514a82b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
            file://CVE-2022-46691.patch \
+           file://CVE-2022-46699.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


