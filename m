Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53600CFC5EC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 18:44:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.52001.1728585867756672583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 11:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hmraNKdF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso1116247b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728585867; x=1729190667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5PAKwzzgfdvxhuAEPRQ/LAMPhmMw0wx4nbUeKu5CAw=;
        b=hmraNKdFf0B05oDlZSpjnyUbdkhGfYMHePQeX6Zhxfl2BrzkFdpcWv13wq2f9YpUcV
         Z4yukHVhV/mjD+XHd50yrgJwchtcWhmnvZx1aquHC2KUxGuW+c12yDY2tgrkWB0EP65n
         +HC1OwhnwcVDeTFK5Mj0MTG2QUlx9wjmEEA5KmVXvbcVE6PfrYwG35ioWr8eaWQ9BRhe
         NXE+adbRK4AmtJLQiCuhpVoEYR02tXS1LFeFe0JNWj7f7BS2Q4yqrKYvHfcotQQsXQvJ
         JTOoAGdkxnWKF1PZcx9LsYftHE9ZQOSreVk5dtaqzfiVuYcX/AabVflr0WV6yG6oJ50I
         1idA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585867; x=1729190667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5PAKwzzgfdvxhuAEPRQ/LAMPhmMw0wx4nbUeKu5CAw=;
        b=j3/ZmaQo3tUlG6/wP8DhCgC6Tpr9rIQuVT/GzFnTKSyguITEQJM5XcS4ltBcYWh/lU
         SH4IwQvJBWD6iTd5iWn+1/pBn8SkGHGnMQENNNSO16YDJ7T3CymM99tKkILXEqSZ0Hyi
         NC+dra2biWQYLc0XNpYGfWsMrLH8uA4FY1paWTcpxytFrxes2m76Gp6P4HQGPU6q0NHf
         CFJpB+5ZY/ysqT3ZViZ2lV5b/WriiR28G+tZqiHfJ+wy1H8/vf96kbsDDouJ5X/bYc6r
         Cq6u8aK1IsoGb0fkc1ZUx+ZKWJfuulNOz5lp+UsKgxW4SnSKPwVffm9JFTxqNmkFqCzq
         RJ2Q==
X-Gm-Message-State: AOJu0Yz4gwcJTH68oBKsZV6LJ3pNEnYPVwDXGvXxOu+CaEtYRIOKS9E5
	4igTx5vgX3tnoVMt65PRedW2v+1Efrg39SWqluDo3XmOxgKJWfNdUpx/A5jN9qyZ9OMtpGLLgf8
	5
X-Google-Smtp-Source: AGHT+IHIqjeO+poYxMofjLT4n5bO9VnIEAbBkXYHimP3xSyEwvF8O4gqdbX/9U5e94YUrpMN6OQVdw==
X-Received: by 2002:a05:6a21:460c:b0:1d8:a6bb:275f with SMTP id adf61e73a8af0-1d8bbc1114emr551348637.45.1728585866727;
        Thu, 10 Oct 2024 11:44:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa9390dsm1331454b3a.129.2024.10.10.11.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:44:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/2] Patch review
Date: Thu, 10 Oct 2024 11:44:19 -0700
Message-Id: <cover.1728585736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 18:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205423

Please review this set of changes for kirkstone and have comments back by
end of day Friday, October 11

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/246

The following changes since commit 4ef9b4d947b6e8ed7637cdd9e722c3f0c83990dd:

  zstd: fix LICENSE statement (2024-10-08 11:49:12 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Steve Sakoman (2):
  valgrind: disable avx_estimate_insn.vgtest
  selftest/runtime_test/virgl: Disable for all fedora

 meta/lib/oeqa/selftest/cases/runtime_test.py      | 2 +-
 meta/recipes-devtools/valgrind/valgrind_3.18.1.bb | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1


