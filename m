Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C6CD0C5F8
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:39:37 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.8367.1729849167033984221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P8+W+l1G;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so19958631fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729849165; x=1730453965; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vjs8GwJCZu/Iqr4nHrkuk8ZTffRHf+c53zxsCoxHf58=;
        b=P8+W+l1Gt/e1JGIlgFPAM7ftFM5A4AJZks5C/aANu0uqdCePVtTXF/MB4h2DlY4vCO
         P8QoxIsgB4gfk/Sj7GCxRqdYq8DHoa7HCrPqKI74+vmEZ61FOoGjZnpFVNSSh1pvl3gs
         j4yepjuFVISrPMMJSbZrJQ9t7rpJbstO5nAeifJkryZwyvyI33on4o+gImaCYjeyuxBt
         bdIz5hIbucmg4zE95EDI3BM/CUK6XH9IMhdtNrsp1/UpMwPQmsmzW2oTC4SuC3FRgRvX
         FrfiojzA17/Q16CTRBuzA9u/E0347zYogIC9RpTa5zaPUjJsc1FwBwgLBIuRaypEPy+o
         j88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849165; x=1730453965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjs8GwJCZu/Iqr4nHrkuk8ZTffRHf+c53zxsCoxHf58=;
        b=sbXiDJBiOOrvPy52CY4DyvigdCsRibNKW0dn4m8Gsb8sTMqQwqb5/ccjxlEErHLio6
         qHJ80KXSUYxN1dDn78nPmrP24qptapiyuAvFlHRIcEL/EMDDH17qQcu1/RuhxVDyzYpM
         XPE6/v0fbsuH08ImdVIwa8/a5Aeixlx2uFHB8rosEOYUs2fMbOODrDvNR1kJyv3ov149
         5Kr//Dq5bBpVW193rJW81CXw7MEMv6j/soxJp0B2PPD4L/c5vsJ3xn4Ic47c+rtS/Lt7
         kWTGvOoRiKbRl1z3aa1FGhfbIcHv7+v63IVOiVZrnbzxRAuKc+1iN4Wr80P11DVvsmRQ
         XZEw==
X-Gm-Message-State: AOJu0Yw8qHFowRAzNxpkEOehP+vt0ryzz/pjqmSi3yEkg1bXn4waGZfa
	mfKPp4pnNYapAsAqmq8/XIe+UBOQ0YFRwRMVevTZWsxs/sOdj6xR/3vxaq2eiKwjdK/fy52oH9O
	LhvIyJoQ/AmsBvk04DXqXaAnPj70=
X-Google-Smtp-Source: AGHT+IHY1f/yg0ArXcklt6uG2HtC+W/dfVSsN7dawLfgW5jJO32QTfkns+ka18PVZbVmUAd7KWTb3DTvcehs2fL4Ea8=
X-Received: by 2002:a2e:4601:0:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fc9d3840admr38057241fa.38.1729849164932; Fri, 25 Oct 2024
 02:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241025091614.2034294-1-fathi.boudra@linaro.org>
 <CANNYZj_pSeCcgMhT_d9R6tNvmgeT4HgHnEc4jcnPCn-BD2Osjw@mail.gmail.com> <CAGNsrLADeWVjHWOodpJPyRV3iFXdf-poP6SggHLz1gi7MtW+1g@mail.gmail.com>
In-Reply-To: <CAGNsrLADeWVjHWOodpJPyRV3iFXdf-poP6SggHLz1gi7MtW+1g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Oct 2024 11:39:14 +0200
Message-ID: <CANNYZj91CEf0V8=TybkQBKpFZjUkdVuUgZX+FuVOFNvu0dTpvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libksba: add bison (yacc) dependency
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fdaff3062549e46d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206347

--000000000000fdaff3062549e46d
Content-Type: text/plain; charset="UTF-8"

Can you check this with plain poky master? It should build there even
without this change.

Alex

On Fri 25. Oct 2024 at 11.36, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> On Fri, 25 Oct 2024 at 11:20, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Why is this not a build error?
>
> I haven't investigated yet why it isn't  triggered on the YP autobuilder.
> It's triggered on my Scarthgap based build, and by looking at libksba
> configure, it needs yacc.
>
> Adding the build dependency locally fixed the build issue.
>
> We can see in do_configure log we run autoreconf and get:
>
> [...]
> checking for bison... no
> checking for byacc... no
> checking if bison is the parser generator... no
> [...]
> ***
> *** Note: The installed yacc version is not GNU Bison.  You need
> *** to install Bison if you want to change any grammar (.y) file.
> ***
> [...]
>
> > Alex
>

--000000000000fdaff3062549e46d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you check this with plain poky master? It should buil=
d there even without this change.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri 25. Oct 2024 at 11.36, Fathi Boudra &lt;<a href=
=3D"mailto:fathi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">On Fri, 25 Oct 2024 at 11:20, Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Why is this not a build error?<br>
<br>
I haven&#39;t investigated yet why it isn&#39;t=C2=A0 triggered on the YP a=
utobuilder.<br>
It&#39;s triggered on my Scarthgap based build, and by looking at libksba<b=
r>
configure, it needs yacc.<br>
<br>
Adding the build dependency locally fixed the build issue.<br>
<br>
We can see in do_configure log we run autoreconf and get:<br>
<br>
[...]<br>
checking for bison... no<br>
checking for byacc... no<br>
checking if bison is the parser generator... no<br>
[...]<br>
***<br>
*** Note: The installed yacc version is not GNU Bison.=C2=A0 You need<br>
*** to install Bison if you want to change any grammar (.y) file.<br>
***<br>
[...]<br>
<br>
&gt; Alex<br>
</blockquote></div></div>

--000000000000fdaff3062549e46d--

