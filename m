Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B13C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.57555.1701299110380792061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fRkScX4h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ce28faa92dso3233525ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299109; x=1701903909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7K0EAwIAvlDinSYNteHfh+NkmiAyRP7RmcfnyTJYd8=;
        b=fRkScX4hwHMt6uU0MjpuT86V9kXtg/U4xDwfsT2h8gk84sy9NM+uX2Y5t7NyWO3Yko
         /dZR6vuw2rKOTF6WgpETLt8iJPelSoYB44afUwbkPedOa+NbFVsjAzt2sW433m4/7fQ5
         2xhpL/UiM1TZfq+OjLsRxT83F2nlHR7aUbTiIshoif8LkwahLtHA+lD8tIqgHamjIeWQ
         38GP8ugYHoNa1RMrVXYGCYHPmAuLtpG2xiKzR9YzuITcxgzl2+bjlGv6rjfR1iy+kK/p
         KNABZnmmGZuFgbkO7r03vEqdgeKrzMF0Dooh5fpxcAygDq6YRzORr8Fo2DbO8F0ffF8J
         a5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299109; x=1701903909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7K0EAwIAvlDinSYNteHfh+NkmiAyRP7RmcfnyTJYd8=;
        b=iXlO759lInDWsKJq6JnVXaO1vc0xkAlNaB73dvufvj0cCqSzuFNAd6PGWW3KKA8/15
         pD8ympMImJOLKX1/uPQy7NT1MZ0XsyVk/YvCFycYDRKt0/5gPJ+1kju4vAcmAvjyMdhT
         v9Qvypni3Wm9r+oqLp8YJqf3dL80VkxhYEdoJuJjtDbOI6ZrS4BU/fnOS06gAFQhpBy3
         JfueSDkDuyF0iN9cGEuu9gIk3qRxGCZ3FlbcFXikYxbhHY7/TGAl1iNXh1So9McihJhN
         2ROdbW1JpvWV7v8fAjoGIqK1J6o+hrc9UpvmxVWgO7bQq34zUf1I7hJFVHhbpQKq/uyJ
         tmEQ==
X-Gm-Message-State: AOJu0YycC6kgBP1ShfVtRUiuQm93hD+27FMP/qcTBDu4jCvPrH4NWYSl
	X+QLXwLNgcfoJpPj+XCpHstnUmbzzVR5/H1OkEUlgQ==
X-Google-Smtp-Source: AGHT+IFfbyKjKjSmj95EUukuSFh557jLLSDD/fwqVFa4/GZhM/RgscyFODr9rZfyjY5j83lGdfSMcA==
X-Received: by 2002:a17:902:ee82:b0:1c6:2ae1:dc28 with SMTP id a2-20020a170902ee8200b001c62ae1dc28mr20672815pld.36.1701299108897;
        Wed, 29 Nov 2023 15:05:08 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Wed, 29 Nov 2023 13:04:53 -1000
Message-Id: <cover.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191464

Please review this set of changes for kirkstone and have comments back by
end of day Friday, December 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6260

The following changes since commit 8726ae02d760270f9e7fe7ef5715d8f7553371ce:

  goarch: Move Go architecture mapping to a library (2023-11-21 05:32:39 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (2):
  gstreamer1.0-plugins-bad: fix CVE-2023-44429
  vim: Upgrade 9.0.2048 -> 9.0.2068

Hitendra Prajapati (1):
  grub: fix CVE-2023-4693

Li Wang (1):
  systemtap_git: fix used uninitialized error

Ninad Palsule (1):
  kernel-fitImage: Strip path component from dtb

Richard Purdie (1):
  vim: Improve locale handling

Steve Sakoman (1):
  vim: use upstream generated .po files

Vivek Kumbhar (1):
  openssl: fix CVE-2023-5678 Generating excessively long X9.42 DH keys
    or checking excessively long X9.42 DH keys or parameters may be very
    slow

 meta/classes/kernel-fitimage.bbclass          |   5 +
 .../grub/files/CVE-2023-4693.patch            |  62 ++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../openssl/openssl/CVE-2023-5678.patch       | 180 ++++++++++++++++++
 .../openssl/openssl_3.0.12.bb                 |   1 +
 ...x-Prevent-Werror-maybe-uninitialized.patch |  53 ++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |   1 +
 .../CVE-2023-44429.patch                      |  38 ++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |   1 +
 meta/recipes-support/vim/vim.inc              |  20 +-
 10 files changed, 350 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch

-- 
2.34.1


