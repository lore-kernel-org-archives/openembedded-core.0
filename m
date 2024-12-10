Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3443E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.3939.1733864197023785095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QZyHCUVA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7feb6871730so825121a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864196; x=1734468996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=voFCUPSrKrxK+4VBkgotBuk25dDvKQYBixh+qtuTlhA=;
        b=QZyHCUVAcnSmRur4pZcG3QA5yGy+TeaHsmSkzlBsqWDOa4vNzZdcpSmpZ31rMfVr5I
         BSfddH+L9Pu4O98EtNy9dq63lHfjKpasUuI72DufbMQYOxxvAvDoW9Q3Q3Kfx3ihtjJx
         GTF3j44PKZtDj4kMepO50xyHcrqOtbOX+odflQx040rFDw/YS1nn3IucoYXjTwp6kxdF
         qrrk51jfbdLhECHTPXtWKfYaXugOo726RPkeGuERx5MU168hYnS3mY1DqCrktBR+6q2V
         51LgpDtBdXqHpeslUgMg8VNVHqSKPMhbGf0o8LXS/o8e32WYIJfqHgFQ1MHd67E8allV
         TJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864196; x=1734468996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voFCUPSrKrxK+4VBkgotBuk25dDvKQYBixh+qtuTlhA=;
        b=HlImi8PAItPpuy8INrtqWaMvAqvS8/klONOx5kZ0RJP9DVuUmrZeIsDbXKOXG4npTv
         c17biT4vW76KxP/gIS6uwfSXBT5DkG77pC5Xp2i3RmGR0V2559g12x4FMlMsgTLOZZdW
         X270M0H2OVehKoAAJXB4/9SGDstOjckRlbEVxO0GAdkcW2SKI/cgXk5+ta4JAOutI07p
         fXH2sm/1ihqXPNbjx4tfWPgAgdo4c/PD4bXTf9I+WDyy74dfNBz2SYnl0HG5DSwujgzu
         4/VloKUchbIcPY80ePNuQtI5RT/Y2oJvUpicXQKPuDeywVKibyRWI1OO1PUFmL/LbjXz
         bbdw==
X-Gm-Message-State: AOJu0YzyDUcxq77z1e0Fpfripn3luzZZYogTpC50XcyvvNrxOaE1h05e
	wod2UGzuZYjOLZN3n7i/xdEyPCOx2AJ8AYwpiJjaNyLWT6gkBUiL4rlVp239oyKSCIPBv/1Zh8w
	E
X-Gm-Gg: ASbGncu9WL8hp+6bs++43KjAOCRr3KWURf8zz73r5eFZsXAwZ5XVyOmYe4Wxor4qw+u
	sLqAyGHt5xlWv9/VyeqRJnl6WE0kCOJTiWe5WZmshOq78OQpLiT2Bnrm7tuP0shyPIQoujbrT4/
	aETCz/xNFMA1RtNpH1hCu7MZUlrzqLFXyU1iBRQxSUagfefcxZPdVHvUcW9NhLjj8HH7Y0+VuS9
	5HBc1fn62lkBGGL6UN0LsmDqGfK+psbbgYteLs1NH4=
X-Google-Smtp-Source: AGHT+IHTZ9j50rswmfxTbav6YBmVqNkMaXvum+ZGCO+4gs+O/R1HfWNk6tUgSa3ur2TqB+cCII8jBA==
X-Received: by 2002:a17:90b:2b4d:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2f127fee811mr597191a91.22.1733864196051;
        Tue, 10 Dec 2024 12:56:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Tue, 10 Dec 2024 12:56:16 -0800
Message-Id: <cover.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208543

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, December 12

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/616

The following changes since commit 92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7:

  resulttool: Improve repo layout for oeselftest results (2024-12-04 06:02:55 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (5):
  ffmpeg: fix CVE-2023-49501
  ffmpeg: fix CVE-2024-28661
  ffmpeg: fix CVE-2023-50007
  ffmpeg: fix CVE-2023-49528
  ffmpeg: fix CVE-2024-7055

Divya Chellam (1):
  libpam: fix CVE-2024-10041

Guðni Már Gilbert (4):
  systemd: drop intltool-native from DEPENDS
  systemd-boot: drop intltool-native from DEPENDS
  python3-poetry-core: drop python3-six from RDEPENDS
  dnf: drop python3-iniparse from DEPENDS and RDEPENDS

Peter Marko (1):
  qemu: set CVE-2024-6505 to fixed

Ross Burton (1):
  sanity: check for working user namespaces

 meta/classes-global/sanity.bbclass            | 24 +++++
 .../systemd/systemd-boot_255.13.bb            |  2 +-
 meta/recipes-core/systemd/systemd_255.13.bb   |  2 +-
 meta/recipes-devtools/dnf/dnf_4.19.0.bb       |  3 +-
 .../python/python3-poetry-core_1.9.0.bb       |  1 -
 meta/recipes-devtools/qemu/qemu.inc           |  3 +
 .../pam/libpam/CVE-2024-10041.patch           | 98 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 .../ffmpeg/ffmpeg/CVE-2023-49501.patch        | 30 ++++++
 .../ffmpeg/ffmpeg/CVE-2023-49528.patch        | 58 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        | 78 +++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-28661.patch        | 37 +++++++
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 +++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  5 +
 14 files changed, 375 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch

-- 
2.34.1


