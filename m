Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ED4C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:55:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5840.1708037755149654732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmdSmQr8;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33b66a7f859so490342f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708037753; x=1708642553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUhe4CcgvKavqOr4QbLBKqc/kYYfGHJkc1cdLmOWZ/E=;
        b=mmdSmQr8PFna+JVp/XXA+OM+pK3LcnPlJvWOgq2XHJGUzOC4FcHGDkHjSBx+gH9+5y
         Uq/HoDbRekv0ZkyPh1AWj7apCNh2JGz1po/78m4AJYohDAAZQpUV0RaMkkRYydPAMnIG
         Xl4VG/1P+QDGwXM38H3JX60+4JJLDYNM3jKGLXjZEi3VLSeoPlVZOKoBv3uszsLjOfdM
         AG5MuLqX9VdIU5b2+pq6H/u2CObgqpsPvj2llauOyGHKSpa0IhDCwyzfd7VkoRSB0Hi0
         FBLnjM6qd52UFtMIKHDXj2dPVUrdtQazKS0PQW9aUDVVApvniIKLpeIO29EMS/6MWlLJ
         Oo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708037753; x=1708642553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUhe4CcgvKavqOr4QbLBKqc/kYYfGHJkc1cdLmOWZ/E=;
        b=NRJ+JOpn38XorlTPeCoC+Ya4in3iA0gNRJqHs4RWQkRseDw4mXJo0PH224suzNceue
         fmP/bmq4BwaAbi3/N5Fc69pX777/ahz+B21gUs0gAqp2IEopZm4keK4gSi0aN6qOZ+ET
         +pTlbgjVI2R3D6hIb8H0WRufp4deiFzG1C61aNnL7+zVO1kdnfw7bXbHtkOv9LhhTYHB
         2CpkXOGs22+lVZH370mQLHznEWYuc1NcEaoPnKUNVQOa49EgTD7DF/x7kKhN6nlZV28x
         YwCOFnOEG+6We4GvAZLqfQ4DWiVP2cSPYx1tOErqOGoBwFQfHwTIvTqxROBBF7JVHo7K
         z0fA==
X-Gm-Message-State: AOJu0YxxHQKVdlmabXbZYuAIJBPkx7mAb26+2G/LzHW/KdjoP3JZ0V3K
	JhzZ+JX9qyLcEpeHnABxws47ZKdy24L4cqjEcKVo87IMwXesqAUsHlHlpH5qUaU=
X-Google-Smtp-Source: AGHT+IH18iIc4ENPb406N+ePiehnR/8xQnMlFQ6Lu1rieoVgSOOeyxfcSQwLXbcVB3waWpU53qbA3w==
X-Received: by 2002:a5d:430d:0:b0:33b:65b3:e51b with SMTP id h13-20020a5d430d000000b0033b65b3e51bmr2514391wrq.48.1708037753142;
        Thu, 15 Feb 2024 14:55:53 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d40ca000000b0033ceca3a3dbsm419778wrq.2.2024.02.15.14.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:55:52 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 0/2] oe-init-build-env: generate .vscode from template
Date: Thu, 15 Feb 2024 23:53:31 +0100
Message-ID: <20240215225542.337490-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195725

Changes in comparison to v3:
- Add more plugin settings as suggested by Enguerrand
  https://lists.openembedded.org/g/openembedded-core/message/195505

Changes in comparison to v2:
- Do not integrate with the oe-setup-build or templating infrastrucutre.
  Provide a minimalistic script which is just good enough to generate a
  configuration which fits for poky.
- Some details will be fixed on the plugin side which allows to simplify
  the generated bitbake plugin configuration to a minimum.

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
already described in the commit message of 5ff688fe29. And the plugin
needs manual configuration.

Discussion is here:
https://github.com/yoctoproject/vscode-bitbake/issues/95

Adrian Freihofer (2):
  vscode: drop .vscode folder
  oe-init-build-env: generate .vscode from template

 .gitignore              |  1 -
 .vscode/settings.json   | 32 --------------
 oe-init-build-env       |  6 +++
 scripts/oe-setup-vscode | 93 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+), 33 deletions(-)
 delete mode 100644 .vscode/settings.json
 create mode 100755 scripts/oe-setup-vscode

-- 
2.43.1


