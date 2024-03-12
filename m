Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4E7C54E68
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:53:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.10083.1710251612548668374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1K7o/ZfV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dc29f1956cso26904995ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710251612; x=1710856412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7QjjsTc9RcsVa+QFTu3KdzccEQz8WR+Tz3QedCUB5I=;
        b=1K7o/ZfV1ik6WeDUPCJClzfi2B0ry+ML288QY0t2D4TGq9OOgRdY0tfkVYxs64WoXl
         VOERGjgLqHcZAhL/ib/2N15m7UEHiAlFqsAHQD8NuDEmrhkOVwBZ5JFr7fUpT58cwJ7V
         +O5uC4M2EEaXLuU9jR1hKhSvyqg4I8DPlxHK09RcGxfh6qd72nrQNDpLzjtC30a5RgP0
         QJqVeBc2Kar1aFYDjiK54mdhR992q+kEq65audUqqfQOUuRvKfzGrrWAXB8lYn1Opcyb
         +nO8lS2KlCT7G0/RA8uMHzqP+wsYsnYZEnZXN3W9NV5gFMEcuxwNq6TBNNNRBeUFWcFy
         wVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710251612; x=1710856412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7QjjsTc9RcsVa+QFTu3KdzccEQz8WR+Tz3QedCUB5I=;
        b=Uu/Ifl2ksX+Ce0tKVkysZi/C+GDdscg60cyt15F3vbIayhjlrRsDq3eiLWUOZ9dBhw
         c+nKXYn4djhPDxUjAzVe0b3GRybhxqCin3df74negR95FR5uZ/9od+/PmKLAkG5JAxY1
         hmc9K4msRLr8gNYI5WCG+S/N30p6NNjnJVmk8O8EV/mUrI98glpHDdU4dsFwbjV5QheY
         gR3wZYWECkLCkrt43DljL0F9GUhCe3UvfADcsTZUhn+aRY9W43ya0btx31uRiv4YfFgV
         6lEHQ460mjMGkfOcUNKgVwtbpDGSpH4AOWs/J/Fcnt02bWbUxyYk0yFIUIPiKSY0P+je
         cvbw==
X-Gm-Message-State: AOJu0YyrJwrZ764GT74hFNUtYWMLFDbzSm9YPc6Mnq6c4zGcW/AMzb87
	+Rp1WbhyVTrCOE6Yg6O90st/JFJrc/SV4eMldLDGDJiD8NpTTXEuvC96FB1n0cr1n6G7q+UM58B
	e9Vw=
X-Google-Smtp-Source: AGHT+IHMibzYlG5c1HdknQlmNZIgaUW/kQBs1/TRTcQBEN4vNnHfxH//HW3KUzYPaslyf1ZpcWYs/Q==
X-Received: by 2002:a17:903:124e:b0:1dd:7da:e0a9 with SMTP id u14-20020a170903124e00b001dd07dae0a9mr10291317plh.69.1710251611608;
        Tue, 12 Mar 2024 06:53:31 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001dc3916853csm6734776pli.73.2024.03.12.06.53.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:53:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Tue, 12 Mar 2024 03:53:15 -1000
Message-Id: <cover.1710251458.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196982

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, March 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6670

The following changes since commit e5aae8a371717215a7d78459788ad67dfaefe37e:

  golang: Fix CVE-2023-45289 & CVE-2023-45290 (2024-03-07 04:18:33 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (6):
  linux-yocto/5.15: update to v5.15.149
  linux-yocto/5.15: update CVE exclusions
  linux-yocto/5.10: update to v5.10.210
  linux-yocto/5.15: update to v5.15.150
  linux-yocto/5.15: update CVE exclusions (5.15.150)
  linux-yocto/5.15: fix partion scanning

Nikhil R (1):
  librsvg: Fix do_package_qa error for librsvg

Vivek Kumbhar (1):
  go: Backport fix CVE-2024-24784 & CVE-2024-24785

 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.18/CVE-2024-24784.patch           | 207 ++++++++++++++++++
 .../go/go-1.18/CVE-2024-24785.patch           | 196 +++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.52.10.bb |   2 +
 .../linux/cve-exclusion_5.15.inc              | 197 ++++++++++++++++-
 .../linux/linux-yocto-rt_5.10.bb              |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  22 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 11 files changed, 632 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2024-24784.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2024-24785.patch

-- 
2.34.1


