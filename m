Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDA2C77B7E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 15:13:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.23459.1682608374994207084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 08:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lWG6SMih;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f173af665fso57574435e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682608373; x=1685200373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IT2Hkge3oaXCDczP1o9awltEQe8fD1BDPvNmWM3yHos=;
        b=lWG6SMihEAPL/84S9HJyAQD83PHCjV6G2v7AmOCQmcr4YOVH6l1JaH3SKVDdbCv0pe
         BhqGxmrlq8COpBr2wkl5J3z3h6uZYaNR2Q71CrS/2B2s2Q4NGqV8ACp69R5Qu+EKz+go
         8B3k2ojHqgK2VluwI93/tRDZLYFw3Q8mgsGQjSsWEcSLdhvuid9SjvJneIjFRnTCon+V
         ewC9vlHQJtqAsR6KLq8SIasjORfYcwMWio7V/0fWxCr88iDgoAgk72fAVPLDPQqHyYC5
         5pD/KkYG5hMvbunQ3bHP1yc5fGwJZZrRUghkfhyMCP49XJLLpOY+Y7y8ECxrnruepxps
         k1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682608373; x=1685200373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IT2Hkge3oaXCDczP1o9awltEQe8fD1BDPvNmWM3yHos=;
        b=RqPSOZESqKMv+d5g5x8R8uAIb9YpDVNSJiTJYB9GYtS6DXQt2NeynShLLuCgN0Svx9
         ZyxdRvMzPzOYnuLZ7US1+vDbvggSwPU0BtUFc6IUM35x15KawNcwAq3E/kMhsIphJMLv
         fxG3aoWRKrDOwOgdk1onkEp/aKql8X6nL7EUY1AIZrqLRBTqHtA67FOm2i3WCUFa0f22
         s4RoL5xxCnB7Ij5MTROJDs9/fXrD4dxKFe2FFc0sRKi/ONBsvfMznT3YoJ80m1/HAURV
         AuPMO3kj0DqzFiyRTNWsvVFa2NnbKMjwXY1B+FsUZdFE4al6dRDYTdcd2OIXmMvHl5hA
         85IA==
X-Gm-Message-State: AC+VfDwpacarOMkECB//yY3WPhJugD+c7UvhMJj1ffNHemjvjOWcQhDb
	n6f/SEYX2xLPTKwv8uSZ1xuaDD317Qo=
X-Google-Smtp-Source: ACHHUZ7Z1MRQVDUDUNwJufCd1qi+5VC9hZY/zxoRiQfia0xZir09UQi2lrl+/miv8LSMc1NE8ATIRg==
X-Received: by 2002:a5d:664a:0:b0:2fa:e2a0:808f with SMTP id f10-20020a5d664a000000b002fae2a0808fmr1675398wrw.23.1682608372728;
        Thu, 27 Apr 2023 08:12:52 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c215300b003ee20b4b2dasm21655529wml.46.2023.04.27.08.12.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 08:12:52 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV4 0/3] Create class for building rust unit test
Date: Thu, 27 Apr 2023 17:12:47 +0200
Message-Id: <cover.1682608254.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 15:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180493

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This brings the possibility to use this class to build and ship
unit tests of rust projects, the class also create (or modified)
standard run-ptest script to run the generated rust test suite.

It has been tested successfully with core-image-sato under qemu
for zvariant-ptest and python3-bcrypt-ptest (though the last one
didn't define any unit tests).

Note that I tried to do the same with python3-cryptography but fail
to build the test suite and I don't know how to do it with the rust
extension module build by python setuptools. There must be some kind
of way for doing that so maybe someone will put some work in it (
because python3-cryptography rust extension do have unit tests).

Moreover, in the ptest-cargo class, I didn't manage to share data between
do_compile_ptest_cargo and do_install_ptest_cargo cleanly (I tried
to d.setVar in compile and d.getVar in install but it seems that
the data store doens't recognize my new variable) so I used a file
for that. I'm sure there is a clever way for doing that, so feel
free to tell me.

The following changes since commit 45a8bb6e4676899d40525e7d5ad1c1ddefee3185:

  apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-add-ptest

Frederic Martinsons (3):
  ptest-cargo.bbclass: create class
  python3-bcrypt: enable build of unit tests
  zvariant: add ptest feature for zvariant test suite

 .../zvariant/zvariant_3.12.0.bb               |   9 +-
 meta/classes-recipe/ptest-cargo.bbclass       | 130 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 .../python/python3-bcrypt_4.0.1.bb            |   4 +-
 4 files changed, 142 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

-- 
2.34.1


