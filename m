Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B75AC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:07:57 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.71513.1698329271085660134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wligtyol;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-41dd8fd947cso6138561cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698329269; x=1698934069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydIyQV6o9wTxCDYZ6EyUrcSasFh6MFiMvi+hd19OmB4=;
        b=wligtyolslQmQ7JC1nFr97S1lgcfgr/fFNtrGohl529b/+rtUZTAQ6DJu8ECTnkd1h
         1zaSk2+25jIyR60ImNHd8t4JvrsSiLYEo96dICGqt7iC0BMNJ6ArnT+eEIeH91hXzdmp
         2mzQ3+zdevxrlss0NLDId+ERVCj5YHpYqF4S8Rau1LLJYtucaItBwdPFDjVKAVDcTrAW
         nk9PiUMg9eomOzaLW8DZvoRdMA34kiQn0+5+JdfhcU/TOkRVR2fkfMqcka8k1ijcDHWP
         yCpta6meiG6PzOw98das4Kyzy19z2VBezlV2h3KfBSfNG3Apr2d1ezhVN3udCGGcDWsO
         YyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698329269; x=1698934069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydIyQV6o9wTxCDYZ6EyUrcSasFh6MFiMvi+hd19OmB4=;
        b=OdbG8ODbC+WRpvv7bg88EKduwx20KInBJmVG20fssJWDcfiPYIdK2lbDcJt+dMyXV3
         VYvdHyOMzjhvd4dYAyJJuAMVuCgKfGs46G/ohM+U4ZshbOmKkHgTHtn/OY9qufgQaE4g
         3sLEgzkndwHDPGdSMRNPlQISv3aN0qY95LnREXMgLtBcwVQhnLvcMpIJrFIyHg+pJdkz
         qT6ZV9WlEHB4NyrjXBBsxoAvTI77nerzO3faDXa6VkWKLjrxqYhfifj4s9qdnfVFFSWq
         rBdsolxnpMg8Uv5X8s8HHeU3JViln3BtaPc5RS9zC/V8N6fvhY6gqbgCtNo+M14+R+Dp
         Y4Fg==
X-Gm-Message-State: AOJu0YzPpdNHFclEnuy4dE8Qbar1h3P8eHBLYzXhlY0dUXTUTBiATUUQ
	akzsRjF7m7jAqfkL0S+XZdMzydnKkwTyrqrLVFPUGQ==
X-Google-Smtp-Source: AGHT+IEBfgcXMnsqUFl4kBJn2S2/D7BzQkPGcaXP7t5XJp1g8VsnfV7yC8Oz4dICnTIzVeOxZks+SA==
X-Received: by 2002:ac8:5b94:0:b0:417:a74f:69b5 with SMTP id a20-20020ac85b94000000b00417a74f69b5mr23930609qta.33.1698329267857;
        Thu, 26 Oct 2023 07:07:47 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id t10-20020ac8738a000000b00417db2593bdsm5021454qtp.72.2023.10.26.07.07.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:07:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: simplify test directory structure
Date: Thu, 26 Oct 2023 10:07:46 -0400
Message-ID: <20231026140746.172306-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 14:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189728

Consolidate the various mbox tests into a new TestMbox class, metadata
tests into TestMetadata, and patch tests into TestPatch. Also update the
selftest filenames to match the changes. The test contents are not
significantly changed (other than to reference the new class names).
While this doesn't improve overall readability, it does result in more
obvious categorization, and more importantly reduces the number of calls
to setup tinfoil in the tests, resulting in a roughly 25% reduction in
runtime.

Before:

[tgamblin@megalith poky]$ time ./meta/lib/patchtest/selftest/selftest
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
XSKIP: Merge.test_series_merge_on_head (file: Merge.test_series_merge_on_head.2.skip)
XPASS: MboxFormat.test_mbox_format (file: MboxFormat.test_mbox_format.pass)
XFAIL: SignedOffBy.test_signed_off_by_presence (file: SignedOffBy.test_signed_off_by_presence.1.fail)
XPASS: Shortlog.test_shortlog_format (file: Shortlog.test_shortlog_format.pass)
XFAIL: SignedOffBy.test_signed_off_by_presence (file: SignedOffBy.test_signed_off_by_presence.2.fail)
XFAIL: MboxFormat.test_mbox_format (file: MboxFormat.test_mbox_format.2.fail)
XFAIL: Summary.test_summary_presence (file: Summary.test_summary_presence.fail)
XPASS: Author.test_author_valid (file: Author.test_author_valid.2.pass)
XSKIP: Merge.test_series_merge_on_head (file: Merge.test_series_merge_on_head.1.skip)
XPASS: Bugzilla.test_bugzilla_entry_format (file: Bugzilla.test_bugzilla_entry_format.pass)
XFAIL: CVE.test_cve_presence_in_commit_message (file: CVE.test_cve_presence_in_commit_message.fail)
XPASS: SignedOffBy.test_signed_off_by_presence (file: SignedOffBy.test_signed_off_by_presence.pass)
XPASS: LicFilesChkSum.test_lic_files_chksum_presence (file: LicFilesChkSum.test_lic_files_chksum_presence.pass)
XPASS: CommitMessage.test_commit_message_presence (file: CommitMessage.test_commit_message_presence.pass)
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
============================================================================

real    24m14.386s
user    1m13.599s
sys     0m21.477s

After:

[tgamblin@megalith poky]$ time ./meta/lib/patchtest/selftest/selftest
XFAIL: TestMbox.test_bugzilla_entry_format (file: TestMbox.test_bugzilla_entry_format.fail)
XPASS: TestMetadata.test_summary_presence (file: TestMetadata.test_summary_presence.pass)
XFAIL: TestMbox.test_mbox_format (file: TestMbox.test_mbox_format.1.fail)
XFAIL: TestMetadata.test_src_uri_left_files (file: TestMetadata.test_src_uri_left_files.fail)
XSKIP: TestMbox.test_series_merge_on_head (file: TestMbox.test_series_merge_on_head.2.skip)
XPASS: TestMbox.test_commit_message_presence (file: TestMbox.test_commit_message_presence.pass)
XFAIL: TestMbox.test_commit_message_presence (file: TestMbox.test_commit_message_presence.fail)
XPASS: TestMbox.test_signed_off_by_presence (file: TestMbox.test_signed_off_by_presence.pass)
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
XPASS: TestMbox.test_cve_presence_in_commit_message (file: TestMbox.test_cve_presence_in_commit_message.pass)
XFAIL: TestMbox.test_signed_off_by_presence (file: TestMbox.test_signed_off_by_presence.2.fail)
XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.2.fail)
XFAIL: TestMetadata.test_lic_files_chksum_presence (file: TestMetadata.test_lic_files_chksum_presence.fail)
XPASS: TestMbox.test_shortlog_format (file: TestMbox.test_shortlog_format.pass)
XPASS: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.pass)
XPASS: TestPatch.test_signed_off_by_presence (file: TestPatch.test_signed_off_by_presence.pass)
XFAIL: TestMetadata.test_lic_files_chksum_modified_not_mentioned (file: TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail)
XPASS: TestMbox.test_shortlog_length (file: TestMbox.test_shortlog_length.pass)
XFAIL: TestMbox.test_signed_off_by_presence (file: TestMbox.test_signed_off_by_presence.1.fail)
XFAIL: TestMbox.test_cve_presence_in_commit_message (file: TestMbox.test_cve_presence_in_commit_message.fail)
XFAIL: TestMetadata.test_summary_presence (file: TestMetadata.test_summary_presence.fail)
============================================================================
Testsuite summary for patchtest
============================================================================
============================================================================
real    18m39.749s
user    0m41.857s
sys     0m14.708s

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...fail => TestMbox.test_author_valid.1.fail} |   0
 ...pass => TestMbox.test_author_valid.1.pass} |   0
 ...fail => TestMbox.test_author_valid.2.fail} |   0
 ...pass => TestMbox.test_author_valid.2.pass} |   0
 ... TestMbox.test_bugzilla_entry_format.fail} |   0
 ... TestMbox.test_bugzilla_entry_format.pass} |   0
 ...estMbox.test_commit_message_presence.fail} |   0
 ...estMbox.test_commit_message_presence.pass} |   0
 ....test_cve_presence_in_commit_message.fail} |   0
 ....test_cve_presence_in_commit_message.pass} |   0
 ....fail => TestMbox.test_mbox_format.1.fail} |   0
 ....fail => TestMbox.test_mbox_format.2.fail} |   0
 ...at.pass => TestMbox.test_mbox_format.pass} |   0
 ...TestMbox.test_series_merge_on_head.1.skip} |   0
 ...TestMbox.test_series_merge_on_head.2.skip} |   0
 ...ail => TestMbox.test_shortlog_format.fail} |   0
 ...ass => TestMbox.test_shortlog_format.pass} |   0
 ...ail => TestMbox.test_shortlog_length.fail} |   2 +-
 ...ass => TestMbox.test_shortlog_length.pass} |   0
 ...stMbox.test_signed_off_by_presence.1.fail} |   0
 ...stMbox.test_signed_off_by_presence.2.fail} |   0
 ...TestMbox.test_signed_off_by_presence.pass} |   0
 ..._files_chksum_modified_not_mentioned.fail} |   0
 ..._files_chksum_modified_not_mentioned.pass} |   0
 ...adata.test_lic_files_chksum_presence.fail} |   0
 ...adata.test_lic_files_chksum_presence.pass} |   0
 ...TestMetadata.test_src_uri_left_files.fail} |   0
 ...TestMetadata.test_src_uri_left_files.pass} |   0
 ...> TestMetadata.test_summary_presence.fail} |   0
 ...> TestMetadata.test_summary_presence.pass} |   0
 ...ail => TestPatch.test_cve_tag_format.fail} |   0
 ...ass => TestPatch.test_cve_tag_format.pass} |   0
 ...estPatch.test_signed_off_by_presence.fail} |   0
 ...estPatch.test_signed_off_by_presence.pass} |   0
 meta/lib/patchtest/tests/test_mbox.py         | 183 ++++++++++++++++
 meta/lib/patchtest/tests/test_mbox_author.py  |  29 ---
 .../lib/patchtest/tests/test_mbox_bugzilla.py |  20 --
 meta/lib/patchtest/tests/test_mbox_cve.py     |  38 ----
 .../patchtest/tests/test_mbox_description.py  |  15 --
 meta/lib/patchtest/tests/test_mbox_format.py  |  14 --
 .../patchtest/tests/test_mbox_mailinglist.py  |  62 ------
 meta/lib/patchtest/tests/test_mbox_merge.py   |  27 ---
 .../lib/patchtest/tests/test_mbox_shortlog.py |  39 ----
 .../tests/test_mbox_signed_off_by.py          |  27 ---
 meta/lib/patchtest/tests/test_metadata.py     | 204 ++++++++++++++++++
 .../tests/test_metadata_lic_files_chksum.py   |  74 -------
 .../patchtest/tests/test_metadata_license.py  |  50 -----
 .../tests/test_metadata_max_length.py         |  25 ---
 .../patchtest/tests/test_metadata_src_uri.py  |  73 -------
 .../patchtest/tests/test_metadata_summary.py  |  26 ---
 ...patch_upstream_status.py => test_patch.py} |  53 ++++-
 meta/lib/patchtest/tests/test_patch_cve.py    |  37 ----
 .../tests/test_patch_signed_off_by.py         |  41 ----
 53 files changed, 436 insertions(+), 603 deletions(-)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.1.fail => TestMbox.test_author_valid.1.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.1.pass => TestMbox.test_author_valid.1.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.2.fail => TestMbox.test_author_valid.2.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.2.pass => TestMbox.test_author_valid.2.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Bugzilla.test_bugzilla_entry_format.fail => TestMbox.test_bugzilla_entry_format.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Bugzilla.test_bugzilla_entry_format.pass => TestMbox.test_bugzilla_entry_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{CommitMessage.test_commit_message_presence.fail => TestMbox.test_commit_message_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{CommitMessage.test_commit_message_presence.pass => TestMbox.test_commit_message_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{CVE.test_cve_presence_in_commit_message.fail => TestMbox.test_cve_presence_in_commit_message.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{CVE.test_cve_presence_in_commit_message.pass => TestMbox.test_cve_presence_in_commit_message.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{MboxFormat.test_mbox_format.1.fail => TestMbox.test_mbox_format.1.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{MboxFormat.test_mbox_format.2.fail => TestMbox.test_mbox_format.2.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{MboxFormat.test_mbox_format.pass => TestMbox.test_mbox_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Merge.test_series_merge_on_head.1.skip => TestMbox.test_series_merge_on_head.1.skip} (100%)
 rename meta/lib/patchtest/selftest/files/{Merge.test_series_merge_on_head.2.skip => TestMbox.test_series_merge_on_head.2.skip} (100%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_format.fail => TestMbox.test_shortlog_format.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{CVE.test_cve_tag_format.pass => TestMbox.test_shortlog_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_length.fail => TestMbox.test_shortlog_length.fail} (97%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_format.pass => TestMbox.test_shortlog_length.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{SignedOffBy.test_signed_off_by_presence.1.fail => TestMbox.test_signed_off_by_presence.1.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{SignedOffBy.test_signed_off_by_presence.2.fail => TestMbox.test_signed_off_by_presence.2.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{PatchSignedOffBy.test_signed_off_by_presence.pass => TestMbox.test_signed_off_by_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail => TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass => TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_presence.fail => TestMetadata.test_lic_files_chksum_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_presence.pass => TestMetadata.test_lic_files_chksum_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{SrcUri.test_src_uri_left_files.fail => TestMetadata.test_src_uri_left_files.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{SrcUri.test_src_uri_left_files.pass => TestMetadata.test_src_uri_left_files.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Summary.test_summary_presence.fail => TestMetadata.test_summary_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Summary.test_summary_presence.pass => TestMetadata.test_summary_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{CVE.test_cve_tag_format.fail => TestPatch.test_cve_tag_format.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_length.pass => TestPatch.test_cve_tag_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{PatchSignedOffBy.test_signed_off_by_presence.fail => TestPatch.test_signed_off_by_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{SignedOffBy.test_signed_off_by_presence.pass => TestPatch.test_signed_off_by_presence.pass} (100%)
 create mode 100644 meta/lib/patchtest/tests/test_mbox.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_author.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_bugzilla.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_cve.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_description.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_format.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_mailinglist.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_merge.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_shortlog.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_signed_off_by.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_license.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_max_length.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_src_uri.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_summary.py
 rename meta/lib/patchtest/tests/{test_patch_upstream_status.py => test_patch.py} (56%)
 delete mode 100644 meta/lib/patchtest/tests/test_patch_cve.py
 delete mode 100644 meta/lib/patchtest/tests/test_patch_signed_off_by.py

diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.fail
diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.pass
diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.fail
diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.pass
diff --git a/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
diff --git a/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
diff --git a/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
diff --git a/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass
diff --git a/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.1.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.1.fail
diff --git a/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.2.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.2.fail
diff --git a/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
diff --git a/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.1.skip b/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.1.skip
rename to meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
diff --git a/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.2.skip b/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.2.skip
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.2.skip
rename to meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.2.skip
diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
similarity index 97%
rename from meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
index 247b2a8a80d..629e78540bb 100644
--- a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
@@ -56,7 +56,7 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
++           file://0001-Fix-CVE-1234-56789.patch \
 +           "
  
  S = "${WORKDIR}"
diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
diff --git a/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
diff --git a/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail
rename to meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
diff --git a/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail
diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass
diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.fail
diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.pass
diff --git a/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
diff --git a/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
diff --git a/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.fail
diff --git a/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass
rename to meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.pass
diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail
rename to meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass
rename to meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
diff --git a/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail
rename to meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
diff --git a/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass
rename to meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
new file mode 100644
index 00000000000..95002c9e2a6
--- /dev/null
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -0,0 +1,183 @@
+# Checks related to the patch's author
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import base
+import collections
+import parse_cve_tags
+import parse_shortlog
+import parse_signed_off_by
+import pyparsing
+import subprocess
+from data import PatchTestInput
+
+def headlog():
+    output = subprocess.check_output(
+        "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchTestInput.repodir,
+        universal_newlines=True,
+        shell=True
+        )
+    return output.split('#')
+
+class TestMbox(base.Base):
+
+    auh_email = 'auh@auh.yoctoproject.org'
+
+    invalids = [pyparsing.Regex("^Upgrade Helper.+"),
+                pyparsing.Regex(auh_email),
+                pyparsing.Regex("uh@not\.set"),
+                pyparsing.Regex("\S+@example\.com")]
+
+    rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
+    rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
+    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
+    prog = parse_cve_tags.cve_tag
+    patch_prog = parse_cve_tags.patch_cve_tag
+    signoff_prog = parse_signed_off_by.signed_off_by
+    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
+    maxlength = 90
+
+    # base paths of main yocto project sub-projects
+    paths = {
+        'oe-core': ['meta-selftest', 'meta-skeleton', 'meta', 'scripts'],
+        'bitbake': ['bitbake'],
+        'documentation': ['documentation'],
+        'poky': ['meta-poky','meta-yocto-bsp'],
+        'oe': ['meta-gpe', 'meta-gnome', 'meta-efl', 'meta-networking', 'meta-multimedia','meta-initramfs', 'meta-ruby', 'contrib', 'meta-xfce', 'meta-filesystems', 'meta-perl', 'meta-webserver', 'meta-systemd', 'meta-oe', 'meta-python']
+        }
+
+    # scripts folder is a mix of oe-core and poky, most is oe-core code except:
+    poky_scripts = ['scripts/yocto-bsp', 'scripts/yocto-kernel', 'scripts/yocto-layer', 'scripts/lib/bsp']
+
+    Project = collections.namedtuple('Project', ['name', 'listemail', 'gitrepo', 'paths'])
+
+    bitbake = Project(name='Bitbake', listemail='bitbake-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/bitbake/', paths=paths['bitbake'])
+    doc     = Project(name='Documentantion', listemail='yocto@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/', paths=paths['documentation'])
+    poky    = Project(name='Poky', listemail='poky@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/poky/', paths=paths['poky'])
+    oe      = Project(name='oe', listemail='openembedded-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/meta-openembedded/', paths=paths['oe'])
+
+
+    def test_signed_off_by_presence(self):
+        for commit in TestMbox.commits:
+            # skip those patches that revert older commits, these do not required the tag presence
+            if self.revert_shortlog_regex.search_string(commit.shortlog):
+                continue
+            if not self.signoff_prog.search_string(commit.payload):
+                self.fail('Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
+                          commit=commit)
+
+    def test_shortlog_format(self):
+        for commit in TestMbox.commits:
+            shortlog = commit.shortlog
+            if not shortlog.strip():
+                self.skip('Empty shortlog, no reason to execute shortlog format test')
+            else:
+                # no reason to re-check on revert shortlogs
+                if shortlog.startswith('Revert "'):
+                    continue
+                try:
+                    parse_shortlog.shortlog.parseString(shortlog)
+                except pyparsing.ParseException as pe:
+                    self.fail('Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
+                              commit=commit)
+
+    def test_shortlog_length(self):
+        for commit in TestMbox.commits:
+            # no reason to re-check on revert shortlogs
+            shortlog = commit.shortlog
+            if shortlog.startswith('Revert "'):
+                continue
+            l = len(shortlog)
+            if l > self.maxlength:
+                self.fail('Edit shortlog so that it is %d characters or less (currently %d characters)' % (self.maxlength, l),
+                          commit=commit)
+
+    def test_series_merge_on_head(self):
+        self.skip("Merge test is disabled for now")
+        if PatchTestInput.repo.branch != "master":
+            self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
+        if not PatchTestInput.repo.ismerged:
+            commithash, author, date, shortlog = headlog()
+            self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
+                      data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
+
+    def test_target_mailing_list(self):
+        """In case of merge failure, check for other targeted projects"""
+        if PatchTestInput.repo.ismerged:
+            self.skip('Series merged, no reason to check other mailing lists')
+
+        # a meta project may be indicted in the message subject, if this is the case, just fail
+        # TODO: there may be other project with no-meta prefix, we also need to detect these
+        project_regex = pyparsing.Regex("\[(?P<project>meta-.+)\]")
+        for commit in TestMbox.commits:
+            match = project_regex.search_string(commit.subject)
+            if match:
+                self.fail('Series sent to the wrong mailing list. Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
+                          commit=commit)
+
+        for patch in self.patchset:
+            folders = patch.path.split('/')
+            base_path = folders[0]
+            for project in [self.bitbake, self.doc, self.oe, self.poky]:
+                if base_path in  project.paths:
+                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
+                              data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
+                                    ('Patch\'s path:', patch.path)])
+
+            # check for poky's scripts code
+            if base_path.startswith('scripts'):
+                for poky_file in self.poky_scripts:
+                    if patch.path.startswith(poky_file):
+                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
+                                  data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
+
+    def test_mbox_format(self):
+        if self.unidiff_parse_error:
+            self.fail('Series cannot be parsed correctly due to malformed diff lines. Create the series again using git-format-patch and ensure it can be applied using git am',
+                      data=[('Diff line',self.unidiff_parse_error)])
+
+    def test_commit_message_presence(self):
+        for commit in TestMbox.commits:
+            if not commit.commit_message.strip():
+                self.fail('Mbox is missing a descriptive commit message. Please include a commit message on your patch explaining the change', commit=commit)
+
+    def test_cve_presence_in_commit_message(self):
+        if self.unidiff_parse_error:
+            self.skip('Parse error %s' % self.unidiff_parse_error)
+
+        # we are just interested in series that introduce CVE patches, thus discard other
+        # possibilities: modification to current CVEs, patch directly introduced into the
+        # recipe, upgrades already including the CVE, etc.
+        new_patches = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
+        if not new_patches:
+            self.skip('No new patches introduced')
+
+        for commit in TestMbox.commits:
+            # skip those patches that revert older commits, these do not required the tag presence
+            if self.revert_shortlog_regex.search_string(commit.shortlog):
+                continue
+            if not self.patch_prog.search_string(commit.payload):
+                self.skip("No CVE tag in added patch, so not needed in mbox")
+            elif not self.prog.search_string(commit.payload):
+                self.fail('Missing or incorrectly formatted CVE tag in mbox. Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
+                          commit=commit)
+
+    def test_bugzilla_entry_format(self):
+        for commit in TestMbox.commits:
+            if not self.rexp_detect.search_string(commit.commit_message):
+                self.skip("No bug ID found")
+            elif not self.rexp_validation.search_string(commit.commit_message):
+                self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
+
+    def test_author_valid(self):
+        for commit in self.commits:
+            for invalid in self.invalids:
+                if invalid.search_string(commit.author):
+                    self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
+
+    def test_non_auh_upgrade(self):
+        for commit in self.commits:
+            if self.auh_email in commit.payload:
+                self.fail('Invalid author %s. Resend the series with a valid patch author' % self.auh_email, commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_author.py b/meta/lib/patchtest/tests/test_mbox_author.py
deleted file mode 100644
index 74bc441250a..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_author.py
+++ /dev/null
@@ -1,29 +0,0 @@
-# Checks related to the patch's author
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import pyparsing
-
-class Author(base.Base):
-
-    auh_email = 'auh@auh.yoctoproject.org'
-
-    invalids = [pyparsing.Regex("^Upgrade Helper.+"),
-                pyparsing.Regex(auh_email),
-                pyparsing.Regex("uh@not\.set"),
-                pyparsing.Regex("\S+@example\.com")]
-
-
-    def test_author_valid(self):
-        for commit in self.commits:
-            for invalid in self.invalids:
-                if invalid.search_string(commit.author):
-                    self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
-
-    def test_non_auh_upgrade(self):
-        for commit in self.commits:
-            if self.auh_email in commit.payload:
-                self.fail('Invalid author %s. Resend the series with a valid patch author' % self.auh_email, commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_bugzilla.py b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
deleted file mode 100644
index 99b529b7559..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_bugzilla.py
+++ /dev/null
@@ -1,20 +0,0 @@
-# Checks related to the patch's bugzilla tag
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import pyparsing
-import base
-
-class Bugzilla(base.Base):
-    rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
-    rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
-
-    def test_bugzilla_entry_format(self):
-        for commit in Bugzilla.commits:
-            if not self.rexp_detect.search_string(commit.commit_message):
-                self.skip("No bug ID found")
-            elif not self.rexp_validation.search_string(commit.commit_message):
-                self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
-
diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchtest/tests/test_mbox_cve.py
deleted file mode 100644
index 29ab12cbb53..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_cve.py
+++ /dev/null
@@ -1,38 +0,0 @@
-# Checks related to the patch's CVE lines
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import base
-import parse_cve_tags
-import pyparsing
-
-class CVE(base.Base):
-
-    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
-    prog = parse_cve_tags.cve_tag
-    patch_prog = parse_cve_tags.patch_cve_tag
-
-    def setUp(self):
-        if self.unidiff_parse_error:
-            self.skip('Parse error %s' % self.unidiff_parse_error)
-
-        # we are just interested in series that introduce CVE patches, thus discard other
-        # possibilities: modification to current CVEs, patch directly introduced into the
-        # recipe, upgrades already including the CVE, etc.
-        new_patches = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
-        if not new_patches:
-            self.skip('No new patches introduced')
-
-    def test_cve_presence_in_commit_message(self):
-        for commit in CVE.commits:
-            # skip those patches that revert older commits, these do not required the tag presence
-            if self.revert_shortlog_regex.search_string(commit.shortlog):
-                continue
-            if not self.patch_prog.search_string(commit.payload):
-                self.skip("No CVE tag in added patch, so not needed in mbox")
-            elif not self.prog.search_string(commit.payload):
-                self.fail('Missing or incorrectly formatted CVE tag in mbox. Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
-                          commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_description.py b/meta/lib/patchtest/tests/test_mbox_description.py
deleted file mode 100644
index 7874f9d0382..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_description.py
+++ /dev/null
@@ -1,15 +0,0 @@
-# Checks related to the patch's commit_message
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-
-class CommitMessage(base.Base):
-
-    def test_commit_message_presence(self):
-        for commit in CommitMessage.commits:
-            if not commit.commit_message.strip():
-                self.fail('Mbox is missing a descriptive commit message. Please include a commit message on your patch explaining the change', commit=commit)
-
diff --git a/meta/lib/patchtest/tests/test_mbox_format.py b/meta/lib/patchtest/tests/test_mbox_format.py
deleted file mode 100644
index fea3793e2e4..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_format.py
+++ /dev/null
@@ -1,14 +0,0 @@
-# Checks correct parsing of mboxes
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-
-class MboxFormat(base.Base):
-
-    def test_mbox_format(self):
-        if self.unidiff_parse_error:
-            self.fail('Series cannot be parsed correctly due to malformed diff lines. Create the series again using git-format-patch and ensure it can be applied using git am',
-                      data=[('Diff line',self.unidiff_parse_error)])
diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
deleted file mode 100644
index feff4360894..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_mailinglist.py
+++ /dev/null
@@ -1,62 +0,0 @@
-# Check if the series was intended for other project (not OE-Core)
-#
-# Copyright (C) 2017 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import collections
-import base
-import pyparsing
-from data import PatchTestInput
-
-class MailingList(base.Base):
-
-    # base paths of main yocto project sub-projects
-    paths = {
-        'oe-core': ['meta-selftest', 'meta-skeleton', 'meta', 'scripts'],
-        'bitbake': ['bitbake'],
-        'documentation': ['documentation'],
-        'poky': ['meta-poky','meta-yocto-bsp'],
-        'oe': ['meta-gpe', 'meta-gnome', 'meta-efl', 'meta-networking', 'meta-multimedia','meta-initramfs', 'meta-ruby', 'contrib', 'meta-xfce', 'meta-filesystems', 'meta-perl', 'meta-webserver', 'meta-systemd', 'meta-oe', 'meta-python']
-        }
-
-    # scripts folder is a mix of oe-core and poky, most is oe-core code except:
-    poky_scripts = ['scripts/yocto-bsp', 'scripts/yocto-kernel', 'scripts/yocto-layer', 'scripts/lib/bsp']
-
-    Project = collections.namedtuple('Project', ['name', 'listemail', 'gitrepo', 'paths'])
-
-    bitbake = Project(name='Bitbake', listemail='bitbake-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/bitbake/', paths=paths['bitbake'])
-    doc     = Project(name='Documentantion', listemail='yocto@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/', paths=paths['documentation'])
-    poky    = Project(name='Poky', listemail='poky@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/poky/', paths=paths['poky'])
-    oe      = Project(name='oe', listemail='openembedded-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/meta-openembedded/', paths=paths['oe'])
-
-
-    def test_target_mailing_list(self):
-        """In case of merge failure, check for other targeted projects"""
-        if PatchTestInput.repo.ismerged:
-            self.skip('Series merged, no reason to check other mailing lists')
-
-        # a meta project may be indicted in the message subject, if this is the case, just fail
-        # TODO: there may be other project with no-meta prefix, we also need to detect these
-        project_regex = pyparsing.Regex("\[(?P<project>meta-.+)\]")
-        for commit in MailingList.commits:
-            match = project_regex.search_string(commit.subject)
-            if match:
-                self.fail('Series sent to the wrong mailing list. Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
-                          commit=commit)
-
-        for patch in self.patchset:
-            folders = patch.path.split('/')
-            base_path = folders[0]
-            for project in [self.bitbake, self.doc, self.oe, self.poky]:
-                if base_path in  project.paths:
-                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
-                              data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
-                                    ('Patch\'s path:', patch.path)])
-
-            # check for poky's scripts code
-            if base_path.startswith('scripts'):
-                for poky_file in self.poky_scripts:
-                    if patch.path.startswith(poky_file):
-                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
-                                  data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
deleted file mode 100644
index 535026209f7..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ /dev/null
@@ -1,27 +0,0 @@
-# Check if mbox was merged by patchtest
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import subprocess
-import base
-from data import PatchTestInput
-
-def headlog():
-    output = subprocess.check_output(
-        "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchTestInput.repodir,
-        universal_newlines=True,
-        shell=True
-        )
-    return output.split('#')
-
-class Merge(base.Base):
-    def test_series_merge_on_head(self):
-        self.skip("Merge test is disabled for now")
-        if PatchTestInput.repo.branch != "master":
-            self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
-        if not PatchTestInput.repo.ismerged:
-            commithash, author, date, shortlog = headlog()
-            self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
-                      data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
diff --git a/meta/lib/patchtest/tests/test_mbox_shortlog.py b/meta/lib/patchtest/tests/test_mbox_shortlog.py
deleted file mode 100644
index f5dbbc7807b..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_shortlog.py
+++ /dev/null
@@ -1,39 +0,0 @@
-# Checks related to the patch's  summary
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import parse_shortlog
-import pyparsing
-
-maxlength = 90
-
-class Shortlog(base.Base):
-
-    def test_shortlog_format(self):
-        for commit in Shortlog.commits:
-            shortlog = commit.shortlog
-            if not shortlog.strip():
-                self.skip('Empty shortlog, no reason to execute shortlog format test')
-            else:
-                # no reason to re-check on revert shortlogs
-                if shortlog.startswith('Revert "'):
-                    continue
-                try:
-                    parse_shortlog.shortlog.parseString(shortlog)
-                except pyparsing.ParseException as pe:
-                    self.fail('Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
-                              commit=commit)
-
-    def test_shortlog_length(self):
-        for commit in Shortlog.commits:
-            # no reason to re-check on revert shortlogs
-            shortlog = commit.shortlog
-            if shortlog.startswith('Revert "'):
-                continue
-            l = len(shortlog)
-            if l > maxlength:
-                self.fail('Edit shortlog so that it is %d characters or less (currently %d characters)' % (maxlength, l),
-                          commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
deleted file mode 100644
index f3c57709619..00000000000
--- a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
+++ /dev/null
@@ -1,27 +0,0 @@
-# Checks related to the patch's signed-off-by lines
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import parse_signed_off_by
-import pyparsing
-
-class SignedOffBy(base.Base):
-
-    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
-
-    @classmethod
-    def setUpClassLocal(cls):
-        # match self.mark with no '+' preceding it
-        cls.prog = parse_signed_off_by.signed_off_by
-
-    def test_signed_off_by_presence(self):
-        for commit in SignedOffBy.commits:
-            # skip those patches that revert older commits, these do not required the tag presence
-            if self.revert_shortlog_regex.search_string(commit.shortlog):
-                continue
-            if not SignedOffBy.prog.search_string(commit.payload):
-                self.fail('Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
-                          commit=commit)
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
new file mode 100644
index 00000000000..34e119174fe
--- /dev/null
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -0,0 +1,204 @@
+# Checks related to the patch's LIC_FILES_CHKSUM  metadata variable
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import base
+import os
+import pyparsing
+from data import PatchTestInput, PatchTestDataStore
+
+class TestMetadata(base.Metadata):
+    metadata_lic = 'LICENSE'
+    invalid_license = 'PATCHTESTINVALID'
+    metadata_chksum = 'LIC_FILES_CHKSUM'
+    license_var  = 'LICENSE'
+    closed   = 'CLOSED'
+    lictag_re  = pyparsing.AtLineStart("License-Update:")
+    add_mark = pyparsing.Regex('\+ ')
+    max_length = 200
+    metadata_src_uri  = 'SRC_URI'
+    md5sum    = 'md5sum'
+    sha256sum = 'sha256sum'
+    git_regex = pyparsing.Regex('^git\:\/\/.*')
+    metadata_summary = 'SUMMARY'
+
+    def test_license_presence(self):
+        if not self.added:
+            self.skip('No added recipes, skipping test')
+
+        # TODO: this is a workaround so we can parse the recipe not
+        # containing the LICENSE var: add some default license instead
+        # of INVALID into auto.conf, then remove this line at the end
+        auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
+        open_flag = 'w'
+        if os.path.exists(auto_conf):
+            open_flag = 'a'
+        with open(auto_conf, open_flag) as fd:
+            for pn in self.added:
+                fd.write('LICENSE ??= "%s"\n' % self.invalid_license)
+
+        no_license = False
+        for pn in self.added:
+            rd = self.tinfoil.parse_recipe(pn)
+            license = rd.getVar(self.metadata_lic)
+            if license == self.invalid_license:
+                no_license = True
+                break
+
+        # remove auto.conf line or the file itself
+        if open_flag == 'w':
+            os.remove(auto_conf)
+        else:
+            fd = open(auto_conf, 'r')
+            lines = fd.readlines()
+            fd.close()
+            with open(auto_conf, 'w') as fd:
+                fd.write(''.join(lines[:-1]))
+
+        if no_license:
+            self.fail('Recipe does not have the LICENSE field set.')
+
+    def test_lic_files_chksum_presence(self):
+        if not self.added:
+            self.skip('No added recipes, skipping test')
+
+        for pn in self.added:
+            rd = self.tinfoil.parse_recipe(pn)
+            pathname = rd.getVar('FILE')
+            # we are not interested in images
+            if '/images/' in pathname:
+                continue
+            lic_files_chksum = rd.getVar(self.metadata_chksum)
+            if rd.getVar(self.license_var) == self.closed:
+                continue
+            if not lic_files_chksum:
+                self.fail('%s is missing in newly added recipe' % self.metadata_chksum)
+
+    def pretest_lic_files_chksum_modified_not_mentioned(self):
+        if not self.modified:
+            self.skip('No modified recipes, skipping pretest')
+        # get the proper metadata values
+        for pn in self.modified:
+            rd = self.tinfoil.parse_recipe(pn)
+            pathname = rd.getVar('FILE')
+            # we are not interested in images
+            if '/images/' in pathname:
+                continue
+            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata_chksum,pn)] = rd.getVar(self.metadata_chksum)
+
+    def test_lic_files_chksum_modified_not_mentioned(self):
+        if not self.modified:
+            self.skip('No modified recipes, skipping test')
+
+        # get the proper metadata values
+        for pn in self.modified:
+            rd = self.tinfoil.parse_recipe(pn)
+            pathname = rd.getVar('FILE')
+            # we are not interested in images
+            if '/images/' in pathname:
+                continue
+            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata_chksum,pn)] = rd.getVar(self.metadata_chksum)
+        # compare if there were changes between pre-merge and merge
+        for pn in self.modified:
+            pretest = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(),self.metadata_chksum, pn)]
+            test    = PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata_chksum, pn)]
+
+            # TODO: this is workaround to avoid false-positives when pretest metadata is empty (not reason found yet)
+            # For more info, check bug 12284
+            if not pretest:
+                return
+
+            if pretest != test:
+                # if any patch on the series contain reference on the metadata, fail
+                for commit in self.commits:
+                    if self.lictag_re.search_string(commit.commit_message):
+                       break
+                else:
+                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "License-Update:" tag in commit message. Include it with a brief description' % pn,
+                              data=[('Current checksum', pretest), ('New checksum', test)])
+
+    def test_max_line_length(self):
+        for patch in self.patchset:
+            # for the moment, we are just interested in metadata
+            if patch.path.endswith('.patch'):
+                continue
+            payload = str(patch)
+            for line in payload.splitlines():
+                if self.add_mark.search_string(line):
+                    current_line_length = len(line[1:])
+                    if current_line_length > self.max_length:
+                        self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, self.max_length),
+                                  data=[('Patch', patch.path), ('Line', '%s ...' % line[0:80])])
+
+    def pretest_src_uri_left_files(self):
+        # these tests just make sense on patches that can be merged
+        if not PatchTestInput.repo.canbemerged:
+            self.skip('Patch cannot be merged')
+        if not self.modified:
+            self.skip('No modified recipes, skipping pretest')
+
+        # get the proper metadata values
+        for pn in self.modified:
+            # we are not interested in images
+            if 'core-image' in pn:
+                continue
+            rd = self.tinfoil.parse_recipe(pn)
+            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)] = rd.getVar(self.metadata_src_uri)
+
+    def test_src_uri_left_files(self):
+        # these tests just make sense on patches that can be merged
+        if not PatchTestInput.repo.canbemerged:
+            self.skip('Patch cannot be merged')
+        if not self.modified:
+            self.skip('No modified recipes, skipping pretest')
+
+        # get the proper metadata values
+        for pn in self.modified:
+            # we are not interested in images
+            if 'core-image' in pn:
+                continue
+            rd = self.tinfoil.parse_recipe(pn)
+            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)] = rd.getVar(self.metadata_src_uri)
+
+        for pn in self.modified:
+            pretest_src_uri = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)].split()
+            test_src_uri    = PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)].split()
+
+            pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
+            test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
+
+            # check if files were removed
+            if len(test_files) < len(pretest_files):
+
+                # get removals from patchset
+                filesremoved_from_patchset = set()
+                for patch in self.patchset:
+                    if patch.is_removed_file:
+                        filesremoved_from_patchset.add(os.path.basename(patch.path))
+
+                # get the deleted files from the SRC_URI
+                filesremoved_from_usr_uri = pretest_files - test_files
+
+                # finally, get those patches removed at SRC_URI and not removed from the patchset
+                # TODO: we are not taking into account  renames, so test may raise false positives
+                not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
+                if not_removed:
+                    self.fail('Patches not removed from tree. Remove them and amend the submitted mbox',
+                              data=[('Patch', f) for f in not_removed])
+
+    def test_summary_presence(self):
+        if not self.added:
+            self.skip('No added recipes, skipping test')
+
+        for pn in self.added:
+            # we are not interested in images
+            if 'core-image' in pn:
+                continue
+            rd = self.tinfoil.parse_recipe(pn)
+            summary = rd.getVar(self.metadata_summary)
+
+            # "${PN} version ${PN}-${PR}" is the default, so fail if default
+            if summary.startswith('%s version' % pn):
+                self.fail('%s is missing in newly added recipe' % self.metadata_summary)
diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
deleted file mode 100644
index fa4a28c7b22..00000000000
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ /dev/null
@@ -1,74 +0,0 @@
-# Checks related to the patch's LIC_FILES_CHKSUM  metadata variable
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import pyparsing
-from data import PatchTestInput, PatchTestDataStore
-
-class LicFilesChkSum(base.Metadata):
-    metadata = 'LIC_FILES_CHKSUM'
-    license  = 'LICENSE'
-    closed   = 'CLOSED'
-    lictag_re  = pyparsing.AtLineStart("License-Update:")
-
-    def test_lic_files_chksum_presence(self):
-        if not self.added:
-            self.skip('No added recipes, skipping test')
-
-        for pn in self.added:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
-            # we are not interested in images
-            if '/images/' in pathname:
-                continue
-            lic_files_chksum = rd.getVar(self.metadata)
-            if rd.getVar(self.license) == self.closed:
-                continue
-            if not lic_files_chksum:
-                self.fail('%s is missing in newly added recipe' % self.metadata)
-
-    def pretest_lic_files_chksum_modified_not_mentioned(self):
-        if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
-        # get the proper metadata values
-        for pn in self.modified:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
-            # we are not interested in images
-            if '/images/' in pathname:
-                continue
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata,pn)] = rd.getVar(self.metadata)
-
-    def test_lic_files_chksum_modified_not_mentioned(self):
-        if not self.modified:
-            self.skip('No modified recipes, skipping test')
-
-        # get the proper metadata values
-        for pn in self.modified:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
-            # we are not interested in images
-            if '/images/' in pathname:
-                continue
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata,pn)] = rd.getVar(self.metadata)
-        # compare if there were changes between pre-merge and merge
-        for pn in self.modified:
-            pretest = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(),self.metadata, pn)]
-            test    = PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata, pn)]
-
-            # TODO: this is workaround to avoid false-positives when pretest metadata is empty (not reason found yet)
-            # For more info, check bug 12284
-            if not pretest:
-                return
-
-            if pretest != test:
-                # if any patch on the series contain reference on the metadata, fail
-                for commit in self.commits:
-                    if self.lictag_re.search_string(commit.commit_message):
-                       break
-                else:
-                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "License-Update:" tag in commit message. Include it with a brief description' % pn,
-                              data=[('Current checksum', pretest), ('New checksum', test)])
diff --git a/meta/lib/patchtest/tests/test_metadata_license.py b/meta/lib/patchtest/tests/test_metadata_license.py
deleted file mode 100644
index 1a7f09b7470..00000000000
--- a/meta/lib/patchtest/tests/test_metadata_license.py
+++ /dev/null
@@ -1,50 +0,0 @@
-# Checks related to the patch's LIC_FILES_CHKSUM  metadata variable
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import os
-from data import PatchTestInput
-
-class License(base.Metadata):
-    metadata = 'LICENSE'
-    invalid_license = 'PATCHTESTINVALID'
-
-    def test_license_presence(self):
-        if not self.added:
-            self.skip('No added recipes, skipping test')
-
-        # TODO: this is a workaround so we can parse the recipe not
-        # containing the LICENSE var: add some default license instead
-        # of INVALID into auto.conf, then remove this line at the end
-        auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
-        open_flag = 'w'
-        if os.path.exists(auto_conf):
-            open_flag = 'a'
-        with open(auto_conf, open_flag) as fd:
-            for pn in self.added:
-                fd.write('LICENSE ??= "%s"\n' % self.invalid_license)
-
-        no_license = False
-        for pn in self.added:
-            rd = self.tinfoil.parse_recipe(pn)
-            license = rd.getVar(self.metadata)
-            if license == self.invalid_license:
-                no_license = True
-                break
-
-        # remove auto.conf line or the file itself
-        if open_flag == 'w':
-            os.remove(auto_conf)
-        else:
-            fd = open(auto_conf, 'r')
-            lines = fd.readlines()
-            fd.close()
-            with open(auto_conf, 'w') as fd:
-                fd.write(''.join(lines[:-1]))
-
-        if no_license:
-            self.fail('Recipe does not have the LICENSE field set.')
-
diff --git a/meta/lib/patchtest/tests/test_metadata_max_length.py b/meta/lib/patchtest/tests/test_metadata_max_length.py
deleted file mode 100644
index 98c48ef7874..00000000000
--- a/meta/lib/patchtest/tests/test_metadata_max_length.py
+++ /dev/null
@@ -1,25 +0,0 @@
-# Checks related to patch line lengths
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import pyparsing
-
-class MaxLength(base.Base):
-    add_mark = pyparsing.Regex('\+ ')
-    max_length = 200
-
-    def test_max_line_length(self):
-        for patch in self.patchset:
-            # for the moment, we are just interested in metadata
-            if patch.path.endswith('.patch'):
-                continue
-            payload = str(patch)
-            for line in payload.splitlines():
-                if self.add_mark.search_string(line):
-                    current_line_length = len(line[1:])
-                    if current_line_length > self.max_length:
-                        self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, self.max_length),
-                                  data=[('Patch', patch.path), ('Line', '%s ...' % line[0:80])])
diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib/patchtest/tests/test_metadata_src_uri.py
deleted file mode 100644
index 87a24ea937e..00000000000
--- a/meta/lib/patchtest/tests/test_metadata_src_uri.py
+++ /dev/null
@@ -1,73 +0,0 @@
-# Checks related to the patch's SRC_URI metadata variable
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import os
-import pyparsing
-from data import PatchTestInput, PatchTestDataStore
-
-class SrcUri(base.Metadata):
-
-    metadata  = 'SRC_URI'
-    md5sum    = 'md5sum'
-    sha256sum = 'sha256sum'
-    git_regex = pyparsing.Regex('^git\:\/\/.*')
-
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
-    def pretest_src_uri_left_files(self):
-        if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
-
-        # get the proper metadata values
-        for pn in self.modified:
-            # we are not interested in images
-            if 'core-image' in pn:
-                continue
-            rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata, pn)] = rd.getVar(self.metadata)
-
-    def test_src_uri_left_files(self):
-        if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
-
-        # get the proper metadata values
-        for pn in self.modified:
-            # we are not interested in images
-            if 'core-image' in pn:
-                continue
-            rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata, pn)] = rd.getVar(self.metadata)
-
-        for pn in self.modified:
-            pretest_src_uri = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(), self.metadata, pn)].split()
-            test_src_uri    = PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata, pn)].split()
-
-            pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
-            test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
-
-            # check if files were removed
-            if len(test_files) < len(pretest_files):
-
-                # get removals from patchset
-                filesremoved_from_patchset = set()
-                for patch in self.patchset:
-                    if patch.is_removed_file:
-                        filesremoved_from_patchset.add(os.path.basename(patch.path))
-
-                # get the deleted files from the SRC_URI
-                filesremoved_from_usr_uri = pretest_files - test_files
-
-                # finally, get those patches removed at SRC_URI and not removed from the patchset
-                # TODO: we are not taking into account  renames, so test may raise false positives
-                not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
-                if not_removed:
-                    self.fail('Patches not removed from tree. Remove them and amend the submitted mbox',
-                              data=[('Patch', f) for f in not_removed])
-
diff --git a/meta/lib/patchtest/tests/test_metadata_summary.py b/meta/lib/patchtest/tests/test_metadata_summary.py
deleted file mode 100644
index 170e79eb4b7..00000000000
--- a/meta/lib/patchtest/tests/test_metadata_summary.py
+++ /dev/null
@@ -1,26 +0,0 @@
-# Checks related to the patch's summary metadata variable
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-from data import PatchTestInput
-
-class Summary(base.Metadata):
-    metadata = 'SUMMARY'
-
-    def test_summary_presence(self):
-        if not self.added:
-            self.skip('No added recipes, skipping test')
-
-        for pn in self.added:
-            # we are not interested in images
-            if 'core-image' in pn:
-                continue
-            rd = self.tinfoil.parse_recipe(pn)
-            summary = rd.getVar(self.metadata)
-
-            # "${PN} version ${PN}-${PR}" is the default, so fail if default
-            if summary.startswith('%s version' % pn):
-                self.fail('%s is missing in newly added recipe' % self.metadata)
diff --git a/meta/lib/patchtest/tests/test_patch_upstream_status.py b/meta/lib/patchtest/tests/test_patch.py
similarity index 56%
rename from meta/lib/patchtest/tests/test_patch_upstream_status.py
rename to meta/lib/patchtest/tests/test_patch.py
index a5b278304e6..b6904b185f1 100644
--- a/meta/lib/patchtest/tests/test_patch_upstream_status.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -1,15 +1,19 @@
-# Checks related to the patch's upstream-status lines
+# Checks related to the patch's CVE lines
 #
 # Copyright (C) 2016 Intel Corporation
 #
 # SPDX-License-Identifier: GPL-2.0-only
+#
 
 import base
+import parse_signed_off_by
 import parse_upstream_status
 import pyparsing
 
-class PatchUpstreamStatus(base.Base):
+class TestPatch(base.Base):
 
+    re_cve_pattern = pyparsing.Regex("CVE\-\d{4}\-\d+")
+    re_cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
     upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
 
     @classmethod
@@ -20,17 +24,30 @@ class PatchUpstreamStatus(base.Base):
             if patch.path.endswith('.patch') and patch.is_added_file:
                 cls.newpatches.append(patch)
 
+        cls.mark = str(parse_signed_off_by.signed_off_by_mark).strip('"')
+
+        # match PatchSignedOffBy.mark with '+' preceding it
+        cls.prog = parse_signed_off_by.patch_signed_off_by
+
     def setUp(self):
         if self.unidiff_parse_error:
-            self.skip('Python-unidiff parse error')
+            self.skip('Parse error %s' % self.unidiff_parse_error)
+
         self.valid_status    = ', '.join(parse_upstream_status.upstream_status_nonliteral_valid_status)
         self.standard_format = 'Upstream-Status: <Valid status>'
 
+        # we are just interested in series that introduce CVE patches, thus discard other
+        # possibilities: modification to current CVEs, patch directly introduced into the
+        # recipe, upgrades already including the CVE, etc.
+        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
+        if not new_cves:
+            self.skip('No new CVE patches introduced')
+
     def test_upstream_status_presence_format(self):
-        if not PatchUpstreamStatus.newpatches:
+        if not TestPatch.newpatches:
             self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
 
-        for newpatch in PatchUpstreamStatus.newpatches:
+        for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
             if not self.upstream_status_regex.search_string(payload):
                 self.fail('Added patch file is missing Upstream-Status in the header. Add Upstream-Status: <Valid status> to the header',
@@ -57,3 +74,29 @@ class PatchUpstreamStatus(base.Base):
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is in incorrect format',
                                           data=[('Current', pe.pstr), ('Standard format', self.standard_format), ('Valid status', self.valid_status)])
+
+    def test_signed_off_by_presence(self):
+        if not TestPatch.newpatches:
+            self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
+
+        for newpatch in TestPatch.newpatches:
+            payload = newpatch.__str__()
+            for line in payload.splitlines():
+                if self.patchmetadata_regex.match(line):
+                    continue
+                if TestPatch.prog.search_string(payload):
+                    break
+            else:
+                self.fail('A patch file has been added, but does not have a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
+
+    def test_cve_tag_format(self):
+        for commit in TestPatch.commits:
+            if self.re_cve_pattern.search_string(commit.shortlog) or self.re_cve_pattern.search_string(commit.commit_message):
+                tag_found = False
+                for line in commit.payload.splitlines():
+                    if self.re_cve_payload_tag.search_string(line):
+                        tag_found = True
+                        break
+                if not tag_found:
+                    self.fail('Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX"',
+                              commit=commit)
diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patchtest/tests/test_patch_cve.py
deleted file mode 100644
index c77848de458..00000000000
--- a/meta/lib/patchtest/tests/test_patch_cve.py
+++ /dev/null
@@ -1,37 +0,0 @@
-# Checks related to the patch's CVE lines
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import base
-import pyparsing
-
-class CVE(base.Base):
-
-    re_cve_pattern = pyparsing.Regex("CVE\-\d{4}\-\d+")
-    re_cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
-
-    def setUp(self):
-        if self.unidiff_parse_error:
-            self.skip('Parse error %s' % self.unidiff_parse_error)
-
-        # we are just interested in series that introduce CVE patches, thus discard other
-        # possibilities: modification to current CVEs, patch directly introduced into the
-        # recipe, upgrades already including the CVE, etc.
-        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
-        if not new_cves:
-            self.skip('No new CVE patches introduced')
-
-    def test_cve_tag_format(self):
-        for commit in CVE.commits:
-            if self.re_cve_pattern.search_string(commit.shortlog) or self.re_cve_pattern.search_string(commit.commit_message):
-                tag_found = False
-                for line in commit.payload.splitlines():
-                    if self.re_cve_payload_tag.search_string(line):
-                        tag_found = True
-                        break
-                if not tag_found:
-                    self.fail('Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX"',
-                              commit=commit)
diff --git a/meta/lib/patchtest/tests/test_patch_signed_off_by.py b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
deleted file mode 100644
index b091ff6f105..00000000000
--- a/meta/lib/patchtest/tests/test_patch_signed_off_by.py
+++ /dev/null
@@ -1,41 +0,0 @@
-# Checks related to the patch's signed-off-by lines
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import base
-import parse_signed_off_by
-
-class PatchSignedOffBy(base.Base):
-
-    @classmethod
-    def setUpClassLocal(cls):
-        cls.newpatches = []
-        # get just those relevant patches: new software patches
-        for patch in cls.patchset:
-            if patch.path.endswith('.patch') and patch.is_added_file:
-                cls.newpatches.append(patch)
-
-        cls.mark = str(parse_signed_off_by.signed_off_by_mark).strip('"')
-
-        # match PatchSignedOffBy.mark with '+' preceding it
-        cls.prog = parse_signed_off_by.patch_signed_off_by
-
-    def setUp(self):
-        if self.unidiff_parse_error:
-            self.skip('Parse error %s' % self.unidiff_parse_error)
-
-    def test_signed_off_by_presence(self):
-        if not PatchSignedOffBy.newpatches:
-            self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
-
-        for newpatch in PatchSignedOffBy.newpatches:
-            payload = newpatch.__str__()
-            for line in payload.splitlines():
-                if self.patchmetadata_regex.match(line):
-                    continue
-                if PatchSignedOffBy.prog.search_string(payload):
-                    break
-            else:
-                self.fail('A patch file has been added, but does not have a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
-- 
2.41.0


