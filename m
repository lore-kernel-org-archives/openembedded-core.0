Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351B4C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:11 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.18816.1713269225027942285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VBalhX7m;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso3132299b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269224; x=1713874024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzlBsZMbOk2xREZURY7cVxexWPX6Iaqk7qLC/RO5ScQ=;
        b=VBalhX7mLYG2mlRTQHEbTAJqESZfZQNCFQbD30HMFPWz3TOlWs7YDknZhqOVR9K2Rk
         OG4YTNxT2D3zCknF3Qg8yR6zjMOyZ43kvF+LL7xc4HM8Yya8/lNvkfEpLxqFRhwfLUCC
         6n3ZQ8H4xTMyDOw3gxuQpZM6NNFgr/VP4q6zo5SGhR3bYBN+Vhu6h4/x4B41UIZpwPne
         2XO0FJe/dby45RKaFe2oI0a1G12UjtzOP2fUA7+ASgwbkVH/68pwgq2SsOcK3mTRZL1I
         nvxr2UyHa0XKjG49L3iMDK+MU/+8ymOwaUnQo4UOjdgzuSt7Fu85ZqX/bvfLU69oJph6
         umBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269224; x=1713874024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzlBsZMbOk2xREZURY7cVxexWPX6Iaqk7qLC/RO5ScQ=;
        b=ScA7yd3SVBjj+UOxTa8WzdM6DE3C2efpRS70z/PCSk+0kgfimh1jNF8pwvCgLslZ2d
         ZPl8jnNVHw1jIONs6sWQh71Kky361TD3JQY3P1auh+ret+RplP3z93J3COCGRtb6u8rz
         30DINhSW0Pt4LE4Qin3LPaPZdv2PC2tEfDCBLlAOu/+ZtAnqvsDKpNXtPOCajXFaexBZ
         /ynJbpm4Of/NjcLYmO6n4sApIUi+NbX+08wkYcYuULf+50UKqDUHj7SiXpVZdaHYkKFd
         xEd3kHyE99iOS2B3oIBhdBbeKH99mGvpvJIiOZoDwT9RnjcMPdDibfCjjL0vEvo3G+xg
         bqug==
X-Gm-Message-State: AOJu0Yx/0llItuy3gugM+BLA4+9zKuXpDxIrBpjTUn9aD+kIzdeWeeo+
	c4O4zX1TKq9fs043Ykr3g0ufsTJTX3ux3aHC2B3Q5gx1AZBl4Ra3mKy05Ovrd7hAkp/C/rN2e13
	HHUY=
X-Google-Smtp-Source: AGHT+IFG2z9KXZBmAj7A3s5RGJSXM8N7/IV+rbhN7oWqohDrLDYPTtUPAPZV76y2riDf7k59uDT8MQ==
X-Received: by 2002:a05:6a00:391c:b0:6ec:da6c:fd42 with SMTP id fh28-20020a056a00391c00b006ecda6cfd42mr14135553pfb.5.1713269224019;
        Tue, 16 Apr 2024 05:07:04 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Tue, 16 Apr 2024 05:06:47 -0700
Message-Id: <cover.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198437

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, April 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6811

The following changes since commit 26a878cbfbb3bc7a6e892e105577ebf8138ce150:

  common-licenses: Backport missing license (2024-04-02 08:04:42 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Stewart (1):
  perl: ignore CVE-2023-47100

Jonathan GUILLOT (1):
  cups: fix typo in CVE-2023-32360 backport patch

Khem Raj (1):
  tcl: Add a way to skip ptests

Peter Marko (2):
  openssl: patch CVE-2024-2511
  ncurses: patch CVE-2023-50495

Ross Burton (2):
  tcl: skip timing-dependent tests in run-ptest
  tcl: skip async and event tests in run-ptest

Sana Kazi (1):
  openssh: Add CVE-2023-51767 to CVE_CHECK_IGNORE

Steve Sakoman (1):
  Revert "expat: fix CVE-2023-52425"

Vijay Anusuri (1):
  xserver-xorg: Fix for CVE-2024-31080 and CVE-2024-31081

 .../openssh/openssh_8.9p1.bb                  |   5 +
 .../openssl/openssl/CVE-2024-2511.patch       | 122 ++++++++++
 .../openssl/openssl_3.0.13.bb                 |   1 +
 .../expat/expat/CVE-2023-52425-0001.patch     |  40 ----
 .../expat/expat/CVE-2023-52425-0002.patch     |  87 -------
 .../expat/expat/CVE-2023-52425-0003.patch     | 222 ------------------
 .../expat/expat/CVE-2023-52425-0004.patch     |  42 ----
 .../expat/expat/CVE-2023-52425-0005.patch     |  69 ------
 .../expat/expat/CVE-2023-52425-0006.patch     |  67 ------
 .../expat/expat/CVE-2023-52425-0007.patch     | 159 -------------
 .../expat/expat/CVE-2023-52425-0008.patch     |  95 --------
 .../expat/expat/CVE-2023-52425-0009.patch     |  52 ----
 .../expat/expat/CVE-2023-52425-0010.patch     | 111 ---------
 .../expat/expat/CVE-2023-52425-0011.patch     |  89 -------
 .../expat/expat/CVE-2023-52425-0012.patch     |  87 -------
 meta/recipes-core/expat/expat_2.5.0.bb        |  12 -
 .../ncurses/files/CVE-2023-50495.patch        |  81 +++++++
 .../ncurses/ncurses_6.3+20220423.bb           |   1 +
 meta/recipes-devtools/perl/perl_5.34.3.bb     |   3 +
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   6 +-
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     |   5 +
 .../cups/cups/CVE-2023-32360.patch            |   2 +-
 .../xserver-xorg/CVE-2024-31080.patch         |  49 ++++
 .../xserver-xorg/CVE-2024-31081.patch         |  47 ++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   2 +
 25 files changed, 322 insertions(+), 1134 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0001.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0002.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0003.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0004.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0005.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0006.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0007.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0008.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0009.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0010.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0011.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0012.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch

-- 
2.34.1


