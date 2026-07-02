Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F1CC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:28 +0000 (UTC)
Received: from mail-qv2-f0.google.com (mail-qv2-f0.google.com [74.125.230.128])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71763.1783005738716733646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ItDjFkxk;
 spf=pass (domain: baylibre.com, ip: 74.125.230.128, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f0.google.com with SMTP id 6a1803df08f44-8ef118ead8eso14518776d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005737; x=1783610537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+shFJtUXMVH2E8GlTKbpWXGG3Ffoc99pQJrODssAFQ=;
        b=ItDjFkxkOOUNGVuzDoiBPXy9ZiBiDUIPuaDaB+Q8090WXLGOAVNqIDEcRdpvGU6EIG
         du6oi5KphSX9uaYgpdBt4Ho7Zk+J6YfqqQTSBo7yCqClkfN/Ci+YfI1GVbl4JZ19djFC
         Isj7L28NSiAoBxtdEF+NbpEvrawIXDW6CGiU7A8BTZyN9CbgLYtvBmdC/cHFnAXE+1AA
         dVH0UaOYQjZxf2ChKDhcTHKibcZNkVFBaNLxTIOLN4pJfZKV64v8rgb+QHHapSjFiNiU
         jK8jzvy0ts/R3d0a0oSPPaSgHorOljCpPhZYVW6acsM61VZb95uOAtwoZqeh3poKuYIU
         QlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005737; x=1783610537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+shFJtUXMVH2E8GlTKbpWXGG3Ffoc99pQJrODssAFQ=;
        b=AQXksbfgfL98jYG8CqEDhxPC2EDsnuGsC8U4wOntHx+uMM4cxJXO4DGFEC9e4B3IHy
         Ok1+FfUYbjFRM3OzoJqpsbO0FA0fmGS0up7kgvbffoyPt5IlHBd2amdon+067Rm7qAYV
         LSpoKLdvQkDCd4my2sJP+/hT1D9S5fp8+SgjH9CphGSlo3IL6bNmPZOr1WRjGuN+ZgFi
         UqPs5cMTh0p1ktTQGTeiWNJz8MNWY4kYb8+KosGdzyjZ2LkurXSfa+hinsTJZHo4nVm6
         ZfV4Cz3d7qfuWjjHLf1c5eBQjWShIMph/BMladHnGjYSXhM+aNghR2UZZOONr1pRt2B+
         VYUg==
X-Gm-Message-State: AOJu0Yz6oQnf3+Lmzo/mjWBemusVuw2pfi8OotVwISraNGUjU7x3k6XQ
	B4qjJ1iukR5vAB/27/dFmS6AyKAyGgLvdeIjV6lo6j5I/Q5RaNBvWag8V/X47ifGSNvp0UHtg+T
	81HaUhnjMhFD4
X-Gm-Gg: AfdE7cn4cNIjQ11ycj1ALwXRGipGCMsmol6FYOF6CpLlGYdodqNi2pjQvv3Hz2OtHjQ
	aJPKHJDh/amYJyHt8NEy+a0t0ET5v6QVd+1fM/4ELxzxGpsIDLCnVqMJ78XB7L7X2WpbfZ5sM1i
	G5HkO23oDngTeXxparMHzYa0p1mYiNbO4gaqLbz+i6R+tntOP/OpHm3Hh918NFJ+SNdf1k0Fvmw
	MKp1akFki2FWE481e3Mn1+0FDDjoKruptEKj0TQEtA7WYKAIjW7GmdxmvO1bRSoa5nzZU6NMQUy
	qOop+PwfaCfSlM0qU5so58WJUN9T01ELyVwdWiuxHy0N3t/0xBGk5nZSOc7QsrUa74HxDrMxXYL
	4r+aCmcCAJ18/YEcLGsifaBOv53hXG42pfZz3U9T0D+m+RRYgaabpf4jCqamPzPpIUs73dm4Ts5
	R4wDGieuHU+PoJgCY2
X-Received: by 2002:a05:620a:4388:b0:915:83f3:780d with SMTP id af79cd13be357-92e7b018f1cmr782265585a.32.1783005737326;
        Thu, 02 Jul 2026 08:22:17 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801949d9sm236959385a.36.2026.07.02.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:16 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 0/6] patchtest: cleanups and fixes, part 2
Date: Thu,  2 Jul 2026 11:22:07 -0400
Message-ID: <20260702152213.1439717-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240058

This is the second split of patches coming from a previous series[1] I
submitted. 

Changes are mostly to the existing test suites to clean minor issues up
(duplicated code, inconsistent Python syntax). The most significant differences:

- Clean up test_patch.py so that it doesn't print misleading CVE-related
  messages for carried patches which aren't actually targeting CVEs - the
  original code was written under this assumption, but it's incorrect.
- Add some new logic in the patchtest script so that when someone uses the
  --directory option to test an entire directory of patches, but then aborts the
  run with CTRL+C, the whole test suite is properly cancelled rather than a
  buggy skip forward into the next set of tests.

Note that this was driven partially by Claude Code (Sonnet 4.6 and 4.7), but
I've gone back and reworked some of its changes before submission.

Selftests still look OK:

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
  patchtest: tests: base.py: remove duplicate Commit object
  patchtest: tests: test_mbox.py: improve variable and message clarity,
    fix whitespace
  patchtest: tests: test_metadata.py: simplify SRC_URI collection,
    remove unneeded import
  patchtest: tests: test_patch.py: simplify source patch and upstream
    status checking
  patchtest: tests: test_python_pylint.py: use more Pythonic comparison,
    fix indent
  patchtest: correctly abort --directory test

 meta/lib/patchtest/patchtest_parser.py        |  2 +-
 meta/lib/patchtest/repo.py                    |  4 ++
 meta/lib/patchtest/tests/base.py              |  4 --
 meta/lib/patchtest/tests/test_mbox.py         | 10 ++---
 meta/lib/patchtest/tests/test_metadata.py     | 32 +++++-----------
 meta/lib/patchtest/tests/test_patch.py        | 37 +++++++------------
 .../lib/patchtest/tests/test_python_pylint.py |  8 ++--
 scripts/patchtest                             | 32 ++++++++++++++--
 8 files changed, 65 insertions(+), 64 deletions(-)

-- 
2.54.0


