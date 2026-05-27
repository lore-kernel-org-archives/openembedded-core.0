Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA59CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:55:37 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18520.1779882092456803888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SoOm7yT3;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39378db197aso117445651fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779882090; cv=none;
        d=google.com; s=arc-20240605;
        b=EGJQBsnsSsq630vzVfEOQwTcv3DHXTXMbdIOgzxeYVWFaWfnONsQ3QwFAGDOoFjU40
         v8lyYbvpmmWNBXOc2/ggyES99xmspCeFLn9H3fg+0yp6xooNbhI5PapZJKsTxA2MidB1
         geBTL6MTvNVu0i8H0JWRRuhRvrSrJiYAoxvtWch6LhsFAZTK2xrHm5WVbcL44dtCMy8P
         goBCcCcelGhQ1HM8KJFuB+bDJKuN0E+AClmEqm15XZcqpHfiCk2030vP9Fiu53wUkGmH
         o++RwnVdk9HnrM/X772T7Z8j70M532zwQIC9u+QrtSvF2c3/Y/sGnt/bLxvDqNaFnVa2
         SLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WzE7RKYOcHcPOoq1D6/fVOpxrWUGgJ6+z0JAyBPM3Vk=;
        fh=B6vtDpNTi4XOGWGC9Kq5d9W1AUmYn1kAF47SU3Mvhxo=;
        b=Jjyqx0ip0ilAJD2UU7/chpFb7Ncx+vA+iPqRrs8SDkNnzvUnBY1uIvyheu6F+60fb9
         ruya5V44PP/gUx3UfKRwoAB1R2Ph31IbMEJkT+EeeMkeUNzn1SM0cQ0qod2OgZ5SC8Wq
         ipq+d4x51rNmUp4ECTP2H1vY+TdyhKHEtKehtLo3SECj0/nDL8RjRyFOGBYv6xACP4Cx
         m8NsSUcPDyvxeZpqq6F/UxwPfYqiaoAoMVjz7CDxtIBLtJq+k8KKrmlDvW0mqtArXGtj
         v6KYmXiTlIz53mnvnQ6vcMK/XiY5jggtoK9vVNF7WNRRvfzqgvoNq8cqi2ATQ2bR6CBJ
         F4Pg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882090; x=1780486890; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzE7RKYOcHcPOoq1D6/fVOpxrWUGgJ6+z0JAyBPM3Vk=;
        b=SoOm7yT3cXuFUc9YvfJr9MEnHR79H2JG2nXh+eJF4Lgl+B/mJnWO9qvv9t8Jvpy1+W
         As5pW24pE4+HZjvAOJyfn1uZMifiIfbKvzZAuU1DE3FMUMoLWjrebF5fovP2m7dftWKE
         SyxtNy4n5jPOSgFBYRuPIcMG5Y5uozRgonQEl7ekijLR/wDvqetMgrpj+yUJBM1/3O6b
         vCOIXmwF6NvbTUwnzm6lU4nMupB7HGQFrIQtpdbwMVpohQEbaJ+PbHvs49xi51F/jwJZ
         JzXyqJvh6YP/Akoitcz7KgoLeFjomUTS2sNn3Dupb7BdbpVsKMemkRmizttM9DDDRiyK
         pyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882090; x=1780486890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzE7RKYOcHcPOoq1D6/fVOpxrWUGgJ6+z0JAyBPM3Vk=;
        b=l3eEw/DHBB3xWDP2aQEa5tFvNPoH49GN5IH4PaOcDTLZqrKLzKwyQhgiPhd9bJSNBn
         zSKWbhq1aXAy53tu9HoTUF5JfgAAVza5Z1mr0pUhpyvzChfZJvIJhsq/K8PXEKYKorH/
         dmmiL2A+2Ek83Z8/0HKJ/S50HJRG3wHbv1oR8BOLdIdkhdb+8qAURr6chRFXXoamXmxv
         nhro9pbGmF4JOd+U99C3/TE1fVaBLFqB5H10lavA7oSi3Qyzz+NynTryFkhXg8PjpdrL
         i9XtdLZT83cSCinaxPisnH/+i4s6qzkiwCdaxzq80jBhnJMddzLOmRyBCqtUHvdcz84L
         6bKg==
X-Gm-Message-State: AOJu0YyintApyp39J4KM/44RBIPRH1R8DiJIUXY9durqTrrTgg/E+pGt
	y3T49KpEclrT4N+aqBG1kk31tWhDOL7zNJKbS98rOwqXw4uyyoo1hwc8JA571JAccje4MDnr/NV
	XedSr25wRuiL/OkugDNOS0JQOwBeEHaI=
X-Gm-Gg: Acq92OHriBdagEauCnIUK0ye7vGWxnSW/7KwrI/hpC5mTlv4326VN62nJhrLIWVaOwU
	ISZkSzAOSwRhBzn996CV8jhHRS9TgnPqg9MsIsTlwYIxa4zk+k+FEJHnEvHAD0ZY0FKTOnETSOq
	Lk7Iq1rRWPR4WG/1+U/XtM6nCAreN2xbdUZeoX0+skkoCjTcHcMVYVf/ff5OaeerEcHPPfTWgLy
	EWCdX6pEKqxYpckysC8NTPRKp5LXOnNqO/pCitA0FgWmdChG6RfENj7nUFwmSidstfc09w5Ryb8
	zabI26JAu1rZBoqFmy6SbdG2PeEKJy0WSj2pqAS0aPL/3+U5Unm3
X-Received: by 2002:a05:651c:1512:b0:395:724d:6e34 with SMTP id
 38308e7fff4ca-395d8d11439mr75013581fa.26.1779882090101; Wed, 27 May 2026
 04:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com> <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
In-Reply-To: <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Wed, 27 May 2026 17:11:17 +0530
X-Gm-Features: AVHnY4LIRdDIfFgEziSXAfbrgf-nJOoyQpN1_Hl2NGrsfYsjCN_Q0NGv2qlqaWI
Message-ID: <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000b901550652cb173b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237658

--000000000000b901550652cb173b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the response.

I have already contacted the gawk upstream maintainer regarding this issue.

The discussion is currently happening via email with Arnold Robbins (gawk
maintainer).

Since the mailing list thread is not yet publicly archived, I'm sharing a
summary of the interaction so far:

- I initially submitted the patch, but it did not apply cleanly as it was
sent manually.

Arnold indicated that the patch failed to apply and requested the full
updated
randtest.sh file instead.

I have since shared the complete updated randtest.sh file with him for
review.

At this point, I am waiting for his feedback on the proposed fix. Once I
receive a response or the patch is accepted (or revised), I will follow up
accordingly and share the upstream link when available.

Please let me know if you would prefer that I proceed with a temporary
Yocto-side workaround (such as skipping the test) while the upstream
resolution is pending.

Thanks,
Aditya

On Wed, May 27, 2026, 3:43=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Wed, 27 May 2026 at 07:48, Aditya G.S <adityags2004@gmail.com> wrote:
> > Thanks for your feedback.
> >
> > Originally, this patch was created on the Yocto side to handle
> intermittent failures in randtest.sh by skipping the test. However, when =
I
> submitted it via Bugzilla, I was advised to also engage with the gawk
> upstream maintainers since the root cause lies within the gawk test itsel=
f.
> >
> > Based on upstream feedback, instead of masking the issue in Yocto (by
> skipping the test), I reworked the approach and created a patch for gawk'=
s
> randtest.sh to address the underlying problem (unstable sigma leading to
> false failures). The idea is that if this fix is accepted upstream, it
> would resolve the issue globally, including for Yocto, without needing a
> workaround.
> >
> > Following that, Bugzilla suggested sharing the updated gawk-side
> solution here as well for visibility and review.
> >
> > If the upstream fix is not accepted or takes time to land, I can provid=
e
> the original Yocto-specific patch (which skips the test) as a fallback
> solution.
> >
> > Please let me know how you would prefer to proceed.
>
> I'd like to see the upstream submission and upstream reaction (if any)
> first, can you please provide a link to that?
>
> Alex
>

--000000000000b901550652cb173b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the response.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
have already contacted the gawk upstream maintainer regarding this issue.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">The discussion is current=
ly happening via email with Arnold Robbins (gawk maintainer).</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Since the mailing list thread is not =
yet publicly archived, I&#39;m sharing a summary of the interaction so far:=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">- I initially submitted=
 the patch, but it did not apply cleanly as it was sent manually.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Arnold indicated that the patch f=
ailed to apply and requested the full updated</div><div dir=3D"auto">randte=
st.sh file instead.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I ha=
ve since shared the complete updated randtest.sh file with him for review.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">At this point, I am wait=
ing for his feedback on the proposed fix. Once I receive a response or the =
patch is accepted (or revised), I will follow up accordingly and share the =
upstream link when available.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Please let me know if you would prefer that I proceed with a temporar=
y Yocto-side workaround (such as skipping the test) while the upstream reso=
lution is pending.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank=
s,=C2=A0</div><div dir=3D"auto">Aditya</div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, M=
ay 27, 2026, 3:43=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Wed, 27 May 2026 at 07:48, Adity=
a G.S &lt;<a href=3D"mailto:adityags2004@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">adityags2004@gmail.com</a>&gt; wrote:<br>
&gt; Thanks for your feedback.<br>
&gt;<br>
&gt; Originally, this patch was created on the Yocto side to handle intermi=
ttent failures in randtest.sh by skipping the test. However, when I submitt=
ed it via Bugzilla, I was advised to also engage with the gawk upstream mai=
ntainers since the root cause lies within the gawk test itself.<br>
&gt;<br>
&gt; Based on upstream feedback, instead of masking the issue in Yocto (by =
skipping the test), I reworked the approach and created a patch for gawk&#3=
9;s randtest.sh to address the underlying problem (unstable sigma leading t=
o false failures). The idea is that if this fix is accepted upstream, it wo=
uld resolve the issue globally, including for Yocto, without needing a work=
around.<br>
&gt;<br>
&gt; Following that, Bugzilla suggested sharing the updated gawk-side solut=
ion here as well for visibility and review.<br>
&gt;<br>
&gt; If the upstream fix is not accepted or takes time to land, I can provi=
de the original Yocto-specific patch (which skips the test) as a fallback s=
olution.<br>
&gt;<br>
&gt; Please let me know how you would prefer to proceed.<br>
<br>
I&#39;d like to see the upstream submission and upstream reaction (if any)<=
br>
first, can you please provide a link to that?<br>
<br>
Alex<br>
</blockquote></div>

--000000000000b901550652cb173b--

