Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD13AC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:10:38 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.12185.1714741836134980299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qC7Lpk1b;
 spf=pass (domain: baylibre.com, ip: 209.85.160.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-23d812a4337so1425959fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714741835; x=1715346635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPJegysWJTn1YExKiNjS+tVc23R/6W8+IzlJAsDd7+k=;
        b=qC7Lpk1bEzsTmqPN5w31o1VuOmGwKSuy7vYWMWJyeGPYTBodSHBc3IFrcMl/2XQ7zT
         eh055yBmAxvbnp6Fo30F9bld4xJ/GKEzM3AlVSON2qX3RT9DbTnL7ye7QbI3NrY5AxCd
         tPewPKqnigdhwRce3Dg8IFvtietfQjOUS4HRH7CAYFRHwEg8SOepLJuc2nhomQbu0MDe
         hEisxPw6ckXFTTBvX7bHH+ADgD6rtV8IYURLQ93N2qG6go4LGrQv8480wNmKNtFOaycc
         EFefe5Qe/B+0fOEHNnyFWuo4w1WpuZeR5k+unNthMcAhIquur4UFo5jiKdWwBUmLgpH4
         /a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741835; x=1715346635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPJegysWJTn1YExKiNjS+tVc23R/6W8+IzlJAsDd7+k=;
        b=Uxrx2Wsretm3ax5uVVBBuBOTuOeJIzz5W5BRWL87vUGVQZpi2imy9ReHrvmo4x69ya
         ddjJYnmYYvrDZ54eL2516lHxf1kbakeubKR3AQTvXNnwnJSao1vMaW6qY2iy1mc623TP
         mgrL+IWN6t2eOa4NEgTS5ykQ9yurOyXs4FrW6XVlTi/BdYdbcE8+TPUyyYhvsmjbimcE
         q1HvGfYp/3WAUL6lrO8tjU1NlUB2vBM0bhKp5r2LjdTjwIQc1uqndmfJhtVhOGdH3nWZ
         CChWiTRr+14ZCGhTqopaz1i15kWTt/v9+5fd0wKw4nsle0W2WPHpANCQP3s9B3Wr15LF
         dOLQ==
X-Gm-Message-State: AOJu0YxAZ6OtL+XYHL/4+s/2+dGK0fDtq/k9RUVNXr3CZLyNerGIFkxv
	auFLobjADV5sNgIYBzRuTHynWxa2naFzTBV/0SzWyI9dOpmohwuUywbv3sKhTiwsDiPfQ9hTlLs
	Scy8=
X-Google-Smtp-Source: AGHT+IGhgbYmeDT2NZ1sT6u/eO1620MCDIEyddWhIbMEePm0gcuYSUm1tuviRnyj25tMsnJYQzXRHQ==
X-Received: by 2002:a05:6871:582b:b0:22a:828b:57ea with SMTP id oj43-20020a056871582b00b0022a828b57eamr2980276oac.53.1714741834841;
        Fri, 03 May 2024 06:10:34 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id jh20-20020a0562141fd400b006a0e94eb3e9sm1193510qvb.34.2024.05.03.06.10.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:10:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/4] patchtest: refactor and simplify, part 1
Date: Fri,  3 May 2024 09:10:28 -0400
Message-ID: <20240503131033.1665297-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198985

This series is the preliminary step in what is intended to be a larger
refactor of the patchtest codebase. It consists mainly of the removal of
a custom _exec() function and underlying supports in favor of the
GitPython module's built-in capabilities and .execute() method for
interacting with a git repo. This functionality is critical for
patchtest to match patches to correct branches and setup temporary ones
for testing; the changes here allow it to rely on a purpose-built set of
utilities in GitPython while reducing the amount of patchtest-specific
code to maintain. There are also a couple of other minor changes to
remove unused/minimally-used code and to modify one test case to test
against a different file for stability (README-OE-Core.md instead of
README).

Selftest results:

XFAIL: TestMbox.test_bugzilla_entry_format (file: TestMbox.test_bugzilla_entry_format.fail)
XPASS: TestMetadata.test_summary_presence (file: TestMetadata.test_summary_presence.pass)
XFAIL: TestMbox.test_mbox_format (file: TestMbox.test_mbox_format.1.fail)
XFAIL: TestMetadata.test_src_uri_left_files (file: TestMetadata.test_src_uri_left_files.fail)
XSKIP: TestMbox.test_series_merge_on_head (file: TestMbox.test_series_merge_on_head.2.skip)
XPASS: TestMbox.test_commit_message_presence (file: TestMbox.test_commit_message_presence.pass)
XFAIL: TestMbox.test_commit_message_presence (file: TestMbox.test_commit_message_presence.fail)
XPASS: TestMbox.test_signed_off_by_presence (file: TestMbox.test_signed_off_by_presence.pass)
XFAIL: TestMetadata.test_cve_check_ignore (file: TestMetadata.test_cve_check_ignore.fail)
XFAIL: TestPatch.test_cve_tag_format (file: TestPatch.test_cve_tag_format.fail)
XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.fail)
XFAIL: TestMbox.test_shortlog_length (file: TestMbox.test_shortlog_length.fail)
XPASS: TestMbox.test_mbox_format (file: TestMbox.test_mbox_format.pass)
XFAIL: TestPatch.test_signed_off_by_presence (file: TestPatch.test_signed_off_by_presence.fail)
XFAIL: TestMbox.test_shortlog_format (file: TestMbox.test_shortlog_format.fail)
XFAIL: TestMbox.test_mbox_format (file: TestMbox.test_mbox_format.2.fail)
XPASS: TestPatch.test_cve_tag_format (file: TestPatch.test_cve_tag_format.pass)
XSKIP: TestMbox.test_series_merge_on_head (file: TestMbox.test_series_merge_on_head.1.skip)
XPASS: TestMbox.test_author_valid (file: TestMbox.test_author_valid.2.pass)
XPASS: TestMetadata.test_lic_files_chksum_modified_not_mentioned (file: TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass)
XPASS: TestMbox.test_bugzilla_entry_format (file: TestMbox.test_bugzilla_entry_format.pass)
XPASS: TestMetadata.test_src_uri_left_files (file: TestMetadata.test_src_uri_left_files.pass)
XPASS: TestMetadata.test_lic_files_chksum_presence (file: TestMetadata.test_lic_files_chksum_presence.pass)
XFAIL: TestMbox.test_signed_off_by_presence (file: TestMbox.test_signed_off_by_presence.2.fail)
XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.2.fail)
XFAIL: TestMetadata.test_lic_files_chksum_presence (file: TestMetadata.test_lic_files_chksum_presence.fail)
XPASS: TestMbox.test_shortlog_format (file: TestMbox.test_shortlog_format.pass)
XPASS: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.pass)
XPASS: TestPatch.test_signed_off_by_presence (file: TestPatch.test_signed_off_by_presence.pass)
XFAIL: TestMetadata.test_lic_files_chksum_modified_not_mentioned (file: TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail)
XPASS: TestMbox.test_shortlog_length (file: TestMbox.test_shortlog_length.pass)
XPASS: TestMetadata.test_cve_check_ignore (file: TestMetadata.test_cve_check_ignore.pass)
XFAIL: TestMbox.test_signed_off_by_presence (file: TestMbox.test_signed_off_by_presence.1.fail)
XFAIL: TestMetadata.test_summary_presence (file: TestMetadata.test_summary_presence.fail)
============================================================================
Testsuite summary for patchtest
============================================================================
# TOTAL: 34
# XPASS: 15
# XFAIL: 17
# XSKIP: 2
# PASS: 0
# FAIL: 0
# SKIP: 0
# ERROR: 0
============================================================================

Trevor Gamblin (4):
  patchtest: requirements.txt: add GitPython
  patchtest: repo: refactor to use GitPython
  patchtest: tests: update bugzilla_entry_format.fail testfile
  patchtest: utils: remove unused functions

 meta/lib/patchtest/repo.py                    |  88 +++---------
 meta/lib/patchtest/requirements.txt           |   1 +
 .../TestMbox.test_bugzilla_entry_format.fail  |  25 ++--
 meta/lib/patchtest/utils.py                   | 129 ++----------------
 4 files changed, 42 insertions(+), 201 deletions(-)

-- 
2.44.0


