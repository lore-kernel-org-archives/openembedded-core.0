Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A42C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 13:29:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.74808.1755005360394588410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 06:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CIDqz2S+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso4652730b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755005360; x=1755610160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhGwxeFcQVrHO+Rw/aMnCsaqMmhUsrTYmYCzsQXTEgc=;
        b=CIDqz2S+ZdN1+4oZeSGQxThHEeoFnKfQP2NCu9ifpQ5p8T3G3T3ghHN8fTf8RSZLsK
         N0+iqNnlMWpVJLUMlNsdKvhJDpJm/uKcSz4G/Rhx4XN247InxFcw8xFkCnsbgn/etGsG
         d7D0P5MXKWh4chUHTvFE6DUjqiLVUwNqAk4PE8y3IX5zvGVMvw6ljgsSRdI5jFKiMPbn
         OL2fTpPjW6xbJmNBhkMl0DU2sly7GrKlBRI0BbjGgVLUK4ikJx7OtBbhhErMbNSjBoHf
         QpuoktTPWCKBxEL4tp4BQX+GXIryZS6g2nMN1H/TVcQlU8FxCNedC5GQ3IiU303DYrkj
         6INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755005360; x=1755610160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhGwxeFcQVrHO+Rw/aMnCsaqMmhUsrTYmYCzsQXTEgc=;
        b=sWFpI4pSybjrwCCQewGOPIS7W6lHrb/mSUpLYJvzkrZzucU9NZWyGqGdEdRpi2B1g3
         +3eAGZbEI/sZN8m5Pt826rUr0Y90Iud1t77beExlTFPRuvT9rfpYYICT0IHWkmypEoxG
         ibs5Luslxh2h0CvwXKYv4rJoF8pt94xNkU2Iy9yoP4gnik0waM/Uvi5cJClyRKkRaREs
         iOXduWlX8HKpiQpfyej1IefRLljTkeDjiHiu2sth8nmEcbYnbuJhCgSJCRlNDBdmfJ3A
         eu6RgVziju/NVhiW4eVr3FHaqWfrVDOT/O1pG2VqAWg2FWJeQkV/zD5SqbQMX2ougdfs
         0QnA==
X-Gm-Message-State: AOJu0YzL8BlRuqRYCACA5Ylf/bvlzg6GDoV+y2UMWyaPRoln1TnMFBWo
	qCHlACgalqEIxVQexV4x5e1g9X0uWSPR/VAx4DPtizxNWAwHiDftUUiVLpEpnH4HbgG4ftmQ1ca
	7zGPK
X-Gm-Gg: ASbGnct6oiHuc+rCP+crzwD9MN1uG+yBigRREcXSLWyiqY71ulMkjINnbfUQ+/QvZyA
	7kzp/fvKk9H8Cp2Su56RrmIZYKuyqzDuE1MIBK/ytTVKlKiCtHaAKvCg2yM6fOAq/wTBEUHPGmh
	4fAJvEb4id05hNGPJgfZKGQQq+Yy29axXTWlApHA6GZ6Zq+OiGYu9ge6q6rxvzrkP7wa3+G9XTO
	ntyn5fJ6sKt4LqmTIqXYZ0LvmrBryPFI2SheGwnDZzr7lwcvMbiqvPXqAtDOyHDSKLz2h2bmlOI
	nLfOL0RxHRgxljCz2tSUXzqD9axV64nLXjKl1zqf52nABv2/uSFN3+54XZzm2wUPCY+a8MRD2ZF
	n3NfWVYJWR646Kw==
X-Google-Smtp-Source: AGHT+IFBLNFbTJ/lYoRELYAAu0XH/VyEL2oDLayzvQ4N6DgIE11jwhddWGsEhuZlWuEy8kXKTt2evQ==
X-Received: by 2002:a05:6a00:b8c:b0:76b:ef44:1fa6 with SMTP id d2e1a72fcca58-76e0ddf82d2mr4540810b3a.4.1755005359300;
        Tue, 12 Aug 2025 06:29:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:43a9:39c9:3131:3b8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf067e310sm24664635b3a.25.2025.08.12.06.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:29:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/3] Patch review
Date: Tue, 12 Aug 2025 06:29:12 -0700
Message-ID: <cover.1755005205.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 13:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221769

Please review this set of changes for walnascar and have comments back by
end of day Thursday, August 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2180

The following changes since commit 69090e41eb0a8b92e0684d391966f9627bfe5195:

  ca-certificates: correct the SRC_URI (2025-08-07 12:35:30 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Khem Raj (2):
  glibc: Forward -ffile-prefix-map option to assembler flags
  bitbake.conf: Switch prefix mapping to use -ffile-prefix-map

Peter Marko (1):
  dropbear: patch CVE-2025-47203

 meta/classes-recipe/kernel-arch.bbclass       |   6 +-
 meta/conf/bitbake.conf                        |  14 +-
 meta/lib/oe/package.py                        |   2 +-
 .../dropbear/dropbear/CVE-2025-47203.patch    | 373 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2024.86.bb |   1 +
 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch |  24 ++
 meta/recipes-core/glibc/glibc_2.41.bb         |   1 +
 meta/recipes-devtools/gcc/libgfortran.inc     |   2 +-
 .../python/python3-maturin_1.8.3.bb           |   2 +-
 meta/recipes-devtools/rust/cargo_1.84.1.bb    |   2 +-
 10 files changed, 410 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch

-- 
2.43.0


