Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E094C25B74
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 05:47:18 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3558.1715233636805147335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 22:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORyfuYFH;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so3866685ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 22:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715233636; x=1715838436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzIbBEU4tiQw0GJ/I12PbhLqYoEE4rrKYKqwMeGx4ZM=;
        b=ORyfuYFHyR8JxLgGZeRf2nMhxo/HgxEQ1KuzyuthB4ECyss7JpKOZ54Nm28DndeiAQ
         wvBBHn4BhOk5kEHmPqJUZfUbwFNd1lwS0ZVukXfWs0iZHT+Y2RkSYaULA/UxHaXr3IVC
         9QLIReW+Tl471B6HMPf2FrSxiK5SxAGOOkkPuD4Thw4IJysKIuFcX31Ozr99C4KjgRP1
         PIvEf7HVxryJI9LJ/pt14JEUVOonzShROJJTgnoquylVEy20OjLo+2/quEjnCAhYLxbp
         ulYW5szrRP6ojRqTp3pJVM/fUgtCrfCuc/TfJPTUb+oRPfHNypSxnjlWBQxbsq3rKPrX
         eL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715233636; x=1715838436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzIbBEU4tiQw0GJ/I12PbhLqYoEE4rrKYKqwMeGx4ZM=;
        b=AfbO3kMcOt0iplrCfpS2N7aMAwW1MBPHg3/2mgd2DRdiRza7JDxLah5JRwQiqMGO9q
         Z3N+2cGdC9MLAXAhBLpAnEIad18SlP1PymyJZniR05/duV/0LpVUDErdz7cJkjxS37q+
         9fE65laNDJPPIgb0nU+YdYZ/14+TvkdMn6sefOTTAPR2j16Az5xPdGObSOHOFNFYdCGa
         HwbY9adpwZEyShhlHw6XZxn8vd5s7LpcAGMlQ7x/HU0ZLz/IBqJNQndhCRXfsu800v44
         BIW35B1/aLX4mvn1p4XvnCnlEounf9xQ9ntGTKzA3U+kf6XZz3pqesPEkb8cTiYSFaUf
         R9WA==
X-Gm-Message-State: AOJu0YzMbFIIqZQbB1YhlnlkfEMMUrDLis1G3z8EWBTilagIZTOP9JVA
	5gIeZQbSEhz+kBEe1w+LXFYCpdb8pfp4zF7B1Nl111xyCvSkIYJOsOtPCLOB
X-Google-Smtp-Source: AGHT+IEUQiC9NZzeDgsca8UY5P7R66FTVJQp0FWgAXLYMJTPstjGk93eSXcScJi9qcekbm5/doFoCw==
X-Received: by 2002:a17:902:eb45:b0:1e4:51ab:fffb with SMTP id d9443c01a7336-1eeb03a05bdmr51041575ad.25.1715233635981;
        Wed, 08 May 2024 22:47:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30fb1sm5240835ad.177.2024.05.08.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 22:47:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Use locale-base-en-us for locale
Date: Wed,  8 May 2024 22:47:12 -0700
Message-ID: <20240509054712.806534-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199140

locale-base-en-us is available on musl as well therefore, not need
to make it glibc specific anymore.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/strace_6.8.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.8.bb b/meta/recipes-devtools/strace/strace_6.8.bb
index b22c57b45d0..e1cc65e053e 100644
--- a/meta/recipes-devtools/strace/strace_6.8.bb
+++ b/meta/recipes-devtools/strace/strace_6.8.bb
@@ -47,10 +47,6 @@ do_install_ptest() {
         sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
-RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed"
-
-RDEPENDS:${PN}-ptest:append:libc-glibc = "\
-     locale-base-en-us.iso-8859-1 \
-"
+RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed locale-base-en-us"
 
 BBCLASSEXTEND = "native"
-- 
2.45.0


