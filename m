Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE44C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:15 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.57984.1671561734121225634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ffc836X0;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id z12so11778682qtv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mj/VfzcUFlAr8mAiabDxdp+LEkc6n+FQF+MzWUSI1Ag=;
        b=ffc836X064EtzCEQjEV0XeFXeJxa1Hmpm1/9L6mqODJ/efC0mR/azq7Rh3GxwkhEXL
         8SE1u72zMvcm8AX3mXu1TXaruNgEQlrYFzUYDRDTRe0hr1jVVAJeUTLr+sHFGT48jG/g
         9TFzE4+vTf+g6yghdBhQAmv7+KIsEhsJBHaobE0H0Ja6rLVz5FHpj5FCy+XwyzcJNsq0
         oX+uEB3GytE6MtgTUaYCH/UVF+Xz/laSUQ6hsy/Thqb2yG0IIsYrPmM5yf1X3bou4zKZ
         eLF3W0KNX2MOrOiSA2a84M0bNubvFb1UaL+3joB0mxGq6ssgM7sc96P4q36KDBudgs2E
         gAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mj/VfzcUFlAr8mAiabDxdp+LEkc6n+FQF+MzWUSI1Ag=;
        b=t0HMSE1K5h7m9WPINO4X6ZQy5t9XZS5IuV6PMd18BVnL8Aq9GdkDSUPLxATNgwDFoQ
         FCXULzTQz4sPp/fOZ6zqPindYSl3ak1Rf60YMwoN3NpkNdn8NY6o2zQ8ZeszY00obJkh
         gCwoUy+f6PFJOXvm8rl8+RKQRNHLMyPxOqz9pmO8BgnK0SY3t+gdlbACittf8r+gxMik
         VzLWbHtdWuyD17i8yErTAGfRCMEQtdCbdJ+9HIPnkvTSYAiHSZNk3EGdNIov7497gPe7
         hG+OhFJVixTbRz9sho/32fTUTrOFAC08aczJR5pzsF1Tkz1RDSq6//GXBQ/0R3NJAWn5
         pM4A==
X-Gm-Message-State: AFqh2krCoo//XGOmZejPK1L6lK2WbmUqXdVz7mkz3H9FBid4Vasy/ma6
	dGygDt04ku8p8Of2eQ3ryhw=
X-Google-Smtp-Source: AMrXdXttc2ejemA23xKVLvQpgf2LwZhJAbAxg031CFXrE6hJmH3nYbwIEVl6GZz1FHuRFYWPKypB3w==
X-Received: by 2002:ac8:7c96:0:b0:3a8:1e9f:47f5 with SMTP id y22-20020ac87c96000000b003a81e9f47f5mr13292845qtv.45.1671561732960;
        Tue, 20 Dec 2022 10:42:12 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel: consolidated pull request
Date: Tue, 20 Dec 2022 13:42:01 -0500
Message-Id: <cover.1671560768.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174873

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Most of these are -stable udpates, mixed in are a couple of clang fixes
from Khem, and of course the bigger items of the libc-headers bump and
the v6.1 reference kernel recipes.

I've built both musl and glibc for all architectures with the new libc
headers, and sent patches last week for issues that I found in core or
meta-oe.

That being said, I'm sure there's something .. somewhere lurking, but
there's no sense sitting on it longer.

As for the 6.1 reference kernel, I've done the same. Built and booted
core-image-minimal, sato and kernel dev on all architectures. The changes
sent before the last release meant that our normal culprits of lttng-modules
and kernel-devsrc don't need any tweaking to work. -rt has also been
tested.

We can't make 6.1 the default yet, as the reference h/w BSPs need to
be updated, and then 5.19 removed. But again, no sense sitting on these
longer.

I'm around full time for the rest of this week, and then off and on
through the first week of January to squash any fallout from the
updates.

Cheers,

Bruce

The following changes since commit ace02cec70a4a1bc9088044905b3c4a801a39a1b:

  systemd: Make importd depend on glib-2.0 again (2022-12-18 19:48:00 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  yocto-bsps/5.15: update to v5.15.78
  linux-yocto/5.15: update to v5.15.80
  linux-yocto/5.19: fix perf build with clang
  linux-yocto/5.15: ltp and squashfs fixes
  linux-libc-headers: bump to 6.1
  linux-yocto: introduce v6.1 reference kernel recipes
  linux-yocto/5.15: fix perf build with clang
  linux-yocto/5.15: update to v5.15.84
  linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off

 .../linux/linux-yocto_5.15.bbappend           | 16 ++---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...d-input-and-output-files-instead-of-.patch | 67 ------------------
 ...ders_5.19.bb => linux-libc-headers_6.1.bb} |  5 +-
 .../linux/linux-yocto-rt_5.15.bb              |  4 +-
 .../linux/linux-yocto-rt_5.19.bb              |  4 +-
 .../linux/linux-yocto-rt_6.1.bb               | 45 ++++++++++++
 .../linux/linux-yocto-tiny_5.15.bb            |  4 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  4 +-
 .../linux/linux-yocto-tiny_6.1.bb             | 30 ++++++++
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++----
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 70 +++++++++++++++++++
 13 files changed, 187 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.19.bb => linux-libc-headers_6.1.bb} (70%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.1.bb

-- 
2.37.3


