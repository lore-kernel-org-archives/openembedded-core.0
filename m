Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43297CD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 19:58:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.47731.1712001476868197463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 12:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZEezCsU3;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a20a9df742so2793263a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 12:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712001476; x=1712606276; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxSAKuvsj2gKnPvMGIGGHyxPebQZ0gAeC6/t+Q++tW8=;
        b=ZEezCsU3F58Ztc4rrarXPuadUrs9UDp5dJP9/f3Bunz2rJIicMifVo3iNrG6GDD3C2
         WPfvX/+uN6BXkeP/O0F8lt77ZFKzLmo9pFdUzGwyXSIgzm1kvA4ePdv3Fexs3n14pwYe
         n/U2hIF5sKOoa2z+yuqNitILWoNqbWZ086+H22hIMvZPTC6bvmv2KFBPeyLyw3Dhw09k
         h30YJiJT8F6wiWr2NCsR6OFemXVXsMEWivILV/Dkf49JKvgHRk7EeROjwXJu+g49exo8
         y+BOmr+WE9LXqWqr11bENVQpOcDlsGoDIcSNGPeG+I3RExuKaT2q1m3cdNMhSi0gJpZp
         hxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712001476; x=1712606276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxSAKuvsj2gKnPvMGIGGHyxPebQZ0gAeC6/t+Q++tW8=;
        b=EZ3J7HaUcD4iQrc+jjRWkinBVWs7SACCBbSetarVsvuxx/xlRbFAZFpEodaF2E69gf
         3Lrakv1eDxNgvjjLRQtYENUCaoe8XAdBMiAqaGdpSgI+VdvM8uQuiyKQcbvlh1Wp0Jlq
         s99BHc08NqREU6EO6qAbJvHhU1EeGIC9clLjsfF5mXNbtNekhCMntyTn4h4AhJsEw3pU
         qfzd6w+A80Csmc/USuot3YEPvhEuFcmkuhXoDNqzZRpSzRHFXSVxrXCOqHHn9v7x9L7q
         y7NDPUzIfrI0ocjRupB5Wv5g5tbUI173pCAvS92uThs4OTEyYZvjwfuXUv+gqGRUqDNm
         HCnA==
X-Forwarded-Encrypted: i=1; AJvYcCXdP9LnltxT+P1EUdYCKtsxQt+EDVFWljAHAfAATLdBWHAmUQkcCIN2yNWxZN2LFRnydZCBfjd3rPb9I1PbdpUgoVerp1XZVKLUgC6MD7ux24Y5gWd+RZB8
X-Gm-Message-State: AOJu0YzvkJz8012c8eJgGe4RU4Jh5xHYvV/uGJQKPbv8avzwb+lQXPo7
	1gk5DmxoPvldCLb9SvLWUmrYtjIY9mekJKLlVHqSfftDlFJoHjuNp1d9HTqIotlY85Hq7hfLfjW
	ib2yvJBJyu1x2hsxtkzuaBWnDDZM=
X-Google-Smtp-Source: AGHT+IHzmpGNbLMT8w/NensTlpWDuieULshDwCAx3Xnj64g69XetLCIOGnip/7sus137gD4iUKfUxcTv02p+TpJVwgI=
X-Received: by 2002:a17:90a:8d16:b0:2a2:2b83:149a with SMTP id
 c22-20020a17090a8d1600b002a22b83149amr4280033pjo.2.1712001476224; Mon, 01 Apr
 2024 12:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com> <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
 <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com>
 <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
 <CANNYZj8DCqKE9_ftZTKfj8UY5tnDUnPhETN++3SjeNDT_S4_iA@mail.gmail.com>
 <CA+chaQd5mQv5ciJWbXHG1OdsQ7AW_H8dfVJrNaTV-p7qiqHusw@mail.gmail.com>
 <13c0dc257dd36f6048561a1ce6b2f76e9a04700f.camel@linuxfoundation.org>
 <CAGNsrLBM7DptiF-7t_B5aK=v_uBcYD52Ksp2ebgS44Ny0NvxaA@mail.gmail.com> <20240401190210.GQ6072@denix.org>
In-Reply-To: <20240401190210.GQ6072@denix.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 1 Apr 2024 21:57:44 +0200
Message-ID: <CAApg2=RK=kqfv=GLOr_LW-j=ex8dBvEwCSMQaYjbe8Ogu4ZK7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
To: Denys Dmytriyenko <denis@denix.org>
Cc: Fathi Boudra <fathi.boudra@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa <martin.jansa@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 19:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197850

On Mon, Apr 1, 2024 at 9:02=E2=80=AFPM Denys Dmytriyenko <denis@denix.org> =
wrote:
>
> On Mon, Apr 01, 2024 at 11:42:51AM +0200, Fathi Boudra wrote:
> > On Sat, 30 Mar 2024 at 17:18, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sat, 2024-03-30 at 14:06 +0100, Martin Jansa wrote:
> > > > From what is publicly known it injected malicious code (through m4
> > > > macro using payload hidden in obfuscated compressed test file) into
> > > > built liblzma.so.5 which then hijacks RSA_public_decrypt call e.g. =
in
> > > > sshd (when sshd is built with patch adding systemd notifications
> > > > which brings liblzma dependency to sshd e.g. on debian and ubuntu
> > > > based systems).
> > > >
> > > > The build systems which just built this xz version shouldn't be
> > > > affected (as it won't be using the liblzma.so from the OE build on
> > > > the host).
> > > >
> > > > This publicly known part should be OK for OE, but it's right to be
> > > > worried about the other things which aren't known (not only from
> > > > these guys or from xz project).
> > >
> > > I concur.
> > >
> > > It is worrying but I've kind of been expecting something like this fo=
r
> > > a while unfortunately.
> > >
> > > We need to watch what is going on and act accordingly if/as anything
> > > else becomes known.
> >
> > https://nvd.nist.gov/vuln/detail/CVE-2024-3094
> >
> > Distros have downgraded to older releases, still trying to figure out
> > which version to use.
>
> While 5.4.6 version we've upgraded to in February was not yet compromised=
,
> it was already being taken over by Jia Tan, moving releases to controlled
> subdomain of xz.tukaani.org hosted off of GitHub directly, preparing for =
the
> malicious release of 5.6.0 and 5.6.1. So, we've pointed to GitHub locatio=
n
> accordingly:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D9cc6c809c1540=
19afe3bf6e6d617eab640faa4d0
> https://git.openembedded.org/openembedded-core/commit/?id=3D5be69fc3ff629=
6411c736e5c7c9522d99c0be2c6
>
> But GitHub has suspended the project and associated developer accounts. T=
he
> original maintainer has posted some details on this matter here:
>
> https://tukaani.org/xz-backdoor/
>
> Again, 5.4.6 tarball wasn't compromised, but it is no longer accessible f=
rom
> GitHub - should we revert back to 5.4.5 that was hosted on the original s=
ite?
> Though it should be mirrored...
>

The repository is disabled by GitHub, and the recipe does not work
from this end.
We need to switch to the older mirror and to the last version that was pres=
ent.
There are other parts of the attack coming out each day, so we should
know to which version
we need to revert quite soon.

Regards,
Marta

