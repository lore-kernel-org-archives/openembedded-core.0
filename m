Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E22EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:42:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.11076.1689694962763231559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uBAvYHH7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99364ae9596so826774266b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689694961; x=1692286961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlvgHEAPTqiClztOtlb8dCbeZ32N5JpPlblC88Y+zqI=;
        b=uBAvYHH7JpfrIyYSvw0w7eEL+DpGtOFnP57+Ux7yKm3P703jR4vfXk6pstiR8smBN/
         WEMZ29Ltw42jlArJDr59sT2G5pnYKZDT0FJAQ6xkPQ/9Z4I/ZNxehsqmUBEIgmTm3nve
         51XdKPRd47aHdocgHWava5E2u0cS7Rf0E0SJ9e8n76hXeriIJy19hEISaLmF85qKV6bh
         AaiC8GjRO93BTvEq+AcuBdnGp5N4BiZKD9EbWHSVmYQ4DkMbOF1Ibj440j63WZv9axKF
         jybOrDR2OQ7ZfsKZR+PY6reHw29KI4wAerFpzbhc6UJmQoG4BgcnbtVGrC363tq0UymW
         XLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689694961; x=1692286961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlvgHEAPTqiClztOtlb8dCbeZ32N5JpPlblC88Y+zqI=;
        b=C0dzQpve5+smFMV8w2qQH7lDjjQRUG4gXSPOkLnOBoYFU9hDrByfNMXQiXVk/MxGMe
         bMLIltPaCIDvDzVas632CB+9moEaDlUKEtUROwcTI7kGdxHU8HeupaDglqTTs2Tyro0d
         2EGELRn39BwHE0EPc2sk/7Ghqj3FI+mHEmIxHxMfKE0oRuC32RV5DpCSmdIaseWlt0A5
         gUCoeTnz9jddZgnBfj5Vx49O9Aks69NqF7Uyv34yxWZiPFDWKRjL02BuoQadvVyIkiL9
         C66+KDTCe81IuMEEeKVfuJTZV1bmXWTKn8OU/6/I2+KoEqQIwwcYQHXtlhI+Pzyg4U9J
         oukA==
X-Gm-Message-State: ABy/qLZRT1emXAUlln3+WJOt0+XZxIYSJp85rZnDYTNYKUF1IRM421nC
	3JP3rNJupKZfJAcj0Yv9ynqtcXxumBwgT1F274guIQ==
X-Google-Smtp-Source: APBJJlFP6Psqj6prp8GWNrcv6JZxsx0QDbRgVlBVmaLslrEz4uNDn5KR4pfooHm6jebVxpq3LZ3embKYI3U3FBfOMJ8=
X-Received: by 2002:a17:906:40cc:b0:98d:f953:f473 with SMTP id
 a12-20020a17090640cc00b0098df953f473mr113316ejk.50.1689694960839; Tue, 18 Jul
 2023 08:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <b491d83d02d9665a397dafcd6842f1c959fefad0.camel@linuxfoundation.org>
In-Reply-To: <b491d83d02d9665a397dafcd6842f1c959fefad0.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Jul 2023 05:42:29 -1000
Message-ID: <CAOSpxdYkbL3EAcEubEkvK5GDS_44ivTuNVTc1J7mQcNi9fkjsg@mail.gmail.com>
Subject: Re: Toolchain test results
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184535

On Mon, Jul 17, 2023 at 11:14=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> [Anuj/Steve/Ross - questions below!]
>
> I thought I'd share a summary of the recent toolchain test
> changes/work. We can see the "baseline" from the 4.2 test report:
>
> https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-4.2_M3=
/testresults/testresult-report.txt
>
> showing that we run 2.9 million tests (2946881) with 174470 failures.
>
> Once we noticed qemuarm64 toolchain test results were showing ~125,000
> failures and had done since the 3.4 release, Ross was able to find and
> fix it:
>
> https://git.yoctoproject.org/poky/commit/?id=3Db0f1ab9810d87960d2753b0fe7=
8039b874fd15fd
> https://git.yoctoproject.org/poky/commit/?id=3Daf39b83e58ec159a9a13d85067=
c2595535442566
>
> Thanks Ross (even if you did break it too! :)
>
> I've also merged:
>
> https://git.yoctoproject.org/poky/commit/?id=3Dc94fd2737e7e341188c8c41d91=
1f1c60240088a2
>
> which takes care of many of the qemuppc failures.
>
> This brings the report down to:
>
> https://autobuilder.yocto.io/pub/non-release/20230717-18/testresults/test=
result-report.txt
>
> so 3229355 tests and 15496 failures.
>
> qemuarm has ~350 failures
> qemuarm64 has ~350 failures
> qemux86-64 has ~4000 (3900 in glibc)
> qemux86 has ~4000 (3500 in glibc)
> qemuppc has ~600 failures
> qemumips64 has ~5000 failures (all over)
> qemumips has ~1600 failures
>
> We could also do with understanding the qemuarm64 ltp syscall failures.
> The other ltp failures look the same for x86 and arm.
>
> Anuj: Can Intel look into the glibc test failures on x86?
> Steve: Can we backport those patches to kirkstone/mickledore?

Yes, I've got them in my test queue for both kirkstone/mickledore.

Steve

> Ross: Can ARM look into the ltp syscall issue?
>
> Is anyone else interested/able to help in cleaning up these results a
> bit further? Once have a good baseline, it will make it much easier to
> look for and spot regressions.
>
> Cheers,
>
> Richard
>
>
>
>
>
>

