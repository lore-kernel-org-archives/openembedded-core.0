Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C96C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:39:33 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.47204.1707932366381660895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZE/A2Fm;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3cb228b90bso379679566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707932364; x=1708537164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea3ut++mYj8rS9g9iVl4LPCbMz+hSnfoXyRXMJuJFtc=;
        b=XZE/A2Fm9rH8nmdVTq6g9QUNlsJ6WxZtXSHrMjeuc939Hkc4kAvEiy+MJsKhAcn5Y+
         x0C4VQP44UsdFFU9iHgGzkMvoJFUclt53Vnx5coQbb/GkZVzG2mYnaJY3Gpnrn8q4WwB
         JdCPDHXi0QeypFPEVG8fN38LGIuhYnAg6oOOG3bXwbe8JxWx+miONcigzvVMmnHMkTBX
         SgzhOdFrRGPtCRl21EgT83nKmtWJGQHYRRJaRYBrNakRnZYxA7PZ13W8k5RiwqR20jeJ
         D6KQFvuXhjRpHFlqgSWcwoAWNCVg2+QugHzK/eif2lCw/cTZolriU/5h2t4sdXcx+57Q
         9++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707932364; x=1708537164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea3ut++mYj8rS9g9iVl4LPCbMz+hSnfoXyRXMJuJFtc=;
        b=GVefh99Kdc77l8maMxffhXDfr6gX4O6ZK3jWfIqx/G56QroPTFBnVCVPW5QV0BFI7y
         hZ5UpHbyBdmHcpDjbiEUlSHk2b/aVLG51evZFqk97lK9ApbbEYlfZuUTt8y/x+nJS97j
         JekR/o2etK7EMPz0JmlL63budGtZMWvuYHwLZZI6Vu6v28v/vANFRlPVzxJuLMI7UmsT
         6OyBXgd/JX7c/ZlTue6BWLbnf76u/+wMQORiO7sh51KC9MSEB0AMS09VRknYfCa2GSUW
         fjzYMONr07JXxM5OYz36eUlBJfd12lt1r5zo711LNzXlEukYC5q7ixhfcfAi/nMO8tLZ
         KrbA==
X-Gm-Message-State: AOJu0YwQx+s9N1xS8geIVA7WJ9cCSeFfALXDPfnwZFJIdRGWHACFwbBm
	xgO7Uo1S07DVd/Z873HHkab5mkpUOJEv5OmiHRJ7tEO5w4uHiCP/P04aMBGb
X-Google-Smtp-Source: AGHT+IFaKYCFQRPQpitN80ZrOGTJB4fBfXybLb9vu7efM1mCB9A+6XZ6thVrICdfXaEKDmzUieT3Gg==
X-Received: by 2002:a17:906:ddb:b0:a3d:125b:d221 with SMTP id p27-20020a1709060ddb00b00a3d125bd221mr2409499eji.26.1707932364213;
        Wed, 14 Feb 2024 09:39:24 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id sn24-20020a170906629800b00a3d11feb32esm1616403ejc.186.2024.02.14.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:39:23 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 0/2] oe-init-build-env: generate .vscode from template
Date: Wed, 14 Feb 2024 18:36:57 +0100
Message-ID: <20240214173914.136799-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 17:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195486

Changes in comparison to v2:
- Do not integrate with the oe-setup-build or templating infrastructuure.
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

 .gitignore              |  3 +-
 .vscode/settings.json   | 32 ---------------
 oe-init-build-env       |  6 +++
 scripts/oe-setup-vscode | 90 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 34 deletions(-)
 delete mode 100644 .vscode/settings.json
 create mode 100755 scripts/oe-setup-vscode

-- 
2.43.0


