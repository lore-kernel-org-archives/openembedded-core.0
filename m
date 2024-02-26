Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8477DC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 21:16:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.5434.1708982178002242528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 13:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=P+ZmPB7J;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-787bc70dfc7so196695585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 13:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708982177; x=1709586977; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYZLBcpnDzOKCfqnPupfd7maX+5+cwLP0VwuV0C1iXI=;
        b=P+ZmPB7JckSDC0rV00t3lm63Nv461zS8L7oClNZsY0+Xkndaw6W+B+Akllp3IkbD/+
         uFSoG0ovBau4I0XfveY3bq9wP8ETU+bZiI9/DdzJY5LqrGffSNoQmVRYYw4hCdt1HMPj
         KMsuv+YQDNO4GGhjroNQG/pb2n4pKyzB2oawJcnedY6KDM76ej5B4c2w4tSaDVKJBUOI
         OS25UdkVoiJfefFXvpK16dvhv+fm/8dIZygCBjKAFYU2c9zTOEY8rW0/pr2ko3qbrQt7
         tmoz7po8ppQkWYsln7vcKWv4DGj+jEnUhiCjBsfSCB2IzXP3DPfaSgjwJmrmg97r7j/E
         ZELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708982177; x=1709586977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYZLBcpnDzOKCfqnPupfd7maX+5+cwLP0VwuV0C1iXI=;
        b=uKGl6/JGmIxkOtsb6/QDxXtAbmtY1ZlCM2yd3OKqkw779WF6llxxqLyVYiyYLoXid/
         +uPJXxQng6QSuBpOGRkxX+bJkTqC9FXcEBDFqYSiFYor94CkBjJ2Apmh5ji37FD43ovy
         i+vGSUB9LL+RQM6HVK90+7pQfIGXD9Uqg4O3A4K6EK6D/QwNs2P/V2oZmpIot4R0QV5e
         +JL8WS5NdWqjDsdASHGwJadvIAVe4woF3Xzi3U9aSn8CqggtmwfqPvGRpqyOACwf4INT
         RKWeaLYgOOmEVcgmgYBSA4P2GzTwutOcCPdcLHLTrrXvdan6zTRjWgN9j/2cRsx9oesk
         htSg==
X-Gm-Message-State: AOJu0Yz5DsQETVSSeNOWfdnPiZ+il8M2+YeYrXF9luBUJ+EYW/aMuvPz
	Yq/YVCalqj9UdcdFy3zejYPDHqoQ53E9T9Ze3RwIcFFcWgd27F/eyaVEOByLBrGS/DMSdwpjQyy
	x
X-Google-Smtp-Source: AGHT+IGoKDERlDzVl1uexc+XdfT4V1rcFJY3OKfkB+NQW+rhcbG5piMKz2gV/LN6UlLWKF+W0rfIbA==
X-Received: by 2002:a05:620a:cd6:b0:787:cb9e:58d1 with SMTP id b22-20020a05620a0cd600b00787cb9e58d1mr259956qkj.65.1708982177028;
        Mon, 26 Feb 2024 13:16:17 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id bp32-20020a05620a45a000b0078565ed2bc6sm2866910qkb.124.2024.02.26.13.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 13:16:16 -0800 (PST)
Message-ID: <a0e77471-43f0-47db-ac3d-b613d4749a33@baylibre.com>
Date: Mon, 26 Feb 2024 16:16:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH] rpm: upgrade 4.19.1 ->
 4.19.1.1
Content-Language: en-US
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20240226204801.2519944-1-tgamblin@baylibre.com>
 <0101018de73cbef9-6f2e8f6f-c514-452b-b6d0-a1ca270d2f44-000000@us-west-2.amazonses.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018de73cbef9-6f2e8f6f-c514-452b-b6d0-a1ca270d2f44-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 21:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196223


On 2024-02-26 16:05, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/rpm-upgrade-4.19.1---4.19.1.1.patch
>
> FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)
This is correct, but it looks like (in some cases) Patchtest emails 
still aren't threading after all...
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
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

