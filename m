Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C1AC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 22:13:08 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.529.1784153587578193403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 15:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=li6kjn3/;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8f0d6853360so43159566d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153586; x=1784758386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6jrnnpq3hiE+C3GXbwH7JYjkyLRMSJa2J80+KvgLtw=;
        b=li6kjn3/xxt6ptspy969R+UWLQWyDvt9eIYisvHojdO0YsNtftCCS1cKSTLEwAyNHr
         727nFNTgHyqOIsTo48cHs4XFMNu5/IFR6ZgwhrBnspGjwkhPeAWXCfObYsNRiabG2S1z
         626w91co8DS+2jmmPzWujRrvmu9ppWX011dlRKhCAocJ8n0BNw/Qa6IbZbx2sHXntTD6
         rKo8gtgaRVPgAD6jV9Y4PWBqgClkgimtiWnFuj/u/RFC55fg3bd6I+wMmhbdUajTOYYE
         XInF9Fv+BCk3Vslo4ncJwq2S4mJuY4hVFRyIvKkRUzj1nox+G4W6qFYopi7LkcyDCnv5
         wQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153586; x=1784758386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g6jrnnpq3hiE+C3GXbwH7JYjkyLRMSJa2J80+KvgLtw=;
        b=sFZjRrLFttNeMxM4zSXLpP83628tr9OMuMVEcAv8G17jHls9VtHr3DnxsNHFZJtk8Y
         G58cq4hzPDAVYZu/UCzkYhXcqwXd+xd7ZCHloLaibMPfUtsbtaf2526C69CWKtA33+wD
         E1YzOB3DIpaNYHvSN9GhA761w7pqAPzNWb0eGVqWLF+sQhLlstZHe4b08yYTJ1+QKkDB
         fD4cSK97irpOql1mzJJw+7jl6p6/ZxnW4rA6O7F7rQjQjO21c6PHP0nXW3bAXWCxFJdQ
         WIeNqJcABa1MBExDbqwSU3vZwzcN9+RExidTyWE1ZDw2ooO7OmXhYiZTJ/CVD8R/WDK1
         0sKw==
X-Gm-Message-State: AOJu0Yy25I4yp8R625mqFd0YCp2UfsDSFxbAjNRsEyKtOgya+FzEFkFy
	Cii0GKBdGbvUnM6OCbz9CIDFcP9vwrVXlJ4NrPU0xs4irI2ApmfLcRv5+uaprw==
X-Gm-Gg: AfdE7cnQOC3Zgib6NSYEU0MzttyQ6cvEh3dvQ2D0NKFpjjjgnEd4T/241P78lTOuE9t
	toWW+NnSzmhHxxGdaKhbFb957Vj3mMFmxXkl9FYkLLVZjs/7Mtsi2LYM5ijhWA/O8LAZ5Hn6B3/
	YfopO4xndIRZCq2Ex5cJy8erJG5r0EXkJZItBRnujbgrYRprl1K1Yd44JyVHtzMesFceUnoXTZ7
	udYt71Ie101QO6QdmyKFoFaQFJIV5LDT2ulfeZe+PHLniV60kkx6exiv688TLS9JksfLAxRj6IJ
	DFmw6/gWOBA7A/M+WAZmgJMGWw26DKb+xf0gmHPiUUoyVVnuq6Mk6r4arnAvi6f4G6Qv0SrGNKr
	hv4fVXr4OXHtSYf/UL6kO0J+gsnJq0VJKy1dGFi/J7GpBLptfMiEJP7ZBhDhZbd68YfGKxYcyJK
	sXOL45W6IYwOozHqQd2IR7sBLojH9Q+L4IYeZj0wkEldrU8F+iBECfN4s=
X-Received: by 2002:a05:6214:3214:b0:8f5:5866:161d with SMTP id 6a1803df08f44-9074c6e5d96mr89597876d6.2.1784153586241;
        Wed, 15 Jul 2026 15:13:06 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm204822086d6.9.2026.07.15.15.13.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:13:05 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] oe/path: three fixes plus selftest coverage
Date: Wed, 15 Jul 2026 18:12:48 -0400
Message-ID: <20260715221252.3369108-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 22:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241043

While adding unit coverage for the copy of oe/path.py vendored into the
standalone wic repository, three real bugs turned up in the shared
meta/lib/oe/path.py. They are fixed here at the source so the whole
project benefits, each as its own standalone commit:

  - __realpath()'s isdir guard assigns a bare `false`, which is not a
    Python name; when os.path.isdir() raises, the handler meant to
    absorb the error raises NameError instead. Use the builtin False.
  - symlink(force=True) cleared the destination through remove(), which
    globs its argument; a destination containing glob metacharacters
    could fail to match itself (leaving a stale entry) or match
    unrelated files. Remove the literal destination instead.
  - canonicalize('') and canonicalize(None) returned the current
    working directory, because os.path.realpath('') does; a stray
    separator injected a spurious cwd entry too. Skip empty tokens.

The final commit extends meta/lib/oeqa/selftest/cases/liboe.py with a
PathTests class covering oe.path's own logic (join(), is_path_parent(),
symlink(), make_relative_symlink(), canonicalize(), which_wild(),
realpath()) and locking in the three fixes; backing any fix out turns
the matching test red. oe-selftest -r liboe.PathTests runs 37 tests,
all passing.

Trevor Woerner (4):
  oe/path: fix bare `false` NameError in __realpath's isdir guard
  oe/path: don't glob-expand the destination in symlink(force=True)
  oe/path: canonicalize('') should return '' rather than the cwd
  oeqa/selftest/liboe: cover oe.path's own path logic

 meta/lib/oe/path.py                   |  21 +-
 meta/lib/oeqa/selftest/cases/liboe.py | 289 ++++++++++++++++++++++++++
 2 files changed, 307 insertions(+), 3 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a

