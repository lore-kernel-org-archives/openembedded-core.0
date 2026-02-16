Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B27E8382B
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 19:48:34 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2475.1771271307431805488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 11:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AirAhms4;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40ea36b56b7so2657757fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 11:48:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771271306; cv=none;
        d=google.com; s=arc-20240605;
        b=SVMB8TwN2WYKQ0iZq2RILpR5OShLRrwdRliGW/8D8joKq/8gKKNTVXVjC4KhXly4kB
         xxqYMKgz1TXX+tUcuEqqfxWeRA6pIiPAmAIs5JUDndNRNUGLcWqlx9kMBieMtweMSlht
         dpGWw7wK18i0YCbRJkg5ZCLdeWXwBWk7nFkmy48YuIPxshqRLPISIfA8+kLeJQDrsv3d
         yNeXwJDi5PyW4bhkfMe6sy/xnZY/gOoJM91K9PUNwNERVczLzjMUpDYq5PSYVpxd1Y15
         Eqam8AWpTD/kwz58d1sG5Kx6TR9j7p3QGzOINVm7G3m2ioLA25mXOgmbQAoAnh1mpzzF
         1A1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jXSRwJHXtkOVaaL+NZisZWGool+EXQSPkCd8KFlsXg=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=J9dNeZBy8nixFWfhjsrNfjGgfqwpV6Rw0m2ctNYsvqai4RztTgxDBpctTTFtPOrCOR
         lHqrvk/qhIbHlEAYxqhxjI6k8RNuAQr+wvMQTcc5pdNvVydEV7ld2YGr2CU7ZDKC/2wf
         roy7869vFBRG+kZY++N3O56/LxoPJsAxVJn6hLcvKogsJdsw1cg6RdmLM7JDVZOWY1xR
         gc7FRowuSsBBUNB7+KN0nTS498YX97emJlpOjYZiwkEccbhsGSaKqRvxuIM0ZHKqZyim
         Rxngjko/Fb5gLFLFfKqd2T7dzM5PEGqAIzZAKXoHyV2NXztJxOToGp2MA9PgSNATsA1G
         Getg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771271306; x=1771876106; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jXSRwJHXtkOVaaL+NZisZWGool+EXQSPkCd8KFlsXg=;
        b=AirAhms4vjtgpSCO5sNupzAbBcSmWRoIzUKJkBvfEjEX8+rxIjvzkQ/RYZEIkDy9Xy
         JdEUIRTIgvE3/x2E5JmoNMdfSSr+gdyNuiX4TfF8HF7fdSGcgXkO58s/0P88DK8KlXoc
         49FOFLmhtFM55dy4ID7s2N0PGLRvdlBVbNlpQSe1dX/dS7J2WqzAkas7ldghOwhcoXuo
         8XDCBt/Kykv3blbbG6LJGsS6Tc5Yqn4Q25AgOyI+e88FC4NPob3r+tuyR93jinrz2Cyu
         L6pE4kjV7NMSGVTu4Rso7nYbZFqgYOhDNkx+WkCyybqdLC7eSSnFFDWtfgvgvafDU6Dn
         Qfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771271306; x=1771876106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jXSRwJHXtkOVaaL+NZisZWGool+EXQSPkCd8KFlsXg=;
        b=NNb1hFGYQPSU2gsdlyZ2dkfNMSOLF79PYVMLgkANKoe7cI3IgwDo1QSkPwxzpXeIy2
         LUfpX6dv6C00m8rwHv65ZMPaVHi7gX7rmqLx6gINtrXHeMCvJtEstddVWTsfaOS5VGdN
         BXiLsDp+ZaDlcnOIfnPCFF7VDgPSmte2H0XXHyYYMVhpH/huyJIwTphzFhlPjzBXE9SB
         5i861Qo8rUP+YGz5AG64fbT5v/O1XI321/Gmfl//SONLVazDhNQVURIZ+C7FuD2Ncph7
         v43gVJCJnXT4vj28mFjiV1+/FfNzCUSg8J7zEzezthqO417mmtOMSIcXO+7Vn0S0ohGU
         6FyQ==
X-Gm-Message-State: AOJu0Yw/R3xEKgheDzFwpiUdnIgNO+M2SlwQ+7k8KplzFdx+LcwY9iIY
	O3dPjhFPlt0BRDB7zn9g/VtB7bz9MvJP2txb04lbaQG8b9/isswxWNqiArDQO/PVvagZsnpdpPs
	8fcDTj2Nx4h0G/Ev4pi3jxB+AYs722s2a7w==
X-Gm-Gg: AZuq6aJ/bYI6I6CcDXZCQP8lV1t1DwbnOswkzpVjkgj4f29WAI3APSY8K60XokkI7Yx
	9gG55sc3IIr1C6u7Rkzat5bR0nM8bl0jpJesaYrlzIfX5c6aWrcSJ5kDbmQAupY8/BsJO1/yevF
	rZ2rLDYnBjTeR5Bd53P5axfEZuulsXiKjfFbOiezcV1JZeW06hZUe4mrg6ws1VBQ1WVIA3l2h52
	fK1ke2BeKCVQ2G+R5BNMArsEhkRe0Z8xYxFPO35KAA/C2BSj01YjMdN5YcBL9WzPXUZl06BQxjv
	kk5+eO4r
X-Received: by 2002:a4a:ec49:0:b0:673:fc01:a1d1 with SMTP id
 006d021491bc7-67766ad58bcmr5686724eaf.16.1771271306249; Mon, 16 Feb 2026
 11:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
 <20260213014119.3451355-2-ankur.tyagi85@gmail.com> <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
 <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com> <DGESYN3NJURK.3GU7PIXW085UT@bootlin.com>
 <CADySD0GSVCUQi+2J0nAJiwMCGjMmFMQXb5F3NdNzmcsxGkF9dQ@mail.gmail.com> <DGGAE8BP2YIH.1IIWA09KDYRV2@bootlin.com>
In-Reply-To: <DGGAE8BP2YIH.1IIWA09KDYRV2@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 17 Feb 2026 08:48:15 +1300
X-Gm-Features: AaiRm50kmYnAXC9MUgFj_U8gEDzrQgTF2NmUZFuYoeqf5TSfIHdJhxXX6IAMOMw
Message-ID: <CADySD0GGZ4azL47+L9OcK9N1DeVLpiDVVg9QN5HK6BV-LiXiqQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure during install
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 19:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231221

On Mon, Feb 16, 2026 at 10:42=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sun Feb 15, 2026 at 10:53 PM CET, Ankur Tyagi wrote:
> > On Sun, Feb 15, 2026 at 4:50=E2=80=AFAM Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com> wrote:
> >>
> >> On Sat Feb 14, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
> >> > On Fri Feb 13, 2026 at 2:44 AM CET, Ankur Tyagi via lists.openembedd=
ed.org wrote:
> >> >> Hello,
> >> >>
> >> >> Since I am unable to reproduce this error locally, I have sent this
> >> >> series only to be tested on AB to investigate further.
> >> >>
> >> >> cheers
> >> >> Ankur
> >> >>
> >> >
> >> > Hi Ankur,
> >> >
> >> > We had a failure with your patch applied:
> >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3=
353
> >> >
> >> > Do you need me to extract more details?
> >> >
> >> > Thanks,
> >> > Mathieu
> >>
> >> Sorry, wrong link. It should be:
> >>
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/335=
2
> >>
> >
> > Hi Mathieu,
> >
> > Trying to understand how come do_install() succeeded but
> > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260214-8ytqa=
yuf/packages/diff-html/
> > show sed substitution failure.
> > Can you please help point me towards the mdadm recipe logs?
> >
> > cheers
> > Ankur
> >
>
> The problem is I probably won't have the log that you are really
> interested in: left side (A) is built using sstate-cache, only the right
> side (B) is built locally.
>
> So we do not have the log of the build where the sed failed, as it comes
> from the cache. We only have the log for the build where it succeed. I'm
> still joining do_install logs to the mail.
>
> What I can do is run a few other builds, hopping that at some point the
> sed error will happen during B build.
>

Hi Mathieu,

I have made some improvements in the Makefile install rule and will
soon send v2 for the test.

cheers
Ankur

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

