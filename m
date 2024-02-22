Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD1BC54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:30:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.14007.1708612248152916272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JCQxpOwh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc0e5b223eso32421565ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612247; x=1709217047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NU70jRxkzXLop4+pYUssSSE73qiIzFS8UK67RyEYO2U=;
        b=JCQxpOwhwAIj3T8pWuwmpUYI2noXB3xR50DGySyjfzx3O10qasRo3ahEkQ6EKi0oIu
         uGHYgub9vYKOooMOadxy3+UbSxW/oNhtftoPhnIOEzdE9HoF93dV0pr9rtR0csQt1mNy
         g/6gtu7ca/TBdxoW7R0p6fcrcrNr3v2yCz8FerS9YdLNQBa52EfRULlShTHarBRmKXXX
         +w4dz+78t/9dRjQ7Jr6Xiw6MWrXvS64SRZWdQAW7dxgtfgPex1uBV8qV8NMYIuPMicN9
         PBZlVmdgAlR7GUcmu6nWR0mDkiWyDIxYelQiZJpRUup7gJc+zlFc0douSDFx1hNUIEDh
         vWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612247; x=1709217047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NU70jRxkzXLop4+pYUssSSE73qiIzFS8UK67RyEYO2U=;
        b=bmKDyEouxBno/Xm2bcCed84Nb8EJ+mpHqVCtGUEQ8kM23ySGrkVKiL0ZnS5jklmfXa
         5Ozxh3jFqAm/+OGZXhCFNl/TGJUet3TkiN/Qbkl/kIGbATxZNOfG3er3KcdSQnCW3WGe
         /O3jyAXrugF3dTSNrWRSLZx3L7Vh+7zgc9uDOTJvat88kSR5gZBKRQORXP92rTecnFR+
         ihFp/6wNnx7MrsAG26tZKgKt5cOj8/eN3xCNhNEleYVq0cnOlhHHlnZqilukYoBBaTx6
         JZFNdZMvNbULeXytowkCbzhNULH3kE7uJTeUw1dKpz97wI0KrskdWNDz5RKHY1TKPKnb
         J8WQ==
X-Gm-Message-State: AOJu0YzshgmL1B7f8FBXtdGfGKDgrpXedcKR99sbLLIuJhDW2Jr7ggwH
	wVg0SsfivYFxWQStgJ9x47dQjKEk1C4qT9Sn/2zEcBsHFEgq34EXx3MXI9yubhm2Ua7aCe2ItXE
	AO7I=
X-Google-Smtp-Source: AGHT+IGxmZuel8avfU/6RN64Ai0gU7CO7kqEzvrs5vwdCYKL62Z4ge/e7+YzrdO9GuNQ0VWqbO02WQ==
X-Received: by 2002:a17:902:a3cc:b0:1db:ed54:a732 with SMTP id q12-20020a170902a3cc00b001dbed54a732mr9360757plb.4.1708612247089;
        Thu, 22 Feb 2024 06:30:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:30:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Thu, 22 Feb 2024 04:30:31 -1000
Message-Id: <cover.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196019

Please review this set of changes for dunfell and have comments back by
end of day Monday, February 26

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6590

The following changes since commit 7ab6087536bc67c63094f08f863dcd3d5e35b8e7:

  cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES (2024-02-12 17:13:14 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.264
  linux-yocto/5.4: update to v5.4.265
  linux-yocto/5.4: update to v5.4.266
  linux-yocto/5.4: update to v5.4.267
  linux-yocto/5.4: update to v5.4.268

Peter Marko (1):
  gcc-shared-source: whitelist CVE-2023-4039

Richard Purdie (1):
  sstatesig: Allow exclusion of the root directory for do_package

Steve Sakoman (1):
  cve-exclusion_5.4.inc: update for 5.4.268

Tim Orling (1):
  vim: upgrade v9.0.2130 -> v9.0.2190

 meta/lib/oe/sstatesig.py                      |   5 +-
 .../gcc/gcc-shared-source.inc                 |   3 +
 .../linux/cve-exclusion_5.4.inc               | 199 +++++++++++++++++-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 7 files changed, 215 insertions(+), 32 deletions(-)

-- 
2.34.1


