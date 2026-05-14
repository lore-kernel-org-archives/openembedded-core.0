Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E71CD4F41
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:17 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19884.1778787730996529850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=Egk1NerD;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50faf8ed9c5so44912051cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787730; x=1779392530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbyPQPD5eU7Qj5L6AhGzGghmIkDUdhE1EtdhBNAjvV0=;
        b=Egk1NerDsnEw6o5joIk3itcB10yFaE7qasXgYrFerxxtKSl6dknluaTufDxhQ6TSuG
         difa9bQ2+5ErYIFuVJ0RbGbJdH+u9CSrAMiIk9c/csH6cdXx3Bmru4zNNi5C/Lw4pit2
         +npPeEWBzUJGGQXFjf8aPIMPg1IR/0l1+qMalrcXq2LT20J1slfgq1Q1Lz9LPoHGPtfu
         yKgrq39F90XRJLLtoNQ9fnoCEOxza0wlnO8IGdH2jSgIQ+Okt7A0S9tomA5eQRPXXqRY
         ZJGi8omd4fwvcaZio+hfBpTTKYNiOPN5hwPr3xKvJHp5NaqVwVWxx+WrHGHrb8RZ6aNV
         yC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787730; x=1779392530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbyPQPD5eU7Qj5L6AhGzGghmIkDUdhE1EtdhBNAjvV0=;
        b=CazIKtmV4/FXIPgCF3Z0OabElzn1cS6fIFwYU0vUqr5zrlIP16Gp8Xaf96nDKkl/gQ
         JI0qzqe1yVKpK6w9BA3kz2XOB67PDWlFTcCdtpvIGeVoNZEo4tJIytzRufPH6tFZxZgF
         fFyjtHG/nCXy0SpF4WLfamYoGQudwalr+ia/S0Q9CudnYSB4pmZFbz/OOinDjxapp2CA
         70Fp17nKwFZrdmPs6VvlmjZPsmEKRmAyHAQm6MXo3ZPKUsUg4kTT/fMRQ5BXIdRtBbuh
         oT+GiYnwASpZi5tfNCwI93M1CBMp9bQc7tTpDpd5Ba2El9IgicBM5b6EaT3iutOMbN7b
         nR1A==
X-Gm-Message-State: AOJu0YyAr9HJ/WnXEdhes2BE28vUsCxpGvAjIKl2Gx00CSn1ZC67roXe
	Q+fpMmW5v4LwKoathz/gjXzeMdSDKMadMvpw4vh1pI12ozwkNAk4Zx5cfWGq6JYttnfbFYR6Uxi
	EhMdRrGY=
X-Gm-Gg: Acq92OEccK/PAxZuVPsChdAaQCti/GN4rWxucuQg8CVUUP7sDvP3glFasmLGSo1ipsL
	vFGXzB/HPOKZJ7Z3bi5pWfzp42/Y4MLzolzkHlH/OUGJoXdhT4m2gsVgDBWgWltrBWLTz5n7D0V
	WmDJJ9IOrODw4BQkom0KoMNyRNfuD7Fjuvyn8lBLp1XO+35uQ8qTibFs9pJ/T8GZxjPE88tK4yy
	uMw19rkBeu9f+YHCgceLE0QRZojB8lP7InsOkmVaGgzYUQ3NEdIioZgIP8uTv456d34XEsd3bXL
	CPbXRP4oYyEaDkwxk6i114KmewyRRw2167EOKB7fzfypzvRm4ImGSPqk+7dvZ14MxZ0dYOTrMCg
	Cv4uLcFNwy3MWFs7LpOkA8ov5O1bOi6dYyTGhGMzh/+uFchJc4DcukxYsx34sMFhMLvtXsz0mKq
	S2bf1Mo6C+LJvJSVf0RfPej187IQ==
X-Received: by 2002:a05:622a:4e06:b0:512:e813:7ceb with SMTP id d75a77b69052e-5165a21a05bmr9571131cf.46.1778787729781;
        Thu, 14 May 2026 12:42:09 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456b6cf7sm25177011cf.8.2026.05.14.12.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 00/11] patchtest: improve testing coverage
Date: Thu, 14 May 2026 15:41:56 -0400
Message-ID: <20260514194207.1958325-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237047

Make changes to the patchtest script, helper modules, test suites, and selftest
files to address various shortcomings with the current version, including:

- Re-enable the previously included mergeability tests, which have been broken
  since prior to the 2023 Yocto RFQ
- Improve series testing by fixing signal handling and return code logic for the
  '--directory' flag, and by making it possible for patchtest to report the
  shortlog for failing commits when testing series as single files
- Make branch checking for merge tests more robust but retain flexibility for
  the selftest suite, and so that users can test series against branches other
  than the target one
- Add new tests for malformed lines and whitespace in the TestPatch module
- Refactors across the entire suite to remove dead code, simplify logic, and
  update selftest files
- Expand the selftest file suite for all of the new cases added, bringing us
  from 38 to 51 selftests.

Before: 

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

After:

|============================================================================
|Testsuite summary for patchtest
|============================================================================
|# TOTAL: 51
|# XPASS: 25
|# XFAIL: 26
|# XSKIP: 0
|# PASS: 0
|# FAIL: 0
|# SKIP: 0
|# ERROR: 0
|============================================================================

As always, there's lots of room for patchtest to grow further (I'd still very
much like to convert it to a standalone Python tool one day). However, this is
already a sizeable rework, and it should bring immediate benefit to anyone using
it. I've made a point to label each individual patch appropriately, but for
emphasis this work has been done in tandem with the Claude AI, specifically
Sonnet 4.6 and 4.7. 

Given the skepticism that many of us have towards AI tooling, I made a point to
do a review of the changes Claude had made myself before performing the final
squash and rebase. This did reveal some bloat that I've since removed, but for
the most part it made functional and useful changes. The selftest suite was
routinely triggered locally to ensure it didn't cause any bizarre regressions,
and new selftest files were added immediately for new test cases (or, in the
case of the mergeability tests, refactored so that they were no longer labeled
as skips). I've also made a point to pull patch series at random from the
mailing list and test directly.

Parts of this series (such as the '--directory' usage improvements) were written
to address the needs of folks at Smile. Others address one or more outstanding
bugs in Bugzilla, which I haven't consistently labeled as such (but I'll close
them when this gets merged). The next priority will be to improve the actual
deployment of the Patchtest service on the Yocto Project infrastructure.

Trevor Gamblin (11):
  patchtest: check for meta-selftest, cleanup script
  patchtest: test series mergeability
  patchtest: tests: cleanup test suites
  patchtest: correctly abort --directory test
  patchtest: fix branch applicability reporting
  patchtest: test_patch: improve patch-specific tests
  patchtest: test_mbox: skip cover letters
  patchtest: mbox.py: improve 'From' line matching
  patchtest: selftest: stop if patchtest fails
  patchtest: selftest: rework test files
  patchtest: selftest: extend test file suite

 meta/lib/patchtest/mbox.py                    |  56 ++---
 meta/lib/patchtest/patchtest_parser.py        |   2 +-
 meta/lib/patchtest/patchtest_patterns.py      |   5 +
 meta/lib/patchtest/repo.py                    |  48 +++++
 ...x.pretest_series_applies_on_branch.1.pass} |  22 +-
 ...x.pretest_series_applies_on_branch.2.fail} |   0
 .../TestMbox.test_bugzilla_entry_format.fail  |   5 +-
 .../TestMbox.test_bugzilla_entry_format.pass  |   5 +-
 ...TestMbox.test_commit_message_presence.fail |   5 +-
 ...TestMbox.test_commit_message_presence.pass |   5 +-
 ...tMbox.test_commit_message_user_tags.1.pass |   5 +-
 ...tMbox.test_commit_message_user_tags.2.pass |   5 +-
 ...estMbox.test_commit_message_user_tags.fail |   5 +-
 .../files/TestMbox.test_mbox_format.pass      |   5 +-
 .../files/TestMbox.test_non_auh_upgrade.fail  |  25 +++
 .../files/TestMbox.test_non_auh_upgrade.pass  |  25 +++
 .../files/TestMbox.test_shortlog_format.fail  |   5 +-
 .../files/TestMbox.test_shortlog_format.pass  |   5 +-
 .../files/TestMbox.test_shortlog_length.fail  |   5 +-
 .../files/TestMbox.test_shortlog_length.pass  |   5 +-
 ...estMbox.test_signed_off_by_presence.1.fail |   5 +-
 ...estMbox.test_signed_off_by_presence.2.fail |   5 +-
 .../TestMbox.test_signed_off_by_presence.pass |   5 +-
 .../TestMbox.test_target_mailing_list.1.fail  |  26 +++
 .../TestMbox.test_target_mailing_list.2.fail  |  24 +++
 .../TestMbox.test_target_mailing_list.pass    |  25 +++
 .../TestMetadata.test_max_line_length.fail    |  26 +++
 .../TestMetadata.test_max_line_length.pass    |  25 +++
 .../files/TestPatch.test_cve_tag_format.fail  |   5 +-
 .../files/TestPatch.test_cve_tag_format.pass  |   5 +-
 ...estPatch.test_patch_malformed_context.fail |  38 ++++
 ...estPatch.test_patch_malformed_context.pass |  38 ++++
 ...tPatch.test_patch_trailing_whitespace.fail |  38 ++++
 ...tPatch.test_patch_trailing_whitespace.pass |  38 ++++
 ...TestPatch.test_signed_off_by_presence.fail |   5 +-
 ...TestPatch.test_signed_off_by_presence.pass |   5 +-
 ....test_upstream_status_presence_format.fail |  61 ++++++
 ....test_upstream_status_presence_format.pass |  62 ++++++
 meta/lib/patchtest/selftest/selftest          |  25 ++-
 meta/lib/patchtest/tests/base.py              | 117 ++++------
 meta/lib/patchtest/tests/test_mbox.py         |  56 +++--
 meta/lib/patchtest/tests/test_metadata.py     | 112 +++++-----
 meta/lib/patchtest/tests/test_patch.py        | 113 ++++++++--
 .../lib/patchtest/tests/test_python_pylint.py |   8 +-
 scripts/patchtest                             | 200 +++++++++---------
 45 files changed, 904 insertions(+), 406 deletions(-)
 rename meta/lib/patchtest/selftest/files/{TestMbox.test_series_merge_on_head.1.skip => TestMbox.pretest_series_applies_on_branch.1.pass} (66%)
 rename meta/lib/patchtest/selftest/files/{TestMbox.test_series_merge_on_head.2.skip => TestMbox.pretest_series_applies_on_branch.2.fail} (100%)
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.1.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.2.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.pass

-- 
2.54.0


