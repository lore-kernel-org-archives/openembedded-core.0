Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D92C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 09:33:13 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.9479.1705397586311322431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJKao9Mh;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50edf4f478eso7619586e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 01:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705397584; x=1706002384; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LyiG8m8uJKJt+jA2D+2LnQK0fX3ZiiVxRGlpP+4acQI=;
        b=FJKao9MhbXuNiHl/rXE8XorN9Vc7hH+CsQX9PG4BDdlCByAXeLINEKBlTQSLtQaUck
         FcZS9uNDAyy96EHqQanfmChiKRlbNqPHJnNWKMLrYsh+5IkUsAB/R4EB8/scsVBhiUD9
         3/xhPEu3sSIKbUz4SKuwcFeLY4tTO1xpROh8kDs1iTHGB4aWk2jEdMlkMtD1F29PdP2r
         qXuBlKUVzHEKdBumUseRr7gMCxMvlZ5I6FYuWQ0jWpJNCjS/WPJjTtUs/xglNmn669/x
         LVDO0hdkxXJ6bzKoUS59iRPDJfSoHynjwg7Uw9rpa4/gQcIKGztLwjG1nP39Uv1Qs2qU
         bprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705397584; x=1706002384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyiG8m8uJKJt+jA2D+2LnQK0fX3ZiiVxRGlpP+4acQI=;
        b=b9u/0SM1T8VfEZ2V+/sB0m2dfkjFDDhcaH1OZgrBojU/XJleu8I69uxfri9W4JX/4l
         NfrFvoGmbzIR7T/idbCiXU9kMM3C+WZIhLoEU44MLShbtBb8JUFhpdYz9rYqz88FSmPu
         MVwwLwl3DZPvIjnAfP11eMZN5PM4HyFykjKm1yYEB4M0NfnT1hWMrad0RQ5QfkCMWCAE
         jc/CJP19vGNyueHKKBU5jeYGmt6oa28pjG5oAg7kXkYPOB3bKFDyx02fI57lKwdvmvZZ
         /sQPmIqPgK0Pt8OWl/frAdcPorqVN+9LFxDY5LAAMWgAWHrw+SjEDYkvPmEK4o6xl7J6
         XaLw==
X-Gm-Message-State: AOJu0Ywkct+cux1HBGaG4hDmD5BkJwoL0RHooLw8Ke+W7j7VBQMDjTgm
	Vecv6wvxwEqxX5632/FyPfIcTjtElZIwcSS0uVMyeTme
X-Google-Smtp-Source: AGHT+IE6mrF8lRHKF/ysFWNHnFKhOPpUBwujm7xwJSxvp1vGDpAk+nwktOmRWt2MbYw65uIVKbhjwPYL3eVnlLuZKjw=
X-Received: by 2002:a05:6512:3b92:b0:50e:5448:3316 with SMTP id
 g18-20020a0565123b9200b0050e54483316mr3613480lfv.137.1705397584217; Tue, 16
 Jan 2024 01:33:04 -0800 (PST)
MIME-Version: 1.0
References: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
 <553ec677-73d2-4595-a113-304f269918a5@gmail.com> <CANNYZj_T7xfJy51UaB9UVaB_S-ZM=UHNy-7Aqu2akAyd+P4syw@mail.gmail.com>
 <20240116092834f19a1e78@mail.local>
In-Reply-To: <20240116092834f19a1e78@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 10:32:52 +0100
Message-ID: <CANNYZj90_-6AssGQLxc7tAqT24KDBMB5NPNpsD3g-XLOXc1sGg@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH v2 7/9]
 oeqa/selftest/recipetool: Move create_go test to a proper class
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193847

Because making it strict would only result in useless noise in the
commit logs. It's entirely valid to have changes that can fully be
described with a commit header. I see it as a notice to consider if
the commit message should be added, at the discretion of both
submitter and committer.

Alex

On Tue, 16 Jan 2024 at 10:28, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 16/01/2024 10:08:50+0100, Alexander Kanavin wrote:
> > No.
>
> Why not?
>
> >
> > Alex
> >
> > On Tue, 16 Jan 2024 at 09:53, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> > >
> > > Is that a strict requirement now even for trivial patches?
> > >
> > > Slava
> > >
> > > On 16.01.2024 09:45, patchtest@automation.yoctoproject.org wrote:
> > > > Thank you for your submission. Patchtest identified one
> > > > or more issues with the patch. Please see the log below for
> > > > more information:
> > > >
> > > > ---
> > > > Testing patch /home/patchtest/share/mboxes/v2-7-9-oeqa-selftest-recipetool-Move-create_go-test-to-a-proper-class.patch
> > > >
> > > > FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
> > > >
> > > > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > > > PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> > > > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > > > PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> > > > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > > > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > > > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > > > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > > > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > > >
> > > > SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > > > SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> > > > SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> > > > SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> > > > SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> > > > SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> > > > SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> > > > SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > > > SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> > > > SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> > > > SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> > > > SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> > > > SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> > > >
> > > > ---
> > > >
> > > > Please address the issues identified and
> > > > submit a new revision of the patch, or alternatively, reply to this
> > > > email with an explanation of why the patch should be accepted. If you
> > > > believe these results are due to an error in patchtest, please submit a
> > > > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> > > > under 'Yocto Project Subprojects'). For more information on specific
> > > > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > > > you!
> > >
> > >
> > >
> > >
> > >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193845): https://lists.openembedded.org/g/openembedded-core/message/193845
> > Mute This Topic: https://lists.openembedded.org/mt/103758512/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

