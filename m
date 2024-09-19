Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3FBCDD57B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 13:40:23 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.19860.1726753217361222755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 06:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CGa6eAsH;
 spf=pass (domain: mvista.com, ip: 209.85.214.194, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-20696938f86so7440455ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726753216; x=1727358016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pmJ5FyvnW7+PZ3i0vUYdbj5B4+Z1gT6E1is4myXeqk=;
        b=CGa6eAsH8WccKbdTKVpWEL6qcjcjsIvvBTIluNrykERxgNXVHfK0z4NbOV2jV/M1WN
         +wk/guTn1OQwgczXsGD6ZrxZuKIyYLDKu0/lil+L20gdxW99LXCiPEClnXp+D8F7+TyY
         xZgqvARfrcXMy6iwtXyMZh1LvbHDLTGuIt7o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726753216; x=1727358016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pmJ5FyvnW7+PZ3i0vUYdbj5B4+Z1gT6E1is4myXeqk=;
        b=w88oBLSpmH1GjjITcR6Yt1MZnWDvAoizhpscGnTPJ6PZZQYY3AXrP9gGY6MvrNZBuu
         8K3Ld6zM1reHrtP3AF6HLuDbSWOTnfSPQmt5PIX4IJStCf0MyizoT3WupFq6e6V4fcw/
         paVEeTZCywQjy2w4pbnFAtHoTs1jqH+R+7Gj3f6/V7QLI9+kDCR8x2PF+P3NFJB15917
         BlHUX/e+KbYZ2IKjxEbDD8zDpQd5s5UGfb1rM11beqiShOj7K/X+jf1zCXLdJKCl3d7D
         BYyoB7+DQ2D8X6gBt7ouSyZX74V7bm+EZS965PbxU5kdtjeCEuMN1B9D1AT+5MO2eEnp
         4vUQ==
X-Gm-Message-State: AOJu0Yylkmb42a5tX+bOQHO0vXbMmSr64o5dT8q/POsSxvybn9LeaHxT
	buloIyehIIctqQCH1/h+BjHUuA/PHD8l/KnbSRRBzjpdeGcRnmHwR5d1TCXsN19nw6FHoNrgaHB
	CxgvrLw==
X-Google-Smtp-Source: AGHT+IHyF4gu2pFLbf9teFcpSRPCPL9bIaz85xSeRP8FiiqctjNy042LMvqPaKGeS78c42SJkmSarw==
X-Received: by 2002:a17:902:d4c2:b0:201:f6e8:637f with SMTP id d9443c01a7336-2076e31a877mr470235985ad.11.1726753215995;
        Thu, 19 Sep 2024 06:40:15 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.237.101])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945da8c9sm80401285ad.17.2024.09.19.06.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 06:40:15 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] webkitgtk: Security fix CVE-2024-40779
Date: Thu, 19 Sep 2024 19:10:05 +0530
Message-Id: <20240919134005.7797-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204688

Upstream-Status: Backport from [https://github.com/WebKit/WebKit/commit/2fe5ae29a5f6434ef456afe9673a4f400ec63848]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../webkit/webkitgtk/CVE-2024-40779.patch     | 91 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
new file mode 100644
index 0000000000..6fac907256
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
@@ -0,0 +1,91 @@
+From 2fe5ae29a5f6434ef456afe9673a4f400ec63848 Mon Sep 17 00:00:00 2001
+From: Jean-Yves Avenard <jya@apple.com>
+Date: Fri, 14 Jun 2024 16:08:19 -0700
+Subject: [PATCH] Cherry-pick 272448.1085@safari-7618.3.10-branch
+ (ff52ff7cb64e). https://bugs.webkit.org/show_bug.cgi?id=275431
+
+HeapBufferOverflow in computeSampleUsingLinearInterpolation
+https://bugs.webkit.org/show_bug.cgi?id=275431
+rdar://125617812
+
+Reviewed by Youenn Fablet.
+
+Add boundary check.
+This is a copy of blink code for that same function.
+https://source.chromium.org/chromium/chromium/src/+/main:third_party/blink/renderer/modules/webaudio/audio_buffer_source_handler.cc;l=336-341
+
+* LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt: Added.
+* LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html: Added.
+* Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp:
+(WebCore::AudioBufferSourceNode::renderFromBuffer):
+
+Canonical link: https://commits.webkit.org/274313.347@webkitglib/2.44
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2fe5ae29a5f6434ef456afe9673a4f400ec63848]
+CVE: CVE-2024-40779
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ ...er-sourcenode-resampler-crash-expected.txt |  1 +
+ ...udiobuffer-sourcenode-resampler-crash.html | 25 +++++++++++++++++++
+ .../webaudio/AudioBufferSourceNode.cpp        |  6 +++++
+ 3 files changed, 32 insertions(+)
+ create mode 100644 LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt
+ create mode 100644 LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html
+
+diff --git a/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt
+new file mode 100644
+index 00000000..654ddf7f
+--- /dev/null
++++ b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt
+@@ -0,0 +1 @@
++This test passes if it does not crash.
+diff --git a/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html
+new file mode 100644
+index 00000000..5fb2dd8c
+--- /dev/null
++++ b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html
+@@ -0,0 +1,25 @@
++<html>
++<head>
++    <script>
++        async function main() {
++            var ctx = new AudioContext();
++            var src = new AudioBufferSourceNode(ctx);
++            src.buffer = ctx.createBuffer(1, 8192, 44100);
++            src.start(undefined, 0.5);
++            src.playbackRate.value = -1;
++            src.connect(ctx.destination, 0, 0);
++            if (window.testRunner)
++                testRunner.notifyDone();
++        }
++    </script>
++</head>
++<body onload="main()">
++    <p>This test passes if it does not crash.</p>
++    <script>
++    if (window.testRunner) {
++        testRunner.waitUntilDone();
++        testRunner.dumpAsText();
++    }
++    </script>
++</body>
++</html>
+diff --git a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
+index 35b8c818..689d37a1 100644
+--- a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
++++ b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
+@@ -342,6 +342,12 @@ bool AudioBufferSourceNode::renderFromBuffer(AudioBus* bus, unsigned destination
+             if (readIndex2 >= maxFrame)
+                 readIndex2 = m_isLooping ? minFrame : readIndex;
+
++            // Final sanity check on buffer access.
++            // FIXME: as an optimization, try to get rid of this inner-loop check and
++            // put assertions and guards before the loop.
++            if (readIndex >= bufferLength || readIndex2 >= bufferLength)
++                break;
++
+             // Linear interpolation.
+             for (unsigned i = 0; i < numberOfChannels; ++i) {
+                 float* destination = destinationChannels[i];
+--
+2.34.1
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index f4b8456749..a2d455ab92 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2023-23529.patch \
            file://CVE-2022-48503.patch \
            file://CVE-2023-32439.patch \
+           file://CVE-2024-40779.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


