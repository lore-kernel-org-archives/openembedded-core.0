Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D573C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 14:26:21 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.19978.1708093580210914812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 06:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ywdpZKAs;
 spf=pass (domain: baylibre.com, ip: 209.85.160.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42dc86cc35fso9703911cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 06:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708093579; x=1708698379; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FuH8ULfjnCyOzaJJlOz1aOUiHp51oTZssFbyOiBxb5k=;
        b=ywdpZKAstb7NtGYjh4bPwczwL8ocUsWp2iKU7WfOHceCE72/IHld7RD4oA7Edrnj90
         0/u/GXIreFDqwAtu/OO0hBjTfEeU2HwpOLGa929Y5AP//mWV8gTvG5303nM9iLvcijik
         cfIFoLH5boeg7CuDEeo5HnqthBtdmxn/xxsywjF5y7UYKHvAqI4zHj6H55vbzgVIltxj
         aJzc+5zB+ablPZ78NIy1ZnKLY7RrVap7xHSVozJCsDeM/WpUB4fvdJkPwRhiPOcBXLm9
         UYZKcU3a0VBU6zzmQO4yAzohCdZg5LD4U7H+8R9g/+zmw63rByEIJE3O4KR49QkZk4Ub
         kcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708093579; x=1708698379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuH8ULfjnCyOzaJJlOz1aOUiHp51oTZssFbyOiBxb5k=;
        b=jFkSGCjoM2adTyZoqUUn2I+m95fH6fS8Hs2iQ2xmOypjNKJtQyVslx8iWuqJFrJkXf
         PwAUQgKOJR2+VR6RFSwzig9Pekg7GWWbftIw0loWB6JszgI5+Dlqx/nu91LQCDPbT2AI
         cq1Jb1nOst+N9a/6SjvYenbTO/ZSIIpJl5/XI/XCvNAOkffHZIDq+0PBkvpHO7apceaO
         YUPnlX++Tk3Q6ri+4R7sC5W+NOZcyqXetIOtQOhLVm7D2/1uZoe0Ar+APCN5yw2aeoRM
         lDwgWCm5twpRKHnfyR15cfddzZT4etK7SdbCazux7pKEYUooXzntYj7yD5UEXEGPmTzz
         LscA==
X-Gm-Message-State: AOJu0YwFyy0+xHrIsRVhSUKc6PKCwifCaCj3eNxZVSzstBoqpkdITTw9
	bJZTqxqZagW23yNIL2nGmb4Chnzc1Cq1jRzc6AkResRb4r1IGem+dwMr20f5zio=
X-Google-Smtp-Source: AGHT+IFYw66oTzT3y52Bgwvhj8ahSa1LYUTFg5LrfYCQsMKNU9BCFcLVWk3iHn14vCS8lx+Ba9MZ3g==
X-Received: by 2002:ac8:5941:0:b0:42c:798e:1c6 with SMTP id 1-20020ac85941000000b0042c798e01c6mr5468837qtz.36.1708093579227;
        Fri, 16 Feb 2024 06:26:19 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ic14-20020a05622a68ce00b0042c5a47df18sm1570482qtb.55.2024.02.16.06.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:26:18 -0800 (PST)
Message-ID: <0b77dcfb-392c-4c7f-82ee-1d95eac727e0@baylibre.com>
Date: Fri, 16 Feb 2024 09:26:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH 2/5]
 meta/lib/bblayers/buildconf.py: add support for configuration summaries
Content-Language: en-US
To: Patchtest <patchtest@automation.yoctoproject.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240216115222.3545462-2-alex@linutronix.de>
 <0101018db234cd8f-ecc9d987-2098-4b79-904c-1224c0737462-000000@us-west-2.amazonses.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018db234cd8f-ecc9d987-2098-4b79-904c-1224c0737462-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 14:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195774


On 2024-02-16 08:57, Patchtest wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
Alright, so it's still not working properly. Short of changing the 
subject line, I'm not sure what else can be done on our end, unless 
there's a problem with the mailer itself - but that should show up in 
the headers if that's the case.
>
> ---
> Testing patch /home/patchtest/share/mboxes/2-5-meta-lib-bblayers-buildconf.py-add-support-for-configuration-summaries.patch
>
> FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
>
> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195771): https://lists.openembedded.org/g/openembedded-core/message/195771
> Mute This Topic: https://lists.openembedded.org/mt/104392578/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

