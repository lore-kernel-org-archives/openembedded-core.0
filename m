Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6384BE7719D
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.20167.1736256698082582264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F417UKz7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21675fd60feso31752155ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256697; x=1736861497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp4sX90QaBqBjcM0DgZWxE1NRTsCA2L3qv2OsvD77sY=;
        b=F417UKz7mKN0QWwLxZv4yZo/CLK+7Nd9MeJjYbms5+K7RpZxXkvuYECPTtfsPe1Knx
         AeUe+rCylWKJ2WqS8GleUTbV699d7FSBj5gXqp2hCQbUMNIQYbp/qzQRYQELgDMvDezs
         p72WVSFdNDoxzlfKRtUElbbH2epFPy53JtsRdeZ83jJSlg7EFa2Eo3658MMFJambss7T
         14Cxs95+5+j6d/dgCmYmZz3GIOjyy98zbi4d77UOG57QhxPcuu+9BuFQkEgP7wxoKqTM
         R9zpuLTg6+3T0278iLRPOrsFYHYAAmAsFYeZHzlsebu6X+AcI/b/CorPiPeSLW19jH7L
         V/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256697; x=1736861497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp4sX90QaBqBjcM0DgZWxE1NRTsCA2L3qv2OsvD77sY=;
        b=ctZ7XOr6lGbB3J7hIhbAWV89Z7qx840szcwkRPTz0CMVXN0kv+hvPQDmwanpTjYCy5
         WvMMFy9S5CXGts0kGf7WtvVORFRd9l1DhLFt8ey+37SEEMMD3mRyB0BRuH+/OEXWHLIH
         OgRBuSKRRDip2W7sRB+Uk5oAGwD09Lj/wiQglJHVIl9r0IT9ZCpOKm+gzDvez3kEpTed
         qhzmDOSbTWuY/grL9jatqOojrHuymKM3fnoLLVCJekwlJxEIcTXAqhwBSE6Ro+hcYTVt
         oa5K+o4ku6Fls9JaxZxX/SOXSM2ApTt0yfCmwz0QWeW+7zNn0mSWtx2vusb6B0th/eZu
         DY5g==
X-Gm-Message-State: AOJu0YzW5snjhCdz4kODgLlzmEBz+fdbvZarImh4qtWXCPNL8JOrMeLv
	VnSgKvAm1JRREAsJ+yYg/0M9GK/3J3fHOSSJ75uxg6+n93KaP/iydH/sVSkuixczS0Gvw3tuMQ1
	j
X-Gm-Gg: ASbGncuJGDS6JRVVAfclxoKyWg9fz0b5VUCbt8BfDQJjHvRFbqVG2Au9ZSDr55Ta5m0
	o7o8nEQUo83FGtFyTiDNYiApUSqpCdGKkTiRUVFR5tUm8ZzbwK1eT1xG2Y9nA6KhGz90J/mZgiz
	vE/7E7nostC3hPDzB11s7MtGR5k03rzF7k4ibAZS55BkQL5CrIp2caNGnq6+MQAFpo4jSYGpAsj
	2BXAgdcG5/QunrGrT0ped9Cg6UsY9CvPGhHpZLWxon+5A==
X-Google-Smtp-Source: AGHT+IGkyfOcMRuVo38/mJHs1ci4oLPAx0NH4FEI4/T7Qd5/vit2XnZRYWYxCAtOjl6fvl6ll9Ffxg==
X-Received: by 2002:a05:6a20:431d:b0:1e1:a5be:2999 with SMTP id adf61e73a8af0-1e5e081c9f9mr103568466637.41.1736256697208;
        Tue, 07 Jan 2025 05:31:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] webkitgtk: Security fix for CVE-2024-40776 and CVE-2024-40780
Date: Tue,  7 Jan 2025 05:31:12 -0800
Message-ID: <e4c82db8a7c3273fe30bc99880fcdcd7ab061924.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209461

From: Rohini Sangam <rsangam@mvista.com>

CVE fixed:
- CVE-2024-40776 webkitgtk: Use after free may lead to Remote Code Execution
- CVE-2024-40780 webkitgtk: Out-of-bounds read was addressed with improved bounds checking

Upstream-Status: Backport from https://github.com/WebKit/WebKit/commit/b951404ea74ae432312a83138f5c8945a0d09e1b and https://github.com/WebKit/WebKit/commit/e83e4c7460972898dc06a5f5ab36eed7c6b101b5

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


