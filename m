Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB3DE7F132
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.3610.1695764606985322923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SxjDUXwD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5789ffc8ae0so6484716a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764605; x=1696369405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1/OI8rY7YFoZAWeIpC+EWz8HAN+tEcGcSkR2uQpUFSY=;
        b=SxjDUXwDqx7GXfhUHQ3CGbej59NLGYwqd9bx0WO4xJ1GZpx+CrVlahkxM5M/6Gq9iF
         g/81bJo9XfIR3KI76Mn4l0xQH/ZFb9YpI5DuLdW6a3iZO+hPDVqPthOMn2nn/Vd+WfXb
         7KtzXpFuyNAua5jIuh6/js7giHnAkkmB9SJaMbKXy0OJbOM56PV9T7F0/S0zpOVqR5fj
         8uZL+cp8I6wYTunbysM79lhShQhh2ib88Xda8Bs8yP5EXsU2ktAKNHDUKJnvMy8pItHF
         9x5Y3R6CaWSiVwKKRRaoP1TWWslWgvUy89IOOtIof3kzFO4kCvObMnVPgZtVftaFDZU4
         VZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764605; x=1696369405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/OI8rY7YFoZAWeIpC+EWz8HAN+tEcGcSkR2uQpUFSY=;
        b=g88ivpPMWyJuk5zr2Ts2ae3hwKcHXClvguwVZPCpI4cMM16esTDP1hM1l7o/ofspjB
         2yU+hYkben9q6KQ8NjfQjqlctkGRj8EZ/2Aru3SiOKnf+Qsryd7JXYaE5j8pddfiaN3p
         B9ZnTyt9R/+kKJhlTXLm078BKGm2akn7mn+SQEukVu9Hq0q+msDe1WOgSwlqKrnn86ae
         Twj+2O3DGJ5UtCMRsTxuKZWT/UiFud2t6T50PwyTMangt3a9qUV09yVKaXBKTZV56JJS
         DgIjohlcYpVOaLXr1pKuW0ZIgtWdT5ivJFDwHJfoiryDPdS3XMh6/bfuc13LnjGK3yOx
         Drig==
X-Gm-Message-State: AOJu0YwH+6v6cj5yCqJ0iyoXH0llJTmtGNRKU8ANBaEeKXwsY6Kn7LGS
	nyfIceHrC1t17T7CKELzU8+AjRs5Fu0T9I3zH6Y=
X-Google-Smtp-Source: AGHT+IFTyYvt5bu7l1VwzGOCdzk5K+t3MpL5INvkm8tbXHMja+YUj8I/fe5pOR+JiDP8RPDUEBfyvQ==
X-Received: by 2002:a05:6a21:33a6:b0:15d:4a2b:b50c with SMTP id yy38-20020a056a2133a600b0015d4a2bb50cmr131212pzb.56.1695764605550;
        Tue, 26 Sep 2023 14:43:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/10] Patch review
Date: Tue, 26 Sep 2023 11:43:09 -1000
Message-Id: <cover.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188268

Please review this set of changes for mickledore and have comments back by
end of day Thursday, September 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5950

The following changes since commit 72d3ecb22fea59d2520997b3f0a0651557d69ae7:

  cmake.bbclass: fix allarch override syntax (2023-09-18 04:52:03 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Chen Qi (2):
  multilib.conf: explicitly make MULTILIB_VARIANTS vardeps on MULTILIBS
  gcc-crosssdk: ignore MULTILIB_VARIANTS in signature computation

Jaeyoon Jung (1):
  cml1: Fix KCONFIG_CONFIG_COMMAND not conveyed fully in do_menuconfig

Lee Chee Yang (2):
  bind: update to 9.18.19
  ffmpeg: 5.1.2 -> 5.1.3

Narpat Mali (1):
  python3-git: upgrade 3.1.32 -> 3.1.37

Ross Burton (1):
  linux-yocto: update CVE exclusions

Sanjay Chitroda (1):
  curl: Add CVE-2023-28320 follow-up fix

Wang Mingyu (1):
  bind: upgrade 9.18.17 -> 9.18.18

Yash Shinde (1):
  glibc: fix CVE-2023-4527

 meta/classes-recipe/cml1.bbclass              |   2 +-
 meta/conf/multilib.conf                       |   1 +
 .../bind/{bind_9.18.17.bb => bind_9.18.19.bb} |   2 +-
 .../glibc/glibc/0023-CVE-2023-4527.patch      | 219 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 meta/recipes-devtools/gcc/gcc-crosssdk.inc    |   2 +
 ...n3-git_3.1.32.bb => python3-git_3.1.37.bb} |   4 +-
 .../linux/cve-exclusion_6.1.inc               | 157 ++++++++++---
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 -------
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ---------
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 ---
 .../{ffmpeg_5.1.2.bb => ffmpeg_5.1.3.bb}      |   5 +-
 .../curl/curl/CVE-2023-28320-fol1.patch       |  80 +++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 14 files changed, 432 insertions(+), 273 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.19.bb} (97%)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
 rename meta/recipes-devtools/python/{python3-git_3.1.32.bb => python3-git_3.1.37.bb} (86%)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.2.bb => ffmpeg_5.1.3.bb} (96%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch

-- 
2.34.1


