Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B446C4450A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 05:05:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.799.1784351111731811517
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 22:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jdGrLQ5e;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-470174001a0so2759275f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 22:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784351110; x=1784955910; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8TRff+835TVJzMKsDf3IQDz58J4K42kR2tk2fnb0Gw=;
        b=jdGrLQ5eYFnovkGrAcv5ofnKGSnO6XSadzpDfx1PEygbzya3As86QWTW4NOLCU5WPJ
         lxET5v+ROQYYkxPEuO8IMQ1DGneiz5zW8aYe6fVDT9Etn4JEtqjjvjRsJ/tGjsdVJ0uT
         rULiNAuflymyLSx4nfnqlVMqy40kaCbpdhhe38Of7eDydyl1VvWF3+JIGgM6kevybk5k
         H4dn+0RkRc0ENAeBljhC7/yL/R24LQZIFUuLTTSgj61w79caFcy9VdQFg8U7n/ExMdAA
         IzMh1N8ha9p0q0ffmAxWfaH3KJ2eB/jYFNfI64TmLFbr7fqjETU0lvE5NQNBNWk0HNvh
         7vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784351110; x=1784955910;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8TRff+835TVJzMKsDf3IQDz58J4K42kR2tk2fnb0Gw=;
        b=hCoDqNJh5e9gDG6ctStp7EAUeDSdMGUqCbc4b7rJbuLHYFtWoTv0NiJiIoKWronBZy
         M2+agOSvfGyhxhPfF5g3/9zeLAyZOYepZvYSL+ms9J3UXd9ifQnhJV+dLe9n+rxNc4Lo
         bi76/PNIrzAXI3f/j/0g2zKw0t2fYSuedkqZ44bDNwFCYS8rBNx6+HW45jJmEsItWrLi
         XYhAcrshZl7L4TaLQSM0e62424kYm6N6RYwYkmRU240MPNApw32lEOvOd9W/efP7M6+i
         fkiv6Bn2TTs+txgbMgL5+z3tq+iGpeFNyCdqn0KBWI5QdOQY0ghdC5QfcyrjoXspbDAR
         Im/g==
X-Gm-Message-State: AOJu0YyviEadc6BlVH2n15/0w1Mh7EXdrqyUvwomXPzrCdVBxGqCmAxn
	kHQOu/pP4lccXKFxVgDFoo0MCczky65LIU4csJSA/dXdGerili/beXy3D5iTDQ==
X-Gm-Gg: AfdE7cmleDoDBpYEp4OQhqDSIvdtEnmosKiEb+d3oxv0PBihFHKiMVqIX7XwxCkfJ65
	NzdPNDm5NWjk3Ifoeo2k5u3k9O4jyUWz3K7wFAaR+Fwo0r8nwluRCQLJvIiEbeD5Q0ofUGAqwp9
	SwTWwbdtKAUnQsI+r4xsUf/hIQERYueC7VNvdcQcS9n5PIkqNqjzzoQBjJqFJC/Yqt4nGYfWBgi
	LhXIrJZo0xiEgukz6WwZhfnm+3epj9roz0oEU8s1uw7IxKPMQzhAf3EV4cNJon18TxgV7cmLKMm
	/5HH1x1YOiK29/mWmaxE3P5PTc2Rs1WeN9LYLUC1RgVUvaUSsN/927yzoUUCMm7T5g9TaMdG75N
	LExbDa6X4d6JhJ7da7QEjLhbC/YZ6cFgQmkaHS2yIEMttnuA8LWAd50Mjq4aKBDZ4vg==
X-Received: by 2002:a05:6000:4615:b0:47d:d812:e03b with SMTP id ffacd0b85a97d-47f623351f1mr6903060f8f.43.1784351109904;
        Fri, 17 Jul 2026 22:05:09 -0700 (PDT)
Received: from term011.lan (BC24411C.dsl.pool.telekom.hu. [188.36.65.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm7781005f8f.0.2026.07.17.22.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 22:05:09 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/3] mesa-libclc: New recipe for forking libclc for Rusticl purposes in Mesa
Date: Sat, 18 Jul 2026 07:05:01 +0200
Message-ID: <20260718050502.62359-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718050502.62359-1-zboszor@gmail.com>
References: <20260718050502.62359-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 05:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241230

See the reasoning and discussion at
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020

TL;DR: LLVM constantly introduces breaking changes that cause
regressions for running OpenCL CTS with Rusticl and finally
Karol Herbst had enough.

This fork is from the LLVM 22 version of libclc and contains the
necessary fixes to make Rusticl pass OpenCL CTS.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-libclc_git.bb | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-libclc_git.bb

diff --git a/meta/recipes-graphics/mesa/mesa-libclc_git.bb b/meta/recipes-graphics/mesa/mesa-libclc_git.bb
new file mode 100644
index 0000000000..8a3a78d051
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-libclc_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Mesa fork of libclc: Implementation of the library requirements of the OpenCL C programming language."
+HOMEPAGE = "https://gitlab.freedesktop.org/karolherbst/mesa-libclc/"
+SECTION = "devel"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=7cc795f6cbb2d801d84336b83c8017db"
+
+SRC_URI = "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;protocol=https;branch=llvm_22"
+
+SRCREV = "b1934c37694714352edc19232e23480feaf18ab4"
+PV = "0.1.0"
+
+inherit cmake pkgconfig
+
+# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
+# objects from this recipe are build explicitly using clang for GPU targets.
+# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we need
+# to wrestle CMake to configure without a toolchain.
+DEPENDS += "clang-native spirv-llvm-translator-native"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?= "all"
+
+EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
+
+FILES:${PN} += "${datadir}/mesa-clc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


