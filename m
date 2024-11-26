Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B858D6552D
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:51:34 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.49913.1732637892963305402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XRp37e2Q;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-84386a6669bso49983239f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732637892; x=1733242692; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Iy/yLv8vGGykGuU3IRPZGRJJupZ96QEsl6aX89I6Nw=;
        b=XRp37e2QxdXYiF4pHk2ak1GZW74Jk3Oiv3E74rPhNaH1pFmrU7ODt+soKd1wuKQi/l
         c+wW826BJPGwxImAVVwGs+MFz9IC8xR8wIrLXuIgaOlB+1P3t9cdu812QyXsAGFGlOYe
         mjub3SccrWjsMXFxBs+83OevuinAiAbV1kltbcRGmqPhgsLJeRXFDcIgQic94zqD/MlE
         K/DZH8JdEV3isEigaL8zC8J42MxqQJ8DrtylV1Q6eu5bE24IsTVuUdlpHX4YemMIFUME
         507lxaVpZxjDkhy1utFeiN3oGodLjB8O86eEkMVBHHodRafyRcUACsWkwdsYZdvgmQiJ
         t03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732637892; x=1733242692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iy/yLv8vGGykGuU3IRPZGRJJupZ96QEsl6aX89I6Nw=;
        b=l3qwMPuRiCZ8eK47BsJiqrrHzEq67F88lEkmeoKd34vX2gjor4h5BCyXD2/P7sP28x
         hkffvw14Ce/U1QumzItruZOyHZSYkaAdorZntJZRRoeWnv6wukuxhB/U9q4qyaSzZV0W
         6Z0rqdcmAThWVU4sHcnJsRIUrscz3M5/qaPX7w0LhYdr4NNi+oCKage3rLEeIP8zk04P
         z+cHPzTUlzVCaQNqg68toBB4j9czGzoQ4LdXt2ZJ4l96DkPg/fiiPJQzMByWPUQyrJOM
         kbbz2itHeSRWYV0fGVy74U9qfmPfzPWXDdVp6IxiZfC2m9EjC7YLSRoFADi/W/XE0gyK
         op+g==
X-Gm-Message-State: AOJu0Yy2m7XSEmJDzuS1HUy8oYQX8Mkf7tx6v2REzrUNd2/oMDg4Dn39
	wbDv4tmED1xMABMjt/b37fk+BD4A4p0w2ng+PQWaEkIns9oZ/vbG
X-Gm-Gg: ASbGncv4zhyhw8nqMBro3GFPDm0Xwsj4dLgCQ1rxEiKuTBD/iqWYpVBTEY1q0XCJ4bS
	/HkLuIcCZrWZRaDZDVB+BOjsImfdmqqx6r/j5sQ8o+KylpCkHU1je6zV0GecPUq5QBnmag3xs7w
	vRyKCwFb4yJDmTnucoP7mHZU7bWKVKPbRllSRPfMv67DoMT6JeOtiBm5r1gmfUMjEolbNOX1k+A
	gYuYXdTS2P/sFVGYdNUW3HeFlv/fmQZwHhKc8u8OL4x5e5SQNFENRZHkfpFlNN3j/HJrdsmvY2N
	I6v1J7j0yd/BzpCK4EcnoMvtF3c=
X-Google-Smtp-Source: AGHT+IE5XHLMDDJScBG5pXzXIHdfm7Emx7oX5Pi7xFy62it9KOohv7n1qce6HyKJw4E8N7qP9ME6hg==
X-Received: by 2002:a05:6602:1345:b0:83a:db84:41a8 with SMTP id ca18e2360f4ac-83ecdcf3ca6mr1894290739f.10.1732637892103;
        Tue, 26 Nov 2024 08:18:12 -0800 (PST)
Received: from [172.26.252.3] (174-29-210-206.hlrn.qwest.net. [174.29.210.206])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e212c0d60fsm540136173.121.2024.11.26.08.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 08:18:11 -0800 (PST)
Message-ID: <34a3c570-9d33-494e-b8f5-06528e661a11@gmail.com>
Date: Tue, 26 Nov 2024 09:18:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [BACKPORT] uboot-sign: fix U-Boot binary with public key
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <6c59a659-d47e-48d5-81af-a729b8533f62@gmail.com>
 <010101936934b0a7-fcee1467-b83a-4a9e-8242-f84291673193-000000@us-west-2.amazonses.com>
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <010101936934b0a7-fcee1467-b83a-4a9e-8242-f84291673193-000000@us-west-2.amazonses.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207870

> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/BACKPORT-uboot-sign-fix-U-Boot-binary-with-public-key.patch
> 
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)

This is a backport request and references a commit in master (which has the appropriate signoffs).

I am happy to change my backport request formatting as needed to avoid this false positive.

> 
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
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


