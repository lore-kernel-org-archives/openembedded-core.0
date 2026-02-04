Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC769E9D3E2
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:11:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21150.1770214258458126783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=anlDsgl4;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so6549558a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770214258; cv=none;
        d=google.com; s=arc-20240605;
        b=IOamzy9wazVcpGLDLMLEdEJxZD4VpD7ymVsfEPw1Rp6bvepsKnvyXe+fd/tgiMDkVi
         0nRRsM+4MlMyGVi91gr2bALEPpX9uzYeEGrcre6zx7cYmzxeUOjfOqAbAx2PnJaXBRCV
         M9whrFjqC7zP3dJN0uNwsy4CRqOH3XQMgw2chCeZohzYlhjIugWlQyOICMUG+dt52pVL
         hpxaIL+leo+aXRbnxzNkjXnpHOIvXl3evvceaznzd9Ur5rdlsgst5u21+6JwUaxUgtBG
         eSFSw92o74ejHeJezJ1ZqLRmzyiKnNJgIGj4hJMtzj+ywP7wmbjDt5Uy4tJJoopZbcgQ
         hcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XGW/VQs2umJ8lFS/+37h6rnU8GL20LCDnTGGzzJ+2cA=;
        fh=hvv70ks7pV6T5f5QOagYGX1AjIjHR4pDW8JxMq+nO5I=;
        b=Gtq/zVmRej/aS1E/eCshtRxb5r9Fc6TpyPQQAP6hESQd/vS5kes/4lr13lBobMWEog
         j+wFDBHjR59/mxptfMV8xxh9a2ISY8Rjrx0qapE50OoVT4Kx700ONQllfyTs8l5aLU7I
         7fz/dSDORHtDhagf0aNMA43nnrATdgdjDTtg+xRNT11OdXFfqYHI/uvbUddxspfSw31R
         kmo11cXDWlQhlutJIk/sUHxdx0sqoNqbjhfaID6DKJCl5fsRCD28kC273M0/2+tfSwmT
         dPPqoZvNWVmOcwK7OrYeQu4qa1PQvP+uAn4fNRsPTzcgMLQWyqcIsldLUXJxPR1rMnk2
         KUmw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770214258; x=1770819058; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGW/VQs2umJ8lFS/+37h6rnU8GL20LCDnTGGzzJ+2cA=;
        b=anlDsgl4tC/7JeXjtR7DT+ViUq8BvLIVoiVwCnYky9D201ECN59trS/p/Gql8SL9Dg
         pK+tQC+j30qVbLuLO4oZLAAD2gW/0EOE3OoHY82fPr9uza3Ov2/ZIhKGPJX4EgkAzKKN
         rMae0VoHn1BhPEuivX0EAdDkALkeU6T69IDhgTMOue2WnvP1o6EWoALHtefEqQhG1lum
         OggcAGEN/8BTwPEukbOjQcT29y8Bty7jai3mBF5jAWDbwRpCi3YvyEzbLKTH1Q0tmfp5
         G9uaahTMItmkFRKJAoijtsCrqm7DRmmRAN1tEGHRGk4cFWSlR7GMlTlUc7HECxb9AsMR
         U+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770214258; x=1770819058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGW/VQs2umJ8lFS/+37h6rnU8GL20LCDnTGGzzJ+2cA=;
        b=eqwIP7pdYFdBwcQ6yUf0pIq7fozMzU/bVcedA71bmtdSC5TwBRIysMi+cEoyzEFDk/
         +eFFw5saQ0qIPYVaeBH/n03fPsfbcsjVVhOYBNklzritPDZTsSx3Q9irDXPEFF98N3Cq
         VDLtqFXX8ZawPCvYILdqSOYg7hQEiB9aCf3HiZXqELPNOlaP2lLFT+ELEV4LCW5V5H66
         IoIimhqnILRs61G1wQGaupr7TLHR+bfZFID28cTWMWWmOgs71RHyIKdFLU8DqKXkxKn7
         /OnkMpuEMWkWe+eSDU9H9ounIAyKgqOkTMDTukdFO41S3/HDUBzpM14RXBSAfID4oWb3
         SS4w==
X-Forwarded-Encrypted: i=1; AJvYcCV/IsX5DCb/XW+g2G3B2X2JDejV2cJ0tWq7WtwhTF08Jb5U0tDIrFskN4oQCXk+g+1eNojzNRkzkr025TxxvoEyiA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcQsp5DKSonEN16LGS5UkDY8KdtsdrB0t0gJ0IRRJIxPQu0LG2
	CHg51k4xViUYtIV9NimL+dY/MBRvr/3l3/CNaKVtmxk/8ME4ql3h+AsZdPS4XyxKTRPNze0JV/6
	rgv4uqAQszuUHngMGuKGyrHzp2lnEEhs=
X-Gm-Gg: AZuq6aKwQjeTxMhDgiW4YGVbNrH+w7or/Hb88mbMZegf+jzdncErj+d0PV0AVfrsGIR
	Zeg13+tjricl2Be6oLgeaIDxnIC5OEaysvE0MsUTKBdyK83Cn2VvLPuhQsv8InJHPqDy+/R8w84
	U7V15vF/lvBGvjDTiR1BxcSBgf56kWHnq5I7UDghdyd5LHYOJV3I5U5B23Yjk//BT6YdBMh4ba8
	ztkjHlXIcBAMmsrzZjVvGy/AR0lzFrPPJDQcOoefoYxqA2H8/9lxi33dsWTa+H8/NkPp62mF03H
	FdzfxgSuc+lHgAydJmZX5clNpe3/
X-Received: by 2002:a17:90b:568e:b0:353:883:affc with SMTP id
 98e67ed59e1d1-3548717f0d2mr2888112a91.18.1770214257837; Wed, 04 Feb 2026
 06:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20260204020908.864912-1-kai.kang@windriver.com>
 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com> <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
In-Reply-To: <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 09:10:46 -0500
X-Gm-Features: AZwV_Qie_24JqXc8gVuPj7s7bQUPFPRK90VeQH8fTsWZ-9v-P_x2H89AWVm6Rg0
Message-ID: <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES set
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003cdf3064a002075"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230533

--00000000000003cdf3064a002075
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 9:05=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2026-02-04 at 09:02 -0500, Bruce Ashfield wrote:
> > On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via
> lists.openembedded.org wrote:
> > > > On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via lists.openembed=
ded.org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> > > > > From: Kai Kang <kai.kang@windriver.com>
> > > > >
> > > > > Check whether kernel config CONFIG_MODULES set or not before
> do_compile
> > > > > and do_install in module.bbclass. If not set, it cannot build and
> > > > > install external modules.
> > > > >
> > > >
> > > >
> > > > This isn't the place to do that check.
> > > >
> > > > If modules are disabled get modules_do_compile out of the tasks.
> > >
> > > Does it make sense to have something including module.bbclass which
> > > doesn't have CONFIG_MODULES set?
> >
> > Yes, that's what I'm trying to say.
> >
> > Don't even include it if you can't build modules. That puts
> > the conditional in a single place, and keeps the code cleaner
> > in the class.
>
> I think we're talking cross purposes a bit.
>
> The issue is that if you ever reach do_compile in something using
> module.bbclass which does not have CONFIG_MODULES set, that is a
> problem and a hard error.
>
> So I'd argue that:
>
> * we only need the check in do_compile
> * it should be a fatal exit hard error, not a warning
>
> which means the patch needs tweaking but not as you're suggesting.
>
>
I don't have a strong opinion, so won't object.

I just don't think adding any conditionals for module support in
moduldes.bbclass makes sense. So one versus two checks
is a wash for me.

Bruce



> I'm not sure skipping the tasks makes sense, I think what we're needing
> is a sanity check for a configuration which stops the build if it ever
> happens.
>
> The rust check would then be similar. Stop and error if the
> configuration would never work/doesn't make sense.
>
> Cheers,
>
> Richard
>
>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000003cdf3064a002075
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 4, 2026 at 9:05=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2026-02-04 at 09:02 -05=
00, Bruce Ashfield wrote:<br>
&gt; On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> wrote:<br>
&gt; &gt; &gt; On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> &lt;kai.kang=3D<a href=3D"mailto:windriver.com@list=
s.openembedded.org" target=3D"_blank">windriver.com@lists.openembedded.org<=
/a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Check whether kernel config CONFIG_MODULES set or not b=
efore do_compile<br>
&gt; &gt; &gt; &gt; and do_install in module.bbclass. If not set, it cannot=
 build and<br>
&gt; &gt; &gt; &gt; install external modules.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This isn&#39;t the place to do that check.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; If modules are disabled get modules_do_compile out of the ta=
sks.<br>
&gt; &gt; <br>
&gt; &gt; Does it make sense to have something including module.bbclass whi=
ch<br>
&gt; &gt; doesn&#39;t have CONFIG_MODULES set?<br>
&gt; <br>
&gt; Yes, that&#39;s what I&#39;m trying to say.<br>
&gt; <br>
&gt; Don&#39;t even include it if you can&#39;t build modules. That puts<br=
>
&gt; the conditional in a single place, and keeps the code cleaner<br>
&gt; in the class.<br>
<br>
I think we&#39;re talking cross purposes a bit.<br>
<br>
The issue is that if you ever reach do_compile in something using<br>
module.bbclass which does not have CONFIG_MODULES set, that is a<br>
problem and a hard error.<br>
<br>
So I&#39;d argue that:<br>
<br>
* we only need the check in do_compile<br>
* it should be a fatal exit hard error, not a warning<br>
<br>
which means the patch needs tweaking but not as you&#39;re suggesting.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I don&#39;t have a strong opinion, so won&#39;t object.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I just don&#39;t think addi=
ng any conditionals for module support in</div><div class=3D"gmail_default"=
 style=3D"font-size:small">moduldes.bbclass makes sense. So one versus two =
checks</div><div class=3D"gmail_default" style=3D"font-size:small">is a was=
h for me.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not sure skipping the tasks makes sense, I think what we&#39;re nee=
ding<br>
is a sanity check for a configuration which stops the build if it ever<br>
happens.<br>
<br>
The rust check would then be similar. Stop and error if the<br>
configuration would never work/doesn&#39;t make sense.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000003cdf3064a002075--

