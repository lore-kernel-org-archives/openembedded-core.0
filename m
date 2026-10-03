Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A62CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 15:16:26 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7508.1791040578671339975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 08:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N1x9irdb;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so340535a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791040578; x=1791645378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRo4vOIP1LgBBzQED4i/I5NGCHWD+DC8wF7Ztox1UPE=;
        b=N1x9irdbF/RZ9Rx/rdALIwapXOBWtWdQBUkeOOSMgHSeLdpeHjrGZym7L6fMYM5caO
         44csOQD69lj30IW4ts8AlHv78Lz1KF4sbl18RZNF54ZM54Ef3ZeO7lRJJ/BWQpsy8y2o
         Zqj5ykHPOHgonpOBMtKv2LcIVGZq0DjOOwYhxTAmUkhqVn5qppu4DofR0bRcdF5dwlX0
         64P8FzbLXqWDKaN2ThbQ1yIgcUgbatpPaNk9w9a3eHQHs0Qi2+IWYvSwH10RhiTMuz38
         jJzCsfAoSaF3KaxZSzDiW9a5cChNUzYAVzMArmK/58W6YZV+s2uT3KbsxVCyoRTvpcFs
         h8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791040578; x=1791645378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRo4vOIP1LgBBzQED4i/I5NGCHWD+DC8wF7Ztox1UPE=;
        b=qLQO/l8Sa21Bh+fK59bfOjDPJLVtw14wAxv0y744LkTPh3Dyrd+4fXaRu2JIVpNYsl
         3LkCsOTgwfREowe/r5aAe55WbE6W8DE4kzEpksE5gaoHLi9lIWDRabGNGctwizFCgt+m
         soahzzqsOmpC8mwhiPYlHCh1uQDpE2XmA/POF08o7S0ZkFupwrMlgyjzegkpaBjtmhsJ
         SfSKOOaGsQx6DqGXbuZq7OjHX/y3FFzdAB7bQv0oTOqPu0qCO2cTYzpl2vaX/SXcUhdo
         NgRH+8A6UvTxOl5BuvqutJqH+KkERbgq1dlnDJZisUHV461SjcwKxJ3GNQd0xwm9nkt1
         ZB9g==
X-Gm-Message-State: AFuF++lV+QakimTKCyafByF2PeF54xTZyewoUvT1F4Lq8YsnU73VCDmE
	03Tv5+wgxmptOj6wufnWMRdY6kwalXMe0BcarSoM6W0a8tgTzzqj5b40mI0dQvfq
X-Gm-Gg: AYBFou3JLT7tYjynSc+Rmm5ufDmVm3Hz+OTEQ+wFPe9icOSNjr1e1LEcF3vBqy7Ul6K
	t3qmJDtE1bJ+Qk0RQ23rzxg3PnV/Kz+bkatNSGuVVsrXcCywBQfInG6d/CiPqiR91tSnmzmFHkb
	lKhces0IrDfWnJHxy3kfgrYhMg1hevk04MZo7bXGKr/3kHGwceG80NGGi84CBcWWx8kLsUYkHPv
	q3ozhkl3h7PcmhbZQICiK1AZwn+1Dj1Iy6QpPU/OoiAAaWnds+mUhEbCfswbsVB+v0mnxHv+GKo
	hXbJ5ZY5KnntN3StzuX3239nrac6fLEi2pL3uSgsUD7X2IgPM74S7q4rQlh46cNhoj/XUyPcJ+X
	JfOmS3O3mLYgR/2QsedkYvO6ZUzYfkz6eH8s6HDbOZdM+dqF0her0IXfCfsGs/W7skl6M00kuaK
	p6z9oqereU6pKVtOmCNQQmynA+9WJY+rTDg3/vpbdB8FbFKtaNxLBUfIXWMkKM1sviHKCw/dHZf
	V3cdge5sD73fz4=
X-Received: by 2002:a05:6a21:6e8f:b0:3e0:c334:52a0 with SMTP id adf61e73a8af0-3e0d6b4913cmr2899986637.49.1791040578030;
        Sat, 03 Oct 2026 08:16:18 -0700 (PDT)
Received: from cfarm422.jing.rocks (cfarm422.jing.rocks. [2600:3c18:e002:2e11::c422])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7355535sm2165950a12.5.2026.10.03.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 08:16:17 -0700 (PDT)
From: Jagadeesh K <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh K <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH v2 0/2] Add support to compile source for multilib in the eSDK
Date: Sat,  3 Oct 2026 15:16:09 +0000
Message-Id: <20261003151611.2218124-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 15:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247160

* Install multilib toolchain in the eSDK if multilib configuration is
enabled during the eSDK build.
* Search multilib manifest files to populate multilib packages such as
lib32-gcc-runtime during the eSDK installation.

Jagadeesh Krishnanjanappa (2):
  meta-extsdk-toolchain: Install multilib toolchain files in the eSDK if
    multilib is enabled
  staging: parse multilib sstate manifest files to install multilib
    packages in the eSDK

 meta/classes-global/staging.bbclass            |  6 ++++++
 .../recipes-core/meta/meta-extsdk-toolchain.bb | 18 +++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.39.5


