Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0875BE7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 10:57:36 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.14552.1736765848130527724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 02:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEDgNRLv;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd049b5428so33385836d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 02:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736765847; x=1737370647; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ElhAEsxmwcd0bRYe1QrIbELFLkcRTgaVEAk4ZZU0D4=;
        b=CEDgNRLv5kbriOgcl/Bt5xApTw9Rc2FyNdm3JhldnspWt7llgxnxQaSjJaoFfeTOVS
         HbUuksyrtDuqEHjx5u5f5m4i6ouxlt00swx7MgfLu4xTrIDvBQV8HZixlJi2DkULndux
         LQbNGdDxJtGqNukScIPvzbbOkvhbR+ABBgjInwnxosQP23ygLlPRdBZ4RfGWOpWDV+hG
         0BMIt022eLPHB3tN2c9P0VqwNG4XzygA+CQiJgtzkPY1bqt+HT+yqk7YD+y+YDcCXSfQ
         XUeOs9XCBVtTw+LHCPNtuVmGGR8CpfFlJ+5GMdoyUCgnbsps0xAV45ioU5C93/+tUY4O
         Feag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736765847; x=1737370647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ElhAEsxmwcd0bRYe1QrIbELFLkcRTgaVEAk4ZZU0D4=;
        b=Qh7URONmJjZa6zKGJR9euSiOppwkwysUKjnG/AmFzyBZMUKG8n7X1yxY6PXAChLrVG
         SwgSReiYpjeVYBxy7IaenNuUkG89E8bN89WnOIIS+xiESxVQT2zcqWcmQWa2xOegbyN+
         L5JuuM8/H874TFDY9KfE6Fc/BILNnabQlPSU9QH+eoYici+ZcGSS0of6mRNAlaXweiK9
         FVdId+ArabIXV4QtJFXrfDYNyKhPr8wWh4PzJ4BRF1u8SWimwASleAIdqBY8zLPngQf2
         YnbDMlDKM4I5AuKSknpESVbiippQZzx2VRGz9vyvpuRG911ZEeqbYk2jgaFnGUuVklBY
         8akA==
X-Gm-Message-State: AOJu0Yz21yx9XEC0vqCeRuyuci3ioKo2ZZ1q1wQp0+nEhPRnan7NUC/6
	HS79IxyXx8PNOfXRyDT/Wn6S9Rnqv7BQjYVi4lxsG/xFCPTOyEL9sycb7BDoXpqyteVwfHVmQvi
	EzY6vR0D5/fBLy2Gx/grDayJILGQ=
X-Gm-Gg: ASbGncsJI2RPWn6gs5TZQHF4oIx/H+tp89/zJJFgWkUpu+vhTKlp3YZh9ObGtXTAgqW
	YsjEgxDAMY/MciJ6txh3aBtJe6BdOX6Z8PJ7yT2Nr55lQ9m/DCRF9nD9xqpodbMKuc7EkiV6z
X-Google-Smtp-Source: AGHT+IGPOEMTMAAhiXnO4TTZMMEjyqqoDwAb58+uJkV7u2fNW2meQaqVlQxJWW5I/MNSKxNOoGCQ7f+HMn7+8gNyV+8=
X-Received: by 2002:a05:6214:d0b:b0:6d9:353b:a8e9 with SMTP id
 6a1803df08f44-6df9b1e3e8amr304438696d6.15.1736765847091; Mon, 13 Jan 2025
 02:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20250113091553.81130-1-akash.hadke27@gmail.com> <010101945f02b369-75f08582-ee64-44ca-a515-aceec56fc964-000000@us-west-2.amazonses.com>
In-Reply-To: <010101945f02b369-75f08582-ee64-44ca-a515-aceec56fc964-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 11:57:16 +0100
X-Gm-Features: AbW1kvbF9GixpgIMm_W9twpiFP-khCK5AeDXePHOBSEuU7UKgoUg6QwiGdrgNHo
Message-ID: <CANNYZj8vUjSRwYMvRDMqWvUBKK1d9BoC5w6iuqvAGnb7tWsVZQ@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [poky][scarthgap][PATCH]
 poky-sanity.bbclass: Remove True option to getVar calls
To: Akash Hadke <akash.hadke27@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 10:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209707

What this means is that changes to meta-poky/ should be sent to poky@
mailing list, changes to meta/ should be sent to openembedded-core@

Alex

On Mon, 13 Jan 2025 at 10:33, Patchtest via lists.openembedded.org
<patchtest=automation.yoctoproject.org@lists.openembedded.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/poky-scarthgap-poky-sanity.bbclass-Remove-True-option-to-getVar-calls.patch
>
> FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209705): https://lists.openembedded.org/g/openembedded-core/message/209705
> Mute This Topic: https://lists.openembedded.org/mt/110584237/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

