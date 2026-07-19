Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800EBC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 08:01:29 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1672.1784448082496068023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 01:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WHEwBv6f;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so1210595e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784448081; x=1785052881; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoN82jvJuX7gUFjD3vOUauWChaPUxZCiUlqWYDVL7kY=;
        b=WHEwBv6fZB5iU8gVInQ6ZyX7/ot+MJctoGcNIvZQlSmsU8dSGvUTOcrHnGrMPPRNyl
         zQlEMOU9uZrLhQMHw5r9vSs/EL5BDYktz8GSWtIXsqCUz9uGGMCWKEkyI6eNuf82nx4d
         S+xABcg+bpqQhBwsg8NQHg6NlmOGgquPLLOQya9iFtSsTJSAs7E3oV6zpa7Mn2SoxZI5
         i+BknnQyJ080OKgH7X/Ac0IgnUgFM9YTeRnotEidNn0Pr8BwOV1gXgEhGYrSYUgimk2x
         MdhYC2feQJnxaS7Hz0LX6WHNYC7yN2SK4+Vb0cZYEEIar7EGp61L5OrHxQtRXAf6LPzB
         zrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784448081; x=1785052881;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoN82jvJuX7gUFjD3vOUauWChaPUxZCiUlqWYDVL7kY=;
        b=WoywbYMspmObWBsMZ7YW31TZz8eCkUU0sfgzHZfVvqlO4aOwjVOZl1gQaE4A7QFB29
         Jv7ahMTWQ8tq6XvQT4NpB4MDNJ2rThu7xVjWYBePtPIqEGegLYnylt/wtT1dc73xlhwm
         u7IgGsUwCY4/vElUgRrxZTUCEki0I8TTaowfucgwbU73s7cl/rN5QeBjsU7p74/wQyMr
         Z8US1SgLLwTqreMghov2r/mc3aMpIFEeN8fuYulfv4FFAIc3zQ9IjSf/bXv9RtBQxsZ6
         1HnyWrjQCX3i8KJjmvpOSPWVdCXh7MVoVETy2uPn7HTifcOl3WkQzTEIXpdJ2N4x5Li/
         fMqQ==
X-Gm-Message-State: AOJu0YzXAptYT/tNLoqLqnE9v51qdGGuznNr1zeDir7QvE12UVSRT7lD
	rUv7V6oMYBWZlWLccRpbzq6u5Lscc+iNdEtygV+pbtkMMdD1TAV1Wu81gwr8Sw==
X-Gm-Gg: AfdE7ck2s4La3TfDk9Y4S/eXjOJS1sQ6quXrRvGK8JsI7uhAO5QetUdkp/difEwLX5T
	36BOZIXkhjkHTv3KdNxXCJEky3bvdV/zbJTYAQT6qn/usaMUnEtluo00K/+KXOj3+xG9l5T/Rln
	T6tvOGp0SMz6YHDEx61y0AMW/q9VNHvnKeR9++iKCG0RJfGULBFgJn/aMjCapbdI49Dl2zyGqKi
	duvUDHerZGBpS391/RZ1eHC6HCDJZrNC4/nhwmzGgoQLMN3c5qBNqzYDIyC70sU2mf+YxJjSMIV
	C+TjKL6sPo3cCjPboz9U0JTWYTzIA4rqIKiGNOFePv5iUS3gzSynWmNaes982pQHr3xjFjzBIlE
	TrHdThIYy4iLUQUWbvzLsbjiMqYyThV009v4IgzposKY30kALlbRoneUqJb9+WliT7Nc=
X-Received: by 2002:a05:600c:5351:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-4954a51bb65mr70866525e9.38.1784448080617;
        Sun, 19 Jul 2026 01:01:20 -0700 (PDT)
Received: from term011.lan (BC24447B.dsl.pool.telekom.hu. [188.36.68.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm19221644f8f.2.2026.07.19.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 01:01:20 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 2/3] mesa-libclc: New recipe for forking libclc for Rusticl purposes in Mesa
Date: Sun, 19 Jul 2026 10:01:07 +0200
Message-ID: <20260719080108.1290998-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719080108.1290998-1-zboszor@gmail.com>
References: <20260719080108.1290998-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241277

See the reasoning and discussion at
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020

TL;DR: LLVM constantly introduces breaking changes that cause
regressions for running OpenCL CTS with Rusticl and finally
Karol Herbst had enough.

This fork is from the LLVM 22 version of libclc and contains the
necessary fixes to make Rusticl pass OpenCL CTS.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-graphics/mesa/mesa-libclc_git.bb | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-libclc_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4c6307086c..927318e7f1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -523,6 +523,7 @@ RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mesa = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-mesa-libclc = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-mesa-tools-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-meson = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
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


