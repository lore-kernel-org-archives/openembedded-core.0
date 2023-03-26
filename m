Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDFEC74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 14:56:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.11704.1679842574065369323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 07:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=heWqmUfs;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id m2so6136293wrh.6
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679842572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=es26gJwsJak1QRteN15tAXX3oHWVAGhrY2x5z55bptw=;
        b=heWqmUfskR43u/UxTAJmoSASVfwigqRI4oRCzaNgeThddDHjI9AqbohWdy7qOzGM/9
         CiRg6mDZU85jKUOj0K2230EiB1ge4B+GwHiUnitYcXp6QMpIhDJRG5THBLbM1k8MrT2a
         pQW6vMftPCBppJg38WhIQbDUAGlF5hrZ5YpXxPIEUHS7H3NBDq5hGXQrT4zKeYPXE89x
         rqUe3gC0Dwj5pS+XYvEReOq2Rxw8EOWahSO4VasJJRgJMK4PUkaIR9hIhy1FL7iswbrV
         Zf678+oQVmYughhbc3jNlPPamAzzJwQKJVo9NN7TeoZTPWxAkC9rm2wkIvTHxUiTZBOk
         ZnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es26gJwsJak1QRteN15tAXX3oHWVAGhrY2x5z55bptw=;
        b=U9+xJlB7/RS8rrefx2sEsMnLIMtrmZP4k8ghZUdllTk0IVrjjn1JsVbndW7x2zEpOX
         pWwof/uUumLNEUHk0W12g1hTP7lvPtI8XfL66/QhIqaPydRRjSbua/4y10KYkiHjGO/C
         qqoFy1oEGnWgYJHTGwjdkzbPfpA91sBBNeFAX8a8uLbbxtx/JqZI9X/mptp3e/OXgT30
         6SvLN7eBDtgM28mXyeUQ/E6kWH5z+eSYBQNbdSu+cewwJByKOFVV8vAiqp/EM6QZGMlo
         c6cwwxuUznyiE1ZJHOICKxHMY+pi07w3cCv9Pa1mjBpIsWaVEuYOo4arGhkUK63RvYk3
         lG0g==
X-Gm-Message-State: AAQBX9d7apukUzt2B+busMtor/cxKoouBtV4WxFH+keL+W70Fz+JFDsZ
	CPBmx/ZOnb2LU61eZRB1CUTMvAc2S28=
X-Google-Smtp-Source: AKy350ZSXA4wMXtFJhJmSTQWanPoKe76AmGGyZaaRA8mbfQyjd1XdpFm+QqmKRhcV83vpbRkVAExZw==
X-Received: by 2002:a5d:408c:0:b0:2ce:9819:1c1e with SMTP id o12-20020a5d408c000000b002ce98191c1emr7271457wrp.30.1679842571971;
        Sun, 26 Mar 2023 07:56:11 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:af58:462f:1cbf:cab5])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm10797549wmm.36.2023.03.26.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:56:11 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV2 0/5] Extend cargo based recipe support
Date: Sun, 26 Mar 2023 16:55:58 +0200
Message-Id: <cover.1679842454.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 14:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179121

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enables devtool capacity on it and provides a real crate
example recipe to show how things are done.

The following changes since commit 4876189dd2ae5a04a296b11b537b9f613159c6bf:

  xcb-proto: Fix install conflict when enable multilib. (2023-03-23 22:38:41 +0000)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (4):
  cargo_common.bbclass: add support of user in url for patch
  rust-example: provide a recipe for zvariant
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    parameter

 meta/classes-recipe/cargo_common.bbclass      |   33 +
 meta/classes/externalsrc.bbclass              |    4 +-
 meta/lib/oe/patch.py                          |   57 +-
 .../rust-example/zvariant-crates.inc          |  140 ++
 .../0001-Tweak-zvariant-cargo-config.patch    | 1249 +++++++++++++++++
 .../rust-example/zvariant_3.12.0.bb           |   20 +
 6 files changed, 1487 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-extended/rust-example/zvariant-crates.inc
 create mode 100644 meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-config.patch
 create mode 100644 meta/recipes-extended/rust-example/zvariant_3.12.0.bb

-- 
2.34.1


