Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59706C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:40:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.67766.1710175230494506548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BUzC8Cn1;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6098b9ed2a3so42210577b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175230; x=1710780030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXwyr1hbZmCSEEXQtV3d5QDdKG9HyTd9IbxKExOs9d0=;
        b=BUzC8Cn1Ti/Y8ngtdiBf3Y8vTX5LvvEyEhaQkes6VIeBa7JDTXlhIp8CgLFkjsC/9t
         FQugt9hQVqqa3Y2eTDrlYqJeoQRBlbEMbKb5Lg/WjrEQqEPux7z6z6b0CtnRIdaRObc0
         Sg9DA2XHEnDovBeqAu0oBMe7Ka40crcVljiHbuVKWWFTU2oTVjTQ3JKX9y/07Rl+8dVJ
         Hu3M0dXXMJiG0vdntgk7WzB78WSFxQ1WEhCTu1vM+Yt6uimTQEwO97MauEcYG7Pr3csl
         G3irvY8aLVO3RNADQ/ehbGJVnoM1anT+9AWyOeRGxvXnzzgOinbkpIqpG8a4ABcIM9GZ
         OsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175230; x=1710780030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXwyr1hbZmCSEEXQtV3d5QDdKG9HyTd9IbxKExOs9d0=;
        b=s3lHVZwWf3iovUByPmIa1UAxhvcQMatoFANozBgD1VelH0m6f2llXy2yv6kxvqSkjW
         yC/GJU4u2XglMdJaHqo6677prrj2hLZBVrmx3fw79ogPdkPyk3OChAleQHZ4pkKIqsnm
         6RE3rSBmDbVPQvAKWo9C4PLNU5/zUWPsqsyfcl+i6PsAAt3updVg7gxtVTO9h0MT7DKg
         8cBv4raWef4uPgh1noORTSJV+fKtmMWPxzEzSDD/xPRqY6s84NBSnLiKW0VNuqK+Loyb
         FJb6k2GCKz3gmF7WvekJ8uSulAE8RU2YHRElfOvorFFuD0keFpG2seVbMHuGyi9oWQld
         0/tg==
X-Gm-Message-State: AOJu0Ywb5g7aStoM+dOE9898YPEngc9ROJ7C9hCPqR37Ca5ip71g9D5B
	mNBgZCUh9yrrqDJVpKrqMfrsJxAlVcb8QAKAAdowJZdVuXR8sd+5
X-Google-Smtp-Source: AGHT+IF9tbun2pvJDXwUdc8QHEwYqG32S3USuD+uU9kVxhYvMRvMyFe6SHxEGV7p7JiOOWBlMCE1LQ==
X-Received: by 2002:a0d:f343:0:b0:609:f3be:9c8d with SMTP id c64-20020a0df343000000b00609f3be9c8dmr6982104ywf.27.1710175229495;
        Mon, 11 Mar 2024 09:40:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id h14-20020a81b64e000000b00603eb201977sm1421672ywk.70.2024.03.11.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:40:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7][kirkstone]: linux-yocto: pull request
Date: Mon, 11 Mar 2024 12:40:20 -0400
Message-Id: <cover.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196945

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Steve,

I've included the meta-yocto-bsp commit in this series, versus
sending it separately. It obviously doesn't go onto OEcore.

These are the updates I've been testing for the pratition scanning
issues.

We have a few -stable bumps, along with the backport of the upstream
change to fix the ptest issues.

Cheers,

Bruce

The following changes since commit d34002348374669528bb884c2d7be1b91938f471:

  kernel.bbclass: Set pkg-config variables for building modules (2024-03-07 08:32:54 -1000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel-kirkstone
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel-kirkstone

Bruce Ashfield (7):
  linux-yocto/5.15: update to v5.15.149
  linux-yocto/5.15: update CVE exclusions
  linux-yocto/5.10: update to v5.10.210
  linux-yocto/5.15: update to v5.15.150
  linux-yocto/5.15: update CVE exclusions (5.15.150)
  linux-yocto/5.15: fix partion scanning
  yocto-bsp: update to v5.15.150

 .../linux/linux-yocto_5.15.bbappend           |  16 +-
 .../linux/cve-exclusion_5.15.inc              | 197 +++++++++++++++++-
 .../linux/linux-yocto-rt_5.10.bb              |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  22 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 8 files changed, 233 insertions(+), 50 deletions(-)

-- 
2.39.2


