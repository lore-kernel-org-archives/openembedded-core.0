Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9372EC43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.4301.1667832921280123705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pmrTe3Z8;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k8so16648181wrh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsj7x2wsEOmzWTX1NpeGZ2BxiRPWd7yJ2csAi9c0uS8=;
        b=pmrTe3Z8CZmMKdntuGfBaA9vv7UmzMbFiLhExAbjaWM0zoBOskZAcKROvpOEZ0wcBm
         yXolpKDKhIYrmd0HkJq6fxhDymbGVB6I+V+R9guQprFUcMuysfWgpvte+mHrChnDKWYA
         mDTsmK4a2btlQI6UopIdvt5CHgkdsoyWB4o+/M7JcmoQL9YagPK+L1dO2ZR/uUO2LFBX
         SLkE9Z/oiYl68mFjTc2mW4weamS6susGGJnwzjRrkDzrKpUF0RT9yeemY32hAoF4cVDQ
         er/JoHfi3IyRrka5c73F7qRwnGRpDEKF/XX+pmvZPMo8R5zE/zW+pZFvXbPZ1ikPOyXZ
         yURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsj7x2wsEOmzWTX1NpeGZ2BxiRPWd7yJ2csAi9c0uS8=;
        b=yB1L8PZ0ipO1d+wb7aC+xK1aa52OZZNX3K2QsXErUwVLJ2RMRE80a8JAKUAL+rMtQ3
         +gDQxvy8IuNeyXZrE49hgeabzB98/4hMcWqraoYklg40acq60AYWAEi0GXtl0MwnbOzJ
         cBxfZ8bAAK6j4WuHYdONVkQkgcYK1LAmHmOekwylUJu3j1hNbhQ2wSs/DUNmk3x1ZvSh
         wkRloWdWdMb4q8VOL4jKrMrg+ZedVOGQ3YWL4Sxaac4pyBCoI6Idgb8060KuBjOulrNR
         Iimgvo0UNS4johVPsC3fxo8OjF5Qq+X5qy2yFS7ut5WAcrkFjmPCXGZifT6yA6cA7gCx
         fYfw==
X-Gm-Message-State: ACrzQf35okZHT9SOQZBl79fWzLpjAYMZp0He4VbWLvJ34XYOynF3vvyw
	SRsuWwEYV2uBX9scpnOSfHEByT+hxy4=
X-Google-Smtp-Source: AMsMyM4Kv18sH1MJeWZr1uf0OclX+WvJbq/z9tS8d/E4x+BO0Mqkh+bX/e1qIlRbxULAm1NkL4QyAQ==
X-Received: by 2002:a5d:5c0f:0:b0:236:c429:361a with SMTP id cc15-20020a5d5c0f000000b00236c429361amr28302897wrb.475.1667832919649;
        Mon, 07 Nov 2022 06:55:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/48] python3-pip: upgrade 22.2.2 -> 22.3
Date: Mon,  7 Nov 2022 15:54:26 +0100
Message-Id: <20221107145508.1051404-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172856

License-Update: copyright years, formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pip_22.2.2.bb              | 62 -------------------
 .../python/python3-pip_22.3.bb                | 61 ++++++++++++++++++
 2 files changed, 61 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pip_22.2.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pip_22.3.bb

diff --git a/meta/recipes-devtools/python/python3-pip_22.2.2.bb b/meta/recipes-devtools/python/python3-pip_22.2.2.bb
deleted file mode 100644
index 5b6cccf7ed..0000000000
--- a/meta/recipes-devtools/python/python3-pip_22.2.2.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "The PyPA recommended tool for installing Python packages"
-HOMEPAGE = "https://pypi.org/project/pip"
-SECTION = "devel/python"
-LICENSE = "MIT & Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & PSF-2.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "\
-  file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
-  file://src/pip/_vendor/cachecontrol/LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d \
-  file://src/pip/_vendor/certifi/LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8 \
-  file://src/pip/_vendor/chardet/LICENSE;md5=4fbd65380cdd255951079008b364516c \
-  file://src/pip/_vendor/colorama/LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26 \
-  file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
-  file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-  file://src/pip/_vendor/idna/LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1 \
-  file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
-  file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
-  file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
-  file://src/pip/_vendor/pep517/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
-  file://src/pip/_vendor/pkg_resources/LICENSE;md5=9a33897f1bca1160d7aad3835152e158 \
-  file://src/pip/_vendor/platformdirs/LICENSE.txt;md5=282c970bb844954c8535dd6e9733db7f \
-  file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
-  file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
-  file://src/pip/_vendor/requests/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
-  file://src/pip/_vendor/resolvelib/LICENSE;md5=78e1c0248051c32a38a7f820c30bd7a5 \
-  file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
-  file://src/pip/_vendor/six.LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d \
-  file://src/pip/_vendor/tenacity/LICENSE;md5=175792518e4ac015ab6696d16c4f607e \
-  file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
-  file://src/pip/_vendor/typing_extensions.LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f \
-  file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
-  file://src/pip/_vendor/webencodings/LICENSE;md5=81fb24cd7823cce23b69f721993dce4d \
-"
-
-inherit pypi python_setuptools_build_meta
-
-SRC_URI += "file://no_shebang_mangling.patch"
-
-SRC_URI[sha256sum] = "3fd1929db052f056d7a998439176d3333fa1b3f6c1ad881de1885c0717608a4b"
-
-do_install:append() {
-    rm -f ${D}/${bindir}/pip
-}
-
-RDEPENDS:${PN} = "\
-  python3-compile \
-  python3-io \
-  python3-html \
-  python3-json \
-  python3-multiprocessing \
-  python3-netserver \
-  python3-setuptools \
-  python3-unixadmin \
-  python3-xmlrpc \
-  python3-pickle \
-  python3-distutils \
-  python3-image \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# This used to use the bootstrap install which didn't compile. Until we bump the
-# tmpdir version we can't compile the native otherwise the sysroot unpack fails
-INSTALL_WHEEL_COMPILE_BYTECODE:class-native = "--no-compile-bytecode"
diff --git a/meta/recipes-devtools/python/python3-pip_22.3.bb b/meta/recipes-devtools/python/python3-pip_22.3.bb
new file mode 100644
index 0000000000..394c428675
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip_22.3.bb
@@ -0,0 +1,61 @@
+SUMMARY = "The PyPA recommended tool for installing Python packages"
+HOMEPAGE = "https://pypi.org/project/pip"
+SECTION = "devel/python"
+LICENSE = "MIT & Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & PSF-2.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
+                    file://src/pip/_vendor/cachecontrol/LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d \
+                    file://src/pip/_vendor/certifi/LICENSE;md5=3c2b7404369c587c3559afb604fce2f2 \
+                    file://src/pip/_vendor/chardet/LICENSE;md5=4fbd65380cdd255951079008b364516c \
+                    file://src/pip/_vendor/colorama/LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26 \
+                    file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
+                    file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
+                    file://src/pip/_vendor/idna/LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1 \
+                    file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
+                    file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
+                    file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
+                    file://src/pip/_vendor/pep517/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
+                    file://src/pip/_vendor/pkg_resources/LICENSE;md5=9a33897f1bca1160d7aad3835152e158 \
+                    file://src/pip/_vendor/platformdirs/LICENSE.txt;md5=282c970bb844954c8535dd6e9733db7f \
+                    file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
+                    file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
+                    file://src/pip/_vendor/requests/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
+                    file://src/pip/_vendor/resolvelib/LICENSE;md5=78e1c0248051c32a38a7f820c30bd7a5 \
+                    file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
+                    file://src/pip/_vendor/six.LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d \
+                    file://src/pip/_vendor/tenacity/LICENSE;md5=175792518e4ac015ab6696d16c4f607e \
+                    file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
+                    file://src/pip/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
+                    file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
+                    file://src/pip/_vendor/webencodings/LICENSE;md5=81fb24cd7823cce23b69f721993dce4d \
+                    "
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI += "file://no_shebang_mangling.patch"
+
+SRC_URI[sha256sum] = "8182aec21dad6c0a49a2a3d121a87cd524b950e0b6092b181625f07ebdde7530"
+
+do_install:append() {
+    rm -f ${D}/${bindir}/pip
+}
+
+RDEPENDS:${PN} = "\
+  python3-compile \
+  python3-io \
+  python3-html \
+  python3-json \
+  python3-multiprocessing \
+  python3-netserver \
+  python3-setuptools \
+  python3-unixadmin \
+  python3-xmlrpc \
+  python3-pickle \
+  python3-distutils \
+  python3-image \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# This used to use the bootstrap install which didn't compile. Until we bump the
+# tmpdir version we can't compile the native otherwise the sysroot unpack fails
+INSTALL_WHEEL_COMPILE_BYTECODE:class-native = "--no-compile-bytecode"
-- 
2.30.2


