Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B65CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:56:51 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.16997.1757509009902074758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 05:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWnsQbHL;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32dc6616f7dso313756a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757509009; x=1758113809; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/UVsju/5zYvk4otEukqPhRZs7YI6uYRHFlxT6iK3VI=;
        b=cWnsQbHLSm9nkdXaG1JfF5VWqT5DIrk3uYgP3Hl/t0zmmjGGs4ImgRfswTDw5DtoLf
         cznstehGmeBanD8IjgA5vqdxTtWpCsJfFRP0sJ87UKcVIRUrMM2qGNnpEjKBHMC5TU0B
         jVgC5pnQDGD0UMCEySSlVw7z7jvtR5+lP3M/fcE/nkq+Zys1jp+cNXxVwzRy8+egQSp9
         yAt7AhVzKkYmo8vc6lLp8Htw4QmotuZLV1HrA6nqBQ3eefj4wwJomKu0VMBve8waUTVS
         sESzrQHCX8ZKyAQR5sHDzfLkuLWmFVi0WywW5eyPDWgo7a1hFtQO1n+aeDr0bsNo0gH4
         1Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509009; x=1758113809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/UVsju/5zYvk4otEukqPhRZs7YI6uYRHFlxT6iK3VI=;
        b=kV5O30NafywIaF69uXPuy1bAaNHtPwR7LL2npWGLwul590cyRg6vJuDXJ8/4yuD7xB
         mkvc3UBG6ZBCs33EfFoiz4QgtniYwSMMxNBZPZvdtFj4C012Bs/z8sqt8g54ZHclPLm2
         GBC+qmgEdvBpjESr2Fx/AOEts9Az2j6MF+loaaf9sB0T8NM7OhkxvCcLLHA6SZqLh103
         HP0J80v+vD0qKOAhhgPzIETa+Wgoi7k+G81CySLOEaQdp1KjlVt/B1wemzOoApZgwlC5
         9OzpCKO6JTEC2md0gj0WYzV/vyrm8wbGvrKVx0pkZ/n65w7CG4zi4pBM47tV66g+EYDX
         CqfQ==
X-Gm-Message-State: AOJu0Yw5EXBijgz9t4agJbpWRBR3jxwv2ycycgFIn8GZehergk4JfZRW
	jJko66dObZPNZFBInBzBXu1eL8IqRJW5MjYFBj/rWyC8bBp0Fnh1gJ/h9tlWNtLUKqlT8OgZkNs
	BsQ8nfqQcvHlW2S7ZqtgUOZ1cNMqsTPM=
X-Gm-Gg: ASbGncsybY3y4CoTwRTVNZQgAhKynI5aWeEgIaMDy6m1+rD5kzQ3CL7+FpGklV2EJdg
	NrQ+52lBY2UQjbJAkXrE8zz2fDxGOmaxSwdUmS3dyzadmQG110NWaFI/L6tN/f3HxQhW/NFPcBT
	xOb9kguoJlSYZrFe+nol6cEwvnxgCQ3c3KH6BdQzGQQzxPROYT52tvTN95pZ5c4ZoObCjgL95K+
	seUv+FTzEK2LMOAhSeChxv38blyeIUNzWH0ieQBZlVDfV9WIQ8=
X-Google-Smtp-Source: AGHT+IFO0xgsixfKV7FFHBcFgWJhgTHRemJlgTTqUH2y1PJPFzMcoBYfFBBcJsU69ewi64cTUo6DuBYj0e9qyaTsTLM=
X-Received: by 2002:a17:90b:2d06:b0:32d:7093:7f6b with SMTP id
 98e67ed59e1d1-32d7093808fmr16135447a91.30.1757509008918; Wed, 10 Sep 2025
 05:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com> <c2e11f23330c22a09a7e98a789aa2b26bd260ad0.camel@linuxfoundation.org>
In-Reply-To: <c2e11f23330c22a09a7e98a789aa2b26bd260ad0.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Sep 2025 08:56:36 -0400
X-Gm-Features: Ac12FXxuJ_ykInTJvCt7CQ3sSDInj1BnZoWkoA9ljoZq9KcHVg_JcMyr-7s85pg
Message-ID: <CADkTA4MMdRyBmWAn06Y+9UfpApwUwx1sy3foE-5Z63yjJA4DOA@mail.gmail.com>
Subject: Re: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	mikko.rapeli@linaro.org
Content-Type: multipart/alternative; boundary="0000000000002a9c7b063e71f4c2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 12:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223207

--0000000000002a9c7b063e71f4c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 7:16=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2025-09-10 at 01:08 -0400, bruce.ashfield@gmail.com wrote:
> > These should cover the first set of warnings / issues that were
> > seen with the 6.16 reference kernel.
> >
> > The first fixes vboxguestdrivers in meta-oe
> >
> > The second is the qemux86 configuration warning fixup
> >
> > The third is to get genericarm64 building and uses the changes sent
> > by Mikko.
>
> Thanks!
>
> I don't know if I missed a patch or something else went wrong but the
> number of warnings went up. The ones I spotted are:
>
> qemuarm:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2386
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2343
> qemuarmv5
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2343q=
emuarmv5>
> :
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2207
> qemuriscv64
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2207q=
emuriscv64>
> :
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/449
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/468
> qemux86
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/468qe=
mux86>
> + poky-tiny:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/2384
>
> Also warnings in other layers:
> meta-agl-core:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2209
> meta-arm
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2209m=
eta-arm>
> :
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2245
>
> and meta-virt which I suspect you know about.
>

Yup for meta-virt.

Something must be missing, everything is warning free here.

Is your queue on master-next ?

Bruce


> The build failures are resolved though, so progress, thanks!
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002a9c7b063e71f4c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 10, 2025 at 7:16=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-09-10 at 01:08 -04=
00, <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a> wrote:<br>
&gt; These should cover the first set of warnings / issues that were<br>
&gt; seen with the 6.16 reference kernel.<br>
&gt; <br>
&gt; The first fixes vboxguestdrivers in meta-oe<br>
&gt; <br>
&gt; The second is the qemux86 configuration warning fixup<br>
&gt; <br>
&gt; The third is to get genericarm64 building and uses the changes sent<br=
>
&gt; by Mikko.<br>
<br>
Thanks!<br>
<br>
I don&#39;t know if I missed a patch or something else went wrong but the<b=
r>
number of warnings went up. The ones I spotted are:<br>
<br>
qemuarm:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/buil=
ds/2386" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/16/builds/2386</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/buil=
ds/2343qemuarmv5" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/40/builds/2343<br>
qemuarmv5</a>:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/buil=
ds/2207qemuriscv64" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/80/builds/2207<br>
qemuriscv64</a>:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/buil=
ds/449" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/45/builds/449</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/468qemux86" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoc=
toproject.org/valkyrie/#/builders/56/builds/468<br>
qemux86</a> + poky-tiny:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/buil=
ds/2384" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/50/builds/2384</a><br>
<br>
Also warnings in other layers:<br>
meta-agl-core:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/buil=
ds/2209meta-arm" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/valkyrie/#/builders/55/builds/2209<br>
meta-arm</a>:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/buil=
ds/2245" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/75/builds/2245</a><br>
<br>
and meta-virt which I suspect you know about.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">Yup for meta-=
virt.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Something must be m=
issing, everything is warning free here.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Is your queue on master-next ?=C2=A0</div><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Bruce</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
The build failures are resolved though, so progress, thanks!<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000002a9c7b063e71f4c2--

