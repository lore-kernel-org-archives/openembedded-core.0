Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7E7CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:05 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.4484.1755636599313489821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pS353J4C;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b47175d02dcso4799583a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636598; x=1756241398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNfKPbt/UeCxz0TNppiabPrTmM5zChnkTw90XAjhqCQ=;
        b=pS353J4CO0lpVR0S9iNokZCWp/s3a14IUUgJr1f9wTIr1LjXFOXtUhZcJ9weRVOQoE
         SA0AhXAngN6sDsrE8z8t64frJvNDmp6Cka83uneBtCmQG3/lWQ+RJTVK4T3xI7Z5hvrO
         8QS4bNPOVzW+2mQPfAgtG+tI0B7H5TSs63xPSZ3UTe+IWNpuYiyhrzkXYxPC/DFfl2P8
         vuyhQ+2eiiRN4oEVa3DUq94i/NtZu6FTTrXJnv7PT01ns8ad0mLiKUEysY9ukYO7838O
         s5Fy9BN7SSjllgonV6ElqH6QbCcNnWBtm/AHdc+PBmLgJywg7vzoGjrw17qxBKHdBwPp
         pLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636598; x=1756241398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNfKPbt/UeCxz0TNppiabPrTmM5zChnkTw90XAjhqCQ=;
        b=ehXhABJiL6lh7AJv0IUHYXeb2BAsjyhZZDTLgRHxl0vx7gK0p9Bi8c41iAkZ/izYYC
         BEy30+u+gCHJxPzDWNCMZKkAzxb8VXMj412kwuLKMVBINvQ88xMqGb2FP3AgVFo0Suxh
         yAjrtTbXctTJbMsUKPI0wtcn8IX1AWXqzOCn7wAvWbDhfeOp2VuoXB+F3uD4peQutEqW
         5FpHzHmL9F54Y8VKYeXQKomckC8b8o4iVXJTY9R7JNigyTvkjYQ6Q34Nkg4EFSdPnoGV
         JnEdqgyWC8BHxM5eXPQ5upEF6I0QVRYr4cPY3tC6qujYZycWKDm6tTveg9wM0dZDquUi
         zSrw==
X-Gm-Message-State: AOJu0Yzs7tai6cyjsAuo9SVbSk+WkZcnftJ+sXeMyRY7OJZJo2mL+2KH
	RSidXWf29O9SPtHpxyH3KbandsLenGATezk08aTkco0stRmJ5jk2mJMyynRyjwYJFi8M1+E1gSw
	EqcVC
X-Gm-Gg: ASbGncvjWfVNoptt0PenkHjesTg+bal9rkW6gd0X9JyfRTnfyGzUprvyGrd8QDPHzBf
	4CqNCje2CElcDh9CQKN54jFuA0ph9+3dqc04jufaPzh+ZGm3iX1YqprNQeB1ywSdLFFR13ql2OY
	lnFml/gGsGB8Qm6iFJybMMQxJMr1Jbm3rbGZsTylxJ8CR6Dv2B/FTcxALwlAq/VhorJFaR/9Quj
	TlbIU4yXkWPEPVRjzVrJwy+6W/aV4M8FoNNpplvDEEgGuKt6tJCrneV8MMd0wROeq5IWlVWkKDR
	vE7Cv37i58GV8AyMC3GQqurvDWss3XDi+l3CSiQo3/kbkU4DyxSOjgoWXRsRCRL9Cwvz+KLjji7
	SjCPVQUV3encTiw==
X-Google-Smtp-Source: AGHT+IHFbNmORxjuYvvCpf2KLJU9AYJVX9SgD/XWyKvJl1IFlX92Za0HqAn/bvC4gscAJ8XvQuJITA==
X-Received: by 2002:a17:902:f78d:b0:23f:dc73:7798 with SMTP id d9443c01a7336-245ef0fcebcmr3526525ad.6.1755636598494;
        Tue, 19 Aug 2025 13:49:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.49.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:49:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue, 19 Aug 2025 13:49:39 -0700
Message-ID: <cover.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222139

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, August 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2236

The following changes since commit 3d1c037a7cb7858a4e3c33a94f5d343a81aac5f7:

  go-helloworld: fix license (2025-08-12 09:57:24 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Dan McGregor (1):
  systemd: Fix manpage build after CVE-2025-4598

Hitendra Prajapati (3):
  gstreamer1.0-plugins-base: fix CVE-2025-47806 & CVE-2025-47808
  gstreamer1.0-plugins-good: fix CVE-2025-47183 & CVE-2025-47219
  git: fix CVE-2025-27614-CVE-2025-27613-CVE-2025-46334-CVE-2025-46835

Peter Marko (1):
  glib-2.0: ignore CVE-2025-4056

Vijay Anusuri (3):
  xserver-xorg: Fix for CVE-2025-49175
  xserver-xorg: Fix for CVE-2025-49176
  xserver-xorg: Fix for CVE-2025-49177

Youngseok Jeong (1):
  libubootenv: backport patch to fix unknown type name 'size_t'

 ...-Include-cstddef-in-the-header-for-C.patch |   27 +
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb  |    6 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |    3 +
 .../systemd/systemd/CVE-2025-4598-0003.patch  |    7 +-
 ...-27613-CVE-2025-46334-CVE-2025-46835.patch | 2500 +++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |    1 +
 .../xserver-xorg/CVE-2025-49175.patch         |   91 +
 .../xserver-xorg/CVE-2025-49176-1.patch       |   92 +
 .../xserver-xorg/CVE-2025-49176-2.patch       |   37 +
 .../xserver-xorg/CVE-2025-49177.patch         |   54 +
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |    4 +
 .../CVE-2025-47806.patch                      |   50 +
 .../CVE-2025-47808.patch                      |   36 +
 .../gstreamer1.0-plugins-base_1.20.7.bb       |    2 +
 .../CVE-2025-47183-001.patch                  |  151 +
 .../CVE-2025-47183-002.patch                  |   80 +
 .../CVE-2025-47219.patch                      |   40 +
 .../gstreamer1.0-plugins-good_1.20.7.bb       |    3 +
 18 files changed, 3179 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2025-27614-CVE-2025-27613-CVE-2025-46334-CVE-2025-46835.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch

-- 
2.43.0


