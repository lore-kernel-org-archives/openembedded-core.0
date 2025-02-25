Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974FAC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 19:34:39 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.18103.1740512077038454535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 11:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SFKkGta5;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0b0ca6742so638733285a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 11:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740512076; x=1741116876; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7rkzch+AXi43vq0d/HVwar6F1BYeyrWuobZGYosa+k=;
        b=SFKkGta59TpVX06R6n6ZxNiEa+PqmEwf+mYwKFR62fmu9r94OURXB2mDPu1c2/Tatj
         TGVlO+XS+fx++eBQ+XYpWDYMu2xAUwRnxVl6jwGr0xC5mURkisYvWGTH/n8pZ9OIB2/w
         GAWGww0vIue+Hj9TpZEwF8DqZmURB07mfxOsMBqgmGQW4pfhYoXJSuQxEsM656bL7xsZ
         ouCZy85eiimjohN5kHSlNvWCwlGqgjK4/r19SJQclVdI0a6RtKG7L6rqNuNOyVHssd/X
         +8Y5km0wcTAzgHJtWoRyI69G8NJWB1C67yy6y9TGLmVLtb3BjRIFvL+jOi2VUhUXkN1K
         O8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512076; x=1741116876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7rkzch+AXi43vq0d/HVwar6F1BYeyrWuobZGYosa+k=;
        b=T8GH+ZJtrF0tnGqNth27suvv0cReT01kvOrS5hxH1iwmdsB4tlMRH8CfQcfia03zhi
         iPMRK/Enlbhd9lHFsZM+sb+m5rBf6g5D1XlK3vGB7VAZQd9S+4sIa3OfAk+XWfW/AD68
         BaX2/myU03auHY5KxWCHF/ctywEKuTfN9YEgTIQYiek/dFJOPFmKkMYOz4kT+U8EVeNR
         1meJrrbdx/HM83jvNbBX9wFcv37BzyqrwN54ugCQDsD/tD9sFCJuPy6FogyBtbYwz8Cq
         1vMYCfpeN6QmwluDTtZ0Xg+2pefxFwhelmfebvR3v0H5KLjsB8XkYMCAA7zkXz51MoiZ
         vCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZCDgFEZFclSqOFonmYpEsS039y1QWi2ZThu1VE/gYxKDeLGszIof+N7z8oW96bEjPIte5GAuwYaWBfC/O8po4yA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmxMzdWN91+adHaXOpc7fFVfB0ZmZ8ETd0E0F5UciM1EwZ0cMW
	RMjsVy8UD6ZIK1Ipiiob6eyoh0bnOIhRcn3dQH7u0BaYJFQ3lRXenG8HwpnyPW8=
X-Gm-Gg: ASbGncszjrS6zxyJPAdZlcXfDL3R/zyrTHfQ2N9JXSPv+Mortn1UaYpWPsvsuTno7r9
	KZ6GSTlQJsnODSDHR01fy+EyCgbVC3P6i4Yk3Eu2JUMcCZMKp7LEvMPoUldMiNy1j9kIIhDfUPU
	WJCYYCLEcuWv8v02R0ulms0wIdvSLXBazb94+VCqOtvNfWG2gLm9+VNRatxZhjIRLqtESPYh79v
	LhJUi1fYRpP0XoXEc3eC/MdIJI+970VhvW9YdK/KAKZq3SYjlgTxLCWrlkUN19xKcsNJbpiMwD1
	pEb8NC6H0WSSsEO7DtQFY4HCTnPlkG2+NEWItKXXiTpn9riHCO7GPkN2SnSPqbY2TER9RQ==
X-Google-Smtp-Source: AGHT+IG2FUQI1nwzeZrbeVtC6eLvZ21FOPSlxdBJSwLt38svaDDQNOB9pNaWGECLM2DO4yQdAotVwg==
X-Received: by 2002:a05:620a:424e:b0:7c0:9f12:2b97 with SMTP id af79cd13be357-7c247efcb17mr97517585a.9.1740512075777;
        Tue, 25 Feb 2025 11:34:35 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c29a8e1sm145172085a.13.2025.02.25.11.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 11:34:35 -0800 (PST)
Message-ID: <e0801d84-4595-402e-a859-9fd9b76b3da3@baylibre.com>
Date: Tue, 25 Feb 2025 14:34:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v2][OE-core][kirkstone] systemd:
 upgrade 250.5 -> 250.14
To: narpat.falna@gmail.com, patchtest@automation.yoctoproject.org,
 openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tvgamblin@gmail.com>, Steve Sakoman <steve@sakoman.com>,
 Randy MacLeod <randy.macleod@windriver.com>
References: <20250225151443.1549639-1-narpat.falna@gmail.com>
 <010101953dbbe921-8c3da1cd-cc93-4c23-8afd-b494a9e95ef1-000000@us-west-2.amazonses.com>
 <63d70b8c-c0d4-40a3-b21b-b8f26bd6afb7@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <63d70b8c-c0d4-40a3-b21b-b8f26bd6afb7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211921


On 2025-02-25 12:53, Narpat Mali via lists.openembedded.org wrote:
> On 2/25/25 21:01, patchtest@automation.yoctoproject.org wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch 
>> /home/patchtest/share/mboxes/v2-kirkstone-systemd-upgrade-250.5---250.14.patch
>>
>> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag 
>> in patch file. Correct or include the CVE tag in the patch with 
>> format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)
>>
>> PASS: pretest src uri left files 
>> (test_metadata.TestMetadata.pretest_src_uri_left_files)
>> PASS: test CVE check ignore 
>> (test_metadata.TestMetadata.test_cve_check_ignore)
>> PASS: test Signed-off-by presence 
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>> PASS: test Signed-off-by presence 
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> PASS: test Upstream-Status presence 
>> (test_patch.TestPatch.test_upstream_status_presence_format)
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test commit message presence 
>> (test_mbox.TestMbox.test_commit_message_presence)
>> PASS: test commit message user tags 
>> (test_mbox.TestMbox.test_commit_message_user_tags)
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
>> PASS: test target mailing list 
>> (test_mbox.TestMbox.test_target_mailing_list)
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
> This looks like a false positive for a CVE tag due to the new patch.
>
> Can anyone please have a look into it?
Yes, this looks like a false positive. Should be OK to merge if there 
are no other issues.
>
> ../Narpat
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211918): https://lists.openembedded.org/g/openembedded-core/message/211918
> Mute This Topic: https://lists.openembedded.org/mt/111378770/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

