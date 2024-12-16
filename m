Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38795E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:44:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.62662.1734371059012223044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U28Uh/u5;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863494591bso2384842f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371057; x=1734975857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FSnSCCwbJ2A5qS8M+GfAMkm9FaQWazkoOPbTcotbN4U=;
        b=U28Uh/u5h44GP2aHreL4AWLs7xk10/YOmB3mHTsfO0DXvymzEdHgpMQcia46kAQ9UQ
         EuaAhlAP1WpzWh01Av5/yoJk4tNnqAYsf+0Hh6Gioq/5EvttMUQ/vU5wArFkqt0qO2bh
         hera2JMsBH4MoVk1viNdcY8x2kaWMHWCeLNQC6ZEgx7NZ0exRto/hs54b0lLPMXQodYj
         KVtwmODFMkOlG3vfOyj6/XR9YPTH6OPOQrMNtbng+878J9aMVR/fYaZfMZw6QPLg2NEj
         EQDF5vxHOJgMOIWNDZTu2dsJOcOJFxBXef/Pc2gdPCchPGKBw+zBNt8ysvCly3bTTiym
         bn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371057; x=1734975857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSnSCCwbJ2A5qS8M+GfAMkm9FaQWazkoOPbTcotbN4U=;
        b=KG4oG1DuWe/1JEPsq+tgx/E5oFz23f7xjHR2vVfSkPo8mIuwhny2Vwc3cd7zu/PvJ/
         dgX0c7KLhOOP1qe0t6Qfrb9TAV5xAaygkpYMmZp1WIEM6obaJ+J9oefbkDy1Y6hQkZQd
         E9MFEYQhSSQE0O1VmnA6CUc/YV0ibRLf5nTEu5rl1gr+t/cfuFS1vpnRDxT0v7g3q8Qc
         Cm5a3Au7n2eBe/dq69siJ6++f58Hd2yFjqB/2hUGhTEfpzzbmbH5OpzWN03o9HWFIXem
         jtKnfGL3riqA0LlAZH4j5up4c1GGjzewXjlgTSOWqpcxXyQiiQQLuFFjQrzzcHIAY3Fk
         76ww==
X-Gm-Message-State: AOJu0Yx6Bk03zc055d5A8dG0+qyohGlLmd5ijL9OV8K86v6NNdIEtQKI
	xU4vmadFvP6ebFcYi2iA4/UB/IYmm4lsONTnMyBLUBwyfbOoQ1TBSHYVsQ==
X-Gm-Gg: ASbGncsH4sDYxKPqZGLh3tPS7AtfyTKssuxeNq54JpEO1OuUF4pcSFyz9E8hxQBivim
	7LNlbsCqZLCgvPNI6dOFsLtSslDEb7wG3E4GDxBkDATv3KhlcIJuJ+PokA1eO7hymqCbm9k8x0x
	o8makaSfrMJFOeuQo0YoRsHx7ryC8AOtm1UpmnZLKcqJQnbvT5eheSucwPt6X11JB0oxaZHA4cj
	OWQH6f0dRg34h+6ArWinrTNnqRrcopAwe1H/197jojvZR8qm3D+8AVQGfRsZbFXoEhLoMdrAjtU
X-Google-Smtp-Source: AGHT+IFSZTGm02iLkahglZmeaArIW8aAPRlcmn92nODcRizwE1F6gWPFIksyeBMQufvoXlid3feEBg==
X-Received: by 2002:a5d:6d8d:0:b0:387:86cf:4e87 with SMTP id ffacd0b85a97d-38880ac7490mr9897862f8f.15.1734371056864;
        Mon, 16 Dec 2024 09:44:16 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c46sm8892338f8f.71.2024.12.16.09.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:44:16 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 0/4] devtool improve debug build configuration
Date: Mon, 16 Dec 2024 18:43:02 +0100
Message-ID: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208785

Add a new command line option to devtool modify: --debug-build. With
this option, the bbappend file created by devtool modify contains
DEBUG_BUILD = “1”.

The --debug-build-config command line option of devtool ide-sdk,
which does not really work anyway, is removed.

Moving the initialization with DEBUG_BUILD = “1” from ide-sdk to
modify simplifies the implementations considerably. If the user
wants to change the DEBUG_BUILD configuration, the bbappend file
can also be edited manually. ide-sdk now issues a corresponding
message if it is called with optimized compiler settings.

It would be nice if Yocto Bitbake Plugin for VSCode could also
support the new devtool modify --debug-build feature.

A documentation update is ready on the branch here:
https://git.yoctoproject.org/poky-contrib/log/?h=adrianf/devtool-ide-sdk-debug-default

Adrian Freihofer (4):
  devtool: modify support debug-builds
  devtool: ide-sdk sort cmake preset
  devtool: ide-sdk recommend DEBUG_BUILD
  oe-selftest: devtool ide-sdk use modify debug-build

 meta/lib/oeqa/selftest/cases/devtool.py |  2 +-
 scripts/lib/devtool/ide_sdk.py          | 54 +++++--------------------
 scripts/lib/devtool/standard.py         |  3 ++
 3 files changed, 15 insertions(+), 44 deletions(-)

-- 
2.47.0


