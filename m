Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14EFC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:58:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.11448.1741355930236996454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2P4Se8be;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22403cbb47fso35815915ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741355929; x=1741960729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k89bqW1xHOVFVWXdCteyh+/e9G+0wyGhy+TzdiEFWM4=;
        b=2P4Se8beUaH1UVGlFu+Gj7hC1yEM/MQgteB8Ucqyyq44hIEsnVVkZhUo0JwzVxHFko
         zyoZvPsQg5DS1+f+kirIsijQ086vg863nDW6pnyyy+JHcIwjcw/wpKXH3J2eNO4M/frf
         rnE02jZQIZB08eJBLT/poGRbl1IT7aGjcUVrDduVW3wRKo7PkvZy683yoNAOczX+tUWI
         d6OZjXXTGn4b/hCrGXel23qsUOCgWQXE13jId1SZmBcZEsj+xbp0/l7DqmwYm7HGGx4N
         rMYy6EhKGpSbDebF+myTfc0Qk5wNPAprDtdoJFyLSxXbPWo0hDaa7WhM49rwK+pHmP3z
         35IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355929; x=1741960729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k89bqW1xHOVFVWXdCteyh+/e9G+0wyGhy+TzdiEFWM4=;
        b=XBPMHfmkVwy80PiNXSdcF1LQAdK2hJInZyCIoxwb1AqkwJ8k0LGzjuVSV76MJz2WOo
         11tUBEgui4gXD7kD8UmYd7VlufrZ/u9EU9LhR1cInSaBywNpHjGuZVtgtU6npCkG478P
         rxB4TpdkpPwSmVqiaocE5kYnv+yHpJpSurSYMgC6RRoNX1ut3DBbz8o7k1ATHo1nfYYT
         4DiopBeWnO+2sd/WDWWNWF7T5ivwhCUuMDT/64n/w5mvGfYzzE0DJWaqaoNwxrgXvSBa
         YMLT+P9KHM53jr/gsctfHcJrM4+UUs8WR7OcxyyWrq3iuX7KlaeAZGUh4k27kjpU/ecN
         kbyQ==
X-Gm-Message-State: AOJu0Yz/y1JG9H3TMXpzkWywJ0ODw8zCHJBt7Dg7XXczRuZuLb7LTnAj
	jwTHBZ9Da1R+XMVGJrMDVuOurr7c3Rqefq628y4zaCwsfu7rQQpKC3zzE9eX5sK+Mhs+8Ddcn7/
	x
X-Gm-Gg: ASbGncvoY21HJ6eYucyOt9vk16doBCCnH+Cchk3ZL3NQjoRwHxPRFBR7Vh4krYHCzHh
	0YpACUK7UFGmSk5tggbFpWU3VnVfkqCSMPna/UkzJrbmMy0WbrYJJGRFMB99dTuRCnRjZA6hm8+
	5R1VFdhehZLU5vugqy5az93RYc8sflh8HP9TV7wco99VAF25P7IuDs4e0xbWz2wrHjv66tLr+sX
	zx5RtsaMk8QX6Ou3ncboQrFlRx3HQ1SDRv9DJ4OhHwcbq+kIfum5Rga6WQJzphAG5L9FhmkPjgQ
	4uJz3PILURgZtdn0tKF94OlCuFRTWoNvVo/l
X-Google-Smtp-Source: AGHT+IFxi6TRS5QNGqCe2HnJZP1iMm2/ZlkoNytArDOKFAEF76Mx7zHfUnBC7c2wEGm3tuZ0s5jkeA==
X-Received: by 2002:a05:6a20:1591:b0:1f3:484e:c55c with SMTP id adf61e73a8af0-1f544c99ea7mr6288069637.35.1741355929434;
        Fri, 07 Mar 2025 05:58:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369844cfeesm3230656b3a.77.2025.03.07.05.58.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:58:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 0/4] Patch review
Date: Fri,  7 Mar 2025 05:58:36 -0800
Message-ID: <cover.1741355808.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212438

Please review this set of changes for styhead and have comments back by
end of day Tuesday, March 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1138

The following changes since commit 35ffa0ed523ba95f069dff5b7df3f819ef031015:

  build-appliance-image: Update to styhead head revision (2025-02-21 14:06:37 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Alessio Cascone (1):
  tzcode-native: Fix compiler setting from 2023d version

Peter Marko (2):
  subversion: ignore CVE-2024-45720
  libxml2: upgrade 2.13.3 -> 2.13.6

Priyal Doshi (1):
  tzdata/tzcode-native: upgrade 2024b -> 2025a

 meta/recipes-core/libxml/libxml2/install-tests.patch        | 4 ++--
 .../libxml/{libxml2_2.13.3.bb => libxml2_2.13.6.bb}         | 2 +-
 meta/recipes-devtools/subversion/subversion_1.14.3.bb       | 2 ++
 meta/recipes-extended/timezone/timezone.inc                 | 6 +++---
 meta/recipes-extended/timezone/tzcode-native.bb             | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.3.bb => libxml2_2.13.6.bb} (97%)

-- 
2.43.0


