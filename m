Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63E4E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 05:28:13 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.25119.1735882090524931153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 21:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DuGaA5fJ;
 spf=pass (domain: mvista.com, ip: 209.85.166.44, mailfrom: rsangam@mvista.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844c9993c56so1013945339f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 21:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735882089; x=1736486889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4aXUUkJ/5+1ggGa8rPtnRrLwRfF4Ifk+mj8x6kKVzmg=;
        b=DuGaA5fJMpYeBJRavzsU1gaAdy4W/z/vH54QUdF9u182xQ3t0LvjoNTtjB5ChkTRL4
         iMDLclDksG+ymdbo04ordBLtOVsxMdIoZv6ETCesOY17hfeSa5jg4MkDYBFtWEPtAOXo
         dF73+j7ch4zXKA/bFOcv43WOLYAobt1Nu9d+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735882089; x=1736486889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aXUUkJ/5+1ggGa8rPtnRrLwRfF4Ifk+mj8x6kKVzmg=;
        b=qeWb/vbrC1gQ0YrKTF1Q39bHQp5GUccduloBaibNyNtctlPu5Tt3zlXnTYwo28V0tQ
         Cy53dKakv3+isH76q4QfbYOvLL/U17toMFMO1V1DTeIZs0UsbMD6RqVjOkbyx8JhqKoc
         6LF+CZ6H1I60BCj8kEwV3a/kGvfat03Bn01Xozg9zeP4hSyM3fAZdsq4L/o9jBf08E0f
         53YJAiZ6V4WKL/keooYJnC9WAsBcaQFNCsQ5WR7oGhEMvsqXu7n2WfyeqW+R5aZS1JKF
         f4kQBUw2GFXYGXIa0ohO3mgj7wYGhB+ZTZAz5K+77sk72otb6gPmNEiF7OZi75+f7lo2
         idOg==
X-Gm-Message-State: AOJu0YxmhZMcB7aw8RAECoV34Mis6eVoZ7jPToMrpWjdMeorE/N3cPQ5
	mvn7YBGEy86ltedtR+eiwcHVkQnmJC43/WMOLMJ6LROAv+HtX7T7oVTLkkzLofBdg3tzvZpQmAO
	S
X-Gm-Gg: ASbGncvJbgG3eL+WYpwyHTEZ7YEQraLdGldXuTAcCB1pKnXDoQsRjcZAeA/hRfMO2Jg
	cD4JlBUycjTXURHybHk6pzv7JC4gv8OF4lLSzCe2uto+ULwAaeAsFwXHelYtj3Z/ayVIr1RgQzT
	Jvk2OsMuNqImjWfKtEuL1N2dmXCXy6Qf/Wq/BzBKPQ/Ka7GkOF90jKwyIy3zvh6NNncYxCPCZOP
	P65KHyiyFHgOKs3CSRU291qmj6jvMYPZwxRQVPHYNOgQmnI0f7RJ4mXDbjzyIWZzXgp
X-Google-Smtp-Source: AGHT+IFOMkT50cXKhxFeqnCF26n4eJrTE36mS0jGhFutLotZWTQFmYx5D41nI8SaBEv4UTE9Affscw==
X-Received: by 2002:a05:6602:1594:b0:841:a678:de2e with SMTP id ca18e2360f4ac-8499e498f5amr4299664939f.2.1735882088850;
        Thu, 02 Jan 2025 21:28:08 -0800 (PST)
Received: from MVIN00040.mvista.com ([2405:201:d00d:4187:6309:fb53:5f69:51b])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d80fa91sm699352639f.27.2025.01.02.21.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:28:07 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>,
	Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] webkitgtk: Security fix for CVE-2024-40776 and CVE-2024-40780
Date: Fri,  3 Jan 2025 10:57:53 +0530
Message-Id: <20250103052753.7418-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 05:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209318

CVE fixed:
- CVE-2024-40776 webkitgtk: Use after free may lead to Remote Code Execution
- CVE-2024-40780 webkitgtk: Out-of-bounds read was addressed with improved bounds checking

Upstream-Status: Backport from https://github.com/WebKit/WebKit/commit/b951404ea74ae432312a83138f5c8945a0d09e1b and https://github.com/WebKit/WebKit/commit/e83e4c7460972898dc06a5f5ab36eed7c6b101b5

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../webkit/webkitgtk/CVE-2024-40776.patch     | 141 ++++++++++++++++++
 .../webkit/webkitgtk/CVE-2024-40780.patch     |  94 ++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   2 +
 3 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40776.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40780.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40776.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40776.patch
new file mode 100644
index 0000000000..60f18168fe
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40776.patch
@@ -0,0 +1,141 @@
+From b951404ea74ae432312a83138f5c8945a0d09e1b Mon Sep 17 00:00:00 2001
+From: Jean-Yves Avenard <jya@apple.com>
+Date: Wed, 24 Apr 2024 19:01:06 -0700
+Subject: [PATCH] CVE-2024-40776: Always copy all audio channels to the AudioBus 
+to guarantee data lifetime.
+
+Upstream-Status: Backport from https://github.com/WebKit/WebKit/commit/b951404ea74ae432312a83138f5c8945a0d09e1b
+CVE: CVE-2024-40776
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ ...et-concurrent-resampler-crash-expected.txt |  1 +
+ ...dioworklet-concurrent-resampler-crash.html | 44 +++++++++++++++++++
+ .../platform/audio/MultiChannelResampler.cpp  | 21 ++-------
+ .../platform/audio/MultiChannelResampler.h    |  2 -
+ 4 files changed, 48 insertions(+), 20 deletions(-)
+ create mode 100644 LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash-expected.txt
+ create mode 100644 LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash.html
+
+diff --git a/LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash-expected.txt b/LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash-expected.txt
+new file mode 100644
+index 00000000..654ddf7f
+--- /dev/null
++++ b/LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash-expected.txt
+@@ -0,0 +1 @@
++This test passes if it does not crash.
+diff --git a/LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash.html b/LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash.html
+new file mode 100644
+index 00000000..b3ab181d
+--- /dev/null
++++ b/LayoutTests/webaudio/crashtest/audioworklet-concurrent-resampler-crash.html
+@@ -0,0 +1,44 @@
++<html>
++<head>
++    <script>
++        let worklet_source = `
++            class Processor extends AudioWorkletProcessor {
++                process(inputs, outputs, parameters) {
++                    return true;
++                }
++            }
++            registerProcessor('P2', Processor);
++        `;
++
++        let blob = new Blob([worklet_source], { type: 'application/javascript' });
++        let worklet = URL.createObjectURL(blob);
++
++        var ctx = new AudioContext({ sampleRate: 44100});
++        const dest = ctx.destination;
++        dest.channelCountMode = "max";
++
++        async function main() {
++            await ctx.audioWorklet.addModule(worklet);
++            var script_processor = ctx.createScriptProcessor();
++            script_processor.onaudioprocess = function() {
++                dest.channelCount = 1;
++                audio_worklet.disconnect();
++                if (window.testRunner)
++                    testRunner.notifyDone();
++            }
++            var audio_worklet = new AudioWorkletNode(ctx, "P2");
++            script_processor.connect(audio_worklet);
++            audio_worklet.connect(dest);
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
+diff --git a/Source/WebCore/platform/audio/MultiChannelResampler.cpp b/Source/WebCore/platform/audio/MultiChannelResampler.cpp
+index 1dadc58c..13db6f26 100644
+--- a/Source/WebCore/platform/audio/MultiChannelResampler.cpp
++++ b/Source/WebCore/platform/audio/MultiChannelResampler.cpp
+@@ -41,18 +41,8 @@ namespace WebCore {
+ MultiChannelResampler::MultiChannelResampler(double scaleFactor, unsigned numberOfChannels, unsigned requestFrames, Function<void(AudioBus*, size_t framesToProcess)>&& provideInput)
+     : m_numberOfChannels(numberOfChannels)
+     , m_provideInput(WTFMove(provideInput))
+-    , m_multiChannelBus(AudioBus::create(numberOfChannels, requestFrames, false))
++    , m_multiChannelBus(AudioBus::create(numberOfChannels, requestFrames))
+ {
+-    // As an optimization, we will use the buffer passed to provideInputForChannel() as channel memory for the first channel so we
+-    // only need to allocate memory if there is more than one channel.
+-    if (numberOfChannels > 1) {
+-        m_channelsMemory.reserveInitialCapacity(numberOfChannels - 1);
+-        for (unsigned channelIndex = 1; channelIndex < numberOfChannels; ++channelIndex) {
+-            m_channelsMemory.uncheckedAppend(makeUnique<AudioFloatArray>(requestFrames));
+-            m_multiChannelBus->setChannelMemory(channelIndex, m_channelsMemory.last()->data(), requestFrames);
+-        }
+-    }
+-
+     // Create each channel's resampler.
+     for (unsigned channelIndex = 0; channelIndex < numberOfChannels; ++channelIndex)
+         m_kernels.append(makeUnique<SincResampler>(scaleFactor, requestFrames, std::bind(&MultiChannelResampler::provideInputForChannel, this, std::placeholders::_1, std::placeholders::_2, channelIndex)));
+@@ -89,15 +79,10 @@ void MultiChannelResampler::process(AudioBus* destination, size_t framesToProces
+ void MultiChannelResampler::provideInputForChannel(float* buffer, size_t framesToProcess, unsigned channelIndex)
+ {
+     ASSERT(channelIndex < m_multiChannelBus->numberOfChannels());
+-    ASSERT(framesToProcess == m_multiChannelBus->length());
++    ASSERT(framesToProcess <= m_multiChannelBus->length());
+ 
+-    if (!channelIndex) {
+-        // As an optimization, we use the provided buffer as memory for the first channel in the AudioBus. This avoids
+-        // having to memcpy() for the first channel.
+-        m_multiChannelBus->setChannelMemory(0, buffer, framesToProcess);
++    if (!channelIndex)
+         m_provideInput(m_multiChannelBus.get(), framesToProcess);
+-        return;
+-    }
+ 
+     // Copy the channel data from what we received from m_multiChannelProvider.
+     memcpy(buffer, m_multiChannelBus->channel(channelIndex)->data(), sizeof(float) * framesToProcess);
+diff --git a/Source/WebCore/platform/audio/MultiChannelResampler.h b/Source/WebCore/platform/audio/MultiChannelResampler.h
+index e96cc56b..274fe364 100644
+--- a/Source/WebCore/platform/audio/MultiChannelResampler.h
++++ b/Source/WebCore/platform/audio/MultiChannelResampler.h
+@@ -29,7 +29,6 @@
+ #ifndef MultiChannelResampler_h
+ #define MultiChannelResampler_h
+ 
+-#include "AudioArray.h"
+ #include <memory>
+ #include <wtf/Function.h>
+ #include <wtf/Vector.h>
+@@ -62,7 +61,6 @@ private:
+     size_t m_outputFramesReady { 0 };
+     Function<void(AudioBus*, size_t framesToProcess)> m_provideInput;
+     RefPtr<AudioBus> m_multiChannelBus;
+-    Vector<std::unique_ptr<AudioFloatArray>> m_channelsMemory;
+ };
+ 
+ } // namespace WebCore
+-- 
+2.35.7
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40780.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40780.patch
new file mode 100644
index 0000000000..ab41213d7d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40780.patch
@@ -0,0 +1,94 @@
+From e83e4c7460972898dc06a5f5ab36eed7c6b101b5 Mon Sep 17 00:00:00 2001
+From: Jer Noble <jer.noble@apple.com>
+Date: Tue, 11 Jun 2024 11:54:06 -0700
+Subject: [PATCH] CVE-2024-40780: Add check in AudioBufferSourceNode::renderFromBuffer() 
+when detune is set to large negative value
+
+Upstream-Status: Backport from https://github.com/WebKit/WebKit/commit/e83e4c7460972898dc06a5f5ab36eed7c6b101b5
+CVE: CVE-2024-40780
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ ...buffersourcenode-detune-crash-expected.txt | 10 +++++++
+ .../audiobuffersourcenode-detune-crash.html   | 30 +++++++++++++++++++
+ .../webaudio/AudioBufferSourceNode.cpp        |  7 +++++
+ 3 files changed, 47 insertions(+)
+ create mode 100644 LayoutTests/webaudio/audiobuffersourcenode-detune-crash-expected.txt
+ create mode 100644 LayoutTests/webaudio/audiobuffersourcenode-detune-crash.html
+
+diff --git a/LayoutTests/webaudio/audiobuffersourcenode-detune-crash-expected.txt b/LayoutTests/webaudio/audiobuffersourcenode-detune-crash-expected.txt
+new file mode 100644
+index 00000000..914ba0b1
+--- /dev/null
++++ b/LayoutTests/webaudio/audiobuffersourcenode-detune-crash-expected.txt
+@@ -0,0 +1,10 @@
++Attempting to create a AudioBufferSourceNode with a large negative detune value should not crash.
++
++On success, you will see a series of "PASS" messages, followed by "TEST COMPLETE".
++
++
++PASS Test passed because it did not crash.
++PASS successfullyParsed is true
++
++TEST COMPLETE
++
+diff --git a/LayoutTests/webaudio/audiobuffersourcenode-detune-crash.html b/LayoutTests/webaudio/audiobuffersourcenode-detune-crash.html
+new file mode 100644
+index 00000000..e8af579d
+--- /dev/null
++++ b/LayoutTests/webaudio/audiobuffersourcenode-detune-crash.html
+@@ -0,0 +1,30 @@
++<!DOCTYPE html>
++<html>
++    <head>
++    <script src="../resources/js-test-pre.js"></script>
++    <script src="resources/audio-testing.js"></script>
++    </head>
++    <body>
++        <script>
++            description("Attempting to create a AudioBufferSourceNode with a large negative detune value should not crash.");
++
++            jsTestIsAsync = true;
++
++            var context = new AudioContext();
++            var src = context.createBufferSource();
++            var buffer = context.createBuffer(1, 256, 44100);
++            src.buffer = buffer;
++            src.start(undefined, 1);
++            src.connect(context.listener.positionX, 0);
++            var panner = context.createPanner();
++            src.detune.value = -0xffffff;
++            panner.connect(context.destination);
++            setTimeout(() => {
++                testPassed("Test passed because it did not crash.");
++                finishJSTest();
++            }, 100);
++        </script>
++
++        <script src="../resources/js-test-post.js"></script>
++    </body>
++</html>
+diff --git a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
+index 689d37a1..f68e7ff5 100644
+--- a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
++++ b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
+@@ -327,9 +327,16 @@ bool AudioBufferSourceNode::renderFromBuffer(AudioBus* bus, unsigned destination
+         virtualReadIndex = readIndex;
+     } else if (!pitchRate) {
+         unsigned readIndex = static_cast<unsigned>(virtualReadIndex);
++        int deltaFrames = static_cast<int>(virtualDeltaFrames);
++        maxFrame = static_cast<unsigned>(virtualMaxFrame);
++
++        if (readIndex >= maxFrame)
++            readIndex -= deltaFrames;
+ 
+         for (unsigned i = 0; i < numberOfChannels; ++i)
+             std::fill_n(destinationChannels[i] + writeIndex, framesToProcess, sourceChannels[i][readIndex]);
++
++        virtualReadIndex = readIndex;
+     } else if (reverse) {
+         unsigned maxFrame = static_cast<unsigned>(virtualMaxFrame);
+         unsigned minFrame = static_cast<unsigned>(floorf(virtualMinFrame));
+-- 
+2.35.7
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 4849ee50ff..2006d1d55e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2023-32439.patch \
            file://CVE-2024-40779.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
+           file://CVE-2024-40776.patch \
+           file://CVE-2024-40780.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


