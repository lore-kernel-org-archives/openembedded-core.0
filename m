Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3604.1610726890707421186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EjalPIe7;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id u19so10114019edx.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sDjuU8E4iH57zRaCY3e6uCkw1Df//qNOtlvhjHLzQiQ=;
        b=EjalPIe71S0v/SJAF3d3ReLvarPRTf8pohHXj7ohmSsJmjJ1VjWONfsLR6U4TsFshG
         KYg+vp3c0zngRSKrN2pKScirB41yftUsOaDCmxZMF9loW0S4azTtqcLj8MabwjqynORk
         GvHTrW32JbD9Sl+nSG5HCd2gixrC/GFjXgamu71gO+ZnhpbT3nTgn0gc5ybOTx2ijmGU
         3oNqt8wIf4g9vN3zZE2GUKThglKI2+rqMhFynTrlk6LbMhElf4K9oqZRh9V2arlkMtet
         3eSY2UX6khFY7Y1e4b6d3vRe1OWUgIADkXHQ8TH1C1d+Xp9wCOCcTahwoLhwbilYs2oZ
         ny4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sDjuU8E4iH57zRaCY3e6uCkw1Df//qNOtlvhjHLzQiQ=;
        b=BF0aIT7c/SJJ5X5kCwItdUsnp6p28lt7NoXOFXxN3soYJRYKEFRvMVhS55tbaRTd/w
         OzbHef4SgQkcABW3HXdd0YcmTzl1cHBibmpqEfT0prAYFd5MJWJA+BmYX0AarMPr6/+o
         cWYSI6XSIMFE/Mzg1IGGQ8ep+dU61KnL8TOFfDbKanHIv0xBL33xrbhq9rTEnzIBocWl
         zW3/FgaHHMSAI/SyGBSG5P6XmPjukDjxS9IPOihvPrXexpyWb0QKiTdjf4QgAcqjxh/z
         w4hcnO7NMMXVjk9iHMhBd6v2BSLKE7zkSkYujRKvSSSA6ETW1WgVmdjAOEQeDGygHkG4
         QkWw==
X-Gm-Message-State: AOAM532IFBdzzjED9TR+Dpf5gp9OxXDtCKlM5mAOP2uu4iIqiEHUz4At
	bIy2z8OLCUUpB9yS/3ZMBC0nHNFi47Ni4FIymAI=
X-Google-Smtp-Source: ABdhPJxMLUiOw79UgXJQEqlgj43Zj5M9Ky/H9Hfmxd511fRSpx/NbWFRNepiInSRIPklUGU9140B07UOuZjFKDgoHIQ=
X-Received: by 2002:a05:6402:4d6:: with SMTP id n22mr10556717edw.27.1610726889211;
 Fri, 15 Jan 2021 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
 <20210115144724.GM16838@windriver.com> <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
In-Reply-To: <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 15 Jan 2021 11:07:57 -0500
Message-ID: <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
To: luca.boccassi@microsoft.com
Cc: "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 10:37 AM Luca Boccassi via
lists.openembedded.org
<luca.boccassi=3Dmicrosoft.com@lists.openembedded.org> wrote:
>
> On Fri, 2021-01-15 at 09:47 -0500, Paul Gortmaker wrote:
> > [Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.=
8] On 15/01/2021 (Fri 09:57) Luca Boccassi wrote:
> >
> > > On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> > > > On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > > > > Recent systemd started using ascii args to "hidepid=3D" mount op=
tions
> > > > > for proc fs - unconditionally -- even though kernels older than =
v5.8
> > > > > emit an error message on each attempt:
> > > > >
> > > > > root@qemux86-64:~# cat /proc/version
> > > > > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc versi=
on 10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > > > > root@qemux86-64:~# dmesg|grep proc:
> > > > > [   29.487995] proc: Bad value for 'hidepid'
> > > > > [   43.170571] proc: Bad value for 'hidepid'
> > > > > [   44.175615] proc: Bad value for 'hidepid'
> > > > > [   46.213300] proc: Bad value for 'hidepid'
> > > > > root@qemux86-64:~#
> > >
> > > Wouldn't it be better to patch the kernel to downgrade that message =
to
> > > debug level?
> >
> > The problem is that the breakage is forced upon older kernels, so you'=
d
> > have to effectively mainline that kind of "fix" to v5.12 (where there =
is
> > no problem) and then you could in theory request it for v5.4 linux-sta=
ble
> > according to "stable rules".
>
> The patch could be downstream for older kernels, just like this one is.
> With the difference that it would be temporary.

But the coverage is impossible, since there are so many
different kernel trees. So a kernel solution is a non-starter.

>
> > Besides, if something with root/mount priv. is consistently trying to
> > drive a square peg into a round hole - by trying to mount something an=
d
> > failing -- it should be something that a sysadmin would want to
> > investigate.  Which is precisely why I am here now.  I think burying i=
t
> > at debug level is counterproductive to that.
>
> Well the real issue is that there's no way to get a clean "we don't
> support this option" out of certain kernel APIs, so one has to guess
> and see what happens. Sometimes it's even worse, and flags like
> NOSYMFOLLOW get silently ignored if they are not supported, which is
> not great for security-related settings...
>
> Anyway, these warnings only appear if ProtectProc and/or ProcSubset are
> set to something other than the default value. Why not simply add a
> top-level drop-in in /etc that forces them to be disabled in all
> services if you have an older kernel? Something like this:
>
> /etc/systemd/system/service.d/10-override-protect-proc.conf
> [Service]
> ProtectProc=3Ddefault
> ProcSubset=3Dall
>
> And then you can drop it when you upgrade your kernel. Isn't this a
> better option than taking on permanent technical debt?

That's even more fiddly than Paul's patch. It relies on much more
of someone's distro configuration.

But it is true that you can throw it away eventually, assuming
someone actually knows that it is there.

I wouldn't call this patch much of a technical debt, but if it starts
gumming up systemd upgrades, it's easy to revisit.

>
> > > > > +The systemd maintainer has dismissed this as something people s=
hould
> > > > > +simply ignore[1] and has no interest in trying to avoid it by
> > > > > +proactively checking the kernel version, so people can safely a=
ssume
> > > > > +that they will never see this version check commit upstream.
> > > > > +
> > > > > +However, as can be seen above, telling people to just ignore it=
 is not
> > > > > +an option, as we'll end up answering the same question and deal=
ing with
> > > > > +the same bug over and over again.
> > > > > +
> > > > > +The commit that triggers this is systemd v247-rc1~378^2~3 -- so=
 any
> > > > > +systemd 247 and above plus kernel v5.7 or older will need this.
> > > > > +
> > > > > +[1] https://nam06.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fissues%2F16896&amp;data=3D04%7C01=
%7CLuca.Boccassi%40microsoft.com%7Ce972c325854743b67f0b08d8b9647bf1%7C72f98=
8bf86f141af91ab2d7cd011db47%7C1%7C0%7C637463188548752517%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3Dr%2FCh5m3ZLautkN1PLg99HqGdfl4VXqiNjJUsJhDPmCI%3D&amp;reser=
ved=3D0
> > > > > +
> > > > > +Upstream-Status: Actively hostile
> > > >
> > > > The status needs to be
> > > >
> > > > Upstream-Status: Denied [Actively hostile
> > > > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2Fsystemd%2Fsystemd%2Fissues%2F16896&amp;data=3D04%7C01%7CLuca=
.Boccassi%40microsoft.com%7Ce972c325854743b67f0b08d8b9647bf1%7C72f988bf86f1=
41af91ab2d7cd011db47%7C1%7C0%7C637463188548752517%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Dr%2FCh5m3ZLautkN1PLg99HqGdfl4VXqiNjJUsJhDPmCI%3D&amp;reserved=3D0=
]
> > > >
> > > > (so our tools have an idea of what status patches are in)
> > >
> > > Paul, please, let's avoid loaded language - Denied is fine by itself
> > > and conveys what it needs to. I understand it can be frustrating whe=
n
> > > upstream maintainers do not agree with user assessments, but the lin=
ked
> > > discussion was polite and professional and there's no need to call i=
t
> > > "hostile".
> >
> > Normally I'd agree with you, but it isn't just this one thread/instanc=
e,
> > but instead *years* of continued "my way or the highway" behaviour
> > demonstrated by systemd on various lists like LKML, for all to see.  I=
n
> > any case, in the interest of not breaking existing tooling, and gettin=
g
> > the fix to our users, I am fine with it being changed to simply be:
> >
> > Upstream-Status: Denied [https://nam06.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fissues%2F16896&amp;=
data=3D04%7C01%7CLuca.Boccassi%40microsoft.com%7Ce972c325854743b67f0b08d8b9=
647bf1%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637463188548752517%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;sdata=3Dr%2FCh5m3ZLautkN1PLg99HqGdfl4VXqiNjJUsJhDPmC=
I%3D&amp;reserved=3D0]
>
> That's not entirely accurate, but let's leave it at that.

I'm with Paul :D

Bruce

>
> --
> Kind regards,
> Luca Boccassi
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
