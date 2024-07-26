Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284A2C3DA70
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.65429.1722010968956991988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XnmLOjIo;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b7aed340daso5258476d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722010968; x=1722615768; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQ3yvG8/xjgfuRqWuNyiE2Ou8zICRKTMBkIrOaQdZyA=;
        b=XnmLOjIoYVxzNGM1ahcqP8cqDwojYEV/8jGwdYoUxm2L0Cf7QGAUjivvfhGzTBkUaG
         rdOiFHRrurmhvq0fNPbBVAPIgRHVirpL+M1KiS0p4f8irsUCwSoisTXidRIbuOY1xRzS
         MhMBt2lpwT9FhSlOEaO7jdpD7ilcvbUJcv4yZgdGuF8jL5epjQKoNJLN6nH4tSQg9sBp
         Vvd8iDBQk7XwGdQ5o7FhDAMjy1mXcxo2BrOknXXiwxzTlLTjE2Zikblb11uTSufl+FEQ
         eitPFcDLTTLSphCxn3gdW4Po4ZdqvZceIaZRctafpZuEssi7gBpDgqlJwCHxLv1o5eZ8
         q8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722010968; x=1722615768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ3yvG8/xjgfuRqWuNyiE2Ou8zICRKTMBkIrOaQdZyA=;
        b=Z43j39GMyVHyf+SxlelblyIMInyBUiNsM0MpP4MHMWrvCb+xkihhIhg2hRjJ9RhVhx
         EyQDA3tMus9rqjDDXpcJXW54cJS2L5Mj1J6E/ej3zz11BksM3jVET2sfQCCWtpWEqrQn
         Qtgg9LSQuhYZ3x2FfE8eFeMpsJh/JHM9eGXCwRAZPpxWeFLYP/4GHixeGnonogpjZ/OI
         tbewfrPR9D7AGO1KsFueHB0Bic5sjuuvvQhuof+c5o1vHqQpuqwNGVgL/HPT3O2TPCEC
         lut6hGHq1YP08niOM48XwZTTT/8pSEugkKeN5P6REC7ICcAT6j7rRdv7v5E3OtPeQfNk
         COgw==
X-Forwarded-Encrypted: i=1; AJvYcCUhD+oxuY6cepBBQnoaPlZyk7sTf94hbUWlJycLNvcbyFymFquR9q7zr6lYxJx5gSMeXoZ9rAeFQctq06RY45Xkl6598REs8tzRGY7dP9cIE9WNGu/sN7my
X-Gm-Message-State: AOJu0YyRuWH4rfrjsPgS8KGxPSSXycqZP7txJ2BU/1bSFLQjRaQHUihM
	MdhpfSVSNqXIFrEhgiHcgNtkFZ2fprltpHWORIwbiJ6tEnl1lzOKYGaDcXztMcs=
X-Google-Smtp-Source: AGHT+IFmsQWVc2GAcsxSez4gi5gB+I2tpSXBNO/85Dmasl4B+7Vu1TyEThtrIfDjqE3SL0Dr3zwtSA==
X-Received: by 2002:ad4:5c6f:0:b0:6b5:d9ef:d56d with SMTP id 6a1803df08f44-6bb559c3461mr3680566d6.21.1722010967735;
        Fri, 26 Jul 2024 09:22:47 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3fb06650sm17873906d6.136.2024.07.26.09.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 09:22:47 -0700 (PDT)
Message-ID: <5fff4acf-8e8b-4c41-84e6-f3e09cc12c72@baylibre.com>
Date: Fri, 26 Jul 2024 12:22:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH] rpcbind: Fix boot time
 start failure
To: zboszor@gmail.com,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <20240726112431.698884-1-zboszor@gmail.com>
 <01010190eed1a9f9-359372c0-aa36-4b02-8ab6-6e1188435e1a-000000@us-west-2.amazonses.com>
 <f48adef0-f8e0-4c02-a738-09fc74b2e739@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <f48adef0-f8e0-4c02-a738-09fc74b2e739@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202558


On 2024-07-26 7:40 a.m., Zoltan Boszormenyi via lists.openembedded.org 
wrote:
> 2024. 07. 26. 13:33 keltezéssel, patchtest@automation.yoctoproject.org 
> írta:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch 
>> /home/patchtest/share/mboxes/rpcbind-Fix-boot-time-start-failure.patch
>>
>> FAIL: test Upstream-Status presence: Upstream-Status is in incorrect 
>> format (test_patch.TestPatch.test_upstream_status_presence_format)
>
> How is it in incorrect format? I used the documented format from
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-statusThis 
> is supposed to be a correct format according to the documentation, 
> right? |
>
> Inactive-Upstream [lastrelease: YYYY-MM-DD]
Looks like a bug. I'll get an issue logged.
> |
>> PASS: pretest src uri left files 
>> (test_metadata.TestMetadata.pretest_src_uri_left_files)
>> PASS: test CVE check ignore 
>> (test_metadata.TestMetadata.test_cve_check_ignore)
>> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
>> PASS: test Signed-off-by presence 
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>> PASS: test Signed-off-by presence 
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test commit message presence 
>> (test_mbox.TestMbox.test_commit_message_presence)
>> PASS: test lic files chksum modified not mentioned 
>> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
>> PASS: test max line length 
>> (test_metadata.TestMetadata.test_max_line_length)
>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>> PASS: test src uri left files 
>> (test_metadata.TestMetadata.test_src_uri_left_files)
>>
>> SKIP: pretest pylint: No python related patches, skipping test 
>> (test_python_pylint.PyLint.pretest_pylint)
>> SKIP: test bugzilla entry format: No bug ID found 
>> (test_mbox.TestMbox.test_bugzilla_entry_format)
>> SKIP: test lic files chksum presence: No added recipes, skipping test 
>> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
>> SKIP: test license presence: No added recipes, skipping test 
>> (test_metadata.TestMetadata.test_license_presence)
>> SKIP: test pylint: No python related patches, skipping test 
>> (test_python_pylint.PyLint.test_pylint)
>> SKIP: test series merge on head: Merge test is disabled for now 
>> (test_mbox.TestMbox.test_series_merge_on_head)
>> SKIP: test summary presence: No added recipes, skipping test 
>> (test_metadata.TestMetadata.test_summary_presence)
>> SKIP: test target mailing list: Series merged, no reason to check 
>> other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>>
>> ---
>>
>> Please address the issues identified and
>> submit a new revision of the patch, or alternatively, reply to this
>> email with an explanation of why the patch should be accepted. If you
>> believe these results are due to an error in patchtest, please submit a
>> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
>> under 'Yocto Project Subprojects'). For more information on specific
>> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>> you!
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202527): https://lists.openembedded.org/g/openembedded-core/message/202527
> Mute This Topic: https://lists.openembedded.org/mt/107559599/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

