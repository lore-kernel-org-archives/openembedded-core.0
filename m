Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC12C5AD5A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 03:05:28 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11345.1786590320032560311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 20:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kE3iJPSH;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c15bf5000so821651cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590319; x=1787195119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ut8BV08sN0BTkLnbTb81MsyBxXNDHyYkzcCCrTiEleA=;
        b=kE3iJPSHY4QgvSi3KNw7bAsJxM0xcn5XMYhD/duJfgvMx2jXepLgAiYOwy1Xo4Ma22
         N7+bld1Pf8kc83DHSN9nK3wMZBHbdCDwLuruoSyptNMMZXNu4A/H0MKbhAkk/ALoAG0Z
         tvkuaruWmB5Dndu20j3W/lEEkKoafWWpnWFwEM/wYG1w3254IWZa1BvhkeLnawL/04/M
         U7KB8aOf9Y4uVBDXlZ2o26mJzREaJveLD2SHWOJL0ZgViRdtJhErbWs6/jwCzgWSmM2P
         m+I2wAeSib3oho6Gqlqrug2WV6kBVZtSaBWFmw6A4C/GjLutudcibKlxXaYBMFM6fb3D
         E4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590319; x=1787195119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ut8BV08sN0BTkLnbTb81MsyBxXNDHyYkzcCCrTiEleA=;
        b=GOln4R5ETWE9vgxJjxXg+seyd0rnNpvoByreNl3yay4sFvcgzXphoDNrcnyLtvElgr
         2eqBFq84kuwQ+SHpqyqOP7Lftt1Jm//PTsXXh8Jwe2722R/Y8XU5qclLunpfqOFhWxjF
         UoSqP6i3JTB4yaipVvKcbtxm5lyiKGdeMMMEcBPq02xOfAXaaRJCV3DNiX/CsGUWYetz
         i2FrhzOuqM3q9vQbPG0z6CeWB2N3A5LdxKy/1tHYX3398D/pfnQN5C2RhAbGJfZQPe4X
         Ig6vBFBS4qHxI8wWMB/c2hAv9HYd6V3xG5HEwX2Fq61T1W9P/6FWZXw91sp+Dwf4GX8U
         VJCg==
X-Gm-Message-State: AOJu0YzBmnCIfMKhLZYKlV8oWhJRdSSlUIyMih1Ct14n2I4aeexVAH0P
	CgUEjDgyTGTkwBAdmIopOJpYi6SkL8KIHUo2ei70id7AyOVMTHnUg+SlPtlRJcm9
X-Gm-Gg: AR+sD10NqHIuqncdvpj6pwfvYhtcx8ZaUFo5bCwMgjy4+OQq/gCO/xZU0huc1XZXWTo
	2bb719uE2k+VJhbZlOmo70WXD62DbcJXW09HMB5X3n4FsmFBuoA+hCyVPuDGXbZTBt7UyiTwrvw
	YphJpN8vYdwPI5lbuzoG6iJMzd7rOMEoyCCi21O/iu4n657WVDEfZDQ1m6OislNyONVeoOWFfwS
	yiqxr44oX5E5FFGel1GTDlTVmcie0uI2oh3eCuy4FTWtCJ1f3ELdg4wUgt+Q1fjURfL2RfiL1dz
	iKayiKukIiDU+Ir+Yf/BQXmN2rTw0X+FJADvTBHX15plBk+Z0tz7Bw7m2w6jRBmL0TBD1yPcTPd
	aOafDN3Yc9UQFq/M85/lFiIrlr0UfEKnhpHe3biDNQHxAw20POzqZ4IeNN/fnql0fCKEgbfSJsY
	N60amthXy+SzSMoThAfqC0MOzi/+aa9hHT01N/XVItZWalIfl7xrIXr4b1gAoZEbs97MXvYhQ8O
	2HvM/6GVkHgsiXQKFIYhbFQGQta1Dg=
X-Received: by 2002:ac8:5f06:0:b0:528:22:8c61 with SMTP id d75a77b69052e-52d73e3f63amr25936061cf.38.1786590318828;
        Wed, 12 Aug 2026 20:05:18 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73e2e596sm8013921cf.9.2026.08.12.20.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:05:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] fix the SDK kernel module test
Date: Wed, 12 Aug 2026 23:05:13 -0400
Message-ID: <20260813030515.1028627-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 03:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243321

The kernel module test in the SDK test suite does not pass today.

The cryptodev revision it builds no longer builds against kernel 6.18,
and the kernel's host tools are compiled with a pkg-config that the SDK
environment has pointed at the target sysroot, so a host compile is
handed target include paths and fails under -Werror. OE-Core already
solves the second one for its own kernel builds, where kernel.bbclass
passes HOSTPKG_CONFIG=pkg-config-native; the SDK simply had no
equivalent.

These are independent of any SDK feature work and fix a test that is
broken in master today.

Changes in v2:
 - the SDK environment script no longer exports HOSTPKG_CONFIG. That
   half only ever took effect against a proposed kernel change that has
   since been abandoned, so nothing honoured it. The make command line
   assignment, which is what makes the test work, is unchanged
 - the second patch loses its toolchain-scripts subject prefix, since it
   no longer touches that file

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (2):
  oeqa/sdk: update cryptodev to a revision that builds on kernel 6.18
  oeqa/sdk: build the kernel's host tools with a host pkg-config

 meta/lib/oeqa/sdk/cases/kmod.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


