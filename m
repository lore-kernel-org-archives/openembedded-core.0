Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EB5E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.25622.1733345127829384631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uzYvvM1o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215bb7bb9f9so1340145ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345127; x=1733949927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uJynsvXOdSkQbEcQszaKnWJqXNq/1enK1dM6jFULlg=;
        b=uzYvvM1oFFM7oX9FRn1k6R7u907xpyZLLDGlS20rE39u9efcMj8rbddykGDfiaGOIk
         alEwfAe6sFjMcNSzE1G/IKpu4slzTF9pQaqBp4v53wTYihZCGOUnmJ3GmacmUjroYfcQ
         5Vi9WN5hEeL90kpiAIiHfzPMkYM0qqmcw2Fiy0e9QuUUuzgItXg0gB31CeNSXlvwZPqV
         RGWE7jILt3LSexevyqaEinUwtXFFfqTXXLsKV0jh8J85jh1lWk3zVWRcB12N+v5x6D4z
         FN/pYUff7EeV8Mm8X+GxOrVa3Vb/IdMoya26sjoCfUA7vZW34AXWNEIiKnEB2wIrr5SW
         HLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345127; x=1733949927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uJynsvXOdSkQbEcQszaKnWJqXNq/1enK1dM6jFULlg=;
        b=weSvob4Xh9KPwYD9zUQemn5I6fRzXRBsZmRabfve3X56EpATXFF/D75IIU0rFkAr1A
         QAlaMfhI6kBWGis+Dhw89hfvwA/wlMVgbzXPGP2AvsxjTY4ZuLtSuLPWJjFDWPDk2X9I
         5OFjDhyMJHzFgdxSUTH9yK6vzjEbJMdQX6TvLMRPF9VNeapymBMbhLTdL4eMmdcbQzD7
         cLkQ2r9k6YUIDB8pUpFuaJs8ukXnbntzlvBAvWLXAQ+SxPRmCDyBLfDeOti4lG9fdxJI
         Zl9trtE1SD4tZueZnsweRPKDKN/xtV2Vb79/VvCdKOJcMYYtJ+kvGc/2M9eFpjIfTngc
         gEgQ==
X-Gm-Message-State: AOJu0YzYI5zoXp08YJCVb8ofIK/A3cfZKAEB7GJlluoARgbt2ZPQe7Or
	E7EUjJT/miWeOpRcj8QxceGBtHaLSHU+xbXR0VR0qhE1bnZxRwS0VVHSD9mzo+6EItur9LA23i2
	E
X-Gm-Gg: ASbGncuyEcUEC4QU3xKbqKHt8HarUsOrHXmnAJ+wKv7gIBmD5hqcyc4owcGCpUrhDVg
	tc7cwXgo9IHegcD2uJuxwQY/baa02/dhJTB9mH9gUph/Wt8Jyiz+WGk4Y2txokPzQT4C8fM+tsd
	kv10MGozPdlOtLPo9bJbAThz62f4P8HOztDUn8j9wheNnpPCcPGWsVC4rj6dy7XT7j6A2ZEJTas
	KTWsAztK0i66ni6Vw+TPGhOelFNqTFGLmqpUI8=
X-Google-Smtp-Source: AGHT+IF0TPB4vAoCpOTL92JRXmHVGkpyyg7Sg3tfDCpKtjnsHlSqvyomKY67BywEzYVQYqvQvQHbMQ==
X-Received: by 2002:a17:903:41c8:b0:215:4d90:4caf with SMTP id d9443c01a7336-215d003e7ecmr86654075ad.14.1733345126669;
        Wed, 04 Dec 2024 12:45:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/14] Patch review
Date: Wed,  4 Dec 2024 12:45:09 -0800
Message-Id: <cover.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208344

Please review this set of changes for styhead and have comments back by
end of day Friday, December 6

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/583

The following changes since commit b511d0146a2e8f316f4aecc90c853215674013ea:

  build-appliance-image: Update to styhead head revision (2024-11-30 05:43:10 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Changqing Li (1):
  rxvt-unicode.inc: disable the terminfo installation by setting TIC to
    :

Deepthi Hemraj (1):
  glibc: stable 2.40 branch updates.

Richard Purdie (12):
  do_package/sstate/sstatesig: Change timestamp clamping to hash output
    only
  selftest/reproducible: Drop rawlogs
  selftest/reproducible: Clean up pathnames
  resulttool: Allow store to filter to specific revisions
  resulttool: Use single space indentation in json output
  oeqa/utils/gitarchive: Return tag name and improve exclude handling
  resulttool: Fix passthrough of --all files in store mode
  resulttool: Add --logfile-archive option to store mode
  resulttool: Handle ltp rawlogs as well as ptest
  resulttool: Clean up repoducible build logs
  resulttool: Trim the precision of duration information
  resulttool: Improve repo layout for oeselftest results

 meta/classes-global/sstate.bbclass            | 16 ----
 meta/lib/oe/sstatesig.py                      |  7 +-
 meta/lib/oeqa/core/runner.py                  |  2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |  8 +-
 meta/lib/oeqa/utils/gitarchive.py             |  4 +-
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 scripts/lib/resulttool/manualexecution.py     |  2 +-
 scripts/lib/resulttool/report.py              |  2 +-
 scripts/lib/resulttool/resultutils.py         | 76 +++++++++++++++----
 scripts/lib/resulttool/store.py               | 26 ++++++-
 11 files changed, 100 insertions(+), 48 deletions(-)

-- 
2.34.1


