Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B2C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 20:53:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.103254.1701982406172201397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 12:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PRQgPJD/;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so14884755e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701982404; x=1702587204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8qDj+rye2Z8K52oSfBPWSKrv6fh5SKAitVWCR7EFdA=;
        b=PRQgPJD/3qI7mdXQWzgsHUqw4kH7FYY4sZNCrrqNKVPy35nQgpI2jvf2IpGa3+/yCQ
         PXxonXSF2Ls6UMI7tTIkIWRti796HShMQAgbrC0WMKAqny2QNjjIkG5acZR/++yYkRxA
         6qMPHcZ2lZhjUSkBGqV8N6lLYCXirgps5ctLHkwp8+37bYPnjlK4BMgWaBbPegUqmLNk
         zd1uht3c3PztLLVGBFy3YCd2LSdNTAsz0LLmjxe3QCKlPy+UupOTaSQtdjd8Jbk9Dz2d
         1VsjtnwSzmGvdMi9lF1xtEmgOtcb1qR3AXuuk9Eklovey6HD0hCzW3Pp/I+t8u69yDUU
         dBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701982404; x=1702587204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8qDj+rye2Z8K52oSfBPWSKrv6fh5SKAitVWCR7EFdA=;
        b=KJ+wWNunt5/5CO8e67BX+bWFnhIj6EnUu9F8XGLseedeA7Ur8rb+6CG6pwt8YEqglK
         KbT22W6zUh6T+GamtE2/M1IOh3APMN8XLnY2ykO55TwQ2aDmefDiALZwo69+a7RaOeZI
         aI+jFo8xG7lQ9aRPJNJ7yc+R4DJj2u2b/wJh5kIwqFOHbiCVvbwM1UxBmLFMicsppNb8
         mJAhiqu8EKHi+/lLAsNTGFUA5woWkIFeShA1l7J6HmOD+fPxKGZijGFzZs2XgEKWwx9z
         PaDotsCAMpnXhQGXGHbyEXCKjZPots9FjK7sRY1AM6JRc3vVW1N9wlxm6k2jefsYq9uH
         sXuA==
X-Gm-Message-State: AOJu0YxmilINMWsl6KhY+Ogoge0d26y24qlI2gkpADd3iSV5hmkvKR+5
	yoFrVo40K2Da5es5yKghhf64UPVvOGo=
X-Google-Smtp-Source: AGHT+IFuSLeFLDxXURuuEQzWP5yhMKcvGR093v9KFms3Mibx8bUICC/sB3jyUep4mdGKjmBtoNSsKA==
X-Received: by 2002:a05:600c:2986:b0:40b:5e59:da8b with SMTP id r6-20020a05600c298600b0040b5e59da8bmr1630899wmd.158.1701982404103;
        Thu, 07 Dec 2023 12:53:24 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b004063cd8105csm3032484wmb.22.2023.12.07.12.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:53:23 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] cmake-qemu.bbclass: make it more usable
Date: Thu,  7 Dec 2023 21:52:48 +0100
Message-ID: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 20:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191973

Make the cmake-qemu.bbclass more usable:
- Drop the CMAKE_EXEWRAPPER_ENABLED variable (which does not make much
  sense without the second commit of the original patch series).
- Inherit qemu to make the cmake-qemu a drop in replacement for cmake.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake-qemu.bbclass | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
index 76b748f3406..46a89e2827b 100644
--- a/meta/classes-recipe/cmake-qemu.bbclass
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -5,18 +5,22 @@
 #
 # Not all platforms are supported by Qemu. Using qemu-user therefore
 # involves a certain risk, which is also the reason why this feature
-# is not activated by default.
+# is not part of the main cmake class by default.
+#
+# One use case is the execution of cross-compiled unit tests with CTest
+# on the build machine. If CMAKE_EXEWRAPPER_ENABLED is configured,
+#   cmake --build --target test
+# works transparently with qemu-user. If the cmake project is developed
+# with this use case in mind this works very nicely also out of an IDE
+# configured to use cmake-native for cross compiling.
 
-inherit qemu
+inherit qemu cmake
 
-CMAKE_EXEWRAPPER_ENABLED:class-native = "False"
-CMAKE_EXEWRAPPER_ENABLED:class-nativesdk = "False"
-CMAKE_EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
-DEPENDS:append = "${@' qemu-native' if d.getVar('CMAKE_EXEWRAPPER_ENABLED') == 'True' else ''}"
+DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
 
 cmake_do_generate_toolchain_file:append:class-target() {
-    if [ "${CMAKE_EXEWRAPPER_ENABLED}" = "True" ]; then
-        # Write out a qemu wrapper that will be used as exe_wrapper so that camake
+    if [ "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}" ]; then
+        # Write out a qemu wrapper that will be used as exe_wrapper so that cmake
         # can run target helper binaries through that. This also allows to execute ctest.
         qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
         echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
-- 
2.43.0


