Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AB3CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 07:31:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.8290.1727163099699725160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 00:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=h46mKHQP;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db299608e7so3250884a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1727163099; x=1727767899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns1K1a3rviAeMYCwQwbRCcD/3taLUvZyR3T0j8UqrUk=;
        b=h46mKHQPMTOYEiMplarJELwdDIuWDjjJm3B3SZTb6Xd4xmnkDwGQQ+z5xL1o8s4Uyj
         WAU28yqSYQuE/HY9rCzd2c4wC6yREeXoraZ5ke7Jh0hOlw3e4iaSOgJIzBv8Ou0XTH0I
         iMgC5cxu3iIKh1WWO2ukigBtIWCXHlhtuyo/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163099; x=1727767899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ns1K1a3rviAeMYCwQwbRCcD/3taLUvZyR3T0j8UqrUk=;
        b=vYqF4WuAaYYpJIwA2J2n9a2D64uxH20ZRLgrGw7bAZR/Im/Q+XrWnqmcJfUMdOk8bF
         4TQFv+W8ebfIF/1pz6K5gPCQ7DNoMPvbblyLHIzf4Aggqi5ukoFeQEJXWdd8D0D8ldOZ
         Sc9HSKna2lsgYjK9GGripJYZIaSZrezJxbSW/kNp2/cOWbOJMRGZ5sRJt8eOh8weOqtA
         K3/yAvKmQ5/TAnpW2DImccwwAqr6xFy0DwKYd611iyco2rxn6rAortFJjOsHwyYTwI17
         llLxyanCsrJtzAww0XhxfEolQ0NSk2jZT147R961YJsbinbaScXAo+peYqm8Hi4xCBlJ
         ukgQ==
X-Gm-Message-State: AOJu0YzGR9yYshfuTxKSY5mpBGZMTcZv+q0dXVGX4RAPCKgY4xv3ZKCv
	CS+UL+Lei02y+LodKoEQx74yWmrGSkYkQxhda608WQJumrQt6aG0F6QmMuYgiRPW/ALULjIoZm4
	1
X-Google-Smtp-Source: AGHT+IE5IN0nqlr/bpFB4/qGrN+UX3mm5TAQxuIHAUfZrtPWKIhx0SLfoeBD5oJUXQTm80+L8gp20A==
X-Received: by 2002:a05:6a20:98a:b0:1d1:1795:4ee5 with SMTP id adf61e73a8af0-1d30a926875mr15025063637.3.1727163098639;
        Tue, 24 Sep 2024 00:31:38 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17dff20sm5554595ad.159.2024.09.24.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 00:31:38 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] webkitgtk: Security fix CVE-2024-40779
Date: Tue, 24 Sep 2024 13:01:31 +0530
Message-Id: <20240924073131.652188-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204836

Upstream-Status: Backport from https://github.com/WebKit/WebKit/commit/2fe5ae29a5f6434ef456afe9673a4f400ec63848

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../webkit/webkitgtk/CVE-2024-40779.patch     | 92 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb  |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
new file mode 100644
index 0000000000..1a7e27dcb6
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
@@ -0,0 +1,92 @@
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
+https://source.chromium.org/chromium/chromium/src//main:third_party/blink/renderer/modules/webaudio/audio_buffer_source_handler.cc;l=336-341
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
+index 42f2779e..7963fb9f 100644
+--- a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
++++ b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
+@@ -343,6 +343,12 @@ bool AudioBufferSourceNode::renderFromBuffer(AudioBus* bus, unsigned destination
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
+2.25.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index c4a3c464c1..29f834ee9b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            file://0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch \
            file://0002-More-dynamicDowncast-adoption-in-platform-code.patch \
+           file://CVE-2024-40779.patch \
            "
 SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
-- 
2.25.1


