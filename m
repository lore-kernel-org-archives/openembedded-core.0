Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C7FCD3426
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 01:28:25 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.8194.1725154096645617432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 18:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=14+5zew/;
 spf=pass (domain: baylibre.com, ip: 209.85.161.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5de8b17db8dso1848602eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 18:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725154096; x=1725758896; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cPtiBV125ss44j4Oj5cnLlLavvkUTQNGN3kOzOm/1o=;
        b=14+5zew/aftuzIV/g1k7lMZWPXcEyGeO0DJxQ/Un7ojA0keQjH7GBKztRJAow6G83A
         3medEtnG/9iWyRfH+xSdNsUgCUmy007O38y0AyPlDmjSZNZQz0t+AXDwUUCAq6Bh/f7e
         ysxi/JwADLeENLlEmP+7QzrBeqF/9ac5/Z8TNG0UWSFD345rxD5N2k9Nw6Kv8BsUl9e2
         x+pjl43ZmhIw+sP92fLuqONogHqtWJfnmXgB2D7pTIUGKTxd5upg0AmC/AWmsSFRg/3B
         RK7Y+7NH3H6SE9GpMvi9EtZTSlnrVyNPW125YG+Njw1Tx+PSLkvCzBFWW1D9q+WtdOvB
         DgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725154096; x=1725758896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cPtiBV125ss44j4Oj5cnLlLavvkUTQNGN3kOzOm/1o=;
        b=iQs6a2+lZe3UdIKSPxhZVuYgLWwsEjxNZSbeFT9NaDyfjqbH3jreNsQzz9mdPWHDb3
         im4qYZSwyhdHEBmFiZbUAg6ytogOP4cb4FwkiTP7neKccSTZieK3EuDiQuiP36N6XKtZ
         J1F6HGOUKepaSbiaWQoH5nZXRAWGvdfG1QGvFexBVMcbMSUVpFFSc+NY+Ie4xDEpNYMX
         3FUQ73pFhDpjYxsUIa+MQOgTRG3fSl1iYmqVzOz4mD7DhIO5CZOTW4oxf8l3UGvwUXXR
         V8+yuDtG7AVuQGiEHAD9h0hJvFqLgrP/WWjjf6UwsnqOFgO9Vmw7LaHzwaMeZ01lCHm3
         SLzQ==
X-Gm-Message-State: AOJu0YyW+F6C90yPmVWaBG6Fhi1OycK2maV2hynxplQjpVSUSiqd5Imh
	KCmHFpC+BSAk0W657YpJfK83b3vE7VZjBllw2fc0bmBLb2SIb16FveYlLNj+MU8=
X-Google-Smtp-Source: AGHT+IFCkCN2N+8b1FyWCEfaxx3xggydLvXsMClFTxGvmd8ieCyXvohtyAhy6Ztpcupwz4TVrc3oMA==
X-Received: by 2002:a05:6870:639e:b0:270:33b8:1a7 with SMTP id 586e51a60fabf-277900cfc16mr11509961fac.19.1725154095586;
        Sat, 31 Aug 2024 18:28:15 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d5e147sm286614285a.112.2024.08.31.18.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 18:28:15 -0700 (PDT)
Message-ID: <4f2fc0e4-33d9-4f7c-b1d0-4acb5f3fa7e9@baylibre.com>
Date: Sat, 31 Aug 2024 21:28:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest:
 test_non_auh_upgrade: improve parse logic
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20240901005119.2736306-1-tgamblin@baylibre.com>
 <01010191ab1c3531-8bd5851b-f863-4d9d-afa4-70244f0d2302-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <01010191ab1c3531-8bd5851b-f863-4d9d-afa4-70244f0d2302-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 01:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203980


On 2024-08-31 9:03 p.m., patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/patchtest-test_non_auh_upgrade-improve-parse-logic.patch
>
> FAIL: test non-AUH upgrade: Invalid author auh@auh.yoctoproject.org. Resend the series with a valid patch author (test_mbox.TestMbox.test_non_auh_upgrade)
This is expected since the new logic isn't added to the running version 
of patchtest yet :)
>
> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
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

