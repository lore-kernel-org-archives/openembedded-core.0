Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.1656.1596608092692181361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 23:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lh150GkM;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id p8so7735100pgn.13
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lqCGcWaD7dKXY/VpyCCrlw5FUwXqqcT1nQ0vWbJY4HE=;
        b=lh150GkMTgIgxRQtFM1W6RaYkofEPeIw4FOECNLf9jrWYEn5fsfE3y5yodlvofcP0S
         ZmuxU9HQNfFwmX5/oUTyDFQUwXoJRiYYQBa6p0sMbUVenYk/0RgzkXEzTL7Oq4XImuTA
         /C0ehDy6V9g5bzBi0tZmGjt16MHWNiDQBKRPPDRlz5F5Arni3RvF/XPRAPrWMmTKYRoz
         BtX4DLY/hlGH9WhiUw5BDq2dJ/9F6hJuQwZU/321TFGOgQSifNlk2h2OpzlRpONV2VKo
         OXE6v20fyszBan6jnir2hbwzZ1JMrQjvoTzWpEvbFl70Ey+O66AEjmzDwQlMxJTD+v/V
         eOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lqCGcWaD7dKXY/VpyCCrlw5FUwXqqcT1nQ0vWbJY4HE=;
        b=CJ59wmIBlE/QYG0DVadZDd5XOJEIeRoYpGOfQbIUOdtSpE2U6fYrLTrT5LDfX/WSus
         kYk1MvxEF2Jo6R876A9nrlwKc3WVQXFkOs/lOALwlqLN7tV+s168Tap96uHUBEYAvF5p
         k2Y8+3//Z7qM8/WZTvsAVb4X+7/b22MOoCtRcXwh2by7aWNf0J2VA0DJEUf86l1a4hUU
         egSBjBwojMtrLH50AuZIRNq7IRg/YA1IsHaDncUKHgVwb/lRrkzET3x/B2jW997Zp8Q7
         JwwcMQV27Zpa0vbgPBCgHrhwDPM2d6fqC+2kfV7ZgiqeUqM4ARvjlNjjmpuTE+Vuu9Ws
         w2gA==
X-Gm-Message-State: AOAM5321UYjwFgpbyv2GA889ixFi1x81a67ZAdSxbQ8OLT3HIlgRLlQp
	Bvphpjekj05ifaV4GY6HK2k7t1bnp2c=
X-Google-Smtp-Source: ABdhPJzhVgmBZJbym3Vn5DEjrWG6WROn2aD3OD2oQEefbNDwLegapk/AzZRsg3YFL5xoGYZG02b+NQ==
X-Received: by 2002:a63:8ec8:: with SMTP id k191mr1687459pge.154.1596608091693;
        Tue, 04 Aug 2020 23:14:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id a134sm1608405pfd.219.2020.08.04.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 23:14:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libunwind: Use -fcommon option to compile
Date: Tue,  4 Aug 2020 23:14:48 -0700
Message-Id: <20200805061449.1029166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

defaults for gcc is to use -fno-common this ensures that it keeps using
-fcommon until the real issue is fixed

Fixes
src/arm/Ginit.c:60: multiple definition of `_U_dyn_info_list'; mi/.libs/dyn-info-list.o:/usr/src/debug/libunwind/1.4.0-r0/build/src/../../libunwind-1.4.0/src/mi/dyn-info-list.c:28: first defined here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.4.0.bb b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
index 34c2249e91..a0bfec90b5 100644
--- a/meta/recipes-support/libunwind/libunwind_1.4.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
@@ -23,3 +23,5 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared"
+
+CFLAGS += "-fcommon"
-- 
2.28.0

