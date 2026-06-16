Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA3CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:32:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1950.1781627539939362415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZQ9Rxg8l;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so40484615e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781627538; x=1782232338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Codj+BF4w86gD9A1jCuk1GLKyVj2JK4dfCVQt4inswY=;
        b=ZQ9Rxg8ltrf86DpU+ZsV10hnjIvKDk15arsvlnr7MDW5SY/U67mz+3LSoNC84CCgYL
         wl7SES4kM2xdiQLl2M1I0l+11UYSXefMNFRM5LpcUiLqGksQVB8ib9g3wqbhoDF+Rsgs
         R2AepWUJaSpYHacLdfSSwUKPbgbNZEpU8a2PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627538; x=1782232338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Codj+BF4w86gD9A1jCuk1GLKyVj2JK4dfCVQt4inswY=;
        b=cmGv6HxfmjJpcxNaMYIRcnZPe6FFf+BW3XdCtnQsqV7GACycSNaqLYARtgeH+RpIw+
         wH7KtNcMdxVpZ20Z7Km8+HCnI7gyKouXpBMnuqEBgOzPmOnYdu3yf/kqc6rnWXhDOHSN
         uM++zWear6bVTncO0UO3qdorUpbJC+GWUx3pi8/7TrpdKh8Y/3ome0nfDcBbYs44ucNP
         vnaCmgowRnAelT2xW/B89VM15mV9VayPgQraQ8lDmHFYJa+J9XoKxpm09sRm/5z4RZLE
         v0PUUkycbhXlydXsYeQy0mQXTQLMdu6t7Q0f+oKA0ia/Bwg6QoucvrGyjARI11vlJUOg
         Bo1Q==
X-Gm-Message-State: AOJu0YzNsaoM3uHwCQxzS5LX6rbQhb9y0G47IKtUDfYiOqVYsHUd3vWg
	GmUMispmaaiM3YKDRE1P+r8UVT6/w3YletrDSYWspRFD7BQLqvlup0mqO3VPFlsKRKZIX9JDnik
	sy/fE
X-Gm-Gg: Acq92OGUxAGb2Lbmw5QvelIbPaLILbSouKeic8n34QemE7Z2UkP5vnYoeoZjY4j8qo6
	uNx11e77lL7lee9LbrF2z9I+NjzGmioC3ZS0o8E8DAPNnlpGWlASS0WK5cNfqwfvJnC+PKMr8ix
	Kwb0SebgbWsEAh4Y+2BqNDhCzwNGXVFZIcfjs7CZoQ4XC8iHUjcbkqOxqIAe3F2HfJ93zdE7Pew
	/hD90wkC8NYpKBdJkDDeKCJwZmt2OYQna0X379kIpcOi5EF3NSj2ukYFhZt29b8B6GDiIY6K4Ld
	Q7Ew6+1OapsnWWhebd59psGfkKZklo6eG/tUacY5iZOmDtE8uOOVguGUzs2A2pGCfKVmdftT34M
	QsiBkTqg6xxc0lfUsqTekgiMdRri2PDyQ5yxKMPyNxlQ39PZ2TufeyPNnRZj2MWTwyOMZ0I5pS6
	47iTc+rpXYs9hGGYA2teUx/Lon55jt1klfyHOIprZfXVXqMXzFn6cq1kH8jHigRiy3AqrvfWE03
	jMComL0gs0jHbBddVMyGmdR2KXI
X-Received: by 2002:a05:600c:c08a:b0:490:acb8:1490 with SMTP id 5b1f17b1804b1-492333a1716mr4534035e9.4.1781627537981;
        Tue, 16 Jun 2026 09:32:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa3abd0sm102013985e9.1.2026.06.16.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:32:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/20] Pull request (cover letter only)
Date: Tue, 16 Jun 2026 18:32:05 +0200
Message-ID: <cover.1781627207.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238917

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1781270474.git.jeremy.rosen@smile.fr/
... with "nfs-utils: fix CVE-2025-12801" removed,
see https://lore.kernel.org/openembedded-core/8dd3e431cafdd364285eeaa79bf89507a4f4c6a1.camel@pbarker.dev/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4001
qemuarm64-ptest got impacted by 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
Succesfully rebuilt in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3824>

The following changes since commit e2864ea1ac022e43af92badc701fa1e2a9571f46:

  pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-06-05 11:02:52 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to dd74c1388d5bfefd2adcdb6abd622297138e2eb1:

  meta/lib/oe/package.py: fix path to kernel sources in save_debugsources_info (2026-06-15 11:54:08 +0200)

----------------------------------------------------------------

Enrico Jörns (1):
  devtool: prevent 'devtool modify -n' from corrupting kernel Git repos

Hugo SIMELIERE (Schneider Electric) (3):
  busybox: Fix CVE-2026-29004
  xz: Fix CVE-2026-34743
  util-linux: Fix CVE-2026-27456

João Marcos Costa (Schneider Electric) (1):
  meta/lib/oe/package.py: fix path to kernel sources in
    save_debugsources_info

Theo Gaige (Schneider Electric) (14):
  go: patch CVE-2026-27142
  go: patch CVE-2026-32280
  go: patch CVE-2026-32283
  go: patch CVE-2026-32289
  go: patch CVE-2026-33811
  go: patch CVE-2026-39817
  go: patch CVE-2026-39819
  go: patch CVE-2026-39820
  go: patch CVE-2026-39825
  go: patch CVE-2026-39826
  go: patch CVE-2026-42499
  go: patch CVE-2026-42501
  go: patch CVE-2026-42504
  go: patch CVE-2026-42507

Zahir Hussain (1):
  libpng: Fix CVE-2026-33416

 meta/classes/create-spdx-2.2.bbclass          |   2 +-
 meta/lib/oe/package.py                        |   4 +-
 .../busybox/busybox/CVE-2026-29004-01.patch   |  41 ++
 .../busybox/busybox/CVE-2026-29004-02.patch   |  46 +++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-27456.patch           | 115 ++++++
 meta/recipes-devtools/go/go-1.22.12.inc       |  14 +
 .../go/go/CVE-2026-27142.patch                | 386 ++++++++++++++++++
 .../go/go/CVE-2026-32280.patch                | 289 +++++++++++++
 .../go/go/CVE-2026-32283.patch                | 177 ++++++++
 .../go/go/CVE-2026-32289.patch                | 217 ++++++++++
 .../go/go/CVE-2026-33811.patch                |  46 +++
 .../go/go/CVE-2026-39817.patch                | 105 +++++
 .../go/go/CVE-2026-39819.patch                |  48 +++
 .../go/go/CVE-2026-39820.patch                | 112 +++++
 .../go/go/CVE-2026-39825.patch                | 104 +++++
 .../go/go/CVE-2026-39826.patch                |  65 +++
 .../go/go/CVE-2026-42499.patch                |  91 +++++
 .../go/go/CVE-2026-42501.patch                | 127 ++++++
 .../go/go/CVE-2026-42504.patch                |  58 +++
 .../go/go/CVE-2026-42507.patch                | 160 ++++++++
 .../xz/xz/CVE-2026-34743.patch                |  68 +++
 meta/recipes-extended/xz/xz_5.4.7.bb          |   1 +
 .../libpng/files/CVE-2026-33416-01.patch      | 143 +++++++
 .../libpng/files/CVE-2026-33416-02.patch      |  53 +++
 .../libpng/files/CVE-2026-33416-03.patch      | 163 ++++++++
 .../libpng/files/CVE-2026-33416-04.patch      |  53 +++
 .../libpng/libpng_1.6.42.bb                   |   4 +
 scripts/lib/devtool/standard.py               |   3 +-
 30 files changed, 2694 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27142.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32280.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32283.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32289.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33811.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39817.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39819.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39820.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39825.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39826.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42499.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42501.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42504.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42507.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2026-34743.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch


