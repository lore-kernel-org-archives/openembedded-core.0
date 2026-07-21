Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD32C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 21:45:35 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34786.1784670330318416428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 14:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UF3n/XO6;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so786138f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784670328; x=1785275128; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/ETOWGqOcYL+Gd4JAW9ED9l6M6ngvx11iHcKk7ZcFo=;
        b=UF3n/XO6rmKySRtikP5uVDMCcflfIUYm7MzHjbSzKNhtzMlefZ1OzhXfnSRxqyiJmP
         PCil+2zQ4wui4xHBKkoL6ms1YvxApvcPE0X/eN1sYgX72aes7c5MsiT0PARd/DccTK9U
         v82nGKZ1oPi3CVifC03KPd8oWdc7JrC9HVg0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670328; x=1785275128;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/ETOWGqOcYL+Gd4JAW9ED9l6M6ngvx11iHcKk7ZcFo=;
        b=EUadUV0OW/7WvRpvDlXSRmV/R79abs9GY2celK/e1KgCQQVcLyfsGlIBqxfEmkisXE
         69ASWFtTryYu9ylFQ06R8kY9QgNkTsD2I1x8E2j9H/IYzr4n8mH2fFRaGqgjYXL8PlfH
         i+1eKgpjSSh3YEsF5k8jTf9s6h4Zb1WSrTBYfWhfTkWvNsSw6BOYAzdMkw8ur6L2CPhm
         JjGSbf9dRCdlwyBZNGthX7C2t+4CxXBdlVZylmWQbyDiX8B1dAY+KtsBA6hNH9CSi6Bw
         UJdxWTMeRQzQXWlYKD0IA8ujWyOX2RJYSvdTOSK6u4i9FsbfTppN2JYSjayfYu2eisKY
         0FNA==
X-Gm-Message-State: AOJu0YxkiK8GVPTVqMdw9awQxp0Ip/Vf6FOqJGW8OKPwgqk6D1zyldD0
	BpvecC3HdSIeuJbQT90IOj/39623l4oThNqQOdIJTxxFbwuuLjY+rXu/TOib7B/42RPVFIPYL01
	C1Qhpt+k=
X-Gm-Gg: AR+sD131dZa0nFKhIfMTHe4ZyycxH4Fm1mEtGgzJyDJO4x1H+4o6rP6XW98fCYWb8e5
	9iS7nSXXVyGWronFJoZWdhHxPD4vA9NiC5WWINHxA15Q/qOVmeEjOitKiiAtX+2WtNmxuq340WJ
	95BVpZlgCGoyS5KWVADRKoC8n/Ydh1SrbuoAPEwKty4sPNHKJbGncqvPWJiJAebZ0/wkuQrZOtu
	NQO6wYizgKSy9chTnnXz/7JuHJcLMLvOwjiRKa1CqCO7d2TL/IAIQBJtlCphPOYwXVBNq6u23vU
	dLQLufoB4NqY5LocWXA/8204eXmK2VCYz7amFJStV8vfmddYc/rQIE81DiYFuL1q2iGqRxbp7Jz
	Euz7e50OqHENXBBDFIS38dqwD79fJ7jGZegMmnJKfLClPZt/h8wertsraKKloaTPrkEIBP777ti
	LOcORRumppGo0M0bEHYvcbaVZeWMvqJMPk2tmd6UmSyePoN135uJnPTry6949lTDemU3Wm0RvEH
	/ytlg==
X-Received: by 2002:a05:6000:1867:b0:47d:f445:9490 with SMTP id ffacd0b85a97d-47f623456afmr26452806f8f.60.1784670328350;
        Tue, 21 Jul 2026 14:45:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm45326686f8f.17.2026.07.21.14.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:45:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/13] Pull request (cover letter only)
Date: Tue, 21 Jul 2026 23:45:06 +0200
Message-ID: <cover.1784669691.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 21:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241578

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
with the following modifications:
* Removed pending a test patch backported from master:
  *  oe-selftest: fitimage: Do not expect kernel property in DTBO config subnodes
  *  kernel-fit-image.bbclass: Do not include kernel property in DTBO config subnodes
  *  kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
  *  kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
* Update "u-boot: re-enable RISC-V compressed (c) ISA extension" to
  correct the "Fixes:" link.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4256
* oe-selftest-fedora failed with 16308 – AB-INT: selftest: xterm: Xt error: Can't open display: :1
  Retried https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4160
* qemuarm64-musl-ptest failed with 15814 – qemuarm64 musl ptest failures
  Retried https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/768

The following changes since commit 6f5681afb324aed2cba4e5b819ffc878f74a2bac:

  gnutls: fix CVE-2026-33846 (2026-07-16 20:54:12 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to b5a6cada82d7ffb362bda9081c354dcc0b6ee264:

  openssh: set status for CVE-2026-3497 (2026-07-20 17:24:44 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  wic: upgrade 0.3.0 -> 0.3.1

Deepak Rathore (1):
  util-linux: fix CVE-2026-13595

Gustavo Henrique Nihei (1):
  u-boot: re-enable RISC-V compressed (c) ISA extension

Jaipaul Cheernam (2):
  gzip: fix CVE-2026-41992
  bzip2: Fix CVE-2026-42250

Peter Marko (5):
  go: upgrade 1.26.4 -> 1.26.5
  vex: remove obsolete semicolon
  rootfs: move tasks using image_list_installed_packages to
    postuninstall
  flac: fix buildpaths with doxygen enabled
  flac: make documentation build deterministic

Sudhir Dumbhare (1):
  openssh: set status for CVE-2026-3497

Vijay Anusuri (1):
  tzdata/tzcode-native: upgrade 2026b -> 2026c

Yoann Congal (1):
  scripts/install-buildtools: Update to 6.0.2

 meta/classes-recipe/license_image.bbclass     |   2 +-
 meta/classes/vex.bbclass                      |   2 +-
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |   1 +
 .../openssh/openssh_10.3p1.bb                 |   1 +
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 148 ++++++++++++++++++
 .../go/{go-1.26.4.inc => go-1.26.5.inc}       |   2 +-
 ...e_1.26.4.bb => go-binary-native_1.26.5.bb} |   6 +-
 ..._1.26.4.bb => go-cross-canadian_1.26.5.bb} |   0
 ...{go-cross_1.26.4.bb => go-cross_1.26.5.bb} |   0
 ...osssdk_1.26.4.bb => go-crosssdk_1.26.5.bb} |   0
 ...runtime_1.26.4.bb => go-runtime_1.26.5.bb} |   0
 .../go/{go_1.26.4.bb => go_1.26.5.bb}         |   0
 .../bzip2/bzip2/CVE-2026-42250.patch          |  35 +++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   1 +
 .../gzip/gzip-1.14/CVE-2026-41992.patch       |  64 ++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 meta/recipes-multimedia/flac/flac_1.5.0.bb    |   5 +-
 .../wic/{wic_0.3.0.bb => wic_0.3.1.bb}        |   2 +-
 scripts/install-buildtools                    |   4 +-
 21 files changed, 267 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
 rename meta/recipes-devtools/go/{go-1.26.4.inc => go-1.26.5.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.4.bb => go-binary-native_1.26.5.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.4.bb => go-cross-canadian_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.4.bb => go-cross_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.4.bb => go-crosssdk_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.4.bb => go-runtime_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.4.bb => go_1.26.5.bb} (100%)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)


