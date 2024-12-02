Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2779E69E82
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 18:12:10 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.180975.1733163129554436209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 10:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zZil7SR2;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso3687982276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733163129; x=1733767929; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WadenMv3wJpDeXsO1T5hwlIxQGsBtrrOvl68xGsgAjU=;
        b=zZil7SR2e8RhmdzUjPHxyZKoKZGVcbuYDotRHVCXm03TSUYSsC1F6lhDZ+VV81DeRb
         uhnZfYoCR945OHhEOSU2r97sJ7IU7H0ulRYV09u3sVoYW6i7BXcFfmDBJuRAP+q9vKqu
         IpLtrk78c8KRiz3vyw04MM+1xuhCelCxke7Rh9Bgruz5+WwVtU2/cfLOdFv7XaZKWGpr
         29cnmGcsThYGAQ++xPLbeQY6D/EpEQEp3HYqMgh4grW6P4fPgtN2MArMqPA34Vmd+pdp
         Kfr1xXouvE+vGNTJ3c00ZDTWsC45tZ3MeonDzM9FofZWZE57F6GKwgu1fy7Q5Qhj4qYM
         7KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733163129; x=1733767929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WadenMv3wJpDeXsO1T5hwlIxQGsBtrrOvl68xGsgAjU=;
        b=Ovyhh34I069eR5rHAQn/5m+ua9U8sMG0U8t7T04vEf3/OjA9x4wwPgq/AwFPP4KvS/
         KdIs5R5pr2pQPJx2fBBjVBNK7W/xlaYOqkRx34rH5LhEt7Bj/uMKOyhzW1FXqtVX9wQY
         cls96WtacBTXYLAYfzkC9jASDP71Yt69q1/n7JS1EGfUQ1ivhLKUWW7eQZJvrv5BUwf7
         lwV3wWeGrcLz1VeNLNfbW1ylgiPFK/fb5HOnJfyqg9+ObgFz1rbbZH3KcPGnzSlQOcI5
         CHzLZhFNkX34KNvT4TxKIXe6yuny1JbH17bte7+iLZeHIAXCDmM02ykm83LD/8a6Q95W
         X9xQ==
X-Gm-Message-State: AOJu0YysruhcdAwt+cgmTlffr3z9CrCRciDwrAhLZq3gYO8f7TR1qQ1Z
	RFchcJ5ftChuwQfZhmoK49DvY1lYDuX7gpQFBrerCga43QTXQ77gWkHR60iMvNjloIxNuyRRFnB
	2QBP3krxtrfQXSwAEg38ialyVGHH/UTIcxP2sKVVZPhIQp+rT
X-Gm-Gg: ASbGncupl9ET5xrytHqqTCXut2ekCVDjlZ24JWZjwvwulANZBiYlg6hs101RRLzy0yq
	EIutSdSH/mArEGkK4p6IUExh4ztyPoIg=
X-Google-Smtp-Source: AGHT+IEmkYDZzVbj+504mbKT6tuN0DMEaPpUHNXdb14XmtRzRuSCI6qd2+htJ3kQqlLWCehg45CKPcZP7TwUPTmkQYQ=
X-Received: by 2002:a05:6902:cc6:b0:e39:82b5:21da with SMTP id
 3f1490d57ef6-e3982b529afmr14282931276.38.1733163128526; Mon, 02 Dec 2024
 10:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20241128064920.139214-1-hongxu.jia@windriver.com> <01010193719307ee-69bcdc26-337f-49a8-a70c-c4dc22095749-000000@us-west-2.amazonses.com>
In-Reply-To: <01010193719307ee-69bcdc26-337f-49a8-a70c-c4dc22095749-000000@us-west-2.amazonses.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 2 Dec 2024 10:11:57 -0800
Message-ID: <CAOSpxdYeXEUUZ1Ofge2_gdyJ17BxupCK=RN2A0RNiscmjonQkA@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [scarthgap][PATCH] python3-zipp:
 fix CVE-2024-5569
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 18:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208153

On Wed, Nov 27, 2024 at 11:01=E2=80=AFPM Patchtest via lists.openembedded.o=
rg
<patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/scarthgap-python3-zipp-fix-CVE=
-2024-5569.patch
>
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file. Correct or include the CVE tag in the patch with format: "CVE: CV=
E-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

Also the patch filenames should refer to the CVE, i.e.
CVE-2024-5569-1.patch, CVE2024-5569-2.patch, ...

Thanks,

Steve

>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_=
uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ig=
nore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_=
presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_b=
y_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_s=
tatus_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_messag=
e_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_messa=
ge_user_tags)
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
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_pyth=
on_pylint.PyLint.pretest_pylint)
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207977): https://lists.openembedded.org/g/openembedde=
d-core/message/207977
> Mute This Topic: https://lists.openembedded.org/mt/109819082/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

