Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D0CCD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4355.1779824001553601191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CurkD4UA;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-902deb2412fso1260315285a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824000; x=1780428800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqBQ0kSRDaXVzT9riNDE1TCY+wZBQeK+1nL64cQnhFw=;
        b=CurkD4UAR4YRMfUF86VkyR+eMMwXGr3xoH5+ZA7DveVa1Vj38ZXn0fe/TmG5FVo8ur
         RVwWsnbdduelYe8Tz2wuaNTWIP5eieILjdVBV5HGcNmihqJGRDEHcKEK192F3xNcl6aZ
         TY+HC6Yax3aZV81FxXGfyA8YX+KDIOnDa5Ovr3XI2mU8atxXtAptFdTEceAamVXNe1Xq
         WH6Jof3m+NSyIkbOixm8LP2KNXSLoOpFXyWycIyCfItSAzKAs/1Xrz/jv1N9PeivToDH
         2+3Lr0OvakeMSO6I7ZidwXMtuZphYFPN1x6EXX/4uW6MGGhcJysc1yTqEOB4lo1uTgh1
         H5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824000; x=1780428800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqBQ0kSRDaXVzT9riNDE1TCY+wZBQeK+1nL64cQnhFw=;
        b=cUOhb/lSNDamLUi1BvPnTcNkvoHSrhAJmwcWTsuNgCRPcrvrSR9CC2EUxez76DGuOr
         L6A6mUbCpu4dxbA3bsjNGZsDYTpevYb+l6UaS13PkJ9TX0qHFMPFDYcEm0lT+vcOSqNu
         VZuMjoR5jxatDb3C7WDA2RtLl4TeUD8S5JVBVOf76EAaFpEdoBneprstHU4hiq26UKfz
         hfHHOSLeiBeQLoZuZDsb3kBc6w7vpcpoImK47ACMKllgFe+c14majSMXzO9gUxlJS+Qh
         Qafw4lIFgiPu15BQP71j79mG162rCb4NfBB+x+qJEydFNSHZVr/DiVoT6Rp8l2SmdTgj
         /8BQ==
X-Gm-Message-State: AOJu0Yx+SkqRrRI/TxD3hVSDmiUPkWVFUgSU+IyH4Mef7rjSWINV8YgK
	JSHlIhmragELmpFVKDsoxFMwWNSwA46rtSvBjviXOKQQFWcOr81qa4qwxaOZNs6rQisDCqxl3Lo
	KMil9NnM=
X-Gm-Gg: Acq92OHm+NPkf3Y6JxpYNxmP16JqArrRHf3zvPGC7bjxjoDPi1Q69LzqegAKfbbvnq0
	ZVuOXK1qnHKb1oRF56fGoBmz5Pa8/DoYanLmpcVHUlDZGnTqfP89iFHmB8A/FuzO86V6f3hsGrs
	T0/WKlJ6ErWO55vSO7XaAgL1VchEIE1lizD4pCPDTeRUsAvfKuNqEwdZaqc8sJJo1eJamuqEdfy
	L7GKWBqRl/tSA8p9ju1hwOOsf1mCVeH8CRnxeNTuVvfwZlANV9ktybOQgBBLu3lJsEfzSSEhjqL
	rur/MiowcDTDkOaN49QRJCugVOhWqLQgJtSXd+1lA9q1qTRdk7RpHzDr/R3F2KIqHk4KLt7o/VA
	/85LzEokqRJ4jXz8In4VcYGD5kstFlhTnEhvB0uuu7j5mH4Ac6s+YlFo60XvGYnuQSwK30hoDS4
	qxaKH9PrRIkNLluTop7vb0rrCtfARLlWcqApNn
X-Received: by 2002:a05:620a:2243:20b0:914:b65f:6aab with SMTP id af79cd13be357-914b65f6ef9mr1989535485a.5.1779824000317;
        Tue, 26 May 2026 12:33:20 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87cda12sm286718085a.31.2026.05.26.12.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:19 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 0/6] patchtest: cleanups and fixes, part 1
Date: Tue, 26 May 2026 15:33:11 -0400
Message-ID: <20260526193317.807459-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237618

This is the first split of patches coming from a previous series[1] I submitted.
Compared to that version, the changes here are mostly refactors to do the
following:

- Make sure that patchtest errors early if the user tries to run it without the
  meta-selftest layer enabled
- Improve the signal-handling logic when the --directory flag is used in a test
  run
- Encapsulate some bits (like package name fetching) into functions which might
  be re-used elsewhere
- Improve function and variable naming
- remove unnecessary code where possible
- Fix vague comments and typos/grammatical issues

Note that this was driven partially by Claude Code (Sonnet 4.6 and 4.7), but
I've gone back and reworked some of its changes before submission.

Selftests look OK after these changes:

|============================================================================
|Testsuite summary for patchtest
|============================================================================
|# TOTAL: 38
|# XPASS: 18
|# XFAIL: 18
|# XSKIP: 2
|# PASS: 0
|# FAIL: 0
|# SKIP: 0
|# ERROR: 0
|============================================================================

[1]: https://lists.openembedded.org/g/openembedded-core/message/237047

Trevor Gamblin (6):
  patchtest: refactor and simplify script
  patchtest: check for meta-selftest
  patchtest: tests: cleanup test suites
  patchtest: correctly abort --directory test
  patchtest: tests: base: add helper functions, cleanup
  patchtest: tests: test_metadata: cleanup

 meta/lib/patchtest/patchtest_parser.py        |   2 +-
 meta/lib/patchtest/repo.py                    |   4 +
 meta/lib/patchtest/tests/base.py              | 116 ++++-------
 meta/lib/patchtest/tests/test_mbox.py         |  10 +-
 meta/lib/patchtest/tests/test_metadata.py     |  88 ++++----
 meta/lib/patchtest/tests/test_patch.py        |  33 ++-
 .../lib/patchtest/tests/test_python_pylint.py |   8 +-
 scripts/patchtest                             | 197 +++++++++---------
 8 files changed, 206 insertions(+), 252 deletions(-)

-- 
2.54.0


