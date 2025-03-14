Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E49C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:36:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2788.1741980955803694743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wkCUP2Sy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224341bbc1dso49956915ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741980955; x=1742585755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYYbU4sZz5fgb8CH9qLRNhogFWNnQkyvndE42ymvbYY=;
        b=wkCUP2SyGxW1BfIgVcOJWygVClR3ud+QwJ/0AEiOT+CeRBjM1gPLhYrIBI+wNkuAf0
         R8tuUZG6Qe1xohRMWNfPqO+SRoeT3B38DlDdMKFDZeYbWrV4Wwn6Zv/ZEdbPS7Ur4LiT
         G57b/ZKp3tEAU4G0IUx+1atqBByxp7M4Xs/9x6EsuFj/r/oNSGSjy/dJ84/9nclXcIxu
         YlBv7FmMDwGH5dSsn5ENfWPUH+mVVLWcdI8mnNKQFaD2roQG4p7GHL3nw/WIgPM4ivgr
         OOYdieMJ+plPeRA2ekHMyeS7uZMpVjQPznDx+D6ZoN+xZzcOJaQQ8824gI3T/XSHMpTU
         Azbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741980955; x=1742585755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYYbU4sZz5fgb8CH9qLRNhogFWNnQkyvndE42ymvbYY=;
        b=aRWnuyylrx9PQ1Gnms5zOsD7FCkz/KwOXRyZ1qJBcrm+zoHiqvD9fv/3vq65ipqLUd
         ekn07Vr8yDPjZKnYOFaGrCmjFFTqdeqCAcY9MVutN8W5bMh+xIMcb/zrJ0/jK0Yo3Ukm
         exMnzG06G/lBZ/n4b0jle/81pQb3NHhWU99xPo380HWK+AAN5aMKBIYfTVAx4GM8fJPl
         Ok8Php/XcbwqtT3lCBREyB13yVuV1hhPmaeK7jFvpKJDS9l5MnKZVOzMRXQznjtlDUxP
         A/EVS5wDZeuLcB79PgQ15k+Gb3/Ft3OFn8NT5IllKIblOJwknVacVXuEPbGx8PfM4lTw
         gkPQ==
X-Gm-Message-State: AOJu0YyoUrlG3lPXc/1+c1bqmbqZaswMKo1d61E90XjKvZ+XMY9xubA2
	ZGGyW2Ol+z5ulda76bvJyT2BB8LLGEubF40K/qE12lCkf60Bbdv0xDTv7PynNi0NlnnKw4soW+f
	O
X-Gm-Gg: ASbGncsxp2yuTn1osn3zcpqcxHdmFU/eU60DO/K1CO5ooLw3spctQ0yjxYgOhVq3eTe
	7mBqtlaFu9n2Mixnzm7TbJMkXjh8JY1NPeREOObAVRb5qUfKKGIOlmtHt1MvZuQqC1qhdzwjAl8
	PEm0lVLVwDUPlu6x77W80ofXSwGxy1MM7+T9GLmszwy/WZdMvdh953TNS/ZJ/m19sToYYR6CkiN
	70Pi+gSmLDcD0YiVYHfbyjzsypujPO94RCfKI9jVyXao4Ql+LZS/ygnDLsPnLmbPsH2oYl93I+G
	bcfiZbmW2yY2WXK3BTRwmkfUAznTtRL9yAOh
X-Google-Smtp-Source: AGHT+IE/GZnuM4iQ+Ly0ggZvMthQRVZikhzwTkDErrRk7L38dubyc3aiBW6kbPK87izXrWc5HFEoKA==
X-Received: by 2002:a17:902:d4c5:b0:223:3ef1:a30a with SMTP id d9443c01a7336-225e0b0987cmr49366005ad.45.1741980954906;
        Fri, 14 Mar 2025 12:35:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6978:e88e:1ab7:676a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d5dsm32265685ad.153.2025.03.14.12.35.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:35:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/4] Patch review
Date: Fri, 14 Mar 2025 12:35:35 -0700
Message-ID: <cover.1741980835.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212859

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, March 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1193

The following changes since commit b00b0d744a1768843386cfd529b73cc17c88bec9:

  babeltrace2: extend to nativesdk (2025-03-12 07:14:12 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Oleksandr Hnatiuk (1):
  gcc: remove paths to sysroot from configargs.h and checksum-options
    for gcc-cross-canadian

Peter Marko (1):
  libarchive: patch CVE-2025-1632 and CVE-2025-25724

Sana Kazi (1):
  gcc-cross-canadian.inc: Fix buildpaths error for pthread.h

Zhang Peng (1):
  mpg123: upgrade 1.32.6 -> 1.32.10

 meta/recipes-devtools/gcc/gcc-common.inc      | 22 +++++
 .../gcc/gcc-configure-common.inc              |  1 -
 .../gcc/gcc-cross-canadian.inc                |  8 ++
 meta/recipes-devtools/gcc/gcc-cross.inc       | 15 +---
 meta/recipes-devtools/gcc/gcc-target.inc      | 16 +---
 .../CVE-2025-1632_CVE-2025-25724.patch        | 83 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  1 +
 .../{mpg123_1.32.6.bb => mpg123_1.32.10.bb}   |  2 +-
 8 files changed, 119 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.6.bb => mpg123_1.32.10.bb} (96%)

-- 
2.43.0


