Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718A8EE01F0
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:01:01 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.2340.1694624452067329049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=of1H7KP3;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6515d44b562so225806d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694624451; x=1695229251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8y7keVn/5cqvVY5Tbr2EN+O70NdEvjcO4eWEEJLwK+0=;
        b=of1H7KP3OvEUJ/fhDlwSZneeWcL7f9OJAJjfX4XxMHvFQv7moaw8a0Az8Hg6+dN0Eh
         MiWXZQ/1RG2K3y/WwTC/znBRhdwfjdoWed93Do+kqAFPSWej10Wtebu9twF+AHedrSAY
         VuA2z1NioLpdE12nOrdCnw6a2YrmpFlE2eccE4qJvxA/dedwnx5X4oocMxSR1OtgNQEv
         AIV4D/r+33uVLV8fKqdWkXjBkaQmJvTik19mb7HyS8CKioRHVxXEB/+/ztDhfaJCRhYo
         ekM6l3NKHA3kMGHSxjKWS2/Er1kt4ypMpI1nk/X3ceWAqci3XL7o/qvqKTAlZIe/e/RU
         BUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624451; x=1695229251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8y7keVn/5cqvVY5Tbr2EN+O70NdEvjcO4eWEEJLwK+0=;
        b=bdu10yOXnF0UPiUiu0ZoW3BRo+MkvXSAlQZZ6fgEWNYTILwzZXbef4SeXg/+YpwV3a
         Vl8PAa8Tie+Eu7M9qoyuDYHwMYlJNlOsgpThSsnOVG12iETkHPeOizxIqib6w1aMnpqu
         5UL4Ot4Bzzwz9bJd8NF7P02spP2U/vlXJbtEHJlTbFSt9JF+E5ZqSEeelTxd6lBMKmgM
         MqmgNNE9Fn0CZK8UWay41dZvcUzGAewhtc84NOSpqcYXUKImqrre78Y+IhpOAVNwuCB/
         aUuA8Ba+qqpPJag6vMqBNPr2q98OPfuek2WyYLPVILFv7PPBl6aCMXo/amD5DGC9NhvZ
         Wi/w==
X-Gm-Message-State: AOJu0YyPWGy5x1TeATwHNYLg59sNa4REO5yAu8B2pw0nZ40IhjFjVnNO
	I7EKR37k47p9eBPaG/XcHhTmN+fkD2JL2ICO3HF69w==
X-Google-Smtp-Source: AGHT+IEeFget05mAiBQSaw5WhSBYFoHmYx3Kq03ry5N4CMPCQ5Jo8hEVvVDfvItbDZ4oo+YoCVtKrw==
X-Received: by 2002:a05:6214:508e:b0:655:88e9:1b09 with SMTP id kk14-20020a056214508e00b0065588e91b09mr4035581qvb.18.1694624450611;
        Wed, 13 Sep 2023 10:00:50 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l4-20020a0ce504000000b0064a5de64668sm4512014qvm.141.2023.09.13.10.00.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:00:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2 0/4] patchtest: Add test suite for oe-core
Date: Wed, 13 Sep 2023 13:00:45 -0400
Message-ID: <20230913170049.1622451-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187613

v2 is a resend after a refactor to the patchtest CLI. Patch 3 is
unchanged, while patch 4 only fixes a typo. Patchtest change:
https://git.yoctoproject.org/patchtest/commit/?id=28fa31f48de960ccba9e6d410dc41dbed3355b29

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


