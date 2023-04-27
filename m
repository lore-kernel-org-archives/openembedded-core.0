Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD70FC7EE21
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 05:21:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.13594.1682572862073067390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IKePB1/v;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f086770a50so53659445e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 22:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682572860; x=1685164860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kA58UZ9UV5hsDUl6CoC3D02XRBBEw1BGyOQzbwEHAAw=;
        b=IKePB1/v3aVqSrZybgf5XyGLHtZ4N1oIr+Dn9BS6RdcpQ0bi9/GHR9Oitbl7I+l+xV
         fJBio1aDe8PamlTPWN6EUsQuuANCPPsYzz2R6vwVOZcKq06llbrewXLWLbbT+QeS51MU
         KF85Y/x29bFgN0XDGVSzTGRSETlPYGO+upWthEvfzvRAqRlzKbywVQ3WF/HvhcYn+0O2
         qFoXefGyLaAGoXP0g2U2PFykIL4Pownv8SOpfKJzg+7VtbXmY/VjOrJWA3/0Bu4GFXlD
         9vyw9rBXEww2f/hWgHbyR0lZcig3y3YY7A04FXl0pooiNVwP6GyqLCkSWGVjFeLh9nd9
         2hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682572860; x=1685164860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA58UZ9UV5hsDUl6CoC3D02XRBBEw1BGyOQzbwEHAAw=;
        b=EA7Gj+36NkCUZ9N8S8kBhVObzZGpCYI4PHjPgNPBItWOHTZ3vuVJ21Qf5bDcG/XRGF
         KqhmGtbs9trMBjulQF4VW0mmW9BZeC3z95QcC9l57pv8bt6+MFhwiTevxe78wRf4xr/G
         r8yXxISJ70STi4oZ0x4KWyjbUwBhWk4K3UdYf0fw41CCPOpPOyMHfBTUs87ZBIBlWALV
         Wk+Rs1Qhl1NKB6XferXywtK4q3odS6SjGAyT7bWhT6K+ezK9d0CAZrFFtG54uhG4nDrD
         SvvmD2VUVF1ikzelJydEAqe089uNG6ipQ4qhjiXGPVqSRLEAiJ04s43vUgpCwJ2nl5uL
         NNOA==
X-Gm-Message-State: AC+VfDwY86ik7JgAk7w0DJXvY2c9M5gonLR+VnipMFOsuzqBNlXROwID
	YjUC6Zqp60O9X5JVuQzGAEdHrNJ+ItY=
X-Google-Smtp-Source: ACHHUZ7w6+z4WFA2NyDyGGU/1yRxNLh53nkTsPZEquw4rhFQ0vnbiege9AXalaC63XdMQYvt77ZBuA==
X-Received: by 2002:a7b:c408:0:b0:3f1:75b6:8c7 with SMTP id k8-20020a7bc408000000b003f175b608c7mr375574wmi.37.1682572859721;
        Wed, 26 Apr 2023 22:20:59 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id jb12-20020a05600c54ec00b003f17003e26esm23240809wmb.15.2023.04.26.22.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 22:20:59 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV3 0/3] Create class for building rust unit test
Date: Thu, 27 Apr 2023 07:20:53 +0200
Message-Id: <cover.1682572703.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 05:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180466

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

Moreover, in the class, I didn't manage to share data between
do_compile_ptest_base and do_install_ptest_base cleanly (I tried
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
 meta/classes-recipe/ptest-cargo.bbclass       | 129 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 .../python/python3-bcrypt_4.0.1.bb            |   4 +-
 4 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

-- 
2.34.1


