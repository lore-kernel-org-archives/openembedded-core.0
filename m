Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F832C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 11:18:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.8737.1741346292522598129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 03:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=R6fM5rHG;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a39e659cso9746255e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741346291; x=1741951091; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wk2w33NEIsiHUGVDemjiiMC0koTYwUUdYYuHOaYxHKQ=;
        b=R6fM5rHGiNuPYsJw+lrSBwwEvDjhN69MSiu1SJmbnPzQUKXzR0fxOkS8o0X2vfEjvZ
         90gQTLnGlSWcB7zB/8WZZPV42SxQOFg/MsL2Qg+vq+HjTq+13zWxSLv5/g+r6IOpQEdi
         td2nU99iuLhL+X9YwEyuV8+GQjH5x+GCICuUJ/8OhK9CqffecX4gaSByx8azJAsn5Gqm
         hIJm/BDKzcEdT0n4JgOeswS6RYiMiWj2Q/Qx1ygk3uF3EAR9UFMkTNfHxkORjKFAp8px
         1I7SYFQD3ZKkGAjrVxUPB9qKyq7jE8DMy6ddukuwW4Un4owd/iexXzNqEeNRNfHrFWFf
         ItmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741346291; x=1741951091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk2w33NEIsiHUGVDemjiiMC0koTYwUUdYYuHOaYxHKQ=;
        b=RFXArRTvCXRLA0Fnc7Vx7v0nlU64vQZSRYnvpQ40N6jppzaBxgEk9Bc8bLMe6z5CMU
         zbNNVBphtDexoByjAgH5BC7/9p3ZLSF51pJdvdtidJO+0778xxOPHPlI6PVQ+dZL5929
         GnHQ1XSbRe4fp7AvRD+7YM6eU9mnxJFbsw801xLGiQrrMmZr75F3OwL7KjbHwrc0kcIW
         PkR0LxxDzKeMvBvTpw/t34oTV/73YPSVe7d9z9JTip8fe6eVL08flLy3WjCxjzmBXXbN
         +2daBSJcf4e86IArcu/etCskG+BUmt3dYfBINHmO6n/90P905L5CFEq/V+3Gdr/WYSx9
         r0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXFqBtCTJUCW+c/kc2L0cwWm2BGgzIOfEMc+878osuyn2xIcll2o9m9COxDXRgeqdZ2lV8xC3FD4Vu9YfnCN3h6hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvQpJLJJq4I/S8iOH43Ckrrwc4mmv5aB472Od0KevnfLVBDNUo
	58Ol4idtm/0CviypLWheYO5pCP/a1pj/yKXCezj3e9g9L8v0MwmPXr46W9cWz6Y=
X-Gm-Gg: ASbGncsKKFSBuYJ7NNO5COHur5a0I+hfSyi9TJPMj7u6nZ7hybIIvS5/68QNv9qoL6m
	e8dwSvGtQ9YH3wuuDPsKd232gkvYB5FlLZqXzJ4x68BGbUat27SB274sdoD+1EBnbnhR7Sx/oIR
	gsLvqPUJ5P+i914pjKB2MEmjtSLzZIz95MSX9UY0WU7A4OwJ30Fp+GTulokOFJQ6h1y+QB1EmRt
	Ws4tNgwNq1tyRYqNv8UU99obpJKE+KYdldQFuiXO6PFnS0WsjfC4+VMqgtLi79A+fh0ZhyEi0/v
	lavVoaOw7IXXcD+SxgZCXxrDBYEUHMJn7VRJWFY0aCONBIjmHfZbcIq07p6ApdR2WKZQv/5hXaK
	h82RjFdtqAKsW+3R33CmoUJ8HobhZww==
X-Google-Smtp-Source: AGHT+IFCW9MGVYnrEkDkNgTh1OcL733cgbY0E1n161wWowUAI0dn3kZDTtMIsmE6er2oH8+sz3WUEg==
X-Received: by 2002:a05:6000:1a87:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-39132dc56aamr1768178f8f.44.1741346290611;
        Fri, 07 Mar 2025 03:18:10 -0800 (PST)
Received: from [10.2.5.163] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c101febsm4930914f8f.81.2025.03.07.03.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 03:18:10 -0800 (PST)
Message-ID: <83a17890-2f1a-41c4-ad7a-2e2c1982b2e9@baylibre.com>
Date: Fri, 7 Mar 2025 12:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][kirkstone][PATCH ] libtasn1: fix
 CVE-2024-12133
To: Yoann Congal <yoann.congal@smile.fr>
Cc: peng.zhang1.cn@windriver.com, openembedded-core@lists.openembedded.org
References: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com>
 <01010195703695d2-6cc4c6a0-e191-4a53-8b5b-25f5fa27ae37-000000@us-west-2.amazonses.com>
 <CAMSfU+5R0byppVUTfquE2Lor+DZRLxz0OQ_GFr9s2SFPVVDYgQ@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMSfU+5R0byppVUTfquE2Lor+DZRLxz0OQ_GFr9s2SFPVVDYgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 11:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212432


On 2025-03-07 11:56, Yoann Congal wrote:
> Hi,
>
> Le ven. 7 mars 2025 à 11:46, Patchtest via lists.openembedded.org
> <patchtest=automation.yoctoproject.org@lists.openembedded.org> a écrit
> :
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch /home/patchtest/share/mboxes/kirkstone-libtasn1-fix-CVE-2024-12133.patch
>>
>> FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
>> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 101 characters) (test_mbox.TestMbox.test_shortlog_length)
> That look like a false positive from patchtest. Maybe caused by the
> space in the "[PATCH ]" tag?
> CC'ing Trevor.

No, the regex should be OK with that. I think it's a problem with the 
encoding in Patchwork itself.

Patchtest uses git-pw to pull down series to test, and when I try to do 
the same, I see this in the file's headers:

From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: 
=?utf-8?q?=5BOE-core=5D=5Bkirkstone=5D=5BPATCH=C2=A0=5D_libtasn1=3A?=
     =?utf-8?q?_fix_CVE-2024-12133?=

Same thing shows up if you manually download and view the mbox from 
Patchwork.

It is a false positive, though. I'll file a bug...

>> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
>> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
>> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
>> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
>> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
>> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
>> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
>> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
>> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
>> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>>
>> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
>> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
>> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
>> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
>> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
>> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
>> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
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
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#212429): https://lists.openembedded.org/g/openembedded-core/message/212429
>> Mute This Topic: https://lists.openembedded.org/mt/111565411/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

