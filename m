Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A357EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:31:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.20620.1688571105153137577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=s5J30UZ9;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso70696655e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688571103; x=1691163103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEw+LfDE250rKV/4elW6ZGwdenvEWQD9dMwwd/T/4oc=;
        b=s5J30UZ99ZnGRse2rt4EN7PDze+wFLk4Haj1so/RO30uBdPDMLCMiOAmyRNTJGlc4W
         pfPi0ySRsFdkUiCrM2DewH6FY7QKh1a9rF8028iydqd4YJql4Kd8R+suBd9C0fiLHnR5
         anfJ01MiMTru3mgnTTWwqFkBrQnr1jneO/pE6fnyyVK123/jFXbOdWyTLIyytrs6/ZsZ
         XNseJiKu+J3ZaZD/2i8L1bCotcgtgJDyVpUPeTvprzVij6dNzl/XC/HMIU/MEdEHNQsj
         zyXR6/0cme/RXNssgq6QnyU12CwsZzpmDa2D5D1L/mwu3glzVpHhxHBNptQFh3Lr0Eu/
         3V8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688571103; x=1691163103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEw+LfDE250rKV/4elW6ZGwdenvEWQD9dMwwd/T/4oc=;
        b=NReb2y37YRscuTaT/K+JcMQgIz+fl5G4eQk8et8E6KJWWyMir6/wezvOWyeq02gTy+
         hDlFtfDuJ7fDbJUaWtSrE9wDxmfNLcNITHQJRyLQ6I4oIZCWEOubbe84TLE6v+Ef4L4B
         IOvhCV5Pgl9UuOWndANQOW0j07LvnOM7oFmFccEFds1Xdd3H/GaS5CTAUAvjZRZ95n/3
         Ww0D3UIUPoRcuehlFJqIMwHTxvzhpskQHlh70+yby8E69U2fmNdd0H5mdZVfGRnPFR9z
         ttApYppslmY7JfbnfLVy4sHpOCeptjtVudgNAsHrLJR4uKcF2qeA68z8fcVD9qVuyNb/
         bfGg==
X-Gm-Message-State: AC+VfDxKMWfKdH44ghAs4YkjlPSpJhAJfmaF84IguNVJchZq0cgeQRaA
	W9A3NqrICqQD/V9E1BH1GImGcb/xkdsEmJzP3fyKoA==
X-Google-Smtp-Source: ACHHUZ4YtIU7f1XcvEw4lnFT1VrMe7xKSWzmVRCY98vcOAeF8+N9SHmdhzeKJQv4s1qVk2ifBjvAdA==
X-Received: by 2002:a1c:790b:0:b0:3fb:b280:f551 with SMTP id l11-20020a1c790b000000b003fbb280f551mr14884898wme.41.1688571102795;
        Wed, 05 Jul 2023 08:31:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k7-20020a05600c0b4700b003f9b155b148sm2447040wmr.34.2023.07.05.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:31:42 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/1] Add ptest for less
Date: Wed,  5 Jul 2023 17:31:36 +0200
Message-ID: <20230705153137.389584-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183893

Hi all,

This series is adding ptest support for less.

As of today, release tarball are fetched from
http://www.greenwoodsoftware.com/ but the less test code is not bundled
within these releases. A github issue has been opened asking for
maintainer to add the test code into the release [1].

So before test code gets bundled into the release tarballs, switch to
github URI.

Here is the output when running the ptest on the target:

 FAIL: chinese1.lt
 PASS: colorbars.lt
 PASS: github216.lt
 PASS: github265.lt
 PASS: github329.lt
 PASS: hdr-unicode1.lt
 PASS: hdr-unicode.lt
 PASS: proc-special.lt
 PASS: seq200.lt
 PASS: table-50x200.lt
 FAIL: utf8-2.txt.lt
 PASS: version.c.lt
 ============================================================================
 Testsuite summary for less
 ============================================================================
 # TOTAL: 12
 # PASS: 10
 # FAIL: 2
 ============================================================================

I am building a core-image-minimal image with poky DISTRO and run it into qemu.
I have 2 FAIL. All tests PASS on my computer.
I suspect a locale issue here but I may need some help on this.

I opened a pull request on less for Makefile modification [2]

And I also opened a github issue [3] to ask a reformating of the less
test summary to follow Automake simple test format to simplify the
run-ptest script.

My branch is available on poky-contrib repository [4]

[YOCTO #15073]

Best
Julien

[1]: https://github.com/gwsw/less/issues/344
[2]: https://github.com/gwsw/less/pull/398
[3]: https://github.com/gwsw/less/issues/399
[4]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/add-ptest-for-less

Julien Stephan (1):
  less: add ptest support

 .../distro/include/ptest-packagelists.inc     |  1 +
 ...akefile-allow-CFLAGS-to-be-overitten.patch | 28 +++++++++++++
 ...esstest-Makefile-add-LDFLAGS-support.patch | 41 +++++++++++++++++++
 meta/recipes-extended/less/files/run-ptest    | 25 +++++++++++
 meta/recipes-extended/less/less_633.bb        | 37 ++++++++++++++---
 5 files changed, 127 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch
 create mode 100644 meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch
 create mode 100644 meta/recipes-extended/less/files/run-ptest

-- 
2.41.0


