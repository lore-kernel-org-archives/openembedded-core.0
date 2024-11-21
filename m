Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B538E64020
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.10685.1732226079102300185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ByFHUgZR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724e1742d0dso12902b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226078; x=1732830878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVvcH3Wx1YGzB9XZ/Tb0q+svkrIYLIroIwn0Wnq/BRQ=;
        b=ByFHUgZRGYXnNog75XZ/D4TqVxrmHG5m0xv8UDnchUPWlyd7bbxsCgth2ASBK0U0qm
         uWoO6UllsERIZjozrwfooY2OiTOtu/hR03HPDthDyKGtpwLGULyLidzoiofrjInylkju
         dtnasGZQ43N7qgGsLKQC8UXSVqKx6QNv7ujTp22RlFmRCQQUeeJG+dmjVfu8gC/5yNLR
         /zmeTu7XerCFpcF413zMHVpw2PENAABYYd1JaKLDVMXXq4t/F4oWgDEbTiynTXW5/U3Y
         NBUVRntW+hO25SVO0ba52z3y3wKuHTpfMBRb0WGZ/K+QFuECZ1TuPgBBcq/6uefdxqn1
         hJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226078; x=1732830878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVvcH3Wx1YGzB9XZ/Tb0q+svkrIYLIroIwn0Wnq/BRQ=;
        b=bh/SR9xXyfv9JB7tcthwDqpfzYPuCir2EboS4Bl3TOuIhTAX1fd8FntF87kHSJKvMr
         DWad4nRWBR3YcM1NlTxbyQEuPkhBEh9o+cUSk8Sg5VKmMPM37erxnWhRDFaCKxqnKAhM
         Jub9lz1uI3fXldNjLRVfqcyJkRLIgCHxbonSVqtiuYRChClhcs/aU/sPgLT1Ucd1XVfZ
         zguRkmUmMqWnFhvhr/zcunriCDtBuzyiwJOfAP55FMXL+vw0iNLxrwA+oJxDvSz7Nuuf
         loQv4X/AVcXaZwEqVjNPJAchhgiGvSeyPHoqe2/XIOLXWiWTw/MfHMmSGtOMdJjl2GMJ
         b7qg==
X-Gm-Message-State: AOJu0Yxh3jn2jcR2/qwI2udbGY0PE1T5HslqY85KuS3Q2aasM7QuqTZ7
	yTKF/7WB2AdDhOQvpJpWYx3+oZ4KgxKQK2w3eGbUjY2qPwYfr2TyujOypvCCeQIjSPLwaL03iRd
	Y
X-Gm-Gg: ASbGncsFxGHiSgEBAlqXE66T0sdJH84iW35A1inLYsgHikQda7xZLy0I14lKFXL4kjx
	ohNyrcgtW5WQFMyHZQYPXZnzMVgr3e9HUtjefYDK6gna63YSYqsvqUb8vjVboDT6H+J5qmPoCTk
	fAqwQnabU8lOfx/L67N7wXWftAEth87DSyV4nl5qZiW6HR3vNV0ecYb4tzZqoaltbBwCi1shgMb
	7OkBcm/n8TdNHygYe02Upb4rP5dxE3etUrPwjQ=
X-Google-Smtp-Source: AGHT+IHRcEpiPmXefnZi5D5QuM+s20RY3PQNMKT5FN3c2UG5teLoEPYiONuHJOEmdteoytBszUY38g==
X-Received: by 2002:a05:6a00:1950:b0:71e:a3:935b with SMTP id d2e1a72fcca58-724df6aadb6mr656030b3a.25.1732226078258;
        Thu, 21 Nov 2024 13:54:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/27] libpam: drop cracklib from DEPENDS
Date: Thu, 21 Nov 2024 13:54:01 -0800
Message-Id: <65ac88fd4e371712c9140fc0192725fd09774e67.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207566

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

cracklib was dropped as a dependency in libpam v1.5.0
See the following commit as reference:
https://github.com/linux-pam/linux-pam/commit/d702ff714c309069111899fd07c09e31c414c166

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index bcaa84c9a5..f05272652d 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
 
-DEPENDS = "bison-native flex-native cracklib libxml2-native virtual/crypt"
+DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--includedir=${includedir}/security \
                 --libdir=${base_libdir} \
-- 
2.34.1


