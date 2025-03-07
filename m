Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6382EC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 10:56:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8507.1741344991296144575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 02:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ugjFG1DL;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so14105455e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741344990; x=1741949790; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoZlO5n3J916QDQRnvUrzGB97QBVaXmoRUAjQTpT8ek=;
        b=ugjFG1DLo5L1l9dErj3ZDS69juqYmqMxJYiCPpIA3vOTGl3kbg5FGD4LNxT/ngXTWd
         fXGnVjnzq8jGPXGTS14Rbj6nWYAZ/7mXtbHm393HdwPbl1oGe7DIc4ZNlZNxo/1gJI5H
         clVtKKxqA96nYnb/KlFpuTbOBri7ky/lUb7Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344990; x=1741949790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoZlO5n3J916QDQRnvUrzGB97QBVaXmoRUAjQTpT8ek=;
        b=aeerRFC3nWzP/9ZNxdGINDoSufepZY1aLqWJPFwCYsGGWZ4L3b5uTi9SYMFCFsEZBc
         xldZY6zlOzx36TyrAG6uaEzso/P026ZPsrjHZuejQ1IbumhUCOyFBCp7kndd7RCn6nOb
         ZmDf7mUAiqeQLLX/dLdAE+MdBFvqP3OLmqxQ/YBlou+G2LMXy29uB4Dm3iEXeExAvuhi
         E9CglFLKDe/xtqx5kO/a20IZPniSNLzt2+X5OKGM9TiWhMftDfn8z0TuawKWl9VzvDfY
         mWiFqqnfqQEQoFfUeOYSG0tf+mEdgcMdIWzV0+L70F0zVD94KWV0UNqj0Ba7R8L28HFX
         dERg==
X-Forwarded-Encrypted: i=1; AJvYcCUqkHO9VFQo78TNg2OpoRPoSpJ/THTm0hGS9rXgpO7Dw0FY6E+OnMJffRmkrYemDodIE+46NgfyMBLtVZtM291EiA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBk+3WgXhZ/ffJtKCaYV+FKP5NHoF+sNqKezgRjDuiF99nPQ8a
	3UwCXSObpe4Li1zHtjMRU23V2+Erf8Ukp/4HZr6jVI01aAgodNPMacfD13N218MLLOU7iPBF0Fq
	+AAk+ucCPiXmV3S7ma1UQEr1xO7/2pZCtoNLA0A==
X-Gm-Gg: ASbGncvMCYxyqAXFVTWzrOc8Lg91jSIHLtaLBBqF9hthdfj0FWltBRgXEI/v6HflXy7
	EqWtM9auF4ezkZPgusTFbfQQMbAGeb/hZlH/BeCT2oRxcrlUF0RXEY8E/eeuNRYvGONrUJOaKgI
	hO92UHnY1iDrAa8vYmr0NEOHAVj1cIFc/65dxqtxL2pIZafjj5UnEoNIIk76c=
X-Google-Smtp-Source: AGHT+IHEB6SU+HI75lgEsGhB4DgdB7KeeSkx8yNiw/xn1r35oUpWGqaBOiCtoxiAxb51iCPirECYPBA9vVgLlDahAm0=
X-Received: by 2002:a05:600c:1549:b0:43b:c962:ad1c with SMTP id
 5b1f17b1804b1-43c601cfd02mr20538415e9.15.1741344989678; Fri, 07 Mar 2025
 02:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com> <01010195703695d2-6cc4c6a0-e191-4a53-8b5b-25f5fa27ae37-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195703695d2-6cc4c6a0-e191-4a53-8b5b-25f5fa27ae37-000000@us-west-2.amazonses.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 7 Mar 2025 11:56:03 +0100
X-Gm-Features: AQ5f1JqsXI2XU8AZJSOMg8RShaFa6I0PU1koFihlhuj7v3yiTjJKwh18vphfMN8
Message-ID: <CAMSfU+5R0byppVUTfquE2Lor+DZRLxz0OQ_GFr9s2SFPVVDYgQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Patchtest_results_for_=5BOE=2Dcore=5D=5Bkirkstone=5D=5BPATCH?=
	=?UTF-8?Q?=C2=A0=5D_libtasn1=3A_fix_CVE=2D2024=2D12133?=
To: patchtest@automation.yoctoproject.org
Cc: peng.zhang1.cn@windriver.com, openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 10:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212430

Hi,

Le ven. 7 mars 2025 =C3=A0 11:46, Patchtest via lists.openembedded.org
<patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org> a =C3=A9cr=
it
:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/kirkstone-libtasn1-fix-CVE-202=
4-12133.patch
>
> FAIL: test shortlog format: Commit shortlog (first line of commit message=
) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_s=
hortlog_format)
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or =
less (currently 101 characters) (test_mbox.TestMbox.test_shortlog_length)

That look like a false positive from patchtest. Maybe caused by the
space in the "[PATCH ]" tag?
CC'ing Trevor.

> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_=
uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ig=
nore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
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
> View/Reply Online (#212429): https://lists.openembedded.org/g/openembedde=
d-core/message/212429
> Mute This Topic: https://lists.openembedded.org/mt/111565411/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yo=
ann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS - Tech expert

