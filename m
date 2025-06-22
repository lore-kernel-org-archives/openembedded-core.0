Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7A3C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 13:37:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.26156.1750599464265700828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 06:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GzOMJgxN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1542818a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750599463; x=1751204263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBjzBaVfMCKSCESWaRDEBb5wYaabEorbqlzR+PUW0es=;
        b=GzOMJgxNS9QJYpAG65cXFN/7otrz+XJt4jp+LTIYH1bWxtcOb5yFuq3OZVdvR/NdHW
         1VGKTy/lztwi+QYxbA3Xwieskd6T/3QzpLgTwL5gNNatn+Te5C28rg82Qg5bR42jUjEn
         sEXeIyC25U8A8prTULWtpr2VRoMLGA0iXgo3FRyPTF7goUM1QPmmRFaiyVu1i2sBSIqC
         8amqdMyV59b64UByJZam9BANcolMK2VoQ28cmo/w7ppjHz+Gb7xn76G/8Scuag2vzOui
         BUGD+05sUUKTGIRnMohPK4U4K/pl/KhXDndFsXdgfESyLVrSui7xOvgBfM512IA52wbQ
         TFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599463; x=1751204263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBjzBaVfMCKSCESWaRDEBb5wYaabEorbqlzR+PUW0es=;
        b=P9gz0aYTLmJbm5yv3v5xDAG497cFDj94TG/FJj6tcI9SiQRrUhmUsvrReYJw1uDkXc
         bxfGk/JdwzSdQPoOz4QsjBZZuWym9qWBxqQmqXFyi/zDJ4wBctmVKtZoiWxmBrm47lCb
         qG396PMRyH7uXn7YEoXqBC0QogPTFJZhWBtaUx1fsPb7BomGgKVUlWR+3GFuW9Jvu3kf
         FgNP0Ox5SqTsW+hl7+onmMSs3U/sIeA8y+PO1pcGZ5xC5UdWPPQu8T87q1iSMmwZWd3e
         eLWHj8q/KKKAHpendBCox+roYARn8uBA/OLDBn3yOTtHtPHNGV4/s1O5cKidlf5xSQMZ
         Fc0g==
X-Gm-Message-State: AOJu0Yw81jfHpLXhRv9ZGnVMOrbATmTajP25Jmjves9WoFtw8boZv7at
	yPwryqbyk9uBSKIir353A53IUcO8GiPQDIOtiyckm0t6xBvD5F+9y7Nw7IvgPBsTU2OjTngf3fL
	sfcgSWG0=
X-Gm-Gg: ASbGncvJVForWqwjcrsxleVR5IJaPOtd1SgpAk9DeA4baRPCFrUH3+pe5bqwgVYRXbl
	ycbOyNkQnUwWv+izeAUBNlHaefc+WlWKmUgRqNEiitUx2b2YkLdbq+TSmEpC00Fru5NGpDztyOg
	mMmcmDkX+NwZPWZm6ny+tAfMk8w1F/rIYAmNFXF4UVB4LZIC9iWtiQZRGbThR13yozqzQyu6Y63
	FIWfVvEDYE5J1sm5sTT0kcchYRqlRCuzN/NfsSJ3HcjFPa0PwF3y22zscSQlKRwYP3nuevwLy2H
	tq62qtCG5CtM++ATLA80IxWXyNhvvTeL6zzNd0cFdqUzMx8Grb8hOw==
X-Google-Smtp-Source: AGHT+IFsOemGszq+7GjpnAHkk5qwuYmN36M5IWIGc9SIxttLid6muW8lvy614bbrgC3BK8FtrP+A0g==
X-Received: by 2002:a05:6a20:7d9e:b0:201:85f4:ade6 with SMTP id adf61e73a8af0-22026e92bddmr14022344637.27.1750599463300;
        Sun, 22 Jun 2025 06:37:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm5960189b3a.163.2025.06.22.06.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:37:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/4] Patch review
Date: Sun, 22 Jun 2025 06:37:28 -0700
Message-ID: <cover.1750599311.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 13:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219174

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, June 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1857

The following changes since commit db02a4cc542d0e7e563ec46c91bf9a7313a71d02:

  systemd: Rename systemd_v255.21 to systemd_255.21 (2025-06-16 09:46:24 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Chen Qi (1):
  coreutils: fix CVE-2025-5278

Moritz Haase (1):
  cmake: Correctly handle cost data of tests with arbitrary chars in
    name

Peter Marko (2):
  go: set status of CVE-2024-3566
  glibc: stable 2.39 branch updates

 .../coreutils/coreutils/CVE-2025-5278.patch   | 112 ++++++++++
 meta/recipes-core/coreutils/coreutils_9.4.bb  |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...y-the-header-between-arm-and-aarch64.patch |   1 +
 ...build-time-paths-in-the-output-binar.patch |   2 +-
 .../glibc/glibc/0023-qemu-stale-process.patch |   8 +-
 meta/recipes-core/glibc/glibc_2.39.bb         |   3 +-
 .../cmake/cmake-native_3.28.3.bb              |   2 +-
 ...trary-characters-in-test-names-of-CT.patch | 205 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |   1 +
 .../go/go-binary-native_1.22.12.bb            |   1 +
 meta/recipes-devtools/go/go-common.inc        |   1 +
 12 files changed, 331 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch

-- 
2.43.0


