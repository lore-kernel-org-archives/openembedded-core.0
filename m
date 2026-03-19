Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBEF1091931
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 23:06:55 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1315.1773961611317378217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 16:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B3v1TwJv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso272045e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773961609; x=1774566409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5UMe24SWD7/O9RW+VnabKDV1vCkhwvoi0fLYJAsCZ2Q=;
        b=B3v1TwJvGa9LkRK/chzQ/UM70aKPjjppv5jYX2zOVxxjlTmQBi6RLvYr+KcCfhg1DL
         fkcVL26W86pTeFztLb+K6/RFSNCoW/puPn6+u/u+crfPD+029yTnTLJwd69z7zGLis3D
         rw6/0LxtP5YR6oLTtaIBzjAKlF0jYyRhFQz4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773961609; x=1774566409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UMe24SWD7/O9RW+VnabKDV1vCkhwvoi0fLYJAsCZ2Q=;
        b=TtgKod3eqo848udv0pvn8RNcR6Mok2wi29+CgAL+Dbh6D0OqYAkRKc7VzoEx2sN4ln
         Mo2P6wbinjz0N/Z5hfFui1SmuZHWQpwVGyNP7jL3GPi2IgMC9j/CmBR0FJEtIsZcYNQ7
         imapW1xK/RNNJGFRQK2bFKToapSCPaEqS9F23XIu/+enYlxm4QArk7I7zeLyM9I0LTZe
         hMmxOucwj3WOdKu1asmg/oEpbkzw0C4mbGxYm1PHQJkFLTAHBP70fga1ChjUPSdDOalG
         TPC7Jq/7Q3iBwP02os/TGe/ub4MPmm7HFwUbRWH7nrji7HfsSFRHguwsX3rqft0qVPtO
         5bQg==
X-Gm-Message-State: AOJu0YwK+rB8AwWchtYE09K+RdMjoW3P4XeMdXdGFOUMC0/XUvv9XYdB
	ToN/zAaSxw6AgCMm9RZjVi8/c61mv5qQ0HbGVb5yqWpUNHTVuVm+BSAVNAuxbl3GJo02GK0/R1B
	/eA+9X90=
X-Gm-Gg: ATEYQzx4LwcBpQcDj6Om0MVQUTbS4BO6LEeArjhX85h/8mJugEm9BIdyCWrYQUU80xQ
	rcjULD3NcQIUNeb5qmAS07a8uNf4uGVjxicwxbt5ZMcKxhuqpGz0bpU5nGIT6WR4Dikr8Q7gTUM
	Z59DJGhCBhS/e07ANnbkNjQClpbZTb86OMBuFAheZDZqFetyZHmpggV6KySwQGEvrkNS2IPWXfk
	UAgyzdoFqisDF3o8wbl4Cz+7gvUF5xtAxhd2WQdpcB9uM/YXLtb8OgCU4hhreUiqX0zztxGKTXu
	X3ofR+3dhnfQpiD9j5O9nHhfD0njfiioZ7wLwlcBzkyg6LQrlUFUmS7ohVrpFE4uRIlObOtP4Ju
	hQYc9rt2rHak7k4V5XEC1ikeCf6G5MOZwAKeHHgsEUPIExmNqJe5JitvclzwDf5iluo6weL5md+
	5fm/C6IRX3ZLs7A/2e4Ud39s5+mKxbRYp7wTzSjhbB26x2lhdT7SXz
X-Received: by 2002:a05:600c:828d:b0:486:fd9c:af9d with SMTP id 5b1f17b1804b1-486fedd0a28mr13800695e9.15.1773961608924;
        Thu, 19 Mar 2026 16:06:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:825d:929b:d471:a79f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm1676771f8f.19.2026.03.19.16.06.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 16:06:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta/*-tarball: Fix SDK PACKAGE_ARCH after recent changes
Date: Thu, 19 Mar 2026 23:06:46 +0000
Message-ID: <20260319230646.113048-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 23:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233556

In "sstate: Tweak SDK sstate package architecture", these PACKAGE_ARCH
values should have been updated to match, fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 meta/recipes-core/meta/testexport-tarball.bb | 2 +-
 meta/recipes-core/meta/uninative-tarball.bb  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 61b98c73872..1fc00981807 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -37,7 +37,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
+PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = ""
 TARGET_ARCH = "none"
 TARGET_OS = "none"
diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index abdd0092528..79de91126cc 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -11,7 +11,7 @@ TOOLCHAIN_TARGET_TASK ?= ""
 TOOLCHAIN_HOST_TASK ?= "${TEST_EXPORT_SDK_PACKAGES} nativesdk-sdk-provides-dummy"
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
+PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = ""
 TARGET_ARCH = "none"
 TARGET_OS = "none"
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 0dbc698ccd2..4d0eb881e4f 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -18,7 +18,7 @@ TOOLCHAIN_HOST_TASK = "\
 INHIBIT_DEFAULT_DEPS = "1"
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
+PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = ""
 TARGET_ARCH = "none"
 TARGET_OS = "none"

