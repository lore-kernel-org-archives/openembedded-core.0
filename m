Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28B2CF9C64
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 15:58:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17395.1727020700974808959
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 08:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGNH2ID4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so29151185e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727020699; x=1727625499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+kT15oOdp26JM6Fhikrn1SIqwk3gRtE/gXHoNzRuQs=;
        b=DGNH2ID4aHnZAwUWtMDEi5rgO76VnqPG+qGkb+s1CG28TS060tG27Z/bm11r7AC5vV
         ymKZjF2lit2O4yIsxRT1fch/AesAcL9i8GD6XKegazTjcSMb1Th7pAG23Hnyr8DVEp7B
         IETJ7Kb89jYF+62YhkSSqyEo9wqg5RSEugnQ7oD9Hv9yguCwv+LxFK3v8faqz6S2TdO4
         adDv0cTdeBm82bevboiwyCU6sf6oTl+7YNCzdi/3OQtGtqQeKRj0eb7OCnpG4fSfqm0H
         fVuJsSweY6APAJwL5IKc/QDSHC+h4ugzVUZPBpVNiABfAvR/1aAzWY/zC27++s6LSYDZ
         7X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727020699; x=1727625499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+kT15oOdp26JM6Fhikrn1SIqwk3gRtE/gXHoNzRuQs=;
        b=r6f6OIBxwZ6e/H7ha92On4tq1T2JXY9K4Emi72lUXg7mv66I6/TN5A2WzQSuvgJPyr
         z6xP4qbuv8CivpcqBDsSOWD0rE9kIrqUdK9w08wIfMUVBawt5Sd4ynidggxekyV2qCFp
         pXfs++oTutlbHuUU7H2urecPByNBLUhj07nqD0zJ/lZ2TmFIUoKOseosBSrsE1TbS1RI
         2I8aBkDa92r3SsSOWUy902+YnqmLQZoQXPhWrQ2M20oLiKzM4WA472Z5SaGcASBQwYX6
         XYqbKd1mY0Rqs4fVsRX0xCx2tbgNzEkVJPxxzmIatuq3sCNOZwxbevlOh5XmApMzdoLr
         qIYA==
X-Gm-Message-State: AOJu0Ywhu+AJpolZ35bJb6gLWl85tAZjB+ud93wKmhnjveniigDxxOPB
	/eSRnRL1LCfjB8GRVFKrGKegjrD7ol94kGhAW44dxLYENBC6uGTP22k0LA==
X-Google-Smtp-Source: AGHT+IHwnZNntDl+8W9DHd1NN1vkhbAcBRqNQyYDDaifaAQLMDPYgokkAwADW0HFp+5l5lFfx9ejyQ==
X-Received: by 2002:a05:600c:474d:b0:42b:a2fd:3e52 with SMTP id 5b1f17b1804b1-42e7ad72dd4mr70965395e9.22.1727020698875;
        Sun, 22 Sep 2024 08:58:18 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e429sm104126405e9.3.2024.09.22.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 08:58:18 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/3] some cleanup for s = workdir
Date: Sun, 22 Sep 2024 17:43:13 +0200
Message-ID: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 15:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204789

Removing support for S = ${WORKDIR} allows for the removal of code that
gave me a headache when writing and testing. Having 2 paths (one
direct, one via symlinks) to the source files messed up Pseudo.
The code that is now dropped avoids these corner cases in a very ugly
and probably not 100% reliable way. In any case, it was much more fun
to write this remove commit than to write the commit that added this
function :-).

While investigating this issue, I found some lines that also seemed
useless.

Adrian Freihofer (3):
  devtool: drop S = WORKDIR workaround
  devtool: menuconfig remove useless code
  devtool: drop useless variables

 meta/lib/oeqa/selftest/cases/devtool.py |  5 ----
 scripts/lib/devtool/ide_sdk.py          | 38 -------------------------
 scripts/lib/devtool/menuconfig.py       |  7 +----
 scripts/lib/devtool/standard.py         |  3 --
 4 files changed, 1 insertion(+), 52 deletions(-)

-- 
2.46.0


