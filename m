Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E99C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:59:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.55661.1749463135805093785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VtQcNtYD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54700a463so558786f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463134; x=1750067934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXLrzNnk6LmSdyb9O8Tif0ldypljmnC2mZUgGO2bTyU=;
        b=VtQcNtYD11073mWmEhLWa8Uj2/JmC6ezMPmEapt3+ZYjrH6Q8rcNM+JuG8iANr9rzd
         9hurLvFBexYh4TVMVS7E5TuZW6YFWRW0ddEHzIDXUtDADre4hTTLyPACP9N25oyvA/Me
         uuJaACdQ7cm0VfEb6+GJ6Rxp76s6uvLBQYUl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463134; x=1750067934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXLrzNnk6LmSdyb9O8Tif0ldypljmnC2mZUgGO2bTyU=;
        b=GMWr40Fyu9HFhstaFvJAGqOAmPhPHEyEo0gRtMx8DVNAeRcIZJ3JjJ0Y575lRbz+Vs
         ub8f9lL6WGU9vfPM8ezYIYQ7k14FmLHjETgRMliQRQuisjBKAqc6q+5dni6VOzeOndvg
         sXNISnSQccTQaOi9ByEvzaGq+JvEenmjV5OSIP7ZyYFjVeE6hP2su3LG4ID7+juQ1wD6
         QSpnZvYqZOvFAyyu3FpKZ24yotcpX0sKaIUGMf7QquuTDG7iG6ZbNl8VZ4rkBMyPCKJD
         RtKibAaQZolNV7u0oaNqqfYNBYTDRlHwEUmqNO3X12oYtR8LX0B7iR1cnW6vU2YGfQqS
         IUPA==
X-Gm-Message-State: AOJu0YyEggvWiwZGHynCcxsOulaN9XPwp6sZhTmfI/iRl72dvND3Fiin
	K8xLc6RMDZKyvHs5K+1yCqODnjh2xJdC+lsIeWAnUnm1vk/sAP7RkJY2apDbLxOZoJddUerUuoo
	01C6i58U=
X-Gm-Gg: ASbGncsDc1r/gK1RNCtM0vwGoggAU6BFwQfHYwwKMpmrguLZ6ce6KTeiMyKY4Ge9jOu
	E4sCfyo1kJmU4u7sIVBlwj/JW2/YBtmyY/rfFx2CSuhZYebW5Ds57zWG3CzfKGPkn3zJ/I/dpPx
	jL1QvA9VVSPJ0Kgqv+VYNjR9KdEINKVTFbpYfhoe24XFcdbyO1OwqEU79nb9C3RWpR6PN8X+aK9
	heXEjFOWC2+VPlSzI2C5RMyjWX0M+j87qcjPbIXeC9qnENtBy4tNDmTyIhK6HVepiJwpfOXO0y+
	/Cwl9RMNDdHT+F9uCJXB4ilXe9fivfD5eua0ym7/Zl2wtXs8F79w5gp2ci5YDjHDDeUElz5qQam
	w12jCvvi9fDyII+Y=
X-Google-Smtp-Source: AGHT+IFrF5dU4rlJMW+nlFivsf4/uXvVZg2Jy6VgMceG53jE41IDzKnodma2mwBCLNrUlFAkNIiGBQ==
X-Received: by 2002:a05:6000:1acf:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a526ddbaeamr13786503f8f.16.1749463133810;
        Mon, 09 Jun 2025 02:58:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b60fsm108406455e9.40.2025.06.09.02.58.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:58:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] toolchain/clang: Set compiler providers correctly
Date: Mon,  9 Jun 2025 10:58:46 +0100
Message-ID: <20250609095846.937759-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
References: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218255

The clang toolchain include file contained some incorrect settings from
the initial draft of the file. Fix those to point at the correct compiler.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/toolchain/clang.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
index fab94f0b14b..8a0a2c315a2 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/conf/toolchain/clang.inc
@@ -17,11 +17,11 @@ READELF = "${HOST_PREFIX}llvm-readelf"
 PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
 
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
 BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"

