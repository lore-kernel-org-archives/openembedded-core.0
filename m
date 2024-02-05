Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D980C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 19:05:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.2491.1707159900236893141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 11:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0UHCTrM5;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-783f1fba0a8so250005485a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707159899; x=1707764699; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aAlqAHp7YhR6kkBfDk18kfIuFLKdb4SOpo8YYqd050=;
        b=0UHCTrM59oWoxjO/t6mkzbK8komwKyqXCp2SbCs8ps8DjDzSzG5Dm0KJdfV/AiS2uw
         4Ty0sKlyIIRALIHrZkm5ID34hxiX9U6P5Rk5dxzgZpyd42+Kph0+kMiUgCP7P38izYJU
         TXRQSbjN/z8Aq/S8exnh0SF2b5w7LB0jXwiDv/eRZAQfyoUvHY3SNwScZr1HS1cDunyM
         67sPYQvMG3TWaGGVrOOFO7/qIq6aJQntvrfU/7qkfEg7B0s+Jt9MaRqexZRzrWx3rpUx
         d31vMXp+pgq1ZBVLG76rrRM9PR5wqST+VjPFX7TzdZke878jA/36Zf99K9xwfGheUfzM
         SaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707159899; x=1707764699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7aAlqAHp7YhR6kkBfDk18kfIuFLKdb4SOpo8YYqd050=;
        b=gzW40TOFnTFo1VGDvTWPI7tLv4BXVVnva1DVG87oJS14gI7FIHopK/29obk0OVdQRp
         ttGY34V8ZPNpqhU4na0IQt/rLnMir3FUDNUzp7hnJ4e3CLjR4/pYuRhiUWbQlE8rxsE7
         Sb/TQqFv8oNAa7ehS2K0PB51ec/EZ3BSELNfY5eKb1tVdoPQP/5COShiTsTE4R5eGEB2
         t9Snomg2j5ltKVyFNtpLY68CKuhcc06mKmz/B8HixS/TPo4Nr25bUBIEvO2YmhCy2sLi
         60yAmUdyX4UzJbruAWRP0t8b/+NlD+UgBSUjHkUJvyw764Yg06t5GLtOK60XIwelNRRh
         yicA==
X-Gm-Message-State: AOJu0Yxw4McK6YmloqEcKmM3ntrLxD65I6ndJnwbklURx2bVu9zi1fHf
	RWFejfHYEzESgIu+jfLMK5pze040pAY1wPLN10EjRJBVMY6FjArDRfmYm8E+LbM=
X-Google-Smtp-Source: AGHT+IHYDvydwoooSxeReMYIrZOjn3v0S+0/xj8y1haR9YVCoiMx02qT+D0CstO65tCJ9Z2+X4KPCg==
X-Received: by 2002:ae9:e116:0:b0:785:7d89:6bb0 with SMTP id g22-20020ae9e116000000b007857d896bb0mr353145qkm.16.1707159899020;
        Mon, 05 Feb 2024 11:04:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWWaJShQySvOQDZN63UtPClomz2turhn4w3qkx8tn5NgofaFfaHfDGac6qGVgQYSE79zG1ucJYzdfBO/8at49zVC9UO4+ZvvSWvYA==
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 26-20020a05620a04da00b0077f435ed844sm194674qks.112.2024.02.05.11.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 11:04:58 -0800 (PST)
Message-ID: <2831a2b2-53aa-4f1b-b3e1-6d2e318ebca4@baylibre.com>
Date: Mon, 5 Feb 2024 14:04:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-Core][PATCH v3 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
To: Patchtest <patchtest@automation.yoctoproject.org>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <0101018d79bfe020-06f2ce89-ea19-456b-92e7-66ee1c710fd1-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018d79bfe020-06f2ce89-ea19-456b-92e7-66ee1c710fd1-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 19:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194965


On 2024-02-05 09:50, Patchtest wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
>
> Testing patch /home/patchtest/share/mboxes/v3-1-2-testimage-move-TESTIMAGE_FAILED_QA_ARTIFACTS-default-to-core-image.patch
>
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
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
This is odd. I think your patch is OK - patchtest looks for "FAIL" in 
the patch body, and must've gotten snagged on the subject line.
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194944): https://lists.openembedded.org/g/openembedded-core/message/194944
> Mute This Topic: https://lists.openembedded.org/mt/104177178/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

