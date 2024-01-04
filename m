Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA1FC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 12:35:42 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.52894.1704371740930500647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 04:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGD6n3gS;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: jhatnedap@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4283ad9e7cfso2273711cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 04:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704371740; x=1704976540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nf9EdehG/3i0xJnPgal1eiIvUpEidFPe274Dnfsqcw=;
        b=fGD6n3gSGjklikHh4whpi+DJ8+PrbJ5fqtDyATibl6dtlowCZmpdj7XIQ7el1jkf/o
         k985s+T+obl7PrzR4jkdXoeSg8mhIcFz67lxU6Row8ftxqZGFmcjvC+3o5qV3di3h5K5
         7q1GDV6/RIHovo/EikEN1XgPkAcSKR/Q9cQYLA9VOQb3EmKCad5BFQiZBsYiAqNe57Z6
         hFvK+U04UbLdY5mT5maeXhX7E/OUgtU+nUgmvi/ir+702DOZCvdJgeIKTen/EUf4s3ig
         LvWCa960CJXIHEzL/NIxjiyqkp7Ucrh3uwrqd/zwOYYQkQbG27rWSgAm8QWeT+xMm3oR
         BHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371740; x=1704976540;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nf9EdehG/3i0xJnPgal1eiIvUpEidFPe274Dnfsqcw=;
        b=uTRitoccvtBJeDFELmfW5dMxVfFl+6BghildOiQ8ijC4j5NEgTsOd1qoNlJ494ZH+u
         BCeb3KgC7DnhAIvyLfs/9WGf3SC3wOGJMivWyGfZg7X9q74AArKQG8F3y+AIJ7rw3GsR
         zW2vJRS3yusko0oExEbiEER/ANEi05d+PEMGZCFHyQbW/QEsxUuCqVvjGxxVKvZzyF21
         pnxz10Igs/JTiOJlMvzB8vPJ9x8wy9WH0Qi8V7sIIGTwLJchHWjBWZp1amkHXVxWFFb2
         Y1odPWX6pKXbPE1EqAKnx0SWPVSGUfki6tgkZLBzyjdMj6wLCtyyLmHkCaSA7akA+dnb
         3xNQ==
X-Gm-Message-State: AOJu0YzXNkMrzrzT7IEx20ZgLew4t4+ptXNfUdPgkJ/Ys0M4A2i7swlw
	CbBYscGW5TgJHiJyehwLrjipJ5bPQyo=
X-Google-Smtp-Source: AGHT+IHrkN2OPrx8rz++4x0/zIaWeYwo7o++8dxUwetDrope+7lCiwjokzFWsCEa5MzHzkbWd5lQ0Q==
X-Received: by 2002:ac8:7e82:0:b0:428:1ab8:5e40 with SMTP id w2-20020ac87e82000000b004281ab85e40mr555838qtj.24.1704371740015;
        Thu, 04 Jan 2024 04:35:40 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id i11-20020a05622a08cb00b004281ce041f6sm4516537qte.21.2024.01.04.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:35:39 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC v2 0/2] bitbake-layers: Add possibility to update layers setup
Date: Thu,  4 Jan 2024 13:33:16 +0100
Message-ID: <20240104123420.932-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 12:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193316

From: Jermain Horsman <jermain.horsman@nedap.com>

During development it can be useful to use a branch instead of a
revision, e.g. when rebasing often or just for easy upgrading of
the setup.

This iteration has a very minimal implementation, which covers many
use cases, but certainly not all.

As previously discussed the interface is as follows:

bitbake-layers create-layers-setup
  --update <repo>
  --reference <ref>
  <setup_dir>

Note: '--update <repo>' can be used multiple times

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

Another thing to note, currently a reference is required, a possible
extension would be to make this optional and e.g. make this update
only the selected repositories, this could be implemented later.

Jermain Horsman (2):
  bitbake-layers: Add ability to update the reference of repositories
  bitbake-layers: Add test case layers setup update

 meta/lib/bblayers/makesetup.py                | 11 +++++
 .../bblayers/setupwriters/oe-setup-layers.py  | 43 ++++++++++++++++---
 meta/lib/oeqa/selftest/cases/bblayers.py      | 26 +++++++++++
 3 files changed, 73 insertions(+), 7 deletions(-)

-- 
2.42.0.windows.2


