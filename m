Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFA5C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:55:57 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.4745.1741809355980909286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TBgsgs+H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22334203781so24981895ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809355; x=1742414155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky4eDudVQrsbFABDhIpRuVuCZ41eTODha/jWfwYsf3Y=;
        b=TBgsgs+H/oHWE79r6QDC1rDG0vw1WFsjBjpfdTK0hUXDnC52hKrVQ03mgtKnWrYQVE
         x9imKSrKwaaf6LZDP3MHdbYIT2qclJ267/5VCdqx8dDfwEz3iImMlxEN1szgNoh+wXhY
         wJ4OSYxKzli66iCu2T9esFMLZh7vMVDILMVopybeNllZYUBpu30uwoZtlH0hUbVA9atY
         KLK3m/nc64uY+xSs+ZRRVhXxmr/dZMkhR0P+2QQy0POvBDyIbQtB0K1sV1EedNd4K0mm
         TkVi2MGbrjndXBRhktWOC7dEqGwlGpBCcFaqnuSABubaz5oy7Dlo7y6ksptmihw2dSEA
         N+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809355; x=1742414155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky4eDudVQrsbFABDhIpRuVuCZ41eTODha/jWfwYsf3Y=;
        b=NUrib/HObTxBb2WZ4BDpp/TXUXhhUcDkaUEe1H+AsiqAq/SgOotfH+B7JV8tSRroAH
         sGSoHp2JV6zyMSAhGXGAug97AYvHCRYPuWtPgzf4YhymJDPlgt5dfjy4OSYcJd6zJB7q
         yIs8PnSKJ/WEMbSAT8aJqYJsfXGs/kIKYgL6YgFE6tA4FaIpxpcBNytGd/ML6ImkiozG
         q4B4/ngXg7RBLGr539A1o0jhek1Jz+gVy4C/3vLbTL45I/C1X1p5rkdkEiPe/I20ld0t
         obstnwqJaYdkpjlWjWKDpBXC9ZQX/7xOiE3KFNjLo5vxKRah+6Qn9R7/5yip4giWnB5t
         hqgw==
X-Gm-Message-State: AOJu0YykK/MxZWKDs/BLom927UfBx7tUakas5iFxYKhHT9iViGWA+Ai+
	ipqvjiiiDb4RWvju71jUFcG2n+Sl0R6Rv1ThsrDvig/HacVFL1NYiKSrlafZBkhf6Vf2AK1FFpm
	j
X-Gm-Gg: ASbGncsJU2a5UiA+SWwTsX5oB8NWec3/HVQqmpHCH8K7oDm+ujcnUBu/1IOFfScUJ6D
	YZIboYWUrJHT2KcnXvMppnA3zlA40yu8dWXNKYLV3Cd7n2e65YfeBRVcNEm8QgBA7RcsqUJWc0n
	T//K5EfRkTywEBI0UNRPc3z7WlPr7bkrPAd1xZVCUPsrhtHU/IBdMHrnPTmnyqJMYG+wwowtxcV
	w/clg/6sOySDWLvqiDiDPr32eIq4B8upHNk8WLD7jXJQB5gEVfKMy7Y8FrIHmjJPs2yzvBrxPW5
	Run9yc7WANYIDbk6vgCTP37hgma48pxmcVI=
X-Google-Smtp-Source: AGHT+IFIm0Y/GEa+DujSRY89WLUHKTdBQBFnNyslJ5E+wjPRqP9bfkUJPHtBklw3fInMcc27/WsfqQ==
X-Received: by 2002:a05:6a00:988:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-7370d7d7252mr1179834b3a.12.1741809355173;
        Wed, 12 Mar 2025 12:55:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.55.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:55:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/28] Patch review
Date: Wed, 12 Mar 2025 12:55:21 -0700
Message-ID: <cover.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212694

Please review this set of changes for scarthgap and have comments back by
end of day Friday, March 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1176

The following changes since commit cd2b6080a4c0f2ed2c9939ec0b87763aef595048:

  build-appliance-image: Update to scarthgap head revision (2025-03-10 12:32:35 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (1):
  openssh: fix CVE-2025-26465

Ashish Sharma (1):
  ruby: Fix CVE-2025-27219

Changqing Li (2):
  babeltrace: extend to nativesdk
  babeltrace2: extend to nativesdk

Divya Chellam (1):
  vim: Upgrade 9.1.1043 -> 9.1.1115

Niko Mauno (1):
  cve-check.bbclass: Mitigate symlink related error

Peter Marko (17):
  grub: drop obsolete CVE statuses
  grub: backport strlcpy function
  grup: patch CVE-2024-45781
  grub: patch CVE-2024-45782 and CVE-2024-56737
  grub: patch CVE-2024-45780
  grub: patch CVE-2024-45783
  grub: patch CVE-2025-0624
  grub: patch CVE-2024-45774
  grub: patch CVE-2024-45775
  grub: patch CVE-2025-0622
  grub: patch CVE-2024-45776
  grub: patch CVE-2024-45777
  grub: patch CVE-2025-0690
  grub: patch CVE-2025-1118
  grub: patch CVE-2024-45778 and CVE-2024-45779
  grub: patch CVE-2025-0677, CVE-2025-0684, CVE-2025-0685, CVE-2025-0686
    and CVE-2025-0689
  grub: patch CVE-2025-0678 and CVE-2025-1125

Ross Burton (3):
  puzzles: ignore three new CVEs for a different puzzles
  xserver-xf86-config: add a configuration fragment to disable screen
    blanking
  xserver-xf86-config: remove obsolete configuration files

Vijay Anusuri (1):
  xserver-xorg: upgrade 21.1.15 -> 21.1.16

Wang Mingyu (1):
  xserver-xorg: upgrade 21.1.14 -> 21.1.15

 meta/classes/cve-check.bbclass                |   6 +-
 .../0001-misc-Implement-grub_strlcpy.patch    |  68 ++++
 .../grub/files/CVE-2024-45774.patch           |  37 ++
 .../grub/files/CVE-2024-45775.patch           |  38 ++
 .../grub/files/CVE-2024-45776.patch           |  39 ++
 .../grub/files/CVE-2024-45777.patch           |  57 +++
 .../files/CVE-2024-45778_CVE-2024-45779.patch |  55 +++
 .../grub/files/CVE-2024-45780.patch           |  93 +++++
 .../grub/files/CVE-2024-45781.patch           |  35 ++
 .../files/CVE-2024-45782_CVE-2024-56737.patch |  36 ++
 .../grub/files/CVE-2024-45783.patch           |  39 ++
 .../grub/files/CVE-2025-0622-01.patch         |  35 ++
 .../grub/files/CVE-2025-0622-02.patch         |  41 ++
 .../grub/files/CVE-2025-0622-03.patch         |  38 ++
 .../grub/files/CVE-2025-0624.patch            |  84 ++++
 ...025-0685_CVE-2025-0686_CVE-2025-0689.patch | 377 ++++++++++++++++++
 .../files/CVE-2025-0678_CVE-2025-1125.patch   |  87 ++++
 .../grub/files/CVE-2025-0690.patch            |  73 ++++
 .../grub/files/CVE-2025-1118.patch            |  37 ++
 meta/recipes-bsp/grub/grub2.inc               |  21 +-
 .../openssh/openssh/CVE-2025-26465.patch      | 169 ++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 .../ruby/ruby/CVE-2025-27219.patch            |  31 ++
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |   1 +
 .../xserver-xf86-config/qemuall/noblank.conf  |   7 +
 .../xserver-xf86-config/qemuarm/xorg.conf     |  42 --
 .../xserver-xf86-config/qemuppc/xorg.conf     |  42 --
 .../xserver-xf86-config/qemush4/xorg.conf     |  42 --
 .../xserver-xf86-config/qemux86-64/xorg.conf  |  37 --
 .../xserver-xf86-config/qemux86/xorg.conf     |  37 --
 .../xorg-xserver/xserver-xf86-config_0.1.bb   |   6 +
 ...org_21.1.14.bb => xserver-xorg_21.1.16.bb} |   2 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.6.bb |  12 +
 .../recipes-kernel/lttng/babeltrace_1.5.11.bb |   2 +
 meta/recipes-sato/puzzles/puzzles_git.bb      |   3 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 36 files changed, 1526 insertions(+), 208 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.16.bb} (92%)

-- 
2.43.0


