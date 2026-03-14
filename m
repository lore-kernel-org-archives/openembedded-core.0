Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB47510706CA
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 10:27:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7308.1773484026337331019
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 03:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a/F+A9+A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso18148995e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773484024; x=1774088824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2i5gF+j8UJ8FztQiGiWnA6cH+8uBRXJTpKP1H8UNIo=;
        b=a/F+A9+AifvFQZcmYCXeotUFP/AWN1mqXO5c97BsyNO5MVZlts3vjCdHX3EomW93nG
         cu3zj6uHb5ONoAxUOA5sj3bBjc+jvSjlthdEQMGPZemD0vAfU/Q1xGZZWUS7Q5nO+zyg
         c86/1yfUy4ZTlceivIYEKcwtrg4l7v8+Qe8V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773484024; x=1774088824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2i5gF+j8UJ8FztQiGiWnA6cH+8uBRXJTpKP1H8UNIo=;
        b=k6E0XTKYI3qIQk+Sxha8ORmBWOh+yZa/94lGxkMqmAYW6nsooaAMLNmt87IKSzHVBn
         kj+gKIUPBy4dMHka/5Dh3+71f11amb2RNlqWzX0GjEiPM14Dp4k4X6h5HX3YQjdWA1KG
         rXu9OeEEyngu2A0k3rguK0vRUypQfyvt453WLf8VvMWlkq5dPikdJ93oMZQuXiDe4bEa
         SaEp9YSZAHdLVpIfYNfYi5UqGPPF/8LAwzky+Dqm4Qtkn/yg9HuzMzh4aG1E4Ms3ZJfN
         oIQWnIlFY2pRZy6fJVb+1OJ2MWFLKR9m88iEOVKsF8bEsMEd/MGxTYCCcPERgPLGnMen
         WT5g==
X-Gm-Message-State: AOJu0Yz7tBOiOFH9uIvnQZLzJAj1G6206f3/MXLkRFQOCdU0tHzcMgto
	8V6GOhcozaLAWrOx1xbdAIKgzV8TuMAeAt8CWHRkAN+0KNpB59GRbrd0Td+HPlZ5axc4yC5nUkJ
	95o3e+qs=
X-Gm-Gg: ATEYQzwG7eBT+S/N5mKPnNM1IFfZ8uk3NOiwIBX7YO53wfyqExi2Jp6ZYsJm1pGDzdT
	BEgl3qwQKalMYqh7u3OcGMA85wqyGcwdg0hxdvmLZrBc6KOX6BXfx7fjDX/yRbP4ds/dvokW9MG
	mtJoUPh7XUTTAvhZXp6ANjoyYQp/IKOPluTY09QuT3xq9alhAEbGx3Am7RtTrCuWHO1/aYJb2DH
	mRtJpgqtasci0OFiC9Tp4I9vYSF2ZMYtAb2FJFHdqBGYmP7htfWQyS6N7QWcad6kDJ91nAz/NR1
	gSdzqAsx2NgxaN6KtRLpXYTGuHUrZA/Go+Z04mLotsPBBQ6YOIhNb54/uTiT6zpHmV8JFzjYYrC
	s+geacGbCjOt6iF9ub5F0jqogqGkbWEvoEZgkk/1gCe1PUTYf59k3sBZTo+ulKJirBv54E2iT5r
	lhp1Lu1Nbbyh32S4HOL6bVbZNvHzy4JOwhwD4he04WttdICusI8D0=
X-Received: by 2002:a05:600c:1395:b0:485:2fc5:3a5 with SMTP id 5b1f17b1804b1-48556709d85mr101052605e9.26.1773484024086;
        Sat, 14 Mar 2026 03:27:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm26855014f8f.25.2026.03.14.03.27.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 03:27:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate/sstatesig: Abstract dummy package architectures into layer.conf settings
Date: Sat, 14 Mar 2026 10:27:02 +0000
Message-ID: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 10:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233082

Other layers need to be able to add dummy recipes. To do this add
DUMMY_PACKAGE_ARCHS_SDK and DUMMY_PACKAGE_ARCHS_TARGET in layer.conf
which can be used to add these to the right places in the code.

Don't add the variables to task signatures as these only matter in the
context of constructed images and not the recipes.

d-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 7 +++----
 meta/conf/layer.conf               | 3 +++
 meta/lib/oe/sstatesig.py           | 9 +++------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index a7c3f5332a2..fe70a976869 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -86,14 +86,13 @@ SSTATE_ARCHS = " \
     ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}-${SDKPKGSUFFIX} \
-    buildtools-dummy-${SDKPKGSUFFIX} \
-    sdk-provides-dummy-target \
-    sdk-provides-dummy-${SDKPKGSUFFIX} \
+    ${DUMMY_PACKAGE_ARCHS_SDK} \
+    ${DUMMY_PACKAGE_ARCHS_TARGET} \
     allarch \
     ${SSTATE_ARCHS_TUNEPKG} \
     ${PACKAGE_EXTRA_ARCHS} \
     ${MACHINE_ARCH}"
-SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
+SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING DUMMY_PACKAGE_ARCHS_SDK DUMMY_PACKAGE_ARCHS_TARGET"
 
 SSTATECREATEFUNCS += "sstate_hardcode_path"
 SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ba25ca30296..4794e660aed 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -133,6 +133,9 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
 # dependency in the recipe.
 SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 
+DUMMY_PACKAGE_ARCHS_SDK = "buildtools-dummy-${SDKPKGSUFFIX} sdk-provides-dummy-${SDKPKGSUFFIX}"
+DUMMY_PACKAGE_ARCHS_TARGET = "sdk-provides-dummy-target"
+
 # We need to keep bitbake tools in PATH
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 86d159ed209..cae12eb8781 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -494,7 +494,7 @@ def sstate_get_manifest_filename(task, d):
         d2.setVar("SSTATE_PKGARCH", extrainf)
     return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
 
-@bb.parse.vardepsexclude("BBEXTENDCURR", "BBEXTENDVARIANT", "OVERRIDES", "PACKAGE_EXTRA_ARCHS")
+@bb.parse.vardepsexclude("BBEXTENDCURR", "BBEXTENDVARIANT", "OVERRIDES", "PACKAGE_EXTRA_ARCHS", "DUMMY_PACKAGE_ARCHS_SDK", "DUMMY_PACKAGE_ARCHS_TARGET")
 def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     d2 = d
     variant = ''
@@ -513,10 +513,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     if taskdata.endswith("-native"):
         pkgarchs = ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTRING}"]
     elif taskdata.startswith("nativesdk-") or "-cross-canadian" in taskdata:
-        pkgarchs = ["${SDK_ARCH}-${SDKPKGSUFFIX}",
-                    "allarch",
-                    "buildtools-dummy-${SDKPKGSUFFIX}",
-                    "sdk-provides-dummy-${SDKPKGSUFFIX}"]
+        pkgarchs = ["${SDK_ARCH}-${SDKPKGSUFFIX}", "allarch", (d.getVar("DUMMY_PACKAGE_ARCHS_SDK") or "").split()]
     elif "-cross-" in taskdata:
         pkgarchs = ["${BUILD_ARCH}"]
     elif "-crosssdk" in taskdata:
@@ -525,7 +522,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         pkgarchs = ['${MACHINE_ARCH}']
         pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
         pkgarchs.append('allarch')
-        pkgarchs.append('sdk-provides-dummy-target')
+        pkgarchs.extend((d.getVar("DUMMY_PACKAGE_ARCHS_TARGET") or "").split() )
         pkgarchs.append('${SDK_ARCH}-${SDKPKGSUFFIX}')
 
     searched_manifests = []

