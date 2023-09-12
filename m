Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653F7CA0EF9
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:20:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.222.1694539201663374488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=L7sSZdTu;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76dbe786527so316626485a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694539200; x=1695144000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1AD0AHYsYGGTB7O0ZAtA+IjVKDFYnrqLswT7EYfQYPw=;
        b=L7sSZdTuCO7tnIT2jROXV//dkTRuQ8BxrfMn6uAjEDEMxh5/8f/g17LsxkWPbc9EK0
         GznhxB00B5xpbomL1thMZfsR3N2wilIfZJsjNfhQ5a63HTv2CaJlpG1N9TjSW3La5pal
         rFDLhFSPgqYFWuD5FbP9INd75ew9Axm6evU8kR9SKAEDH1AWl21wCtwWihEDOYROn8rN
         XLJXCWFQogT4ueJPxCmb1HmLZFXf3xsTt24a8QLA7vxl7qN/v8W6StNFrHOkPnuBXgYd
         /1CzbiaaWUhULqdJhSXQ+8/hcclHzvwPHtKvLMACegszRB4TEm5zpgYdzw3/PeLOa+og
         1HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694539200; x=1695144000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AD0AHYsYGGTB7O0ZAtA+IjVKDFYnrqLswT7EYfQYPw=;
        b=irQIA5/Qf6mX8siJeOHSF7tTcx9NPuQOkO7fuQq4rahHylvwmMrQgEcXm8VFXyu4HH
         KFs6nSpgYUlvfuWS/pFINrdWbC86F/p8pb+F6F9sAKx5VzZFlT3BLEI/MshF3FeyhuYh
         oexWaCdL89RdDGbFyPdWjGSaSMJkTgEFMZU5SxetI2vTonKCFsImfOO3Hx5SNpElMOat
         oEn9iLY6F9/0lQUR3fJXOo70vDt99tY84TobQbCYc915QagLEPkYpTrHSaYvSVdiOdUi
         /CWQqPU/ifmJwOc8VYnNEtcl0Xy/Jby2xWUK/AGV+2FKySMAtXBVKQpqfq+Fl0OwqKn1
         Up/Q==
X-Gm-Message-State: AOJu0YwIoRTR4xY5BmBvaPlcHh2H47eUBwOCRZGiHzY+Gw5QdlX+fgVX
	ONdrtdvOiGsLuzlNB7ihu6b+LQP5eqpGpv6cwtIvqA==
X-Google-Smtp-Source: AGHT+IHsQO9qz+83Co1ldT6zap7G7w1tLQkrcgihOMcopOCSoB2avvD9rKaeLgS4CP9FJHlodkN0Vw==
X-Received: by 2002:a05:620a:8cc:b0:76e:f960:2f79 with SMTP id z12-20020a05620a08cc00b0076ef9602f79mr73905qkz.46.1694539200396;
        Tue, 12 Sep 2023 10:20:00 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id n3-20020ae9c303000000b0076d25b11b62sm3356726qkg.38.2023.09.12.10.19.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:20:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/4] patchtest: Add test suite for oe-core
Date: Tue, 12 Sep 2023 13:19:54 -0400
Message-ID: <20230912171958.1575518-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 17:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187535

As part of the patchtest revitalization project, the patchtest-oe
repository (https://git.yoctoproject.org/patchtest-oe/) has been updated
with fixes to tests, patch files used for testing, and the selftest
script. Since it is designed specifically as a test suite for
openembedded-core, it makes sense to include it in that repository to
reduce overall setup complexity and simplify further development of
patchtest itself. Additionally, it can be used as a baseline for tests
in other layers and/or new requirements for patch submissions.

This effort does not include migration of the actual patchtest tool or
related scripts, which remain in their own repository at
https://git.yoctoproject.org/patchtest/. What this series includes:

- Tests for validating patch format and metadata
- Sample patch files that target meta-selftest recipes 
- A selftest script for testing the sample patches against oe-core
- A requirements.txt file listing the modules that patchtest needs to
  run correctly
- A README describing how to properly setup the selftest run

Example output from selftest:

[tgamblin@megalith patchtest]$ ./selftest/selftest
XPASS: PatchSignedOffBy.test_signed_off_by_presence (file: PatchSignedOffBy.test_signed_off_by_presence.pass)
XFAIL: Shortlog.test_shortlog_format (file: Shortlog.test_shortlog_format.fail)
XFAIL: MboxFormat.test_mbox_format (file: MboxFormat.test_mbox_format.1.fail)
XPASS: Shortlog.test_shortlog_length (file: Shortlog.test_shortlog_length.pass)
XFAIL: CommitMessage.test_commit_message_presence (file: CommitMessage.test_commit_message_presence.fail)
XFAIL: SrcUri.test_src_uri_left_files (file: SrcUri.test_src_uri_left_files.fail)
XPASS: Author.test_author_valid (file: Author.test_author_valid.1.pass)
XFAIL: LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned (file: LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail)
XPASS: CVE.test_cve_tag_format (file: CVE.test_cve_tag_format.pass)
XPASS: CVE.test_cve_presence_in_commit_message (file: CVE.test_cve_presence_in_commit_message.pass)
XFAIL: CVE.test_cve_tag_format (file: CVE.test_cve_tag_format.fail)
XFAIL: Author.test_author_valid (file: Author.test_author_valid.1.fail)
XFAIL: LicFilesChkSum.test_lic_files_chksum_presence (file: LicFilesChkSum.test_lic_files_chksum_presence.fail)
XPASS: MboxFormat.test_mbox_format (file: MboxFormat.test_mbox_format.pass)
XFAIL: SignedOffBy.test_signed_off_by_presence (file: SignedOffBy.test_signed_off_by_presence.1.fail)
XPASS: Shortlog.test_shortlog_format (file: Shortlog.test_shortlog_format.pass)
XFAIL: SignedOffBy.test_signed_off_by_presence (file: SignedOffBy.test_signed_off_by_presence.2.fail)
XFAIL: MboxFormat.test_mbox_format (file: MboxFormat.test_mbox_format.2.fail)
XFAIL: Summary.test_summary_presence (file: Summary.test_summary_presence.fail)
XPASS: Author.test_author_valid (file: Author.test_author_valid.2.pass)
XPASS: Bugzilla.test_bugzilla_entry_format (file: Bugzilla.test_bugzilla_entry_format.pass)
XFAIL: CVE.test_cve_presence_in_commit_message (file: CVE.test_cve_presence_in_commit_message.fail)
XPASS: SignedOffBy.test_signed_off_by_presence (file: SignedOffBy.test_signed_off_by_presence.pass)
XPASS: LicFilesChkSum.test_lic_files_chksum_presence (file: LicFilesChkSum.test_lic_files_chksum_presence.pass)
XPASS: Merge.test_series_merge_on_head (file: Merge.test_series_merge_on_head.pass)
XPASS: CommitMessage.test_commit_message_presence (file: CommitMessage.test_commit_message_presence.pass)
XFAIL: Merge.test_series_merge_on_head (file: Merge.test_series_merge_on_head.fail)
XPASS: Summary.test_summary_presence (file: Summary.test_summary_presence.pass)
XPASS: LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned (file: LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass)
XFAIL: Shortlog.test_shortlog_length (file: Shortlog.test_shortlog_length.fail)
XFAIL: PatchSignedOffBy.test_signed_off_by_presence (file: PatchSignedOffBy.test_signed_off_by_presence.fail)
XFAIL: Bugzilla.test_bugzilla_entry_format (file: Bugzilla.test_bugzilla_entry_format.fail)
XPASS: SrcUri.test_src_uri_left_files (file: SrcUri.test_src_uri_left_files.pass)
XFAIL: Author.test_author_valid (file: Author.test_author_valid.2.fail)
============================================================================
Testsuite summary for patchtest
============================================================================
# TOTAL: 34
# XPASS: 16
# XFAIL: 18
# PASS: 0
# FAIL: 0
# SKIP: 0
# ERROR: 0
============================================================================

Trevor Gamblin (4):
  patchtest: Add tests from patchtest-oe repo
  selftest: remove configurable target
  patchtest: add requirements.txt
  patchtest: Add README.md for selftests

 meta/lib/patchtest/README.md                  |  20 ++
 meta/lib/patchtest/requirements.txt           |   4 +
 .../files/Author.test_author_valid.1.fail     |  32 +++
 .../files/Author.test_author_valid.1.pass     |  31 +++
 .../files/Author.test_author_valid.2.fail     |  31 +++
 .../files/Author.test_author_valid.2.pass     |  31 +++
 .../Bugzilla.test_bugzilla_entry_format.fail  |  25 ++
 .../Bugzilla.test_bugzilla_entry_format.pass  |  25 ++
 ...E.test_cve_presence_in_commit_message.fail |  72 ++++++
 ...E.test_cve_presence_in_commit_message.pass |  74 ++++++
 .../files/CVE.test_cve_tag_format.fail        |  73 ++++++
 .../files/CVE.test_cve_tag_format.pass        |  73 ++++++
 ...tMessage.test_commit_message_presence.fail |  22 ++
 ...tMessage.test_commit_message_presence.pass |  24 ++
 ...c_files_chksum_modified_not_mentioned.fail |  37 +++
 ...c_files_chksum_modified_not_mentioned.pass |  39 +++
 ...ChkSum.test_lic_files_chksum_presence.fail |  53 ++++
 ...ChkSum.test_lic_files_chksum_presence.pass |  54 ++++
 .../files/MboxFormat.test_mbox_format.1.fail  |  36 +++
 .../files/MboxFormat.test_mbox_format.2.fail  |  35 +++
 .../files/MboxFormat.test_mbox_format.pass    |  33 +++
 .../Merge.test_series_merge_on_head.fail      |  41 +++
 .../Merge.test_series_merge_on_head.pass      |  35 +++
 ...gnedOffBy.test_signed_off_by_presence.fail |  71 ++++++
 ...gnedOffBy.test_signed_off_by_presence.pass |  72 ++++++
 .../files/Shortlog.test_shortlog_format.fail  |  73 ++++++
 .../files/Shortlog.test_shortlog_format.pass  |  73 ++++++
 .../files/Shortlog.test_shortlog_length.fail  |  73 ++++++
 .../files/Shortlog.test_shortlog_length.pass  |  73 ++++++
 ...edOffBy.test_signed_off_by_presence.1.fail |  71 ++++++
 ...edOffBy.test_signed_off_by_presence.2.fail |  72 ++++++
 ...gnedOffBy.test_signed_off_by_presence.pass |  72 ++++++
 .../files/SrcUri.test_src_uri_left_files.fail |  35 +++
 .../files/SrcUri.test_src_uri_left_files.pass |  51 ++++
 .../files/Summary.test_summary_presence.fail  |  46 ++++
 .../files/Summary.test_summary_presence.pass  |  49 ++++
 meta/lib/patchtest/selftest/selftest          |  89 +++++++
 meta/lib/patchtest/tests/__init__.py          |   0
 meta/lib/patchtest/tests/base.py              | 239 ++++++++++++++++++
 meta/lib/patchtest/tests/pyparsing/common.py  |  26 ++
 .../tests/pyparsing/parse_cve_tags.py         |  18 ++
 .../tests/pyparsing/parse_shortlog.py         |  14 +
 .../tests/pyparsing/parse_signed_off_by.py    |  22 ++
 .../tests/pyparsing/parse_upstream_status.py  |  24 ++
 meta/lib/patchtest/tests/test_mbox_author.py  |  29 +++
 .../lib/patchtest/tests/test_mbox_bugzilla.py |  22 ++
 meta/lib/patchtest/tests/test_mbox_cve.py     |  49 ++++
 .../patchtest/tests/test_mbox_description.py  |  17 ++
 meta/lib/patchtest/tests/test_mbox_format.py  |  16 ++
 .../patchtest/tests/test_mbox_mailinglist.py  |  64 +++++
 meta/lib/patchtest/tests/test_mbox_merge.py   |  25 ++
 .../lib/patchtest/tests/test_mbox_shortlog.py |  41 +++
 .../tests/test_mbox_signed_off_by.py          |  28 ++
 .../tests/test_metadata_lic_files_chksum.py   |  82 ++++++
 .../patchtest/tests/test_metadata_license.py  |  55 ++++
 .../tests/test_metadata_max_length.py         |  26 ++
 .../patchtest/tests/test_metadata_src_uri.py  |  75 ++++++
 .../patchtest/tests/test_metadata_summary.py  |  32 +++
 meta/lib/patchtest/tests/test_patch_cve.py    |  51 ++++
 .../tests/test_patch_signed_off_by.py         |  43 ++++
 .../tests/test_patch_upstream_status.py       |  64 +++++
 .../lib/patchtest/tests/test_python_pylint.py |  61 +++++
 62 files changed, 2943 insertions(+)
 create mode 100644 meta/lib/patchtest/README.md
 create mode 100644 meta/lib/patchtest/requirements.txt
 create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass
 create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass
 create mode 100644 meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass
 create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail
 create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass
 create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail
 create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass
 create mode 100644 meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail
 create mode 100644 meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass
 create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail
 create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass
 create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail
 create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass
 create mode 100644 meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail
 create mode 100644 meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail
 create mode 100644 meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass
 create mode 100644 meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass
 create mode 100644 meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail
 create mode 100644 meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass
 create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass
 create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass
 create mode 100644 meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail
 create mode 100644 meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail
 create mode 100644 meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass
 create mode 100644 meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail
 create mode 100644 meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass
 create mode 100644 meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail
 create mode 100644 meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass
 create mode 100755 meta/lib/patchtest/selftest/selftest
 create mode 100644 meta/lib/patchtest/tests/__init__.py
 create mode 100644 meta/lib/patchtest/tests/base.py
 create mode 100644 meta/lib/patchtest/tests/pyparsing/common.py
 create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
 create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
 create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
 create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_author.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_bugzilla.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_cve.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_description.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_format.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_mailinglist.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_merge.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_shortlog.py
 create mode 100644 meta/lib/patchtest/tests/test_mbox_signed_off_by.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata_license.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata_max_length.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata_src_uri.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata_summary.py
 create mode 100644 meta/lib/patchtest/tests/test_patch_cve.py
 create mode 100644 meta/lib/patchtest/tests/test_patch_signed_off_by.py
 create mode 100644 meta/lib/patchtest/tests/test_patch_upstream_status.py
 create mode 100644 meta/lib/patchtest/tests/test_python_pylint.py

-- 
2.41.0


