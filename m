Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3AB10706C8
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:48:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6658.1773481687832873535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D/RN1/JK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso23247625e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773481686; x=1774086486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH49E9QBHdMc+YrWp/EvRtI8BhOjCYCDt61EW3/nJuU=;
        b=D/RN1/JKGw+k4SDkZdlPAr93wG4YMsCbbApnJfa20x7766g4sKlYeSu8TyLTnt6jfY
         uYLX+3Nh9M1olxflLEV1FQVku00E/HmaCdw6a2ZiB/L+f99PIb2kPNNAkWyXNLEIpWxh
         OvYRRAlFE7GvzxYjb93h+mxJ7jBJWbs0JCdC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481686; x=1774086486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XH49E9QBHdMc+YrWp/EvRtI8BhOjCYCDt61EW3/nJuU=;
        b=kn2jObAQ1MjeHL4hJaMsY/Sn21dhvHqy0MT87XvqZxwbNY+S7ciSpizzhs+e8XI/tu
         MpD12//J8L44Z9ENPIS+M542Howd9nIrC9u55MqzCRziI9A/79nrEwVE2pF5NUSNaD88
         kcPXbYHTV9Jcb/PMNAxmmjE5ADqOU25EVd4jVYo/UEUcDQL5aiVD6fs4BCvalIMT1Lq9
         liqAx1nt4qDwdVotiopYrFb+fDtHIR1A+ve2pJdpMQGmcKXg6s93G6E9ihpnngF9OFmR
         amaDbJlnepbhXIBY3AHplNALmhLVHY2HevqCqFK1+p1VFUgzxMJxH8P6nz3qsAGp2NRT
         dXCg==
X-Gm-Message-State: AOJu0Yw9izpqF+FaL/66a1DBIsxCB9ZSnkimxjvgINxNCXdkUV9lGhaR
	/XmpvXLfUmeSYaMY5z9KeNMTEXg5WXGsbKEaYVQ9pb7/Kphb93L45UbOUYsbNuBpuFUD2bBQ23n
	Y8Y3dp8s=
X-Gm-Gg: ATEYQzyi8+sz9DVjAdMrQz+lhqtuXov0X72p4+8hGTAOgnxJAQXgK+/EeNXsEww+14R
	YHfItgLc3zBZC3o9gBT1/EJLrGv6yn8PQ/zTEB0xeyRPKtnl9XB7hfrzxZJgpfB+AQA4BUSyqZt
	0KQVnanjMKuzJlhCb6yXu3mP0B9CnAW1OYKKm5zcMSiOyTY++jZyG/0DgEQ0Wr4W9DVFBIMvgsa
	Pc8H2Yxyu5pIIkOswa75kWQVe0fc5iQXd6IaKM6wSiPIOnJfYoiKQSiPRYQHIHjSf8N1oUCZa21
	ASVWiB//NmwtB1InxTHl2u+XPs/fCEGQJ3sah8GchPm+OpngDrQAEvuNEqzhYlJ717ZB3TRu8RI
	fOw6uZbAuRtnk07+NSDAYlT1cjCQBIaa28A6tz+Py0hmeyoAvNoZfzE+iUNhNj69vMoQ6Byw3Fl
	4AonsNs16D9jhyhKU/9G67Q8TRvmAu07A603wSxB4YKcAo1s4aRR0D4PYWVwX59Q==
X-Received: by 2002:a05:600c:1388:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-485566e93b7mr100719835e9.10.1773481685556;
        Sat, 14 Mar 2026 02:48:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26554680f8f.20.2026.03.14.02.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:48:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] sstate: Tweak SDK sstate package architecture
Date: Sat, 14 Mar 2026 09:47:58 +0000
Message-ID: <20260314094758.3929192-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233080

While in this area of the code, it is worth noting that PACKAGE_ARCH + PN are
already designed to capture the needed information that we need in SSTATE_PKGARCH.

We can therefore simplify things by just using the standard fallack for SSTATE_PKGARCH
instead of more complex manipulations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 7 +------
 meta/lib/oe/sstatesig.py           | 8 +++-----
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index f124f33b2d3..a7c3f5332a2 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -85,8 +85,7 @@ SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
     ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
-    ${SDK_ARCH}_${SDK_OS} \
-    ${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX} \
+    ${SDK_ARCH}-${SDKPKGSUFFIX} \
     buildtools-dummy-${SDKPKGSUFFIX} \
     sdk-provides-dummy-target \
     sdk-provides-dummy-${SDKPKGSUFFIX} \
@@ -140,10 +139,6 @@ python () {
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}"))
-    elif bb.data.inherits_class('nativesdk', d):
-        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
-    elif bb.data.inherits_class('cross-canadian', d):
-        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
     elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH") == "all":
         d.setVar('SSTATE_PKGARCH', "allarch")
     # Fall back to the default of SSTATE_PKGARCH=PACKAGE_ARCH
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4693b73375e..86d159ed209 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -512,13 +512,11 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
 
     if taskdata.endswith("-native"):
         pkgarchs = ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTRING}"]
-    elif taskdata.startswith("nativesdk-"):
-        pkgarchs = ["${SDK_ARCH}_${SDK_OS}",
+    elif taskdata.startswith("nativesdk-") or "-cross-canadian" in taskdata:
+        pkgarchs = ["${SDK_ARCH}-${SDKPKGSUFFIX}",
                     "allarch",
                     "buildtools-dummy-${SDKPKGSUFFIX}",
                     "sdk-provides-dummy-${SDKPKGSUFFIX}"]
-    elif "-cross-canadian" in taskdata:
-        pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
     elif "-cross-" in taskdata:
         pkgarchs = ["${BUILD_ARCH}"]
     elif "-crosssdk" in taskdata:
@@ -528,7 +526,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
         pkgarchs.append('allarch')
         pkgarchs.append('sdk-provides-dummy-target')
-        pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
+        pkgarchs.append('${SDK_ARCH}-${SDKPKGSUFFIX}')
 
     searched_manifests = []
 

