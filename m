Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EB4C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:51:27 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.10121.1718113884089675424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=grC6hgCN;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f98178ceb3so658565a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718113883; x=1718718683; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6hJZSwuuj8Q8EPkeXL4wi2ahL1hRraylfeHUzwQKOzg=;
        b=grC6hgCNHMuhxYnpJ/HAy/ubonMbVd2Ebog6BPgYd7/i0XIYm5wcIno6I9lgAZwM75
         nbKR4+LRXQLKVnlRbv50QvmjLyf68OJM3hq0jUg7lz8e4OEbUTYLrVHJNZdzDQ4LTIzC
         d5RYrz/udTxH/0VkXmMeTvCjedWXjqk/UDLhheUIltvyE8AaD/CgrVeiMPKONqAFXq+q
         Ehdi14xBNgnvZaMBebTM+5MNO3rnbeUQZvaDPzj/5Noa3hYskU3E8w17LKXaaU/gAUA/
         tEUh0EFYHEqVrDGSVfVssWP4Xf4LxPMuIlDZ9mHTS9pUlTk2hpzqNs5RvIhPpsqVr02p
         Xzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113883; x=1718718683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hJZSwuuj8Q8EPkeXL4wi2ahL1hRraylfeHUzwQKOzg=;
        b=qfX0fgSrGbH6RfU8QgmWN38Pv8K6cIf5SiN7ezezvbAxWbauvpMe/n4WMYIHCTGa+I
         YG1F7JdYIvzy+ZA+JRR6MR1erbIelb5WZtXW1vau/7jF6nwy30TmtvpWRVccqRTIIGEJ
         GIFIaVXc5YskccxCc1C4O1luC/d9PkzA1LPWFSTpCt7QOfkxVA29f4bM/QFC4QqwD3Xl
         yX80dFwbK3libKtqV3iwCGwWIDzQDqPAz2p+435Dhwz0hHpimHg7dhHyYO96ivblFd2U
         DIM27pG4Me3bAyVDmU8y5YN+1hYS1Sy2hg4ToSpDmrt59ZiOkT1clynTKtlfeYDxvwEU
         gbXQ==
X-Gm-Message-State: AOJu0YzhRbH+cF98y+g1PId9aoD0K9Iyc2VLB7HEhVKo1lk2NEb+xOly
	HdSPqNVdrjpnXSVvUZ3X9UVFlN6RJooOqx6UwgJFbsokGmsnfKqzaLNgW5aAZJMX+nst8www9ay
	SEi6lowwYDTGg1A4UcpQWG7DUu3iPyw==
X-Google-Smtp-Source: AGHT+IH8s4nqnS+zn8tEyO9RgyM5eT2dkgV/akxvLvyHUl5EZAdaR4Crxp5lh/yV+WU+wEa8L7rC2ikYg2iLmsxGc5s=
X-Received: by 2002:a05:6870:f684:b0:24f:ef6b:353e with SMTP id
 586e51a60fabf-254647f0819mr13269483fac.36.1718113883015; Tue, 11 Jun 2024
 06:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240611060017.618296-1-raj.khem@gmail.com> <FF8B26CC-CB7E-40B5-A5E8-E4C4519F33D0@arm.com>
In-Reply-To: <FF8B26CC-CB7E-40B5-A5E8-E4C4519F33D0@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2024 06:51:11 -0700
Message-ID: <CAMKF1sohm5vAZYEE++7frTrEmQ-CzT32cVB9-aQYA32pLbojqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: Fix build break with clang on risv64
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ae528d061a9d8fd4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200524

--000000000000ae528d061a9d8fd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 3:49=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 11 Jun 2024, at 07:00, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > +LDFLAGS:append:riscv64:toolchain-clang =3D " -rtlib=3Dcompiler-rt"
>
> Can you add a quick comment explaining what this is for?  Presumably it=
=E2=80=99s
> Yocto-specific as otherwise it would be upstream, so why.


It=E2=80=99s a remnant which is not needed will send v2

>
>
> Ross
>
>

--000000000000ae528d061a9d8fd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 11, 2024 at 3:49=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 11 Jun 2024, at 07:00, Khem Raj via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt; <br>
&gt; +LDFLAGS:append:riscv64:toolchain-clang =3D &quot; -rtlib=3Dcompiler-r=
t&quot;<br>
<br>
Can you add a quick comment explaining what this is for?=C2=A0 Presumably i=
t=E2=80=99s Yocto-specific as otherwise it would be upstream, so why.</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s a remnant=
 which is not needed will send v2</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
Ross<br>
<br>
</blockquote></div></div>

--000000000000ae528d061a9d8fd4--

