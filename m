Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466ACC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:36:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.12684.1639409802695707311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7bs0eA9y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so13625640pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4yp7HSQmP9Ezxdq/a6YtRpAdrFariM9MtFZjOg/nUY=;
        b=7bs0eA9yRd/1DNjvQNODcCVu9Ju58XFSzDJEhdo8ASTsZQ/RRbbFpByLYY3QoGWD17
         CxBVd8GbpBJ8k++Y8g/293nfuiYryvHVQ+uIUk+YuRixL8uQAxa1mx1eACVRe7W2ikQQ
         vW4duHTdl8GoNFbFkOdgUJpOs6ffFKh8tbfU81g2VI6qBCuY98neuTfxW0s6J5plX38A
         rI5iwJP91UCbrHTbENL3Jbk/ZOEg51V5jcCtWJqNensmQg3Tjh/FQm6UIkEKiOpCMSIh
         5X+7nreHDsBPF+U3eWCtvzmsAGTEbKAZ9W+GkPsKGi8JicQRY2gttlvKxGZw22LmrH88
         vxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4yp7HSQmP9Ezxdq/a6YtRpAdrFariM9MtFZjOg/nUY=;
        b=EZy7uRB44weouxxj9uSKHYeXxppIZFAFXZLYBqa6nIw91hL2Xea+Nbv9K/XYeo+mQb
         ApSDvpsJPDrLGmRsr1v2Nwltsc/zvqvuPsrjw6OqIdnbI1xqgW+BWmmQykWSv3L0XDUK
         OdetAx480ssawut64vtQtbBeCd4nqDSJV+6K7BxzEcVBH5b4pELHEoISng/O7hiRIMm9
         l54/8w/4w18CyErkNaDtADQ1hv5NZtfwTRkeUdPzD+hkroCffhTjw3k4qg50ddx287qU
         ENh0sm2qDiUiH7radSJsGUzcxFP4lUmfVZkOCAeKqBSMIUW9cgNTt2w0sPmT+KGQggTB
         3HaQ==
X-Gm-Message-State: AOAM530VPw+mSLspxXDeBJdnMFgB6JsX0rb63kaAcZrOe4ttXejj0LDt
	meSBHWAZ5LqKmcOTkKoLBio9jMi27j9zeHPe
X-Google-Smtp-Source: 
 ABdhPJwi/Uw923mqN4F+lqTwO7kkOIfa7p0/gQWvBE0L0gXFQr+X5T1yTDfN5ILItRoQ3R8wo4+p2g==
X-Received: by 2002:a17:90b:128e:: with SMTP id
 fw14mr45809313pjb.173.1639409801297;
        Mon, 13 Dec 2021 07:36:41 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:36:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Patch review
Date: Mon, 13 Dec 2021 05:36:18 -1000
Message-Id: <cover.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:36:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159643

Please review this set of patches for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3026

with the exception of a known autobuilder intermittent issue which passed 
on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2924

The following changes since commit f788765e1b9832d0da8ec4ce49aa811115864b0e:

  README.OE-Core.md: update URLs (2021-12-06 04:48:48 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Andrey Zhizhikin (1):
  lttng-modules: do not search in non-existing folder during install

Markus Volk (1):
  wic:direct.py: ignore invalid mountpoints during fstab update

Marta Rybczynska (1):
  libgcrypt: solve CVE-2021-33560 and CVE-2021-40528

Richard Purdie (1):
  gcc: Add CVE-2021-37322 to the list of CVEs to ignore

Ross Burton (1):
  runqemu: check the qemu PID has been set before kill()ing it

Sana Kazi (1):
  busybox: Fix multiple security issues in awk

Stefan Herbrechtsmeier (2):
  recipetool: Set master branch only as fallback
  selftest/devtool: Check branch in git fetch

Steve Sakoman (2):
  cve-extra-exclusions: add db CVEs to exclusion list
  selftest: skip virgl test on centos 8 entirely

 .../distro/include/cve-extra-exclusions.inc   |   9 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 .../busybox/files/CVE-2021-423xx-awk.patch    | 215 ++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   3 +
 .../lttng/lttng-modules_2.11.6.bb             |   4 +-
 .../libgcrypt/files/CVE-2021-33560.patch      | 138 +++++------
 .../libgcrypt/files/CVE-2021-40528.patch      | 109 +++++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |   1 +
 scripts/lib/recipetool/create.py              |  15 +-
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 scripts/runqemu                               |   3 +-
 13 files changed, 408 insertions(+), 99 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2021-40528.patch

-- 
2.25.1


