Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4441EC77B60
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:31:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.17482.1680341456653218708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sx+pxWbi;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i9so24707423wrp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFTo6bOzkWTRdHgI8vHlkOuADdQtrf+IqveG4YP+JqQ=;
        b=Sx+pxWbiwJbURg2qTvVX4u83PsApQ82vWYXMR3m7AutR4YjVUA+iD0aafvqNWhwaQp
         eq8d30FmlGUu325hpF4vxIEB9v6Ck4+vdg5XGKFfxRcbIluBji5aLoIOp0wRWLjcNjxg
         1DItwcEMWxhodI/gFhoqFCmorDMX+QEY3MLfhF5MkxgehPxoTX5Dsrbq+M/7dT+LcGR2
         AzjXLe5JzdHnkbl8JREJ7Rxo+74FykqU/arKwyqU0fEfPdRpj+T88Y+SsejTrP7ye4YW
         a4zme09kcqgOBoonh29W7N43pUuKPIWbX6CVPbBJ+6avr93blgWVHmbw7SSi6BAY/GNP
         nwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFTo6bOzkWTRdHgI8vHlkOuADdQtrf+IqveG4YP+JqQ=;
        b=HDq5o91GVcxuKuFopa8c36p3DE6rnzTB1OjBpUT/Q7WhUuR8gPydfNgFwRX9We4szk
         Re/tTLwgHl6vJwhCOv/c1xXCUoEidayKBMHWUvaJMxr1s0eX1ZmZAjhBt47kh4JWyD+A
         5rtDSg/HwLjjY7BFhp9q67Xie3pi229gFdos7dKi50tzmSzYXqYkYZOCxdHItnU0Q75s
         6ShLNgLHrutHxlRnjcrHwEjXlLOqvfG4sFT2niV1vlLih0oNLew2MBZNtfxYzVeCK5pZ
         mUgvigJNH9QeWG3CkvmRYj4tdIBF4fmUPhopNtwxumtZVlg5RtsWLTRR+WqJB7mS1Ktn
         LhyQ==
X-Gm-Message-State: AAQBX9c9JMq7vLek6jacVTDQSf084l/nOvPNk2X5Lx5XiFFxMzs4guKG
	SxyPoFo9SiRivyYGdSo2e6OHt6pSGaw=
X-Google-Smtp-Source: AKy350Zch5tBMsFeF+BwqY/tfl3ilSKVFxvKGwVi2b0BUj/+GtvEp3pZZEAHNEcV0FUkoQub1ZN2qw==
X-Received: by 2002:adf:e8ca:0:b0:2c7:1d0d:7184 with SMTP id k10-20020adfe8ca000000b002c71d0d7184mr25990995wrn.11.1680341454530;
        Sat, 01 Apr 2023 02:30:54 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:eb6d:89c5:4fce:e824])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d4e0b000000b002e71156b0fcsm1522232wrt.6.2023.04.01.02.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 02:30:53 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: [PATCH V7 0/6] Extend cargo based recipe support
Date: Sat,  1 Apr 2023 11:30:45 +0200
Message-Id: <cover.1680340685.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179459

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enables devtool capacity to such a recipe along with
an example of recipe and a new selftest case.

The following changes since commit 4922221d1259e2f78233f17bb901cdac5b9aa520:

  oeqa: whitespace and indentation cleanups (2023-03-31 23:30:34 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (5):
  cargo_common.bbclass: add support of user in url for patch
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    parameter
  meta-selftest: provide a recipe for zvariant
  cargo-update-recipe-crates: force name overrides

 .../zvariant/zvariant-crates.inc              |  258 ++++
 .../zvariant/zvariant-git-crates.inc          |   14 +
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
 .../zvariant/zvariant_3.12.0.bb               |   29 +
 .../cargo-update-recipe-crates.bbclass        |   35 +-
 meta/classes-recipe/cargo_common.bbclass      |   33 +
 meta/classes/externalsrc.bbclass              |    4 +-
 meta/lib/oe/patch.py                          |   57 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
 9 files changed, 1780 insertions(+), 35 deletions(-)
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb

-- 
2.34.1


