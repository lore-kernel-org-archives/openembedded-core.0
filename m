Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDAFC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:27:34 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.13563.1699370852855840235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cOwSsQpP;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso9711068a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370851; x=1699975651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pnS8QA1xVNfMutDd/Flz4nrkHkcx92fV25iiBiqfBcA=;
        b=cOwSsQpPt75GCXN4buaPwggGCQqXSIIIj/wWBlw6ZMwyuDWu0e6MdaqxcjZwZcsOqv
         1ovFxf0jlV+BIDcJqIpIb3m4XmboEHK14KWhSRd2J5OOO9xOh23ZxZkHP7laJ/HnXXY5
         WN1ic8hOqIHdkqOdlPeYfDW3fiD9kbf/Ow/BvAiJaQoQENIIJkNn5jaMlzwqyNrdxNCY
         4M45gJYXRfsCjQ2Q6nAYnJdnxaUiTVs4SHk2Ez43CzFV1pgF588qdkIwR/3nuLcAAbEm
         6iDpSDQFKIL5QwUqM+YiZjauQIasSXEmtLNTfRfTFXEpnkCDkltWlzK2mo2P6XUOnhIl
         N2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370851; x=1699975651;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnS8QA1xVNfMutDd/Flz4nrkHkcx92fV25iiBiqfBcA=;
        b=YZkHRShPPYbl6OUWx4FEm7dAbav4QeF+jzphwCfsHYftsGm1PEAM0eKLSMT9E4w7Rm
         RMTbOcYQDYSozUupVjMDILwQfAbfHM/I51KDB7vm8CJpJWBruva3AyewsvcEtEKxg9qy
         9GCEz6+h42Sv9yvJI0BNw6ldchw8FRUN6iLrsmp5y6wWxm1VFGI990jgC+Mcvokzt+Ck
         XcvW/sIX+DxmwlKgp7fnlr4XZioXYCZyAmAhZMlc2qHcRH70PjaqhlaXZvX3Zz730c3E
         80954jVeM+2+m1+P4Xr96/0nBenVvYhAeRVNRsVM8HvzYE97YfsIIhHhBXM2ZEHmwXgN
         /vcA==
X-Gm-Message-State: AOJu0YxuA7/fzH+OY8OjgMwI2iy9T2Rf+w9ZsU0qlJq1Cb+wovFpHJzJ
	Okzz7hAd4NZ4z5Ij+NRaMEUGnkMYAro=
X-Google-Smtp-Source: AGHT+IGnW658zFWh7GdwcENDAOFLOfTFdlfVICILtcAbweR9RlHOtfJXjytwFtnQXA0N5sIIjsY7YQ==
X-Received: by 2002:a17:906:71db:b0:9bd:e99b:82dc with SMTP id i27-20020a17090671db00b009bde99b82dcmr11900780ejk.61.1699370851067;
        Tue, 07 Nov 2023 07:27:31 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:30 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 0/7] bitbake-layers: Add update-layers-setup
Date: Tue,  7 Nov 2023 16:26:35 +0100
Message-ID: <20231107152641.1043-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190290

From: Jermain Horsman <jermain.horsman@nedap.com>

During development it can be useful to use a branch instead of a
revision, e.g. when rebasing often or just for easy upgrading of
the setup.

This is a first iteration, it updates the generation of the
setup-layers.json file as well as the json schema for it.
This allows for situations where one or more layers are checked out
using a branch instead of a revision, care is taken to make sure this
works when using multiple remotes.
All changes made are backwards compatible with older setup-layer json
files.

Previously the idea was to update bitbake-layers create-layers-setup and
extend it, I have however put it in a separate plugin as I think it makes
for a cleaner interface:

bitbake-layers update-layers-setup some.json poky [--branch]

I've opted to take the information from the currently checked out
repositories instead of allowing the user to specify the revision as this
eliminates the need to check if references are valid.

In previous discussions with Alex we talked about using any revisions,
e.g. tags as well, however, I have kept those out for simplicity.
Using tags complicates things as a reference can have multiple tags,
which would require additional parameters or potentially an interactive
solution.

I have not done a full oe-selftest run, so I may have missed a test, but
I believe the current selftests should pass on every commit.
I have extended oe-selftest with a simple case for the new functionality.

Jermain Horsman (7):
  scripts/oe-setup-layers: Allow setup using branches instead of fixed
    revisions
  lib/oe/buildcfg.py: Add additional git functions
  bitbake-layers: Add ability to update layer repository configuration
  bblayers/makesetup.py: Use new functions from oe.buildcfg
  lib/oe/buildcfg.py: Add additional git functions
  bitbake-layers: Add default remote to layers-setup.json
  bitbake-layers: Add test case update-layer-setup

 meta/files/layers.example.json                |  5 +-
 meta/files/layers.schema.json                 |  8 +-
 meta/lib/bblayers/makesetup.py                | 33 +++----
 .../bblayers/setupwriters/oe-setup-layers.py  |  2 +-
 meta/lib/bblayers/updatesetup.py              | 78 ++++++++++++++++
 meta/lib/oe/buildcfg.py                       | 45 +++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py      | 58 ++++++++++--
 scripts/oe-setup-layers                       | 93 +++++++++++++++++--
 8 files changed, 282 insertions(+), 40 deletions(-)
 create mode 100644 meta/lib/bblayers/updatesetup.py

-- 
2.42.0.windows.2


