Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AB6C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 10:56:54 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.10679.1705402612851259284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 02:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xro/KLmh;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a298accc440so1190479066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705402611; x=1706007411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJCeNRtESStMTrpp/tM2plw22Yk2iBI4OvudVeQFyDU=;
        b=Xro/KLmhvhpUXu+y+grqpKDVYpNe/HQuUbdjX46brffBY7pY4VBTCakoFwChRN3Og+
         0UGDaLxq+Xf5hwO96hr+eUg/06lOA9EWhMLTFPghHgXQ9WhqfMBOZeccQqFiHb8iQC3h
         /Pzl8scjqFIo02pK15a13wJWCIM7Rg1fSH1ZTHVCszm8vqqmgqfSXAC9/luYEVNY06eQ
         4ImoGrgWdY0NwpGvBR8Zi05pZMs6UFwFLHzDrpRGwUKKcwn2zk+M6scR7rnS942XHikO
         uN83P3BNCuWWdaAk2HAWr5Azr3jDd0lsSIE2YcgBf645CKiLeDLYRwbwDoh9xPVyuIMC
         T0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705402611; x=1706007411;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJCeNRtESStMTrpp/tM2plw22Yk2iBI4OvudVeQFyDU=;
        b=l0bWTdoEKFQ2DBYwdcbWktKr0OIMpOGfcgkK9rDVyV17EPv7/shHrvDlsNfLiupahJ
         LjfXCyo/IH7rz/YYbGsLkO+zUPWokfi4i/Kk5x7u7HvV4IKBbZfH6RLEqYVZ0wfaziVx
         zbAGTmrZMXHusNQBeoE+TTf581o9JHUQW5k8Kx2b/F9mbMYYTEmY7zI8+WuFQ5FuhXqP
         KF7hzyWW94JkYMOeQY8/p7dP2Sg1z3EB4b4ynTc+sIYWr96clbSGL4RCvbZZCXKdspE2
         k17y4kpbjT6oZ/HjHbqlnyqy5RWAAQp7ZuyKSF9GGua58VmUoZbPh5gJRlTKuDS67qru
         ZGdg==
X-Gm-Message-State: AOJu0YyO+ncP4el2e245/nIinpGmRpDZLTfgpCmc9xU90WLaVxjOegij
	TR7zo4m+Omd0NFJWAvKYx4iJDBCEStk=
X-Google-Smtp-Source: AGHT+IFEwtDRD4QpXw8Y6+0Y8S1G2yU6/qpQ6Bg7H1SK+c4FwBOlVW7eQlXFK/YhuHqLf6MDDK1KkQ==
X-Received: by 2002:a17:906:6acb:b0:a2e:559f:8474 with SMTP id q11-20020a1709066acb00b00a2e559f8474mr627039ejs.24.1705402610790;
        Tue, 16 Jan 2024 02:56:50 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id tg14-20020a1709078dce00b00a2cb117050fsm5366969ejc.126.2024.01.16.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 02:56:50 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v4 0/2] bitbake-layers: Add possibility to update layers setup
Date: Tue, 16 Jan 2024 11:55:36 +0100
Message-ID: <20240116105537.961-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193850

From: Jermain Horsman <jermain.horsman@nedap.com>

During development it can be useful to use a branch instead of a
revision, e.g. when rebasing often or just for easy upgrading of
the setup.

This iteration has a very minimal implementation, which covers many
use cases, but certainly not all.

As previously discussed the interface is as follows:

bitbake-layers create-layers-setup
  [--update]
  --use-custom-reference <repo>:<ref>
  <setup_dir>

Note: '--use-custom-reference <repo>:<ref>' can be used multiple times

Based on previous discussions, this implementation does not check
any input and it is left to the user to make sure that provided
references are actually valid for use by git.

Valid references are git hashes, tags and branch names, there are a
few things that should be noted:
- On systems without a default branch, using a branch name that is
  known to multiple remotes will fail.
- Using a branch name without remote will work, however after the
  initial checkout this branch is never changed as no pull is
  performed.
- The layers setup will be created successfully even if the reference
  is not valid.

Another thing to note, a possible extension would be to add an option
to update only selected repositories, this could be implemented later.

Changes in v3:
- Moved options from lib/bblayers/makesetup.py to
  lib/bblayers/setupwrites/oe-setup-layers.py.
- Split '--update REPOSITORY' in separate '--update' and '--repository
  REPOSITORY' options. Specifiying '--update' now selects the old setup
  config to be modified, without it an entirely new setup will be created
  and subsequently modified.
- Updated test case for the new options.

Changes in v4:
- Combined '--reference' and '--repository' options in
  '--use-custom-reference'.
- Updated option descriptions.
- Make all error reporting consistent.
- Updated test case.

Jermain Horsman (2):
  bitbake-layers: Add ability to update the reference of repositories
  bitbake-layers: Add test case layers setup update

 .../bblayers/setupwriters/oe-setup-layers.py  | 79 +++++++++++++++++--
 meta/lib/oeqa/selftest/cases/bblayers.py      | 53 +++++++++++++
 2 files changed, 125 insertions(+), 7 deletions(-)

-- 
2.42.0.windows.2


