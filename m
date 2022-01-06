Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57694C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 18:22:45 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.12679.1641493364589221832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 10:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q2OSNmVP;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id v4so3186708qtk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 10:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+PPkRlvIGZKazLkCetTDkEtU8/i8d4lS+vx9twpDs+Y=;
        b=q2OSNmVPIV1t9UrbaV61F0ozefhxrrHVqIIsBNHk63x4FwzhZ2jr3teGzqZqqKd1jD
         hJFJ4Wnhrt8xL46agICrn3W2QE+62NtfJTi3wwKZyfNkHnvZP919/14NAYqr2qYA8ty7
         rRhBJaO5H0OCLvok4w3UeyHhwXNYtPyuQIfo3tmfkc9O3G/M3n6xUYaO95cc5S4GwXKr
         y9rXID+AXli8VcaoWX24yqRjV2lwVW4rBVWpyO+Ge47wVtuy7b3CXHkZXZI+iMyj5d0X
         nBm/0sEXO/3kzRWl5BUnoYaXH4iHAD4T1YofaEyc1bWbFTqudMH6oYfY/97x7vcJ5UHi
         BoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PPkRlvIGZKazLkCetTDkEtU8/i8d4lS+vx9twpDs+Y=;
        b=GRgV7iTQd2CmJSR3j/t/0p6rzPVHUCVGXc0hECoh9UoPmDNG25zKFacdxIkhsBqJAj
         bMhyJNon8CYwEo3jUbR2OGT+BVRjXI5F1W/uzPAYBXkga9JM/6zbFYLBnHwNB9VaqMXK
         saZVWLwOciNCZEuEUsYP/tXDiNFnNtk8zRaKTwmotOL5oKhS9YvR2TAhmW/wnZjuOSHB
         dL51/Vj4Osp+S5Vg58YFBJdDOOpz/rPgzrQC6u/OWtF3mFSuzA0XV9Hoy4dAEYmH3n1C
         XlcAA23KH3MvFkipvzguUJtmxVcVVSKM34TV3n0gwGY1iB2bL9HvR6QEARR0DFtPZyzu
         kipA==
X-Gm-Message-State: AOAM5306YPQKxGN2GGpz8COt2IQcuJPavjAdZIuGvW0Y9gv9HDqaXBKV
	Eo+C7DBRzHhBTOemcpxg7C7EY/1cY8fuvIEyio0=
X-Google-Smtp-Source: 
 ABdhPJwMvho92XzgOA37d0Z2VAhdLFkkMDP0GcQWowAx2JdDmKjZMGrr5hrf5PASfxNYh1FuKYrWz+iJ/UFOYPm71pQ=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr53882248qtf.660.1641493363501;
 Thu, 06 Jan 2022 10:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20211230212344.94913-1-saul.wold@windriver.com>
In-Reply-To: <20211230212344.94913-1-saul.wold@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jan 2022 10:22:17 -0800
Message-ID: 
 <CAMKF1sqd-WXRegKoTF8yBSGup4Gi9r-mau-BYU47W5OfCDs2Bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: Enable threading
To: Saul Wold <Saul.Wold@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 18:22:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160238

On Thu, Dec 30, 2021 at 1:24 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> When the tranisiton to perl-cross occured, the threading define
> seems to have been missed.  The perl tests for threading where
> simply skipped, so there was no direct failures.  This was verified
> by running perl ptest before and after the change to see PASS vs SKIP
> results of threaded related tests.
>

Do we need this for perl-native too ? I am seeing failures like below

https://errors.yoctoproject.org/Errors/Details/621556/
https://errors.yoctoproject.org/Errors/Details/621555/

can you take a look ?

> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index a6ae80f07e1..3306a093692 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -53,6 +53,7 @@ do_configure:class-target() {
>      ./configure --prefix=${prefix} --libdir=${libdir} \
>      --target=${TARGET_SYS} \
>      -Duseshrplib \
> +    -Dusethreads \
>      -Dsoname=libperl.so.5 \
>      -Dvendorprefix=${prefix} \
>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160066): https://lists.openembedded.org/g/openembedded-core/message/160066
> Mute This Topic: https://lists.openembedded.org/mt/88042607/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

