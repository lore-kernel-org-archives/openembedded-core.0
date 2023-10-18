Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B095CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:47 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.285061.1697644117185585047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pNOUiouT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-27db9fdec0dso1780636a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644116; x=1698248916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOqHsKM5w1wIHM1Io4uNRqttkvD6MWZKRJvtZRKVi3E=;
        b=pNOUiouTHX7TcVLVwvYrcZ9GUXGTsgbURGUHXmWSF+w3q81zedJpziViys6fvg9Xy0
         doWtLQ9jH3LkIhL8v26r30XWTuKZTJ6MdGOovoSS9zKcagb9p9OiYJezUDuYS2T1krdi
         Uy/jC5r+zhhE5rqONhTWC5xDAZEcRBAHfZGRpTE4/3I/oQYpU9Z2Vz46iqMWNQeuzstk
         40e/EdNRgh8UxZpTF/zhcisZZNXYdewP4Zq/h5GKT3rca0wEXaNAZEyOU1p74ZB67geo
         gHQsq/zHkkmXlhD1aG0GMIv92xOxb2GfIyB7HvHd0JdDWBgkClMH1xbPw8K8JYWe+nA9
         DYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644116; x=1698248916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOqHsKM5w1wIHM1Io4uNRqttkvD6MWZKRJvtZRKVi3E=;
        b=CjkLeGM2+ngXl6QnYM4yeRCpT+TIwxfuxsXACwZvPqabt9hvR5hKxNqBwPT9nR160f
         JZDPUEwFrOSpFwA1hV8uUa3ANmW+sv6k7RdcZ7+mVi2HrDQUDTIinPC0YQhBx2pQ1KJ0
         O9i3aTJW6eQLx+ERzbplMs1GPql8Q7yxmXvB4aH8vUNUApXY5APRgb2vMnOseZZx2efF
         3j6lSxDNl4SUppSEmzHMTO4V4uufFagBOGYaxTd1MF3blgJr9n1A/s5ciDzb6WbTMi9R
         sH8JRKieSje3mDxaYQPhC7QHAzr3bra/LUGw4rcl0/dZ1SfiKYDx8lRbv+7xLXdALADI
         5EYw==
X-Gm-Message-State: AOJu0YxpCGJVoc8x7Ed0h7OHbYkqM0QKMZXLe7eUhBnVyfNy/iwk85KC
	s6uaZbzZcDAXUrIysi1EVarpD7M9BrnIMzUgKXs=
X-Google-Smtp-Source: AGHT+IG8yEIcEfJkX5eYiGeho8E4QKs9oI18UEsvpiaxrv9v9J5bdxIkuXG5wyHs7Hpn1mlGnRiZ1A==
X-Received: by 2002:a17:90a:e397:b0:27d:51c4:1679 with SMTP id b23-20020a17090ae39700b0027d51c41679mr5304192pjz.27.1697644116100;
        Wed, 18 Oct 2023 08:48:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Wed, 18 Oct 2023 05:48:19 -1000
Message-Id: <cover.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189399

Please review this set of changes for kirkstone and have comments back by
end of day Friday, October 20

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6064

with the exception of a known vim reproducibilty error in the vim-common
package where depending on worker we are seeing either:

"Content-Type:·text/plain;·charset=CP1251\n"

or

"Content-Type:·text/plain;·charset=cp1251\n"

The issue is still under investigation, but is unrelated to this patch set.


The following changes since commit 2572b32e729831762790ebfbf930a1140657faea:

  apt: add missing <cstdint> for uint16_t (2023-10-13 05:32:41 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Armin Kuster (1):
  binutils: CVE-2022-48063

Chaitanya Vadrevu (3):
  binutils: Fix CVE-2022-47695
  binutils: Mark CVE-2022-47673 as patched
  binutils: Mark CVE-2022-47696 as patched

Deepthi Hemraj (2):
  binutils: Fix CVE-2022-47008
  binutils: Fix CVE-2022-47011

Hitendra Prajapati (1):
  libtiff: Add fix for tiffcrop CVE-2023-1916

Quentin Schulz (1):
  uboot-extlinux-config.bbclass: fix missed override syntax migration

Siddharth Doshi (2):
  tiff: Security fix for CVE-2023-40745
  libxpm: upgrade to 3.5.17

 meta/classes/uboot-extlinux-config.bbclass    |  2 +-
 .../binutils/binutils-2.38.inc                |  4 +
 .../binutils/0022-CVE-2023-25584-3.patch      |  2 +
 .../binutils/0025-CVE-2023-25588.patch        |  2 +
 .../binutils/0027-CVE-2022-47008.patch        | 67 +++++++++++++
 .../binutils/0028-CVE-2022-47011.patch        | 35 +++++++
 .../binutils/0031-CVE-2022-47695.patch        | 58 +++++++++++
 .../binutils/binutils/CVE-2022-48063.patch    | 48 +++++++++
 .../{libxpm_3.5.16.bb => libxpm_3.5.17.bb}    |  2 +-
 .../libtiff/tiff/CVE-2023-1916.patch          | 99 +++++++++++++++++++
 .../libtiff/tiff/CVE-2023-40745.patch         | 34 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  2 +
 12 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb} (88%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-1916.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-40745.patch

-- 
2.34.1


