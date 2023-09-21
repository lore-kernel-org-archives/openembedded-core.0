Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C22E71085
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:52:53 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.19911.1695307964121467572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T77CY+d8;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57124ee486dso570793eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695307963; x=1695912763; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqtGV5nDOQ+X3tl4/uoWZJP69Na8cKw4kII6TPMEchY=;
        b=T77CY+d8hnNtmzIKN6zNXrnzOrGL48rEIhcvXGRDwetLb4dyxgxBIz/WE7nifMGrOS
         5Yw3RUvKAkp3JxmTCwnjazVMDyz9vGU2MNw4dyhCvWD3B/5TIxGo1G9SuH43Bx2n7TQf
         cAHIKbAJmJdwVdIDHjfA+DFQDMs4DAnpUvKCkuyQUjV8Y7goyacpXrcYKwXTHrT9cITX
         aayWduWD8KndWfhL5h/JOJvVXW1bsbYh5nHqV32P5IduU6S6W+Z2Mz8PiD1IZnhNHfig
         31W9LkhNs1UEwnPNhQI0zhg4xaXiFe0wakbi/wSIArHKsiVOTAqBJtOTfLI2cN7CXpHY
         MG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307963; x=1695912763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqtGV5nDOQ+X3tl4/uoWZJP69Na8cKw4kII6TPMEchY=;
        b=KxNwmBgkYhWMx2X7tEBq1gnPkveyOgdkklLHrdLtAwYJLv6Ej/QjzKoouF5gaELk7b
         g3HwhLA4Ig0pTDTD0zeohpchwsqwQLyJagWzeQ/4z79is9+mIeH/y/BqgWo9Tn2jx6NR
         H2LMOMddmZlaX3BUMrGLbBGwbhRpjMJb9VyCU5PCeNDtuJ49OVo4mZMzxBLymqWQgHfn
         Thr1yCTSC+S1PayJM/Fs4FSACGx/H/hqNN843LZ2hGFkv9vnEYY4eSkrXyl3fo8oRx9B
         c7BEKL6vKyw+kG9kwnwzpinGwsOAzZC2vaNYN/pgJ6qhZ3Z8bhVt+A42Qq66dRSCOc9F
         iJ3A==
X-Gm-Message-State: AOJu0YwpzfLwCLSh5HDRoMrkXPlzjgfoqUodPOM7aELh9jC8olO7/HOz
	sUTyxtKvrcJG/Na/q6dVo/+zSRS8nGLeXjzZ35uRAhbLmsM=
X-Google-Smtp-Source: AGHT+IEaH9M1UVoxyfZB3wyz10I5h8MAV+Ya1CU2do0qeXyPMPekLqvUYdKU6ozKUqaZ6LUFGNNxydcxT/A0/Shza9w=
X-Received: by 2002:a05:6870:b28f:b0:1d1:40a6:e83d with SMTP id
 c15-20020a056870b28f00b001d140a6e83dmr6299540oao.50.1695307963339; Thu, 21
 Sep 2023 07:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230920220935.970957-1-raj.khem@gmail.com> <20230920220935.970957-3-raj.khem@gmail.com>
 <da3ee4d7f5897ac07bf73206178438ea0a3da916.camel@linuxfoundation.org>
In-Reply-To: <da3ee4d7f5897ac07bf73206178438ea0a3da916.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Sep 2023 07:52:17 -0700
Message-ID: <CAMKF1spR9nG6bv8hO48ThHVsmvkoW-Kt01aH9aU7Fz=Wi13dYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] common-musl: Disable error_at_line
 detection for musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188011

On Thu, Sep 21, 2023 at 7:20=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-09-20 at 15:09 -0700, Khem Raj wrote:
> > bsd-headers provide error.h file and static functions to implement erro=
r
> > API and related functions, which confuses gnulib provided functions. So
> > lets prefer gnulib provided functions if they are used by a package
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/site/common-musl | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/site/common-musl b/meta/site/common-musl
> > index 0fd0413819e..003e46b51dc 100644
> > --- a/meta/site/common-musl
> > +++ b/meta/site/common-musl
> > @@ -54,3 +54,6 @@ ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getp=
wnam_r=3Dyes}
> >
> >  # Xorg
> >  xorg_cv_malloc0_returns_null=3D${xorg_cv_malloc0_returns_null=3Dyes}
> > +
> > +# gnulib error
> > +ac_cv_lib_error_at_line=3D${ac_cv_lib_error_at_line=3Dno}
>
> This is better but our on target cpio build test is failing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7826/st=
eps/13/logs/stdio
>
> probably as it doesn't see the site cache entry on target.

Right. We need to fix the testcase to pass it via configure or env.
Let me take a look

>
> Cheers,
>
> Richard

