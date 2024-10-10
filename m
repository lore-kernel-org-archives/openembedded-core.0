Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85524CFC5FE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:23:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.52916.1728588231704555286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=Y716Kh56;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.41, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53992157528so1505496e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728588230; x=1729193030; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXBd8tL8HE514u1iwLs3EJJKVshOtTS++jzO7xqwask=;
        b=Y716Kh56twUDsPA1CjbNQenZP1jUlB11DbULxYNFZjp07/aTGLv+rJVFyqkvfRh8cb
         kZV7avxtVI+QnKgHAa/5rCflGiMzxJwTx1h1J7wfOQARnChVzOCoonFJkKEPv2IXu+8j
         RZ88DfmjYEQQukCOj2vbV15dAI6IHTzNVXV4BnEriYsFkMbzjjEECJjzrfNiGOfq5zcN
         xaO2JtfN81meByiIWhS2XfalTu0zC3Jrnk2J3za9lr/cbYgpQJg1E484YeGDbQ1KEpCE
         1GB7VudwkIydeUyp//OLuWU3mRgmenkhZzW4o1nPfStJ0NmReJLu5TCzzgS4Iz7Ax20V
         U0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588230; x=1729193030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXBd8tL8HE514u1iwLs3EJJKVshOtTS++jzO7xqwask=;
        b=juWS12dIrCcaoI4siJGw1TYQo+Jhrzue3xkAOQRnuzriJHwnOwJ85q7vfyoILPD7i9
         g5na9AiEWCEFTlVVrPwTrsDtB/hzRfBQ290E5RbSej2hZ6YByklTVcnzznN5U4Ox4RvD
         22VvUVW89CIH6anMbCs5i2dOnj9YTJNo61Bn0nU2vEeT4HDI6aB3BWz0KW3WGCQoLNhy
         SIY1aHs61RZcOUwfNjnha4MBG99nQ7osaOUPHhGswUtbdl5tqG4mKDhHh/icTj6zroHn
         6t4YIpzSQj8eMbHwKZ+HLBOhhQRJBuREa0ch2+BqvR56EdvfI8A4TfGGG3U2Ng1bn0PP
         RVnQ==
X-Gm-Message-State: AOJu0Yyj9LvXwtpm2UANru6k1Fvw51MYsOhX0V25I4zqUffwk8ZuZdIb
	8mq23NR/Jw7/ISbuviUR7K5IgPBK20TxJbU8Ly/vk4mOYZf/IAItiBxkSbebPkoWIFlAycTE1Uc
	UT+hlteNQez/F5t9HHjcGBkLvVwZkmuoLqMixgw==
X-Google-Smtp-Source: AGHT+IGsm5dGWkA0p/fyEeJ6wX09bLBDdUdUv6e04jT2yM0Y80AwebLSBvUctms6wNho6ixz4wfwrgybF9SMbknmak0=
X-Received: by 2002:a05:6512:ea5:b0:539:979e:8952 with SMTP id
 2adb3069b0e04-539d4cf04abmr369960e87.59.1728588229081; Thu, 10 Oct 2024
 12:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241010190956.34063-1-brgl@bgdev.pl> <0101019277deb976-71ad1e10-9956-45b4-bc14-7263acb28d8f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019277deb976-71ad1e10-9956-45b4-bc14-7263acb28d8f-000000@us-west-2.amazonses.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Oct 2024 21:23:37 +0200
Message-ID: <CAMRc=Mf=j1Lw9_JmhM5p3vBajiji7cX5pmupquXvTrhy2XUr0A@mail.gmail.com>
Subject: Re: Patchtest results for [meta-oe][PATCH] python3-pip: add missing RDEPENDS
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205429

On Thu, Oct 10, 2024 at 9:18=E2=80=AFPM <patchtest@automation.yoctoproject.=
org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/meta-oe-python3-pip-add-missin=
g-RDEPENDS.patch
>
> FAIL: test target mailing list: Series sent to the wrong mailing list or =
some patches from the series correspond to different mailing lists (test_mb=
ox.TestMbox.test_target_mailing_list)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_=
uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ig=
nore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_=
presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_messag=
e_presence)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMet=
adata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_leng=
th)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_le=
ft_files)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_pyth=
on_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.Test=
Patch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_=
patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.tes=
t_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (te=
st_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metada=
ta.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_=
pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbo=
x.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metada=
ta.TestMetadata.test_summary_presence)
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

Ah, the tag should have been [OE-core] instead.

I'll resend it tomorrow unless someone can pick it up into
openembedded-core after all.

Bart

