Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DD6CF9C69
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:13 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.36264.1727097246302494591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h5GKRnIH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71957eb256bso3798423b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097245; x=1727702045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIVk66brkN50XebiMYM5tvfmsSp/0GgJ7aYIiBs3GiA=;
        b=h5GKRnIHztZ2jbWrwXLOwPgO2KGri8L+y7ocRNf1whEAOI/JV15Qzhcj1NzZVnBxpi
         8ttY2eX8lON7RLpoIyUOyt3uvRrzTsfVOQs8z4coaRLZk0UOLBIU9bnNR1qkJuQJErAs
         3WBBnlwNjQdshNYDsVuA0xUaw7BXmslGDno21aoLoF/+GF3RaHs8vsS+oJTJGYqMSzgI
         C4oD2WWbCWPD8QHNm138oiSMZbkCVojLdCVciXQUf9h99uteKSENvzEc+xlZqSQtEKPN
         3zAPj+GrMnbkcC+ia1m0oTSe9Pr3cTyYN3/Fp6LQqC5xEuSQo5XieynxdEpstPEHiRyN
         CdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097245; x=1727702045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIVk66brkN50XebiMYM5tvfmsSp/0GgJ7aYIiBs3GiA=;
        b=A+mxXA3WQ+81aYC5MOutebzixze64RTQrveU8QJvLqrgVOvO+V0+1qR5puom0eN/eJ
         flDBa6mz0wP24QaRJvHjGXK1Q9SSpSMq6U9NB+wC709TBv/W/QAyIluUW49OxwZ7YCYY
         KqU7p/sbsur3TL3ZO4yAgsKzFiXplvI3/F2g+Ap0m5tydjFzZas+wwZc8Kho8jj1UPV6
         jNS4laesrTf2IzAMbkGY45j0xGXAcEfJQOIUCjRe+sMhBHgzHPDBIzVZXmxVfXugthil
         EVTeBiBsZxxDwnpvwBCxUs6oRR/dxQxMXFmIl30McEvrAmgiRTX270boF41ucsFlxUto
         Vfvg==
X-Gm-Message-State: AOJu0YxzysJjAPWdyDNzZSisyrzd2Vdeyzq7dHvm4zQmWQXXTT7MOxtv
	7286EFznB7Ay/F3Lm4/MDAeHdYIWcDMSSdJXFJ9NYshDrAFU5XnWuI8D8HyT44IicaHPwV80JSD
	UwzI=
X-Google-Smtp-Source: AGHT+IHrvrFfSqqY2v9kJiIngmtGl+Wl0oQOGjh9ibx98AxJhbScDUX1ScBve+daAqmNr35IkP87Gw==
X-Received: by 2002:a05:6a21:1798:b0:1d2:eadb:bb2e with SMTP id adf61e73a8af0-1d30a987f4cmr16988670637.33.1727097245520;
        Mon, 23 Sep 2024 06:14:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] webkitgtk: Security fix CVE-2024-40779
Date: Mon, 23 Sep 2024 06:13:43 -0700
Message-Id: <2afeb07fc459014bf269c7b6ee1d62c19694977f.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204808

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from [https://github.com/WebKit/WebKit/commit/2fe5ae29a5f6434ef456afe9673a4f400ec63848]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


