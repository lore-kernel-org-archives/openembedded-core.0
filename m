Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D650EC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 22:39:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11104.1709159992263202363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 14:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ky+SIHlD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412a3371133so2051465e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 14:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709159990; x=1709764790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2+gCpeITBDtwqEUJ+xqqL/h9u8jbAyVgwnfz6thaS4=;
        b=Ky+SIHlDssMAk8cTQff2wWdgjNG6dL5Jrm1pgUA9O+wRFy8G3IZlMEyFBhkCfjK2Gt
         e2wFtyzxj3g8BF2cjpVmOq0qO4j9loT36Sr2t5qyQ8TYWUmnQ2SKmQ8TQckl4fkYRLN1
         24pM6K4tsyCNucnueUkchSwu7CVKdQkTrOvSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709159990; x=1709764790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2+gCpeITBDtwqEUJ+xqqL/h9u8jbAyVgwnfz6thaS4=;
        b=dYiYWONCpN/MbONPWzIFMm3EBBeOfMTRv9AV2vuHK66bpp2Bh5nhhTEYfa0EsvO/wH
         aYJfpPuMalhJQT4s6OIJ4k+kmSTzUpr0NyQUz/IP3SHcUvLd4CtpWzyLjGrsSPJNBhVL
         bm6ccFI10tXgbIXl39FV//ycNTai5sx1DlYUq5VCqRHamQuk5klOg3KFrGMkMNe64r5T
         4tYT5NQrdmGoh5ui2JxexY1vr2a8ZiZ1hEjXJppyVdOeWix05Iu50HWPdJ15go3z3XKQ
         vG/XJTe8ck14h4m7jfmiyHZeOGP9H2yRq3bNVdBgGMvIYYmHNSfoPIpDB7SdXxAVubg9
         vDmA==
X-Gm-Message-State: AOJu0Yyy56BDMfZfSiVseDk4zIdOYGN24W/ByCrGQ3rb5ymAX8LitsQv
	aVdmbi0PQ67Yl89KYWwyqzKV6ApzexVZ5Bv/qmPx3cvxxdV+dnaX114nxXyjwc2mxxv4Olqj8Ah
	m
X-Google-Smtp-Source: AGHT+IG9UtPnAMATFQY4SG4EUixvq13bWZu47STyw07d/m1cQvHL/iHBvV8jeJSHzm/TOuR7/1Bd5A==
X-Received: by 2002:a05:600c:1552:b0:412:a21b:d5d with SMTP id f18-20020a05600c155200b00412a21b0d5dmr424136wmg.29.1709159990376;
        Wed, 28 Feb 2024 14:39:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dfc0:7799:bd76:6cd8])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b00412aeb77bbcsm186347wmb.19.2024.02.28.14.39.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 14:39:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: Switch llvm to use shallow cloning
Date: Wed, 28 Feb 2024 22:39:49 +0000
Message-Id: <20240228223949.1651046-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 22:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196410

The llvm github repo appears to see a lot of churn on branches we're not
interested in and is in general huge and unreliable to clone.

Switch to shallow clones to improve the user experience.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/mirrors.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index af66fb1832f..862648eec5f 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -83,7 +83,7 @@ git://.*/.*                   git://HOST/PATH;protocol=https \
 git://.*/.*                   git://HOST/git/PATH;protocol=https \
 "
 
-# Switch glibc and binutils recipes to use shallow clones as they're large and this
+# Switch llvm, glibc and binutils recipes to use shallow clones as they're large and this
 # improves user experience whilst allowing the flexibility of git urls in the recipes
 BB_GIT_SHALLOW:pn-binutils = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
@@ -98,3 +98,7 @@ BB_GIT_SHALLOW:pn-glibc = "1"
 BB_GIT_SHALLOW:pn-glibc-tests = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
+
+BB_GIT_SHALLOW:pn-llvm = "1"
+BB_GIT_SHALLOW:pn-llvm-native = "1"
+BB_GIT_SHALLOW:pn-nativesdk-llvm = "1"
-- 
2.40.1


