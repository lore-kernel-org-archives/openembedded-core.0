Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D0FC25B7C
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 18:42:00 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.21171.1717180915173875748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 11:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1JSyorc7;
 spf=pass (domain: baylibre.com, ip: 209.85.167.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c9b94951d5so1223236b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 11:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717180914; x=1717785714; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BX9fjlF0hEG3bkP1Gq6un/OlioxJwaQjUliWwfXyAhY=;
        b=1JSyorc7sj8rQK9be1sftDc7PUFHls+6PXBTXjQGjG0JY2ZCEo6Rc2UjHuihDY7I2A
         ynLwDMT/uH0sNyRFmGWzYY55ZCoRW9GVxVpjF/iRyYm90qjzBfkt4plOA6Syvc2nd7mk
         AqLA+mDv49y4pap3Tnh8oaBVIcq1EAAIMbo2dNHy7jjpx8QnYSqmPRLh8T/s7NVed7dA
         MZRL63+7d+4LHx/wWS0/jSVWphk3UN3PsUD90VGbWe0IfmOxXCaUBZcT9l6oKgsbcW4b
         ad74Uf+CHLVvEmQftajObREGfEeEih6wC2QW+q0fMSqljcjh9pZzAlAB1K2v0CXbk1Z3
         Jiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717180914; x=1717785714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX9fjlF0hEG3bkP1Gq6un/OlioxJwaQjUliWwfXyAhY=;
        b=OxORpFTMrylnoVAyEapbzrtZBlv0nWLPszOcrUExyP1+6zakVS3hOOemt1lY/O0tYs
         xvCKKUcI49E5gEC4hzzMb3sSI6iFJ1XXZvT+Byv6d839Eq0GVB2uZFWLA5soNx/3WiuX
         XBMFOGB9F1oQEodrO3KDRh9fPncXad7wtW7ehUg2bLxcUqqXHkkoXU/MpPyS5ao9ogBS
         iPtu4W0/egGIiYGD2tUpiRnuuGtJFDcZuI/O3d8WSY7fxOYRri7VilmY7rDWj5Zc+gOK
         CCisHVMnLgPoVRsLJF5ZhQdED1IvYixX8rtkvf2NAOkX+4t03fo/THl8/jGhUSYFerXV
         Mz0w==
X-Gm-Message-State: AOJu0YyHbY5hOYFT8WZQVSUW2iM+lHg6yfIeliGrUijk5S9XeJh1eGDB
	GMXz0PGv8kuaEArV4DNJnmYDcQQ17EIMKKpvNG11xRu1ZRNFmlgehpVj+We65ns=
X-Google-Smtp-Source: AGHT+IEVMzX2B6ARoLjhs9YxntuySW3lsAyNfhX9wpVAZ8PpaQvzLsZSM+HWVtxWuW/YpQN7dSg7lg==
X-Received: by 2002:a05:6808:1585:b0:3d1:e1bb:b370 with SMTP id 5614622812f47-3d1e35c0c60mr3516679b6e.37.1717180914168;
        Fri, 31 May 2024 11:41:54 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a74d6fesm8545936d6.55.2024.05.31.11.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 11:41:53 -0700 (PDT)
Message-ID: <077db967-3f2a-40da-a729-6fc69933b346@baylibre.com>
Date: Fri, 31 May 2024 14:41:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: selftest: fix
 patch files
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20240531173305.3233365-1-tgamblin@baylibre.com>
 <0101018fcfc4e505-7a55c837-268a-4bf7-96e6-86d31c6c3939-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018fcfc4e505-7a55c837-268a-4bf7-96e6-86d31c6c3939-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200082


On 2024-05-31 1:48 p.m., patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/patchtest-selftest-fix-patch-files.patch
>
> FAIL: test non-AUH upgrade: Invalid author auh@auh.yoctoproject.org. Resend the series with a valid patch author (test_mbox.TestMbox.test_non_auh_upgrade)
This one can be ignored - the use of the AUH author there is needed for 
the selftest (to ensure it's not AUH on submitted patches :) )
>
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!

