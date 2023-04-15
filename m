Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2265C77B71
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:33:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.10542.1681572833134323504
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=A3FN3uSv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id p17so10083965pla.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572832; x=1684164832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBXX0TYTRsO1hUSFzXyzAzRQI6PAtig+VGoum20PR2U=;
        b=A3FN3uSv4CtWwTzhDKbOrUx6gEr/nYlKtwerCvyqpsmKS6Rvb/S1BQSH51QvQWIlkh
         MdKX/+fojv4sI8OTfEddk/J5lZCglCXQTeM+QN1d+aLwnWZ3j/3L9pobnsElifvx3MK2
         nS8drRvtAvwur/JTb7yRkM7h05edIhEAeWxXnKBovg4cSxYDwpTxmG1dLLsGQcNU2cFv
         Y3NdWUtUULEkUepViitCA/9h8fteq0LZhKiNowG7qApIUekcqTY9HoZaRcjeCQGOSnOA
         OC8WBBSw6x6Za2kr+wnC8GiQbRJrFuI9t6MGDKv81QOVW4p9addDoIdCulkfqqnKHJjE
         +7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572832; x=1684164832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBXX0TYTRsO1hUSFzXyzAzRQI6PAtig+VGoum20PR2U=;
        b=QJZwJ4LJyptkzhwLbWfpwqeA3SqQ5oTvmhCBaV+4A1KiXC60XG0J2uwJkrUPfHUMen
         TCZAcPxB9ekqWJqa85iCzdbrk6WeUe1cb6anwqiYhyAtWM7w8uhAUZhm79NErQs344xz
         bwsFTNRXy7Hf44w9za522fuAkF/nzIGjomt6RKny2UN5cGEignx3Tn3MdVl8ut6Ac4Wg
         Aw5PjEXyJlfpP90zQclrkqLoG2hE5tgMAbA6k0/3bijIjv12M0qJsrbaNS2pCo/5SEW7
         zTJmSvpezf4qg2knftdFoOZgKj790/nBdOAcYics3RmmSWp/sWd0VKjmCjQW9JFW2lcD
         mSzw==
X-Gm-Message-State: AAQBX9daSlr8xAXCNTfSHak+vCeBMZiN6v8ccW7lAxVgAmvEv0wlLfSn
	+Jjgk2lqh6U6jkyTtcJTN6vx9solLjb3Nc8xwc0=
X-Google-Smtp-Source: AKy350Yr2aeoPymX1opE/Zz7y7jLmI5U5JRL3/nGI9WVxq+WbbodU0jkOM4rxSGKvFbJgbabk9P9WQ==
X-Received: by 2002:a17:90a:6c42:b0:246:ee10:cb5d with SMTP id x60-20020a17090a6c4200b00246ee10cb5dmr10185161pjj.14.1681572832160;
        Sat, 15 Apr 2023 08:33:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cs19-20020a17090af51300b002367325203fsm6313969pjb.50.2023.04.15.08.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:33:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/4] Patch review
Date: Sat, 15 Apr 2023 05:33:35 -1000
Message-Id: <cover.1681572706.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180018

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5184

The following changes since commit 4045bf02bbc6e87a05ba689a63c675e49c940772:

  bmap-tools: switch to main branch (2023-04-03 07:16:26 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bhabu Bindu (1):
  ffmpeg: fix for CVE-2022-3341

Gaurav Gupta (1):
  qemu: fix build error introduced by CVE-2021-3929 fix

Hitendra Prajapati (2):
  ruby: CVE-2023-28756 ReDoS vulnerability in Time
  curl: CVE-2023-27534 SFTP path ~ resolving discrepancy

 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3929.patch             |  33 ++--
 .../hw-block-nvme-handle-dma-errors.patch     | 146 ++++++++++++++++++
 ...w-block-nvme-refactor-nvme_addr_read.patch |  55 +++++++
 .../ruby/ruby/CVE-2023-28756.patch            |  61 ++++++++
 meta/recipes-devtools/ruby/ruby_2.7.6.bb      |   1 +
 .../ffmpeg/ffmpeg/CVE-2022-3341.patch         |  67 ++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 .../curl/curl/CVE-2023-27534.patch            | 123 +++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 10 files changed, 475 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3341.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch

-- 
2.34.1


