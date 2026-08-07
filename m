Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B439FC5AC80
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 00:17:57 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32737.1786061870678207720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 17:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ftv3owbU;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-936623c6dd3so61844285a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786061869; x=1786666669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRJ5fL3OQ2d2/er9HyB2guPJ5kX4mMD0bug2K5CojCQ=;
        b=Ftv3owbUbQ2RBHdEdlnScFQ/3yMJFcHX1Hhw/+s/G77JKUqtwAyoYqSbYf02ZXxq1m
         89tpQKDrmv0VMZ1Koq5osYombPNqSuxozH1jiUVeahPewsQQ1CnnGZ2XdGph4vEJQs63
         J0MSUb9n4mWq2bAq/993ar6jBDbIY7JA9+cBLWrTulCuv5HILkunRw2YR7AjXH8L+Zqe
         5LN/UIBMSUPX5yqMGrzIJa1E9VhKTeYbgJNSvDU6NLB4xQStGp8uR+iFN6NZPURQqf6z
         mh4+b490zrJGAvNuiFDM8/2Irx0j3WLcd1FJoNom1Qjdu94BiIlN5kMXWS7k0P86AD4q
         7b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786061869; x=1786666669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XRJ5fL3OQ2d2/er9HyB2guPJ5kX4mMD0bug2K5CojCQ=;
        b=V4F8ObKWBqqRHhVBVB3GN6LiogpFGVJhe1laxwxTobm9x5gitvz8uZG9ABSIdRpLcA
         y75ZqnFh0BoAiw/Pczb1WfUTufJOwK/44OZ99M84xsarJ++6KWo4cM+GbrNKALkmYjek
         G+1wsQMLt242ze+iGhPpPRMUPHGZGIMS/fSwKTwqZ+Rg9nIo5lAcipqL1o7nu63t/J8R
         +cVHsF61Hs8zx9qyEKxRYSnMc+3f7Z/NCJ6By9jKNbtePpCuXb5nJXyBLRnQAu47DXFm
         a4dNoqLJHFrRpJB9G38lz1i+Zl375loY+CyMf7oAAAUvc2mSKDiyoTBGtAUPhDenDPeQ
         sihA==
X-Gm-Message-State: AOJu0YxKfU0/CkYjUHTSsRpy9dLOeFs83mcnh+aG12sRbdUPXr6loj+G
	ny5L3+W7efUjaWcDeqamukRne1T7sa937sLrIy2M1C81cC64VFW/qpelNmp5ExXH
X-Gm-Gg: AR+sD11xWiZKRWYDFRr08jVJCHSqB7aEBl2224NlQ68eZb5bTMQZFX/sxSepvyYsdGL
	xRLkMNJjGyR9XNIcgbXicfZrcAsJfZWmUis7DMYtFXlafsdrE4tDKLgWNcbny0Fv9w7oee33JFu
	NjkcvFn37V9v2mk8WC11LU7aVD+xiA5bT720a3NA0R76ODRI6hbew4ZCI8SoyJNEhxLWcS9vmmc
	lRSR6kJbDEEgkAkVd+OsHXQOaq3iCalCKQGGsXqImkqltdljqBLwsSDgKJD0NYRU0QoXnUkSwm1
	MR8xkrzE/ZAMX53hZpxrZADS6X2Kt5LhAMbJ0+jDqT/HH7aYHI0Nl+NdjHkHOluYz+Sjaf1kW7W
	LKyHYjLPsx15tJfony46GGC/aXxu7hG14IrfRC0gqnwwZx8FtK2/WNJZOmnJCCDGF1kqJDgy0Kz
	g7tyTy88XdCLjDEb6vkG0REiu4EeRtvB+UcqwHNRLzcy6e8jVQkBuXKLlYRzfhRSzctsRLmgQ1g
	lyqzGRujt35yt08AGztRM7wWeA/EnsrK6y7B2w7XQ==
X-Received: by 2002:a05:622a:4d0f:b0:517:5f04:f23f with SMTP id d75a77b69052e-52d0036e6a1mr97456641cf.4.1786061869449;
        Thu, 06 Aug 2026 17:17:49 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d160da94dsm993411cf.0.2026.08.06.17.17.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:17:47 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] add an SDK_FEATURES lever
Date: Thu,  6 Aug 2026 20:17:42 -0400
Message-ID: <20260807001744.3874352-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 00:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242971

SDK contents are close to all-or-nothing today. The one lever that
exists, SDK_TOOLCHAIN_LANGS, has the right shape but only ever covered
languages.

Add SDK_FEATURES, in the spirit of DISTRO_FEATURES and IMAGE_FEATURES,
and fold SDK_TOOLCHAIN_LANGS into it. BB_RENAMED_VARIABLES keeps the old
name working.

Every SDK_FEATURES test resolves inside TOOLCHAIN_HOST_TASK and
TOOLCHAIN_TARGET_TASK, which are packagegroup lists read at populate_sdk
time. Nothing in a compiler's configure ever sees SDK_FEATURES, so
changing it rebuilds no toolchain and two SDKs with different features
share everything underneath. That property is the point of the design and
the rest of this work depends on it.

This changes no existing SDK: SDK_FEATURES defaults to empty, and
BB_RENAMED_VARIABLES maps SDK_TOOLCHAIN_LANGS onto it so configurations
still using the old name keep working.

Changes in v2:
 - autobuilder.conf keeps += rather than switching to :append

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (2):
  bitbake.conf: add an SDK_FEATURES lever
  sdk: fold SDK_TOOLCHAIN_LANGS into SDK_FEATURES

 meta/classes-recipe/populate_sdk_base.bbclass | 21 +++++++++----------
 meta/conf/bitbake.conf                        |  2 ++
 meta/conf/documentation.conf                  |  1 +
 .../yocto-autobuilder/autobuilder.conf        |  2 +-
 .../packagegroups/packagegroup-core-sdk.bb    |  2 +-
 5 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


