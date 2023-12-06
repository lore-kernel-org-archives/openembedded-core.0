Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E929C10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:23:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.32503.1701872612823015353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 06:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uS9kgfiU;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a0029289b1bso109669666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 06:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701872611; x=1702477411; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eo7fGmI8wpgCq7YgJLSnk/cCfRhFbyN4N7cl5M+rPvM=;
        b=uS9kgfiUKNz9DR5eRES05Vh6UCDdagN69isrhOkV59NvJFVTyiqa7llY6+pKWNA5gg
         0rjTR+YyemUv8RDtRo9Ppl+2spx8JT5NVeuzs2cAZQAZHOmLeIdxe7t2V2gwj1Vu/H+d
         HNNdIeWBmHqr6K1okY86Y1to3Io8wX6pCuIOTxhcA+py8ZqZBZRW/7T2QFFJ0OsfU0Lc
         6ghhJdo76BzJJrlOLda+MbpTdfL4lfjBTwRUO06IrIEcEOZNIi7HtZC+saTDLJrQ8WYw
         I2NYYECCcfOGWFvh4JZb/BDum77UVoaAcpBea43HuME2hjjK9ZqTE15Axb0kwObvg/rK
         c1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872611; x=1702477411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo7fGmI8wpgCq7YgJLSnk/cCfRhFbyN4N7cl5M+rPvM=;
        b=un0vL73H3RAQknS2HGBgpmOQLFEUme8EPvtFUek0bVgpOj10yq8BelL1afWWoV/cCD
         2m6OY0mBWqvorcnXJqur0Xkq8qclRjnuoK1eNCELZs6N1dokRpsgbuoJhHH8++n7Ts2D
         wEpoNgJU/VVM4F3e2lfVs+ezehjBHg2Ua8Qw6qSLbqCHkt6/FaarvF0lfgy+g4vsu1Bl
         o+TNvIWTQr/Az2u6UEtIbA+Hs16asWZUxtVgbiI/ZzZWs6f/38EYtbZfzHlSzT4ITS6D
         owM7quPq33PMpwp5EnOjWtV7KBBtORzkuCyOH6Wu+EcvDeXnqaB1s7wDmYRr3czMz8j+
         VW3A==
X-Gm-Message-State: AOJu0YxazisyJXeJQhs8yWWCiH/IveBMwk/CtQDUDzAf3rPC6XAE+MST
	ozE41ma6LC56LhjJN8WyqGnM/Od+JxCRPrKxYwfDa3hXK4cpbqseeig=
X-Google-Smtp-Source: AGHT+IH8wyRudcsV39Ms7t7aB71HG4h9uE91VPETMoJOufqqsnhUzXN+APvbEgrPQZpght8NKNTuMmb740RQkno/F1I=
X-Received: by 2002:a17:906:4e44:b0:a1c:795b:405a with SMTP id
 g4-20020a1709064e4400b00a1c795b405amr494004ejw.109.1701872610625; Wed, 06 Dec
 2023 06:23:30 -0800 (PST)
MIME-Version: 1.0
References: <0101018c3f703f00-aae87388-4e7f-4aa2-9ff5-db2b1c3b2ef4-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c3f703f00-aae87388-4e7f-4aa2-9ff5-db2b1c3b2ef4-000000@us-west-2.amazonses.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 6 Dec 2023 04:23:19 -1000
Message-ID: <CAOSpxdaJ9Yt1FaKWc=VgQgQ17Wcts=or9FbK_f=4Eh=QKwCZfQ@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][dunfell 05/11] epiphany: fix CVE-2022-29536
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 14:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191900

On Wed, Dec 6, 2023 at 4:02=E2=80=AFAM <patchtest@automation.yoctoproject.o=
rg> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/dunfell-05-11-epiphany-fix-CVE=
-2022-29536.patch
>
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file. Correct or include the CVE tag in the patch with format: "CVE: CV=
E-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

I've fixed the typo in the version of the patch that will be merged,
so no need to re-submit:

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/d=
unfell-next&id=3D507b9de9df375721cd307163fe06c3ee567385e8

Steve

>
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_=
presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_b=
y_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_s=
tatus_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_messag=
e_presence)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.tes=
t_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test (test_python_=
pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbo=
x.TestMbox.test_series_merge_on_head)
> SKIP: test target mailing list: Series merged, no reason to check other m=
ailing lists (test_mbox.TestMbox.test_target_mailing_list)
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

