Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE15DCD98ED
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10384.1781682326140759818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zRETFTLz;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso2920170f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682324; x=1782287124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lOHnoxV9331zKo63PAzKAt6ES/3fm9uLN3CEtoSGkQk=;
        b=zRETFTLz5NHXZH84GQhKk8PyMMkLrEXybYLVDc5L7hVksAF5Xcy0Q+ThNWu5oaFTxC
         JRDUexJxjSvtc3pyZGbdstnKCpmKlk2Y/QPfT8Hw6uPPP+627T9hou4efG1EewwiNpo7
         +3Pr3yBgf70qOfyxCL+Q7Kz0OoeuCVbodm3ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682324; x=1782287124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOHnoxV9331zKo63PAzKAt6ES/3fm9uLN3CEtoSGkQk=;
        b=anzc11fEwK9VtKghnxNiEBnnlhFWXDO7lY8IBP4bcqLP5D5oXmQkjMj/F4SJkrrIcE
         /+dp17GJYgTJSaqYfJazDh4cWxBSVzXN8JGkCKe/mrY7yCNewjwzEQg9QBgFB69DQsef
         m/PQw+uXQ3UXhXOCjGvZCAD2rrGklpulkAss7fv92ByAb1fb37LvexBkuiZ1zxSwfuHN
         8D8aGYUJ+zGZmyPDUF+YPq31srkymiOSFTMivShve2JwDEcYKxYs7LQFZc0zJetcIor7
         3MTuEuXntxb+nZn5Sqz2g7LlnXwuS02uhuABCZ7TeCSx8OwwjQs/Qcqb8pcScHMWV4pi
         q0iw==
X-Gm-Message-State: AOJu0YzJWMTUfaqP6FRMXRnG3Rces+opQVVtrGwim24wqM9m2cRIjdXg
	EJ/PHFJl+wj392yGRkhz/kgmqF9vWRUfep4Ym5O5pyyFSWxCmVQjEL8PNnzQyWkSDaOHmn+5bxo
	SNKGN
X-Gm-Gg: AfdE7cmUhF6VpRfxaYiWcYPiBgJack3GFBEAvJ09n592EQ6eUNawi8fTrDTyuSkIKgh
	AcGvujR8Y9Rt9HnbphR+Gb1lFpZxjkeJpY8O7Ofc7eXLMC09O65cwGRb6REDVrSyuES1w2gsPn3
	ttWeVseAxkTmG4vl8Viv8a/MuOsEGQIU44GZyQ+6Zw9IEvZ2uZ14zouT49zVsGQGPR8Jz4h8pvo
	dtG0aFHmJud577OGkWpMsChtWjB1WT6LaE11tEks0ZqldaPAQWPaVdgtyzK9YXcoMpw2t4Nj5X3
	dKbxoHnCmBN/ofqUd1IKWMdNdY5xgavuO1iDcqDRhvu71xAIgzgA9arW/t1sI4dqWf56xJr645k
	NzoU8zmeWm48nC8H231o/V19e/2gbmITi4fzFYetQ3URwuV8k6dKE5bQw2AHh4b1gK4lVMTYF1p
	rh6cftBIaHbrEkUjYT9PG/JV4Apk2uTXafy5v69JACclrHQN1fvhVhQQx2abEaF430btp4p6LL6
	nBnrBFfZNaJ96OKDg==
X-Received: by 2002:a5d:588d:0:b0:45e:d3aa:e45f with SMTP id ffacd0b85a97d-462416a2b3bmr4156794f8f.28.1781682323523;
        Wed, 17 Jun 2026 00:45:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/30] Patch review
Date: Wed, 17 Jun 2026 09:44:35 +0200
Message-ID: <cover.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238982

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, June 18.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4014

The following changes since commit dd74c1388d5bfefd2adcdb6abd622297138e2eb1:

  meta/lib/oe/package.py: fix path to kernel sources in save_debugsources_info (2026-06-15 11:54:08 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to 7d74e588802d87a07b14c1541651ad5ce8860a8f:

  lttng-modules: Fix trace_hrtimer_start build failure (2026-06-17 01:28:31 +0200)

----------------------------------------------------------------

Benjamin Robin (Schneider Electric) (2):
  avahi: Remove a reference to the rejected CVE-2021-36217
  meta: fix generation of kernel CONFIG_ in SPDX3

Bruce Ashfield (12):
  oeqa/runtime/parselogs: update pci BAR ignore for kernel 6.10
  linux-yocto/6.6: update to v6.6.129
  linux-yocto/6.6: update to v6.6.130
  linux-yocto/6.6: update to v6.6.132
  linux-yocto/6.6: update to v6.6.134
  linux-yocto/6.6: update to v6.6.135
  linux-yocto/6.6: update to v6.6.136
  linux-yocto/6.6: update to v6.6.137
  linux-yocto/6.6: update to v6.6.138
  linux-yocto/6.6: update to v6.6.140
  linux-yocto/6.6: update to v6.6.141
  linux-yocto/6.6: update to v6.6.142

He Zhe (1):
  lttng-modules: Fix trace_hrtimer_start build failure

Hitendra Prajapati (6):
  go 1.22.12: fix CVE-2026-27140
  go 1.22.12: fix CVE-2026-27143, CVE-2026-27144
  qemu: fix for CVE-2025-11234
  libxml-parser-perl: fix for CVE-2006-10003
  python3: fix for CVE-2026-1502
  python3: fix CVE-2026-6100

Prabhudasu Vatala (1):
  conf/machine: fix typos in ARM and x86 README files

Ross Burton (3):
  setuptools3_legacy: ensure ${B} is clean
  setuptools3: clean the build directory in configure
  python_setuptools_build_meta: clean the build directory in configure

Vijay Anusuri (5):
  xserver-xorg: Fix CVE-2026-33999
  xserver-xorg: Fix CVE-2026-34000
  xserver-xorg: Fix CVE-2026-34001
  xserver-xorg: Fix CVE-2026-34002
  xserver-xorg: Fix CVE-2026-34003

 meta/classes-recipe/kernel.bbclass            |  27 ++-
 .../python_setuptools_build_meta.bbclass      |   4 +
 meta/classes-recipe/setuptools3.bbclass       |   3 +
 .../classes-recipe/setuptools3_legacy.bbclass |   1 +
 meta/conf/machine/include/arm/README          |   6 +-
 meta/conf/machine/include/x86/README          |   4 +-
 .../cases/parselogs-ignores-qemuall.txt       |   8 +
 meta/lib/oeqa/selftest/cases/spdx.py          |   2 +-
 .../avahi/files/local-ping.patch              |   1 -
 meta/recipes-devtools/go/go-1.22.12.inc       |   3 +
 .../go/go/CVE-2026-27140.patch                |  58 +++++
 .../go/go/CVE-2026-27143.patch                | 165 +++++++++++++
 .../go/go/CVE-2026-27144.patch                | 125 ++++++++++
 .../libxml-parser-perl/CVE-2006-10003.patch   |  73 ++++++
 .../perl/libxml-parser-perl_2.47.bb           |   1 +
 .../python/python3/CVE-2026-1502.patch        | 113 +++++++++
 .../python/python3/CVE-2026-6100.patch        |  75 ++++++
 .../python/python3_3.12.13.bb                 |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++
 .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++
 .../xserver-xorg/CVE-2026-33999.patch         |  49 ++++
 .../xserver-xorg/CVE-2026-34000.patch         |  72 ++++++
 .../xserver-xorg/CVE-2026-34001.patch         | 104 ++++++++
 .../xserver-xorg/CVE-2026-34002.patch         |  93 ++++++++
 .../xserver-xorg/CVE-2026-34003-1.patch       | 113 +++++++++
 .../xserver-xorg/CVE-2026-34003-2.patch       | 223 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |   6 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +--
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ++++++++
 .../lttng/lttng-modules_2.13.12.bb            |   6 +-
 33 files changed, 1687 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27140.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27143.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27144.patch
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-2.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch


