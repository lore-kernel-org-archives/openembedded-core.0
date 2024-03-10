Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F02C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:01:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.40393.1710086462001555830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ElZr9bU1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dcab44747bso23443165ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710086461; x=1710691261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sANT5tLoHkRsImbelNsXUPAN7e84FCYhyKWEIG0GVaw=;
        b=ElZr9bU18IUII5zV1DAGcbLIspqYR/eHSBJqTaZBewYzESXDvsaeluvDlF3uFU7XaG
         /EydIcRnq/9OkGzE2/A0qxcunhswR5jYAWvEeqzBf8osnsFM2W7dSg/dtA2nCXHtuw84
         yoRfYt2TuCX1qnjF1MgaEsogeuulL/m4VHs0IX4ifhGRpqEFxyqKnnxM1E3M4c+lYAjX
         Kx77iI7YGxabTQKFiyaxrlSI8i9EC3+kDNGreAKOUbJYnPXDdEEKQYS984CiWE2em8B9
         zf4ByJ8Be+r2IeviiDAhRZ12duKpk0sAtAEhT5auAPgACJFTlUR5yjmFsMCXwlU/jIiG
         fmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086461; x=1710691261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sANT5tLoHkRsImbelNsXUPAN7e84FCYhyKWEIG0GVaw=;
        b=uxBEngeYRAfr4Th+ycEH3WZ/GspUJYrKSSI23TVG93dOD+6ANH+0vLDTYuJIfVOhI0
         4eUMCIYhlvitUwaln5W7K3YmopvYp2fi8xulFlGCIxVwP4HVefyDR18Fv68MmJKRXlaj
         M0XlfscMv6GCdpGr1kcwy6zn104YeHNaf2v71B6NHCnEL+nrrR/12PhLu/3UWpaG7wH5
         nhw3E/P7FxOlLJbNh3xQvGVsRIUvKeeuD+qZFkQg6Oa2lQ1rTBqOifyvXF5vXTJxyL0P
         w+0rYoghFVTz1/jJeebn3SVGahpiSIZOPFLkbX0ASZ6HHRI/SWi+J9nIFFFpPsw/eYMK
         5J3Q==
X-Gm-Message-State: AOJu0Ywn0FDzLVNIoa/BdkrMNgaZ4EWuukSCID9ogJE/MNtaobzDGMnQ
	jQ0iQkYKntV/NIsDuX+JlkvuDeMIZjkICjHrzZvIBY46Qf2u1TWKn3JsW4QEu4WnUG1cpswp7o5
	oq+PmMw==
X-Google-Smtp-Source: AGHT+IGcFJF45BjTCuT9mvkJIvTRb2av9F0yNG2F18Z3pziNqn095wZwcn0uc5XkdjqwWM2wQLjU1w==
X-Received: by 2002:a17:902:ec86:b0:1dd:758f:2d24 with SMTP id x6-20020a170902ec8600b001dd758f2d24mr4394450plg.7.1710086460983;
        Sun, 10 Mar 2024 09:01:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902cf4900b001da105d6a83sm2836862plg.224.2024.03.10.09.01.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:01:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 0/5] Patch review
Date: Sun, 10 Mar 2024 06:00:49 -1000
Message-Id: <cover.1710086264.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196893

Please review this set of changes for nanbield and have comments back by
end of day Tuesday, March 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6663

The following changes since commit 82dd61aade02456621cd2958b2fbb56236062789:

  multilib_global.bbclass: fix parsing error with no kernel module split (2024-02-14 07:09:08 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Bruce Ashfield (2):
  linux-yocto/6.1: update to v6.1.78
  linux-yocto/6.1: update CVE exclusions

Dhairya Nagodra (1):
  glibc: Remove duplicate entry for CVE-2023-4527

Munehisa Kamata (1):
  kernel.bbclass: Set pkg-config variables for building modules

Tim Orling (1):
  vim: upgrade v9.0.2130 -> v9.0.2190

 meta/classes-recipe/kernel.bbclass            |  12 +-
 meta/recipes-core/glibc/glibc-version.inc     |   1 -
 .../linux/cve-exclusion_6.1.inc               | 104 ++++++++++++++++--
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 ++---
 meta/recipes-support/vim/vim.inc              |   4 +-
 7 files changed, 124 insertions(+), 37 deletions(-)

-- 
2.34.1


