Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.4962.1630678289416728979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 07:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f5e1L4Yd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso6686335ota.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1MKGBGgWmxXXAbYDVAZWjoNTLaH7CrX34n6BvlQnHDk=;
        b=f5e1L4YdrdWwXH8DnszWUqdKll5Bahu5iu/czJEjMYsMwYJE9CVGe4XiYa8iCNL3ez
         npAPCUl0F+RwWg+rueIVJSTiTGtSzddL4cE/QzObaZZ98mACiIgX6BNuJDtFI8mpW5CM
         2ALvyQQ4dTewXgQmvVulRTXwkQKO3D/lisCsqKHW2YgONEIkAjGQLgusgI8e9ArGLYIw
         EEwucdnWk3+Zyk4X8ErWqEbOwuTDuPcNdSuajjL+Jkrhw0yFYiIGZmpfwI2A38xyqJUN
         tGlhGpprh/ngV3SJef4jNmLc4q/W6g50kgM2fEQxPgium4tPSjD0OF+76WHIljCXIyHa
         xG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MKGBGgWmxXXAbYDVAZWjoNTLaH7CrX34n6BvlQnHDk=;
        b=Qrk5CTUMfv+WMNkL4Okryr3rr7s2+VJ7DlmLuq0zaIBUJRCI/1o2noRXqAWRVwq4C7
         V5BLDsMfq0LQ59ShR0iUC8Ud5bj3b6XUkEwQCbB4QNlcZxni7jOmMvWNT++1MXFwRUNu
         BfmX7kK0dOcuw8RtsGX6CRze9zb4BhjrUWR/Y9+mI0Nyk0WCYCUjfM/udEad7V7CY9Qw
         xmZ8iftdvz56Kx4ZJdf1TzHr+01JEcjq24apWBOYuMOxPHMJOtz1lCyLi16BEbnvpMxV
         yjIlngnNoiQ3288in4bCbANxjE/afjiufrLFt5vHKnP4bq8QIN+n5JrDRGau6d7w5qul
         +yuQ==
X-Gm-Message-State: AOAM533tsuKSC8fp19vKV8VeXhnF7awfExL+CcEVX53XS5YyYvcvxgbh
	pnH+TzaB0IER4Xt+h3EVsfpIyt9ULjjIwX/q
X-Google-Smtp-Source: ABdhPJwORawEjE0R2OMcMsJSYjkzeElYPdfJ3bZJnBfa+YWoo2RsJ5oZCEMstcstwC7JhjkVFSaWjw==
X-Received: by 2002:a05:6830:438d:: with SMTP id s13mr3354844otv.308.1630678288196;
        Fri, 03 Sep 2021 07:11:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id u14sm998007oth.73.2021.09.03.07.11.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 07:11:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] sdk: Decouple default install path from built in path
Date: Fri,  3 Sep 2021 04:10:49 -1000
Message-Id: <33a5714592bf41a26fcd7e8ff595b45538082431.1630678081.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630678081.git.steve@sakoman.com>
References: <cover.1630678081.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add SDKPATHINSTALL which is used as the default install location of the SDK
instead of SDKPATH. This means the default install path isn't encoded into
every SDK binary, meaning if a date is used there the entire SDK doesn't
have to rebuild. Most distros can switch to only customise SDKPATHINSTALL
meaning more sstate reuse too.

[YOCTO #14100]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc4ee5453560dcefc4a4ecc5657df5cc1666e153)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 meta/conf/bitbake.conf                 | 4 +++-
 meta/files/toolchain-shar-extract.sh   | 3 ++-
 meta/files/toolchain-shar-relocate.sh  | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index b46f1aed27..396792f0f7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -275,6 +275,7 @@ EOF
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
+		-e 's#@SDKPATHINSTALL@#${SDKPATHINSTALL}#g' \
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0141919021..f442a6593a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -421,8 +421,10 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
 SDK_NAME_PREFIX ?= "oecore"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
-SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
+SDKPATH = "/usr/local/oe-sdk-hardcoded-buildpath"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
+# The path to default to installing the SDK to
+SDKPATHINSTALL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 
 ##################################################################
 # Kernel info.
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index dd9342758b..4386b985bb 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -56,7 +56,8 @@ if ! xz -V > /dev/null 2>&1; then
 	exit 1
 fi
 
-DEFAULT_INSTALL_DIR="@SDKPATH@"
+SDK_BUILD_PATH="@SDKPATH@"
+DEFAULT_INSTALL_DIR="@SDKPATHINSTALL@"
 SUDO_EXEC=""
 EXTRA_TAR_OPTIONS=""
 target_sdk_dir=""
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index ba873373e2..3ece04db0a 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -61,7 +61,7 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
              -e "$target_sdk_dir/post-relocate-setup" \
              -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
-        -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
+        -e "s:$SDK_BUILD_PATH:$target_sdk_dir:g" \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
         -e "s: /usr/bin/perl: /usr/bin/env perl:g"
 
-- 
2.25.1

