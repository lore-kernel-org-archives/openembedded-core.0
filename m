Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190FBEE3F0E
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 19:15:34 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.3686.1694546128045162563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 12:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=aFfgYYAR;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4135d72c75bso41896911cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 12:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694546126; x=1695150926; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iVfkcv2RdYkjJE7+j7zBNMf1qPWqqVu6rxW6+Le2wE=;
        b=aFfgYYARmucX7h31fZJMhLZvOcHKtaY4Zn5hwBaHQlF2fvhCDgSMiQBLUtR+yZWprL
         TGHRYzgZ/WYd+BrJMzeXLJ8YBm2dRZx3cuvzJiwEWwB8Ds7HjKzaficof0xnUO7Eucf0
         CFohOWCC27H7gMn60V0oKvJkT0CP/scS1qiogs1vd1maG6p2/M2mtz1rJRuKqZaelfjc
         4oEmw7ror+tHcFyadcgEUrQ6O0mFLXe4UPicwfc1tXu6Xov5Qqjyxd6AhdTNzBHOG2ZM
         XByTaTgG1exY+DKJUYcCSq4KOm0n2m6hZ3UN5qErfz7TYiKXboDfemSLYqxcYXcO7uMm
         T2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546126; x=1695150926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iVfkcv2RdYkjJE7+j7zBNMf1qPWqqVu6rxW6+Le2wE=;
        b=TQjGOvQsf59o6Ld11sZooxSOYiqyJFwfGC5IpT8OyC5iNHgoCTOXjSyK9uz3DxMXvq
         qUfFdB8ESHXw0VC/cjkQRFg8FkfNgcq5Ix+CMhb+zdwz4Ch5U5LAtv1aDqByqnFupayo
         H0oLgtgILRErAEf/nN/Okg3ZQA+uz4wd2IVN5qJbSx7xjG+26/wVQCMIsFOqKvJPTN2q
         WFt1RFXxxqPZ3I89dAH6wVSpRZkzskmAdvT1gKgxPK+nkinR4JSRThvcI3p/V+pT/8TI
         NRYWX1+A4qIEqnuqCPXLYoBclCo/1AiWBzkCzhIzYbTEvVmz6vfN54U3v9ZfE5SAkupr
         pRVw==
X-Gm-Message-State: AOJu0YxvcQhJQoaBPmNhOfUTcMT0nNXvwpmDlMUYHpUlEXP+PU6OZwo1
	ikGSIfAy2r35Wg1Jja/gc9kC67IgKu8R2TW37V20mA==
X-Google-Smtp-Source: AGHT+IGhf5s6aH+HlrzVov32e9Nx+oA05HY6F6tH9/7j3GLOh9CwS3SA9d7h/EXpKPVVY/5lTAQ11g==
X-Received: by 2002:a05:622a:1744:b0:40c:5c7a:b6da with SMTP id l4-20020a05622a174400b0040c5c7ab6damr247558qtk.64.1694546125491;
        Tue, 12 Sep 2023 12:15:25 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5? ([2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5])
        by smtp.gmail.com with ESMTPSA id hg18-20020a05622a611200b004108c610d08sm3478656qtb.32.2023.09.12.12.15.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 12:15:25 -0700 (PDT)
Message-ID: <95f030b9-1d87-5406-2df8-05a4c85d81af@baylibre.com>
Date: Tue, 12 Sep 2023 15:15:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH 1/4] patchtest: Add tests from patchtest-oe repo
To: openembedded-core@lists.openembedded.org
References: <20230912171958.1575518-1-tgamblin@baylibre.com>
 <1784366DC8E833F2.10919@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <1784366DC8E833F2.10919@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 19:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187546

Please ignore this for now. While starting to work on next steps for 
patchtest, I realized that there might be some more functionality 
changes I'd like to make. I'll keep it until the end of the week and 
look at resubmitting then.

- Trevor

On 2023-09-12 13:19, Trevor Gamblin via lists.openembedded.org wrote:
> Migrate the following from https://git.yoctoproject.org/patchtest-oe/:
>
> - selftest/selftest script
> - selftest/files directory (patch files used by selftest)
> - tests/ directory (the actual tests)
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   .../files/Author.test_author_valid.1.fail     |  32 +++
>   .../files/Author.test_author_valid.1.pass     |  31 +++
>   .../files/Author.test_author_valid.2.fail     |  31 +++
>   .../files/Author.test_author_valid.2.pass     |  31 +++
>   .../Bugzilla.test_bugzilla_entry_format.fail  |  25 ++
>   .../Bugzilla.test_bugzilla_entry_format.pass  |  25 ++
>   ...E.test_cve_presence_in_commit_message.fail |  72 ++++++
>   ...E.test_cve_presence_in_commit_message.pass |  74 ++++++
>   .../files/CVE.test_cve_tag_format.fail        |  73 ++++++
>   .../files/CVE.test_cve_tag_format.pass        |  73 ++++++
>   ...tMessage.test_commit_message_presence.fail |  22 ++
>   ...tMessage.test_commit_message_presence.pass |  24 ++
>   ...c_files_chksum_modified_not_mentioned.fail |  37 +++
>   ...c_files_chksum_modified_not_mentioned.pass |  39 +++
>   ...ChkSum.test_lic_files_chksum_presence.fail |  53 ++++
>   ...ChkSum.test_lic_files_chksum_presence.pass |  54 ++++
>   .../files/MboxFormat.test_mbox_format.1.fail  |  36 +++
>   .../files/MboxFormat.test_mbox_format.2.fail  |  35 +++
>   .../files/MboxFormat.test_mbox_format.pass    |  33 +++
>   .../Merge.test_series_merge_on_head.fail      |  41 +++
>   .../Merge.test_series_merge_on_head.pass      |  35 +++
>   ...gnedOffBy.test_signed_off_by_presence.fail |  71 ++++++
>   ...gnedOffBy.test_signed_off_by_presence.pass |  72 ++++++
>   .../files/Shortlog.test_shortlog_format.fail  |  73 ++++++
>   .../files/Shortlog.test_shortlog_format.pass  |  73 ++++++
>   .../files/Shortlog.test_shortlog_length.fail  |  73 ++++++
>   .../files/Shortlog.test_shortlog_length.pass  |  73 ++++++
>   ...edOffBy.test_signed_off_by_presence.1.fail |  71 ++++++
>   ...edOffBy.test_signed_off_by_presence.2.fail |  72 ++++++
>   ...gnedOffBy.test_signed_off_by_presence.pass |  72 ++++++
>   .../files/SrcUri.test_src_uri_left_files.fail |  35 +++
>   .../files/SrcUri.test_src_uri_left_files.pass |  51 ++++
>   .../files/Summary.test_summary_presence.fail  |  46 ++++
>   .../files/Summary.test_summary_presence.pass  |  49 ++++
>   meta/lib/patchtest/selftest/selftest          |  91 +++++++
>   meta/lib/patchtest/tests/__init__.py          |   0
>   meta/lib/patchtest/tests/base.py              | 239 ++++++++++++++++++
>   meta/lib/patchtest/tests/pyparsing/common.py  |  26 ++
>   .../tests/pyparsing/parse_cve_tags.py         |  18 ++
>   .../tests/pyparsing/parse_shortlog.py         |  14 +
>   .../tests/pyparsing/parse_signed_off_by.py    |  22 ++
>   .../tests/pyparsing/parse_upstream_status.py  |  24 ++
>   meta/lib/patchtest/tests/test_mbox_author.py  |  29 +++
>   .../lib/patchtest/tests/test_mbox_bugzilla.py |  22 ++
>   meta/lib/patchtest/tests/test_mbox_cve.py     |  49 ++++
>   .../patchtest/tests/test_mbox_description.py  |  17 ++
>   meta/lib/patchtest/tests/test_mbox_format.py  |  16 ++
>   .../patchtest/tests/test_mbox_mailinglist.py  |  64 +++++
>   meta/lib/patchtest/tests/test_mbox_merge.py   |  25 ++
>   .../lib/patchtest/tests/test_mbox_shortlog.py |  41 +++
>   .../tests/test_mbox_signed_off_by.py          |  28 ++
>   .../tests/test_metadata_lic_files_chksum.py   |  82 ++++++
>   .../patchtest/tests/test_metadata_license.py  |  55 ++++
>   .../tests/test_metadata_max_length.py         |  26 ++
>   .../patchtest/tests/test_metadata_src_uri.py  |  75 ++++++
>   .../patchtest/tests/test_metadata_summary.py  |  32 +++
>   meta/lib/patchtest/tests/test_patch_cve.py    |  51 ++++
>   .../tests/test_patch_signed_off_by.py         |  43 ++++
>   .../tests/test_patch_upstream_status.py       |  64 +++++
>   .../lib/patchtest/tests/test_python_pylint.py |  61 +++++
>   60 files changed, 2921 insertions(+)
>   create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass
>   create mode 100644 meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass
>   create mode 100755 meta/lib/patchtest/selftest/selftest
>   create mode 100644 meta/lib/patchtest/tests/__init__.py
>   create mode 100644 meta/lib/patchtest/tests/base.py
>   create mode 100644 meta/lib/patchtest/tests/pyparsing/common.py
>   create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
>   create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
>   create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
>   create mode 100644 meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_author.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_bugzilla.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_cve.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_description.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_format.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_mailinglist.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_merge.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_shortlog.py
>   create mode 100644 meta/lib/patchtest/tests/test_mbox_signed_off_by.py
>   create mode 100644 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
>   create mode 100644 meta/lib/patchtest/tests/test_metadata_license.py
>   create mode 100644 meta/lib/patchtest/tests/test_metadata_max_length.py
>   create mode 100644 meta/lib/patchtest/tests/test_metadata_src_uri.py
>   create mode 100644 meta/lib/patchtest/tests/test_metadata_summary.py
>   create mode 100644 meta/lib/patchtest/tests/test_patch_cve.py
>   create mode 100644 meta/lib/patchtest/tests/test_patch_signed_off_by.py
>   create mode 100644 meta/lib/patchtest/tests/test_patch_upstream_status.py
>   create mode 100644 meta/lib/patchtest/tests/test_python_pylint.py
>
> diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail b/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail
> new file mode 100644
> index 0000000000..0c40cdc1b6
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.fail
> @@ -0,0 +1,32 @@
> +From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
> +From: First Last <first.last@example.com>
> +Date: Tue, 29 Aug 2023 13:32:24 -0400
> +Subject: [PATCH] selftest-hello: add a summary
> +
> +This patch should fail the selftests because the author address is from the
> +invalid "example.com".
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..491f0a3df7 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -1,3 +1,4 @@
> ++SUMMARY = "A cool sample"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass b/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass
> new file mode 100644
> index 0000000000..cbb8ef2cef
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Author.test_author_valid.1.pass
> @@ -0,0 +1,31 @@
> +From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
> +From: First Last <first.last@address.com>
> +Date: Tue, 29 Aug 2023 13:32:24 -0400
> +Subject: [PATCH] selftest-hello: add a summary
> +
> +This patch should pass the selftests because the author address is in a valid format.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..491f0a3df7 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -1,3 +1,4 @@
> ++SUMMARY = "A cool sample"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail b/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail
> new file mode 100644
> index 0000000000..3e2b81bca1
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.fail
> @@ -0,0 +1,31 @@
> +From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
> +From: Upgrade Helper <auh@auh.yoctoproject.org>
> +Date: Tue, 29 Aug 2023 13:32:24 -0400
> +Subject: [PATCH] selftest-hello: add a summary
> +
> +This patch should fail the selftests because AUH is an invalid sender.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..491f0a3df7 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -1,3 +1,4 @@
> ++SUMMARY = "A cool sample"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass b/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass
> new file mode 100644
> index 0000000000..f84e1265a7
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Author.test_author_valid.2.pass
> @@ -0,0 +1,31 @@
> +From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
> +From: First Last <averylongemailaddressthatishardtoread.from@address.com>
> +Date: Tue, 29 Aug 2023 13:32:24 -0400
> +Subject: [PATCH] selftest-hello: add a summary
> +
> +This patch should pass the selftests because the author address is in a valid format.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..491f0a3df7 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -1,3 +1,4 @@
> ++SUMMARY = "A cool sample"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail b/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail
> new file mode 100644
> index 0000000000..80f409e952
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.fail
> @@ -0,0 +1,25 @@
> +From fdfd605e565d874502522c4b70b786c8c5aa0bad Mon Sep 17 00:00:00 2001
> +From: name@somedomain.com <email@address.com>
> +Date: Fri, 17 Feb 2017 16:29:21 -0600
> +Subject: [PATCH] README: adds 'foo' to the header
> +
> +This test patch adds 'foo' to the header
> +
> +[YOCTO 1234]
> +
> +Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +---
> + README | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/README b/README
> +index 521916cd4f..cdf29dcea3 100644
> +--- a/README
> ++++ b/README
> +@@ -1,3 +1,4 @@
> ++**** FOO ****
> + OpenEmbedded-Core
> + =================
> +
> +--
> +2.11.0
> diff --git a/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass b/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass
> new file mode 100644
> index 0000000000..2648b03364
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Bugzilla.test_bugzilla_entry_format.pass
> @@ -0,0 +1,25 @@
> +From fdfd605e565d874502522c4b70b786c8c5aa0bad Mon Sep 17 00:00:00 2001
> +From: name@somedomain.com <email@address.com>
> +Date: Fri, 17 Feb 2017 16:29:21 -0600
> +Subject: [PATCH] README: adds 'foo' to the header
> +
> +This test patch adds 'foo' to the header
> +
> +[YOCTO #1234]
> +
> +Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +---
> + README | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/README b/README
> +index 521916cd4f..cdf29dcea3 100644
> +--- a/README
> ++++ b/README
> +@@ -1,3 +1,4 @@
> ++**** FOO ****
> + OpenEmbedded-Core
> + =================
> +
> +--
> +2.11.0
> diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail b/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail
> new file mode 100644
> index 0000000000..d40b8a936b
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail
> @@ -0,0 +1,72 @@
> +From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +This patch should fail the test for CVE presence in the mbox commit message.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..869cfb6fe5
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass b/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass
> new file mode 100644
> index 0000000000..433c7a450a
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass
> @@ -0,0 +1,74 @@
> +From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +This test should pass the mbox cve tag test.
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..869cfb6fe5
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail b/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail
> new file mode 100644
> index 0000000000..c763a7506e
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.fail
> @@ -0,0 +1,73 @@
> +From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-BAD-FORMAT
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..9219b8db62
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-BAD-FORMAT
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> ++
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass b/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass
> new file mode 100644
> index 0000000000..ef6017037c
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/CVE.test_cve_tag_format.pass
> @@ -0,0 +1,73 @@
> +From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..9219b8db62
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> ++
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail b/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail
> new file mode 100644
> index 0000000000..93ca0f9119
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.fail
> @@ -0,0 +1,22 @@
> +From 0a52a62c9430c05d22cb7f46380488f2280b69bb Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Fri, 1 Sep 2023 08:56:14 -0400
> +Subject: [PATCH] README.OE-Core.md: add foo
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + README.OE-Core.md | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/README.OE-Core.md b/README.OE-Core.md
> +index 2f2127fb03..48464252c8 100644
> +--- a/README.OE-Core.md
> ++++ b/README.OE-Core.md
> +@@ -1,3 +1,4 @@
> ++** FOO **
> + OpenEmbedded-Core
> + =================
> +
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass b/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass
> new file mode 100644
> index 0000000000..5e3dcbd58b
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/CommitMessage.test_commit_message_presence.pass
> @@ -0,0 +1,24 @@
> +From 0a52a62c9430c05d22cb7f46380488f2280b69bb Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Fri, 1 Sep 2023 08:56:14 -0400
> +Subject: [PATCH] README.OE-Core.md: add foo
> +
> +This is a commit message
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + README.OE-Core.md | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/README.OE-Core.md b/README.OE-Core.md
> +index 2f2127fb03..48464252c8 100644
> +--- a/README.OE-Core.md
> ++++ b/README.OE-Core.md
> +@@ -1,3 +1,4 @@
> ++** FOO **
> + OpenEmbedded-Core
> + =================
> +
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail
> new file mode 100644
> index 0000000000..ab6c52c374
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail
> @@ -0,0 +1,37 @@
> +From f89919ea86d38404dd621521680a0162367bb965 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 6 Sep 2023 09:09:27 -0400
> +Subject: [PATCH] selftest-hello: update LIC_FILES_CHKSUM
> +
> +This test should fail the
> +test_metadata_lic_files_chksum.LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned
> +test.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..65dda40aba 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -1,7 +1,7 @@
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> ++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f303"
> +
> + SRC_URI = "file://helloworld.c"
> +
> +@@ -16,4 +16,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass
> new file mode 100644
> index 0000000000..99d9f144da
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass
> @@ -0,0 +1,39 @@
> +From f89919ea86d38404dd621521680a0162367bb965 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 6 Sep 2023 09:09:27 -0400
> +Subject: [PATCH] selftest-hello: update LIC_FILES_CHKSUM
> +
> +License-Update: Fix checksum
> +
> +This test should pass the
> +test_metadata_lic_files_chksum.LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned
> +test.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..65dda40aba 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -1,7 +1,7 @@
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> ++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f303"
> +
> + SRC_URI = "file://helloworld.c"
> +
> +@@ -16,4 +16,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail
> new file mode 100644
> index 0000000000..e14d644bb2
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.fail
> @@ -0,0 +1,53 @@
> +From 66430e7c6fbd5187b66560909a510e136fed91c0 Mon Sep 17 00:00:00 2001
> +From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +Date: Thu, 23 Feb 2017 10:34:27 -0600
> +Subject: [PATCH] meta: adding hello-yocto recipe
> +
> +This is a sample recipe
> +
> +Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +---
> + .../hello-world/hello-world/hello_world.c      |  5 +++++
> + .../hello-world/hello-world_1.0.bb             | 18 ++++++++++++++++++
> + 2 files changed, 23 insertions(+)
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +
> +diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +new file mode 100644
> +index 0000000000..0d59f57d4c
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +@@ -0,0 +1,5 @@
> ++#include <stdio.h>
> ++
> ++int main(){
> ++    printf("Hello World\n");
> ++}
> +diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +new file mode 100644
> +index 0000000000..3c990c108a
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +@@ -0,0 +1,18 @@
> ++SUMMARY = "This is a sample summary"
> ++DESCRIPTION = "This is a sample description"
> ++HOMEPAGE = "https://sample.com/this-is-a-sample"
> ++LICENSE = "MIT"
> ++
> ++SRC_URI += "file://hello_world.c"
> ++
> ++SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
> ++SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
> ++
> ++do_compile(){
> ++    ${CC} -o hello_world ../hello_world.c
> ++}
> ++
> ++do_install(){
> ++    install -d ${D}${bindir}
> ++    install -m +x hello_world ${D}${bindir}/hello_world
> ++}
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass
> new file mode 100644
> index 0000000000..b8da16dfe5
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/LicFilesChkSum.test_lic_files_chksum_presence.pass
> @@ -0,0 +1,54 @@
> +From 5144d2ba1aa763312c047dd5f8901368cff79da6 Mon Sep 17 00:00:00 2001
> +From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +Date: Thu, 23 Feb 2017 10:34:27 -0600
> +Subject: [PATCH] meta: adding hello-yocto recipe
> +
> +This is a sample recipe
> +
> +Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +---
> + .../hello-world/hello-world/hello_world.c     |  5 +++++
> + .../hello-world/hello-world_1.0.bb            | 19 +++++++++++++++++++
> + 2 files changed, 24 insertions(+)
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +
> +diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +new file mode 100644
> +index 0000000000..0d59f57d4c
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +@@ -0,0 +1,5 @@
> ++#include <stdio.h>
> ++
> ++int main(){
> ++    printf("Hello World\n");
> ++}
> +diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +new file mode 100644
> +index 0000000000..44d888c82a
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +@@ -0,0 +1,19 @@
> ++SUMMARY = "This is a sample summary"
> ++DESCRIPTION = "This is a sample description"
> ++HOMEPAGE = "https://sample.com/this-is-a-sample"
> ++LICENSE = "MIT"
> ++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> ++
> ++SRC_URI += "file://hello_world.c"
> ++
> ++SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
> ++SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
> ++
> ++do_compile(){
> ++    ${CC} -o hello_world ../hello_world.c
> ++}
> ++
> ++do_install(){
> ++    install -d ${D}${bindir}
> ++    install -m +x hello_world ${D}${bindir}/hello_world
> ++}
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail b/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail
> new file mode 100644
> index 0000000000..9cc4aab38a
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.1.fail
> @@ -0,0 +1,36 @@
> +From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 30 Aug 2023 12:15:00 -0400
> +Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
> +
> +This test should fail the mbox formatting test and the merge on head
> +test.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> + rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +similarity index 88%
> +rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +index 547587bef4..acc388ec2c 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +@@ -1,3 +1,4 @@
> +%+SUMMARY = "Hello!"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail b/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail
> new file mode 100644
> index 0000000000..eca1c60085
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.2.fail
> @@ -0,0 +1,35 @@
> +From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 30 Aug 2023 12:15:00 -0400
> +Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
> +
> +This test should fail the merge-on-head and mbox formatting tests.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> + rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +similarity index 88%
> +rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +index 547587bef4..acc388ec2c 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +@@ -1,3 +1,4 @@
> +%+SUMMARY = "Hello!"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass b/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass
> new file mode 100644
> index 0000000000..33940adffc
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/MboxFormat.test_mbox_format.pass
> @@ -0,0 +1,33 @@
> +From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 30 Aug 2023 12:15:00 -0400
> +Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> + rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +similarity index 88%
> +rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +index 547587bef4..acc388ec2c 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +@@ -1,3 +1,4 @@
> ++SUMMARY = "Hello!"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail b/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail
> new file mode 100644
> index 0000000000..49bd1f8ede
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail
> @@ -0,0 +1,41 @@
> +From 55208224f492af0ad929555ffc9b95ff1d301c5f Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Thu, 17 Aug 2023 15:02:38 -0400
> +Subject: [PATCH] python3-dtc: upgrade 1.6.1 -> 1.7.0
> +
> +Changelog: https://kernel.googlesource.com/pub/scm/utils/dtc/dtc/+log/039a99414e778332d8f9c04cbd3072e1dcc62798
> +
> +Remove custom PV from the recipe since the relevant functionality is in
> +1.7.0:
> +
> +[tgamblin@megalith dtc]$ git tag --contains c001fc01a43e7a06447c06ea3d50bd60641322b8
> +v1.7.0
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +---
> + .../python/{python3-dtc_1.6.1.bb => python3-dtc_1.7.0.bb}      | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> + rename meta/recipes-devtools/python/{python3-dtc_1.6.1.bb => python3-dtc_1.7.0.bb} (92%)
> +
> +diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb b/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
> +similarity index 92%
> +rename from meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> +rename to meta/recipes-devtools/python/python3-dtc_1.7.0.bb
> +index 95ab0be474..85e48d4694 100644
> +--- a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> ++++ b/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
> +@@ -14,9 +14,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> +
> + LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
> +
> +-SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
> ++SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
> +
> +-PV = "1.6.1+git"
> + S = "${WORKDIR}/git"
> +
> + PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass b/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass
> new file mode 100644
> index 0000000000..2a72457878
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass
> @@ -0,0 +1,35 @@
> +From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 30 Aug 2023 12:15:00 -0400
> +Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
> +
> +This file should pass the test_series_merge_on_head test.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> + rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +similarity index 88%
> +rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +index 547587bef4..acc388ec2c 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
> +@@ -1,3 +1,4 @@
> ++SUMMARY = "Hello!"
> + DESCRIPTION = "Simple helloworld application -- selftest variant"
> + SECTION = "examples"
> + LICENSE = "MIT"
> +@@ -16,4 +17,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail b/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail
> new file mode 100644
> index 0000000000..ce8bf7b7d1
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.fail
> @@ -0,0 +1,71 @@
> +From 5a2d0ac780a0f4c046fb1a3c3463d3e726f191cb Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 26 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 30 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..92a5b65a53
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,26 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass
> new file mode 100644
> index 0000000000..ea34c76f0d
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/PatchSignedOffBy.test_signed_off_by_presence.pass
> @@ -0,0 +1,72 @@
> +From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..869cfb6fe5
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail
> new file mode 100644
> index 0000000000..cdbbc61b61
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.fail
> @@ -0,0 +1,73 @@
> +From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello% fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..9219b8db62
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> ++
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass
> new file mode 100644
> index 0000000000..ef6017037c
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_format.pass
> @@ -0,0 +1,73 @@
> +From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..9219b8db62
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> ++
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail
> new file mode 100644
> index 0000000000..247b2a8a80
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.fail
> @@ -0,0 +1,73 @@
> +From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: this is a very long commit shortlog with way too many words included in it to pass the test
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..9219b8db62
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> ++
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass
> new file mode 100644
> index 0000000000..ef6017037c
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Shortlog.test_shortlog_length.pass
> @@ -0,0 +1,73 @@
> +From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..9219b8db62
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> ++
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail b/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail
> new file mode 100644
> index 0000000000..35d92aeed7
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.1.fail
> @@ -0,0 +1,71 @@
> +From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..869cfb6fe5
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail b/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail
> new file mode 100644
> index 0000000000..68f38dee06
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.2.fail
> @@ -0,0 +1,72 @@
> +From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Approved: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..869cfb6fe5
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass
> new file mode 100644
> index 0000000000..ea34c76f0d
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/SignedOffBy.test_signed_off_by_presence.pass
> @@ -0,0 +1,72 @@
> +From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 29 Aug 2023 14:12:27 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +new file mode 100644
> +index 0000000000..869cfb6fe5
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
> +@@ -0,0 +1,27 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++@@ -8,6 +8,7 @@ int main() {
> ++
> ++ 	printf("%d\n", str_len(string1));
> ++ 	printf("%d\n", str_len(string2));
> +++	printf("CVE FIXED!!!\n");
> ++
> ++ 	return 0;
> ++ }
> ++--
> ++2.41.0
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..76975a6729 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> ++SRC_URI = "file://helloworld.c \
> ++           file://CVE-1234-56789.patch \
> ++           "
> +
> + S = "${WORKDIR}"
> +
> +@@ -16,4 +18,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail b/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail
> new file mode 100644
> index 0000000000..983b6e0c2b
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.fail
> @@ -0,0 +1,35 @@
> +From 4ab06b5f81455249cd5e89d2cce9863803b5ecb5 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Fri, 8 Sep 2023 14:41:00 -0400
> +Subject: [PATCH] selftest-hello: remove helloworld.c
> +
> +This should fail the test_src_uri_left_files selftest.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..f6817f05bc 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,8 +3,6 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> +-
> + S = "${WORKDIR}"
> +
> + do_compile() {
> +@@ -16,4 +14,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass b/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass
> new file mode 100644
> index 0000000000..1f1a77e581
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/SrcUri.test_src_uri_left_files.pass
> @@ -0,0 +1,51 @@
> +From 6c7ac367a873bf827c19b81085c943eace917a99 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Fri, 8 Sep 2023 14:41:00 -0400
> +Subject: [PATCH] selftest-hello: remove helloworld.c
> +
> +This should pass the test_src_uri_left_files selftest.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../recipes-test/selftest-hello/files/helloworld.c        | 8 --------
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb     | 4 +---
> + 2 files changed, 1 insertion(+), 11 deletions(-)
> + delete mode 100644 meta-selftest/recipes-test/selftest-hello/files/helloworld.c
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/helloworld.c b/meta-selftest/recipes-test/selftest-hello/files/helloworld.c
> +deleted file mode 100644
> +index fc7169b7b8..0000000000
> +--- a/meta-selftest/recipes-test/selftest-hello/files/helloworld.c
> ++++ /dev/null
> +@@ -1,8 +0,0 @@
> +-#include <stdio.h>
> +-
> +-int main(void)
> +-{
> +-	printf("Hello world!\n");
> +-
> +-	return 0;
> +-}
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..f6817f05bc 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,8 +3,6 @@ SECTION = "examples"
> + LICENSE = "MIT"
> + LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +-SRC_URI = "file://helloworld.c"
> +-
> + S = "${WORKDIR}"
> +
> + do_compile() {
> +@@ -16,4 +14,4 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.41.0
> +
> diff --git a/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail b/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail
> new file mode 100644
> index 0000000000..2d2b4e683d
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.fail
> @@ -0,0 +1,46 @@
> +From e29da5faa74409be394caa09d9f3b7b60f8592b9 Mon Sep 17 00:00:00 2001
> +From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +Date: Thu, 23 Feb 2017 10:34:27 -0600
> +Subject: [PATCH] meta: adding hello-yocto recipe
> +
> +This is a sample recipe
> +
> +Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +---
> + meta/recipes-devtools/hello-world/hello-world/hello_world.c |  5 +++++
> + meta/recipes-devtools/hello-world/hello-world_1.0.bb        | 12 ++++++++++++
> + 2 files changed, 17 insertions(+)
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +
> +diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +new file mode 100644
> +index 0000000000..0d59f57d4c
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +@@ -0,0 +1,5 @@
> ++#include <stdio.h>
> ++
> ++int main(){
> ++    printf("Hello World\n");
> ++}
> +diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +new file mode 100644
> +index 0000000000..c4e1359217
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +@@ -0,0 +1,12 @@
> ++LICENSE = "CLOSED"
> ++
> ++SRC_URI += "file://hello_world.c"
> ++
> ++do_compile(){
> ++    ${CC} -o hello_world ../hello_world.c
> ++}
> ++
> ++do_install(){
> ++    install -d ${D}${bindir}
> ++    install -m +x hello_world ${D}${bindir}/hello_world
> ++}
> +--
> +2.11.0
> diff --git a/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass b/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass
> new file mode 100644
> index 0000000000..55f0309b3f
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/Summary.test_summary_presence.pass
> @@ -0,0 +1,49 @@
> +From 0cd2fed12ce4b7b071edde12aec4481ad7a6f107 Mon Sep 17 00:00:00 2001
> +From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +Date: Thu, 23 Feb 2017 10:34:27 -0600
> +Subject: [PATCH] meta: adding hello-yocto recipe
> +
> +This is a sample recipe
> +
> +Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
> +---
> + .../hello-world/hello-world/hello_world.c                 |  5 +++++
> + meta/recipes-devtools/hello-world/hello-world_1.0.bb      | 15 +++++++++++++++
> + 2 files changed, 20 insertions(+)
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
> + create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +
> +diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +new file mode 100644
> +index 0000000000..0d59f57d4c
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
> +@@ -0,0 +1,5 @@
> ++#include <stdio.h>
> ++
> ++int main(){
> ++    printf("Hello World\n");
> ++}
> +diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +new file mode 100644
> +index 0000000000..c54283eece
> +--- /dev/null
> ++++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
> +@@ -0,0 +1,15 @@
> ++SUMMARY = "This is a sample summary"
> ++DESCRIPTION = "This is a sample description"
> ++HOMEPAGE = "https://sample.com/this-is-a-sample"
> ++LICENSE = "CLOSED"
> ++
> ++SRC_URI += "file://hello_world.c"
> ++
> ++do_compile(){
> ++    ${CC} -o hello_world ../hello_world.c
> ++}
> ++
> ++do_install(){
> ++    install -d ${D}${bindir}
> ++    install -m +x hello_world ${D}${bindir}/hello_world
> ++}
> +--
> +2.11.0
> diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
> new file mode 100755
> index 0000000000..eb65c530aa
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/selftest
> @@ -0,0 +1,91 @@
> +#!/usr/bin/env python3
> +
> +# Test every patch from files folder and output error on failure
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import os
> +import subprocess
> +import sys
> +
> +currentdir = os.path.dirname(os.path.abspath(__file__))
> +patchesdir = os.path.join(currentdir, 'files')
> +topdir     = os.path.dirname(currentdir)
> +parentdir  = os.path.dirname(topdir)
> +
> +def print_results(passcount, skipcount, failcount, xpasscount, xfailcount, errorcount):
> +    total = passcount + skipcount + failcount + xpasscount + xfailcount + errorcount
> +    print("============================================================================")
> +    print("Testsuite summary for %s" % os.path.basename(topdir))
> +    print("============================================================================")
> +    print("# TOTAL: %s" % str(total))
> +    print("# XPASS: %s" % str(xpasscount))
> +    print("# XFAIL: %s" % str(xfailcount))
> +    print("# PASS: %s" % str(passcount))
> +    print("# FAIL: %s" % str(failcount))
> +    print("# SKIP: %s" % str(skipcount))
> +    print("# ERROR: %s" % str(errorcount))
> +    print("============================================================================")
> +
> +# Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
> +def test(root, patch, testdir):
> +    res = True
> +    patchpath = os.path.abspath(os.path.join(root, patch))
> +
> +
> +    cmd     = 'patchtest %s %s %s/tests' % (patchpath, testdir, topdir)
> +    results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
> +
> +    return results
> +
> +if __name__ == '__main__':
> +    # sys.argv[1] should be the repo to target for selftest, i.e. oe-core
> +    if len(sys.argv) == 1:
> +        sys.exit("Error: Must provide the path to openembedded-core, e.g. \"selftest /workspace/yocto/openembedded-core\"")
> +
> +    passcount = 0
> +    failcount = 0
> +    skipcount = 0
> +    xpasscount = 0
> +    xfailcount = 0
> +    errorcount = 0
> +
> +    results = None
> +
> +    for root, dirs, patches in os.walk(patchesdir):
> +        for patch in patches:
> +            results = test(root, patch, sys.argv[1])
> +
> +            a = patch.split('.')
> +            klass, testname = a[0], a[1]
> +            expected_result = a[-1]
> +            testid          = ".%s.%s" % (klass,testname)
> +
> +            for resultline in results.splitlines():
> +                if testid in resultline:
> +                    result, _ = resultline.split()
> +
> +                    if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
> +                        xfailcount = xfailcount + 1
> +                        print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
> +                    elif expected_result.upper() == "PASS" and result.upper() == "PASS":
> +                        xpasscount = xpasscount + 1
> +                        print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
> +                    else:
> +                        print("%s: %s (%s)" % (result.upper(), testid.strip("."), os.path.basename(patch)))
> +                        if result.upper() == "PASS":
> +                            passcount = passcount + 1
> +                        elif result.upper() == "FAIL":
> +                            failcount = failcount + 1
> +                        elif result.upper() == "SKIP":
> +                            skipcount = skipcount + 1
> +                        else:
> +                            print("Bad result on test %s against %s" % (testid.strip("."), os.path.basename(patch)))
> +                            errorcount = errorcount + 1
> +                    break
> +            else:
> +                print ("No test for=%s" % patch)
> +
> +    print_results(passcount, skipcount, failcount, xpasscount, xfailcount, errorcount)
> diff --git a/meta/lib/patchtest/tests/__init__.py b/meta/lib/patchtest/tests/__init__.py
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
> new file mode 100644
> index 0000000000..27db380353
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/base.py
> @@ -0,0 +1,239 @@
> +# Base class to be used by all test cases defined in the suite
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import unittest
> +import logging
> +import json
> +import unidiff
> +from data import PatchTestInput
> +import mailbox
> +import collections
> +import sys
> +import os
> +import re
> +
> +sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'pyparsing'))
> +
> +logger = logging.getLogger('patchtest')
> +debug=logger.debug
> +info=logger.info
> +warn=logger.warn
> +error=logger.error
> +
> +Commit = collections.namedtuple('Commit', ['author', 'subject', 'commit_message', 'shortlog', 'payload'])
> +
> +class PatchtestOEError(Exception):
> +    """Exception for handling patchtest-oe errors"""
> +    def __init__(self, message, exitcode=1):
> +        super().__init__(message)
> +        self.exitcode = exitcode
> +
> +class Base(unittest.TestCase):
> +    # if unit test fails, fail message will throw at least the following JSON: {"id": <testid>}
> +
> +    endcommit_messages_regex = re.compile('\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
> +    patchmetadata_regex   = re.compile('-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
> +
> +
> +    @staticmethod
> +    def msg_to_commit(msg):
> +        payload = msg.get_payload()
> +        return Commit(subject=msg['subject'].replace('\n', ' ').replace('  ', ' '),
> +                      author=msg.get('From'),
> +                      shortlog=Base.shortlog(msg['subject']),
> +                      commit_message=Base.commit_message(payload),
> +                      payload=payload)
> +
> +    @staticmethod
> +    def commit_message(payload):
> +        commit_message = payload.__str__()
> +        match = Base.endcommit_messages_regex.search(payload)
> +        if match:
> +            commit_message = payload[:match.start()]
> +        return commit_message
> +
> +    @staticmethod
> +    def shortlog(shlog):
> +        # remove possible prefix (between brackets) before colon
> +        start = shlog.find(']', 0, shlog.find(':'))
> +        # remove also newlines and spaces at both sides
> +        return shlog[start + 1:].replace('\n', '').strip()
> +
> +    @classmethod
> +    def setUpClass(cls):
> +
> +        # General objects: mailbox.mbox and patchset
> +        cls.mbox = mailbox.mbox(PatchTestInput.repo.patch)
> +
> +        # Patch may be malformed, so try parsing it
> +        cls.unidiff_parse_error = ''
> +        cls.patchset = None
> +        try:
> +            cls.patchset = unidiff.PatchSet.from_filename(PatchTestInput.repo.patch, encoding=u'UTF-8')
> +        except unidiff.UnidiffParseError as upe:
> +            cls.patchset = []
> +            cls.unidiff_parse_error = str(upe)
> +
> +        # Easy to iterate list of commits
> +        cls.commits = []
> +        for msg in cls.mbox:
> +            if msg['subject'] and msg.get_payload():
> +                cls.commits.append(Base.msg_to_commit(msg))
> +
> +        cls.setUpClassLocal()
> +
> +    @classmethod
> +    def tearDownClass(cls):
> +        cls.tearDownClassLocal()
> +
> +    @classmethod
> +    def setUpClassLocal(cls):
> +        pass
> +
> +    @classmethod
> +    def tearDownClassLocal(cls):
> +        pass
> +
> +    def fail(self, issue, fix=None, commit=None, data=None):
> +        """ Convert to a JSON string failure data"""
> +        value = {'id': self.id(),
> +                 'issue': issue}
> +
> +        if fix:
> +            value['fix'] = fix
> +        if commit:
> +            value['commit'] = {'subject': commit.subject,
> +                               'shortlog': commit.shortlog}
> +
> +        # extend return value with other useful info
> +        if data:
> +            value['data'] = data
> +
> +        return super(Base, self).fail(json.dumps(value))
> +
> +    def skip(self, issue, data=None):
> +        """ Convert the skip string to JSON"""
> +        value = {'id': self.id(),
> +                 'issue': issue}
> +
> +        # extend return value with other useful info
> +        if data:
> +            value['data'] = data
> +
> +        return super(Base, self).skipTest(json.dumps(value))
> +
> +    def shortid(self):
> +        return self.id().split('.')[-1]
> +
> +    def __str__(self):
> +        return json.dumps({'id': self.id()})
> +
> +class Metadata(Base):
> +    @classmethod
> +    def setUpClassLocal(cls):
> +        cls.tinfoil = cls.setup_tinfoil()
> +
> +        # get info about added/modified/remove recipes
> +        cls.added, cls.modified, cls.removed = cls.get_metadata_stats(cls.patchset)
> +
> +    @classmethod
> +    def tearDownClassLocal(cls):
> +        cls.tinfoil.shutdown()
> +
> +    @classmethod
> +    def setup_tinfoil(cls, config_only=False):
> +        """Initialize tinfoil api from bitbake"""
> +
> +        # import relevant libraries
> +        try:
> +            scripts_path = os.path.join(PatchTestInput.repodir, 'scripts', 'lib')
> +            if scripts_path not in sys.path:
> +                sys.path.insert(0, scripts_path)
> +            import scriptpath
> +            scriptpath.add_bitbake_lib_path()
> +            import bb.tinfoil
> +        except ImportError:
> +            raise PatchtestOEError('Could not import tinfoil module')
> +
> +        orig_cwd = os.path.abspath(os.curdir)
> +
> +        # Load tinfoil
> +        tinfoil = None
> +        try:
> +            builddir = os.environ.get('BUILDDIR')
> +            if not builddir:
> +                logger.warn('Bitbake environment not loaded?')
> +                return tinfoil
> +            os.chdir(builddir)
> +            tinfoil = bb.tinfoil.Tinfoil()
> +            tinfoil.prepare(config_only=config_only)
> +        except bb.tinfoil.TinfoilUIException as te:
> +            if tinfoil:
> +                tinfoil.shutdown()
> +            raise PatchtestOEError('Could not prepare properly tinfoil (TinfoilUIException)')
> +        except Exception as e:
> +            if tinfoil:
> +                tinfoil.shutdown()
> +            raise e
> +        finally:
> +            os.chdir(orig_cwd)
> +
> +        return tinfoil
> +
> +    @classmethod
> +    def get_metadata_stats(cls, patchset):
> +        """Get lists of added, modified and removed metadata files"""
> +
> +        def find_pn(data, path):
> +            """Find the PN from data"""
> +            pn = None
> +            pn_native = None
> +            for _path, _pn in data:
> +                if path in _path:
> +                    if 'native' in _pn:
> +                        # store the native PN but look for the non-native one first
> +                        pn_native = _pn
> +                    else:
> +                        pn = _pn
> +                        break
> +            else:
> +                # sent the native PN if found previously
> +                if pn_native:
> +                    return pn_native
> +
> +                # on renames (usually upgrades), we need to check (FILE) base names
> +                # because the unidiff library does not provided the new filename, just the modified one
> +                # and tinfoil datastore, once the patch is merged, will contain the new filename
> +                path_basename = path.split('_')[0]
> +                for _path, _pn in data:
> +                    _path_basename = _path.split('_')[0]
> +                    if path_basename == _path_basename:
> +                        pn = _pn
> +            return pn
> +
> +        if not cls.tinfoil:
> +            cls.tinfoil = cls.setup_tinfoil()
> +
> +        added_paths, modified_paths, removed_paths = [], [], []
> +        added, modified, removed = [], [], []
> +
> +        # get metadata filename additions, modification and removals
> +        for patch in patchset:
> +            if patch.path.endswith('.bb') or patch.path.endswith('.bbappend') or patch.path.endswith('.inc'):
> +                if patch.is_added_file:
> +                    added_paths.append(os.path.join(os.path.abspath(PatchTestInput.repodir), patch.path))
> +                elif patch.is_modified_file:
> +                    modified_paths.append(os.path.join(os.path.abspath(PatchTestInput.repodir), patch.path))
> +                elif patch.is_removed_file:
> +                    removed_paths.append(os.path.join(os.path.abspath(PatchTestInput.repodir), patch.path))
> +
> +        data = cls.tinfoil.cooker.recipecaches[''].pkg_fn.items()
> +
> +        added = [find_pn(data,path) for path in added_paths]
> +        modified = [find_pn(data,path) for path in modified_paths]
> +        removed = [find_pn(data,path) for path in removed_paths]
> +
> +        return [a for a in added if a], [m for m in modified if m], [r for r in removed if r]
> diff --git a/meta/lib/patchtest/tests/pyparsing/common.py b/meta/lib/patchtest/tests/pyparsing/common.py
> new file mode 100644
> index 0000000000..9d37b0403d
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/pyparsing/common.py
> @@ -0,0 +1,26 @@
> +# common pyparsing variables
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import pyparsing
> +
> +# general
> +colon = pyparsing.Literal(":")
> +start = pyparsing.LineStart()
> +end   = pyparsing.LineEnd()
> +at = pyparsing.Literal("@")
> +lessthan = pyparsing.Literal("<")
> +greaterthan = pyparsing.Literal(">")
> +opensquare = pyparsing.Literal("[")
> +closesquare = pyparsing.Literal("]")
> +inappropriate = pyparsing.CaselessLiteral("Inappropriate")
> +submitted = pyparsing.CaselessLiteral("Submitted")
> +
> +# word related
> +nestexpr = pyparsing.nestedExpr(opener='[', closer=']')
> +inappropriateinfo = pyparsing.Literal("Inappropriate") + nestexpr
> +submittedinfo = pyparsing.Literal("Submitted") + nestexpr
> +word = pyparsing.Word(pyparsing.alphas)
> +worddot = pyparsing.Word(pyparsing.alphas+".")
> diff --git a/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py b/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
> new file mode 100644
> index 0000000000..dd7131a650
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
> @@ -0,0 +1,18 @@
> +# signed-off-by pyparsing definition
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +
> +import pyparsing
> +import common
> +
> +name = pyparsing.Regex('\S+.*(?= <)')
> +username = pyparsing.OneOrMore(common.worddot)
> +domain = pyparsing.OneOrMore(common.worddot)
> +cve = pyparsing.Regex('CVE\-\d{4}\-\d+')
> +cve_mark = pyparsing.Literal("CVE:")
> +
> +cve_tag = pyparsing.AtLineStart(cve_mark + cve)
> +patch_cve_tag = pyparsing.AtLineStart("+" + cve_mark + cve)
> diff --git a/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py b/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
> new file mode 100644
> index 0000000000..26e9612c4a
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
> @@ -0,0 +1,14 @@
> +# subject pyparsing definition
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# NOTE:This is an oversimplified syntax of the mbox's summary
> +
> +import pyparsing
> +import common
> +
> +target        = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables.replace(':','')))
> +summary       = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables))
> +shortlog       = common.start + target + common.colon + summary + common.end
> diff --git a/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py b/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
> new file mode 100644
> index 0000000000..c8a4351551
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
> @@ -0,0 +1,22 @@
> +# signed-off-by pyparsing definition
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +
> +import pyparsing
> +import common
> +
> +name = pyparsing.Regex('\S+.*(?= <)')
> +username = pyparsing.OneOrMore(common.worddot)
> +domain = pyparsing.OneOrMore(common.worddot)
> +
> +# taken from https://pyparsing-public.wikispaces.com/Helpful+Expressions
> +email = pyparsing.Regex(r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})")
> +
> +email_enclosed = common.lessthan + email + common.greaterthan
> +
> +signed_off_by_mark = pyparsing.Literal("Signed-off-by:")
> +signed_off_by = pyparsing.AtLineStart(signed_off_by_mark + name + email_enclosed)
> +patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_mark + name + email_enclosed)
> diff --git a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
> new file mode 100644
> index 0000000000..511b36d033
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
> @@ -0,0 +1,24 @@
> +# upstream-status pyparsing definition
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +
> +import common
> +import pyparsing
> +
> +upstream_status_literal_valid_status = ["Pending", "Accepted", "Backport", "Denied", "Inappropriate", "Submitted"]
> +upstream_status_nonliteral_valid_status = ["Pending", "Accepted", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
> +
> +upstream_status_valid_status = pyparsing.Or(
> +    [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
> +)
> +
> +upstream_status_mark         = pyparsing.Literal("Upstream-Status")
> +inappropriate_status_mark    = common.inappropriate
> +submitted_status_mark        = common.submitted
> +
> +upstream_status              = common.start + upstream_status_mark + common.colon + upstream_status_valid_status
> +upstream_status_inappropriate_info = common.start + upstream_status_mark + common.colon + common.inappropriateinfo
> +upstream_status_submitted_info = common.start + upstream_status_mark + common.colon + common.submittedinfo
> diff --git a/meta/lib/patchtest/tests/test_mbox_author.py b/meta/lib/patchtest/tests/test_mbox_author.py
> new file mode 100644
> index 0000000000..6c79f164d4
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_author.py
> @@ -0,0 +1,29 @@
> +# Checks related to the patch's author
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import re
> +
> +class Author(base.Base):
> +
> +    auh_email = '<auh@auh.yoctoproject.org>'
> +
> +    invalids = [re.compile("^Upgrade Helper.+"),
> +                re.compile(re.escape(auh_email)),
> +                re.compile("uh@not\.set"),
> +                re.compile("\S+@example\.com")]
> +
> +
> +    def test_author_valid(self):
> +        for commit in self.commits:
> +            for invalid in self.invalids:
> +                if invalid.search(commit.author):
> +                    self.fail('Invalid author %s' % commit.author, 'Resend the series with a valid patch\'s author', commit)
> +
> +    def test_non_auh_upgrade(self):
> +        for commit in self.commits:
> +            if self.auh_email in commit.payload:
> +                self.fail('Invalid author %s in commit message' % self.auh_email, 'Resend the series with a valid patch\'s author', commit)
> diff --git a/meta/lib/patchtest/tests/test_mbox_bugzilla.py b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
> new file mode 100644
> index 0000000000..e8de48bb8d
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
> @@ -0,0 +1,22 @@
> +# Checks related to the patch's bugzilla tag
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import re
> +import base
> +
> +class Bugzilla(base.Base):
> +    rexp_detect     = re.compile("\[\s?YOCTO.*\]", re.IGNORECASE)
> +    rexp_validation = re.compile("\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]", re.IGNORECASE)
> +
> +    def test_bugzilla_entry_format(self):
> +        for commit in Bugzilla.commits:
> +            for line in commit.commit_message.splitlines():
> +                if self.rexp_detect.match(line):
> +                    if not self.rexp_validation.match(line):
> +                        self.fail('Yocto Project bugzilla tag is not correctly formatted',
> +                                  'Specify bugzilla ID in commit description with format: "[YOCTO #<bugzilla ID>]"',
> +                                  commit)
> +
> diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchtest/tests/test_mbox_cve.py
> new file mode 100644
> index 0000000000..f99194c094
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_cve.py
> @@ -0,0 +1,49 @@
> +# Checks related to the patch's CVE lines
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import base
> +import os
> +import parse_cve_tags
> +import re
> +
> +class CVE(base.Base):
> +
> +    revert_shortlog_regex = re.compile('Revert\s+".*"')
> +    prog = parse_cve_tags.cve_tag
> +
> +    def setUp(self):
> +        if self.unidiff_parse_error:
> +            self.skip('Parse error %s' % self.unidiff_parse_error)
> +
> +        # we are just interested in series that introduce CVE patches, thus discard other
> +        # possibilities: modification to current CVEs, patch directly introduced into the
> +        # recipe, upgrades already including the CVE, etc.
> +        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
> +        if not new_cves:
> +            self.skip('No new CVE patches introduced')
> +
> +    def test_cve_presence_in_commit_message(self):
> +        for commit in CVE.commits:
> +            # skip those patches that revert older commits, these do not required the tag presence
> +            if self.revert_shortlog_regex.match(commit.shortlog):
> +                continue
> +            if not self.prog.search_string(commit.payload):
> +                self.fail('Missing or incorrectly formatted CVE tag in mbox',
> +                          'Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
> +                          commit)
> diff --git a/meta/lib/patchtest/tests/test_mbox_description.py b/meta/lib/patchtest/tests/test_mbox_description.py
> new file mode 100644
> index 0000000000..7addc6b5f7
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_description.py
> @@ -0,0 +1,17 @@
> +# Checks related to the patch's commit_message
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +
> +class CommitMessage(base.Base):
> +
> +    def test_commit_message_presence(self):
> +        for commit in CommitMessage.commits:
> +            if not commit.commit_message.strip():
> +                self.fail('Patch is missing a descriptive commit message',
> +                          'Please include a commit message on your patch explaining the change (most importantly why the change is being made)',
> +                          commit)
> +
> diff --git a/meta/lib/patchtest/tests/test_mbox_format.py b/meta/lib/patchtest/tests/test_mbox_format.py
> new file mode 100644
> index 0000000000..85c452ca0d
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_format.py
> @@ -0,0 +1,16 @@
> +# Checks correct parsing of mboxes
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import re
> +
> +class MboxFormat(base.Base):
> +
> +    def test_mbox_format(self):
> +        if self.unidiff_parse_error:
> +            self.fail('Series cannot be parsed correctly due to malformed diff lines',
> +                      'Create the series again using git-format-patch and ensure it can be applied using git am',
> +                      data=[('Diff line', re.sub('^.+:\s(?<!$)','',self.unidiff_parse_error))])
> diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
> new file mode 100644
> index 0000000000..de38e205b1
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
> @@ -0,0 +1,64 @@
> +# Check if the series was intended for other project (not OE-Core)
> +#
> +# Copyright (C) 2017 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import subprocess
> +import collections
> +import base
> +import re
> +from data import PatchTestInput
> +
> +class MailingList(base.Base):
> +
> +    # base paths of main yocto project sub-projects
> +    paths = {
> +        'oe-core': ['meta-selftest', 'meta-skeleton', 'meta', 'scripts'],
> +        'bitbake': ['bitbake'],
> +        'documentation': ['documentation'],
> +        'poky': ['meta-poky','meta-yocto-bsp'],
> +        'oe': ['meta-gpe', 'meta-gnome', 'meta-efl', 'meta-networking', 'meta-multimedia','meta-initramfs', 'meta-ruby', 'contrib', 'meta-xfce', 'meta-filesystems', 'meta-perl', 'meta-webserver', 'meta-systemd', 'meta-oe', 'meta-python']
> +        }
> +
> +    # scripts folder is a mix of oe-core and poky, most is oe-core code except:
> +    poky_scripts = ['scripts/yocto-bsp', 'scripts/yocto-kernel', 'scripts/yocto-layer', 'scripts/lib/bsp']
> +
> +    Project = collections.namedtuple('Project', ['name', 'listemail', 'gitrepo', 'paths'])
> +
> +    bitbake = Project(name='Bitbake', listemail='bitbake-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/bitbake/', paths=paths['bitbake'])
> +    doc     = Project(name='Documentantion', listemail='yocto@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/', paths=paths['documentation'])
> +    poky    = Project(name='Poky', listemail='poky@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/poky/', paths=paths['poky'])
> +    oe      = Project(name='oe', listemail='openembedded-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/meta-openembedded/', paths=paths['oe'])
> +
> +
> +    def test_target_mailing_list(self):
> +        """In case of merge failure, check for other targeted projects"""
> +        if PatchTestInput.repo.ismerged:
> +            self.skip('Series merged, no reason to check other mailing lists')
> +
> +        # a meta project may be indicted in the message subject, if this is the case, just fail
> +        # TODO: there may be other project with no-meta prefix, we also need to detect these
> +        project_regex = re.compile("\[(?P<project>meta-.+)\]")
> +        for commit in MailingList.commits:
> +            match = project_regex.match(commit.subject)
> +            if match:
> +                self.fail('Series sent to the wrong mailing list',
> +                          'Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
> +                          commit)
> +
> +        for patch in self.patchset:
> +            folders = patch.path.split('/')
> +            base_path = folders[0]
> +            for project in [self.bitbake, self.doc, self.oe, self.poky]:
> +                if base_path in  project.paths:
> +                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists', 'Send the series again to the correct mailing list (ML)',
> +                              data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
> +                                    ('Patch\'s path:', patch.path)])
> +
> +            # check for poky's scripts code
> +            if base_path.startswith('scripts'):
> +                for poky_file in self.poky_scripts:
> +                    if patch.path.startswith(poky_file):
> +                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists', 'Send the series again to the correct mailing list (ML)',
> +                                  data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
> diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
> new file mode 100644
> index 0000000000..c8b6718d15
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_merge.py
> @@ -0,0 +1,25 @@
> +# Check if mbox was merged by patchtest
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import subprocess
> +import base
> +from data import PatchTestInput
> +
> +def headlog():
> +    output = subprocess.check_output(
> +        "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchTestInput.repodir,
> +        universal_newlines=True,
> +        shell=True
> +        )
> +    return output.split('#')
> +
> +class Merge(base.Base):
> +    def test_series_merge_on_head(self):
> +        if not PatchTestInput.repo.ismerged:
> +            commithash, author, date, shortlog = headlog()
> +            self.fail('Series does not apply on top of target branch',
> +                      'Rebase your series on top of targeted branch',
> +                      data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
> diff --git a/meta/lib/patchtest/tests/test_mbox_shortlog.py b/meta/lib/patchtest/tests/test_mbox_shortlog.py
> new file mode 100644
> index 0000000000..b6c2a209ff
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_shortlog.py
> @@ -0,0 +1,41 @@
> +# Checks related to the patch's  summary
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import parse_shortlog
> +import pyparsing
> +
> +maxlength = 90
> +
> +class Shortlog(base.Base):
> +
> +    def test_shortlog_format(self):
> +        for commit in Shortlog.commits:
> +            shortlog = commit.shortlog
> +            if not shortlog.strip():
> +                self.skip('Empty shortlog, no reason to execute shortlog format test')
> +            else:
> +                # no reason to re-check on revert shortlogs
> +                if shortlog.startswith('Revert "'):
> +                    continue
> +                try:
> +                    parse_shortlog.shortlog.parseString(shortlog)
> +                except pyparsing.ParseException as pe:
> +                    self.fail('Shortlog does not follow expected format',
> +                              'Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
> +                              commit)
> +
> +    def test_shortlog_length(self):
> +        for commit in Shortlog.commits:
> +            # no reason to re-check on revert shortlogs
> +            shortlog = commit.shortlog
> +            if shortlog.startswith('Revert "'):
> +                continue
> +            l = len(shortlog)
> +            if l > maxlength:
> +                self.fail('Commit shortlog is too long',
> +                          'Edit shortlog so that it is %d characters or less (currently %d characters)' % (maxlength, l),
> +                          commit)
> diff --git a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
> new file mode 100644
> index 0000000000..6458951f1c
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
> @@ -0,0 +1,28 @@
> +# Checks related to the patch's signed-off-by lines
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import parse_signed_off_by
> +import re
> +
> +class SignedOffBy(base.Base):
> +
> +    revert_shortlog_regex = re.compile('Revert\s+".*"')
> +
> +    @classmethod
> +    def setUpClassLocal(cls):
> +        # match self.mark with no '+' preceding it
> +        cls.prog = parse_signed_off_by.signed_off_by
> +
> +    def test_signed_off_by_presence(self):
> +        for commit in SignedOffBy.commits:
> +            # skip those patches that revert older commits, these do not required the tag presence
> +            if self.revert_shortlog_regex.match(commit.shortlog):
> +                continue
> +            if not SignedOffBy.prog.search_string(commit.payload):
> +                self.fail('Patch is missing Signed-off-by',
> +                          'Sign off the patch (either manually or with "git commit --amend -s")',
> +                          commit)
> diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
> new file mode 100644
> index 0000000000..e9a5b6bb4e
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
> @@ -0,0 +1,82 @@
> +# Checks related to the patch's LIC_FILES_CHKSUM  metadata variable
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import re
> +from data import PatchTestInput, PatchTestDataStore
> +
> +class LicFilesChkSum(base.Metadata):
> +    metadata = 'LIC_FILES_CHKSUM'
> +    license  = 'LICENSE'
> +    closed   = 'CLOSED'
> +    lictag   = 'License-Update'
> +    lictag_re  = re.compile("^%s:" % lictag, re.MULTILINE)
> +
> +    def setUp(self):
> +        # these tests just make sense on patches that can be merged
> +        if not PatchTestInput.repo.canbemerged:
> +            self.skip('Patch cannot be merged')
> +
> +    def test_lic_files_chksum_presence(self):
> +        if not self.added:
> +            self.skip('No added recipes, skipping test')
> +
> +        for pn in self.added:
> +            rd = self.tinfoil.parse_recipe(pn)
> +            pathname = rd.getVar('FILE')
> +            # we are not interested in images
> +            if '/images/' in pathname:
> +                continue
> +            lic_files_chksum = rd.getVar(self.metadata)
> +            if rd.getVar(self.license) == self.closed:
> +                continue
> +            if not lic_files_chksum:
> +                self.fail('%s is missing in newly added recipe' % self.metadata,
> +                          'Specify the variable %s in %s' % (self.metadata, pn))
> +
> +    def pretest_lic_files_chksum_modified_not_mentioned(self):
> +        if not self.modified:
> +            self.skip('No modified recipes, skipping pretest')
> +        # get the proper metadata values
> +        for pn in self.modified:
> +            rd = self.tinfoil.parse_recipe(pn)
> +            pathname = rd.getVar('FILE')
> +            # we are not interested in images
> +            if '/images/' in pathname:
> +                continue
> +            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata,pn)] = rd.getVar(self.metadata)
> +
> +    def test_lic_files_chksum_modified_not_mentioned(self):
> +        if not self.modified:
> +            self.skip('No modified recipes, skipping test')
> +
> +        # get the proper metadata values
> +        for pn in self.modified:
> +            rd = self.tinfoil.parse_recipe(pn)
> +            pathname = rd.getVar('FILE')
> +            # we are not interested in images
> +            if '/images/' in pathname:
> +                continue
> +            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata,pn)] = rd.getVar(self.metadata)
> +        # compare if there were changes between pre-merge and merge
> +        for pn in self.modified:
> +            pretest = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(),self.metadata, pn)]
> +            test    = PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata, pn)]
> +
> +            # TODO: this is workaround to avoid false-positives when pretest metadata is empty (not reason found yet)
> +            # For more info, check bug 12284
> +            if not pretest:
> +                return
> +
> +            if pretest != test:
> +                # if any patch on the series contain reference on the metadata, fail
> +                for commit in self.commits:
> +                    if self.lictag_re.search(commit.commit_message):
> +                       break
> +                else:
> +                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "%s" tag in commit message' % (pn, self.lictag),
> +                              'Include "%s: <description>" into the commit message with a brief description' % self.lictag,
> +                              data=[('Current checksum', pretest), ('New checksum', test)])
> diff --git a/meta/lib/patchtest/tests/test_metadata_license.py b/meta/lib/patchtest/tests/test_metadata_license.py
> new file mode 100644
> index 0000000000..16604dbfb1
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_metadata_license.py
> @@ -0,0 +1,55 @@
> +# Checks related to the patch's LIC_FILES_CHKSUM  metadata variable
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import os
> +from data import PatchTestInput
> +
> +class License(base.Metadata):
> +    metadata = 'LICENSE'
> +    invalid_license = 'PATCHTESTINVALID'
> +
> +    def setUp(self):
> +        # these tests just make sense on patches that can be merged
> +        if not PatchTestInput.repo.canbemerged:
> +            self.skip('Patch cannot be merged')
> +
> +    def test_license_presence(self):
> +        if not self.added:
> +            self.skip('No added recipes, skipping test')
> +
> +        # TODO: this is a workaround so we can parse the recipe not
> +        # containing the LICENSE var: add some default license instead
> +        # of INVALID into auto.conf, then remove this line at the end
> +        auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
> +        open_flag = 'w'
> +        if os.path.exists(auto_conf):
> +            open_flag = 'a'
> +        with open(auto_conf, open_flag) as fd:
> +            for pn in self.added:
> +                fd.write('LICENSE ??= "%s"\n' % self.invalid_license)
> +
> +        no_license = False
> +        for pn in self.added:
> +            rd = self.tinfoil.parse_recipe(pn)
> +            license = rd.getVar(self.metadata)
> +            if license == self.invalid_license:
> +                no_license = True
> +                break
> +
> +        # remove auto.conf line or the file itself
> +        if open_flag == 'w':
> +            os.remove(auto_conf)
> +        else:
> +            fd = open(auto_conf, 'r')
> +            lines = fd.readlines()
> +            fd.close()
> +            with open(auto_conf, 'w') as fd:
> +                fd.write(''.join(lines[:-1]))
> +
> +        if no_license:
> +            self.fail('Recipe does not have the LICENSE field set', 'Include a LICENSE into the new recipe')
> +
> diff --git a/meta/lib/patchtest/tests/test_metadata_max_length.py b/meta/lib/patchtest/tests/test_metadata_max_length.py
> new file mode 100644
> index 0000000000..04a5e23469
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_metadata_max_length.py
> @@ -0,0 +1,26 @@
> +# Checks related to patch line lengths
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import re
> +
> +class MaxLength(base.Base):
> +    add_mark = re.compile('\+ ')
> +    max_length = 200
> +
> +    def test_max_line_length(self):
> +        for patch in self.patchset:
> +            # for the moment, we are just interested in metadata
> +            if patch.path.endswith('.patch'):
> +                continue
> +            payload = str(patch)
> +            for line in payload.splitlines():
> +                if self.add_mark.match(line):
> +                    current_line_length = len(line[1:])
> +                    if current_line_length > self.max_length:
> +                        self.fail('Patch line too long (current length %s)' % current_line_length,
> +                                  'Shorten the corresponding patch line (max length supported %s)' % self.max_length,
> +                                  data=[('Patch', patch.path), ('Line', '%s ...' % line[0:80])])
> diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib/patchtest/tests/test_metadata_src_uri.py
> new file mode 100644
> index 0000000000..718229d7ad
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_metadata_src_uri.py
> @@ -0,0 +1,75 @@
> +# Checks related to the patch's SRC_URI metadata variable
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import subprocess
> +import base
> +import re
> +import os
> +from data import PatchTestInput, PatchTestDataStore
> +
> +class SrcUri(base.Metadata):
> +
> +    metadata  = 'SRC_URI'
> +    md5sum    = 'md5sum'
> +    sha256sum = 'sha256sum'
> +    git_regex = re.compile('^git\:\/\/.*')
> +
> +    def setUp(self):
> +        # these tests just make sense on patches that can be merged
> +        if not PatchTestInput.repo.canbemerged:
> +            self.skip('Patch cannot be merged')
> +
> +    def pretest_src_uri_left_files(self):
> +        if not self.modified:
> +            self.skip('No modified recipes, skipping pretest')
> +
> +        # get the proper metadata values
> +        for pn in self.modified:
> +            # we are not interested in images
> +            if 'core-image' in pn:
> +                continue
> +            rd = self.tinfoil.parse_recipe(pn)
> +            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata, pn)] = rd.getVar(self.metadata)
> +
> +    def test_src_uri_left_files(self):
> +        if not self.modified:
> +            self.skip('No modified recipes, skipping pretest')
> +
> +        # get the proper metadata values
> +        for pn in self.modified:
> +            # we are not interested in images
> +            if 'core-image' in pn:
> +                continue
> +            rd = self.tinfoil.parse_recipe(pn)
> +            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata, pn)] = rd.getVar(self.metadata)
> +
> +        for pn in self.modified:
> +            pretest_src_uri = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(), self.metadata, pn)].split()
> +            test_src_uri    = PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata, pn)].split()
> +
> +            pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
> +            test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
> +
> +            # check if files were removed
> +            if len(test_files) < len(pretest_files):
> +
> +                # get removals from patchset
> +                filesremoved_from_patchset = set()
> +                for patch in self.patchset:
> +                    if patch.is_removed_file:
> +                        filesremoved_from_patchset.add(os.path.basename(patch.path))
> +
> +                # get the deleted files from the SRC_URI
> +                filesremoved_from_usr_uri = pretest_files - test_files
> +
> +                # finally, get those patches removed at SRC_URI and not removed from the patchset
> +                # TODO: we are not taking into account  renames, so test may raise false positives
> +                not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
> +                if not_removed:
> +                    self.fail('Patches not removed from tree',
> +                              'Amend the patch containing the software patch file removal',
> +                              data=[('Patch', f) for f in not_removed])
> +
> diff --git a/meta/lib/patchtest/tests/test_metadata_summary.py b/meta/lib/patchtest/tests/test_metadata_summary.py
> new file mode 100644
> index 0000000000..931b26768e
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_metadata_summary.py
> @@ -0,0 +1,32 @@
> +# Checks related to the patch's summary metadata variable
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +from data import PatchTestInput
> +
> +class Summary(base.Metadata):
> +    metadata = 'SUMMARY'
> +
> +    def setUp(self):
> +        # these tests just make sense on patches that can be merged
> +        if not PatchTestInput.repo.canbemerged:
> +            self.skip('Patch cannot be merged')
> +
> +    def test_summary_presence(self):
> +        if not self.added:
> +            self.skip('No added recipes, skipping test')
> +
> +        for pn in self.added:
> +            # we are not interested in images
> +            if 'core-image' in pn:
> +                continue
> +            rd = self.tinfoil.parse_recipe(pn)
> +            summary = rd.getVar(self.metadata)
> +
> +            # "${PN} version ${PN}-${PR}" is the default, so fail if default
> +            if summary.startswith('%s version' % pn):
> +                self.fail('%s is missing in newly added recipe' % self.metadata,
> +                          'Specify the variable %s in %s' % (self.metadata, pn))
> diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patchtest/tests/test_patch_cve.py
> new file mode 100644
> index 0000000000..46ed9ef791
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_patch_cve.py
> @@ -0,0 +1,51 @@
> +# Checks related to the patch's CVE lines
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import base
> +import os
> +import re
> +
> +class CVE(base.Base):
> +
> +    re_cve_pattern = re.compile("CVE\-\d{4}\-\d+", re.IGNORECASE)
> +    re_cve_payload_tag     = re.compile("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
> +
> +    def setUp(self):
> +        if self.unidiff_parse_error:
> +            self.skip('Parse error %s' % self.unidiff_parse_error)
> +
> +        # we are just interested in series that introduce CVE patches, thus discard other
> +        # possibilities: modification to current CVEs, patch directly introduced into the
> +        # recipe, upgrades already including the CVE, etc.
> +        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
> +        if not new_cves:
> +            self.skip('No new CVE patches introduced')
> +
> +    def test_cve_tag_format(self):
> +        for commit in CVE.commits:
> +            if self.re_cve_pattern.search(commit.shortlog) or self.re_cve_pattern.search(commit.commit_message):
> +                tag_found = False
> +                for line in commit.payload.splitlines():
> +                    if self.re_cve_payload_tag.match(line):
> +                        tag_found = True
> +                        break
> +                if not tag_found:
> +                    self.fail('Missing or incorrectly formatted CVE tag in included patch file',
> +                              'Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"',
> +                              commit)
> diff --git a/meta/lib/patchtest/tests/test_patch_signed_off_by.py b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
> new file mode 100644
> index 0000000000..4855d6daf7
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
> @@ -0,0 +1,43 @@
> +# Checks related to the patch's signed-off-by lines
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import parse_signed_off_by
> +import re
> +
> +class PatchSignedOffBy(base.Base):
> +
> +    @classmethod
> +    def setUpClassLocal(cls):
> +        cls.newpatches = []
> +        # get just those relevant patches: new software patches
> +        for patch in cls.patchset:
> +            if patch.path.endswith('.patch') and patch.is_added_file:
> +                cls.newpatches.append(patch)
> +
> +        cls.mark = str(parse_signed_off_by.signed_off_by_mark).strip('"')
> +
> +        # match PatchSignedOffBy.mark with '+' preceding it
> +        cls.prog = parse_signed_off_by.patch_signed_off_by
> +
> +    def setUp(self):
> +        if self.unidiff_parse_error:
> +            self.skip('Parse error %s' % self.unidiff_parse_error)
> +
> +    def test_signed_off_by_presence(self):
> +        if not PatchSignedOffBy.newpatches:
> +            self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
> +
> +        for newpatch in PatchSignedOffBy.newpatches:
> +            payload = newpatch.__str__()
> +            for line in payload.splitlines():
> +                if self.patchmetadata_regex.match(line):
> +                    continue
> +                if PatchSignedOffBy.prog.search_string(payload):
> +                    break
> +            else:
> +                self.fail('A patch file has been added, but does not have a Signed-off-by tag',
> +                          'Sign off the added patch file (%s)' % newpatch.path)
> diff --git a/meta/lib/patchtest/tests/test_patch_upstream_status.py b/meta/lib/patchtest/tests/test_patch_upstream_status.py
> new file mode 100644
> index 0000000000..eda5353c66
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_patch_upstream_status.py
> @@ -0,0 +1,64 @@
> +# Checks related to the patch's upstream-status lines
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +import parse_upstream_status
> +import pyparsing
> +import os
> +
> +class PatchUpstreamStatus(base.Base):
> +
> +    upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
> +
> +    @classmethod
> +    def setUpClassLocal(cls):
> +        cls.newpatches = []
> +        # get just those relevant patches: new software patches
> +        for patch in cls.patchset:
> +            if patch.path.endswith('.patch') and patch.is_added_file:
> +                cls.newpatches.append(patch)
> +
> +    def setUp(self):
> +        if self.unidiff_parse_error:
> +            self.skip('Python-unidiff parse error')
> +        self.valid_status    = ', '.join(parse_upstream_status.upstream_status_nonliteral_valid_status)
> +        self.standard_format = 'Upstream-Status: <Valid status>'
> +
> +    def test_upstream_status_presence_format(self):
> +        if not PatchUpstreamStatus.newpatches:
> +            self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
> +
> +        for newpatch in PatchUpstreamStatus.newpatches:
> +            payload = newpatch.__str__()
> +            if not self.upstream_status_regex.search_string(payload):
> +                self.fail('Added patch file is missing Upstream-Status in the header',
> +                          'Add Upstream-Status: <Valid status> to the header of %s' % newpatch.path,
> +                          data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
> +            for line in payload.splitlines():
> +                if self.patchmetadata_regex.match(line):
> +                    continue
> +                if self.upstream_status_regex.search_string(line):
> +                        if parse_upstream_status.inappropriate_status_mark.searchString(line):
> +                            try:
> +                                parse_upstream_status.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
> +                            except pyparsing.ParseException as pe:
> +                                self.fail('Upstream-Status is Inappropriate, but no reason was provided',
> +                                          'Include a brief reason why %s is inappropriate' % os.path.basename(newpatch.path),
> +                                          data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Inappropriate [reason]')])
> +                        elif parse_upstream_status.submitted_status_mark.searchString(line):
> +                            try:
> +                                parse_upstream_status.upstream_status_submitted_info.parseString(line.lstrip('+'))
> +                            except pyparsing.ParseException as pe:
> +                                self.fail('Upstream-Status is Submitted, but it is not mentioned where',
> +                                          'Include where %s was submitted' % os.path.basename(newpatch.path),
> +                                          data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Submitted [where]')])
> +                        else:
> +                            try:
> +                                parse_upstream_status.upstream_status.parseString(line.lstrip('+'))
> +                            except pyparsing.ParseException as pe:
> +                                self.fail('Upstream-Status is in incorrect format',
> +                                          'Fix Upstream-Status format in %s' % os.path.basename(newpatch.path),
> +                                          data=[('Current', pe.pstr), ('Standard format', self.standard_format), ('Valid status', self.valid_status)])
> diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
> new file mode 100644
> index 0000000000..ea8efb7c2a
> --- /dev/null
> +++ b/meta/lib/patchtest/tests/test_python_pylint.py
> @@ -0,0 +1,61 @@
> +# Checks related to the python code done with pylint
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +
> +import base
> +from data import PatchTestInput
> +import pylint.epylint as lint
> +
> +class PyLint(base.Base):
> +    pythonpatches  = []
> +    pylint_pretest = {}
> +    pylint_test    = {}
> +    pylint_options = " -E --disable='E0611, E1101, F0401, E0602' --msg-template='L:{line} F:{module} I:{msg}'"
> +
> +    @classmethod
> +    def setUpClassLocal(cls):
> +        # get just those patches touching python files
> +        cls.pythonpatches = []
> +        for patch in cls.patchset:
> +            if patch.path.endswith('.py'):
> +                if not patch.is_removed_file:
> +                    cls.pythonpatches.append(patch)
> +
> +    def setUp(self):
> +        if self.unidiff_parse_error:
> +            self.skip('Python-unidiff parse error')
> +        if not PatchTestInput.repo.canbemerged:
> +            self.skip('Patch cannot be merged, no reason to execute the test method')
> +        if not PyLint.pythonpatches:
> +            self.skip('No python related patches, skipping test')
> +
> +    def pretest_pylint(self):
> +        for pythonpatch in self.pythonpatches:
> +            if pythonpatch.is_modified_file:
> +                (pylint_stdout, pylint_stderr) = lint.py_run(command_options = pythonpatch.path + self.pylint_options, return_std=True)
> +                for line in pylint_stdout.readlines():
> +                    if not '*' in line:
> +                        if line.strip():
> +                            self.pylint_pretest[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
> +
> +    def test_pylint(self):
> +        for pythonpatch in self.pythonpatches:
> +            # a condition checking whether a file is renamed or not
> +            # unidiff doesn't support this yet
> +            if pythonpatch.target_file is not pythonpatch.path:
> +                path = pythonpatch.target_file[2:]
> +            else:
> +                path = pythonpatch.path
> +            (pylint_stdout, pylint_stderr) = lint.py_run(command_options = path + self.pylint_options, return_std=True)
> +            for line in pylint_stdout.readlines():
> +                    if not '*' in line:
> +                        if line.strip():
> +                            self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
> +
> +        for issue in self.pylint_test:
> +             if self.pylint_test[issue] not in self.pylint_pretest.values():
> +                 self.fail('Errors in your Python code were encountered',
> +                           'Correct the lines introduced by your patch',
> +                           data=[('Output', 'Please, fix the listed issues:'), ('', issue + ' ' + self.pylint_test[issue])])
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187539): https://lists.openembedded.org/g/openembedded-core/message/187539
> Mute This Topic: https://lists.openembedded.org/mt/101319876/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

