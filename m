Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA1C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:47:24 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.21282.1717696037565544147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=E2dFlMrH;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4402e119571so9416301cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717696036; x=1718300836; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+IXjcsrTuW3yY2tjFEUSzbnXKXd+6rArvr59T5xqiE=;
        b=E2dFlMrH5AJn+pW638skmTo92Ie88HSu2I5o+NAEK2DrYzZ0EaAKizOGQfX5uF1liG
         i1D5ZAaEnmeMQAysaTSlBvItg//BCLrf92q+/rN6l8qo7kdo8SXra3Qzg7HbEjwWCd0a
         pEq+xJTfC4f2ZKHvesI2aUDM6bS+4kArdAAGK+RCYH3JincsFtoxPJr3qJQAtKtwfgMC
         5oXCzSXK8AnkpttjSuoDgElRyP+76gaPfCtwzaAIGoRLR2+UWZAN7ngn0EKRcrQaaLMR
         i6/3z13aYHArymkXzt8D5n7BQuHtAPFt8TOLEPrBeLQGk85RATiay4JuBy1ccEgukySF
         aiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717696036; x=1718300836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+IXjcsrTuW3yY2tjFEUSzbnXKXd+6rArvr59T5xqiE=;
        b=ju0jT+VOKSJUAcktF0p72lz+GZp2kqFQfK8fjP9rRYfrXqqd7nWIQC/GSAgwFoNH8k
         f9xnwsCzaZIRGq9T/r/4S9jnFrWx8iWqE2xspBIoExWUJF01twZkyZqUYRW7sbgyKAPy
         oiuvOsdaAfTiEleMky+O5AGzzpgazV/xBv2kgnYcQw9jRJ32z0yKT0sZz8054Iab4R9B
         Cx6dnWdXkX8p6BPvkVo+YeiO/vP9eQrz5LV140KFu1tn4Z18TbMDXjtbfzCN96D3TmvC
         eDS5Pvi+S/pFr7iEhKJzIgPBTugU/jk6I5/xM/RzmJepqZbfWtNK8GoVOH31uBSOZmwn
         zZsQ==
X-Gm-Message-State: AOJu0YzXV9/8qqiczZkC0WLk+UnOmqmYVBHh1laVzBi4pkSo9HbEO8Ey
	+YLX+HJpoKt9c/jBFLizMYU+BUi6x0zBvdQ47sqVnvpcJiOhosVB2Q71vDWU+NI6jBKTx+0I/+M
	b
X-Google-Smtp-Source: AGHT+IFVUDThD+632DiQz7SGCq48G2RDWBjNT6Jib7JezABimqdxTS77boR7DI3sBTOuWeeU7JpxYA==
X-Received: by 2002:a05:622a:180e:b0:440:44:63ab with SMTP id d75a77b69052e-440361fbc6dmr65931791cf.2.1717696036154;
        Thu, 06 Jun 2024 10:47:16 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f983f8csm8273186d6.85.2024.06.06.10.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 10:47:15 -0700 (PDT)
Message-ID: <30b95347-4d8c-4383-9d25-28d4fccc4a71@baylibre.com>
Date: Thu, 6 Jun 2024 13:47:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH 2/2] python3-cython:
 remove redundant .inc file
To: patchtest@automation.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240606172015.3118703-2-ross.burton@arm.com>
 <0101018feea1050f-44f53275-02d0-4eb4-85a8-8efe276d3bd1-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018feea1050f-44f53275-02d0-4eb4-85a8-8efe276d3bd1-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 17:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200412


On 2024-06-06 1:38 p.m., Patchtest via lists.openembedded.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/2-2-python3-cython-remove-redundant-.inc-file.patch
>
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
Aha, another false positive edge case... :)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
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
> View/Reply Online (#200410): https://lists.openembedded.org/g/openembedded-core/message/200410
> Mute This Topic: https://lists.openembedded.org/mt/106528242/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

