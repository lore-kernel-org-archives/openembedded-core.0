Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B55C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.50462.1710953058309302232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hn3ZnVW8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso117629b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953057; x=1711557857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KnxYAnUC3vJ94RCwxoZzlVjjpVTmN4UM/wwPtE2bj2A=;
        b=hn3ZnVW884QQvjZZ7z9icRbz5uAw1erJO+giezv3GKOf31DqmHraNCDAIGYUT8fVPu
         dABnhjcjdhdZQUEaE4QHCfwSIIQvqlbb4fYhTsog/Gz1HrfAQYa90GjyRkp3Uo0rCXBb
         PL3NFvk+qh6T/76dWsI8JEnP4c1udXG0rro99WTWouSYlfYz/YmrieRAlW6QJBSAy9OX
         3T9y3vPw5bsZXVjoszwEjCWk8Kdq3DTCncpj1Te4p0xceDrqsv0AW2kCYCOKZ4TgPlgZ
         H1fCLUtAeInhGX3WQgQjC+DXDkPd0TW52vCUoG+oAP/yd+EEkSokQd51npKtgHRr7oBp
         BLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953057; x=1711557857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnxYAnUC3vJ94RCwxoZzlVjjpVTmN4UM/wwPtE2bj2A=;
        b=QMEXGMkUObwJ+1JJGh773QigM93ezkJ9TksAz2ipv6o0EnXYv6cX/Oq2QiMzH1kJp3
         Mry4dH9grX2Dl6RtcGUclY61Wpho61MPErz0NVuFL/AYTeCDqR6JayHQtud7z4fg+Vr1
         RQVtVuKHkdlmLlxOAtOC/pGlUhQtrp6bTZ/ImfDilT26L/Gn8Ynx9IigFcdSJpUiXIfa
         fGVrT6WcjXKxrtIdUzaDFO9iMRuR7vzzXV4g7s3a/o+d5p8/YB/Odpfa1W7M44r8tyCa
         4t0qPT4+bY/Eimxg8qoCjagrAeXMjlVeHIHxHLKqg4u+IY49t2X0jBJYzxCbqyY3bimO
         0WGg==
X-Gm-Message-State: AOJu0YwT255X7nebhU+ZqzV/uz/pDF6ykYgKcHPOnyOb+IeTm9n4g1Mf
	FwScfrtZBQz8+rsUSclZ5kvFcKcsOnq01pa9xz2pBWLYkfSHjJnTj1YF3rf2F7ozcVr+g430t/s
	RR7k=
X-Google-Smtp-Source: AGHT+IE18zSrlqo5UZqfe+VECEtKuXIR5fuwctcNZLfOgeZl+0iHQtON4wQEBMCmzpXkSD4FguUo7Q==
X-Received: by 2002:a05:6a20:6d92:b0:1a3:63ca:8fc7 with SMTP id gl18-20020a056a206d9200b001a363ca8fc7mr2227117pzb.18.1710953057384;
        Wed, 20 Mar 2024 09:44:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Wed, 20 Mar 2024 06:43:54 -1000
Message-Id: <cover.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197387

Please review this set of changes for dunfell and have comments back by
end of day Friday, March 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6692

The following changes since commit b49b0a3dd74c24f3a011c9c0b5cf8f6530956cfa:

  build-appliance-image: Update to dunfell head revision (2024-03-01 03:19:51 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alex Kiernan (1):
  wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23

Alexander Kanavin (1):
  linux-firmware: upgrade 20231211 -> 20240220

Alexander Sverdlin (1):
  linux-firmware: upgrade 20231030 -> 20231211

Michael Halstead (1):
  yocto-uninative: Update to 4.4 for glibc 2.39

Vijay Anusuri (1):
  libxml2: Backport fix for CVE-2024-25062

Wang Mingyu (1):
  wireless-regdb: upgrade 2023.05.03 -> 2023.09.01

Yoann Congal (6):
  cve-update-nvd2-native: Fix typo in comment
  cve-update-nvd2-native: Add an age threshold for incremental update
  cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
  cve-update-nvd2-native: nvd_request_next: Improve comment
  cve-update-nvd2-native: Fix CVE configuration update
  cve-update-nvd2-native: Remove rejected CVE from database

 meta/conf/distro/include/yocto-uninative.inc  | 10 ++---
 .../libxml/libxml2/CVE-2024-25062-pre1.patch  | 38 +++++++++++++++++++
 .../libxml/libxml2/CVE-2024-25062.patch       | 33 ++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 .../meta/cve-update-nvd2-native.bb            | 35 +++++++++++++----
 ...20231030.bb => linux-firmware_20240220.bb} |  7 ++--
 ....05.03.bb => wireless-regdb_2024.01.23.bb} |  4 +-
 7 files changed, 111 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062-pre1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20240220.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.05.03.bb => wireless-regdb_2024.01.23.bb} (88%)

-- 
2.34.1


