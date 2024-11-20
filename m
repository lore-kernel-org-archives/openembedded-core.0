Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1516D6E2CA
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:58:46 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.22881.1732129124331828642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zij/6O0O;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b1511697a5so2572885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732129123; x=1732733923; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcG0QNJP9+SFz0SSjx9C02t9jh3hMh6XxceeiCjm1tg=;
        b=zij/6O0OCdeeWcXsPufAM3PbtwncUNuyWfgLkTC6+YtQ1V94HNJKoE76ihvoI8r7NJ
         s/d4/4gabhVhdwkN6Uu4qx/762fbQ20bNGnTvr8X8iS5exw3aqI0y/KzTuYqByW026VS
         DP9D8fWOMjHm61Civ1LdoFMjwcvRhoaxVPzeO4xYOJ3JCSsqCCOC9dhgJDNzPvPjetvg
         abVRJ01wlzaM2/3BoGWUWnqBzfUXux+rpAery3Lra7Q9EErbxQc6c58Pfa9zLWJv0FUI
         N2/grhtoGW+AlBO6NNwZr4OltjVgtQzb16YQrZDiHtb26EkNu/iRkyxaT/TYcx4G4OPP
         ESCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732129123; x=1732733923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcG0QNJP9+SFz0SSjx9C02t9jh3hMh6XxceeiCjm1tg=;
        b=hhPOsugFMAQ+zNk7BYhdQd6n4I0EEk7ZN9QMcdIG66Dd5BlNf07mtfMRgLngtvxsmo
         DvurQg8dizbCN1W5bW7Q8v6lBMuZan694/qDKUkHaP+kv8CLWm4yZ3OBdPIM1wQPdy7n
         Kq/WwwDOKoqy/+Oh4BSU+PXUbUxsY9UOZsgAQwjVOExexbn2aa9VbvGYqCDjGHQYVHoh
         ysTY+A7AV2Qi1uz/qVyJbm7NEOqq5Vix58bx3awAf6j1CasTmtLNzwJK2Uggcb0OT0aM
         Zkm7YlrujP4+LZMo9F1QF4Mc7J/+fU4Ghp8VCnU+KpBM4gC216XZmVWOdkolfFDbiF5F
         mayw==
X-Gm-Message-State: AOJu0YxiVDW/Hlv3ztsEOH+fC2pP9ne36F/h2QZ3Q9GHY1ss0yZXPLH5
	KBBTIyt95prMny4unPbUDkLxdoU6Ym3TgPuMeVGMsn9XXmEdWGm1l5k/cZApJRg=
X-Gm-Gg: ASbGncusrrktDHO4mxKPypCrHGWJ9p3uO9ncbwUtiGHPGDcHcF5Nt6tAW9LnuuAAb/o
	gertZngMreBI9m2b+5o1hq4od8OhbwBf/jw0sr1sIlfCZGljtbXXrtXnnwZnE8KTPGI5X8uZNdo
	kHUtgOScqtfXVVB/shiKSGt0P+I91oSJHW2OyrLomJ7Qcm4pdf5IVcG6XkS2PO/Wey1DfwaI3go
	5nZi6ulU7jNJFx0Skr3cxooARpG0vLddr89hXZVSgueVoywTVu2bwlGWZzwHlI07XiTR02/ZS5M
	OgifQ8q6XzTWHBleGg==
X-Google-Smtp-Source: AGHT+IFJln+ZhMnMsiXAoTrQMdKTMi6Hs92VhG8hOQpX3A7k3F5aXBPdLoIqqTY2uPkfKVsIFiIx6Q==
X-Received: by 2002:a05:620a:4450:b0:7b1:54ad:453f with SMTP id af79cd13be357-7b43befc30fmr530804785a.61.1732129123398;
        Wed, 20 Nov 2024 10:58:43 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b48524f48dsm125051785a.119.2024.11.20.10.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 10:58:42 -0800 (PST)
Message-ID: <98ab2f20-c745-4ca6-8fb3-224cf87060a1@baylibre.com>
Date: Wed, 20 Nov 2024 13:58:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [oe-core][PATCH] libsecret: add pam support
 depending on DISTRO_FEATURES
To: patchtest@automation.yoctoproject.org, Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
References: <20241120183528.2560-1-f_l_k@t-online.de>
 <010101934ae59aa9-dbf9d250-f5fe-468a-9553-807df10c6ecb-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <010101934ae59aa9-dbf9d250-f5fe-468a-9553-807df10c6ecb-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207475


On 2024-11-20 13:46, Patchtest via lists.openembedded.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/libsecret-add-pam-support-depending-on-DISTRO_FEATURES.patch
>
> FAIL: test Upstream-Status presence: Upstream-Status is Inappropriate, but no reason was provided (test_patch.TestPatch.test_upstream_status_presence_format)
Seems like another false positive. Will file a bug.
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
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
> View/Reply Online (#207474): https://lists.openembedded.org/g/openembedded-core/message/207474
> Mute This Topic: https://lists.openembedded.org/mt/109689984/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

