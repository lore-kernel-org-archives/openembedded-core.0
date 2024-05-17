Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0455C25B78
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 08:20:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.35102.1715934031434219800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 01:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iOzYLCXk;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e6792ea67fso19675971fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715934029; x=1716538829; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ZRBTWPJ5KLqz2bQhAxJsjfQgYmXq3ZHE8OOyjZH8Q=;
        b=iOzYLCXky6tiH46hDp3rttnG6n0Jq9OcMnALJpkO40oYxzRXXeiMcYac6g7uPmAEz/
         eDHsWQrn0RfVzPEyL94Ue4trW8A39pSvh0wHHvQy+kDDoQPYI11WRomAMQUl7pFl9ntf
         gIrqJq0VRxQsH41IzSXyQoVEXHS/l34I0eAaRsgY+MHY41+90eArSJJZme+X2V9dJRHz
         sC0e35utBvhP7G6jWTpbYXqXZ1tN7WcZq5LG3KJNP8yQ4jNw9yJBJt6Ds5S6jqoD6bDV
         1YKMv5yQoTyTqG2t/aJjEqyxPvbgqOb0g9SNGykOG8JxqobhyOVKC/KFNewAYu/elPzo
         KsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715934029; x=1716538829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3ZRBTWPJ5KLqz2bQhAxJsjfQgYmXq3ZHE8OOyjZH8Q=;
        b=vw55waXSQXDHhgMsXjJGYf6nTd3JemaFRen5GnwbjUak3LuUabRObjnriBuZ9TxXsE
         Z202WYO0j2GYqNhRdoYP0teTzi7jKsNHVvae33eyoc1HgJryE31JZ6+8F3h5NjtYh7qk
         mgGCRkrndIBy4t8+Q/lNqWJUyYQ1DwzkDoUOSJt1ERNwA8M6ZiAsO0/gIQ2sw95kxjRB
         mXefc04EGQcXdhl0S11B0Hp7MJflGhsy5a8QFriNSSuZxY6mP7X7/OXOLPlN5Kw9JUfm
         7RAhUNeKhwnRagF+BB9MMgu3gg67m6tI9iJPrXuQgfuXo0Iax5LuJPzhIEl3xlnFJSgz
         CsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe+OhxeIq0rJztD6lillBDoXB3I0qCeR4ro8HcSBXffxG+4Kr70d4bS88oxhh5XMbBnmVg7lba0mYyiy+l7pLoC24z7cjjwfC9pPifpiIWIL7rm5es9+63
X-Gm-Message-State: AOJu0Yz6foQvbeTKg42u+tHv7lwU++/vBBL6hfdluR3BtphrTxYtKb8D
	02FNBiMZVGIOZy64+HUUe+oX3BAtWCuwTOAZ7QSCufBQEb9Li74bd3egrzm4b8S52OI22dO5t6H
	Zi1+v05xTrt711/V/JQ5ZkfKAf3c=
X-Google-Smtp-Source: AGHT+IHxC1kFhwj0KAtof8i2HNx0JCQo586LR1kvDTaf3FHJnNo4QkMaDuublpAX3+0ZxvRiq4Bojz6Or+X7Y3k5aGw=
X-Received: by 2002:a05:651c:d0:b0:2e1:7acb:6c40 with SMTP id
 38308e7fff4ca-2e5200639c4mr126469391fa.29.1715934029233; Fri, 17 May 2024
 01:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240517011947.3727744-3-yi.zhao@windriver.com> <0101018f84330bcc-b667b793-f895-4d25-a834-1610f02c09b5-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018f84330bcc-b667b793-f895-4d25-a834-1610f02c09b5-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2024 10:20:17 +0200
Message-ID: <CANNYZj-Ha+6WN9fZUyUiacU7n1YKPkyCgNOZ+N8EKr-QwkLHyQ@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH 3/3] gnu-efi: upgrade
 3.0.17 -> 3.0.18
To: patchtest@automation.yoctoproject.org
Cc: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199507

This seems like a false positive, patches were renamed, but patchtest
thinks they were removed. Not easy to detect.

Alex

On Fri, 17 May 2024 at 03:38, Patchtest via lists.openembedded.org
<patchtest=automation.yoctoproject.org@lists.openembedded.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/3-3-gnu-efi-upgrade-3.0.17---3.0.18.patch
>
> FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199503): https://lists.openembedded.org/g/openembedded-core/message/199503
> Mute This Topic: https://lists.openembedded.org/mt/106146796/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

