Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A870EC77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 13:04:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.50608.1682341459190195519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 06:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=i+zoxW6D;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso19797535e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682341457; x=1684933457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eCUD0AkOq9WIyBM3sHWrWPn6GYxhl8VPi/Iy4h97t5k=;
        b=i+zoxW6DmaCqrfu5y1xZiDq6sE4aqzu8wQmUv9lFw2amoRiqydS6XtsV09aHveRqAM
         MnMo7E+dg3/BMEE3SQW01q8u056zlo6xfHyymHhw50vzPqG8eD0bfdSoIdGRDBncrWeW
         7RpUcGNyz3lIfuv+eRvSL+xtu5+SNIW5hYBDbd1ogPSmUguF9M7Bre9rXy5Kebm4bkpd
         lMxeF31f+Dj4iUumSSFPP0epdYhQG2IiQJKBQyb0JojC+5JCqvXsOIL/AY3k6bCKlAhy
         X4LdlA8W4zSnv+hPYj4yLJvF3K7ocsRsGlJ1ay20Qq+TD2pnZ4Rpt9fX3T+yhouxT9nQ
         0KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682341457; x=1684933457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCUD0AkOq9WIyBM3sHWrWPn6GYxhl8VPi/Iy4h97t5k=;
        b=Mv7jch+nRSnMr6RATdLF+8YLPrJpCWJypo4kDbFzTgs+kNAsdNiFukBNCMbsoOl6pT
         L6skLRfHq3rcmanF7Kr9zA/TMucsdMns3sZlHMwX0Me/ZJJXwt1U9QZ56KlDLz+adD0G
         OU8HYvuwxY5/v0zeAOKSv7vJi5EP4ULCpW9SdOnUqVbLAgzpsxHEuytt2XNNGT2rEIcF
         tTEv/iKKLk8TJNh7TJSnTZ0C0Vqr4WvP4Q1Vb8bjlvHAY7vyai+hCcY0MD6H9uPSPM4x
         3r/ACoQXxIAykS2FkriNBdPJorXBqvorcnB5wli0m2Oe9ywExNyRejjdicUTK2cF3VTp
         EXeA==
X-Gm-Message-State: AAQBX9dpRxOiXZbQ9GER4KkpxU4jpXFo6IPNa3QE2s6xDQvydUH40Dls
	uY7yhCF9OBfhzOlfVw36ZhxV1rWM25o=
X-Google-Smtp-Source: AKy350ZI//kihVkgD/yfxceEAxJbVSNk2U86X+ljs2iuiKPPocT44EjMpqk/3OMxR+rkplmfaAOe2A==
X-Received: by 2002:a1c:f601:0:b0:3f1:7331:38b1 with SMTP id w1-20020a1cf601000000b003f1733138b1mr7533098wmc.14.1682341456945;
        Mon, 24 Apr 2023 06:04:16 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:d7e1:16f4:c5d8:fb02])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05600c82c900b003f0ad8d1c69sm9170508wmb.25.2023.04.24.06.04.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:04:16 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 0/3]  Create class for building and installing rust tests
Date: Mon, 24 Apr 2023 15:04:10 +0200
Message-Id: <cover.1682341336.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180351

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
 .../python/python3-bcrypt_4.0.1.bb            |   4 +-
 3 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

-- 
2.34.1


