Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0555EC144C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18360.1772545064983735773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAC/46mq;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-356337f058aso2814901a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 05:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772545064; cv=none;
        d=google.com; s=arc-20240605;
        b=FFkZri2K/rR6RhQHX52u0DubfXaCzleUUM9R+ph1hr/clWll7yv74udl6DcMFRBQQs
         QGg2SVjel5RzsdsIBokcfR/g1edJtvFQqZdKvn4hP2pJ/DgYMsMQWfJSbg9R6YifR92E
         AZ0dI33AYEE9wsqMhcEaf9JwVzGkzY5TLb9Rv06G9xvYLIQlPkP6pIp2ppLfH0j1m325
         0y+LOOgRmV2OEZzg0pJt+zhZLjJEl62Hnp10QMZ5Tzv+BUDddJ5Q2KHAggguUhrc00Uj
         H3J00TySkM/kcreRwaKMH6YudCtXzscmohugeSCGGynVsEESO3HqP1guA6/xsbKGzCwt
         BIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aiuSa3r1730P5mtNRzyUgnGmwI9e8BeTtJYBSev1Y0w=;
        fh=Gf/nbSKMZCJ3hpFyNL7SeL07n6decOLxxUBiwSDfGCo=;
        b=hsmMUxQYl3Sgo2BSx4Qj/TnumW3SQpfB9gUYEcHkLj+2LPTK7pJZellplliKxVUot4
         prjEr4XvIPrrCRGPSLo6semAKhhqopOpjaMNTyOljliL3H+/M1O5BDYpnwn+bAJVSLTk
         eHtvdD9hGQKR12Yn8gXezavXe/LhO/HK6fk1wjYEqaDEdQY+rpi95Wj/MjfcdyDyOmqH
         s0AmOR/1tCtsW2KAPoH+RKrcYgeqcmXhPcD1Fr7+FtuLT/znhEL3vlMpq2x8GTo7CWxy
         tw2jj8tLfFhldHWMsvb2c2yrm6oM0IS69kGJt+SsYdymomycuLf8umbCS+6n705DZar1
         ZJ0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545064; x=1773149864; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aiuSa3r1730P5mtNRzyUgnGmwI9e8BeTtJYBSev1Y0w=;
        b=SAC/46mqkAa0nCzO20QNETxJT22oH7+B4DtlAXO3AIwMvTkwnZ4VxqgTAFDjYHnl0v
         mh+BTpnOOhlYqMrOOKQiyfPFIAQqzn45u/jJQENe5MzoMGhjRsuuq5IhmTgiBZL/eeNt
         Dq5qQ+0f0cRLJahPe2QmHP0AQc+Vks7p1ByIsH3aLHchrB46qjRgg7i3b93dIJhBP2GH
         X24wK7lsbpzqFODogOa3KuO2BeZYveN06XNqDfZOBrcqU0HEPjJh9MdCwhHDQt7EVgLL
         8uk+m0tNhXfiwny6HzpeREHzYLs6MOcasESY7v1CHfp9DxY0E809VTmcgy3RjxqB256w
         VzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545064; x=1773149864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiuSa3r1730P5mtNRzyUgnGmwI9e8BeTtJYBSev1Y0w=;
        b=DxHCTnOWSUtPkAyezupJNnu+7IenFMqJ07PtiR5nicQRMQXZ7O3sNAEiFjVOyT4mOQ
         PCPsCEUkgFYhwXLWRQd8lOplOUdAe/U6of5lElsMJiaRro/KtPN9IbJUwYqxL2H1i6E3
         mB3XM8fkbqtxXuRZPzs4OayF+q2Sw6tFvmGW43JMEEWP3Nq2FdFr08AZAPoG8+UOWnpg
         PVcuC4Pal87sK3+e9MiIFDFWph3Y14AL5KSU6dm89JG1EMS49QTIrH1ea9p8Mv/f9yZ6
         OxqtP3wUegCudfT1d02avR76/knPSVmD8ZP155a2is86MtJpDeKjxG/MzyCn2Dpr9GYF
         f6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzmthK/z1jNKohHQwyTnMXz7SWRmscyNUDK06HCCGINvZ+ESO0poV5Oiy1DjwYk+ctY1SI1o9Z4QhQkdr1BzxdKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZGkLBGagVa5LhQJSShRt0dohLNmDRQ/d4+cFnFd5tyZibydg7
	xgLbdI8lyYmwn6gdWmVTgqnqmR7mpBKZOKy1C7C20UcNSRvm3Mv4A6m/j6O1TRzUhXq72ZC1+JB
	RVHil5Sun0NBTLcTJlQ3jqxHcT3zAhSM=
X-Gm-Gg: ATEYQzzgKv0dszslRxyJiGnT2hoGberTJSZRVQrkncTM+JBDPMb1oJyJfeE76UWtuTN
	tjZI6KhNuXm3B9s58DwYR+fcetNPoEIfJERtQ5IoRp7Oc0EgvIX9SNjh2P8citBuix5pXATgEw0
	dRdRulYOswXHu3pfSwqPHk7+U9AlPS6c94tXAgvKCH+dNjgAzwryVC4+nGP150lWLXE+jhYpd/F
	U5NZPvRPIUTSBgwr3UBGepntpe5RoLHzI6hdzfb0hZlL+XLmT4gNLdaxP8ai3QgKValoyPIOJAR
	cgX+2hB3nV5Af3+F/k0ArLC4EbG//OZP/Px/ykrL
X-Received: by 2002:a17:90b:578d:b0:354:c593:b1a8 with SMTP id
 98e67ed59e1d1-35965c415e2mr13755279a91.13.1772545064250; Tue, 03 Mar 2026
 05:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com> <DGT0JZJJG1TR.2WO974AGZDT6G@bootlin.com>
In-Reply-To: <DGT0JZJJG1TR.2WO974AGZDT6G@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Mar 2026 08:37:31 -0500
X-Gm-Features: AaiRm50wkBQnmOEUR-3guwLuXtFx0AbpIiIkcI8IydBV0CA29vp9pcexhCxDAAI
Message-ID: <CADkTA4MN=Tgi6-qo2Ru=OQ+bjgG=nTH5Us4LB9o-bZ4T=z9yHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/10] linux-yocto: consolidated / combined pull request
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e72ece064c1eceb3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232315

--000000000000e72ece064c1eceb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:44=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Mon Mar 2, 2026 at 5:55 AM CET, Bruce Ashfield via
> lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's the next set of -stable update for 6.18.
> >
> > 7.0 will be the dev kernel shortly, just waiting for -rc2 on it
> > before pushing the changes.
> >
> > Also note that this is again a combined oe-core, yocto-bsp pull
> > request. I've keep the numbering 0-N to hopefully lore/b4 won't
> > miss things.
> >
> > If this doesn't work (the formatting), I'll just go to different
> > sends for the different repos.
> >
> > Bruce
> >
> > openembedded-core (7):
> >   linux-yocto/6.18: update to v6.18.9
> >   linux-yocto/6.18: update CVE exclusions (6.18.9)
> >   linux-yocto/6.18: update to v6.18.11
> >   linux-yocto/6.18: update CVE exclusions (6.18.11)
> >   linux-yocto/6.16: genericarm64: feature splits and enablement
> >   linux-yocto/6.18: update to v6.18.13
> >   linux-yocto/6.18: update CVE exclusions (6.18.13)
> >
> > meta-yocto (3):
> >   yocto-bsp: update to v6.18.9
> >   yocto-bsp: update to v6.18.11
> >   yocto-bsp: update to v6.18.13
> >
> >  openembedded-core:
> >  meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 306
> ++++++++++++++++++++-
> >  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +-
> >  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +-
> >  meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 +-
> >  4 files changed, 313 insertions(+), 29 deletions(-)
> >
> >  meta-yocto:
> >  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Hi Bruce,
>
> Thanks for your patches. Looks fine on the autobuilder, except for a
> single warning on arm64:
>
> WARNING: linux-yocto-6.18.13+git-r0 do_kernel_configcheck: [kernel
> config]: This BSP contains fragments with warnings:
>
> [INFO]: the following symbols were not found in the active configuration:
>      - CONFIG_PINCTRL_SM8350_LPASS_LPI
>

I'll have a look!

Bruce



>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3303
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3277
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e72ece064c1eceb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, 2026 at 3:44=
=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bria=
nd@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Mon Mar 2, 2026 at 5:55=
 AM CET, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Richard,<br>
&gt;<br>
&gt; Here&#39;s the next set of -stable update for 6.18.<br>
&gt;<br>
&gt; 7.0 will be the dev kernel shortly, just waiting for -rc2 on it<br>
&gt; before pushing the changes.<br>
&gt;<br>
&gt; Also note that this is again a combined oe-core, yocto-bsp pull<br>
&gt; request. I&#39;ve keep the numbering 0-N to hopefully lore/b4 won&#39;=
t<br>
&gt; miss things.<br>
&gt;<br>
&gt; If this doesn&#39;t work (the formatting), I&#39;ll just go to differe=
nt<br>
&gt; sends for the different repos.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; openembedded-core (7):<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update to v6.18.9<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update CVE exclusions (6.18.9)<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update to v6.18.11<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update CVE exclusions (6.18.11)<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.16: genericarm64: feature splits and enablem=
ent<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update to v6.18.13<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update CVE exclusions (6.18.13)<br>
&gt;<br>
&gt; meta-yocto (3):<br>
&gt;=C2=A0 =C2=A0yocto-bsp: update to v6.18.9<br>
&gt;=C2=A0 =C2=A0yocto-bsp: update to v6.18.11<br>
&gt;=C2=A0 =C2=A0yocto-bsp: update to v6.18.13<br>
&gt;<br>
&gt;=C2=A0 openembedded-core:<br>
&gt;=C2=A0 meta/recipes-kernel/linux/cve-exclusion_6.18.inc=C2=A0 =C2=A0| 3=
06 ++++++++++++++++++++-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.1=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a> |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 24 +-<br>
&gt;=C2=A0 4 files changed, 313 insertions(+), 29 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 meta-yocto:<br>
&gt;=C2=A0 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
Hi Bruce,<br>
<br>
Thanks for your patches. Looks fine on the autobuilder, except for a<br>
single warning on arm64:<br>
<br>
WARNING: linux-yocto-6.18.13+git-r0 do_kernel_configcheck: [kernel config]:=
 This BSP contains fragments with warnings:<br>
<br>
[INFO]: the following symbols were not found in the active configuration:<b=
r>
=C2=A0 =C2=A0 =C2=A0- CONFIG_PINCTRL_SM8350_LPASS_LPI<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39=
;ll have a look!</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/buil=
ds/3303" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/22/builds/3303</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/buil=
ds/3277" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/60/builds/3277</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e72ece064c1eceb3--

