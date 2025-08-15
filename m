Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C5CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:06 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.16480.1755276305979578912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FxN2O3JI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b471740e488so2053791a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276305; x=1755881105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7L3enAN7g0zok3EYqqPNfwDBatVUsUKUkqGOvF3GWA=;
        b=FxN2O3JIXvkN4jd1FlOkdzdq85YoDcj3w1n+02gXoq9OhuHaWBJfDy9JcXuaaD2uZj
         EDwdG/ZVO7VoGpt5RWiLJp/gIh1hQjUPExFYJ3OxCVJQY+pCi8SKWyVyGgDh38XmYu9r
         Kkdg7Bfu9wzqktz/JZ19W65NK8s520/BbBs3hXOukn1jiORiijfK81GFNaTIhoIVUBHC
         19El1BId/yTSBPZ8esUYOmtOxTeWU8tFKk7/fETGz9vSfggEboSuMKjuraJiERF6BGvm
         2Ok713iwUbsrmvGggbuTuggcdacGPKX4F8pnhI072/QQfgtAjqJoOsiWD3R6cFNtts7S
         tKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276305; x=1755881105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7L3enAN7g0zok3EYqqPNfwDBatVUsUKUkqGOvF3GWA=;
        b=vlGxBWT6N8wzrZjxgh7SA4hsDEwIbh36OemGQWAbDFYXgsQMVIHXisBn5qeZzHqKSX
         a/JJnVYjJ2eSKEk51NmlfCPH7XNplNOZrbqb+ecOpTB3wsDGh2FUYLVLX7Ez21Y/x2YB
         Ar1EUJaK4rLbUJTAgPtzRksvjwjoqZfu96Od94c1oA0SzhU4iqjbkNLRvExNe+v1pyY4
         3hA+3RKcJCAWU0D9Iyz5UqjgY0KrhzP7Ip+KY5wi5leJ6ID0Q4wZoHLD3Vq5a/P8zuEw
         HbXKcMquNsmtY5hsVOZaFXoW1jhRR2dH5COj/z4Km3EMQBBHx2/NhQNZa/WrzkthUH6R
         etrA==
X-Gm-Message-State: AOJu0YyVr0Nr4gTbH2Nn9benNisqXYuTeqCDpURO+tgwhKKgjuaJNo0B
	oi8cS6NE41yu+d5VS4qMPWxfGyi96MMzDS+n/DpUXeUoiTIk/+9/iQAKsJ94BVazV6hV4SttQxQ
	LAqJM
X-Gm-Gg: ASbGncudlrPOPQ+GLJ6vBsj6pceUg52EcmxUVpVqZ91kq/HGH93NG3SBNxsfHU/B956
	Ig/JEt9R5GbzL6BvTeUug7Rc2Mz/f9ck+WlSxOSVJnDH91NQnfpG7J1fJzdjTNZUqNT+OVyOEKb
	ldCYa5FKRwo6qzJ60uSjb4wPxRQQg2CZADyOVL4bsT+1zUKH41+Iu6Mtha+/L/CCdxuwJ1EtDfc
	oZskKzlujyIQQ0C76L063TAeEHDPsYNweEehAwTHpWu4T5zuvj5TZYWJoScGrBbeu7nFAAqvQRN
	Ln4M94UVvaNLigOi+ecbT19VcUe8YvNlqsYGnpSAqtsRYbTWqdT48WgYYRNX6nVPSmTYXAeyooY
	FMWWQEoLTMeFOKndJuqbPvZe8
X-Google-Smtp-Source: AGHT+IHWHSMejJhzXIUVPa3wNyEWmxbTcSjTdQvrdNvoT6cVkyKnoZIbCBApcQTQEj5ivItxCm5Lug==
X-Received: by 2002:a17:90b:4b10:b0:312:51a9:5d44 with SMTP id 98e67ed59e1d1-32341df8dfemr4011413a91.5.1755276305043;
        Fri, 15 Aug 2025 09:45:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/9] Patch review
Date: Fri, 15 Aug 2025 09:44:51 -0700
Message-ID: <cover.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221980

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, August 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2203

The following changes since commit f023779af6c0e5c838bdacbd6d9765d1c6740575:

  linux-libc-headers: Fix invalid conversion in cn_proc.h (2025-07-30 08:54:31 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Hitendra Prajapati (3):
  gstreamer1.0-plugins-base: fix CVE-2025-47808
  gstreamer1.0-plugins-base: fix CVE-2025-47806
  gstreamer1.0-plugins-good: fix multiple CVEs

Martin Jansa (1):
  libpam: re-add missing libgen include

Nikhil R (1):
  cmake: Add PACKAGECONFIG option for debugger support

Peter Marko (2):
  python3: patch CVE-2025-8194
  go: ignore CVE-2025-0913

Quentin Schulz (1):
  go-helloworld: fix license

Zhang Peng (1):
  avahi: fix CVE-2024-52615

 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52615.patch          | 228 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |   4 +-
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../python/python3/CVE-2025-8194.patch        | 219 +++++++++++++++++
 .../python/python3_3.12.11.bb                 |   9 +-
 .../go-examples/go-helloworld_0.1.bb          |   4 +-
 .../libpam/0002-pam-namespace-rebase.patch    |   4 +-
 .../CVE-2025-47806.patch                      |  50 ++++
 .../CVE-2025-47808.patch                      |  36 +++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |   2 +
 .../CVE-2025-47183-001.patch                  | 151 ++++++++++++
 .../CVE-2025-47183-002.patch                  |  80 ++++++
 .../CVE-2025-47219.patch                      |  40 +++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |   3 +
 15 files changed, 824 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch

-- 
2.43.0


