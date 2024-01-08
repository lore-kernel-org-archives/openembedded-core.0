Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D899AC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:42:05 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.8361.1704724915955343638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hp9UeqNX;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jhatnedap@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso18239167b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 06:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704724915; x=1705329715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wSa2k6Bc+PkKp4Pdx2GIKgLXAC4WaIZBueewk7bHDZE=;
        b=Hp9UeqNXxZAM6VfeVrkBVsr/N89nS8Zk9Mdnh9C0tBMOhqMQAMlVU1nnH+212QVU0S
         zSqMhwoOeyAWGsZ45RWwvGXQGwsqSoh+MA8rqrgZxh/YfmCGga8G7c47/0B8HbgVXS9s
         24Wi5+xNyGYEmSrrY7NOZTVpmEisXkXwpAqJh0Iis6UfnRk1CJ/IO0kzurJ06g2TeBDC
         lLu87QTBvLnMgQVtQvoUg1fd/l0yOSQ1nv+7nyxz13ZSUkDfpoSu1CEVuz/aqDdmjCOd
         SEtmaZ4T+AsjHBU+/GyYD29MU6LBm+bW1G8HL81a18n4jFy4eikN1wizAxXZtp60Jiqe
         msEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724915; x=1705329715;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSa2k6Bc+PkKp4Pdx2GIKgLXAC4WaIZBueewk7bHDZE=;
        b=Ex/Z6zksKA4/XRoYnWy8PtmPs1rBSSJ+WnIiQnmArZfNZfAu+BQ71dmr7xysqQwW2E
         mOYBriYSMZHIrdeGLb4VzVGWQWJGBRtvvWoAwknqMa26uxdNabdI4PALD6G15QshlW2W
         7rT39ZeZ9a2d9u/myHRDF2PQXsa5NwrxBrZySSdjGPT436jicSAPeka4rLGehCmxZzwz
         NCfDOE7z6YtwrahRABV2VPj4+dxp0hYs1I4fW1kq7Loa4ajg10VEHH2DgH0loEBpzOoc
         nO14jjWO+k6XGpIYu77uzkBl+VAyx43fzIIdpt8hbTZ32mQuI9/EfJFikyTRIWvGDNpz
         2VVA==
X-Gm-Message-State: AOJu0YySrrtxEbKMZxWM3DbrUdtkPtL2ObyTtfIZVEYL8NfMPL0VwtXU
	0kbMpHiNf48hi5cReZFDCc40tBtDUSc=
X-Google-Smtp-Source: AGHT+IG9+aF8Jc94c2JtY5qdybds6Oarir4RjFgwsJwRe98TnkOnTwEWC0+GJe4JDbKRHVJoHfVXCA==
X-Received: by 2002:a81:690a:0:b0:5ef:a183:a8a4 with SMTP id e10-20020a81690a000000b005efa183a8a4mr2828982ywc.90.1704724914994;
        Mon, 08 Jan 2024 06:41:54 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id g188-20020a0df6c5000000b005e25dc30d2fsm3241233ywf.45.2024.01.08.06.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:41:54 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC v3 0/2] bitbake-layers: Add possibility to update layers setup
Date: Mon,  8 Jan 2024 15:38:56 +0100
Message-ID: <20240108143857.2316-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193407

From: Jermain Horsman <jermain.horsman@nedap.com>

During development it can be useful to use a branch instead of a
revision, e.g. when rebasing often or just for easy upgrading of
the setup.

This iteration has a very minimal implementation, which covers many
use cases, but certainly not all.

As previously discussed the interface is as follows:

bitbake-layers create-layers-setup
  --update <repo>
  --reference <ref>
  <setup_dir>

Note: '--update <repo>' can be used multiple times

Based on previous discussions, this implementation does not check
any input and it is left to the user to make sure that provided
references are actually valid for use by git.

Valid references are git hashes, tags and branch names, there are a
few things that should be noted:
- On systems without a default branch, using a branch name that is
  known to multiple remotes will fail.
- Using a branch name without remote will work, however after the
  initial checkout this branch is never changed as no pull is
  performed.
- The layers setup will be created successfully even if the reference
  is not valid.

Another thing to note, currently a reference is required, a possible
extension would be to make this optional and e.g. make this update
only the selected repositories, this could be implemented later.

Changes in v3:
- Moved options from lib/bblayers/makesetup.py to
  lib/bblayers/setupwrites/oe-setup-layers.py.
- Split '--update REPOSITORY' in separate '--update' and '--repository
  REPOSITORY' options. Specifiying '--update' now selects the old setup
  config to be modified, without it an entirely new setup will be created
  and subsequently modified.
- Updated test case for the new options.

Jermain Horsman (2):
  bitbake-layers: Add ability to update the reference of repositories
  bitbake-layers: Add test case layers setup update

 .../bblayers/setupwriters/oe-setup-layers.py  | 71 +++++++++++++++++--
 meta/lib/oeqa/selftest/cases/bblayers.py      | 26 +++++++
 2 files changed, 90 insertions(+), 7 deletions(-)

-- 
2.42.0.windows.2


