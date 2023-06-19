Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E047C001B1
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.23.1687143353508995566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zMAn1iGP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b47212fd0cso520425a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143352; x=1689735352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYBuEc90Z2Uyougf8ZIh7DDQ/C+IBCXO0FdPaBHQlh0=;
        b=zMAn1iGPXoiLuPsXBJjvig18zSbhKFdav2ydqPqGWHHb2mfbFinQAQoE37ELDLeHbD
         YCut9s75UhcC0d0PnS/0bVI3fHkGvAWLXlM/0yNoCHKhzi5z8WuLVNl2ThXDbZvEsDrE
         pz32XlzGH1rycdjhZqO5Lej4vERxmVrJ0r7NJyJOsgaXCB6HV5HGgXW57/SUtz59T2bi
         ead6Pjq19kVWu5bRMXjNVsKaIqPpKs3Jvaul8ygzqn7qinYke6fPXFdJMrcbctZbEsWy
         h/MZHtBZ0YqFyXSwmPdxFNTlgSGAuSJdgJwhFZjsP1BaX22UoufoXwUeM0byHCOq3qsD
         ShWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143352; x=1689735352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYBuEc90Z2Uyougf8ZIh7DDQ/C+IBCXO0FdPaBHQlh0=;
        b=FNJ78LFB4SpRI1evwgNyU1WbMVU8C++ftWUJWaZQNw7Fp2YeRDgU2JxwdNjU6efDtZ
         rQ5eiRJXT1VdaxfEwPo7qEALBIYY5lP4PjYoscLTk8PIr8b6JbY+vjlHuk5u3A2cfh7t
         KUc42BfMPcrot32qNbmexlwcAtA20S3+iarWCBXc/8ejWraDdOV0w7Zi8QZsTts/gtij
         SMKULTGaq+XCx9dieGWJ9SIc1ug78yNzX2lPP569kidMeYSGRSmy5yDumbzSMXjw7x9e
         wdTEQuJ36sqRqF0bfNa7EbvhRNIo1ukXZ5OfuocJw5ZTyAwUhU0WUlENvedXhpr/BhJC
         SLVg==
X-Gm-Message-State: AC+VfDwI0T1FOjNwRla3CK4hotRcXOf5cFpmzPkrReeOHmZtyEznrby+
	8Y8K3JS/XvbmPVC3yaFUg3+DYhqjWFs+gKJcous=
X-Google-Smtp-Source: ACHHUZ4s1yBibX0ABDRgFznT6sPPogoPVejo2Vu8VYaAcaDmcLjuXwzvXVLY16eBVhycJnwWa76mFg==
X-Received: by 2002:a05:6358:5117:b0:12b:eab2:d2f6 with SMTP id 23-20020a056358511700b0012beab2d2f6mr5394749rwi.21.1687143352143;
        Sun, 18 Jun 2023 19:55:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/18] webkitgtk: fix CVE-2022-46699
Date: Sun, 18 Jun 2023 16:55:24 -1000
Message-Id: <8f71f60af366837399290a7fc9e0e38452f379cc.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183071

From: Yogita Urade <yogita.urade@windriver.com>

A memory corruption issue was addressed with improved state management.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web
content may lead to arbitrary code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46699
https://support.apple.com/en-us/HT213537

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


