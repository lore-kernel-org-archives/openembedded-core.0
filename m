Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182FCFC0364
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:13 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.756.1776959112331835850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iutEqZri;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d6ab4476eso66677571cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959111; x=1777563911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMnOf6SiHU5mf63fJdY/YoyVHDLkRli8TrBQ/GS/EPw=;
        b=iutEqZriUQgstRhE7IjMB01r5k74dmhFRzYFC/VvSWmmOFujpaCtWqUPEOIZNb1YNv
         vhFWwikyLnT3ov7w8I2tEt2F1+A6QYmtKw/QdV4Yr5rUITZY8hzA+iomJkq0bUShQtTB
         OtojcQcFQLcAM2keMWCNBx2FUuXnDlle8eXXtZ89mmYw3l5l4F4z5uJkpSMQ4bBivRSc
         LMhCG4yJGDiPVT9LiYOvKMZWCshy1nDTOWJjnUGVsjFO9vD/0tHa59jV4HJTjRYCxPR1
         lTx3aN/LhiRGNTVC3OONp7vNc9Oik3LGSLM/NsFyialMN2e6eK7HJenUlPRTb7b9QDUC
         kW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959111; x=1777563911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMnOf6SiHU5mf63fJdY/YoyVHDLkRli8TrBQ/GS/EPw=;
        b=cHvnw+vGEulBaU5V0br5qJ9JCjB9MRal78xqeFDJWAIAO+yhfMCxdVNWmrrC2H/HfA
         0CySwKuDgRtibmERUGTxwMRnvMDz89iFimPmzzRk4KJb6CprPkcbWkdxmauqYof7Y/c8
         4wJfjuc/76JcRx/fQd2OWZfHtD7zQVWwoYPkJj2rfzzwCOvu0u3WfOUg2tpCwKX7bJAb
         TVZxr9aMWW5katR4zQc8JAnWB5/+6Qjw+fBYw1qZo2GltPzps6DQqZFElY+BMgmAkeRM
         YIt3I1yoZ46kVgHrSrYJxprG9y7giXg43S//1yJlvw6v7BxZCioUeB9Bl5v/iX4CnXFF
         gp/Q==
X-Gm-Message-State: AOJu0Yx1IH6XPr+J9HJOtz4SuDkYM1AO141Za+O0WZmqZqG1bx7Hb9zD
	UV/BkE9DObqjsbeMjiwfvvhcLpYD//6/qedNgaYFO6wLyQvodr76QihfsauKTxhG
X-Gm-Gg: AeBDievigvykbvpCOVx973YU8m56sKBcdPvlziSsDR98UW5wmITAxtbPwIq3h0kFxEF
	ZAswgzVngCZbNk5PbIGSweSeqvKzLRU7mu21bPkmhr4WhNx9/Rcuk78CLomLIXZPunfeGgkKigd
	0mVWq8rbbW1qmuC0xWTyXOrJ9TcAmbjceT1F++rjjUS5fUnXyp6dKzSFjlRUIg9Vjnu7YoykPiR
	54BN/YoI7kk0g3gqgF0Dwzpcm624bYPhgPXb4Nhd2nV8U9FcN8O1omwda91HR4owdzpldj7eUEj
	FeMD2kaJJeTROjVG8gAmcBjIBsf8vFP01lKfANtoXDPL+IPIL27jXqD+wbAExa704rqhIPwd0kK
	l5BQoiawtKMY5s3qTE4mTd/qaf+DZ7pgMy8zMPtpOOzIIIDgsUyfywZKB5V0cst3dmNFF6LubDY
	eqaYhHhfanpAEgphUAWrC5wKX8T223lt9btNkMf8gmEc43Vts1qz2qZv5T6BitnfV6cRalwWLyU
	GPRhWlfBX3tZr3jd8dQeD2R+VEYsvPkkFd4yqMtJeH8cyKT8M79j2w1JZoFJHrwem3ivQ==
X-Received: by 2002:a05:622a:10e:b0:50d:2a76:43c5 with SMTP id d75a77b69052e-50e3681e01amr408302511cf.2.1776959111002;
        Thu, 23 Apr 2026 08:45:11 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [whinlatter][PATCH 0/18] linux-yocto: stable updates to 6.12
Date: Thu, 23 Apr 2026 11:44:51 -0400
Message-ID: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235800

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I know that whinlatter is about to go EOL, but here are the stable
updates I've been tracking for the kernel.

I'll continue to update 6.12 even after whinlatter is no longer
being udpated.

Bruce

openembedded-core (18):
  linux-yocto/6.12: update to v6.12.72
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.73
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.74
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.76
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.77
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.79
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.80
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.81
  linux-yocto/6.12: update CVE exclusions
  linux-yocto/6.12: update to v6.12.83
  linux-yocto/6.12: update CVE exclusions

 openembedded-core:
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc   | 1148 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      |   28 +++---
 4 files changed, 1127 insertions(+), 61 deletions(-)

-- 
2.43.0

