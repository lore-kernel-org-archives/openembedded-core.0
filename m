Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.25747.1627660234115513895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 08:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QkW9gn3D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id l11-20020a7bcf0b0000b0290253545c2997so6719872wmg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZreLSzYx4SJn1iOf4AGRVCCllmxScYjPbMpEpCUMe0=;
        b=QkW9gn3DOHCuCCHfNC/nZx7apDZF9ce38HglviH0q3o9VCpmigRRkJrQ3OqLVYP5IA
         TTdUI6t6r+DPxKc4j4OuTUx8yA+x8vDfWw2I37Fe4xGTJFKCl7FTtzsCHskoZs94V/rQ
         ldUZdEq6qyGMvXRWUSE6XldczJ481wLrka+JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZreLSzYx4SJn1iOf4AGRVCCllmxScYjPbMpEpCUMe0=;
        b=Ika2RBloU94eJCejld57zx5oB3DjLORhpmMeO4fzMUKG0zRrvc8Z2LJX14yFRXUovg
         v8wBeJYP/Ho+kXngaSymrBXf9vncDCMLxdFb0cOInV6dYXWpBT+udxIRCoD6axl1G6+d
         2Jor7WxxvOqVuYic963xcLz6SC1dYBOTSFCTDpCkqpVv1ptrRIvEk5klpCLV5ZHK1+Tf
         OYPE919wAVZCNUZIMHTqOV99kU53xQidHLjd8nnDC2iJ3pTCU3ZqMjfFNC/0fU3G9Q3J
         CIdRqJX3Tx+Mu5KVFgPh8NlDcHpvvAVndMZYu4yhJ3zXoyeFk+kMk/hZf+MSiBbNlfZj
         ft1w==
X-Gm-Message-State: AOAM533cR5t4XidVh8Y4lj1KJ2DFOXXvd40AWSqmxws8VlsywTg0OLrE
	j8vbl2NtwwfMd7p9oZXHNEAH28AEjy0x8Q==
X-Google-Smtp-Source: ABdhPJySvM1Cxf8e/eF2B9cU0ofSiyhl64dT0Kxp4c67mtiAkBHejKBLdez6ZhYYp0lnHxIbgBzzTg==
X-Received: by 2002:a1c:3942:: with SMTP id g63mr3622765wma.64.1627660232242;
        Fri, 30 Jul 2021 08:50:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id f26sm2115747wrd.41.2021.07.30.08.50.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:50:32 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sdk: Decouple default install path from built in path
Date: Fri, 30 Jul 2021 16:50:31 +0100
Message-Id: <20210730155031.3368007-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDKPATHINSTALL which is used as the default install location of the SDK
instead of SDKPATH. This means the default install path isn't encoded into
every SDK binary, meaning if a date is used there the entire SDK doesn't
have to rebuild. Most distros can switch to only customise SDKPATHINSTALL
meaning more sstate reuse too.

[YOCTO #14100]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 meta/conf/bitbake.conf                 | 4 +++-
 meta/files/toolchain-shar-extract.sh   | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 3c1eb454b3e..ccfe2232895 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -280,6 +280,7 @@ EOF
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
+		-e 's#@SDKPATHINSTALL@#${SDKPATHINSTALL}#g' \
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f2ceb26c042..1d5f5b7fcd7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -422,8 +422,10 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
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
index dd9342758b4..887c97a11e2 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -56,7 +56,7 @@ if ! xz -V > /dev/null 2>&1; then
 	exit 1
 fi
 
-DEFAULT_INSTALL_DIR="@SDKPATH@"
+DEFAULT_INSTALL_DIR="@SDKPATHINSTALL@"
 SUDO_EXEC=""
 EXTRA_TAR_OPTIONS=""
 target_sdk_dir=""
-- 
2.30.2

