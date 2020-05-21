Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.9672.1590077750238097655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LBKLRSRo;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id q24so3301116pjd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+57oyErjL3714z3d6OszfQRAOXXDxfKQQc9n82P/Zg=;
        b=LBKLRSRonC5qw050Y51axMfphtl3lzf5DuIfUi4Xg3DdeNYsleZNbF44JkzIVfjcHB
         ULUgLjbZ7YalEyqW1Ci3XEoU4HmEvntR5Dp/U38CXHFIfNyZbQmUCR3uw+tTYxOrodYB
         3Srm4KmQLcUOYsC2Dn/QNRzPvCxcCeevsApNkIcS887Mzv1GbRww7Qfn2McM2ckPordA
         JZSdqSfpY9PVyQM4MbvZJ+rP2l2lFsKk9H/WtkLK1a6Q7he+Z/QhRRKLebc1kNkN3n9g
         stsWBw8c3mU4oXSHLTZnIG55HqQm7/+N19RHmEjD8nXKTzFPXXfBw2TLrLn2pxe9CV5m
         X1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+57oyErjL3714z3d6OszfQRAOXXDxfKQQc9n82P/Zg=;
        b=CiPi0vvMoRD2blN86VHFWDkmG3l67mLe9J+OxHx8mLaxfwQfmXpFRdF3+eVBAaYBvW
         +CfNCNX+t9Einy+cu3duHbiJpqyNfmxrYyD7ZG5rMWwu5GFgX+RWUa9dsaZsucuDe74g
         09GhhsIU75cPa4g3zHXvS0dPPDHRbESHAc+xUYMrdXMjw2/Ll2c8tdpN/8tuezDz2pjn
         f8z2qbPuHOw36oysRHj5sL2HuppiRvXXTN3/g0xyAifkQEfO9JvXBsL7jlIj7HIb8Ol2
         ZNZGrQn/vekTyAgMlzF8P283dMnkES6Qm+PXVKSnwRsqcjqvoBr6/1ool7xND0QahOnT
         lvgw==
X-Gm-Message-State: AOAM532kK09V5EaK6ad6w++8tQakycttMH0i8if+XqWmriT8lGY5vimZ
	Hfmhe0XopYRgeW2cQ7cth/g5lxq9ooU=
X-Google-Smtp-Source: ABdhPJyWvznC56SS3D8PXL1Il4S/Dme2Jpg/95ey0ayY+91kj9zClUdJFx/lLbIxdD7rv5YCwjDo/A==
X-Received: by 2002:a17:90a:6c04:: with SMTP id x4mr5548376pjj.69.1590077748944;
        Thu, 21 May 2020 09:15:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 02/10] gcc-runtime: Avoid march conflicts with newer cortex-a55 CPUs
Date: Thu, 21 May 2020 09:15:35 -0700
Message-Id: <20200521161543.3273063-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc-runtime/libatomic explicitly add -march=armv8-a+lse for all arch64
but cortex-a55 is armv8.2-a, which essentially conflicts, so let gcc
override it by not forcing the -mcpu option from TUNE_CCARGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ace706dbf4..d9a4e483cc 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,6 +18,10 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 
+# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=armv8.1-a
+# which caused -march conflicts in gcc
+TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc+crypto"
+
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
-- 
2.26.2

