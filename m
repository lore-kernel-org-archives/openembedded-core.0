Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE670C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.5653.1655894022402083039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IPu4dcVC;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id eo8so23303940edb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dfRajcw+weENRbz7mr0y9NHskzlANLBF0TA4bL2LHow=;
        b=IPu4dcVCZypy8WnzmplIP0n6+uebilH3KSPQ1YZyqaP1BiOI3f+pBCvalZHfLp8Hli
         2KCiNBgU3PR3v33yIdu+XVkdtD5SEo5W3NGNLoLHry7xE57Q8wBa3Erxk4NVM01CYK4i
         XwTHEqKMiNnild64A6WkeLgLQ75eL8w8eccVD9AFYhO8DSdehZwg4KywephysURtMD7y
         anyTwX68UgW4ViNNPXusxTIDi2Mt2Ob58cta5cErPfKxBM5mXYLp/jJNirQINdTCEE5R
         lAXXtmEQpvdbUr8AJ5pRZjbskZ1YcQpduyeyDLs0UkX6fLOJyRv2y67TkjEbXsYEWwdA
         rY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dfRajcw+weENRbz7mr0y9NHskzlANLBF0TA4bL2LHow=;
        b=kco4jRE2JCtTsZpPHCjaTu9i18fTjC8/Kol/4+2vk1jR5Me9mgTqnHlB0KP+8NVbNF
         oduLV/3UWawSm8sAKcW4sOPL9uejRGYBreDAoIPxKPLntvSG7dNrN3Oj/ck3j1CtHEUZ
         1P3/o4N63dcLPK0N0bgrjotnebWDCSsIh6UNMlelYyfL4t6+q3D0/Xl7D+3Q7IFUCKrN
         NYqoCS50MLap0IkM+qCtO4tAIUnutUUbJVSgx2Xb5swLLdRHldm6APcDxMtDrfJI2gUJ
         CglUD0CCZh2L2aR7IRZDn4Q05Puk/xE9JD4usUKULUlpLJexKMJ9jr5FtzcwAcaSzEHm
         zhyA==
X-Gm-Message-State: AJIora9DHtsmJ0q4lvzIYvvz1Shf+dHSkagbEzWbbe9qbJ9FCecEwMfs
	JasllCHkwRJ6QZN+EDJiKhfOwz8g0FaiQQ==
X-Google-Smtp-Source: 
 AGRyM1trbLj4Pv3ItHRB0myCCkwzk3ZqvIKZlxzqHsS7AsoZUq8xhmXO36RHYpY1qU//t/MFPKu+9w==
X-Received: by 2002:a05:6402:3586:b0:42e:2a6a:218b with SMTP id
 y6-20020a056402358600b0042e2a6a218bmr3336372edc.208.1655894020749;
        Wed, 22 Jun 2022 03:33:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 0/6] (e)SDK workflow directly in a Yocto build
Date: Wed, 22 Jun 2022 12:33:06 +0200
Message-Id: <20220622103312.1098389-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167226

There's been a recent discussion about how we can make the Yocto SDK
experience better [1]. One of the ideas was to eliminate the SDK
as a separate artefact altogether and simply provide everything
that the SDK and eSDKs do directly in a yocto build. This does not
mean that people have to 'learn Yocto', but rather that the integrators
should provide a well-functioning sstate cache infrastructure (same as
with minimal eSDK, really), and a few wrapper scripts for setting up the build
and the SDK environment that run layer setup and bitbake behind the scenes.

[1] https://lists.openembedded.org/g/openembedded-architecture/topic/thoughts_on_the_esdk/90990557

So without further ado, here's how you get a 'SDK' with this set of patches:

1. Set up all the needed layers and a yocto build directory.

2. Run:
$ bitbake meta-ide-support
$ bitbake -c populate_sysroot gtk+3
(or any other target or native item that the application developer would need)
$ bitbake populate-sysroots

3. Set up the SDK environment:
. tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
(adjust accordingly)

Et voila! The Unix environment is now set up to use the cross-toolchain from
Yocto, exactly as in the SDK. And devtool/bitbake are available to extend it,
exactly as in the eSDK.

Theare are numerous benefits here: no need to produce, test, distribute and maintain
separate SDK artifacts. No two separate environments for the yocto build and the SDK.
Less code paths where things can go wrong. Less awkward, gigantic tarballs. Less
SDK update headaches: 'updating the SDK' simply means updating the yocto layers with
git fetch or layer management tooling. Built-in SDK extensibility: just run bitbake
again to add more things to the sysroot, or add layers if even more things are required.

How is this tested?

Exactly same as the regular SDK:
$ bitbake -c testsdk meta-ide-support

This runs the same toolchain tests from meta/lib/oeqa/sdk/cases as the regular
sdk testing does.

One known issue is that the libepoxy test is failing: libepoxy is built with meson,
and meson requires the build configuration to be provided with native/cross files and not
in the unix environment. This is addressed in the 'classic SDK' through a wrapper for the binary,
and something similar will be added to meta-ide-support as well.


Alexander Kanavin (6):
  toolchain-scripts.bbclass: adjust toolchain_create_tree_env_script to
    better replicate (e)SDK
  meta-ide-support: adjust to provide (e)SDK experience directly in a
    yocto build
  oeqa/sdk: add a test class for running SDK tests directly in a Yocto
    build
  selftest/meta_ide: add a test for running SDK tests
  oeqa/sdk: allow epoxy/galculator tests to run in esdk and direct yocto
    builds
  oeqa/sdk: drop the nativesdk-python 2.x test

 meta/classes/toolchain-scripts.bbclass     | 23 +++++++-----
 meta/lib/oeqa/sdk/cases/buildepoxy.py      |  3 +-
 meta/lib/oeqa/sdk/cases/buildgalculator.py |  3 +-
 meta/lib/oeqa/sdk/cases/python.py          | 11 ------
 meta/lib/oeqa/sdk/testmetaidesupport.py    | 43 ++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/meta_ide.py   | 14 +++++--
 meta/recipes-core/meta/meta-ide-support.bb | 26 +++++++++++--
 7 files changed, 94 insertions(+), 29 deletions(-)
 create mode 100644 meta/lib/oeqa/sdk/testmetaidesupport.py

-- 
2.30.2


