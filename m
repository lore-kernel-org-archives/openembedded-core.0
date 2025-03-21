Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C304C36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2134.1742569470734079319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Ueh0Tt7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22398e09e39so44210645ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742569470; x=1743174270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6KRkR6G2mLiV3jgN+q0jZlzkaJF6pZS3DlGpiiBqzc=;
        b=3Ueh0Tt7fZkDvcKzoMTBZxNkRzj7t5X30z5W6+nG8+LyhVpiUjoTlmINHYjxcpJPVv
         NNWVlNMj0bbvSJCVbw5yiNcad+AwDPwpFsfIOJS8DkEBvPQ7UEPAM2y+xPhX/B9iS3xs
         LrN0/Ik4wkd9xsgl22cU6FJXYGHXUFbsgzKn18HPULNtWVDGpnMLKiGHaRaYK7kdgD0C
         45z67e3CL4ZRUz9nqukXvj2UhpZ5aCgOpeipAlqR+1oNb1dLTB4VLVnhyjx+DymkyLwc
         Klcq7HxlZrWS+PMc3PyhhZLh00GPeF8gn87yaUrRcq3Qd8b1NSgSoH/eAR3aZ5YwnrgU
         qn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569470; x=1743174270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6KRkR6G2mLiV3jgN+q0jZlzkaJF6pZS3DlGpiiBqzc=;
        b=DiZ7cBifcoCFOeddZ3OuEYg0jYgsQtScxKJTpQxqKMMh1qrfayHx+g7/Z0A4UMCrm0
         cNM1HhKI92xFqOYlK4ghC/mUCzlHQ1IKm90u7VJFcM4xaovlVIMbek63ARcCG5d3z6eO
         FyDJqZ6Vq82lgNPfZofD3RRu2VXLpiOLWCAnuOHdz48M2MGRpHKimnVhFsylnPlDkFfs
         rig0ZjfaQXQhgui5s+ZB4TtgyHcD1Ii5g2yFjUjSfllHXgQPwCJE6HxuixdW+OMbAPWQ
         Vob58WHYVr1Df1XpSFQC3J2rcxPvOPD7NjaxoZTis1Py0uqvnWPmeSRF0W88VjqryuvK
         sf9A==
X-Gm-Message-State: AOJu0YxmyR3A0Hyu1guVGw/wo0mM0/8PYLvL8/qV3g08weYRZm54VM7z
	Ezx/fRpp65uJQbu640ms6dqqr082cT101XySbXp8kCMYMs+cUVHCzb72fB71VSnS8VGj4yLKUW4
	1
X-Gm-Gg: ASbGnctjJols7WNqxGBs2y+mrahKAtNs5QcVG6fN+auMbh2smMzIhkcA3Q1I0JQrdNv
	NqSJGPsZKMOzQqR24lHprg0wDJvPSaBMemI8/qZ/JgGuVdo2E2mNlg5aDs3JxGtqAS9Wc6hZ3DM
	pifPYR085vzeAoV/MQmCasxr9buVDm941HqLTfqy3jJXbMOLqPVn97z0Dw9yy4FlcUxB4BevIAr
	tp7eyXiyBCtRR5fh+I4PDrqJm79MQT26RdToxLtDmyqNJvlGM+hDfxGAk0iVLtDQvLplqsYu1Hl
	9NRq3fH08hukEo6k8J5tWVCBspLWWnNrZYiL
X-Google-Smtp-Source: AGHT+IFPRGn4EWySe+44zc6dZ8FAFdH2OrK99ItJ7g6tQ0M/PwO2yFOxH/9cdKW6pImJoeR2u1qYbw==
X-Received: by 2002:a05:6a00:1784:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7390598dd8emr5662873b3a.1.1742569469483;
        Fri, 21 Mar 2025 08:04:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2534:4cdb:e422:e636])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5788sm2076620b3a.50.2025.03.21.08.04.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:04:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/5] Patch review
Date: Fri, 21 Mar 2025 08:04:19 -0700
Message-ID: <cover.1742569342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213473

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, March 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1237

The following changes since commit 1be6d83466e3a0da4222ba502c2a86c25c835a35:

  Revert "gcc-cross-canadian.inc: Fix buildpaths error for pthread.h" (2025-03-20 07:31:40 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Denys Dmytriyenko (2):
  gcc: unify cleanup of include-fixed, apply to cross-canadian
  nativesdk-libtool: sanitize the script, remove buildpaths

Makarios Christakis (1):
  icu: Adjust ICU_DATA_DIR path on big endian targets

Peter Marko (1):
  xserver-xorg: mark CVEs fixed in 21.1.16 as fixed

Vijay Anusuri (1):
  libxslt: upgrade 1.1.39 -> 1.1.43

 meta/recipes-devtools/gcc/gcc-common.inc      |  4 +++
 .../gcc/gcc-cross-canadian.inc                |  2 ++
 meta/recipes-devtools/gcc/gcc-cross.inc       |  2 +-
 meta/recipes-devtools/gcc/gcc-target.inc      | 31 +------------------
 .../recipes-devtools/libtool/libtool_2.4.7.bb | 15 +--------
 .../libtool/nativesdk-libtool_2.4.7.bb        |  1 +
 .../libtool/remove-buildpaths.inc             | 13 ++++++++
 .../xorg-xserver/xserver-xorg.inc             |  4 +++
 meta/recipes-support/icu/icu_74-2.bb          |  2 +-
 .../{libxslt_1.1.39.bb => libxslt_1.1.43.bb}  |  4 +--
 10 files changed, 30 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/remove-buildpaths.inc
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.43.bb} (91%)

-- 
2.43.0


