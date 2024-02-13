Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D382AC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:19:07 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.27558.1707862745238345398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdQBol77;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so6590035a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707862743; x=1708467543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MsqGznnQs3XZR2LsbPz6Jf2ivH6ICuviHr9qeXoZko=;
        b=NdQBol77FoXB3zTR5QzF5/EsI/usKcv8P/RXGktuTF8CCeFdZlJsr3ipeCX/sfdofc
         PWwyNfa9adwcO7xpLoAAt1LHeyq75NtiSBZ1qIglN8P6h2B/CQ1cuxxGnm67HX8rvKoI
         mNAOHQW5A/dh86AV/zkbvkFW2HjoISaFQEn3ijdbeDeKHCDd+StI8YdJCFisib+Z2XBo
         CJBJn7WE2kxpU8v57KxpFV+znYB5J6cpyDtfN7dXqRMCk0iANPiWICPNwF/MEFkUsyPR
         o17b+V2lLMxJDE0yj+AVZezw7hkcPyUKJGMkmHnF6vVORGVq7jfJ/PBYyfYqqM7ETe8a
         wFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707862743; x=1708467543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MsqGznnQs3XZR2LsbPz6Jf2ivH6ICuviHr9qeXoZko=;
        b=Y9TmnlZg9LmxfhMPprAaZiZkFejDc6InGYo8fRBzzbSAjrbvxqLsiC54IXQ7GzqQrr
         MSrL7BZH2QKtcMMCKAJ7UydzS54QscNY2mUhCXkYfzvN324RX8vAoY1rj3DwfjNx1GB6
         S5FW3E226WLzhkbACT5HoAHBCFq0i6zkUH8rY6YTq2l2EB7hWrVJDi5M93DVP00NP05A
         8WFg4B309INvyuWzd248npZ3upPJX9dZPrf8lBy+sg+TuJYUNgje2yFIBwglxMhNIkcN
         dDfHYwCWJRXAIQmPTMNb6v/Z8lgjzxkGuR5rjvKu4BKk5R2BFMHn691SqJtcba4FdIXG
         AX1g==
X-Gm-Message-State: AOJu0YxJ4PW1Avb7wDMU86aTtBE3qpNklWMRCt2HVkwNGRNPfwxR8Ste
	Y4SbUmmqP09q7hP43R8AHX4JTw5cKd09oV9smfoxcDcbH1VS78Mcbk1Pl7iz
X-Google-Smtp-Source: AGHT+IGUBbEx0Hqgk2RIL62UjLNPS1gmtZ+j01AW7eVnOuI3OlopnHtG5u8xFO+opQhrm/YvfD9Zog==
X-Received: by 2002:aa7:c1d4:0:b0:560:6469:a190 with SMTP id d20-20020aa7c1d4000000b005606469a190mr619979edp.30.1707862743153;
        Tue, 13 Feb 2024 14:19:03 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b005612987a525sm4027137edx.89.2024.02.13.14.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:19:02 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/4] vscode: improve settings for new yocto plugin
Date: Tue, 13 Feb 2024 23:18:04 +0100
Message-ID: <20240213221846.109260-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195439

Changes in comparison to v1:
Remove the settings.json from Git and generate it with templates,
similar to how the local.conf file is generated.

With these patches, VSCode and the new plugin from
https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake
should work without any manual configuration once the oe-init-build-env
script has been sourced. VSCode is also configured to not index the
build folder and finally crash with an OOM exception.

Without these patches, the issue is that the plugin automatically
updates the .vscode/settings.json file. Having the settings.json file
in git and a plugin which modifies this file is not ideal. It can lead
to anoying situations especially when working with git. For example a
git stash reverts the settings which are automatically applied by the
plugin. While git stashed the settings.json file the plugin immediately
changes the file again and tries to run bitbake based on the newly
generated settings. When git does a stash pop the restored settings.json
file conflicts with the new settigns.json file which has been generated
while the git stash took place.

Just removing the settings.json from git would lead to other issues as
already described in the commit message of 5ff688fe29. and the plugin
needs manual configuration.

Discussion is here:
https://github.com/yoctoproject/vscode-bitbake/issues/95

Adrian Freihofer (4):
  vscode: drop .vscode folder
  oe-init-build-env: add OEINIT variable
  oe-init-build-env: generate .vscode from template
  oe-init-build-env: generate .vscode/extensions.json

 .gitignore                                    |  3 +-
 .vscode/settings.json                         | 32 -------------
 .../templates/default/vscode/extensions.json  |  5 ++
 .../default/vscode/settings.json.sample       | 47 +++++++++++++++++++
 oe-init-build-env                             |  6 +++
 scripts/oe-setup-builddir                     | 46 +++++++++++++++++-
 6 files changed, 104 insertions(+), 35 deletions(-)
 delete mode 100644 .vscode/settings.json
 create mode 100644 meta-poky/conf/templates/default/vscode/extensions.json
 create mode 100644 meta-poky/conf/templates/default/vscode/settings.json.sample

-- 
2.43.0


