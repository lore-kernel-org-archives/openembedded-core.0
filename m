Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.20706.1599740593406566840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SzjQ4KRe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x14so6438986wrl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I7bl1r86K087iaaVYye3MgfOHOavC4bD7Xz+/G8ekGo=;
        b=SzjQ4KRemNdSgAnYjaEwYmYHCKk2C5axIUgW+BV+r8KWt6AyEFf6+s3ZsitmLVKm3u
         8V7VFSR9QMHHrpm0e3lDj4F3ChmQMoK4cg/xoTZCsM+aEhw+fb6/0h9jjE01SjXf8gcu
         1JQs/KJzBbxvuJ5FLT4NKWqcfavKF2Lx6LJRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7bl1r86K087iaaVYye3MgfOHOavC4bD7Xz+/G8ekGo=;
        b=Wuq8CkpiUbvzLQWdsTu0z9821PZVxl09Fybd9rS33gEU0k7rL6FGC2ddrsuhFtewnF
         WebvR7Grb2jB/0oGxwiOUqGCw8FOxdzc0dnACP7Y4TU4t2L5XzmVZb/QIejcOT55mNFc
         kja4qyUGxxfd/xP7TXdMWbDxi2U1mArko8xGf+/fQsOdLDe8MgyI28AOMUukUGioi+Cv
         syUZSXL5nCYYGQ1k7pSs6k32HaKkFI5HceljnrUPdJkA9DcmtUOUAuWN9gE9bWeCup4k
         dehkSdAaRmlJK7K4vHyaUBTYrko/w2ytU6r8AM437AMsHeFP+/t7Nylnfq/Hft2qXCfs
         fS3Q==
X-Gm-Message-State: AOAM531xiaPJxMc6pSEeZdkoFrG7nHF9x4gNHnmHCnnwTlD8CVPiN0XV
	fJzVyirin+gHeRGRfpV+85tkU/7AOYX43w==
X-Google-Smtp-Source: ABdhPJzzv0fW6wCvHsIhJZLffTBi0ry+te0bgZ2BVsf5E1W10Kz2M7jzooHM2qcjwQZqbWXaY4RRIQ==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr8937112wrq.398.1599740591693;
        Thu, 10 Sep 2020 05:23:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 06/22] buildtools-extended-tarball: Add locale command
Date: Thu, 10 Sep 2020 13:22:50 +0100
Message-Id: <20200910122306.2040194-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eSDK installation code checks installed locales with the locale command which is
from glibc-utils. Add this so that we find the correct locales from the buildtools.

(From OE-Core rev: 7d35e4bc6ff94a2d03c48827d7d60a6855c9029d)

(From OE-Core rev: d99b6432decec0964ac0e08698abc782c9b114f5)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index d756036373e..5a781730ed7 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libstdc++-dev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
+    nativesdk-glibc-utils \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

