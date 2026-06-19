Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818C2CD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:20:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38134.1781857224366056896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oUJs+8Xd;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso1874508f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781857222; x=1782462022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=14tvOKd2TkMkufoFV8k8I0FZjksi6dYzqOGXbg4O3Bc=;
        b=oUJs+8XdeDFG2tmck9XS1Za2LA1kYJHqc3eQ8jnCTzVUnsHp1TE1qSzQandYv5Ys9F
         G7Kf88bDbPuAUsSDFgJxMUwoG3CNibOXxjavEmFNBlrxeSFnGND7qBu7B6FVR78U2OxI
         NU9a6uLK3ymtq51koCkICqM9DAJyCwll4/jRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857222; x=1782462022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14tvOKd2TkMkufoFV8k8I0FZjksi6dYzqOGXbg4O3Bc=;
        b=XRYFlb3vB1hcnGsQsZxsZGca4oUsarjKvYNbl+Q7ZMVCW0JdGYyRtCQq6KpptEB508
         ST42oHoQR13G/ufBNIWUOZND4r7wNGAk/2dhhUHVnYVK3mcvV1YqBIQFF3IOX+KfPVrc
         XW5J+0O4jH4fU1GW8OZAgpxhK5HgONPM2MSFhZ+r9psuRoXkiylXnIj2RgHmTTg4zBpf
         14w0yoCiHRfGb7KstoZcpSld7OHwL57Q+rl8RUbe+yZ/dcYtx1awg1wK2VPFjAhsMMsg
         dh4jPYAM554bv+YQ5SetwR+KMSa/NQzpTQbVcQ9So7GyX9IbW6wv1KTbMQbw2lM9xmp9
         eEbg==
X-Gm-Message-State: AOJu0YwmUv1NLKWKov5Kl5MkOyO8yTeqXSUJCxtb/CJfome5dkDI9V1X
	u4T/PiYySg/dKsDkrnj0C64ZI38hQY3ZyAi/gzbUU/9neMAIJSctlwDkl+SA1exHg4CG8yrHjJU
	wcCPY
X-Gm-Gg: AfdE7cneuf7VgoIB/Wx/J1oJZ5ZQGWOo6AB7ZE2+O0C0O9oUAifuu1INmIEClBCJ8Ov
	AsVrRW7xEN71CBNMFPutAbM43RBJAaE0e3RcGltnHHWdgI3hDr5MVBqhItbyfD3KSn9BHtBrbJZ
	DEp2Bgoc0BIyic1PBNwmZ3N4cS/6KViEu2zTh7k7EudF0Cs3cRBXVWr6iSzfOEo3mNwaI2voY7Q
	lqiQl/Egho7CKl/wN2YcCwVjfkbbVw498lAmmJXY3VIOYyN+8xXD6fLtYOzTFWQk8r0Lw6Y4aeg
	Wkh6yezNcwtxv64v8zl/wZGkvBaFU8NDGxiZtncneeVqAtMHg/TgyVElgkvHUtfu6Wr1EzqAf7y
	c0Cn01qFfLUr37JtWGtX+dWSJkVLlf9/m7rKObd+904GUBkXSG7+P+4rOzdyeRUBhJz3zjoQfwC
	x+mte9KCtif70/5EYw2ztJh7o1VtcfyO2D0JfaeMZbGwCoOC2gytcU7tsWh26DpRYdGa6n9Q9hg
	/U8etgilfzo8ecq
X-Received: by 2002:a05:6000:220e:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-465076ca324mr5308949f8f.18.1781857222366;
        Fri, 19 Jun 2026 01:20:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a0546fsm5871846f8f.2.2026.06.19.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:20:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/17] Pull request (cover letter only)
Date: Fri, 19 Jun 2026 10:20:10 +0200
Message-ID: <cover.1781856596.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239135

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1781682189.git.yoann.congal@smile.fr/T/#t
but I removed the kernel upgrade which created warnings[0]. I sent a fix
for it[1].

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4033
reproducible looks broken on Ubuntu 26.04 (patches welcome!).
I retried it on a different worker:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4202

[0]: https://autobuilder.yoctoproject.org/valkyrie/?#/builders/60/builds/3943
[1]: https://lists.yoctoproject.org/g/linux-yocto/message/16752

The following changes since commit dd74c1388d5bfefd2adcdb6abd622297138e2eb1:

  meta/lib/oe/package.py: fix path to kernel sources in save_debugsources_info (2026-06-15 11:54:08 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to d4950d6df0867dcd5c380d83ac4d138ec968e698:

  python_setuptools_build_meta: clean the build directory in configure (2026-06-17 01:09:26 +0200)

----------------------------------------------------------------

Benjamin Robin (Schneider Electric) (2):
  avahi: Remove a reference to the rejected CVE-2021-36217
  meta: fix generation of kernel CONFIG_ in SPDX3

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
 27 files changed, 1552 insertions(+), 19 deletions(-)
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


