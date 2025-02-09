Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F976C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:56:23 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.40275.1739145378633687949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrkPsul1;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4717bb7e7deso12405501cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 15:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739145377; x=1739750177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlTEd03pLfvq5jqiHgH178PzVMSGkD1J4/s8QrXiYvw=;
        b=FrkPsul1DYqF34BOOPjB/BU9UrAUrRrcL0ybhiUjX+FS8eW9ef7RZHkfbj2EJ1lG8c
         CU4+3OKOr5riDNRKxP2AYovyrfcEF1P87ANkmNiC2A8eF9KYGOVtM4EJRnlLlAkoFoVD
         eW/w6D/LJhNw+QexFyx1J99voTZA/K5FBO+DMD8V72Aajhphw0N2PI9T97hxLdySYBU9
         TG+VONrpXcF1nbKJVSkkZ9qfHqqh8Ib+O8A+qBbn65Npd9o18GOskcC6oiCHiXPESHd1
         RQLIoP6nzIbfoG5diHm8iFixEQNSobpRsezzgYh6TIXK5NekFBj+lmZFunHgQImO0j5r
         r2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739145377; x=1739750177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlTEd03pLfvq5jqiHgH178PzVMSGkD1J4/s8QrXiYvw=;
        b=uYArMzQuaGQ6ZBkWVatvPdCOmjco3MW5iqHaqqYNVGsGXeO8WABa3axCr2ckZE2QyA
         ZPDVZU+s0famPAdRL41JPnHVs+p2r+L0Tu5O4BUn0mnFmmQRD5wd4TJuG/HKp9yUeGrb
         0l41HiWpQK91q5goO4AYIoVn4z94Jlgrf+eyyuQF5VMqZXLyuHZirLuwR22TBkfhYaPa
         IeIJWWEAUzit8svzdplrNPyAStPxGONPgb8J//4meECAe751h0Vhi1Kz05CW9EDqZMly
         scrxRa/lIPe41lYHnwvofNMhe2wg7mOMEqwgozCFRhDj2izaw5yeL+n09SFc4ag+pR7T
         QhOA==
X-Gm-Message-State: AOJu0YwuJlQG/ucRPBj4YhawW3E5MNhprn+yGYuvH+64j8/YQ8J2XaYi
	rNaQVnRuG9A5kcCRCHEKAKugLRf9+acevBHRJ0b9517pz3ccHcYwq865jIVwvpQ=
X-Gm-Gg: ASbGnctWjRPTj7YNhtI3CDhnybdTjue+PW0OR2JjUOHNGJ0lsjfGjyZMlAEurRGq08j
	hO+7oyUh7hbpKFsiWCgCcJT6DVvDb70l30/EW/bfAk60QW7aPEGeM0i8Ghb6LU+loog3FnWPFIk
	mW1BjgCl1ZpUxk0StmLxILCOLbLT1+nEPn6qKUFiosLKlzT/kEkw8n+72WlYD2iKUG+66ezV3e0
	nA469iZ4Lwj4SyAS0xiTIld1zfWadoE2rSakfTTUL98pEGpqy6/uv4acJhP4p41P7h5p3Afrf6T
	EeTzzbciPCB4lfGOUkXf0AJD0wmfO2kuBOE3HeMLIp5EvalLsXlEf/6xwjI/BNFZyqGo3kQEXLG
	LHpYsKLL0GfcEBYNk
X-Google-Smtp-Source: AGHT+IHq3yqzR0wbuQGjLSbjjdUBHMbQP58Oybx8aLUYa54UXnC8csueb3h9xoXIEom/PDKJa990sg==
X-Received: by 2002:a05:622a:4296:b0:467:5f2f:4a9f with SMTP id d75a77b69052e-471687bf6f2mr141869561cf.3.1739145377601;
        Sun, 09 Feb 2025 15:56:17 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153beaa5csm40754181cf.68.2025.02.09.15.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:56:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
Date: Sun,  9 Feb 2025 18:56:09 -0500
Message-Id: <cover.1739145061.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 23:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211057

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the final preparation patch for the LTS release and
reference kernel versions.

I've tested 6.13 in linux-yocto-dev and it passed, I've moved
onto 6.14, so I'll update to it for the dev kernel in the
release, but that comes later this week as my testing has a
few issues I need to look into.

I removed the 6.6 references I found, and updated thing to
6.12 .. but I could have missed something, but they are an
easy fix if the AB does trip over something.

I also found a stale 6.10 cve file, so I'm removing it in this
series.

These are on top of poky and a single series, since it is
easier than two separate sends on top of OE core and poky,
but if we'd rather they be split, I can do that.

Bruce

The following changes since commit 4f6b1440af3eb7c4b659d9b0329592180ccea5fe:

  scripts/buildperf: Add chart tabs for commit count/time (2025-02-09 18:42:48 -0500)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  kernel: drop 6.6 reference kernels
  kernel: remove unused 6.10 CVE exclusion file
  linux-yocto/6.12: update to v6.12.12
  poky-alt: switch preferred kernel to 6.12
  yocto-bsp: drop linux-yocto 6.6 bbappend

 .../include/poky-distro-alt-test-config.inc   |    2 +-
 .../linux/linux-yocto_6.6.bbappend            |   21 -
 .../linux/cve-exclusion_6.10.inc              | 6660 -----------------
 .../linux/cve-exclusion_6.6.inc               | 6660 -----------------
 .../linux/linux-yocto-rt_6.12.bb              |    6 +-
 .../linux/linux-yocto-rt_6.6.bb               |   48 -
 .../linux/linux-yocto-tiny_6.12.bb            |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   33 -
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   74 -
 10 files changed, 21 insertions(+), 13517 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
 delete mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.10.inc
 delete mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.6.inc
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_6.6.bb

-- 
2.39.2


