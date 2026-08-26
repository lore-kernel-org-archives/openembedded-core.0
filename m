Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46814C61DBE
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:35:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25440.1787787310784341421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rsklUgoW;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f71156e1aso663173f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787309; x=1788392109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=it9Y/dVxtQXVgLLKijFB3ospUXz0MTg7ZDhWp9SkTdg=;
        b=rsklUgoWy5Y4aRli1A3fhv5+WD5MI5JPxtbKRDqB31oyt3d2zDrleFkRySJCRDu4PD
         +uyBFLs2mkFXxkgt0fm25osyUcE6lgDcQE7BvyHvTVh0jU89sBOJcIEh8AlqSARhI5/K
         tceV9SJPybebpeTvU7pkfk6APalRVwzmk59CHO68znLDdwgJu2sNcvyIQVvqmbRc0oZN
         ekawsI2e/UodUkW6xxOJdvMYWYLmK8o80YxD4oNOTYTQ/mFik+WPlQvQPMTCnM56XpH1
         eUvMYD0lTi0bxnyfrU+sAsFcV7hs+0FbIPEaqIt+tqMZ+eH2BhvAJD1HLb61dc2j4vhi
         ZZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787309; x=1788392109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it9Y/dVxtQXVgLLKijFB3ospUXz0MTg7ZDhWp9SkTdg=;
        b=BTwqHYsKYqFlFqu7WzNgtpFtSF3XEi0KA2A3S2mLFVcfRgKY86qo59mhwBRNtyU6mk
         zo0Yp5un64oxhlNmHUvgsy1Tt6zPLiJK2+fFg7kwDwojKz70BkWpaX6jsNjm9aNZzdtA
         5tla/f2RWVlAhF+xszMzwL/obUP3/+nqlucJ31ya3hY4I+nYTx1YXmDrTymMgRZWumYK
         rdurYD0vSeLaTxWryIDotv2mDnqjvffhZBMS3K+daFMfsSWzSHUF0eGzmxj5L6/uUCc0
         Yec0yi+nBBzE4CJ4IH5xpFo4+gOHZi/HWeo4psJzaCi75h4HG2dDLcNuuLbbKEAGtKIc
         sRZA==
X-Gm-Message-State: AFuF++myKZpKGG75PtrUejiobA/sJhttXwx/tsOYuqLysQsOEIQZhGD2
	onWSdgTkNKzxsc936tYG5baQXSbCIlqnxkR4HUSzz+X9AZU5rgG6YeFHeL/vzQTmcAE=
X-Gm-Gg: AR+sD13X+Kv/A3pZRTPlutjzBYXJmLUOd9GUW6TEPCSoQiuITswIr2dGydyHtFAsw/X
	1oUCtyoNKHuD6qipSW0/C3U244/Qv0/Qn/AdLfdKqsgZrzXBRXAYXZ+2easgx+zDKCq9xDlXPF6
	Mvgn4GZ8d4lo9kOLX0+TCdUTYKhVWClWDDeMMPlJhNnwY/tg5mXQwQpjSskwX55DKbO2cYrzGh8
	khuASBUJJaYNhZbSmjfWVfhX7qSabZ96fMb56BXP5mHCkWEEuDq2WHP8gsaiaIsmdoasz7xV1Va
	GK4TMKsrerH2bxezoas3MhLYYCucxNYJ8TLAKt39uxmulWg0SlpbI66BMFbfoa4ZBC8Uk2AVvvo
	77HxIYmcDzXoxRvEswBl65dfrgSUiwtv9c2CHezoDOra7xzBoLKG9vfMKngFF/XgJqA7R6FBYjC
	aenyh07x4qyay4vkmgi5n5YtiFgv5KhNsOdA3DYIQih4EjlcTtavx2UcgiQaQpEZL1yNCkJANNF
	vtxCGjq0jU5kFCZvli4AHRMIJat2Qj0MH5IqsfsnQ9MUOYY69q+ORUIIF/EOZm2xFGpRWRSfxfh
	eptnTyLB1k8=
X-Received: by 2002:a05:6000:2589:b0:482:b887:f033 with SMTP id ffacd0b85a97d-482e26e5c60mr12387408f8f.16.1787787308746;
        Wed, 26 Aug 2026 16:35:08 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm4586872f8f.16.2026.08.26.16.35.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 16:35:08 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v7 0/5] Make signed kernel modules stripped
Date: Thu, 27 Aug 2026 01:34:11 +0200
Message-ID: <20260826233416.37047-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244435

- Re-sign modules after the package stripping process.
- Remove the package-stripping skip for signed modules from package.py.
- Add KERNEL_MODULE_INSTALL_PREFIX variable

Note that tests have been made on core-minimal-image for in-tree modules
and on crypto-dev and lttng-modules for out-of-tree modules.

changes in V7:

    - Move get_ext_mod() function to lib/oe/kernel_module.py lib

changes in V6:

    - Sort KERNEL_MODULE_INSTALL_PREFIX variable documentation alphabetically

changes in V5:

    - Adapt signing function to out-of-tree modules.

changes in v4:

    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable

changes in v3:

    - Fixing rebase issue.

changes in v2:

    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.# Please edit the description for the branch

Anis Bougrine (5):
  lib/oe/kernel_module.py: add get_ext_mod function for module signing
  kernel: re-sign kernel modules after package stripping process
  package.py: remove stripping and splitting skip for signed kernel
    modules
  kernel: centralize kernel module installation path in one variable
  documentation.conf: add documentation for KERNEL_MODULE_INSTALL_PREFIX
    variable

 meta/classes-recipe/kernel-arch.bbclass       |  1 +
 .../kernel-module-split.bbclass               | 25 ++++++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 12 ++++-----
 meta/classes-recipe/module.bbclass            |  2 +-
 meta/conf/documentation.conf                  |  1 +
 meta/lib/oe/__init__.py                       |  2 +-
 meta/lib/oe/kernel_module.py                  | 21 +++++++++++++++
 meta/lib/oe/package.py                        | 26 +++----------------
 8 files changed, 59 insertions(+), 31 deletions(-)

-- 
2.50.1 (Apple Git-155)


