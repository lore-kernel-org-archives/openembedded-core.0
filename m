Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F94AC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15557.1737734224232454501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y+EdQRxE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so4040546a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734223; x=1738339023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HB3L//yMqNQJo5rBAPSlDf00lTOr3d3rYc0QS4oEmE8=;
        b=Y+EdQRxEHTWk8y0KH4Y1+5FXmzFdBKJrjC2Q4YoEMs7lhyyAdZ+7ksXJ1OIqnjMNmI
         9bC88TIRx9zOkfkMSL4s/M/9phmcgMXiBl8VEx3SbR6XmpgRV0Dp5XyzbdhNHclJtIFD
         tZnNAHNIwERY95Nfvuhe5bQMNbvoKd2oU7zQ4vxjFh+DiesP3sSo5I1TksoPWWfA1wHZ
         20Hrff8hGaMZSJBbzzmA3GTwrkxadcuzK+OuU6Phm66hl5I50JVoZq+WP7BhJ09kPs0L
         jArgtxiVT5OzDQP12DbnbmmsPI70tPMVnqzoMnsyzz+Jmmq02kG4/Mtx0OiuHd4BH8Vn
         DJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734223; x=1738339023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB3L//yMqNQJo5rBAPSlDf00lTOr3d3rYc0QS4oEmE8=;
        b=A5wxRd6JaLZznw6Br3zxVfecgdt3txipxJnN385q8Hpvh7axkRX3uDfDR9JX8DV7/2
         bIiUq1O+mvLBECF7ydJOlq/e+y6kG19aAyR5i/5TRt21T7Jwv09sBm8zDhlm4T2uMS0r
         w/I5hQEqb1NyT25A5OQggLJID/FOXpUMLwsBKXw29dWtOKtFGRb9BaH3QXTZvDxmYp0a
         obdHuagK30Vs3nBonyAQwseSp9+vsOBJWehMHlbKAJMONVfskP4nIo+eSefzNyovEAMR
         VFzSSrInSm6CdqWoD72QxKvANthvkaF68FUXUcKH1+gVN0B+t7Bda2KQ3mOL75ufc4XK
         dRSw==
X-Gm-Message-State: AOJu0Yy5jUF5gZPZBll8tYHeH5zLQjAzRgAoY1IYiZoJEpbm1UfbUjeH
	K26622pIRsj7gAnAVwe6/A1CedGz4UQW0hE3jaT+1EHeuhJJa7ExtRa0OtBmDatxjd9li66IPlh
	Rou0=
X-Gm-Gg: ASbGnctDtxNz4qblA6fTVHH7tVeHr8IZYnTJbxA9Ayl+bGE595vuIUEC/maBwfup1uv
	S96QQgkefxBhP7Rw2+sFOcXPERiIIyiS0IgRWi9pTOtL4BQNMG9u9TxaUvwcuKjlpA4ubsHsvHw
	gG87rQ9Gwsss9emeHrmV+ox3vLJkH5rIBJtT+skHwoOSG5ov/bn+vTtqlt4r9ZgpQi1me8ZsMBO
	ypoytlzGfGvTwbULMimejaowMytWHEDel6k4qKBkgMNXJ0WfmHrk17HD3O4G+AJnuWYgQ==
X-Google-Smtp-Source: AGHT+IHncPxoDkPYA2RH+RjnijkcmOwh8E5kzgyP0xcJCumhhYhxtfM5CiPVUkbsRw8KrrfD9iZUQg==
X-Received: by 2002:a17:90b:5201:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2f782c70204mr44915374a91.8.1737734223392;
        Fri, 24 Jan 2025 07:57:03 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 0/6] Patch review
Date: Fri, 24 Jan 2025 07:56:48 -0800
Message-ID: <cover.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210227

Please review this set of changes for styhead and have comments back by
end of day Tuesday, January 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/876

The following changes since commit 62dfe689246d648f9970a5476716e486b1a33765:

  build-appliance-image: Update to styhead head revision (2025-01-13 05:49:55 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Harish Sadineni (2):
  linux: Modify kernel configuration to fix runqlat issue
  rust-target-config: Fix TARGET_C_INT_WIDTH with correct size

Jiaying Song (1):
  boost: fix do_fetch error

Peter Marko (1):
  socat: patch CVE-2024-54661

Ross Burton (2):
  classes/nativesdk: also override TUNE_PKGARCH
  classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package
    architecture

 meta/classes-recipe/nativesdk.bbclass         |   1 +
 meta/classes-recipe/qemu.bbclass              |   8 +-
 .../classes-recipe/rust-target-config.bbclass |  10 +-
 .../socat/files/CVE-2024-54661.patch          | 113 ++++++++++++++++++
 .../socat/socat_1.8.0.0.bb                    |   1 +
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |   4 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |   1 +
 meta/recipes-support/boost/boost-1.86.0.inc   |   2 +-
 8 files changed, 126 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2024-54661.patch

-- 
2.43.0


