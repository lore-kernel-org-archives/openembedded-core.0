Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF72FC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 12:45:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.16652.1706186748080003450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 04:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ThAYG2jQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ed3101ce3so3382655e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 04:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706186746; x=1706791546; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLRmhud+Ttx41OItfD/3369mTwEkWN1fbmDZfwDEpQk=;
        b=ThAYG2jQRRb4qYYF68x3nldGZugS+PlgC8qkvP1U2UT9X6BHuzcyrUOXTf7CgkC+9S
         I87+YepKgpzHf1e3+oY5YpfzfLK2kuYUdwW1zmXWjOS8Oh4Hh2UY2L6cCWA0Nl+De/hl
         VKB74lEW4sT3R1W7C36mc6MLHTqxUaRATNNDvbMOUQD6RPp00syKMQrLhTRyYHMnKYkj
         tYeoKQ6Kj/BvtSPG9tJ2nocdNaIBWCyuJc2sspGeGBYiSEwQC4W30z5+6/3I/NNCvOp9
         3ztkSLMtFxClmdkoeQMTjwyXnHiF/Rwh/ppSswGyuB8xmNszx3IKCUIy79gyd77M2ITd
         XYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706186746; x=1706791546;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLRmhud+Ttx41OItfD/3369mTwEkWN1fbmDZfwDEpQk=;
        b=JDb4WsRkb7Cbb7mxgPAEGwM/G/pu5UdMsv1yAAisNLS0hiQvgg1HKQ3T9Wqq4EECTH
         O5uEcmPdgcutJvCI7PwEz9ckeu1hXL1K4YowSUO4ZzUNEIs5RTlLqW+rWW2foRLa3Wvk
         6Gt2oufQBQMxSgWg/tTSi9SSkTIIaFIs1eawtVGSmJZ+B2SAhKVI7T52vSYg0yCMOADi
         Mzz43jD6PzFnseLRW9V/LKnUz3eNfFZ9TaxHLw1dY/9BvUCiKjfkViMCZ5KmhWh1oUQV
         QHc8fkDP9WhmUoam4MfNIFFKMoiOUa8lkCuGlbq0QaKoX/BJL2LYEytohYm9LfXwOJY5
         YeYA==
X-Gm-Message-State: AOJu0Yyi9CJbM/5Gtp2iquNs/7GygDxOxpck77TvbWO+//VI4IlCyX6d
	BZ62kN/8CzoRg6Byph+hGK+YO66mfX8hj4z2QA4gzr0AiNudCIMM
X-Google-Smtp-Source: AGHT+IGiMyElXg8yGgsS24e6ArP7sT0CSc2L4/sVK38uWYVBGD21PwlS6GKEiSvLSXc8j5q3mydTVA==
X-Received: by 2002:a05:600c:580c:b0:40e:4381:ee16 with SMTP id jz12-20020a05600c580c00b0040e4381ee16mr280120wmb.262.1706186746067;
        Thu, 25 Jan 2024 04:45:46 -0800 (PST)
Received: from [10.139.6.240] ([154.47.27.147])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c1c9900b0040e50d82af5sm2554768wms.32.2024.01.25.04.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 04:45:45 -0800 (PST)
Message-ID: <91e3b7c1-1b49-4d38-b9b5-8836cf1480ed@gmail.com>
Date: Thu, 25 Jan 2024 13:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2 8/9]
 oeqa/selftest/recipetool: Move helper function to the class scope
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
References: <0101018d1172da83-7ed14884-b91a-4462-8e69-6e533e212272-000000@us-west-2.amazonses.com>
 <c6e358ca-a40f-48cc-8a1a-73a73c68ee00@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <c6e358ca-a40f-48cc-8a1a-73a73c68ee00@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 12:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194317

I don't think so.

git pw series list --submitter "Vyacheslav Yurkov"

Shows the latest series 21353 from me.

Regards,
Slava

On 22.01.2024 16:35, Lukas Funke wrote:
> Is this the reason why I cannot find the series on patchwork? This 
> makes it kinda tricky to review/test IMHO.
>
> Please provide a commit message, so patchtest is happy.
>
> On 16.01.2024 09:45, Patchtest via lists.openembedded.org wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch 
>> /home/patchtest/share/mboxes/v2-8-9-oeqa-selftest-recipetool-Move-helper-function-to-the-class-scope.patch
>>
>> FAIL: test commit message presence: Please include a commit message 
>> on your patch explaining the change 
>> (test_mbox.TestMbox.test_commit_message_presence)
>>
>> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
>> PASS: test Signed-off-by presence 
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test max line length 
>> (test_metadata.TestMetadata.test_max_line_length)
>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
>> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>> PASS: test target mailing list 
>> (test_mbox.TestMbox.test_target_mailing_list)
>>
>> SKIP: pretest src uri left files: Patch cannot be merged 
>> (test_metadata.TestMetadata.pretest_src_uri_left_files)
>> SKIP: test CVE check ignore: No modified recipes, skipping test 
>> (test_metadata.TestMetadata.test_cve_check_ignore)
>> SKIP: test CVE tag format: No new CVE patches introduced 
>> (test_patch.TestPatch.test_cve_tag_format)
>> SKIP: test Signed-off-by presence: No new CVE patches introduced 
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> SKIP: test Upstream-Status presence: No new CVE patches introduced 
>> (test_patch.TestPatch.test_upstream_status_presence_format)
>> SKIP: test bugzilla entry format: No bug ID found 
>> (test_mbox.TestMbox.test_bugzilla_entry_format)
>> SKIP: test lic files chksum modified not mentioned: No modified 
>> recipes, skipping test 
>> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
>> SKIP: test lic files chksum presence: No added recipes, skipping test 
>> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
>> SKIP: test license presence: No added recipes, skipping test 
>> (test_metadata.TestMetadata.test_license_presence)
>> SKIP: test series merge on head: Merge test is disabled for now 
>> (test_mbox.TestMbox.test_series_merge_on_head)
>> SKIP: test src uri left files: Patch cannot be merged 
>> (test_metadata.TestMetadata.test_src_uri_left_files)
>> SKIP: test summary presence: No added recipes, skipping test 
>> (test_metadata.TestMetadata.test_summary_presence)
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
>>

