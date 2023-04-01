Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7819DC77B60
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:32:27 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.17521.1680341539305138651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TijW8cP3;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id h25so31985680lfv.6
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nIWL7Sc8G6DJ5c4Xzcn4++u9Pw7FY+5pGjCEwXLoSE=;
        b=TijW8cP3MvjAUiY7qSRtpbMegOFU/0Y0dvO32XnrAklVeuxWj9/tj0/pyo+6smiai8
         iLe2P91MGAQiDHHGvAnuFfUKild+Ox5joBxPjofofFn/k9Z6LI1Bv07Vt0iJi99GgyeN
         mKgImQ+vpga1P0rdPpelDiCb4Ua3pNYIdRlP0hujOWKvPzCl4sid6S6UEesKQJxOfVBI
         QC2KC/IXMDgLPBVm0FxEWzNeI0rblikMvNR+l7Ww1sJDaUx/BzR7tz1HP3Ax9ScFnEsb
         /XRQEGwk3BsnkQ4IdtqXa5uHkWhedAc9lbLD5QotY7XZYqoEM1KYPbbmnhZx3riR6SWU
         0Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nIWL7Sc8G6DJ5c4Xzcn4++u9Pw7FY+5pGjCEwXLoSE=;
        b=28OFZ+q0S22/cLjA003ORHpAxXxrM7VdoqoiSYOBYJFfR0Mnjz1YKm2Yy77cnQ4HjE
         I4jBpy+unGlJAib8stL+cT5BBO3Balk7sPTOFRrCSedj2mNyBOWqkhCq0V0gVIH5b1PT
         qvEogAFcDjRHD4Cic8K3yqB5sLfnzeENITGa0GuMjtD+zzqQPASnNJve+FNRZLsQDKQw
         QmKsqHF+LOErjM1qVnirDX+mrkDVWqolf3aEUeBHjVeseO/Wyc5HEje9szIS5gnunPAK
         IT8nnF6offF8cxADppxSefbZ4+gZ/QzTWxfDPWOyIRIevThDnYodf63uHfGugVt7wUOt
         UotA==
X-Gm-Message-State: AAQBX9fS2q1pqPecLgYw+r+/oe72hL4kanpsWrrCGfK6IYbf2/Ml0N20
	baWIR3MKFVALbed+71BRHdb3oqm3//tdS1OsXRc=
X-Google-Smtp-Source: AKy350ZNrmzpVgIB3ZMbqomVF/w98iF+NZid/0m8h+ukH9mXO0A7u1HD0ULmyz8nfe4xCkuc8OvHEpV7kM/fWc0mNg4=
X-Received: by 2002:a05:6512:4c2:b0:4e9:c027:5be6 with SMTP id
 w2-20020a05651204c200b004e9c0275be6mr8986024lfq.12.1680341537104; Sat, 01 Apr
 2023 02:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
 <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
 <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
 <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com> <55024a9677091b2b1d3bc4faac1216e271940272.camel@linuxfoundation.org>
In-Reply-To: <55024a9677091b2b1d3bc4faac1216e271940272.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sat, 1 Apr 2023 11:32:05 +0200
Message-ID: <CA+cAkeqTuHkq+f_dxpVKLf9mJiwExhkc+yyooObA-xxqBR407A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for zvariant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006ba8d605f843005d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179466

--0000000000006ba8d605f843005d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just submit a V7 of this series with EXCLUDE_FROM_WORLD set for zvariant
and
open a dedicated bug for the reproducibility issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090

On Fri, 31 Mar 2023 at 18:34, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-03-31 at 17:01 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > Ok I'll take a look at this next week. But I don't know anything
> > about reproductability build so if you have any info that can point
> > me to the right direction, I'll be glad to read it.
>
> I think the simplest thing is if I add an EXCLUDE_FROM_WORLD to that
> recipe for now but we should file a bug for the reproducibility issue
> and ultimately fix it.
>
> This would let us add the additional testing but aim for improving this
> in due course as well.
>
> Cheers,
>
> Richard
>

--0000000000006ba8d605f843005d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just submit a V7 of this series with EXCLUDE_FROM_WORLD =
set for zvariant and<div>open a dedicated bug for the reproducibility issue=
:=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090=
">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, 31 Mar 2023 at 18:34, Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2023-03-31 =
at 17:01 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:<br>
&gt; Ok I&#39;ll take a look at this next week. But I don&#39;t know anythi=
ng<br>
&gt; about reproductability build so if you have any info that can point<br=
>
&gt; me to the right direction, I&#39;ll be glad to read it.=C2=A0<br>
<br>
I think the simplest thing is if I add an EXCLUDE_FROM_WORLD to that<br>
recipe for now but we should file a bug for the reproducibility issue<br>
and ultimately fix it.<br>
<br>
This would let us add the additional testing but aim for improving this<br>
in due course as well.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000006ba8d605f843005d--

