Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C082CCFA16
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 12:17:44 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.67664.1727439456052971329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 05:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0Y95Ccfy;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4583083d019so12214181cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727439455; x=1728044255; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4TauwSMDNqyj8phLlo1yEMKQoZLfWw2q2UC5sL/s/Y=;
        b=0Y95CcfyDLEiWgRuKtBENQdPL40CydlEajo5LipmxbWXSKmzGDorPepBew8GmBMOQq
         h7ZJaIVK9FeTpEympYn6qmu7bEOCG/xLkaNrXHeDBXs7hb6C9re6f9KynPj8vYMA/Yxf
         6sVaQSqCKUCUpzWGku0yLJEWVU7AsANw8BNX28QnrHIQX5GucMM4tQp44sevpVor45Tn
         5xq0JAwED/9vbrdZcgE9nWaJbTAYAKtxs6yctbAowplHtloOMygx+vNUu62dWRoyim9Y
         fPD4japuDd8KODKGhum1MpNmZlX68pxNJ73/G557jmht8Gs3/2RWfC5tXNFtxTbbC1P3
         KZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727439455; x=1728044255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4TauwSMDNqyj8phLlo1yEMKQoZLfWw2q2UC5sL/s/Y=;
        b=WTgkQ+Qe952z2XrNp2pU2VlFShpx8qFIEJFLKeCWSDAUUlYmEJeqMPB1MM9KqcazzY
         C1u8YEu+P/Ohbp0kQVfXD1s4CygB4O2D6kJVE0bfh3wOFVg3hp6kGuxHBdHXRSG25bza
         7YzobGFSsq6Z9mts8aZM197jZ+CNN9tpI2fLAKtJg2zDDN2aTE2gwIKWKfn+h1Yr+I0T
         3Z06qM2Ikk8/5xvzdhpQxgJ8Em99bSeiyEx54Bp68vz/gqqi5NM7swN2ka5s1MZPh7GS
         GjxMJLD9Xkxy+LYP17oxdIpZzsukGa5QTmMdYT247FxltFa4R81I1GAkqJY3LdxbuN0H
         Os2Q==
X-Gm-Message-State: AOJu0YzJC8elZKisFENILlYv0r3CpzqetcZ4Gc1dYHUYo8+d17y9zxIv
	BoW7D82Qddeqe8FFRfp3crNN+bF+0ZR0sQHrHLIbg3coUXIt5SdOo/gm3PRET1I=
X-Google-Smtp-Source: AGHT+IE1xuhi/0KuLsw4NNfLMGNMk4hs3Ai3lCZ/Rm9h0AF+XBmbna2jB6On9n7/ivmSvdvcX5Inyg==
X-Received: by 2002:ac8:7dc1:0:b0:458:4465:d6b4 with SMTP id d75a77b69052e-45c9f1e1b48mr40178051cf.13.1727439454999;
        Fri, 27 Sep 2024 05:17:34 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f33949dsm7292271cf.59.2024.09.27.05.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 05:17:34 -0700 (PDT)
Message-ID: <150d9aab-e3c4-4d54-98c3-2cadad694ac5@baylibre.com>
Date: Fri, 27 Sep 2024 08:17:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for scarthgap: kernel build failure
To: preid@electromag.com.au, patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <918f936e-68b2-449d-9521-3507c25f0a8b@electromag.com.au>
 <01010192310e86e5-dead12fa-f954-445e-b2b1-dadf7efdb3b4-000000@us-west-2.amazonses.com>
 <e21b0aa4-d7dc-467e-950c-95297cb7ffe6@electromag.com.au>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <e21b0aa4-d7dc-467e-950c-95297cb7ffe6@electromag.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 12:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205017


On 2024-09-26 21:47, Phil Reid via lists.openembedded.org wrote:
> patchtest has inadvertently detected the email question as a patch.
> Email did contain a diff, but it was part of the query into the 
> problem being encountered.

Seems like maybe I should tweak it so it also check for a [PATCH] tag in 
the subject line.

Thanks!

>
>
> On 27/09/2024 09:18, patchtest@automation.yoctoproject.org wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch 
>> /home/patchtest/share/mboxes/scarthgap-kernel-build-failure.patch
>>
>> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add 
>> it manually or with "git commit --amend -s" 
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>>
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test commit message presence 
>> (test_mbox.TestMbox.test_commit_message_presence)
>> PASS: test max line length 
>> (test_metadata.TestMetadata.test_max_line_length)
>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>> PASS: test target mailing list 
>> (test_mbox.TestMbox.test_target_mailing_list)
>>
>> SKIP: pretest pylint: No python related patches, skipping test 
>> (test_python_pylint.PyLint.pretest_pylint)
>> SKIP: pretest src uri left files: Patch cannot be merged 
>> (test_metadata.TestMetadata.pretest_src_uri_left_files)
>> SKIP: test CVE check ignore: No modified recipes or older target 
>> branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
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
>> SKIP: test pylint: No python related patches, skipping test 
>> (test_python_pylint.PyLint.test_pylint)
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
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205003): https://lists.openembedded.org/g/openembedded-core/message/205003
> Mute This Topic: https://lists.openembedded.org/mt/108679490/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

