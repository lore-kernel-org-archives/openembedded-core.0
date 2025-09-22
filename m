Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE49CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:02:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.52927.1758549732256418820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 07:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jUqrd3ZF;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-323266d6f57so4554490a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758549732; x=1759154532; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RglyTAGStAZNGIbHnLxwuc3A+GIuMtDEpagFrjRHHPI=;
        b=jUqrd3ZFfuo4zn6tj/lICulAO0DAuixGogzT3gAjScedPHcwaB+OMgVhbzcWfky+ux
         4NhhWaAK7/1+NJ3MbBNn76HKfAUp8/BUOTkej5ZZmT+sgxUwPLJ1TE3NamYGoEPtsKUv
         PC0YCs6snAgX+QEaEkxjIdkhYK5H6+5qN6DA0ByFqQtfYjoFa/iLg7DOTmiDjWWRF8jT
         yBMnVTAm4br14eDKI5AQPYm5G+3HrJMzhee7RrMK2i14yMLIP4n8zxOLwhAGiENp29Zq
         XnpZDG8ZHO3Ez3HeLlVJBVylto6otn5OJpYd1Kk2qtn3QtyTxCFiOeXKBfa4d4saSM99
         GwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549732; x=1759154532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RglyTAGStAZNGIbHnLxwuc3A+GIuMtDEpagFrjRHHPI=;
        b=tAoNxVkre2WakO0jHwRFN7zP8g21rdInx+uNlSiLJEvy1pViYNxh0M7wn+4BPtzQxx
         qGgedd1gIMv3rRY+2jZTeaTdW+T3h4RYslBn61l4+KpkYh1zPAGBcXPjfNkhs9NKvmK4
         DUrCjqMwxIJ7G1Js4fJtCfRv86Mv6ESar5lZ/4E28gF1q3G6IgF9yoj19mL906K3eRmn
         XuKpdZ1CmrfFk605xgVprc+9teZ6/o5zhDshLASq3RXzB2AgvRvFhBWO2AJFraJgK3L9
         CW8SBvnHWbwyOm0j47djHrAeQrYgWVarmGy295w6n82ZgJ3zab66g0ZVmJ/7XR0HULzv
         nlbg==
X-Forwarded-Encrypted: i=1; AJvYcCUrg5/Bnz8pZWeM1xOZP86mnfWcvauq5LP1GQqFMAnn7lgrfKuGltFQ9NLvxxStGCY8eVbzFTbx2mPBuDSZrJFzug==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxd7N1T35mco0fQ9JO1tMBU4WWK3zHBejJXH4Bb+WlyVGzTcZsW
	vVIREDxQN03dHHBsNcYs2fc/JZITNkmx8INRz5kmkGuwLPJUHzHXuuTrSeGfJCBm9VPKf2oBiG6
	Y8V9H3iHjb5bSRKozG/ZwxWljfdISUqQ=
X-Gm-Gg: ASbGncvga3EoouETUjlM97uXJgv6/d5i5vkXNC9LZYpERYFfNuVa1/04GWK1spQdFL7
	iOQQfMcAQbxjuDuMRgX5rZ8/SZkHYE6CZs0mVei0v8UMGyoz3os0Gy4SODMbfkdYI4A4FnTCIvg
	/V9WSdqzJAy9fCpQIxjvRbcQFnZtaUbT8sFnXPlaKq6313hcUPM4u75ygJ6GScFadyjT6e8T8CM
	ef3KdEqKRhxXgCS89rGwcTw7EScDCKDw3SA4Mc7
X-Google-Smtp-Source: AGHT+IGr93q55TvNRFtnbcnz9/Tqsb+wN+vSW/3lfVQWHkBp6VzCJuZ0mnQ6SirFXfM5wRHW03CpzGKQOxPycBcfzhU=
X-Received: by 2002:a17:90b:3a48:b0:32e:a650:3ed5 with SMTP id
 98e67ed59e1d1-330983817aemr13970429a91.31.1758549729589; Mon, 22 Sep 2025
 07:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1866AF8ECC88AFA1.22280@lists.openembedded.org> <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
 <AS1PR10MB5697EA7DF788318E41839751FD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CADkTA4OFS8WJmggeqTRMwQbifmanQxGxtJos8FEzr_KzMev=aA@mail.gmail.com> <8f537cc82b3a42d0f9d960992926a36eca4ca066.camel@siemens.com>
In-Reply-To: <8f537cc82b3a42d0f9d960992926a36eca4ca066.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Sep 2025 10:01:58 -0400
X-Gm-Features: AS18NWBSQMGKY8dehK_lg3rLkGjNRD79arjxmrCvjyQnYsknmWxD0biEQzlSAqg
Message-ID: <CADkTA4Me2Odonj_zsP9CSRW57_TR+fXEniw2ss7Omf8r1AQ4hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000f3bd92063f644318"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223824

--000000000000f3bd92063f644318
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 9:54=E2=80=AFAM Sverdlin, Alexander <
alexander.sverdlin@siemens.com> wrote:

> Hi all,
>
> On Fri, 2025-09-19 at 09:05 -0400, Bruce Ashfield wrote:
> > > I=E2=80=99ll probably wait until it gets merged to kernel master befo=
re
> submitting to linux-yocto.
> >
> > That's up to you, or I can always go track it down on the upstream
> mailing list.
> > Whatever is easiest on your end.
> >
> > I don't mind taking in-progress patches, as my workflow can handle it
> without
> > much fuss.
>
> it turns out, it has been fixed (by the very same change) already in
> February!
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250218-buildfix=
-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com/
>
> But remained in linux-next until now (and I didn't check that).
> It's 46104a7d3ccd ("kbuild: Add missing $(objtree) prefix to powerpc
> crtsavres.o artifact").
>

Aha!

Thanks for the follow up. I merged the latest -stable last night, so there
will be more bumps
to 6.16 today. (I didn't check if it is only in the latest stable or
somewhere else, but will have
a look later).

Bruce



>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f3bd92063f644318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 22, 2025 at 9:54=
=E2=80=AFAM Sverdlin, Alexander &lt;<a href=3D"mailto:alexander.sverdlin@si=
emens.com">alexander.sverdlin@siemens.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
On Fri, 2025-09-19 at 09:05 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; I=E2=80=99ll probably wait until it gets merged to kernel master =
before submitting to linux-yocto.<br>
&gt; <br>
&gt; That&#39;s up to you, or I can always go track it down on the upstream=
 mailing list.<br>
&gt; Whatever is easiest on your end.<br>
&gt; <br>
&gt; I don&#39;t mind taking in-progress patches, as my workflow can handle=
 it without<br>
&gt; much fuss.<br>
<br>
it turns out, it has been fixed (by the very same change) already in Februa=
ry!<br>
<a href=3D"https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250218=
-buildfix-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com/" rel=3D"noreferrer=
" target=3D"_blank">https://patchwork.ozlabs.org/project/linuxppc-dev/patch=
/20250218-buildfix-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com/</a><br>
<br>
But remained in linux-next until now (and I didn&#39;t check that).<br>
It&#39;s 46104a7d3ccd (&quot;kbuild: Add missing $(objtree) prefix to power=
pc crtsavres.o artifact&quot;).<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Aha!</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Thanks for the follow up. I merged the latest -=
stable last night, so there will be more bumps</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">to 6.16 today. (I didn&#39;t check if it is=
 only in the latest stable or somewhere else, but will have</div><div class=
=3D"gmail_default" style=3D"font-size:small">a look later).</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Alexander Sverdlin<br>
Siemens AG<br>
<a href=3D"http://www.siemens.com" rel=3D"noreferrer" target=3D"_blank">www=
.siemens.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000f3bd92063f644318--

