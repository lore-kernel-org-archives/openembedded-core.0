Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE50C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:26 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.6077.1705698862104414381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VYq9RrZs;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-42a029c8e62so6957361cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698861; x=1706303661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZFDYsPTgphAMK5RkEJGjotII4FXxMz7Mhxffp1n84k=;
        b=VYq9RrZs/SMGHKGFWrf0kF3wAObFUqyYfJ6rFRGor7K81lGxguuL0PPl45kY5Yo8bv
         GCyR5mTpqDyRSUCkxr8BiqTqvC8dccakmhuuGYzXzVAzknJGSmIXOa0OeVoQkAx65Go3
         MiaTbyulGqTqZpUYmJwQNPlaurimXK0EO+iNgoMVYjvmqHj+Xqi27ML2PN9/Ez0t5Xzd
         9rFYVLAAP4BefiXSc8hfIhZGKFhIya+EQPs0tYwjT2KsqGhTmILqUbYVuumjgmCv/YDb
         6EbbkHGncUyDzfFmZW9nByfheXnFFp09w3yV/EOaHa2B3CtJC2eoS3fPvSAflwAyeGfC
         n39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698861; x=1706303661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZFDYsPTgphAMK5RkEJGjotII4FXxMz7Mhxffp1n84k=;
        b=MLByn2v5ZdfdcqkaiHrh6wmHN7JvEdLT8c6fG7LFg+cwapfBtQyQMfQ6JCzwfxfe80
         CBrRCtwSpQj/f1DzemyS77rCV34sIhGsa/w1O5hO8cMMLTnolND3dd7CGIVIKdSkwcbE
         iCU33QKbObPuYtvPD2gWgHGKloEv05pdmD/ILOypAIZ6dPiRMKsc0yIKAh2FI28/DgKP
         N0RU0oiXtoD6MU4ZiCcvKB6m7TEkk5J8hOtWpCVJA2/UvsL8+lKj0Xl8Xc5ScNu1VluQ
         XbOBNmlg9YgxrBiOkv/eQiG1vt+nAao7G+gj2g5y5fEB1bMgoR57norgjR2zOcJYcIlG
         E/TQ==
X-Gm-Message-State: AOJu0YzRGFQGl1KZbXJAa8WSoYqhbXErM9K4KPevCfRCfiUkyzYur4Sp
	EOdk9s+klHFa+j5CezlM2Y/4IrP5uM/prDFoNzO8HomtrnMNqYyy
X-Google-Smtp-Source: AGHT+IHeVvKevGTnHzRogIukDWpopKoccGy0Java9nBL/YQf5BaEg7N+nLJmFauVlv03yXjfB9NMYg==
X-Received: by 2002:a05:6214:76a:b0:67f:356:5731 with SMTP id f10-20020a056214076a00b0067f03565731mr587549qvz.44.1705698861084;
        Fri, 19 Jan 2024 13:14:21 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11] linux-yocto: consolidated pull request
Date: Fri, 19 Jan 2024 16:14:08 -0500
Message-Id: <cover.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194066

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the colllected -stable updates for 6.6 and 6.1. This will probably be
the last round of 6.1 updates for master, since I'll drop it shortly in
preparation for the release. 6.1 will of course continue to be updated in
linux-yocto and in older releases.

I've also reenabled my CVE update script, if any of those commits don't look
right, feel free to toss them out.

Cheers,

Bruce

The following changes since commit 7af374c90c349af2c7ae9cf7d4fa14eeeb23b108:

  build-appliance-image: Update to master head revision (2024-01-19 12:22:58 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  linux-yocto/6.6: update to v6.6.11
  linux-yocto/6.6: update CVE exclusions
  linux-yocto/6.1: update to v6.1.72
  linux-yocto/6.1: update CVE exclusions
  linux-yocto/6.6: cfg: arm: introduce page size fragments
  linux-yocto/6.6: security/cfg: add configs to harden protection
  linux-yocto/6.1: security/cfg: add configs to harden protection
  linux-yocto/6.6: update to v6.6.12
  linux-yocto/6.6: update CVE exclusions
  linux-yocto/6.1: update to v6.1.73
  linux-yocto/6.1: update CVE exclusions

 .../linux/cve-exclusion_6.1.inc               | 34 +++++++++++++++----
 .../linux/cve-exclusion_6.6.inc               | 30 +++++++++++++---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++--------
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++--------
 8 files changed, 92 insertions(+), 52 deletions(-)

-- 
2.39.2


